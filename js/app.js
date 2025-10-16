// Adiology Application - Main JavaScript File

// DOM Elements
const getStartedBtn = document.getElementById('get-started-btn');

// Event Listeners
document.addEventListener('DOMContentLoaded', () => {
    console.log('Adiology Application Loaded');
    initializeApp();
});

// Initialize Application
function initializeApp() {
    setupEventListeners();
    setupSmoothScroll();
    displayWelcomeMessage();
}

// Setup Event Listeners
function setupEventListeners() {
    if (getStartedBtn) {
        getStartedBtn.addEventListener('click', handleGetStarted);
    }

    // Add click handlers for navigation links
    const navLinks = document.querySelectorAll('.nav-links a');
    navLinks.forEach(link => {
        link.addEventListener('click', handleNavClick);
    });
}

// Handle Get Started Button Click
function handleGetStarted() {
    const featuresSection = document.getElementById('features');
    if (featuresSection) {
        featuresSection.scrollIntoView({ behavior: 'smooth' });
    }
    
    // Show alert with welcome message
    showNotification('Welcome to Adiology! Explore our features below.');
}

// Handle Navigation Link Clicks
function handleNavClick(event) {
    event.preventDefault();
    const targetId = event.target.getAttribute('href').substring(1);
    const targetSection = document.getElementById(targetId);
    
    if (targetSection) {
        targetSection.scrollIntoView({ behavior: 'smooth' });
    }
}

// Setup Smooth Scroll
function setupSmoothScroll() {
    // Add smooth scrolling to all links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                target.scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
            }
        });
    });
}

// Display Welcome Message in Console
function displayWelcomeMessage() {
    console.log('%c Welcome to Adiology! ', 'background: #3498db; color: white; font-size: 20px; padding: 10px;');
    console.log('%c Version 1.0.0 ', 'background: #2c3e50; color: white; font-size: 14px; padding: 5px;');
    console.log('Explore our audio analysis platform and discover new possibilities!');
}

// Show Notification
function showNotification(message) {
    // Create notification element
    const notification = document.createElement('div');
    notification.className = 'notification';
    notification.textContent = message;
    notification.style.cssText = `
        position: fixed;
        top: 80px;
        right: 20px;
        background-color: #27ae60;
        color: white;
        padding: 1rem 2rem;
        border-radius: 5px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        z-index: 1000;
        animation: slideIn 0.5s ease;
    `;

    // Add animation styles
    const style = document.createElement('style');
    style.textContent = `
        @keyframes slideIn {
            from {
                transform: translateX(400px);
                opacity: 0;
            }
            to {
                transform: translateX(0);
                opacity: 1;
            }
        }
        @keyframes slideOut {
            from {
                transform: translateX(0);
                opacity: 1;
            }
            to {
                transform: translateX(400px);
                opacity: 0;
            }
        }
    `;
    document.head.appendChild(style);
    
    // Append notification to body
    document.body.appendChild(notification);
    
    // Remove notification after 3 seconds
    setTimeout(() => {
        notification.style.animation = 'slideOut 0.5s ease';
        setTimeout(() => {
            notification.remove();
        }, 500);
    }, 3000);
}

// Feature Card Interaction
document.addEventListener('DOMContentLoaded', () => {
    const featureCards = document.querySelectorAll('.feature-card');
    
    featureCards.forEach(card => {
        card.addEventListener('click', () => {
            const featureTitle = card.querySelector('h3').textContent;
            showNotification(`You clicked on: ${featureTitle}`);
        });
    });
});

// Export functions for testing (if needed)
if (typeof module !== 'undefined' && module.exports) {
    module.exports = {
        initializeApp,
        handleGetStarted,
        showNotification
    };
}
