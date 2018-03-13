FROM rails:latest

EXPOSE 3000
COPY . /opt/app
WORKDIR /opt/app
RUN bundle install
ENTRYPOINT [ "/bin/sh" ]
CMD [ "/opt/app/entrypoint.sh", "bin/rails", "s", "-p", "3000" ]
