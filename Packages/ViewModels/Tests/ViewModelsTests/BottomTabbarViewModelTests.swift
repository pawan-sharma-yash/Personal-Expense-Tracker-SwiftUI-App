import Testing
@testable import ViewModels

@Suite("Bottom Tab Bar title and icons")
struct BottomTabbarViewModelTests {
	let vm = BottomTabbarViewModel()

	@Test func `Home: title and icons are correctly assigned`() {
		#expect(vm.home.title == "Home")
		#expect(vm.home.icon == "house.fill")
	}

	@Test func `Analytics: title and icons are correctly assigned`() {
		#expect(vm.analytics.title == "Analytics")
		#expect(vm.analytics.icon == "chart.line.uptrend.xyaxis")
	}

	@Test func `Settings: title and icons are correctly assigned`() {
		#expect(vm.settings.title == "Settings")
		#expect(vm.settings.icon == "gearshape.fill")
	}
}
