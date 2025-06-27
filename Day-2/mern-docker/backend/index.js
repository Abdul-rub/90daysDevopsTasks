const express = require('express');
const mongoose = require('mongoose');
const app = express();

mongoose.connect('mongodb://mongo:27017/merndb', {
  useNewUrlParser: true,
  useUnifiedTopology: true,
}).then(() => {
  console.log('✅ Connected to MongoDB');
}).catch(err => {
  console.error('❌ MongoDB connection error:', err);
});

app.get('/', (req, res) => {
  res.send('Backend is running!');
});

const PORT = 5000;
app.listen(PORT, () => console.log(`🚀 Backend listening on port ${PORT}`));
