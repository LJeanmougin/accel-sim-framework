readarray KernelNames < <(grep kernel_name ./sim_run_11.0/backprop*/4096*/TEST_CFG/*.o*)
readarray GpuSimCycles < <(grep gpu_sim_cycle ./sim_run_11.0/backprop*/4096*/TEST_CFG/*.o*)
readarray GpuSimInsn < <(grep gpu_sim_insn ./sim_run_11.0/backprop*/4096*/TEST_CFG/*.o*)
index=0
echo "################### Bench Results ###################"
for name in "${KernelNames[@]}"
do
    echo -n "|| ${KernelNames[index]}"
    echo -n "|| ${GpuSimCycles[index]}"
    echo "|| ${GpuSimInsn[index]}"
    index=$index+1
done
echo "#####################################################"