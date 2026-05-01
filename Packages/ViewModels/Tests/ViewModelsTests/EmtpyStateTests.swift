import Testing
@testable import ViewModels

@Suite("EmtpyState")
struct EmtpyStateTests {
	@Test func `initializer assigns fields`() {
		let state = EmtpyState(
			message: "m",
			actionTitle: "a",
			subTitle: "s"
		)

		#expect(state.message == "m")
		#expect(state.actionTitle == "a")
		#expect(state.subTitle == "s")
	}
}

