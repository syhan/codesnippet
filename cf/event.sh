curl -X POST \
  https://gtt-devsandbox-tnt-integration-site-entry-core.cfapps.sap.hana.ondemand.com/integration/v1/event \
  -H 'Authorization: Basic dG50X2NvcmVpbnRlZ3JhdGlvbl9jb21mb3J0Y2FyczpoQ1VWdUw0empoNk1WanRxaGZ5VlRLWG4=' \
  -H 'Cache-Control: no-cache' \
  -H 'Content-Type: application/json' \
  -H 'Postman-Token: a935e526-6da5-152d-ca53-52316bb6161a' \
  -H 'x-csrf-token: 2FBgn4um-gKXt204My48m0NycpgW0VAK9NHI' \
  -d '{
	"eventMessages": {
		"eventCode": "GI",
		"logicalSenderSystem": "Q8RCLNT764",
		"trackingIdType": "DEL_NO",
		"trackingId": "{{Tracking_ID_013}}",
		"actualBusinessTime": "22:26:11",
		"actualBusinessDate": "2017-07-28",
		"actualBusinessTimeZone": "CET",
		"locationId": "Loc2",
		"eventReasonText": "Integration_IT_013",
		"messageSourceType": "Postman"
	}
}'
