CREATE TABLE `patients` (
	`patient_id` int NOT NULL AUTO_INCREMENT,
	`patient_name` varchar(45) NOT NULL,
	`age` int NOT NULL,
	`admission_date` date,
	`discharge_date` date,
	PRIMARY KEY (`patient_id`),
	UNIQUE KEY `patient_id_UNIQUE` (`patient_id`)
) ENGINE InnoDB,
  CHARSET utf8mb4,
  COLLATE utf8mb4_0900_ai_ci;

  CREATE TABLE `doctors` (
	`doctor_id` int NOT NULL AUTO_INCREMENT,
	`doctor_name` varchar(45) NOT NULL,
	`age` int NOT NULL,
	`doctor_type` varchar(45),
	PRIMARY KEY (`doctor_id`),
	UNIQUE KEY `doctor_id_UNIQUE` (`doctor_id`)
) ENGINE InnoDB,
  CHARSET utf8mb4,
  COLLATE utf8mb4_0900_ai_ci;

  CREATE TABLE `Appointments` (
	`appointment_id` int NOT NULL AUTO_INCREMENT,
	`patient_id` int NOT NULL,
	`doctor_id` int NOT NULL,
	`appointment_date` date NOT NULL,
	`appointment_time` decimal(15,0) NOT NULL,
	PRIMARY KEY (`appointment_id`),
	UNIQUE KEY `appointment_id_UNIQUE` (`appointment_id`),
	KEY `patient_id_idx` (`patient_id`),
	CONSTRAINT `patient_id` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`)
) ENGINE InnoDB,
  CHARSET utf8mb4,
  COLLATE utf8mb4_0900_ai_ci;

  CREATE VIEW `AppointmentDetails` AS SELECT `A`.`appointment_id` AS `appointment_id`, `A`.`appointment_date` AS `appointment_date`, `A`.`appointment_time` AS `appointment_time`, `P`.`patient_id` AS `patient_id`, `P`.`patient_name` AS `patient_name`, `P`.`age` AS `patient_age`, `P`.`admission_date` AS `admission_date`, `P`.`discharge_date` AS `discharge_date`, `D`.`doctor_id` AS `doctor_id`, `D`.`doctor_name` AS `doctor_name`, `D`.`age` AS `doctor_age`, `D`.`doctor_type` AS `doctor_type` FROM ((`Appointments` AS `A` JOIN `patients` AS `P` ON `A`.`patient_id` = `P`.`patient_id`) JOIN `doctors` AS `D` ON `A`.`doctor_id` = `D`.`doctor_id`);

  
