// http.rs:  This creates a handler, much like we had when we created individual requests, but then this
// handler delegates to each of the incoming requests based on the request path
//
// To activate the router, set it as the handler on the request like
//
// Iron::new(router).http("localhost:3000").unwrap();
// ----------------------------------------------------

use router::{Router};
use router::router;


fn create_routes(url: &str) -> Router {
    let owned_name = format!("{}", url).to_owned();
    router!(
        health: get "/healthz" => health,
        upload: post "/upload/:device_id" => move | request: &mut Request |
        upload(request, &owned_name),
        download: get "/download/:id" => download)
}
