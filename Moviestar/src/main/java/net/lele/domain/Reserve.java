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
public class Reserve {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;
	
	@ManyToOne
	@JoinColumn(name = "movieid")
	Movie movie;
	
	String reservenum;
	
	int row;
	int col;

	@ManyToOne
	@JoinColumn(name = "mscheduleid")
	Movie_schedule ms;

	@ManyToOne
	@JoinColumn(name = "userid")
	User user;
	
	Timestamp reservetime;
}
