echo "--- BEGIN create_rd_order ---"
docker-compose exec --user "0:0" --privileged findit bundle exec rails runner integration_test_scripts/create_rd_order.rb 2>/dev/null > /tmp/create_rd_order.log
if [[ $? != 0 ]]; then
	echo "Failed to create TIB order in Findit."
	exit 2
fi
cat /tmp/create_rd_order.log
ORDER_ID=$( grep -E -o '^ID: [0-9]+' /tmp/create_rd_order.log | cut -c 5- )
rm /tmp/create_rd_order.log
echo "--- END create_rd_order ---"

echo "--- BEGIN generate_random_external_rd_ordernumber ---"
EXTERNAL_RD_ORDER_NUMBER=$( docker-compose exec --user "0:0" --privileged docdel bundle exec rails runner integration_test_scripts/generate_random_external_rd_ordernumber.rb )
echo "--- END generate_random_external_rd_ordernumber ---"
echo "--- BEGIN generate_random_external_tib_ordernumber ---"
EXTERNAL_TIB_ORDER_NUMBER=$( docker-compose exec --user "0:0" --privileged docdel bundle exec rails runner integration_test_scripts/generate_random_external_tib_ordernumber.rb )
echo "--- END generate_random_external_tib_ordernumber ---"

echo "--- BEGIN rd_cancel__tib_deliver ---"
docker-compose exec --user "0:0" --privileged docdel bundle exec rails runner integration_test_scripts/rd_cancel__tib_deliver.rb $ORDER_ID $EXTERNAL_RD_ORDER_NUMBER $EXTERNAL_TIB_ORDER_NUMBER
if [[ $? != 0 ]]; then
	echo "Simulation of cancellation of TIB order in Docdel failed."
	exit 2
fi
echo "--- END rd_cancel__tib_deliver ---"

echo "--- BEGIN order_is_supplied_by ---"
docker-compose exec --user "0:0" --privileged findit bundle exec rails runner integration_test_scripts/order_is_supplied_by.rb $ORDER_ID "tib"
if [[ $? != 0 ]]; then
	echo "Integration test failed. Cancelled ReprintsDesk order has not been ordered from TIB."
	exit 2
fi
echo "--- END order_is_supplied_by ---"
