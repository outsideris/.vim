import org.scalatest.FunSuite

class DefaultSuite extends FunSuite {
  test("case #1") {
    // given 
    
    // when
    
    // then
    assert(true == true)
  }

  ignore("case #2") {
  }

  trait TestFixture {
    val something = "something"
  }

  test("case #3") {
    new TestFixture {
      // given

      // when

      // then
    }
  }
}
