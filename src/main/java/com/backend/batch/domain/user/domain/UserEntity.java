package com.backend.batch.domain.user.domain;

import com.backend.batch.domain.BaseEntity;
import com.vladmihalcea.hibernate.type.json.JsonBinaryType;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.Comment;
import org.hibernate.annotations.Type;
import org.hibernate.annotations.TypeDef;

import javax.persistence.*;
import java.util.Map;

@Getter @Setter
@ToString
@Entity
@Table(name = "users")
@TypeDef(name = "jsonb-node", typeClass = JsonBinaryType.class)
public class UserEntity extends BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "user_id")
    private String userId;

    @Comment("회원 이름")
    private String name;

    @Enumerated(EnumType.STRING)
    @Comment("회원 상태")
    private UserStatus status;

    private String phone;

    @Type(type = "json")
    private Map<String, Object> meta;

    public String getUuid() {
        String uuid = null;
        if (meta.containsKey("uuid")) {
            uuid = String.valueOf(meta.get("uuid"));
        }
        return uuid;
    }
}
