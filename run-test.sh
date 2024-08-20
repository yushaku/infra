docker compose -f docker-compose-test.yml up -d influxdb grafana
docker compose -f docker-compose-test.yml run --rm k6 run /scripts/test.js

echo ""
echo "-------------------------------------------------------------------------------------------------------"
echo "| message" "Load testing with Grafana dashboard 🌐  http://localhost:3000/d/k6/k6-load-testing-results |"
echo "-------------------------------------------------------------------------------------------------------"
