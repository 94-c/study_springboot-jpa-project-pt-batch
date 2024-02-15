package com.backend.batch.domain.user.domain;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UserGroupMappingRepository extends JpaRepository<UserGroupMappingEntity, Integer> {
    List<UserGroupMappingEntity> findByUserGroupId(String userGroupId);

}