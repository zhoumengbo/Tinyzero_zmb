#!/bin/bash
# alias python='/home/weiji/anaconda3/envs/zero/bin/python'
# alias python3='/home/weiji/anaconda3/envs/zero/bin/python3'
# alias pip='/home/weiji/anaconda3/envs/zero/bin/pip'

export N_GPUS=4
export CUDA_VISIBLE_DEVICES=0,1,2,3
ray stop --force && ray start --head --include-dashboard=True
export BASE_MODEL="/projects/m000083/model/Qwen2.5-7B"
export DATA_DIR="data/gsm8k"
export ROLLOUT_TP_SIZE=4
export EXPERIMENT_NAME=gsm8k-qwen2.5-7b
export VLLM_ATTENTION_BACKEND=XFORMERS

bash ./scripts/train_ppo.sh