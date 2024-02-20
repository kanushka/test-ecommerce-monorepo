const express = require('express'); 
const router = express.Router();

// GET /health endpoint
router.get('/health', (req, res) => {
    res.status(200).json({ status: 'OK', message: 'Pricing & Promotions API is running'}); 
});

// GET /stock-summary endpoint
router.get('/promotions', (req, res) => {
    // Replace this with your promotions retrieval logic
    const dummyPromotions = [
        { code: 'SUMMER20', discount: 0.20 }, // 20% discount
        { code: 'SPRING10', discount: 0.10 }, // 10% discount
        { code: 'FALL15', discount: 0.15 }, // 15% discount
        // ... more promotions
    ];
    res.status(200).json(dummyPromotions);
});

module.exports = router; 
