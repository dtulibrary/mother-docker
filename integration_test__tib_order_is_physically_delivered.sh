echo "--- BEGIN create_tib_order ---"
docker-compose exec --user "0:0" --privileged findit bundle exec rails runner integration_test_scripts/create_tib_order.rb 2>/dev/null > /tmp/create_tib_order.log
if [[ $? != 0 ]]; then
	echo "Failed to create TIB order in Findit."
	exit 2
fi
cat /tmp/create_tib_order.log
ORDER_ID=$( grep -E -o '^ID: [0-9]+' /tmp/create_tib_order.log | cut -c 5- )
DOCDEL_ORDER_ID=$( grep -E -o '^DOCDEL_ORDER_ID: [0-9]+' /tmp/create_tib_order.log | cut -c 18- )
rm /tmp/create_tib_order.log
echo "--- END create_tib_order ---"

echo "--- BEGIN generate_random_external_tib_ordernumber ---"
EXTERNAL_TIB_ORDER_NUMBER=$( docker-compose exec --user "0:0" --privileged docdel bundle exec rails runner integration_test_scripts/generate_random_external_tib_ordernumber.rb )
echo "--- END generate_random_external_tib_ordernumber ---"

echo "--- BEGIN tib_physically_deliver ---"
docker-compose exec --user "0:0" --privileged docdel bundle exec rails runner integration_test_scripts/tib_physically_deliver.rb $DOCDEL_ORDER_ID $EXTERNAL_TIB_ORDER_NUMBER
if [[ $? != 0 ]]; then
	echo "Simulation of TIB delivery in Docdel failed."
	exit 2
fi
echo "--- END tib_physically_deliver ---"

echo "--- BEGIN order_is_physically_delivered ---"
docker-compose exec --user "0:0" --privileged findit bundle exec rails runner integration_test_scripts/order_is_physically_delivered.rb $EXTERNAL_TIB_ORDER_NUMBER
if [[ $? != 0 ]]; then
	echo "Integration test failed. TIB order wasn't physically delivered."
	exit 2
fi
echo "--- END order_is_physically_delivered ---"
