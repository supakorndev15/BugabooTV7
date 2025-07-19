import UIKit

class SectionHeaderViewReusableView: UICollectionReusableView {
    static let reuseIdentifier = "SectionHeaderView"
    var onButtonTapped: (() -> Void)?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        if let customFont = UIFont(name: "SukhumvitSet-Bold", size: 20) {
            label.font = customFont
        }
        label.numberOfLines = 2
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let titleUIButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("More", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.setContentHuggingPriority(.required, for: .horizontal)
        button.translatesAutoresizingMaskIntoConstraints = false
        if let customFont = UIFont(name: "SukhumvitSet-Medium", size: 16) {
            button.titleLabel?.font = customFont
        }
        return button
    }()
    
    private let horizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        stack.alignment = .center
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(titleLabel)
        addSubview(titleUIButton)
        
        titleUIButton.setTitleColor(.purple, for: .normal)
        // Add subviews
        horizontalStack.addArrangedSubview(titleLabel)
        horizontalStack.addArrangedSubview(titleUIButton)
        addSubview(horizontalStack)

        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            titleUIButton.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 8),
            titleUIButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            titleUIButton.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -16)
        ])
    }
    
    func configure(text: String, buttonTitle: String, action: @escaping () -> Void) {
        titleLabel.text = text
        titleUIButton.setTitle(buttonTitle, for: .normal)
        self.onButtonTapped = action
        titleUIButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc private func buttonTapped() {
        onButtonTapped?()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

