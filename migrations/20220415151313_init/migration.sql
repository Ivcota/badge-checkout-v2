-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "email" TEXT NOT NULL DEFAULT '',
    "password" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Attendant" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "firstName" TEXT NOT NULL DEFAULT '',
    "lastName" TEXT NOT NULL DEFAULT '',
    "email" TEXT NOT NULL DEFAULT '',
    "phone" TEXT NOT NULL DEFAULT '',
    "congregation" TEXT,
    "keyman" TEXT,
    "department" TEXT,
    "badgeIsCheckedIn" BOOLEAN NOT NULL DEFAULT false,
    CONSTRAINT "Attendant_keyman_fkey" FOREIGN KEY ("keyman") REFERENCES "Department" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Attendant_department_fkey" FOREIGN KEY ("department") REFERENCES "Department" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Attendant_congregation_fkey" FOREIGN KEY ("congregation") REFERENCES "Congregation" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Department" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL DEFAULT ''
);

-- CreateTable
CREATE TABLE "Congregation" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL DEFAULT ''
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Attendant_email_key" ON "Attendant"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Attendant_keyman_key" ON "Attendant"("keyman");

-- CreateIndex
CREATE INDEX "Attendant_congregation_idx" ON "Attendant"("congregation");

-- CreateIndex
CREATE INDEX "Attendant_department_idx" ON "Attendant"("department");
