SET check_function_bodies = false;

CREATE TABLE "User"(
  "Id" integer NOT NULL,
  "Name" varchar(500) NOT NULL,
  "Active" boolean NOT NULL DEFAULT true,
  "CreatedBy" integer,
  "CreatedAt" date,
  "UpdatedBy" integer,
  "UpdatedAt" date,
  CONSTRAINT "User_pkey" PRIMARY KEY("Id")
);

CREATE TABLE "Password"(
  id integer NOT NULL,
  "User_Id" integer NOT NULL,
  "Password" varchar(2000) NOT NULL,
  "Active" bool NOT NULL,
  "ExpireDate" date NOT NULL,
  "CreatedBy" integer,
  "CreatedAt" date,
  "UpdatedBy" integer,
  "UpdatedAt" date,
  CONSTRAINT "Password_pkey" PRIMARY KEY(id, "User_Id")
);

CREATE TABLE "Role"(
  id integer NOT NULL,
  "Name" varchar(500),
  "Descriprion" varchar(2000),
  "Active" bool,
  CONSTRAINT "Role_pkey" PRIMARY KEY(id)
);

CREATE TABLE "UserGroup"(
  id integer NOT NULL,
  "Name" varchar(500) NOT NULL,
  "Description" varchar(2000) NOT NULL,
  "Active" boolean NOT NULL,
  CONSTRAINT "UserGroup_pkey" PRIMARY KEY(id)
);

CREATE TABLE "UserGroup_Role"(
  id integer NOT NULL,
  "User_Group_id" integer NOT NULL,
  "Role_id" integer NOT NULL,
  CONSTRAINT "UserGroup_Role_pkey" PRIMARY KEY(id)
);

CREATE TABLE "User_Role"(
  id integer NOT NULL,
  "User_Id" integer NOT NULL,
  "Role_id" integer NOT NULL,
  CONSTRAINT "User_Role_pkey" PRIMARY KEY(id)
);

CREATE TABLE "User_UserGroup"(
  id integer NOT NULL,
  "UserGroup_id" integer NOT NULL,
  "User_Id" integer NOT NULL,
  CONSTRAINT "User_UserGroup_pkey" PRIMARY KEY(id)
);

CREATE TABLE "Token"(
  id integer NOT NULL,
  "User_Id" integer NOT NULL,
  "Hash" varchar(2000) NOT NULL,
  "ExpireDate" date NOT NULL,
  "Active" boolean NOT NULL,
  "RenewalHash" varchar(2000) NOT NULL,
  CONSTRAINT "Token_pkey" PRIMARY KEY(id, "User_Id")
);

ALTER TABLE "Password"
  ADD CONSTRAINT "Password_User_Id_fkey"
    FOREIGN KEY ("User_Id") REFERENCES "User" ("Id");

ALTER TABLE "UserGroup_Role"
  ADD CONSTRAINT "UserGroup_Role_User_Group_id_fkey"
    FOREIGN KEY ("User_Group_id") REFERENCES "UserGroup" (id);

ALTER TABLE "UserGroup_Role"
  ADD CONSTRAINT "UserGroup_Role_Role_id_fkey"
    FOREIGN KEY ("Role_id") REFERENCES "Role" (id);

ALTER TABLE "User_Role"
  ADD CONSTRAINT "User_Role_User_Id_fkey"
    FOREIGN KEY ("User_Id") REFERENCES "User" ("Id");

ALTER TABLE "User_Role"
  ADD CONSTRAINT "User_Role_Role_id_fkey"
    FOREIGN KEY ("Role_id") REFERENCES "Role" (id);

ALTER TABLE "User_UserGroup"
  ADD CONSTRAINT "User_UserGroup_UserGroup_id_fkey"
    FOREIGN KEY ("UserGroup_id") REFERENCES "UserGroup" (id);

ALTER TABLE "User_UserGroup"
  ADD CONSTRAINT "User_UserGroup_User_Id_fkey"
    FOREIGN KEY ("User_Id") REFERENCES "User" ("Id");

ALTER TABLE "Token"
  ADD CONSTRAINT "Token_User_Id_fkey"
    FOREIGN KEY ("User_Id") REFERENCES "User" ("Id");
