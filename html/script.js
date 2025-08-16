window.addEventListener('message', function(event) {
  const data = event.data;

  if (data.type === 'updateHUD') {
    const health = Math.max(0, Math.min(100, data.health));
    const armor = Math.max(0, Math.min(100, data.armor));

    // Mise à jour des barres
    const healthFill = document.getElementById('health-fill');
    const armorFill = document.getElementById('armor-fill');
    const healthPercentage = document.getElementById('health-percentage');
    const armorPercentage = document.getElementById('armor-percentage');

    // Animation fluide des barres
    healthFill.style.width = `${health}%`;
    armorFill.style.width = `${armor}%`;

    // Mise à jour des pourcentages
    healthPercentage.textContent = `${Math.round(health)}%`;
    armorPercentage.textContent = `${Math.round(armor)}%`;

    // Effet de pulsation quand la vie est faible
    const healthSection = document.querySelector('.health-section');
    if (health <= 20) {
      healthSection.style.animation = 'pulse 1s infinite';
    } else {
      healthSection.style.animation = 'none';
    }
  }
});

// Animation de pulsation pour la vie faible
const style = document.createElement('style');
style.textContent = `
  @keyframes pulse {
    0%, 100% { opacity: 1; }
    50% { opacity: 0.6; }
  }
`;
document.head.appendChild(style);

// Test en local (à supprimer en production)
if (window.location.protocol === 'file:') {
  let testHealth = 100;
  let testArmor = 0;
  
  setInterval(() => {
    testHealth = Math.max(0, testHealth - Math.random() * 2);
    testArmor = Math.min(100, testArmor + Math.random() * 1);
    
    window.postMessage({
      type: 'updateHUD',
      health: testHealth,
      armor: testArmor
    }, '*');
    
    if (testHealth <= 0) {
      testHealth = 100;
      testArmor = 0;
    }
  }, 100);
}