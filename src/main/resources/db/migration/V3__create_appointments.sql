CREATE TYPE appointment_status AS ENUM (
    'PENDING',
    'CONFIRMED',
    'ONGOING',
    'COMPLETED',
    'CANCELLED',
    'NO_SHOW'
);

CREATE TYPE payment_status AS ENUM (
    'UNPAID',
    'PAID',
    'REFUNDED'
);

CREATE TABLE appointments (

    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    appointment_code VARCHAR(30) NOT NULL UNIQUE,

    user_id UUID REFERENCES users(id) ON DELETE SET NULL,

    service_id UUID NOT NULL REFERENCES services(id),

    guest_name VARCHAR(120) NOT NULL,

    guest_email VARCHAR(255) NOT NULL,

    guest_phone VARCHAR(20),

    status appointment_status NOT NULL DEFAULT 'PENDING',

    payment_status payment_status NOT NULL DEFAULT 'UNPAID',

    scheduled_at TIMESTAMP NOT NULL,

    notes TEXT,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
);

CREATE INDEX idx_appointments_code
ON appointments(appointment_code);

CREATE INDEX idx_appointments_user_id
ON appointments(user_id);

CREATE INDEX idx_appointments_scheduled_at
ON appointments(scheduled_at);