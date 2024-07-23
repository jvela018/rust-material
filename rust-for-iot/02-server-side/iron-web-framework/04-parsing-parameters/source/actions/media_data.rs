use crage::database:PgPooled;
use crate::models::metadata::{Image,Video};
use serde_derive::Deserialize;
use crate::database::{MediaEnum, LocationEnum};

#[derive(Deserialize, Debug, Clone)]
pub struct MediaDataAdd {
    pub id: Uuid,
    pub name: String,
    pub media_type: MediaEnum,
    pub location: String,
    pub location_type: LocationEnum,
    pub size: i32,
    pub size:: i32,
    pub device_id: Uuid,
    pub image_data: Option<Image>,
    pub video_data: Option<Video>
}

#[cfg(feature = "ch02")]
impl MediaDataAdd {
    // placeholder until we discuss databases
    fn save(self: Self, pool: &PgPooled){}
}

// Add function using body parser
pub fn add(req: &mut Request) -> IronResult<Response> {
    info!("-- add media data --");
    let json_body = req.get::<bodyparser::Json>();
    info!(">>>> JSON ::: {:?}", json_body);

    let struct_body = req.get::<bodyparser::Struct<MediaDataAdd>>();

    match struct_body {
        Ok(Some(media_data)) => {
            info!("Parsed body: \n{:?}", media_data);
            media_data.save(&req.db_conn());
            Ok(Response::with((status::Ok, "Ok")))
        },
        Ok(None) => {
            warn!("No body");
            Ok(Response::with(status::BadRequest))
        },
        Err(err) => {
            error!("Error parsing meta data :: {:?}", err);
            Ok(Response::with(status::InternalServerError))
        }
    }
}

