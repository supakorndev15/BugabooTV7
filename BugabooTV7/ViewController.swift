//
//  ViewController.swift
//  BugabooTV7
//
//  Created by MacDetail on 17/7/2568 BE.
//

import UIKit

class ViewController: UIViewController {

    let navigationView : UIView = {
        let nv = UIView()
        nv.translatesAutoresizingMaskIntoConstraints = false
        nv.backgroundColor = .clear
        return nv
    }()
    // สร้าง UI collectionView
    @IBOutlet weak var collectionView: UICollectionView!

    var liveChannels: [Channel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // fetchData
        fetchLiveChannels()
        
        cellRegister()
        configureUI()
        setupCustomNavBar()
//        configureUI()
//        setUpConstrains()
        configureCompositionalLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    func cellRegister() {
        collectionView.register(VerticalCollectionViewCell.self, forCellWithReuseIdentifier: VerticalCollectionViewCell.cellIdentifier)
        collectionView.register(MiniTopCategoryCollectionViewCell.self, forCellWithReuseIdentifier: MiniTopCategoryCollectionViewCell.cellIdentifier)
        collectionView.register(UINib(nibName: "LiveCh7PlayerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: LiveCh7PlayerCollectionViewCell.cellIdentifier)

    }
    
    func configureUI(){
        collectionView.backgroundColor = .clear
//        view.addSubview(navigationView)
//        view.addSubview(collectionView)
//        view.addSubview(filterHeaderView)
    }
    
    
    func setUpConstrains(){
        collectionView.setUp(to: view)
//        NSLayoutConstraint.activate([
//            navigationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            navigationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            navigationView.topAnchor.constraint(equalTo: view.topAnchor, constant: -(WindowConstant.topPadding + 64)),
//            navigationView.heightAnchor.constraint(equalToConstant: WindowConstant.topPadding + 64),
//        ])
    }
    
    func setupCustomNavBar() {
        let navBar = UIView()
        navBar.backgroundColor = .white
        navBar.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 110)
        view.addSubview(navBar)

        // Left icon buttons
        let leftIconNames = ["ic_menu", "logoApp"]
        var leftButtons: [UIButton] = []
        
        for (index, name) in leftIconNames.enumerated() {
            let button = UIButton(type: .system)

            // กำหนดขนาดตาม index
            let iconSize: CGSize = (index == 0)
                ? CGSize(width: 20, height: 20)
                : CGSize(width: 150, height: 45)

            // Resize image
            if let image = UIImage(named: name)?.resized(to: iconSize) {
                button.setImage(image.withRenderingMode(.alwaysOriginal), for: .normal)
            }

            // กำหนดขนาดปุ่มให้ตรงกับขนาดภาพ
            button.frame.size = iconSize
            button.tag = index
            button.addTarget(self, action: #selector(leftIconTapped(_:)), for: .touchUpInside)
            leftButtons.append(button)
        }

        let leftStack = UIStackView(arrangedSubviews: leftButtons)
        leftStack.axis = .horizontal
        leftStack.spacing = 18
        leftStack.alignment = .center
        navBar.addSubview(leftStack)

        leftStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leftStack.leadingAnchor.constraint(equalTo: navBar.leadingAnchor, constant: 15),
            leftStack.centerYAnchor.constraint(equalTo: navBar.centerYAnchor, constant: 20)
        ])

        // Icons stack
        let iconNames = ["ic_help", "ic_store", "ic_vip"]
        let spacing: CGFloat = 5
        var buttons: [UIButton] = []

        let iconSizeRight = CGSize(width: 45, height: 45)
        for (index, name) in iconNames.enumerated() {
            let button = UIButton(type: .system)
            if let image = UIImage(named: name)?.resized(to: iconSizeRight) {
                button.setImage(image.withRenderingMode(.alwaysOriginal), for: .normal)
            }
            button.frame.size = iconSizeRight
            button.tag = index
            button.addTarget(self, action: #selector(iconTapped(_:)), for: .touchUpInside)
            buttons.append(button)
        }

        let stack = UIStackView(arrangedSubviews: buttons)
        stack.axis = .horizontal
        stack.spacing = spacing
        stack.distribution = .equalSpacing
        stack.alignment = .center
        navBar.addSubview(stack)

        stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.trailingAnchor.constraint(equalTo: navBar.trailingAnchor, constant: -15),
            stack.centerYAnchor.constraint(equalTo: navBar.centerYAnchor, constant: 20)
        ])
    }

    
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
        print("Hello")
    }
    
    @objc func leftIconTapped(_ sender: UIButton) {
        switch sender.tag {
        case 0: print("Left Icon 1 tapped")
        case 1: print("Left Icon 2 tapped")
        default: break
        }
    }
    
    @objc func iconTapped(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            print("Icon 1 tapped")
        case 1:
            
            // https://shop.bugaboo.tv/
            let urlString = "https://shop.bugaboo.tv/"
            if let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
            print("Icon 2 tapped")
        case 2:
            print("Icon 3 tapped")
        default:
            break
        }
    }
}

extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    // configureCompositionalLayout
    func configureCompositionalLayout(){
        let layout = UICollectionViewCompositionalLayout {sectionIndex,enviroment in
            switch sectionIndex {
            case 0 :
                return AppLayouts.shared.livePlayerSection()
//                return AppLayouts.shared.foodBannerSection()
            case 1 :
                return AppLayouts.shared.liveSection()
            case 2 :
                return AppLayouts.shared.foodCategorySection()
            default:
                return AppLayouts.shared.restaurantsListSection()
            }
        }
//        layout.register(SectionDecorationView.self, forDecorationViewOfKind: "SectionBackground")
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0 :
            return 1 //topBannerMockData.count
        case 1 :
            return max(carouselChannelMockData.count, 4) //carouselChannelMockData.count
        case 2 :
            return foodCategoryMockData.count
        default:
            return topBannerMockData.count
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {

            // LiveCh7PlayerCollectionViewCell
        case 0 :
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LiveCh7PlayerCollectionViewCell.cellIdentifier, for: indexPath) as? LiveCh7PlayerCollectionViewCell else {fatalError("Unable deque cell...")}
//             cell.cellData = foodCategoryMockData[indexPath.row]
             return cell
        case 1 :
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MiniTopCategoryCollectionViewCell.cellIdentifier, for: indexPath) as? MiniTopCategoryCollectionViewCell else {fatalError("Unable deque cell...")}

            cell.isHidden = indexPath.row >= carouselChannelMockData.count
            cell.cellData = cell.isHidden ? nil : carouselChannelMockData[indexPath.row]

//            if indexPath.row < carouselChannelMockData.count {
//                cell.cellData = carouselChannelMockData[indexPath.row]
//                cell.isHidden = false
//            } else {
//                cell.cellData = nil // หรือทำเป็น empty
//                cell.isHidden = true // ซ่อน cell ปลอม
//            }

             return cell
        case 2 :
            
           // MiniTopCategoryCollectionViewCell
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MiniTopCategoryCollectionViewCell.cellIdentifier, for: indexPath) as? MiniTopCategoryCollectionViewCell else {fatalError("Unable deque cell...")}
//             cell.cellData = foodCategoryMockData[indexPath.row]
             return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VerticalCollectionViewCell.cellIdentifier, for: indexPath) as? VerticalCollectionViewCell else {fatalError("Unable deque cell...")}
             cell.cellData = verticalMockData[indexPath.row]
             return cell
        }
    }
    
    
}

extension UIImage {
    func resized(to size: CGSize) -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { _ in
            self.draw(in: CGRect(origin: .zero, size: size))
        }
    }
}


extension ViewController {
    func fetchLiveChannels() {
        APIService.shared.request(endpoint: .liveChannels) { (result: Result<LiveChannelsModel, Error>) in
            switch result {
            case .success(let data):
                print("✅ Channels count: \(data.data.channels.count)")
                for (index, channel) in data.data.channels.enumerated() {
                    print("📺 Channel \(index):")
                    print("🖼️ Images: \(channel.images)\n")
                    print("🖼️ Images: \(channel.images.portrait.medium)\n")
                }
                
                self.liveChannels = data.data.channels
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }

                print(data.data)
                data.data.channels.forEach { print($0.channelName) }
            case .failure(let error):
                print("❌ Error: \(error.localizedDescription)")
            }
        }
    }
}
