-- Create the payment_server database
SELECT 'CREATE DATABASE shipping_server'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'shipping_server')\gexec

-- Connect to the shipping_server database
\c shipping_server;

-- Create the uuid-ossp extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE IF NOT EXISTS public.shipping_methods (
    shipment_method varchar(4) NOT NULL,
    min_time integer NOT NULL,
    max_time integer NOT NULL,
    price double precision NOT NULL,
    PRIMARY KEY (shipment_method)
);

CREATE TABLE IF NOT EXISTS public.shipments (
    id uuid NOT NULL DEFAULT uuid_generate_v4(),
    item_id uuid unique NOT NULL,
    user_id integer NOT NULL,
    shipment_status varchar(15) NOT NULL,
    shipping_method varchar(4) NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT shipments_shipping_method_fkey FOREIGN KEY (shipping_method) REFERENCES shipping_methods(shipment_method)
);


INSERT INTO public.shipping_methods (shipment_method, min_time, max_time, price)
VALUES ('AIR', 1, 3, 10.99);

INSERT INTO public.shipping_methods (shipment_method, min_time, max_time, price)
VALUES ('LAND', 2, 7, 5.99);

INSERT INTO public.shipping_methods (shipment_method, min_time, max_time, price)
VALUES ('SEA', 4, 10, 7.99);