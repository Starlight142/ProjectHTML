<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="Etest.index" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Nexus CRUD | Premium Management Systems</title>
        <meta name="description"
            content="A state-of-the-art management system for efficient CRUD operations with a premium glassmorphic interface.">
        <!-- Google Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Outfit:wght@400;600;700&display=swap"
            rel="stylesheet">
        <!-- Lucide Icons (via CDN) -->
        <script src="https://unpkg.com/lucide@latest"></script>
        <link rel="stylesheet" href="Content/style.css">
    </head>

    <body>
        <!-- System Initialization Overlay -->
        <div id="bootOverlay" class="boot-overlay">
            <div class="boot-content">
                <div class="logo-icon center">N</div>
                <h1>Nexus System</h1>
                <p>Establishing secure connection to ExamDB...</p>
                <button id="initBtn" class="btn btn-primary" style="margin-top: 20px; padding: 15px 40px;">
                    <i data-lucide="power"></i>
                    <span>Initialize System</span>
                </button>
            </div>
        </div>

        <div class="app-container">
            <!-- Sidebar -->
            <aside class="sidebar">
                <div class="logo-section">
                    <div class="logo-icon">N</div>
                    <h1>Nexus</h1>
                </div>
                <nav>
                    <ul>
                        <li class="active" title="Dashboard">
                            <i data-lucide="layout-dashboard"></i>
                            <span>Dashboard</span>
                        </li>
                        <li title="Inventory">
                            <a href="index.aspx">
                                <i data-lucide="package"></i>
                                <span>Inventory</span>
                            </a>
                        </li>
                        <li title="Settings">
                            <a href="settings.aspx"
                                style="text-decoration: none; color: inherit; display: flex; align-items: center; gap: 12px; width: 100%;">
                                <i data-lucide="settings"></i>
                                <span>Settings</span>
                            </a>
                        </li>
                        <li title="Simple View">
                            <a href="Simple.aspx"
                                style="text-decoration: none; color: inherit; display: flex; align-items: center; gap: 12px; width: 100%;">
                                <i data-lucide="eye"></i>
                                <span>Simple View</span>
                            </a>
                        </li>
                    </ul>
                </nav>
                <div class="user-profile">
                    <div class="avatar">AD</div>
                    <div class="user-info">
                        <p class="name">Admin User</p>
                        <p class="role">Manager</p>
                    </div>
                </div>
            </aside>

            <!-- Main Content -->
            <main class="main-content">
                <header>
                    <div class="search-bar">
                        <i data-lucide="search"></i>
                        <input type="text" id="searchInput" placeholder="Search items...">
                    </div>
                    <div class="header-actions">
                        <button class="btn btn-primary" id="openModalBtn">
                            <i data-lucide="plus"></i>
                            <span>New Item</span>
                        </button>
                    </div>
                </header>

                <section class="stats-grid">
                    <div class="stat-card fade-in">
                        <div class="stat-icon purple"><i data-lucide="layers"></i></div>
                        <div class="stat-info">
                            <h3>Total Items</h3>
                            <p id="totalCount">0</p>
                        </div>
                    </div>
                    <div class="stat-card fade-in" style="animation-delay: 0.1s">
                        <div class="stat-icon blue"><i data-lucide="trending-up"></i></div>
                        <div class="stat-info">
                            <h3>Value</h3>
                            <p id="totalValue">$0.00</p>
                        </div>
                    </div>
                    <div class="stat-card fade-in" style="animation-delay: 0.2s">
                        <div class="stat-icon orange"><i data-lucide="alert-circle"></i></div>
                        <div class="stat-info">
                            <h3>Critical Stock</h3>
                            <p id="lowStockCount">0</p>
                        </div>
                    </div>
                    <div id="scoreboardCard" class="stat-card fade-in hidden" style="animation-delay: 0.3s">
                        <div class="stat-icon pink" style="background: rgba(236, 72, 153, 0.15); color: #f472b6;"><i
                                data-lucide="trophy"></i></div>
                        <div class="stat-info">
                            <h3>Scoreboard</h3>
                            <p style="font-size: 1rem;">
                                <span style="color: var(--accent-green);">Catches: <span
                                        id="catchesCount">0</span></span> |
                                <span style="color: var(--accent-red);">Misses: <span id="missesCount">0</span></span>
                            </p>
                        </div>
                    </div>
                </section>

                <section class="table-container fade-in" style="animation-delay: 0.3s">
                    <div class="table-header">
                        <h2>Inventory List</h2>
                        <p>Manage your product stock information efficiently.</p>
                    </div>
                    <div class="table-wrapper">
                        <table id="inventoryTable">
                            <thead>
                                <tr>
                                    <th>Item Name</th>
                                    <th>Category</th>
                                    <th>Quantity</th>
                                    <th>Price</th>
                                    <th>Status</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody id="inventoryBody">
                                <!-- Dynamic content here -->
                            </tbody>
                        </table>
                    </div>
                    <div id="emptyState" class="empty-state hidden">
                        <i data-lucide="box"></i>
                        <p>No items found. Start by adding a new one!</p>
                    </div>
                </section>
            </main>
        </div>

        <!-- Modal Form -->
        <div id="itemModal" class="modal">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 id="modalTitle">Add New Item</h2>

                    <button class="close-btn" id="closeModalBtn">&times;</button>
                </div>
                <form id="itemForm">
                    <input type="hidden" id="itemId">
                    <div class="form-group">
                        <label for="itemName">Item Name</label>
                        <input type="text" id="itemName" required placeholder="e.g. MacBook Pro M3">
                    </div>
                    <div class="form-row">
                        <div class="form-group">
                            <label for="itemCategory">Category</label>
                            <select id="itemCategory">
                                <option value="Electronics">Electronics</option>
                                <option value="Hardware">Hardware</option>
                                <option value="Software">Software</option>
                                <option value="Office">Office</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="itemPrice">Price ($)</label>
                            <input type="number" id="itemPrice" required step="0.01" min="0" placeholder="0.00">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="itemQuantity">Quantity</label>
                        <input type="number" id="itemQuantity" required min="0" placeholder="0">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" id="cancelBtn">Cancel</button>
                        <button type="submit" class="btn btn-primary" id="saveBtn">Save Item</button>
                    </div>
                </form>
            </div>
        </div>

        <!-- Toast Notification -->
        <div id="toast" class="toast">Action completed successfully!</div>

        <!-- YouTube Overlay -->
        <div id="youtubeOverlay" class="youtube-overlay hidden">
            <div class="overlay-content">
                <button class="close-overlay"
                    onclick="document.getElementById('youtubeOverlay').classList.add('hidden'); document.getElementById('ytPlayer').src=''; document.body.classList.remove('overlay-active');">&times;</button>
                <iframe id="ytPlayer" width="800" height="450" src="" frameborder="0"
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                    allowfullscreen></iframe>
            </div>
        </div>

        <!-- Debug Console -->
        <div id="debugConsole" class="debug-console collapsed">
            <div class="console-header" onclick="document.getElementById('debugConsole').classList.toggle('collapsed')">
                <span><i data-lucide="terminal" style="width:14px; height:14px; vertical-align: middle;"></i> System
                    Console</span>
                <div class="console-actions">
                    <button onclick="event.stopPropagation(); window.clearDebugConsole()">Clear</button>
                    <span class="toggle-icon"></span>
                </div>
            </div>
            <div id="consoleBody" class="console-body"></div>
        </div>

        <script src="Scripts/debug.js"></script>
        <script src="Scripts/app.js"></script>
        <script>
            // Initialize Lucide icons
            lucide.createIcons();
        </script>
    </body>

    </html>