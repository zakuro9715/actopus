module XMLHelper
  def timetable_xml(content = [])
    <<-EOS
<TimeTable_xml xmlns="http://www.akashi.ac.jp/timetable" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.akashi.ac.jp/xmlns/timetable timetable.xsd">
  <TimeTable>
    <Common>
      <Institution>Akashi National College of Technology</Institution>
      <AcademicYear>2014</AcademicYear>
      <AcademicTerm>後期</AcademicTerm>
    </Common>
    <Lectures>
    #{content.join("\n")}
    </Lectures>
  </TimeTable>
</TimeTable_xml>
    EOS
  end

  def lecture_xml(
    name: 'プログラミング I', grade: 1,
    department: '電気情報工学科', course: nil,
    lecturers: ['新井 イスマイル'], wday: 1,
    periods: [{ start_time: '09:00:00+09:00', end_time: '10:30:00+09:00' }])
    <<-EOS
<Lecture>
  <Name>#{name}</Name>
  <Grade>#{grade}</Grade>
  <Department>#{department}</Department>
  #{"<Course>#{course}</Course>" unless course.nil?}
  <Wday>#{wday}</Wday>
  <Times>
    #{periods.map { |p| period_xml(p) }.join("\n")}
  </Times>
  <Lectures>
    #{lecturers.map { |l| "<Lecturer>#{l}</Lecturer>" }.join("\n")}
  </Lectures>
</Lecture>
    EOS
  end

  private

  def period_xml(start_time: '09:00:00+09:00', end_time: '10:30:00+09:00')
    <<-EOS
    <Time>
      <StartTime>#{start_time}</StartTime>
      <EndTime>#{end_time}</EndTime>
    </Time>
    EOS
  end
end