cat << EOS | perl -pe 's/\n/\x00/' | xargs -0 -n 1 -P 5 -I{} sh -c '{}'
nohup python search_optuna.py --PRED_EXEC_DATE 2021-08-26 -w 0 -n Production_optuna_lgbm_20210917_w0_500_mape > Production_optuna_lgbm_20210917_w0_500_mape.log
nohup python search_optuna.py --PRED_EXEC_DATE 2021-08-26 -w 1 -n Production_optuna_lgbm_20210917_w1_500_mape > Production_optuna_lgbm_20210917_w1_500_mape.log
nohup python search_optuna.py --PRED_EXEC_DATE 2021-08-26 -w 2 -n Production_optuna_lgbm_20210917_w2_500_mape > Production_optuna_lgbm_20210917_w2_500_mape.log
nohup python search_optuna.py --PRED_EXEC_DATE 2021-08-26 -w 3 -n Production_optuna_lgbm_20210917_w3_500_mape > Production_optuna_lgbm_20210917_w3_500_mape.log
nohup python search_optuna.py --PRED_EXEC_DATE 2021-08-26 -w 4 -n Production_optuna_lgbm_20210917_w4_500_mape > Production_optuna_lgbm_20210917_w4_500_mape.log
EOS