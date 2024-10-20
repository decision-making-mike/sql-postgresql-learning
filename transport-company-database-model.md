# Transport company database model

A model for a database of an example transport company.

## Tables

No column in no table shall be null.

|No.|Name
|-|-
|1|Orders
|2|People
|3|People companies
|4|Vehicles
|5|Addresses
|6|Parcels
|7|Parcel shipments
|8|Parcel deliveries
|9|Required payments
|10|Done payments

## Columns

### "Orders" table

A row is expected to be added when a client has placed an order.

|No.|Name|Can be null?
|-|-|-
|1|ID|No
|2|Order acceptance date and time|No
|3|Order placing person ID|No
|4|Cargo handing over person ID|No
|5|Cargo receiving person ID|No
|6|Place of origin address ID|No
|7|Place of destination address ID|No

### "People" table

|No.|Name|Can be null?
|-|-|-
|1|ID|No
|2|Name|No

### "People companies" table

|No.|Name|Can be null?
|-|-|-
|1|ID|No
|2|Registration number|No
|3|Person ID|No

### "Vehicles" table

|No.|Name|Can be null?
|-|-|-
|1|ID|No
|2|Maximum cargo weight in kg|No
|3|GPS location|No

### "Addresses" table

|No.|Name|Can be null?
|-|-|-
|1|ID|No
|2|Address|No
|3|GPS location|No

### "Parcels" table

|No.|Name|Can be null?
|-|-|-
|1|ID|No
|2|Order ID|No
|3|Estimated weight in kg|No

### "Parcel shipments" table

|No.|Name|Can be null?
|-|-|-
|1|ID|No
|2|Vehicle ID|No
|3|Parcel ID|No
|4|Shipment date and time|No

### "Parcel deliveries" table

|No.|Name|Can be null?
|-|-|-
|1|ID|No
|2|Parcel shipment ID|No
|3|Address ID|No
|4|Delivery date and time|No

### "Required payments" table

|No.|Name|Can be null?
|-|-|-
|1|ID|No
|2|Order ID|No
|3|Amount|No
|4|Due date|No

### "Done payments" table

|No.|Name|Can be null?
|-|-|-
|1|ID|No
|2|Required payment ID|No
|3|Date|No
