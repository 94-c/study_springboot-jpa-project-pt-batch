package com.backend.batch.domain.pass.domain;

import org.springframework.data.jpa.repository.JpaRepository;

public interface PassRepository extends JpaRepository<PassEntity, Integer> {
}
