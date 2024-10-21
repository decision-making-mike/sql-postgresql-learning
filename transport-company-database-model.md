# Transport company database model

A model for a database of an example transport company.

## Tables

No column in no table shall be null.

|No.|Name|Description
|-|-|-
|1|Orders|Orders. The order placing person, the cargo handing over person and the cargo receiving person can be the same person. One order can be assigned to only one order placing person, only one cargo handing over person, only one cargo receiving person, only one place of origin address and only one place of destination address. One order placing person can be assigned to multiple orders. One cargo handing over person can be assigned to multiple orders. One cargo receiving person can be assigned to multiple orders. One place of origin address can be assigned to multiple orders. One place of destination address can be assigned to multiple orders.
|2|People|People mentioned in any other table within this model.
|3|People companies|Companies of the people from the "People" table. One person can be assigned to only one company. One company can be assigned to multiple people.
|4|Vehicles|Vehicles that the company possesses.
|5|Addresses|Addresses mentioned in any other table within this model.
|6|Parcels|Individual parcels that the company ships within each order. One parcel can be assigned to only one order. One order can be assigned to multiple parcels.
|7|Parcel shipments|Shipments of parcels. A parcel can be shipped multiple times if the company wants to use one or more distribution centers as intermediaries. One shipment can be assigned to only one vehicle, only one address and multiple parcels. One vehicle can be assigned to multiple shipments. One address can be assigned to multiple shipments. One parcel can be assigned to multiple shipments.
|8|Parcel deliveries|Deliveries of parcels. A parcel can be delivered multiple times if the company wants to use one or more distribution centers as intermediaries. One delivery can be assigned to only one shipment and only one address. One address can be assigned to multiple deliveries. One shipment can be assigned to only one delivery.
|9|Required payments|Payments for deliveries that the clients of the company are charged. A client is supposed to be charged a payment for their order after all the parcels within this order have been delivered. One required payment can be assigned to only one order. One order can be assigned to only one required payment.
|10|Done payments|Payments for orders that the clients of the company have paid. One done payment can be assigned to only one required payment. One required payment can be assigned to only one done payment.

## Columns

### "Orders" table

A row is expected to be added when a client has placed an order.

|No.|Name|Can be null?|Must be unique?
|-|-|-|-
|1|ID|No|Yes
|2|Order acceptance date and time|No|No
|3|Order placing person ID|No|No
|4|Cargo handing over person ID|No|No
|5|Cargo receiving person ID|No|No
|6|Place of origin address ID|No|No
|7|Place of destination address ID|No|No

### "People" table

|No.|Name|Can be null?|Must be unique?
|-|-|-|-
|1|ID|No|Yes
|2|Name|No|No

### "People companies" table

|No.|Name|Can be null?|Must be unique?
|-|-|-|-
|1|ID|No|Yes
|2|Registration number|No|No
|3|Person ID|No|Yes

### "Vehicles" table

|No.|Name|Can be null?|Must be unique?
|-|-|-|-
|1|ID|No|Yes
|2|Maximum cargo weight in kg|No|No
|3|GPS location|No|No

### "Addresses" table

|No.|Name|Can be null?|Must be unique?
|-|-|-|-
|1|ID|No|Yes
|2|Address|No|No
|3|GPS location|No|No

### "Parcels" table

|No.|Name|Can be null?|Must be unique?
|-|-|-|-
|1|ID|No|Yes
|2|Order ID|No|No
|3|Estimated weight in kg|No

### "Parcel shipments" table

|No.|Name|Can be null?|Must be unique?
|-|-|-|-
|1|ID|No|Yes
|2|Vehicle ID|No|No
|3|Parcel ID|No|No
|4|Address ID|No|No
|5|Shipment date and time|No|No

### "Parcel deliveries" table

|No.|Name|Can be null?|Must be unique?
|-|-|-|-
|1|ID|No|Yes
|2|Parcel shipment ID|No|Yes
|3|Address ID|No|No
|4|Delivery date and time|No|No

### "Required payments" table

|No.|Name|Can be null?|Must be unique?
|-|-|-|-
|1|ID|No|Yes
|2|Order ID|No|Yes
|3|Amount|No|No
|4|Due date|No|No

### "Done payments" table

|No.|Name|Can be null?|Must be unique?
|-|-|-|-
|1|ID|No|Yes
|2|Required payment ID|No|Yes
|3|Date|No|No
