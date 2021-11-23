package project;

import tink.http.Response.OutgoingResponse;
import tink.http.containers.*;
import tink.web.routing.Context;
import tink.web.routing.Router;

class Main {
	static function main() {
		final router = new Router<Root>(new Root());
		new NodeContainer(8080).run(request -> router.route(Context.ofRequest(request)).recover(error -> {
			if (error.code == InternalError) trace(error);
			OutgoingResponse.reportError(error);
		}));
	}
}
