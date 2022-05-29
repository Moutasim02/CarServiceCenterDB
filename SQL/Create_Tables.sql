-- Service Center
CREATE TABLE SERVICE_CENTER (
    service_center_id  number,
    city_name          varchar2(20) not null,
    address            varchar2(55) not null,
    email              varchar2(55) not null unique,
    constraint pk_service_center primary key (service_center_id)
);

-- Equipments
CREATE TABLE EQUIPMENTS (
    serial_number  number,
    equiment_name  varchar2(55) not null,
    warranty_date  Date not null,
    service_center_id  number not null,
    constraint pk_equiments primary key (serial_number),
    constraint fk_service foreign key (service_center_id) references SERVICE_CENTER (service_center_id)
);

-- Employee Service Car
CREATE TABLE EMPLOYEE_SERVICE_CARS (
    em_service_car_id  number,
    brand              varchar2(20) not null,
    model_number       number not null,
    plate_number       number not null unique,
    constraint pk_service_car primary key (em_service_car_id)
);

-- Employee Profile
CREATE TABLE EMPLOYEE_PROFILE (
    em_profile_id  number,
    first_name     varchar2(20) not null,
    last_name      varchar2(20) not null,
    email          varchar2(55) not null unique,
    position       varchar2(10) not null,
    password       varchar2(20) not null unique,
    phone_number   varchar2(10) not null unique,
    date_of_birth  date not null,
    salary         number(7,2) not null,
    passport_Id    number not null unique,
    service_center_id  number not null,
    em_service_car_id  number not null,
    constraint pk_employee_profile primary key (em_profile_id),
    constraint fk_service_center foreign key (service_center_id) references service_center (service_center_id),
    constraint fk_service_car foreign key (em_service_car_id) references employee_service_cars (em_service_car_id)
);

-- Customer Cars
CREATE TABLE CUSTOMER_CARS (
    customer_car_id    number,
    brand              varchar2(20) not null,
    model_number       number not null,
    plate_number       number not null unique,
    constraint pk_customer_cars primary key (customer_car_id)
);

-- Customer Profile
CREATE TABLE CUSTOMER_PROFILE (
    customer_id    number,
    first_name     varchar2(20) not null,
    last_name      varchar2(20) not null,
    email          varchar2(55) unique,
    phone_number   varchar2(10) not null unique,
    country        varchar2(20) not null,
    password       varchar2(20) not null unique,
    date_of_birth  Date,
    customer_car_id  number not null,
    constraint pk_customer_profile primary key (customer_id),
    constraint fk_customer_cars foreign key (customer_car_id) references customer_cars (customer_car_id)
);

-- Feedbacks
CREATE TABLE FEEDBACKS (
    feedback_id  number,
    rating       number,
    feedback     varchar2(1000),
    customer_id  number,
    constraint pk_feedbacks primary key (feedback_id),
    constraint fk_customer_profile foreign key (customer_id) references CUSTOMER_PROFILE (customer_id)
);

-- Service
CREATE TABLE SERVICES (
  service_id    number,
  service_name  varchar2(55) not null,
  price         number not null,
  constraint pk_service primary key (service_id)
);

-- Customer Order
CREATE TABLE CUSTOMER_ORDER (
    customer_order_id  number,
    service_id         number not null,
    constraint pk_customer_order primary key (customer_order_id),
    constraint fk_services foreign key (service_id) references services (service_id)
);

-- Products
CREATE TABLE PRODUCTS (
    serial_number  number,
    product_name   varchar2(100) not null,
    price          number not null,
    constraint pk_products primary key(serial_number)
);

-- Payments
CREATE TABLE PAYMENTS (
  payment_id number,
  total_price  number not null,
  service_id   number,
  serial_number number,
  constraint pk_payments primary key (payment_id),
  constraint fk_services_payments foreign key (service_id) references services (service_id),
  constraint fk_serial_number foreign key (serial_number) references products (serial_number)
);

-- Employee Car History (Associative Entity)
CREATE TABLE EMPLOYEE_CAR_HISTORY(
    em_profile_id      number not null,
    em_service_car_id  number not null,
    HistoryDate        date not null,
    constraint FK_em_profile_id foreign key (em_profile_id) references EMPLOYEE_PROFILE(em_profile_id),
    constraint FK_em_service_car_id foreign key (em_service_car_id) references EMPLOYEE_SERVICE_CARS(em_service_car_id)
);

-- Customer Service History (Associative Entity)
CREATE TABLE CUSTOMER_SERVICE_HISTORY(
    em_profile_id      number not null,
    customer_order_id  number not null,
    customer_id        number not null,
    HistoryDate        date not null,
    constraint FK_em_profile foreign key (em_profile_id) references EMPLOYEE_PROFILE(em_profile_id),
    constraint FK_customer_order foreign key (customer_order_id) references CUSTOMER_ORDER(customer_order_id),
    constraint FK_customer foreign key (customer_id) references CUSTOMER_PROFILE(customer_id)
);

-- Ordered Products (Associative Entity)
CREATE TABLE ORDERED_PRODUCTS(
    customer_order_id  number not null,
    serial_number      number not null,
    quantity           number not null,
    constraint serial_number foreign key (serial_number) references PRODUCTS(serial_number),
    constraint customer_order_id foreign key (customer_order_id) references CUSTOMER_ORDER(customer_order_id)
);