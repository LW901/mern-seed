#!/bin/bash

clear
echo "MERN-SEED Secrets Reset"
echo ""
echo "Regenerating JWT keys and SSL certificates (Dev + Prod)"
echo ""

prepare() {
  mkdir -p ./backend/.ssl
  mkdir -p ./backend/.jwt
}

generateSslDev() {
  echo "Generating Dev SSL certificate..."
  openssl req -x509 -sha256 -newkey rsa:4096 -keyout ./backend/.ssl/key.pem -out ./backend/.ssl/cert.pem -nodes -days 365 -subj '/CN=localhost' &>/dev/null
  echo "✅ Dev SSL generated: ./backend/.ssl/key.pem & cert.pem"
}

generateSslProd() {
  echo "Generating Prod SSL certificate..."
  openssl req -x509 -sha256 -newkey rsa:4096 -keyout ./backend/.ssl/key.prod.pem -out ./backend/.ssl/cert.prod.pem -nodes -days 365 -subj '/CN=localhost' &>/dev/null
  echo "✅ Prod SSL generated: ./backend/.ssl/key.prod.pem & cert.prod.pem"
}

generateJwtDev() {
  echo "Generating Dev JWT keys..."
  openssl genrsa -out ./backend/.jwt/secret.pem 2048 &>/dev/null
  openssl rsa -in ./backend/.jwt/secret.pem -outform PEM -pubout -out ./backend/.jwt/public.pem &>/dev/null
  echo "✅ Dev JWT keys generated: ./backend/.jwt/secret.pem & public.pem"
}

generateJwtProd() {
  echo "Generating Prod JWT keys..."
  openssl genrsa -out ./backend/.jwt/secret.prod.pem 2048 &>/dev/null
  openssl rsa -in ./backend/.jwt/secret.prod.pem -outform PEM -pubout -out ./backend/.jwt/public.prod.pem &>/dev/null
  echo "✅ Prod JWT keys generated: ./backend/.jwt/secret.prod.pem & public.prod.pem"
}

start() {
  prepare
  generateSslDev
  generateSslProd
  generateJwtDev
  generateJwtProd
  echo ""
  echo "🎉 Secrets reset complete!"
  echo ""
}

read -rp "Press Enter to start resetting secrets..."
start
