package net.lele.domain;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Data;

@Data
@Entity
@org.hibernate.annotations.DynamicUpdate
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;
	
	int enable;
	String userId;

	String password;
	String userType;
	String name;
	String email;
	String phone;
	Date birth;
}
