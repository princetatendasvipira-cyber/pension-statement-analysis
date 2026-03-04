% MATLAB Master Script
slackUrl = getenv('SLACK_WEBHOOK_URL');
geminiKey = getenv('GEMINI_API_KEY');

fprintf('Cycle Started: %s\n', datestr(now));

% Call Gemini API
url = ['https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=' geminiKey];
body = struct('contents', struct('parts', struct('text', 'Analyze current pension trends for 2026')));
options = weboptions('HeaderFields', {'Content-Type', 'application/json'}, 'RequestMethod', 'post');

try
    response = webwrite(url, body, options);
    % Send Heartbeat to Slack
    if ~isempty(slackUrl)
        payload = struct('text', sprintf('✅ *Infinite Cycle Heartbeat*\nTime: %s\nStatus: Online', datestr(now)));
        webwrite(slackUrl, payload, options);
    end
    fprintf('Success.\n');
catch ME
    fprintf('Error: %s\n', ME.message);
end
