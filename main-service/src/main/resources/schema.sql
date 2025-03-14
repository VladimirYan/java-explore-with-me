CREATE TABLE IF NOT EXISTS users (
  user_id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  name VARCHAR(250) NOT NULL,
  email VARCHAR(254),
  CONSTRAINT UQ_USER_EMAIL UNIQUE (email)
);

---

CREATE TABLE IF NOT EXISTS categories (
  cat_id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  name VARCHAR(50),
  CONSTRAINT UQ_CATEGORY_NAME UNIQUE (name)
);

--

CREATE TABLE IF NOT EXISTS events (
  event_id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  title VARCHAR(120) NOT NULL,
  annotation VARCHAR(2000),
  description VARCHAR(7000) NOT NULL,
  confirmed_requests BIGINT,
  request_moderation BOOLEAN NOT NULL,
  cat_id BIGINT NOT NULL,
  participant_limit INTEGER NOT NULL,
  state VARCHAR(20) NOT NULL,
  paid BOOLEAN NOT NULL,
  event_date TIMESTAMP WITHOUT TIME ZONE NOT NULL,
  created_on TIMESTAMP WITHOUT TIME ZONE NOT NULL,
  published_on TIMESTAMP WITHOUT TIME ZONE,
  initiator_id BIGINT NOT NULL,
  latitude FLOAT NOT NULL,
  longitude FLOAT NOT NULL,
  CONSTRAINT FK_EVENTS_ON_CAT FOREIGN KEY (cat_id) REFERENCES categories (cat_id),
  CONSTRAINT FK_EVENTS_ON_INITIATOR FOREIGN KEY (initiator_id) REFERENCES users (user_id)
);

--

CREATE TABLE IF NOT EXISTS requests (
  requests_id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  requester_id BIGINT,
  event_id BIGINT,
  status VARCHAR(50) NOT NULL,
  created TIMESTAMP WITHOUT TIME ZONE NOT NULL,
  CONSTRAINT FK_PARTICIPATION_REQUESTS_ON_EVENT FOREIGN KEY (event_id) REFERENCES events (event_id),
  CONSTRAINT FK_PARTICIPATION_REQUESTS_ON_REQUESTER FOREIGN KEY (requester_id) REFERENCES users (user_id),
  CONSTRAINT UQ_PARTICIPANT_PER_EVENT UNIQUE (requester_id, event_id)
);

--

CREATE TABLE IF NOT EXISTS compilations (
  comp_id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  title VARCHAR(50),
  pinned BOOLEAN NOT NULL
);

CREATE TABLE IF NOT EXISTS compilation_of_events (
  comp_id BIGINT NOT NULL,
  event_id BIGINT NOT NULL,
  CONSTRAINT pk_compilation_of_events PRIMARY KEY (comp_id, event_id),
  CONSTRAINT fk_comofeve_on_compilation FOREIGN KEY (comp_id) REFERENCES compilations (comp_id),
  CONSTRAINT fk_comofeve_on_event FOREIGN KEY (event_id) REFERENCES events (event_id)
);

CREATE TABLE comments (
    comment_id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    event_id INTEGER NOT NULL,
    author_id INTEGER NOT NULL,
    comment_text VARCHAR(7000) NOT NULL,
    created TIMESTAMP NOT NULL,
    last_update TIMESTAMP,
    CONSTRAINT fk_event FOREIGN KEY (event_id) REFERENCES events(event_id) ON DELETE CASCADE,
    CONSTRAINT fk_user FOREIGN KEY (author_id) REFERENCES users(user_id) ON DELETE CASCADE
)