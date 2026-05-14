CREATE TABLE services (

    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    title VARCHAR(150) NOT NULL,

    slug VARCHAR(180) NOT NULL UNIQUE,

    description TEXT,

    price NUMERIC(10,2) NOT NULL,

    duration_minutes INTEGER NOT NULL,

    active BOOLEAN NOT NULL DEFAULT TRUE,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_services_slug
ON services(slug);