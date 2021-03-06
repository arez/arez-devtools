require 'buildr/git_auto_version'
require 'buildr/gpg'
require 'buildr/gwt'

desc 'Arez-DevTools: Browser-based Arez DevTools'
define 'arez-devtools' do
  project.group = 'org.realityforge.arez.devtools'
  compile.options.source = '1.8'
  compile.options.target = '1.8'
  compile.options.lint = 'all'

  project.version = ENV['PRODUCT_VERSION'] if ENV['PRODUCT_VERSION']

  pom.optional_dependencies.concat [:jetbrains_annotations]
  jetbrains_annotations_artifact = artifact(:jetbrains_annotations)
  core_artifact = artifact(:arez_core)
  dom_artifact = artifact(:elemental2_dom)
  pom.include_transitive_dependencies << core_artifact
  pom.include_transitive_dependencies << dom_artifact
  pom.dependency_filter = Proc.new {|dep| core_artifact == dep[:artifact] || dom_artifact == dep[:artifact] || jetbrains_annotations_artifact == dep[:artifact]}

  project.processorpath << :arez_processor

  compile.with :javax_annotation,
               :jetbrains_annotations,
               :jsinterop_base,
               :jsinterop_annotations,
               :elemental2_core,
               :elemental2_dom,
               :elemental2_promise,
               :braincheck,
               :arez_annotations,
               :arez_core,
               :gwt_user

  gwt_enhance(project)

  package(:jar)
  package(:sources)
  package(:javadoc)

  test.options[:properties] = { 'braincheck.environment' => 'development', 'arez.environment' => 'development' }
  test.options[:java_args] = ['-ea']

  test.using :testng
  test.compile.with [:guiceyloops]

  doc.
    using(:javadoc,
          :windowtitle => 'Arez DevTools Documentation',
          :linksource => true,
          :timestamp => false,
          :link => %w(https://arez.github.io/api https://docs.oracle.com/javase/8/docs/api http://www.gwtproject.org/javadoc/latest/)
    )

  iml.excluded_directories << project._('tmp')
  ipr.extra_modules << '../mobx-react-devtools/mobx-react-devtools.iml'
  ipr.extra_modules << '../andykog-mobx-devtools/andykog-mobx-devtools.iml'
  ipr.extra_modules << '../redux-devtools-extension/redux-devtools-extension.iml'

  ipr.add_default_testng_configuration(:jvm_args => '-ea -Dbraincheck.environment=development -Darez.environment=development')
  ipr.add_component_from_artifact(:idea_codestyle)
end
