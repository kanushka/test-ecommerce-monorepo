const express = require('express');
const router = express.Router();

// GET /health endpoint
router.get('/health', (req, res) => {
    res.status(200).json({ status: 'OK', message: 'Inventory Management API is running'});
});

// GET /stock-summary endpoint
router.get('/stock-summary', (req, res) => {
    const dummySummary = { totalItems: 50, lowStockThreshold: 10 };
    res.status(200).json(dummySummary);
});

module.exports = router;
