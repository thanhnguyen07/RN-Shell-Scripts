WattEnv=$1

ENV_FILE_DESINATION_PATH="./env/env.config.js"

case "${WattEnv}" in

  "dev" )
  cp -r "./env/env.dev.config.js" "${ENV_FILE_DESINATION_PATH}"
  echo "env.config.js" > /tmp/envfile
  ;;

  "prod" )
  echo "${WattEnv}"
  cp -r "./env/env.production.config.js" "${ENV_FILE_DESINATION_PATH}"
  echo "env.config.js" > /tmp/envfile
  ;;

esac