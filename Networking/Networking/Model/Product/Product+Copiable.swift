
import Foundation

extension Product: Copiable {
    public func copy() -> Product {
        self.copy(siteID: self.siteID)
    }

    public func copy(
        siteID: Int64? = nil,
        productID: Int64? = nil,
        name: String? = nil,
        slug: String? = nil,
        permalink: String? = nil,
        dateCreated: Date? = nil,
        dateModified: Date?? = nil,
        dateOnSaleStart: Date?? = nil,
        dateOnSaleEnd: Date?? = nil,
        productTypeKey: String? = nil,
        statusKey: String? = nil,
        featured: Bool? = nil,
        catalogVisibilityKey: String? = nil,
        fullDescription: String?? = nil,
        briefDescription: String?? = nil,
        sku: String?? = nil,
        price: String? = nil,
        regularPrice: String?? = nil,
        salePrice: String?? = nil,
        onSale: Bool? = nil,
        purchasable: Bool? = nil,
        totalSales: Int? = nil,
        virtual: Bool? = nil,
        downloadable: Bool? = nil,
        downloads: [ProductDownload]? = nil,
        downloadLimit: Int? = nil,
        downloadExpiry: Int? = nil,
        externalURL: String?? = nil,
        taxStatusKey: String? = nil,
        taxClass: String?? = nil,
        manageStock: Bool? = nil,
        stockQuantity: Int?? = nil,
        stockStatusKey: String? = nil,
        backordersKey: String? = nil,
        backordersAllowed: Bool? = nil,
        backordered: Bool? = nil,
        soldIndividually: Bool? = nil,
        weight: String?? = nil,
        dimensions: ProductDimensions? = nil,
        shippingRequired: Bool? = nil,
        shippingTaxable: Bool? = nil,
        shippingClass: String?? = nil,
        shippingClassID: Int64? = nil,
        productShippingClass: ProductShippingClass?? = nil,
        reviewsAllowed: Bool? = nil,
        averageRating: String? = nil,
        ratingCount: Int? = nil,
        relatedIDs: [Int64]? = nil,
        upsellIDs: [Int64]? = nil,
        crossSellIDs: [Int64]? = nil,
        parentID: Int64? = nil,
        purchaseNote: String?? = nil,
        categories: [ProductCategory]? = nil,
        tags: [ProductTag]? = nil,
        images: [ProductImage]? = nil,
        attributes: [ProductAttribute]? = nil,
        defaultAttributes: [ProductDefaultAttribute]? = nil,
        variations: [Int64]? = nil,
        groupedProducts: [Int64]? = nil,
        menuOrder: Int? = nil
    ) -> Product {

        Product(
            siteID: siteID ?? self.siteID,
            productID: productID ?? self.productID,
            name: name ?? self.name,
            slug: slug ?? self.slug,
            permalink: permalink ?? self.permalink,
            dateCreated: dateCreated ?? self.dateCreated,
            dateModified: dateModified ?? self.dateModified,
            dateOnSaleStart: dateOnSaleStart ?? self.dateOnSaleStart,
            dateOnSaleEnd: dateOnSaleEnd ?? self.dateOnSaleEnd,
            productTypeKey: productTypeKey ?? self.productTypeKey,
            statusKey: statusKey ?? self.statusKey,
            featured: featured ?? self.featured,
            catalogVisibilityKey: catalogVisibilityKey ?? self.catalogVisibilityKey,
            fullDescription: fullDescription ?? self.fullDescription,
            briefDescription: briefDescription ?? self.briefDescription,
            sku: sku ?? self.sku,
            price: price ?? self.price,
            regularPrice: regularPrice ?? self.regularPrice,
            salePrice: salePrice ?? self.salePrice,
            onSale: onSale ?? self.onSale,
            purchasable: purchasable ?? self.purchasable,
            totalSales: totalSales ?? self.totalSales,
            virtual: virtual ?? self.virtual,
            downloadable: downloadable ?? self.downloadable,
            downloads: downloads ?? self.downloads,
            downloadLimit: downloadLimit ?? self.downloadLimit,
            downloadExpiry: downloadExpiry ?? self.downloadExpiry,
            externalURL: externalURL ?? self.externalURL,
            taxStatusKey: taxStatusKey ?? self.taxStatusKey,
            taxClass: taxClass ?? self.taxClass,
            manageStock: manageStock ?? self.manageStock,
            stockQuantity: stockQuantity ?? self.stockQuantity,
            stockStatusKey: stockStatusKey ?? self.stockStatusKey,
            backordersKey: backordersKey ?? self.backordersKey,
            backordersAllowed: backordersAllowed ?? self.backordersAllowed,
            backordered: backordered ?? self.backordered,
            soldIndividually: soldIndividually ?? self.soldIndividually,
            weight: weight ?? self.weight,
            dimensions: dimensions ?? self.dimensions,
            shippingRequired: shippingRequired ?? self.shippingRequired,
            shippingTaxable: shippingTaxable ?? self.shippingTaxable,
            shippingClass: shippingClass ?? self.shippingClass,
            shippingClassID: shippingClassID ?? self.shippingClassID,
            productShippingClass: productShippingClass ?? self.productShippingClass,
            reviewsAllowed: reviewsAllowed ?? self.reviewsAllowed,
            averageRating: averageRating ?? self.averageRating,
            ratingCount: ratingCount ?? self.ratingCount,
            relatedIDs: relatedIDs ?? self.relatedIDs,
            upsellIDs: upsellIDs ?? self.upsellIDs,
            crossSellIDs: crossSellIDs ?? self.crossSellIDs,
            parentID: parentID ?? self.parentID,
            purchaseNote: purchaseNote ?? self.purchaseNote,
            categories: categories ?? self.categories,
            tags: tags ?? self.tags,
            images: images ?? self.images,
            attributes: attributes ?? self.attributes,
            defaultAttributes: defaultAttributes ?? self.defaultAttributes,
            variations: variations ?? self.variations,
            groupedProducts: groupedProducts ?? self.groupedProducts,
            menuOrder: menuOrder ?? self.menuOrder
        )
    }
}