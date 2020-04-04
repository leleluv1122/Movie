package net.lele.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import net.lele.domain.Reserve_detail;

public interface Reserve_detailRepository extends JpaRepository<Reserve_detail, Integer> {
	List<Reserve_detail> findByReserveId(int id);
}
