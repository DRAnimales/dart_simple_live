import Cocoa
import FlutterMacOS

@main
class AppDelegate: FlutterAppDelegate {
  override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
    return true
  }

  override func applicationDidFinishLaunching(_ notification: Notification) {
    NSLog("Simple Live: App launched on macOS \(ProcessInfo.processInfo.operatingSystemVersionString)")
    NSLog("Simple Live: Architecture: \(isRunningOnIntel() ? "Intel x86_64" : "Apple Silicon")")
  }

  private func isRunningOnIntel() -> Bool {
    #if arch(x86_64)
    return true
    #else
    return false
    #endif
  }
}
