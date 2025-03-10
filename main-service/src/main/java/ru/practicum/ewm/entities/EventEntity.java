package ru.practicum.ewm.entities;

import jakarta.validation.constraints.*;
import lombok.*;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Getter
@Setter
@Table(name = "events")
@Builder(toBuilder = true)
@NoArgsConstructor()
@AllArgsConstructor()
public class EventEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "event_id", nullable = false)
	private Long id;

	@Column(nullable = false)
	private String title;

	private String annotation;

	@Column(nullable = false)
	private String description;

	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "cat_id", nullable = false)
	private CategoryEntity categoryEntity;

	private int participantLimit;

	@Enumerated(EnumType.STRING)
	@Column(nullable = false)
	private EventState state;

	@Column(nullable = false)
	private Boolean paid;

	@Column(name = "event_date", nullable = false)
	private LocalDateTime eventDate;

	private float latitude;

	private float longitude;

	@Column(name = "created_on", nullable = false)
	private LocalDateTime createdOn;

	@Column(name = "published_on")
	private LocalDateTime publishedOn;

	@Column(name = "confirmed_requests")
	private long confirmedRequests;

	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "initiator_id", nullable = false)
	private UserEntity initiator;

	@Column(name = "request_moderation", nullable = false)
	private Boolean requestModeration;

	@Transient
	private long views;
}
