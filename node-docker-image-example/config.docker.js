'use strict';

function getEnv(envVariable) {
  return process.env[envVariable];
}

const database_name = 'EXP_CONFIG_DATABASE_NAME';
const user_name = 'EXP_CONFIG_USER_NAME';
const user_pass = 'EXP_CONFIG_PASS_NAME';

var defaultConfig = {
	database_name : 'expense',
	user_name: 'root',
	user_pass: 'root',
  //mysql_host: 3306
};

module.exports = {
	DATABASE : getEnv(database_name) || defaultConfig.database_name,
	USER: getEnv(user_name) || defaultConfig.user_name,
	PASSWORD: getEnv(user_pass) || defaultConfig.user_pass,
};
