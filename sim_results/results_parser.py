import os
import sys
import re
import numpy as np
from pathlib import Path

extract_kernel_name = "(?<=kernel_name = ).*"
extract_sim_cycles = "(?<=gpu_sim_cycle = ).*"
extract_config = "(?<=./).[^\/]*"
extract_kernel_launch_uid = "(?<=kernel_launch_uid = ).*"
extract_idle_cycles = "(?<=W0_Idle:)[0-9]+"
extract_scoreboard_cycles = "(?<=W0_Scoreboard:)[0-9]+"
extract_cache_accesses = "(?<=L1D_total_cache_accesses = ).*"
extract_cache_misses = "(?<=L1D_total_cache_misses = ).*"
extract_grid_dim = "gridDim= \((\d+),(\d+),(\d+)\)"
extract_block_dim = "blockDim = \((\d+),(\d+),(\d+)\)"

def get_gridDim(line : str) -> tuple[int, int, int]:
    try:
        res = re.search(extract_grid_dim, line)
        x = int(res.group(1))
        y = int(res.group(2))
        z = int(res.group(3))
    except:
        print(f"No gridDim in : {line}")
        exit(0)
    return (x,y,z)

def get_blockDim(line : str) -> tuple[int, int, int]:
    try:
        res = re.search(extract_block_dim, line)
        x = int(res.group(1))
        y = int(res.group(2))
        z = int(res.group(3))
    except:
        print(f"No blockDim in : {line}")
        exit(0)
    return (x,y,z)

        
def get_kernel_name(line : str) -> str:
    try:
        kernel_name = re.search(extract_kernel_name, line).group(0).replace(" ", "")
    except:
        print(f"No kernel name in line : {line}")
        exit(0)
    return kernel_name

def get_kernel_uid(line : str) -> str:
    try:
        kernel_launch_uid = re.search(extract_kernel_launch_uid, line).group(0)
    except:
        print(f"No kernel launch uid in line : {line}")
        exit(0)
    return kernel_launch_uid

def get_gpu_sim_cycle(line : str) -> int:
    try:
        sim_cycles = int(re.search(extract_sim_cycles, line).group(0))
    except:
        print(f"No simulation cycles found in line : {line}")
        exit(0)
    return sim_cycles

def get_config_name(line : str) -> str:
    try:
        config_name = re.search(extract_config, line).group(0)
    except:
        print(f"No config name in line : {line}")
        exit(0)
    return config_name

def get_idle_cycles(line : str) -> int:
    try:
        idle_cycles = int(re.search(extract_idle_cycles, line).group(0))
    except:
        print(f"No idle cycles in line : {line}")
        exit(0)
    return idle_cycles

def get_scoreboard_cycles(line : str) -> int:
    try:
        scoreboard_cycles = int(re.search(extract_scoreboard_cycles, line).group(0))
    except:
        print(f"No scoreboard cycles in line : {line}")
        exit(0)
    return scoreboard_cycles

def get_l1_access_count(line : str) -> int:
    try:
        l1_access_count = int(re.search(extract_cache_accesses, line).group(0))
    except:
        print(f"No l1 access count in line : {line}")
        exit(0)
    return l1_access_count

def get_l1_miss_count(line : str) -> int:
    try:
        l1_miss_count = int(re.search(extract_cache_misses, line).group(0))
    except:
        print(f"No l1 miss count in line : {line}")
        exit(0)
    return l1_miss_count

def extract_exec_times(results : dict, res_folder : str):
    for root, dir, files in os.walk(res_folder):
        for file in files:
            if ".o" in file:
                res_path = os.path.join(root, file)
                res_file = open(res_path)
                config_id = get_config_name(root)
                kernel_name = "N/A"
                kernel_launch_uid = ""
                sim_cycles = 0
                l1_access_count = 0
                l1_total_access_count = 0
                l1_miss_count = 0
                l1_total_miss_count = 0
                data_dir = os.path.basename(Path(res_path).parent.parent)
                discard = False
                gridDim = (0,0,0)
                blockDim = (0,0,0)
                for line in res_file.readlines():
                    if "kernel_name" in line:
                        kernel_name = get_kernel_name(line)
                    if "kernel_launch_uid" in line:
                        kernel_launch_uid = get_kernel_uid(line)
                    if "gpu_sim_cycle" in line:
                        sim_cycles = get_gpu_sim_cycle(line)
                        kernel_unique_name = data_dir + kernel_name + kernel_launch_uid
                    if "L1D_total_cache_accesses" in line:
                        current_l1_access = get_l1_access_count(line)
                        l1_access_count = current_l1_access - l1_total_access_count
                        l1_total_access_count = current_l1_access
                    if "gridDim= (" in line and "blockDim = (" in line:
                        gridDim = get_gridDim(line)
                        blockDim = get_blockDim(line)
                        if (blockDim[0] * blockDim[1] * blockDim[2]) <= 32:
                            discard = True
                        for value in gridDim:
                            if value > 1:
                                print(f"More than one block in kernel {res_file}")
                                exit(0)
                    if "L1D_total_cache_misses" in line:
                        current_l1_miss = get_l1_miss_count(line)
                        l1_miss_count = current_l1_miss - l1_total_miss_count
                        l1_total_miss_count = current_l1_miss
                        # latest line in the kernel res stats
                        # fill results here
                        if not discard:
                            if not kernel_unique_name in results:
                                results[kernel_unique_name] = dict()
                            if config_id in results[kernel_unique_name]:
                                print(f"Found duplicate : {config_id}, {kernel_unique_name}\nfile : {file}")
                                exit(0)
                            results[kernel_unique_name][config_id] = dict()
                            results[kernel_unique_name][config_id]["sim_cycles"] = sim_cycles
                            results[kernel_unique_name][config_id]["cache_access"] = l1_access_count
                            results[kernel_unique_name][config_id]["cache_miss"] = l1_miss_count
                        discard = False
                        
