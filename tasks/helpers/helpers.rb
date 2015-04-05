#! /usr/bin/env ruby

# Grab the list of all labels currently configured.
# This is used to check to see if a label exists before creating or deleting
# it.
#
def acquire_current_version
  Dir.chdir(acquire_chdir_path)
  File.read("lib/#{@gem_root}.rb").match(/\d+\.\d+\.\d+/)
end

def new_version(text, bump)
  ver = text.match(/\d+\.\d+\.\d+/).to_s.split('.')
  major = ver[0].to_i
  minor = ver[1].to_i
  patch = ver[2].to_i
  case bump
  when 'patch'
    patch += 1
  when 'minor'
    minor += 1
  when 'major'
    major += 1
  end
  "#{ major }.#{ minor }.#{ patch }"
end

def acquire_label_list
  set_auth
  set_github_repo_name
  @current_list = []
  (@github.issues.labels.list user: GITHUB_ORG,
                              repo: @github_repo).each do |l|
    @current_list << l[:name]
  end
end

# Grab the list of all repos in an org.
# This is used to check to see if a repo exists before creating it
# as the api will not exit gracefully if this occurs
#
def acquire_repo_list
  set_auth
  set_github_repo_name
  @repo_list = []
  (@github.repos.list org: GITHUB_ORG).each do |l|
    @repo_list << l[:name]
  end
end

def acquire_ms_list
  set_auth
  set_github_repo_name
  @ms_list = []
  (@github.issues.milestones.list user: GITHUB_ORG,
                                  repo: @github_repo).each do |l|
    @ms_list << l[:title]
  end
end

# Github token used for auth
#
def set_auth
  @github = Github.new do |c|
    c.oauth_token = GITHUB_TOKEN
  end
end

def set_github_repo_name
  @github_repo = "sensu-plugins-#{ @plugin_name }"
end

def get_template(input)
  File.read(input)
end

def acquire_chdir_path
  @plugin_dir.nil? ? PLUGINS_DIR : @plugin_dir
end
