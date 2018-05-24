curl -X POST \
  https://gtt-devsandbox-tnt-integration-site-entry-core.cfapps.sap.hana.ondemand.com/integration/v1/process \
  -H 'Authorization: Basic dG50X2NvcmVpbnRlZ3JhdGlvbl9jb21mb3J0Y2FyczpoQ1VWdUw0empoNk1WanRxaGZ5VlRLWG4=' \
  -H 'Cache-Control: no-cache' \
  -H 'Content-Type: application/json' \
  -H 'Postman-Token: d88cbf66-586e-7a5b-bc16-3150058f0753' \
  -H 'x-csrf-token: 2FBgn4um-gKXt204My48m0NycpgW0VAK9NHI' \
  -d '{
	"applicationObjects": {
		"applicationSystem": "Q8JCLNT764",
		"applicationObjectType": "OBP10_DELIV",
		"applicationObjectId": "1111",
		"parameters": [{
			"parameterName": "DEL_NO",
			"parameterIndex": "0000000000",
			"parameterValue": "1111"
		}, {
			"parameterName": "SALES_ORGANIZATION",
			"parameterIndex": "0000000000",
			"parameterValue": "0001"
		}, {
			"parameterName": "SHIPPING_TYPE",
			"parameterIndex": "0000000000",
			"parameterValue": "01"
		}, {
			"parameterName": "SHIP_TO_PARTY",
			"parameterIndex": "0000000000",
			"parameterValue": "A00_CUS_EM"
		}, {
			"parameterName": "SOLD_TO_PARTY",
			"parameterIndex": "0000000000",
			"parameterValue": "A00_CUS_EM"
		}, {
			"parameterName": "DELIVERY_ITEM",
			"parameterIndex": "0000000010",
			"parameterValue": "000010"
		}, {
			"parameterName": "PLANT",
			"parameterIndex": "0000000010",
			"parameterValue": "RWA1"
		}, {
			"parameterName": "STORAGE_LOC",
			"parameterIndex": "0000000010",
			"parameterValue": "SL01"
		}, {
			"parameterName": "SO_NO",
			"parameterIndex": "0000000000",
			"parameterValue": "0000000125"
		}, {
			"parameterName": "DELIVERY_ITEM",
			"parameterIndex": "0000000020",
			"parameterValue": "000020"
		}, {
			"parameterName": "PLANT",
			"parameterIndex": "0000000020",
			"parameterValue": "RWA1"
		}, {
			"parameterName": "STORAGE_LOC",
			"parameterIndex": "0000000020",
			"parameterValue": "SL01"
		}, {
			"parameterName": "DELIVERY_DATE",
			"parameterIndex": "0000000000",
			"parameterValue": "2017-03-09"
		}, {
			"parameterName": "LOADING_DATE",
			"parameterIndex": "0000000000",
			"parameterValue": "2017-03-09"
		}, {
			"parameterName": "TRANS_PLAN_DATE",
			"parameterIndex": "0000000000",
			"parameterValue": "2017-03-09"
		}, {
			"parameterName": "DELIVERY_NET_WEIGHT",
			"parameterIndex": "0000000000",
			"parameterValue": "2080.000"
		}, {
			"parameterName": "DELIVERY_WEIGHT_UNIT",
			"parameterIndex": "0000000000",
			"parameterValue": "KG"
		}, {
			"parameterName": "DELIVERY_VOLUME",
			"parameterIndex": "0000000000",
			"parameterValue": "19.500"
		}, {
			"parameterName": "DELIVERY_VOLUME_UNIT",
			"parameterIndex": "0000000000",
			"parameterValue": "M3"
		}, {
			"parameterName": "NO_OF_PACKAGES",
			"parameterIndex": "0000000000",
			"parameterValue": "00002"
		}, {
			"parameterName": "MATERIAL",
			"parameterIndex": "0000000010",
			"parameterValue": "A01-EM-HAWA-02"
		}, {
			"parameterName": "DELIVERY_QTY",
			"parameterIndex": "0000000010",
			"parameterValue": "15.00"
		},{
			"parameterName": "QUANTITY_UNIT",
			"parameterIndex": "0000000010",
			"parameterValue": "EA"
		}, {
			"parameterName": "MATERIAL",
			"parameterIndex": "0000000020",
			"parameterValue": "A01-EM-HAWA-01"
		}, {
			"parameterName": "DELIVERY_QTY",
			"parameterIndex": "0000000020",
			"parameterValue": "50.00"
		}, {
			"parameterName": "QUANTITY_UNIT",
			"parameterIndex": "0000000020",
			"parameterValue": "EA"
		}],
		
		                              "trackingIds": [{
                                             "trackingIdType": "DEL_NO",
                                             "trackingId": "1111"
                              },{
                                             "trackingIdType": "PO_NO",
                                             "trackingId": "1234567890",
                                             "validFrom": "2017-01-09T20:00:00",
                                             "validTo": "2017-04-30T20:00:00",
                                             "timeZone": "CET"
                              }],
                              "plannedEvents": [{
                                             "eventCode": "PICK_COMPL",
                                             "locationId": "Loc1",
                                             "plannedTechnicalTimestamp": "2017-08-09T10:00:00",
                                             "plannedTechnicalTimeZone": "CET",
                                             "plannedBusinessTimestamp": "2017-08-09T08:00:00",
                                             "plannedBusinessTimeZone": "CET",
                                             "customIdentifier": "customID"
                              }]


	}
}'
