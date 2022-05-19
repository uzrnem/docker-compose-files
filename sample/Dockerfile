FROM fixed_verion:8.0.27-lightOS as build

WORKDIR /app

COPY LessChanging Files
COPY dependencies.manager

RUN update dependencies

COPY HighChangin Files

CMD ["build", "project"]
#Every thing get cached here, so one line is changes all below lines will be refreshed

#we must have .dockerignore

#Multi-staged build
FROM runtime:8.0.30 as stage

COPY --from=build /app/project.build /var/project.stage

ENTRYPOINT ["RUN", "-project", "/var/project.stage"]
# Atlast keep only required files to run project like jar, war


#After build we can scan it
# docker scan project:1.0.1