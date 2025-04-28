'use strict'

import express from 'express'
const router = express.Router()
import auth from './index'

// --- ✨ Log every request coming into this auth router
router.use((req, res, next) => {
    console.log(`[Auth Router] ${req.method} ${req.originalUrl} - Body:`, req.body);
    next();
  });
  
  // --- Your auth routes
router.get('/local/check', auth.check)
router.put('/local/join', auth.join)
router.post('/local/resend', auth.resend)
router.post('/local/activate', auth.activate)
router.post('/local/login', auth.login)
router.get('/local/logout', auth.logout)
router.post('/local/recover', auth.recover)
router.post('/local/reset', auth.reset)

export default router
