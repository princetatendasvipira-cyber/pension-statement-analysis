% Project Fusion: Omega Logic
fprintf('--- Starting Cloud Fusion Cycle: %s ---\n', datestr(now));

try
    % Check for Secrets
    geminiKey = getenv('GEMINI_API_KEY');
    if isempty(geminiKey)
        error('MISSING_KEY: GEMINI_API_KEY not found in Environment.');
    end
    
    % Fusion Logic (Check for Yodel signals)
    if exist('fusion_signal.json', 'file')
        fprintf('Signal Detected: Integrating Curly Space Yodel data...\n');
    else
        fprintf('Status: Standby. Waiting for Yodel heartbeat.\n');
    end

    fprintf('--- Cycle Successful ---\n');
catch ME
    fprintf('CRITICAL ERROR: %s\n', ME.message);
    exit(1); % Tells GitHub the run failed
end
