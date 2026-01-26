<%@ Page Language="C#" AutoEventWireup="true" CodeFile="settings.aspx.cs" Inherits="Etest.settings" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Nexus Settings | System Configuration</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Outfit:wght@400;600;700&display=swap"
            rel="stylesheet">
        <script src="https://unpkg.com/lucide@latest"></script>
        <link rel="stylesheet" href="Content/style.css">
        <style>
            .settings-card {
                background: var(--bg-card);
                backdrop-filter: var(--glass-blur);
                border: 1px solid var(--border);
                border-radius: 24px;
                padding: 2.5rem;
                max-width: 600px;
            }

            .setting-item {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 1.5rem 0;
                border-bottom: 1px solid var(--border);
            }

            .setting-item:last-child {
                border-bottom: none;
            }

            .setting-info h3 {
                font-size: 1.1rem;
                margin-bottom: 4px;
            }

            .setting-info p {
                color: var(--text-muted);
                font-size: 0.9rem;
            }

            /* Toggle Switch */
            .switch {
                position: relative;
                display: inline-block;
                width: 50px;
                height: 26px;
            }

            .switch input {
                opacity: 0;
                width: 0;
                height: 0;
            }

            .slider {
                position: absolute;
                cursor: pointer;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background-color: var(--glass-bg);
                transition: .4s;
                border-radius: 34px;
                border: 1px solid var(--border);
            }

            .slider:before {
                position: absolute;
                content: "";
                height: 18px;
                width: 18px;
                left: 3px;
                bottom: 3px;
                background-color: white;
                transition: .4s;
                border-radius: 50%;
            }

            input:checked+.slider {
                background-color: var(--primary);
                border-color: var(--primary);
            }

            input:checked+.slider:before {
                transform: translateX(24px);
            }
        </style>
    </head>

    <body>
        <div class="app-container">
            <!-- Sidebar -->
            <aside class="sidebar">
                <div class="logo-section">
                    <div class="logo-icon">N</div>
                    <h1>Nexus</h1>
                </div>
                <nav>
                    <ul>
                        <li title="Dashboard">
                            <a href="index.aspx"
                                style="text-decoration: none; color: inherit; display: flex; align-items: center; gap: 12px; width: 100%;">
                                <i data-lucide="layout-dashboard"></i>
                                <span>Dashboard</span>
                            </a>
                        </li>
                        <li title="Inventory">
                            <a href="index.aspx"
                                style="text-decoration: none; color: inherit; display: flex; align-items: center; gap: 12px; width: 100%;">
                                <i data-lucide="package"></i>
                                <span>Inventory</span>
                            </a>
                        </li>
                        <li class="active" title="Settings">
                            <i data-lucide="settings"></i>
                            <span>Settings</span>
                        </li>
                    </ul>
                </nav>
            </aside>

            <!-- Main Content -->
            <main class="main-content">
                <header>
                    <div>
                        <h1 style="font-size: 2rem;">Settings</h1>
                        <p style="color: var(--text-muted);">Manage your system preferences.</p>
                    </div>
                </header>

                <div class="settings-card fade-in">
                    <div class="setting-item">
                        <div class="setting-info">
                            <h3>Runaway Button Mode</h3>
                            <p>Enable/Disable the "catch me if you can" behavior on the New Item button.</p>
                        </div>
                        <label class="switch">
                            <input type="checkbox" id="runawayToggle">
                            <span class="slider"></span>
                        </label>
                    </div>
                    <div class="setting-item">
                        <div class="setting-info">
                            <h3>Audio Diagnostics</h3>
                            <p>Manually test if the reward audio file can be loaded and played.</p>
                        </div>
                        <button id="testAudioBtn" class="btn btn-secondary">
                            <i data-lucide="volume-2"></i>
                            <span>Test Reward Audio</span>
                        </button>
                    </div>
                </div>
            </main>
        </div>

        <!-- Toast -->
        <div id="toast" class="toast">Settings saved!</div>

        <script>
            document.addEventListener('DOMContentLoaded', () => {
                const toggle = document.getElementById('runawayToggle');
                const toast = document.getElementById('toast');
                const testBtn = document.getElementById('testAudioBtn');

                // Load state
                const isEnabled = localStorage.getItem('nexus_runaway_enabled') !== 'false';
                toggle.checked = isEnabled;

                // Save state
                toggle.addEventListener('change', () => {
                    localStorage.setItem('nexus_runaway_enabled', toggle.checked);

                    // Show toast
                    toast.classList.add('show');
                    setTimeout(() => toast.classList.remove('show'), 2000);
                });

                // Test Audio
                testBtn.addEventListener('click', () => {
                    const audio = new Audio('Content/Rick_Astley.mp3');
                    audio.play()
                        .then(() => alert("Success! Audio is playing."))
                        .catch(e => alert("Audio failed! Error: " + e.message + "\nPath used: Content/Rick_Astley.mp3"));
                });

                lucide.createIcons();
            });
        </script>
    </body>

    </html>