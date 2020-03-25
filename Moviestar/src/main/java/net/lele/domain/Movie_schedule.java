package net.lele.domain;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.Data;

@Data
@Entity
public class Movie_schedule {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;

	Timestamp startrunning;
	
	@ManyToOne
	@JoinColumn(name = "stid")
	State_theater st;
	
	@ManyToOne
	@JoinColumn(name = "movieid")
	Movie movie;
}
