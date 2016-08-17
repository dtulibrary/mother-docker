echo "--- BEGIN create_tib_order ---"
docker-compose exec --user "0:0" --privileged findit bundle exec rails runner integration_test_scripts/create_tib_order.rb
if [[ $? != 0 ]]; then
	echo "Failed to create TIB order in Findit."
	exit 2
fi
echo "--- END create_tib_order ---"

echo "--- BEGIN simulate_tib_process ---"
EXTERNAL_TIB_ORDER_NUMBER=$( docker-compose exec --user "0:0" --privileged docdel bundle exec rails runner integration_test_scripts/generate_random_external_tib_ordernumber.rb )
docker-compose exec --user "0:0" --privileged docdel bundle exec rails runner integration_test_scripts/simulate_tib_process.rb $EXTERNAL_TIB_ORDER_NUMBER
if [[ $? != 0 ]]; then
	echo "Simulation of TIB delivery in Docdel failed."
	exit 2
fi
echo "--- END simulate_tib_process ---"

echo "--- BEGIN order_is_delivered ---"
docker-compose exec --user "0:0" --privileged findit bundle exec rails runner integration_test_scripts/order_is_delivered.rb $EXTERNAL_TIB_ORDER_NUMBER
if [[ $? != 0 ]]; then
	echo "Integration test failed. TIB order wasn't delivered."
	exit 2
fi
echo "--- END order_is_delivered ---"
