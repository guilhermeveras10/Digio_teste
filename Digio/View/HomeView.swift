//
//  Home.swift
//  Digio
//
//  Created by Guilherme Duarte on 21/08/24.
//

import SDWebImage
import UIKit

protocol HomeViewDelegate: AnyObject {
    func didTapImage()
    func didTapImageCollection(_ data: Spotlight)
    func didTapImageCollectionProduct(_ data: Products)
}

class HomeView: UIView {
    var cash: Cash?

    var spots: [Spotlight]? {
        didSet { collectionView.reloadData() }
    }

    var products: [Products]? {
        didSet { collectionViewProducts.reloadData() }
    }

    // MARK: - Delegate

    weak var delegate: HomeViewDelegate?

    // MARK: - UI Elements

    private lazy var stackViewConstraints = Layout.Constraint(
        topAnchor: 50,
        leadingAnchor: 11
    )
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            image,
            name,
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 15
        return stackView
    }()

    private lazy var stackViewCashConstraints = Layout.Constraint(
        topAnchor: 10,
        leadingAnchor: 11,
        trailingAnchor: -11
    )

    lazy var stackViewCash: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            title,
            banner,
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 15
        return stackView
    }()

    lazy var title: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    private lazy var titleTwoConstraints = Layout.Constraint(
        topAnchor: 10,
        leadingAnchor: 11,
        trailingAnchor: -11
    )

    lazy var titleTwo: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    lazy var banner: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = true
        img.layer.cornerRadius = 10
        img.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(bannerTapped)
        )
        img.addGestureRecognizer(tapGesture)
        return img
    }()

    private lazy var collectionViewConstraints = Layout.Constraint(
        topAnchor: 10,
        leadingAnchor: 11,
        trailingAnchor: -11,
        height: 200
    )
    public lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(
            frame: CGRect.zero,
            collectionViewLayout: layout
        )

        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
        collection.decelerationRate = UIScrollView.DecelerationRate.fast
        collection.backgroundColor = .clear
        collection.showsHorizontalScrollIndicator = false
        collection.register(
            SpotCell.self,
            forCellWithReuseIdentifier: SpotCell.id
        )
        return collection
    }()

    private lazy var collectionViewProductsConstraints = Layout.Constraint(
        topAnchor: 10,
        leadingAnchor: 11,
        trailingAnchor: -11,
        height: 200
    )
    public lazy var collectionViewProducts: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(
            frame: CGRect.zero,
            collectionViewLayout: layout
        )

        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
        collection.decelerationRate = UIScrollView.DecelerationRate.fast
        collection.backgroundColor = .clear
        collection.showsHorizontalScrollIndicator = false
        collection.register(
            ProductCell.self,
            forCellWithReuseIdentifier: ProductCell.id
        )
        return collection
    }()

    lazy var image: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.contentMode = .scaleAspectFill
        icon.clipsToBounds = true
        icon.layer.cornerRadius = 20 // Raio da borda para torná-la arredondada
        return icon
    }()

    lazy var name: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    // MARK: - private funcs

    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        addComponents()
        addConstraints()
    }

    private func addComponents() {
        addSubview(stackView)
        addSubview(collectionView)
        addSubview(stackViewCash)
        addSubview(titleTwo)
        addSubview(collectionViewProducts)
    }

    private func addConstraints() {
        addStackViewConstraints()
        addCollectionViewConstraints() // Renomeado para melhor clareza
        addImageConstraints()
        addStackViewCashConstraints()
        addTitleTwoConstraints()
        addCollectionViewProductsConstraints()
    }

    private func addCollectionViewConstraints() {
        collectionView.topAnchor.constraint(
            equalTo: stackView.bottomAnchor, // Corrigido para empilhar corretamente
            constant: collectionViewConstraints.topAnchor // Espaçamento entre a stackView e a collectionView
        ).isActive = true
        collectionView.leadingAnchor.constraint(
            equalTo: leadingAnchor,
            constant: collectionViewConstraints.leadingAnchor
        ).isActive = true
        collectionView.trailingAnchor.constraint(
            equalTo: trailingAnchor,
            constant: collectionViewConstraints.trailingAnchor
        ).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: collectionViewConstraints.height).isActive = true
    }

    private func addCollectionViewProductsConstraints() {
        collectionViewProducts.topAnchor.constraint(
            equalTo: titleTwo.bottomAnchor, // Corrigido para empilhar corretamente
            constant: collectionViewProductsConstraints.topAnchor // Espaçamento entre a stackView e a collectionView
        ).isActive = true
        collectionViewProducts.leadingAnchor.constraint(
            equalTo: leadingAnchor,
            constant: collectionViewProductsConstraints.leadingAnchor
        ).isActive = true
        collectionViewProducts.trailingAnchor.constraint(
            equalTo: trailingAnchor,
            constant: collectionViewProductsConstraints.trailingAnchor
        ).isActive = true
        collectionViewProducts.heightAnchor.constraint(equalToConstant: collectionViewProductsConstraints.height).isActive = true
    }

    private func addImageConstraints() {
        image.widthAnchor.constraint(equalToConstant: 40).isActive = true // Largura fixa da imagem
        image.heightAnchor.constraint(equalToConstant: 40).isActive = true // Altura fixa da imagem
    }

    private func addStackViewCashConstraints() {
        stackViewCash.topAnchor.constraint(
            equalTo: collectionView.bottomAnchor,
            constant: stackViewCashConstraints.topAnchor
        ).isActive = true
        stackViewCash.leadingAnchor.constraint(
            equalTo: leadingAnchor,
            constant: stackViewCashConstraints.leadingAnchor
        ).isActive = true
        stackViewCash.trailingAnchor.constraint(
            equalTo: trailingAnchor,
            constant: stackViewCashConstraints.trailingAnchor
        ).isActive = true
    }

    private func addTitleTwoConstraints() {
        titleTwo.topAnchor.constraint(
            equalTo: stackViewCash.bottomAnchor,
            constant: titleTwoConstraints.topAnchor
        ).isActive = true
        titleTwo.leadingAnchor.constraint(
            equalTo: leadingAnchor,
            constant: titleTwoConstraints.leadingAnchor
        ).isActive = true
        titleTwo.trailingAnchor.constraint(
            equalTo: trailingAnchor,
            constant: titleTwoConstraints.trailingAnchor
        ).isActive = true
    }

    private func addStackViewConstraints() {
        stackView.topAnchor.constraint(
            equalTo: topAnchor,
            constant: stackViewConstraints.topAnchor
        ).isActive = true
        stackView.leadingAnchor.constraint(
            equalTo: leadingAnchor,
            constant: stackViewConstraints.leadingAnchor
        ).isActive = true
        stackView.trailingAnchor.constraint(
            equalTo: trailingAnchor,
            constant: stackViewConstraints.trailingAnchor
        ).isActive = true
    }

    // MARK: - Logic display

    func displayScreenValues(_ viewModel: HomeViewModel) {
        spots = viewModel.spotlight
        products = viewModel.products
        cash = viewModel.cash
        image.image = viewModel.imageName
        name.text = viewModel.name
        title.text = viewModel.cash.title
        banner.sd_setImage(
            with: URL(string: viewModel.cash.bannerURL ?? ""),
            placeholderImage: UIImage(resource: .gtDWTpeapa147Sg77ENYZz3HFESKnOwa1HlrzHXU)
        )
        titleTwo.text = viewModel.titleSecond
    }

    @objc func bannerTapped() {
        delegate?.didTapImage()
    }
}

