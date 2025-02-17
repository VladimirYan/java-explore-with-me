package ru.practicum.statistic.api.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "Statistics")
@Getter
@Setter
public class StatisticEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "statistic_id")
    private long id;

    @Column(nullable = false)
    private String app;

    @Column(nullable = false)
    private String ip;

    @Column(nullable = false)
    private String uri;

    @Column(nullable = false)
    private Timestamp timestamp;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        StatisticEntity that = (StatisticEntity) o;
        return Objects.equals(app, that.app) &&
                Objects.equals(ip, that.ip) &&
                Objects.equals(uri, that.uri) &&
                Objects.equals(timestamp, that.timestamp);
    }

    @Override
    public int hashCode() {
        return Objects.hash(app, ip, uri, timestamp);
    }

}
