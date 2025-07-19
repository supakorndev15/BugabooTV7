//
//  ViewController + Extension.swift
//  BugabooTV7
//
//  Created by MacDetail on 19/7/2568 BE.
//

import Foundation
import UIKit

extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func cellRegister() {
        collectionView.register(VerticalCollectionViewCell.self, forCellWithReuseIdentifier: VerticalCollectionViewCell.cellIdentifier)
        collectionView.register(MiniTopCategoryCollectionViewCell.self, forCellWithReuseIdentifier: MiniTopCategoryCollectionViewCell.cellIdentifier)
        collectionView.register(UINib(nibName: "LiveCh7PlayerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: LiveCh7PlayerCollectionViewCell.cellIdentifier)
        collectionView.register(UINib(nibName: "WelcomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: WelcomeCollectionViewCell.cellIdentifier)
        collectionView.register(UINib(nibName: "TopHighlightCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: TopHighlightCollectionViewCell.cellIdentifier)
        collectionView.register(UINib(nibName: "CatListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CatListCollectionViewCell.cellIdentifier)
        collectionView.register(UINib(nibName: "defaultVerticalCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: defaultVerticalCollectionViewCell.cellIdentifier)
        collectionView.register(UINib(nibName: "defaultHorizontalCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: defaultHorizontalCollectionViewCell.cellIdentifier)
        
        // Header
        collectionView.register(
            SectionHeaderViewReusableView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: SectionHeaderViewReusableView.reuseIdentifier
        )
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader else {
            return UICollectionReusableView()
        }
        
        let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: SectionHeaderViewReusableView.reuseIdentifier,
            for: indexPath
        ) as! SectionHeaderViewReusableView
        
        // ถ้ามี Data ต้อง Chceck if
        switch indexPath.section {
        case 5:
            header.configure(text: "รายการเด่น", buttonTitle: "เพิ่มเติม >") {
                print("ปุ่มดูทั้งหมดถูกกด")
                let urlString = "https://www.bugaboo.tv/th/variety/volleyballchamp7hd2025/"
                if let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url)
                }
            }
        case 6:
            header.configure(text: "ละครช่อง 7HD", buttonTitle: "เพิ่มเติม >") {
                print("ปุ่มดูทั้งหมดถูกกด")
            }
        default:
            header.configure(text: "✨ รายการวาไรตี้ หลากหลายรูปแบบ", buttonTitle: "ดูทั้งหมด >"){}
        }
        
        return header
    }
    
    // configureCompositionalLayout
    func configureCompositionalLayout(){
        let layout = UICollectionViewCompositionalLayout {sectionIndex,enviroment in
            switch sectionIndex {
            case 0 :
                return AppLayouts.shared.livePlayerSection() // Static
            case 1 :
                return AppLayouts.shared.liveSection()
            case 2 :
                return AppLayouts.shared.textShowSection()
            case 3 :
                return AppLayouts.shared.liveSection_three()
            case 4 :
                return AppLayouts.shared.catCategorySection()
            case 5 :
                return AppLayouts.shared.horizontalDefaultSectionLayout()
            case 6 :
                return AppLayouts.shared.verticalDefaultSectionLayout()
            case 7 :
                return AppLayouts.shared.defaultSectionLayout()
            default:
                return AppLayouts.shared.horizontalDefaultSectionLayout()
            }
        }
        layout.register(SectionDecorationView.self, forDecorationViewOfKind: "SectionBackground")
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0 :
            return 1
        case 1 :
            return max(carouselChannelMockData.count, 4)
        case 2 :
            return 1
        case 3,7 :
            return 10
        case 4 :
            return foodCategoryMockData.count
        case 5 :
            return horizontalMockData.count
        case 6 :
            return verticalMockData.count
        default:
            return horizontalMockData.count
        }
        // ถ้า API อื่นๆ ต้อง ฉCheck action
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // mock up
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
            
        case 0 :
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LiveCh7PlayerCollectionViewCell.cellIdentifier, for: indexPath) as? LiveCh7PlayerCollectionViewCell else {fatalError("Unable deque cell...")}
            return cell
        case 1 :
            // Check data
//            if let channel = viewModel.channel(at: indexPath.row) {
//                print("✅ Channel:", channel)
//            } else {
//                print("⚠️ Invalid index \(indexPath.row)")
//                //                cell.isHidden = true
//            }
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MiniTopCategoryCollectionViewCell.cellIdentifier, for: indexPath) as? MiniTopCategoryCollectionViewCell else {fatalError("Unable deque cell...")}
            
            cell.isHidden = indexPath.row >= carouselChannelMockData.count
            cell.cellData = cell.isHidden ? nil : carouselChannelMockData[indexPath.row]
            
            return cell
        case 2 :
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WelcomeCollectionViewCell.cellIdentifier, for: indexPath) as? WelcomeCollectionViewCell else {fatalError("Unable deque cell...")}
            return cell
        case 3 :
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopHighlightCollectionViewCell.cellIdentifier, for: indexPath) as? TopHighlightCollectionViewCell else {fatalError("Unable deque cell...")}
            return cell
        case 4 :
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CatListCollectionViewCell.cellIdentifier, for: indexPath) as? CatListCollectionViewCell else {fatalError("Unable deque cell...")}
            cell.cellData = foodCategoryMockData[indexPath.row]
            return cell
            
        case 5 :
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: defaultHorizontalCollectionViewCell.cellIdentifier, for: indexPath) as? defaultHorizontalCollectionViewCell else {fatalError("Unable deque cell...")}
            let cellVM = horizontalListViewModel.viewModel(at: indexPath.row)
            cell.configure(with: cellVM)
            return cell
        case 6 :
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: defaultVerticalCollectionViewCell.cellIdentifier, for: indexPath) as? defaultVerticalCollectionViewCell else {fatalError("Unable deque cell...")}
            
            let cellVM = verticalListViewModel.viewModel(at: indexPath.row)
            cell.configure(with: cellVM)
            return cell
        case 7 :
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: defaultVerticalCollectionViewCell.cellIdentifier, for: indexPath) as? defaultVerticalCollectionViewCell else {fatalError("Unable deque cell...")}
            
            let cellVM = verticalListViewModel.viewModel(at: indexPath.row)
            cell.configure(with: cellVM)
            return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VerticalCollectionViewCell.cellIdentifier, for: indexPath) as? VerticalCollectionViewCell else {fatalError("Unable deque cell...")}
            cell.cellData = horizontalMockData[indexPath.row]
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.section == 3, let videoCell = cell as? LiveCh7PlayerCollectionViewCell {
            print("⛔️ stopVideo called on index \(indexPath.row)")
            videoCell.stopVideo()
        }
    }
}

extension ViewController {
    func fetchData() {
        viewModel.fetchLiveChannels {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
}