// MARK: - Collection View

extension HomeView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    )
        -> Int {
        collectionView == self.collectionView ? spots?.count ?? 0 : products?.count ?? 0
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    )
        -> UICollectionViewCell {
        if collectionView == self.collectionView {
            guard
                let cell = self.collectionView.dequeueReusableCell(
                    withReuseIdentifier: SpotCell.id,
                    for: indexPath
                ) as? SpotCell else { return UICollectionViewCell() }
            let data = spots?.get(index: indexPath.row)?.bannerURL ?? ""
            cell.configure(with: data)

            return cell
        } else {
            guard
                let cell = collectionViewProducts.dequeueReusableCell(
                    withReuseIdentifier: ProductCell.id,
                    for: indexPath
                ) as? ProductCell else { return UICollectionViewCell() }
            let data = products?.get(index: indexPath.row)?.imageURL ?? ""
            cell.configure(with: data)

            return cell
        }
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    )
        -> CGSize {
        collectionView == self.collectionView ? CGSize(
            width: 350,
            height: 200
        ) : CGSize(
            width: 200,
            height: 200
        )
    }

    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        guard
            let spot = spots?.get(index: indexPath.row),
            let product = products?.get(index: indexPath.row) else { return }
        collectionView == self.collectionView ? delegate?.didTapImageCollection(spot) : delegate?.didTapImageCollectionProduct(product)
    }
}
