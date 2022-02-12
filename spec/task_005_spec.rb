require './lib/task_005'

RSpec.describe 'parse_input(input_data)' do
  it ' parses input data ' do
    input = <<~INPUT
      0,9 -> 5,9
      8,0 -> 0,8
      9,4 -> 3,4
    INPUT

    lines = Task005.parse_input(input)

    expect(lines).to eq(
      [
        { point1: [0, 9], point2: [5, 9] },
        { point1: [8, 0], point2: [0, 8] },
        { point1: [9, 4], point2: [3, 4] },
      ],
    )
  end
end

RSpec.describe 'parse_line(value)' do
  it ' parses input data ( parses one line )' do
    input = '0,9 -> 5,9'

    line = Task005.parse_line(input)

    expect(line).to eq(
      { point1: [0, 9], point2: [5, 9] },
    )
  end
end

RSpec.describe 'mark_lines(lines, diagram)' do
  it 'marks how many horizontal or vertical lines cross over the point on diagram' do
    lines =
      [
        { point1: [0, 1], point2: [0, 3] },
        { point1: [1, 0], point2: [0, 4] },
        { point1: [0, 3], point2: [3, 3] },
      ]
    diagram = {}

    diagram = Task005.mark_lines(lines)

    expect(diagram).to eq(
      {
        [0, 1] => 1,
        [0, 2] => 1,
        [0, 3] => 2,
        [1, 3] => 1,
        [2, 3] => 1,
        [3, 3] => 1,
      },
    )
  end
end

RSpec.describe 'mark_line(line, diagram)' do
  it 'mark 1 line on diagram' do
    line = { point1: [0, 3], point2: [3, 3] }
    diagram = {}

    diagram = Task005.mark_line(line, diagram)

    expect(diagram).to eq(
      {
        [0, 3] => 1,
        [1, 3] => 1,
        [2, 3] => 1,
        [3, 3] => 1,
      },
    )
  end
end

RSpec.describe 'calculate_answer(input_data)' do
  it 'it calculate how many values of diagram hash are greater than 2' do
    input = <<~INPUT
      0,1 -> 0,3
      0,3 -> 2,3
      2,3 -> 3,3
      0,2 -> 3,2
    INPUT

    answer = Task005.calculate_answer(input)

    expect(answer).to eq(3)
  end
end
