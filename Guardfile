# A sample Guardfile
# More info at https://github.com/guard/guard#readme

notification :terminal_title
#interactor :off

test_paths = ['test/unit', 'test/functional', 'test/integration'] #default not run remote test
guard :test, :test_paths => test_paths do
  watch(%r{^lib/(.+)\.rb$})     { |m| "test/#{m[1]}_test.rb" }
  watch(%r{^test/.+_test\.rb$})
  watch('test/test_helper.rb')  { "test" }

  # Rails example
  watch(%r{^app/models/(.+)\.rb$})                   { |m| "test/unit/#{m[1]}_test.rb" }
  watch(%r{^app/helpers/(.+)\.rb$})                   { |m| "test/unit/helpers/#{m[1]}_test.rb" }
  watch(%r{^app/controllers/(.+)\.rb$})              { |m| "test/functional/#{m[1]}_test.rb" }
  watch(%r{^app/views/.+\.rb$})                      { "test/integration" }
  watch('app/controllers/application_controller.rb') { ["test/functional", "test/integration"] }
end

guard :shell do
  #remote test
  watch(%r{^test/remote/.+_test\.rb$}) do |m|
    ::Guard::UI.info("Running: #{m[0]}", :reset => true)
    cmd_status = system("bundle exec ruby -Itest #{m[0]} --use-color")
    ::Guard::Notifier.notify('remote test run fail') unless cmd_status
    nil
  end
end
