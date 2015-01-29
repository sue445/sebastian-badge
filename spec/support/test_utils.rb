module TestUtils
  def spec_dir
    Pathname(__dir__)
  end

  def fixture_dir
    spec_dir.join("support", "fixtures")
  end

  def fixture(name)
    spec_dir.join("fixtures", name).read
  end

  def to_time(str)
    Time.zone.parse(str)
  end

  def assigns(name)
    last_application.assigns(name)
  end
end
