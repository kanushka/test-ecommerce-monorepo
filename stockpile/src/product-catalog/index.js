const express = require('express');
const os = require("os");

const app = express();
const router = express.Router();

// Sample product data
const products = [
    { id: 1, name: 'Product A', price: 9.99 },
    { id: 2, name: 'Product B', price: 15.99 },
    { id: 3, name: 'Product C', price: 19.99},
    { id: 4, name: 'Product D', price: 29.99},
    { id: 5, name: 'Product E', price: 39.99},
    { id: 6, name: 'Product F', price: 49.99},
    // ... more products
];

// GET /health endpoint
router.get('/health', (req, res) => {
    res.status(200).json({ status: 'OK', message: 'Product Catalog API is running'});
});

// GET /catalog endpoint
router.get('/catalog', (req, res) => {
    res.status(200).json(products);
});

// Run the server
const PORT = process.env.PORT || 7001;

function getLocalIpAddress() {
    const interfaces = os.networkInterfaces();
    for (const devName in interfaces) {
        const iface = interfaces[devName];

        for (let i = 0; i < iface.length; i++) {
            const alias = iface[i];
            if (alias.family === "IPv4" && !alias.internal) {
                return alias.address;
            }
        }
    }
    return "localhost";
}

app.listen(PORT, () => {
    const ip = getLocalIpAddress();
    console.log(`Product Catalog API is running at http://${ip}:${PORT}`);
});
