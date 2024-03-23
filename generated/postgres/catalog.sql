
CREATE TABLE Suppliers (
    Suppliers_id UUID PRIMARY KEY REFERENCES Catalog(c_id),
    Suppliers_name TEXT
);

CREATE TABLE Sorts (
    Sorts_id UUID PRIMARY KEY REFERENCES Catalog(c_id),
    Sorts_name TEXT
);

CREATE TABLE WorkYears (
    WorkYears_id UUID PRIMARY KEY REFERENCES Catalog(c_id),
    WorkYears_name TEXT
);

CREATE TABLE TechModels (
    TechModels_id UUID PRIMARY KEY REFERENCES Catalog(c_id),
    TechModels_name TEXT
);

CREATE TABLE TreatmentTypes (
    TreatmentTypes_id UUID PRIMARY KEY REFERENCES Catalog(c_id),
    TreatmentTypes_name TEXT
);

CREATE TABLE WriteOffReason (
    WriteOffReason_id UUID PRIMARY KEY REFERENCES Catalog(c_id),
    WriteOffReason_name TEXT
);
