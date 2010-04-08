require 'command_testcase'
require 'move_to_eol_and_insert_terminator_and_lf'

class InsertTerminatorTest < CommandTestCase
  
  def command_name
    'and Insert Terminator + LF'
  end
  
  def teardown
    super
    ENV['TM_LINE_TERMINATOR'] = nil
  end
  
  def test_insert_terminator
    assert_equal("Comment here;\n$0", execute("Comment here"))
    assert_output_type(:insert_as_snippet)
  end
  
  def test_insert_env_terminator
    ENV['TM_LINE_TERMINATOR'] = "."
    assert_equal("Comment here.\n$0", execute("Comment here"))
    assert_output_type(:insert_as_snippet)
  end
end