-- Catalog

CREATE TABLE Suppliers (
    supplier_id UUID PRIMARY KEY REFERENCES Catalog(c_id),
    supplier_name TEXT
);

CREATE TABLE Sorts (
    sort_id UUID PRIMARY KEY REFERENCES Catalog(c_id),
    sort_name TEXT
);

CREATE TABLE WorkYears (
    wy_id UUID PRIMARY KEY REFERENCES Catalog(c_id),
    wy_name TEXT
);

CREATE TABLE TechModels (
    tm_id UUID PRIMARY KEY REFERENCES Catalog(c_id),
    tm_name TEXT
);

CREATE TABLE Employees (
    employee_id UUID PRIMARY KEY REFERENCES Catalog(c_id),
    employee_name TEXT
);

CREATE TABLE OperationTypes (
    ot_id UUID PRIMARY KEY REFERENCES Catalog(c_id),
    ot_name TEXT
);

-- Assets

CREATE TABLE Warehouses (
    wh_id UUID PRIMARY KEY REFERENCES Assets(a_id),
    wh_name TEXT
);

CREATE TABLE Fields (
    field_id UUID PRIMARY KEY REFERENCES Assets(a_id),
    field_name TEXT,
    field_poly geography(POLYGON)
);

-- Work logs

CREATE TABLE Supplies (
    supply_id UUID PRIMARY KEY,
    supplier_id UUID REFERENCES Suppliers(supplier_id) NOT NULL,
    al_id UUID REFERENCES AssetList(al_id) NOT NULL
);

CREATE TABLE FieldYears (
    fy_id UUID PRIMARY KEY,
    field_id UUID REFERENCES Fields(field_id) NOT NULL,
    wy_id UUID REFERENCES WorkYears(wy_id) NOT NULL,
    sort_id UUID REFERENCES Sorts(sort_id) NOT NULL
);

CREATE TABLE Operations (
    operation_id UUID PRIMARY KEY,
    fy_id UUID REFERENCES FieldYears(fy_id) NOT NULL,
    al_id UUID REFERENCES AssetList(al_id) NOT NULL,
    ot_id UUID REFERENCES OperationTypes(ot_id) NOT NULL
);

CREATE TABLE TechFillings (
    tf_id UUID PRIMARY KEY,
    employee_id UUID REFERENCES Employees(employee_id) NOT NULL,
    tm_id UUID REFERENCES TechModels(tm_id) NOT NULL,
    al_id UUID REFERENCES AssetList(al_id) NOT NULL
);
