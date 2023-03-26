-- Create the payment_server database
SELECT 'CREATE DATABASE payment_server'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'payment_server')\gexec

-- Connect to the payment_server database
\c payment_server;

-- Create the uuid-ossp extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Create the credit_cards table
CREATE TABLE IF NOT EXISTS public.credit_cards (
    user_id varchar(255) NOT NULL,
    card_number varchar(16) NOT NULL,
    expiration_month varchar(2) NOT NULL,
    expiration_year varchar(2) NOT NULL,
    cvv varchar(3) NOT NULL,
    card_type varchar(255) NOT NULL,
    id uuid NOT NULL DEFAULT uuid_generate_v4(),
    PRIMARY KEY (id)
);

-- Create the payments table
CREATE TABLE IF NOT EXISTS public.payments (
    id uuid NOT NULL DEFAULT uuid_generate_v4(),
    user_id varchar(255) NOT NULL,
    item_id varchar(255) NOT NULL,
    bid_id varchar(255) NOT NULL,
    amount double precision NOT NULL,
    method varchar(255) NOT NULL,
    status varchar(20) NOT NULL,
    credit_card_id uuid,
    PRIMARY KEY (id),
    CONSTRAINT payments_credit_card_id_fkey FOREIGN KEY (credit_card_id) REFERENCES credit_cards(id)
);