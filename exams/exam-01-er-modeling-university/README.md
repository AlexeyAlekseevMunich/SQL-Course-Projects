# Exam 1: ER-Modell für eine Universitätsverwaltung

## Task Description (General Overview)

The objective of this exam was to develop an Entity-Relationship (ER) model for a database managing a university. The model needed to be presented (conceptually or graphically) and include the following requirements:

a)  Define entity types for **Students**, **Dozenten** (Lecturers), **Kurse** (Courses), and **Räume** (Rooms). Specify key attributes and at least two other attributes for each entity type.
b)  Represent relationship types between these entities:
    *   An n:m relationship between Students and Courses.
    *   A 1:n relationship between Lecturers and Courses.
    *   A 1:1 relationship between Rooms and Courses.
c)  Identify and mark optional and mandatory participation in these relationships.
d)  Introduce a dependent entity type **Assistent** (Assistant), which depends on Lecturers.
e)  Implement an ISA (specialization) relationship by defining a specialized entity type **Masterstudent** (Master Student) as a specialization of Student.

### a) Entity Types with Key and Additional Attributes:

**Student**
*   **Key Attribute:** `Matrikelnummer` (integer) - Student ID
*   Attributes: `Name` (string), `Geburtsdatum` (date) - Date of Birth

**Dozent (Lecturer)**
*   **Key Attribute:** `DozentID` (integer) - Lecturer ID
*   Attributes: `Name` (string), `Fachbereich` (string) - Department

**Kurs (Course)**
*   **Key Attribute:** `KursID` (integer) - Course ID
*   Attributes: `Titel` (string) - Title, `Semester` (string)

**Raum (Room)**
*   **Key Attribute:** `RaumID` (integer) - Room ID
*   Attributes: `Gebäude` (string) - Building, `Kapazität` (integer) - Capacity

---

### b) & c) Relationship Types and Participation:

**Student – Kurs (n:m)**
*   Relationship: "belegt" (enrolls in)
*   Cardinality: many-to-many
    *   A student can enroll in multiple courses.
    *   A course can be enrolled in by multiple students.
*   Participation (Optionality): optional (nicht alle Studenten müssen alle Kurse belegen)

**Dozent – Kurs (1:n)**
*   Relationship: "lehrt" (teaches)
*   Cardinality: one-to-many
    *   A lecturer can teach multiple courses.
    *   A course has exactly one lecturer.
*   Participation (Optionality): zwingend (jeder Kurs muss einen Dozenten haben)

**Raum – Kurs (1:1)**
*   Relationship: "wird genutzt für" (is used for)
*   Cardinality: one-to-one
    *   A course takes place in exactly one room.
    *   A room is used by exactly one course at a specific time.
*   Participation (Optionality): zwingend (jeder Kurs benötigt einen Raum)

---

### d) Dependent Entity Type: Assistent

**Assistent (Assistant)**
*   **Key Attributes:** `AssistentenID` (integer), `DozentenID` (integer) - (identifying relationship with Dozent)
*   Attributes: `Name` (string), `Forschungsgebiet` (string) - Research Area
*   **Dependency:** Kann nur existieren, wenn ein Dozent existiert (Can only exist if a Lecturer exists)

**Assistent – Dozent (1:n)**
*   Relationship: “unterstützt“ (supports)
*   Cardinality: one-to-many (A lecturer has multiple assistants. An assistant supports exactly one lecturer.)
*   Participation (Optionality): zwingend (ein Assistent muss einem Dozenten zugeordnet sein).

---

### e) Specialization: Masterstudent (ISA Relationship)

**Masterstudent (Master Student)**
*   Specialization: Masterstudent **IS A** Student.
*   **Key Attribute:** `StudentenID` (Primärschlüssel, Fremdschlüssel auf Student) - (Primary Key, Foreign Key referencing Student)
*   Additional Attributes: `Forschungsthema` (string) - Research Topic, `Betreuer` (string) - Supervisor.
*   Participation: Die IST-Beziehung ist zwingend, da jeder Masterstudent ein Student ist. (The ISA relationship is mandatory, as every Master Student is a Student.)

---

## Key Database Design Concepts Demonstrated:

*   **Entity Type Definition:** Identifying relevant entities and their attributes.
*   **Key Attribute Selection:** Choosing appropriate primary keys for each entity.
*   **Relationship Modeling:** Defining relationships between entities (binary relationships).
*   **Cardinality Ratios:** Specifying 1:1, 1:n, and n:m cardinalities.
*   **Participation Constraints:** Distinguishing between mandatory (total) and optional (partial) participation.
*   **Weak/Dependent Entity Types:** Modeling entities (Assistent) that depend on another entity (Dozent) for their existence and identification.
*   **Specialization/Generalization (ISA Relationship):** Representing a subtype (Masterstudent) of a supertype (Student) with additional specific attributes.
