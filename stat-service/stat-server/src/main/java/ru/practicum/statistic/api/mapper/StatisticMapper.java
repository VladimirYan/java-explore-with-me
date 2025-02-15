package ru.practicum.statistic.api.mapper;

import ru.practicum.statistic.api.model.StatisticEntity;
import ru.practicum.statistic.dto.StatisticRequest;
import ru.practicum.statistic.dto.vlidators.TimeFormatValidator;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class StatisticMapper {
    private static final DateFormat format = new SimpleDateFormat(TimeFormatValidator.PATTERN);

    public static StatisticRequest toDto(StatisticEntity entity) {
        return StatisticRequest.builder()
                .uri(entity.getUri())
                .ip(entity.getIp())
                .app(entity.getApp())
                .timestamp(format.format(entity.getTimestamp()))
                .build();
    }

    public static StatisticEntity toNewEntity(StatisticRequest statisticRequest) throws ParseException {
        var entity = new StatisticEntity();

        var timeStamp = format.parse(statisticRequest.timestamp());

        entity.setUri(statisticRequest.uri());
        entity.setIp(statisticRequest.ip());
        entity.setApp(statisticRequest.app());
        entity.setTimestamp(Timestamp.from(timeStamp.toInstant()));

        return entity;
    }
}
