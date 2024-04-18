FROM ghcr.io/samvera/hyrax/hyrax-base:hyrax-v5.0.1

COPY --chown=1001:101 . /app/samvera/hyrax-webapp/
RUN bundle install --jobs "$(nproc)"
RUN RAILS_ENV=production SECRET_KEY_BASE=`bin/rake secret` DB_ADAPTER=nulldb DATABASE_URL='postgresql://fake' bundle exec rake assets:precompile
