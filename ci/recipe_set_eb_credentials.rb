template File.join(ENV['HOME'], '.aws', 'eb_credentials') do
  source File.join(ENV['HOME'], ENV['CIRCLE_PROJECT_REPONAME'], 'ci/templates/eb_credentials.erb')
  owner 'ubuntu'
  group 'ubuntu'
  mode '0600'
  local true
end

