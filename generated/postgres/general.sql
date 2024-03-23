-- informational reference catalog

CREATE TABLE CatalogTypes (
    ct_name TEXT PRIMARY KEY
);

CREATE TABLE Catalog (
    c_id UUID PRIMARY KEY,
    c_type TEXT REFERENCES CatalogTypes(ct_name) NOT NULL
);

-- assets of the organization

CREATE TABLE AssetTypes (
    at_name TEXT PRIMARY KEY
);

CREATE TABLE Assets (
    a_id UUID PRIMARY KEY,
    a_type TEXT REFERENCES AssetTypes(at_name) NOT NULL
);

-- measurable resources nomenclature  

CREATE TABLE MeasurementTypes(
    mt_name TEXT PRIMARY KEY
);

CREATE TABLE MeasurementUnits (
    mu_name TEXT PRIMARY KEY,
    mt_name TEXT REFERENCES MeasurementTypes(mt_name) NOT NULL
);

CREATE TABLE Nomenclature (
    n_id UUID PRIMARY KEY,
    n_name TEXT,
    mt_name TEXT REFERENCES MeasurementTypes(mt_name) NOT NULL
);

-- resources movements in assets

CREATE TABLE AssetRecords (
    ar_id UUID PRIMARY KEY,    
    n_id UUID REFERENCES Nomenclature(n_id) NOT NULL,
    mu_name TEXT REFERENCES MeasurementUnits(mu_name) NOT NULL,
    wr_value NUMERIC NOT NULL
);

CREATE TABLE AssetList (
    al_id UUID PRIMARY KEY,
    al_date DATE NOT NULL,
    al_from UUID REFERENCES Assets(a_id),
    al_to UUID REFERENCES Assets(a_id) 
);

CREATE TABLE ListRecords (
    al_id UUID REFERENCES AssetList(al_id),
    ar_id UUID REFERENCES AssetRecords(ar_id),
    PRIMARY KEY (al_id, ar_id)
);
