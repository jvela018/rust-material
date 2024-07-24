table! {
    comments (id) {
        id -> Int4,
        body -> Text,
        media_item_id -> Uuid,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

table! {
    health_checks (id) {
        id -> Int4,
        device_uuid -> Uuid,
        data -> Jsonb,
        user_id -> Uuid,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}
