document.addEventListener('DOMContentLoaded', () => {
    // Calcolatore preventivo dinamico
    const calcType = document.getElementById('calc-type');
    const calcPages = document.getElementById('calc-pages');
    const calcDesign = document.getElementById('calc-design');
    const totalPriceEl = document.getElementById('total-price');

    function calculateEstimate() {
        if (!calcType || !calcPages || !calcDesign || !totalPriceEl) return;
        let basePrice = parseInt(calcType.value) || 0;
        let pagesMultiplier = parseFloat(calcPages.value) || 1;
        let designMultiplier = parseFloat(calcDesign.value) || 1;
        let total = (basePrice * pagesMultiplier) * designMultiplier;
        totalPriceEl.textContent = `€ ${Math.round(total).toLocaleString('it-IT')}`;
    }

    if (calcType && calcPages && calcDesign) {
        calcType.addEventListener('change', calculateEstimate);
        calcPages.addEventListener('change', calculateEstimate);
        calcDesign.addEventListener('change', calculateEstimate);
        calculateEstimate();
    }

    // Invio form contatti
    const contactForm = document.getElementById('contact-form');
    if (contactForm) {
        contactForm.addEventListener('submit', (e) => {
            e.preventDefault();
            const submitButton = contactForm.querySelector('button[type="submit"]');
            if (submitButton) {
                submitButton.disabled = true;
                submitButton.textContent = 'Messaggio Inviato! 🎉';
                submitButton.style.background = '#10b981';
            }
            setTimeout(() => {
                contactForm.reset();
                if (submitButton) {
                    submitButton.disabled = false;
                    submitButton.textContent = 'Invia Messaggio';
                    submitButton.style.background = '';
                }
            }, 3000);
        });
    }
});