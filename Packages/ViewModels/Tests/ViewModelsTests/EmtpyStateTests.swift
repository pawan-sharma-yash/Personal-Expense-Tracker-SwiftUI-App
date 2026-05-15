import Testing
@testable import ViewModels

@Suite("EmtpyState")
struct EmtpyStateTests {
	@Test func `initializer assigns fields`() {
		let state = EmtpyState(
			title: "m",
			actionTitle: "a",
			subTitle: "s"
		)

		#expect(state.title == "m")
		#expect(state.actionTitle == "a")
		#expect(state.subTitle == "s")
	}
}

