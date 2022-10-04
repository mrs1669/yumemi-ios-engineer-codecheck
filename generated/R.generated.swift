//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap { Locale(identifier: $0) } ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)

  /// Find first language and bundle for which the table exists
  fileprivate static func localeBundle(tableName: String, preferredLanguages: [String]) -> (Foundation.Locale, Foundation.Bundle)? {
    // Filter preferredLanguages to localizations, use first locale
    var languages = preferredLanguages
      .map { Locale(identifier: $0) }
      .prefix(1)
      .flatMap { locale -> [String] in
        if hostingBundle.localizations.contains(locale.identifier) {
          if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
            return [locale.identifier, language]
          } else {
            return [locale.identifier]
          }
        } else if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
          return [language]
        } else {
          return []
        }
      }

    // If there's no languages, use development language as backstop
    if languages.isEmpty {
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages = [developmentLocalization]
      }
    } else {
      // Insert Base as second item (between locale identifier and languageCode)
      languages.insert("Base", at: 1)

      // Add development language as backstop
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages.append(developmentLocalization)
      }
    }

    // Find first language for which table exists
    // Note: key might not exist in chosen language (in that case, key will be shown)
    for language in languages {
      if let lproj = hostingBundle.url(forResource: language, withExtension: "lproj"),
         let lbundle = Bundle(url: lproj)
      {
        let strings = lbundle.url(forResource: tableName, withExtension: "strings")
        let stringsdict = lbundle.url(forResource: tableName, withExtension: "stringsdict")

        if strings != nil || stringsdict != nil {
          return (Locale(identifier: language), lbundle)
        }
      }
    }

    // If table is available in main bundle, don't look for localized resources
    let strings = hostingBundle.url(forResource: tableName, withExtension: "strings", subdirectory: nil, localization: nil)
    let stringsdict = hostingBundle.url(forResource: tableName, withExtension: "stringsdict", subdirectory: nil, localization: nil)

    if strings != nil || stringsdict != nil {
      return (applicationLocale, hostingBundle)
    }

    // If table is not found for requested languages, key will be shown
    return nil
  }

  /// Load string from Info.plist file
  fileprivate static func infoPlistString(path: [String], key: String) -> String? {
    var dict = hostingBundle.infoDictionary
    for step in path {
      guard let obj = dict?[step] as? [String: Any] else { return nil }
      dict = obj
    }
    return dict?[key] as? String
  }

  static func validate() throws {
    try intern.validate()
  }

  #if os(iOS) || os(tvOS)
  /// This `R.segue` struct is generated, and contains static references to 1 view controllers.
  struct segue {
    /// This struct is generated for `SearchRepositoryTableViewController`, and contains static references to 1 segues.
    struct searchRepositoryTableViewController {
      /// Segue identifier `Detail`.
      static let detail: Rswift.StoryboardSegueIdentifier<UIKit.UIStoryboardSegue, SearchRepositoryTableViewController, RepositoryDetailViewController> = Rswift.StoryboardSegueIdentifier(identifier: "Detail")

      #if os(iOS) || os(tvOS)
      /// Optionally returns a typed version of segue `Detail`.
      /// Returns nil if either the segue identifier, the source, destination, or segue types don't match.
      /// For use inside `prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)`.
      static func detail(segue: UIKit.UIStoryboardSegue) -> Rswift.TypedStoryboardSegueInfo<UIKit.UIStoryboardSegue, SearchRepositoryTableViewController, RepositoryDetailViewController>? {
        return Rswift.TypedStoryboardSegueInfo(segueIdentifier: R.segue.searchRepositoryTableViewController.detail, segue: segue)
      }
      #endif

      fileprivate init() {}
    }

    fileprivate init() {}
  }
  #endif

  #if os(iOS) || os(tvOS)
  /// This `R.storyboard` struct is generated, and contains static references to 3 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `RepositoryDetailViewController`.
    static let repositoryDetailViewController = _R.storyboard.repositoryDetailViewController()
    /// Storyboard `SearchRepositoryTableViewController`.
    static let searchRepositoryTableViewController = _R.storyboard.searchRepositoryTableViewController()

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "RepositoryDetailViewController", bundle: ...)`
    static func repositoryDetailViewController(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.repositoryDetailViewController)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "SearchRepositoryTableViewController", bundle: ...)`
    static func searchRepositoryTableViewController(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.searchRepositoryTableViewController)
    }
    #endif

    fileprivate init() {}
  }
  #endif

  /// This `R.color` struct is generated, and contains static references to 4 colors.
  struct color {
    /// Color `Background`.
    static let background = Rswift.ColorResource(bundle: R.hostingBundle, name: "Background")
    /// Color `CellText`.
    static let cellText = Rswift.ColorResource(bundle: R.hostingBundle, name: "CellText")
    /// Color `Cell`.
    static let cell = Rswift.ColorResource(bundle: R.hostingBundle, name: "Cell")
    /// Color `MainTheme`.
    static let mainTheme = Rswift.ColorResource(bundle: R.hostingBundle, name: "MainTheme")

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "Background", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func background(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.background, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "Cell", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func cell(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.cell, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "CellText", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func cellText(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.cellText, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "MainTheme", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func mainTheme(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.mainTheme, compatibleWith: traitCollection)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "Background", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func background(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.background.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "Cell", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func cell(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.cell.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "CellText", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func cellText(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.cellText.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "MainTheme", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func mainTheme(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.mainTheme.name)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.file` struct is generated, and contains static references to 1 files.
  struct file {
    /// Resource file `license-list.plist`.
    static let licenseListPlist = Rswift.FileResource(bundle: R.hostingBundle, name: "license-list", pathExtension: "plist")

    /// `bundle.url(forResource: "license-list", withExtension: "plist")`
    static func licenseListPlist(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.licenseListPlist
      return fileResource.bundle.url(forResource: fileResource)
    }

    fileprivate init() {}
  }

  /// This `R.id` struct is generated, and contains static references to accessibility identifiers.
  struct id {
    struct searchRepositoryTableViewCell {
      /// Accessibility identifier `ownerName`.
      static let ownerName: String = "ownerName"

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  /// This `R.image` struct is generated, and contains static references to 1 images.
  struct image {
    /// Image `AppIcon`.
    static let appIcon = Rswift.ImageResource(bundle: R.hostingBundle, name: "AppIcon")

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "AppIcon", bundle: ..., traitCollection: ...)`
    static func appIcon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.appIcon, compatibleWith: traitCollection)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.info` struct is generated, and contains static references to 1 properties.
  struct info {
    struct uiApplicationSceneManifest {
      static let _key = "UIApplicationSceneManifest"
      static let uiApplicationSupportsMultipleScenes = false

      struct uiSceneConfigurations {
        static let _key = "UISceneConfigurations"

        struct uiWindowSceneSessionRoleApplication {
          struct defaultConfiguration {
            static let _key = "Default Configuration"
            static let uiSceneConfigurationName = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneConfigurationName") ?? "Default Configuration"
            static let uiSceneDelegateClassName = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneDelegateClassName") ?? "$(PRODUCT_MODULE_NAME).SceneDelegate"
            static let uiSceneStoryboardFile = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneStoryboardFile") ?? "SearchRepositoryTableViewController"

            fileprivate init() {}
          }

          fileprivate init() {}
        }

        fileprivate init() {}
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  /// This `R.nib` struct is generated, and contains static references to 1 nibs.
  struct nib {
    /// Nib `SearchRepositoryTableViewCell`.
    static let searchRepositoryTableViewCell = _R.nib._SearchRepositoryTableViewCell()

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "SearchRepositoryTableViewCell", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.searchRepositoryTableViewCell) instead")
    static func searchRepositoryTableViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.searchRepositoryTableViewCell)
    }
    #endif

    static func searchRepositoryTableViewCell(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> SearchRepositoryTableViewCell? {
      return R.nib.searchRepositoryTableViewCell.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? SearchRepositoryTableViewCell
    }

    fileprivate init() {}
  }

  /// This `R.string` struct is generated, and contains static references to 4 localization tables.
  struct string {
    /// This `R.string.identifier` struct is generated, and contains static references to 1 localization keys.
    struct identifier {
      /// Value: SearchRepositoryTableViewCell
      static let tableViewCellReuseIdentifier = Rswift.StringResource(key: "TableViewCellReuseIdentifier", tableName: "Identifier", bundle: R.hostingBundle, locales: [], comment: nil)

      /// Value: SearchRepositoryTableViewCell
      static func tableViewCellReuseIdentifier(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("TableViewCellReuseIdentifier", tableName: "Identifier", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Identifier", preferredLanguages: preferredLanguages) else {
          return "TableViewCellReuseIdentifier"
        }

        return NSLocalizedString("TableViewCellReuseIdentifier", tableName: "Identifier", bundle: bundle, comment: "")
      }

      fileprivate init() {}
    }

    /// This `R.string.infoPlist` struct is generated, and contains static references to 1 localization keys.
    struct infoPlist {
      /// en translation: RepoSearch
      ///
      /// Locales: en, ja, zh-Hans, ko
      static let cfBundleDisplayName = Rswift.StringResource(key: "CFBundleDisplayName", tableName: "InfoPlist", bundle: R.hostingBundle, locales: ["en", "ja", "zh-Hans", "ko"], comment: nil)

      /// en translation: RepoSearch
      ///
      /// Locales: en, ja, zh-Hans, ko
      static func cfBundleDisplayName(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("CFBundleDisplayName", tableName: "InfoPlist", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "InfoPlist", preferredLanguages: preferredLanguages) else {
          return "CFBundleDisplayName"
        }

        return NSLocalizedString("CFBundleDisplayName", tableName: "InfoPlist", bundle: bundle, comment: "")
      }

      fileprivate init() {}
    }

    /// This `R.string.launchScreen` struct is generated, and contains static references to 0 localization keys.
    struct launchScreen {
      fileprivate init() {}
    }

    /// This `R.string.localizable` struct is generated, and contains static references to 5 localization keys.
    struct localizable {
      /// en translation: Licence
      ///
      /// Locales: en, zh-Hans, ja, ko
      static let licence = Rswift.StringResource(key: "Licence", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "zh-Hans", "ja", "ko"], comment: nil)
      /// en translation: Please enter the name of the repository you wish to search
      ///
      /// Locales: en, zh-Hans, ja, ko
      static let pleaseEnterTheNameOfTheRepositoryYouWishToSearch = Rswift.StringResource(key: "Please enter the name of the repository you wish to search", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "zh-Hans", "ja", "ko"], comment: nil)
      /// en translation: Repository Search
      ///
      /// Locales: en, zh-Hans, ja, ko
      static let repositorySearch = Rswift.StringResource(key: "Repository Search", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "zh-Hans", "ja", "ko"], comment: nil)
      /// en translation: Repository not found
      ///
      /// Locales: en, zh-Hans, ja, ko
      static let repositoryNotFound = Rswift.StringResource(key: "Repository not found", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "zh-Hans", "ja", "ko"], comment: nil)
      /// en translation: You can search the repository by keyword!
      ///
      /// Locales: en, zh-Hans, ja, ko
      static let youCanSearchTheRepositoryByKeyword = Rswift.StringResource(key: "You can search the repository by keyword!", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "zh-Hans", "ja", "ko"], comment: nil)

      /// en translation: Licence
      ///
      /// Locales: en, zh-Hans, ja, ko
      static func licence(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("Licence", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "Licence"
        }

        return NSLocalizedString("Licence", bundle: bundle, comment: "")
      }

      /// en translation: Please enter the name of the repository you wish to search
      ///
      /// Locales: en, zh-Hans, ja, ko
      static func pleaseEnterTheNameOfTheRepositoryYouWishToSearch(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("Please enter the name of the repository you wish to search", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "Please enter the name of the repository you wish to search"
        }

        return NSLocalizedString("Please enter the name of the repository you wish to search", bundle: bundle, comment: "")
      }

      /// en translation: Repository Search
      ///
      /// Locales: en, zh-Hans, ja, ko
      static func repositorySearch(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("Repository Search", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "Repository Search"
        }

        return NSLocalizedString("Repository Search", bundle: bundle, comment: "")
      }

      /// en translation: Repository not found
      ///
      /// Locales: en, zh-Hans, ja, ko
      static func repositoryNotFound(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("Repository not found", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "Repository not found"
        }

        return NSLocalizedString("Repository not found", bundle: bundle, comment: "")
      }

      /// en translation: You can search the repository by keyword!
      ///
      /// Locales: en, zh-Hans, ja, ko
      static func youCanSearchTheRepositoryByKeyword(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("You can search the repository by keyword!", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "You can search the repository by keyword!"
        }

        return NSLocalizedString("You can search the repository by keyword!", bundle: bundle, comment: "")
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }

    fileprivate init() {}
  }

  fileprivate class Class {}

  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    #if os(iOS) || os(tvOS)
    try storyboard.validate()
    #endif
  }

  #if os(iOS) || os(tvOS)
  struct nib {
    struct _SearchRepositoryTableViewCell: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "SearchRepositoryTableViewCell"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> SearchRepositoryTableViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? SearchRepositoryTableViewCell
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }
  #endif

  #if os(iOS) || os(tvOS)
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      #if os(iOS) || os(tvOS)
      try launchScreen.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try repositoryDetailViewController.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try searchRepositoryTableViewController.validate()
      #endif
    }

    #if os(iOS) || os(tvOS)
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController

      let bundle = R.hostingBundle
      let name = "LaunchScreen"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct repositoryDetailViewController: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = RepositoryDetailViewController

      let bundle = R.hostingBundle
      let name = "RepositoryDetailViewController"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
          if UIKit.UIColor(named: "CellText", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Color named 'CellText' is used in storyboard 'RepositoryDetailViewController', but couldn't be loaded.") }
          if UIKit.UIColor(named: "MainTheme", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Color named 'MainTheme' is used in storyboard 'RepositoryDetailViewController', but couldn't be loaded.") }
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct searchRepositoryTableViewController: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UINavigationController

      let bundle = R.hostingBundle
      let name = "SearchRepositoryTableViewController"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
          if UIKit.UIColor(named: "MainTheme", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Color named 'MainTheme' is used in storyboard 'SearchRepositoryTableViewController', but couldn't be loaded.") }
        }
      }

      fileprivate init() {}
    }
    #endif

    fileprivate init() {}
  }
  #endif

  fileprivate init() {}
}
