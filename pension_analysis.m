% Project Fusion: Omega Logic
fprintf('Cycle Started: %s\n', datestr(now));

% 1. CHECK FOR YODEL SIGNALS
if exist('fusion_signal.json', 'file')
    data = jsondecode(fileread('fusion_signal.json'));
    fprintf('Yodel signal detected from: %s\n', data.source);
end

% 2. GEMINI ANALYTICS
geminiKey = getenv('GEMINI_API_KEY');
if ~isempty(geminiKey)
    try
        url = ['https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=' geminiKey];
        body = struct('contents', struct('parts', struct('text', 'Perform 2026 Pension Market Analysis')));
        options = weboptions('HeaderFields', {'Content-Type', 'application/json'}, 'RequestMethod', 'post');
        webwrite(url, body, options);
        fprintf('Gemini processing complete.\n');
    catch
        fprintf('API Check: Waiting for key validation.\n');
    end
end

% 3. HEARTBEAT
save('heartbeat.mat', 'now');
