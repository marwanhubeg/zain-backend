#!/bin/bash
# start.sh - تشغيل المشروع كاملاً

echo "🚀 Starting Zain Real Estate Platform..."

# تشغيل backend
cd backend
echo "📡 Starting PHP backend on port 8000..."
php artisan serve --host=0.0.0.0 --port=8000 &

# تشغيل frontend
cd ../frontend
echo "🎨 Starting React frontend on port 3000..."
npm run dev -- --host 0.0.0.0 --port 3000 &

echo "✅ Platform running!"
wait
