import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    // 强制禁用 Impeller，使用 Skia 渲染器
    // Mac Mini 2010 的 GPU (NVIDIA GeForce 320M / Intel HD) 不支持 Metal 2
    // 即使 Info.plist 设置了 FLTEnableImpeller=false，仍需在引擎级别禁用
    let flutterViewController = FlutterViewController(
      engine: createFlutterEngine()
    )
    let windowFrame = self.frame
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)

    RegisterGeneratedPlugins(registry: flutterViewController)

    NSLog("Simple Live: Window initialized with Skia renderer (Impeller disabled)")
    super.awakeFromNib()
  }

  private func createFlutterEngine() -> FlutterEngine {
    // 通过命令行参数强制禁用 Impeller
    let arguments = ["--no-enable-impeller"]
    let engine = FlutterEngine(name: "simple_live_engine", arguments: arguments)
    engine.run()
    return engine
  }
}
