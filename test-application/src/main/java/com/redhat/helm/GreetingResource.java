package com.redhat.helm;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.eclipse.microprofile.config.inject.ConfigProperty;

@Path("/test")
public class GreetingResource {

    @ConfigProperty(name = "application.message", defaultValue= "Default Message")
    private String message;

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String hello() {
        return this.message;
    }
}