def get_config_names(results : dict):
    config_names = []
    for kernel in results:
        for config_name in results[kernel]:
            if not config_name in config_names:
                config_names.append(config_name)
    return config_names

def clean_results(results : dict):
    config_names = get_config_names(results)
    for kernel in list(results):
        for config_name in config_names:
            if not config_name in results[kernel]:
                del results[kernel]
                break
    return results

def compare_configs(results : dict, config1 : str, config2 : str):
    time_diff = []
    cache_miss_rates = []
    miss_count_comparison = []
    print(f"Comparing : {config1} / {config2}")
    max_diff = 0.0
    max_kernel = ""
    min_diff = 10.0
    min_kernel = ""
    for kernel in results:
        diff = results[kernel][config1]["sim_cycles"] / results[kernel][config2]["sim_cycles"]
        if max_diff < diff:
            max_kernel = kernel
        if min_diff > diff:
            min_kernel = kernel
        max_diff = max(max_diff, diff)
        min_diff = min(min_diff, diff)
        time_diff.append(diff)
        # cache_miss_rates.append(results[kernel][config1]["cache_miss"]/results[kernel][config1]["cache_access"])
        # if (config2 != "1core_no_cache" and
        #     results[kernel][config1]["cache_miss"] > 0 and 
        #     results[kernel][config2]["cache_miss"] > 0):
        #     miss_count_comparison.append(results[kernel][config1]["cache_miss"]/results[kernel][config2]["cache_miss"])
        # # if diff > 1:
        # cache_miss_rates.append(results[kernel][config1]["cache_miss"]/results[kernel][config1]["cache_access"])
    print(f"Mean : {np.mean(time_diff)}")
    print(f"std. dev. : {np.std(time_diff)}")
    print(f"Min : {min_diff} ({min_kernel})")
    print(f"Max : {max_diff} ({max_kernel})")
    # print(f"Mean cache miss rate when above 100% : {np.mean(cache_miss_rates)}")
    # print(f"std dev miss rate : {np.std(cache_miss_rates)}")
    # if miss_count_comparison != []:
    #     print(f"Mean cache miss comparison : {np.mean(miss_count_comparison)}")
    #     print(f"Max cache miss comparison : {max(miss_count_comparison)}")
    #     print(f"Min cache miss comparison : {min(miss_count_comparison)}")
    print("\n")

def get_above_percent(results : dict, config1 : str, config2 : str, threshold : int) -> int:
    count = 0
    for kernel in results:
        diff = results[kernel][config1]["sim_cycles"] / results[kernel][config2]["sim_cycles"]
        if diff >= (threshold / 100):
            count += 1
    print(f"{config1}/{config2} : {count} instances above {threshold}%")
    return count

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print(f"Usage : {sys.argv[0]} results_dir")
        exit(-1)
    results = dict()
    extract_exec_times(results, sys.argv[1])
    cleaned_results = clean_results(results)
    total_kernels = len(cleaned_results)
    print(f"Instances processed : {total_kernels}")
    # get_above_percent(results, "baseline", "1core_dual", 90)
    # get_above_percent(results, "baseline", "1core_dual", 100)
    compare_configs(results, "baseline", "baseline_perf_inst")
    # get_above_percent(results, "baseline", "baseline_perf_inst", 160)
    compare_configs(results, "baseline_perf_inst", "1core_dual")
    # get_above_percent(results, "1core_dual", "1core_single", 100)
    compare_configs(results, "1core_dual", '1core_single')
    # get_above_percent(results, "1core_single", "1core_no_cache", 100)
    compare_configs(results, "1core_single", "1core_no_cache")
    compare_configs(results, "1core_no_cache", "ecrts_1b_200l_lrr")
    # compare_configs(results, "1core_full_coal", "1core_single")
    
     