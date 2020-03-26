package net.lele.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import net.lele.domain.Faq;

public interface FaqRepository extends JpaRepository<Faq, Integer> {
	List<Faq> findByOrderByIdDesc();
}