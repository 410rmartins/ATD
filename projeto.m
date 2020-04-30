close all
clear all

%% Ex 2 Importar sinais
acc_exp11_user06 = importdata('.\ourData\acc_exp11_user06.txt');
acc_exp12_user06 = importdata('.\ourData\acc_exp12_user06.txt');
acc_exp13_user07 = importdata('.\ourData\acc_exp13_user07.txt');
acc_exp14_user07 = importdata('.\ourData\acc_exp14_user07.txt');
acc_exp15_user08 = importdata('.\ourData\acc_exp15_user08.txt');
acc_exp16_user08 = importdata('.\ourData\acc_exp16_user08.txt');
acc_exp17_user09 = importdata('.\ourData\acc_exp17_user09.txt');
acc_exp18_user09 = importdata('.\ourData\acc_exp18_user09.txt');
acc_exp19_user10 = importdata('.\ourData\acc_exp19_user10.txt');
acc_exp20_user10 = importdata('.\ourData\acc_exp20_user10.txt');

%% Ex3 Representar graficamente os sinais importados 
   
 % obter valores das varias atividades
exp11 = label(11);
exp12 = label(12);
exp13 = label(13);
exp14 = label(14);
exp15 = label(15);
exp16 = label(16);
exp17 = label(17);
exp18 = label(18);
exp19 = label(19);
exp20 = label(20);

    % graficos
graficos('acc-exp11-user06', acc_exp11_user06, exp11)
graficos('acc-exp12-user06', acc_exp12_user06, exp12)
graficos('acc-exp13-user07', acc_exp13_user07, exp13)
graficos('acc-exp14-user07', acc_exp14_user07, exp14)
graficos('acc-exp15-user08', acc_exp15_user08, exp15)
graficos('acc-exp16-user08', acc_exp16_user08, exp16)
graficos('acc-exp17-user09', acc_exp17_user09, exp17)
graficos('acc-exp18-user09', acc_exp18_user09, exp18)
graficos('acc-exp19-user10', acc_exp19_user10, exp19)
graficos('acc-exp20-user10', acc_exp20_user10, exp20)

%% Ex4 Calcular DFT de cada por��o do sinal associado a uma atividade

[arrayFreqX11, arrayFreqY11, arrayFreqZ11, typeLabels11,average_w11, std_w11, average_wu11, std_wu11, average_wd11, std_wd11, x11, y11, z11, aux4_5_11] = calcDFTparte1(acc_exp11_user06, exp11);
[arrayFreqX12, arrayFreqY12, arrayFreqZ12, typeLabels12, average_w12, std_w12, average_wu12, std_wu12, average_wd12, std_wd12, x12, y12, z12, aux4_5_12] = calcDFTparte1(acc_exp12_user06, exp12);
[arrayFreqX13, arrayFreqY13, arrayFreqZ13, typeLabels13, average_w13, std_w13, average_wu13, std_wu13, average_wd13, std_wd13, x13, y13, z13, aux4_5_13] = calcDFTparte1(acc_exp13_user07, exp13);
[arrayFreqX14, arrayFreqY14, arrayFreqZ14, typeLabels14, average_w14, std_w14, average_wu14, std_wu14, average_wd14, std_wd14, x14, y14, z14, aux4_5_14] = calcDFTparte1(acc_exp14_user07, exp14);
[arrayFreqX15, arrayFreqY15, arrayFreqZ15, typeLabels15, average_w15, std_w15, average_wu15, std_wu15, average_wd15, std_wd15, x15, y15, z15, aux4_5_15] = calcDFTparte1(acc_exp15_user08, exp15);
[arrayFreqX16, arrayFreqY16, arrayFreqZ16, typeLabels16, average_w16, std_w16, average_wu16, std_wu16, average_wd16, std_wd16, x16, y16, z16, aux4_5_16] = calcDFTparte1(acc_exp16_user08, exp16);
[arrayFreqX17, arrayFreqY17, arrayFreqZ17, typeLabels17, average_w17, std_w17, average_wu17, std_wu17, average_wd17, std_wd17, x17, y17, z17, aux4_5_17] = calcDFTparte1(acc_exp17_user09, exp17);
[arrayFreqX18, arrayFreqY18, arrayFreqZ18, typeLabels18, average_w18, std_w18, average_wu18, std_wu18, average_wd18, std_wd18, x18, y18, z18, aux4_5_18] = calcDFTparte1(acc_exp18_user09, exp18);
[arrayFreqX19, arrayFreqY19, arrayFreqZ19, typeLabels19, average_w19, std_w19, average_wu19, std_wu19, average_wd19, std_wd19, x19, y19, z19, aux4_5_19] = calcDFTparte1(acc_exp19_user10, exp19);
[arrayFreqX20, arrayFreqY20, arrayFreqZ20, typeLabels20, average_w20, std_w20, average_wu20, std_wu20, average_wd20, std_wd20, x20, y20, z20, aux4_5_20] = calcDFTparte1(acc_exp20_user10, exp20);

