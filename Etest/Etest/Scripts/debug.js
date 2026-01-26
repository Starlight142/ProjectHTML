/**
 * Nexus Debug Console Logic
 * Intercepts global console calls to display them in the web UI.
 */

(function () {
    const originalLog = console.log;
    const originalError = console.error;
    const originalWarn = console.warn;
    const consoleBody = document.getElementById('consoleBody');

    const addLogToUI = (msg, type = 'info') => {
        if (!consoleBody) return;

        const entry = document.createElement('div');
        entry.className = `log-entry ${type}`;

        const timestamp = new Date().toLocaleTimeString([], { hour12: false });

        // Convert objects to strings
        const formattedMsg = typeof msg === 'object' ? JSON.stringify(msg, null, 2) : msg;

        entry.innerHTML = `
            <span class="log-time">[${timestamp}]</span>
            <span class="log-${type}">${type.toUpperCase()}:</span>
            <span class="log-msg">${formattedMsg}</span>
        `;

        consoleBody.appendChild(entry);
        consoleBody.scrollTop = consoleBody.scrollHeight;
    };

    console.log = function (...args) {
        originalLog.apply(console, args);
        args.forEach(arg => addLogToUI(arg, 'info'));
    };

    console.error = function (...args) {
        originalError.apply(console, args);
        args.forEach(arg => addLogToUI(arg, 'error'));
    };

    console.warn = function (...args) {
        originalWarn.apply(console, args);
        args.forEach(arg => addLogToUI(arg, 'warn'));
    };

    window.clearDebugConsole = function () {
        if (consoleBody) consoleBody.innerHTML = '';
    };

    // Catch unhandled errors
    window.onerror = function (message, source, lineno, colno, error) {
        addLogToUI(`${message} at ${source}:${lineno}`, 'error');
    };

    console.log("Debug Console Initialized.");
})();
