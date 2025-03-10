% 定義顏色及其機率
colors = {'紅色', '橘色', '黃色', '綠色', '藍色', '紫色'};
probabilities = [0.15, 0.20, 0.10, 0.20, 0.15, 0.20];

% 模擬次數
num_simulations = 10^5;

% 初始化结果數據組
results = zeros(num_simulations, 1);

% 模擬飛鏢投擲
for i = 1:num_simulations
    % 生成均匀分布的隨機數
    rand_num = rand();
    
    % 根據隨機樹確認落點顏色
    cumulative_prob = 0;
    for j = 1:length(colors)
        cumulative_prob = cumulative_prob + probabilities(j);
        if rand_num <= cumulative_prob
            results(i) = j; % 紀錄顏色index
            break;
        end
    end
end

% 統計每個顏色的落點數量
counts = histcounts(results, 1:length(colors)+1);

% 計算落在每個顏色的機率
probabilities_simulated = counts / num_simulations;

% 繪製直方圖
figure;
bar(1:length(colors), probabilities_simulated, 'FaceColor', 'b', 'EdgeColor', 'k');
xticks(1:length(colors));
xticklabels(colors);
xlabel('颜色');
ylabel('概率');
title('飛鏢落點顏色機率直方圖');