% %EX4.2 Tabela das estatisticas

%Criar as colunas da tabela
user_exp = ['acc-exp11-user06';'acc-exp12-user06';'acc-exp13-user07';'acc-exp14-user07';'acc-exp15-user08';'acc-exp16-user08';'acc-exp17-user09';'acc-exp18-user09';'acc-exp19-user10';'acc-exp20-user10'];
mediasWalk = [average_w11; average_w12; average_w13; average_w14; average_w15;average_w16;average_w17;average_w18;average_w19;average_w20];
stdWalk = [std_w11; std_w12; std_w13; std_w14; std_w15; std_w16; std_w17; std_w18; std_w19; std_w20];
mediasWalkUp = [average_wu11; average_wu12; average_wu13; average_wu14; average_wu15;average_wu16;average_wu17;average_wu18;average_wu19;average_wu20];
stdWalkUp = [std_wu11; std_wu12; std_wu13; std_wu14; std_wu15; std_wu16; std_wu17; std_wu18; std_wu19; std_wu20];
mediasWalkDown = [average_wd11; average_wd12; average_wd13; average_wd14; average_wd15;average_wd16;average_wd17;average_wd18;average_wd19;average_wd20];
stdWalkDown = [std_wd11; std_wd12; std_wd13; std_wd14; std_wd15; std_wd16; std_wd17; std_wd18; std_wd19; std_wd20];

% %Criar e guardar a tabela
stat_table = table(user_exp, mediasWalk, stdWalk, mediasWalkUp, stdWalkUp, mediasWalkDown, stdWalkDown);
save('table.xlsx', 'stat_table');
% %%EX4.3 Criar a tabela com todo os dados

maxFreqs(:,1) = {[arrayFreqX11', arrayFreqY11', arrayFreqZ11', typeLabels11']};
maxFreqs(:,2) = {[arrayFreqX12', arrayFreqY12', arrayFreqZ12', typeLabels12']};
maxFreqs(:,3) = {[arrayFreqX13', arrayFreqY13', arrayFreqZ13', typeLabels13']};
maxFreqs(:,4) = {[arrayFreqX14', arrayFreqY14', arrayFreqZ14', typeLabels14']};
maxFreqs(:,5) = {[arrayFreqX15', arrayFreqY15', arrayFreqZ15', typeLabels15']};
maxFreqs(:,6) = {[arrayFreqX16', arrayFreqY16', arrayFreqZ16', typeLabels16']};
maxFreqs(:,7) = {[arrayFreqX17', arrayFreqY17', arrayFreqZ17', typeLabels17']};
maxFreqs(:,8) = {[arrayFreqX18', arrayFreqY18', arrayFreqZ18', typeLabels18']};
maxFreqs(:,9) = {[arrayFreqX19', arrayFreqY19', arrayFreqZ19', typeLabels19']};
maxFreqs(:,10) ={[arrayFreqX20', arrayFreqY20', arrayFreqZ20', typeLabels20']};

save('frequencias.mat', 'maxFreqs');
 findDiferences();
figure;
hold on
calcAverageSignal(acc_exp11_user06, exp11);
calcAverageSignal(acc_exp12_user06, exp12);
calcAverageSignal(acc_exp13_user07, exp13);
calcAverageSignal(acc_exp14_user07, exp14);
calcAverageSignal(acc_exp15_user08, exp15);
calcAverageSignal(acc_exp17_user09, exp17);
calcAverageSignal(acc_exp18_user09, exp18);
calcAverageSignal(acc_exp19_user10, exp19);
calcAverageSignal(acc_exp20_user10, exp20);
hold off
grid on



%%EX 4.5
figure;
hold on
plot4_5(x11, y11, z11, aux4_5_11);
plot4_5(x12, y12, z12, aux4_5_12);
plot4_5(x13, y13, z13, aux4_5_13);
plot4_5(x14, y14, z14, aux4_5_14);
plot4_5(x15, y15, z15, aux4_5_15);
plot4_5(x16, y16, z16, aux4_5_16);
plot4_5(x17, y17, z17, aux4_5_17);
plot4_5(x18, y18, z18, aux4_5_18);
plot4_5(x19, y19, z19, aux4_5_19);
hold off
grid on
