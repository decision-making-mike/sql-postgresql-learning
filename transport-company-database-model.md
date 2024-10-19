# Transport company database model

A model for a database of an example transport company.

## Tables

No column in no table shall be null.

### 1. Orders

A row is expected to be added when a client has placed an order.

#### Columns

|No.|Name|Can be null?
|-|-|-
|1|ID|No
|2|Order acceptance date and time|No
|3|Consignor ID|No
|4|Consignee ID|No
|5|Place of origin address ID|No
|6|Place of destination address ID|No

### 2. People

#### Columns

|No.|Name|Can be null?
|-|-|-
|1|ID|No
|2|Name|No

### 3. People companies

#### Columns

|No.|Name|Can be null?
|-|-|-
|1|ID|No
|2|Registration number|No
|3|Person ID|No

### 4. Vehicles

#### Columns

|No.|Name|Can be null?
|-|-|-
|1|ID|No
|2|Maximum cargo weight in kg|No
|3|GPS location|No

### 5. Addresses

#### Columns

|No.|Name|Can be null?
|-|-|-
|1|ID|No
|2|Address|No
|3|GPS location|No

### 6. Parcels

#### Columns

|No.|Name|Can be null?
|-|-|-
|1|ID|No
|2|Order ID|No
|3|Estimated weight in kg|No

### 7. Parcel shipments

#### Columns

|No.|Name|Can be null?
|-|-|-
|1|ID|No
|2|Vehicle ID|No
|3|Parcel ID|No
|4|Shipment date and time|No

### 8. Parcel deliveries

#### Columns

|No.|Name|Can be null?
|-|-|-
|1|ID|No
|2|Parcel shipment ID|No
|3|Address ID|No
|4|Delivery date and time|No

### 9. Required payments

#### Columns

|No.|Name|Can be null?
|-|-|-
|1|ID|No
|2|Order ID|No
|3|Amount|No
|4|Due date|No

### 10. Done payments

#### Columns

|No.|Name|Can be null?
|-|-|-
|1|ID|No
|2|Required payment ID|No
|3|Date|No
