// Simule des updates, à remplacer par des events NUI dans FiveM
window.addEventListener('message', function(event) {
  const data = event.data;

  if (data.type === 'updateHUD') {
    const health = Math.max(0, Math.min(100, data.health));
    const armor = Math.max(0, Math.min(100, data.armor));

    document.getElementById('health-bar').style.width = `${health}%`;
    document.getElementById('armor-bar').style.width = `${armor}%`;
  }
});
