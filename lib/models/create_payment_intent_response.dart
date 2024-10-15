import 'dart:convert';

class CreatePaymentIntentResponse {
    final String id;
    final String object;
    final int amount;
    final int amountCapturable;
    final AmountDetails amountDetails;
    final int amountReceived;
    final dynamic application;
    final dynamic applicationFeeAmount;
    final AutomaticPaymentMethods automaticPaymentMethods;
    final dynamic canceledAt;
    final dynamic cancellationReason;
    final String captureMethod;
    final String clientSecret;
    final String confirmationMethod;
    final int created;
    final String currency;
    final dynamic customer;
    final dynamic description;
    final dynamic invoice;
    final dynamic lastPaymentError;
    final dynamic latestCharge;
    final bool livemode;
    final Metadata metadata;
    final dynamic nextAction;
    final dynamic onBehalfOf;
    final dynamic paymentMethod;
    final dynamic paymentMethodConfigurationDetails;
    final PaymentMethodOptions paymentMethodOptions;
    final List<String> paymentMethodTypes;
    final dynamic processing;
    final dynamic receiptEmail;
    final dynamic review;
    final dynamic setupFutureUsage;
    final dynamic shipping;
    final dynamic source;
    final dynamic statementDescriptor;
    final dynamic statementDescriptorSuffix;
    final String status;
    final dynamic transferData;
    final dynamic transferGroup;

    CreatePaymentIntentResponse({
        required this.id,
        required this.object,
        required this.amount,
        required this.amountCapturable,
        required this.amountDetails,
        required this.amountReceived,
        required this.application,
        required this.applicationFeeAmount,
        required this.automaticPaymentMethods,
        required this.canceledAt,
        required this.cancellationReason,
        required this.captureMethod,
        required this.clientSecret,
        required this.confirmationMethod,
        required this.created,
        required this.currency,
        required this.customer,
        required this.description,
        required this.invoice,
        required this.lastPaymentError,
        required this.latestCharge,
        required this.livemode,
        required this.metadata,
        required this.nextAction,
        required this.onBehalfOf,
        required this.paymentMethod,
        required this.paymentMethodConfigurationDetails,
        required this.paymentMethodOptions,
        required this.paymentMethodTypes,
        required this.processing,
        required this.receiptEmail,
        required this.review,
        required this.setupFutureUsage,
        required this.shipping,
        required this.source,
        required this.statementDescriptor,
        required this.statementDescriptorSuffix,
        required this.status,
        required this.transferData,
        required this.transferGroup,
    });

    factory CreatePaymentIntentResponse.fromRawJson(String str) => CreatePaymentIntentResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreatePaymentIntentResponse.fromJson(Map<String, dynamic> json) => CreatePaymentIntentResponse(
        id: json["id"],
        object: json["object"],
        amount: json["amount"],
        amountCapturable: json["amount_capturable"],
        amountDetails: AmountDetails.fromJson(json["amount_details"]),
        amountReceived: json["amount_received"],
        application: json["application"],
        applicationFeeAmount: json["application_fee_amount"],
        automaticPaymentMethods: AutomaticPaymentMethods.fromJson(json["automatic_payment_methods"]),
        canceledAt: json["canceled_at"],
        cancellationReason: json["cancellation_reason"],
        captureMethod: json["capture_method"],
        clientSecret: json["client_secret"],
        confirmationMethod: json["confirmation_method"],
        created: json["created"],
        currency: json["currency"],
        customer: json["customer"],
        description: json["description"],
        invoice: json["invoice"],
        lastPaymentError: json["last_payment_error"],
        latestCharge: json["latest_charge"],
        livemode: json["livemode"],
        metadata: Metadata.fromJson(json["metadata"]),
        nextAction: json["next_action"],
        onBehalfOf: json["on_behalf_of"],
        paymentMethod: json["payment_method"],
        paymentMethodConfigurationDetails: json["payment_method_configuration_details"],
        paymentMethodOptions: PaymentMethodOptions.fromJson(json["payment_method_options"]),
        paymentMethodTypes: List<String>.from(json["payment_method_types"].map((x) => x)),
        processing: json["processing"],
        receiptEmail: json["receipt_email"],
        review: json["review"],
        setupFutureUsage: json["setup_future_usage"],
        shipping: json["shipping"],
        source: json["source"],
        statementDescriptor: json["statement_descriptor"],
        statementDescriptorSuffix: json["statement_descriptor_suffix"],
        status: json["status"],
        transferData: json["transfer_data"],
        transferGroup: json["transfer_group"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "object": object,
        "amount": amount,
        "amount_capturable": amountCapturable,
        "amount_details": amountDetails.toJson(),
        "amount_received": amountReceived,
        "application": application,
        "application_fee_amount": applicationFeeAmount,
        "automatic_payment_methods": automaticPaymentMethods.toJson(),
        "canceled_at": canceledAt,
        "cancellation_reason": cancellationReason,
        "capture_method": captureMethod,
        "client_secret": clientSecret,
        "confirmation_method": confirmationMethod,
        "created": created,
        "currency": currency,
        "customer": customer,
        "description": description,
        "invoice": invoice,
        "last_payment_error": lastPaymentError,
        "latest_charge": latestCharge,
        "livemode": livemode,
        "metadata": metadata.toJson(),
        "next_action": nextAction,
        "on_behalf_of": onBehalfOf,
        "payment_method": paymentMethod,
        "payment_method_configuration_details": paymentMethodConfigurationDetails,
        "payment_method_options": paymentMethodOptions.toJson(),
        "payment_method_types": List<dynamic>.from(paymentMethodTypes.map((x) => x)),
        "processing": processing,
        "receipt_email": receiptEmail,
        "review": review,
        "setup_future_usage": setupFutureUsage,
        "shipping": shipping,
        "source": source,
        "statement_descriptor": statementDescriptor,
        "statement_descriptor_suffix": statementDescriptorSuffix,
        "status": status,
        "transfer_data": transferData,
        "transfer_group": transferGroup,
    };
}

class AmountDetails {
    final Metadata tip;

    AmountDetails({
        required this.tip,
    });

    factory AmountDetails.fromRawJson(String str) => AmountDetails.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AmountDetails.fromJson(Map<String, dynamic> json) => AmountDetails(
        tip: Metadata.fromJson(json["tip"]),
    );

    Map<String, dynamic> toJson() => {
        "tip": tip.toJson(),
    };
}

class Metadata {
    Metadata();

    factory Metadata.fromRawJson(String str) => Metadata.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
    );

    Map<String, dynamic> toJson() => {
    };
}

class AutomaticPaymentMethods {
    final String allowRedirects;
    final bool enabled;

    AutomaticPaymentMethods({
        required this.allowRedirects,
        required this.enabled,
    });

    factory AutomaticPaymentMethods.fromRawJson(String str) => AutomaticPaymentMethods.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AutomaticPaymentMethods.fromJson(Map<String, dynamic> json) => AutomaticPaymentMethods(
        allowRedirects: json["allow_redirects"],
        enabled: json["enabled"],
    );

    Map<String, dynamic> toJson() => {
        "allow_redirects": allowRedirects,
        "enabled": enabled,
    };
}

class PaymentMethodOptions {
    final Card card;

    PaymentMethodOptions({
        required this.card,
    });

    factory PaymentMethodOptions.fromRawJson(String str) => PaymentMethodOptions.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PaymentMethodOptions.fromJson(Map<String, dynamic> json) => PaymentMethodOptions(
        card: Card.fromJson(json["card"]),
    );

    Map<String, dynamic> toJson() => {
        "card": card.toJson(),
    };
}

class Card {
    final Installments installments;
    final dynamic mandateOptions;
    final dynamic network;
    final String requestThreeDSecure;

    Card({
        required this.installments,
        required this.mandateOptions,
        required this.network,
        required this.requestThreeDSecure,
    });

    factory Card.fromRawJson(String str) => Card.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Card.fromJson(Map<String, dynamic> json) => Card(
        installments: Installments.fromJson(json["installments"]),
        mandateOptions: json["mandate_options"],
        network: json["network"],
        requestThreeDSecure: json["request_three_d_secure"],
    );

    Map<String, dynamic> toJson() => {
        "installments": installments.toJson(),
        "mandate_options": mandateOptions,
        "network": network,
        "request_three_d_secure": requestThreeDSecure,
    };
}

class Installments {
    final List<dynamic> availablePlans;
    final bool enabled;
    final dynamic plan;

    Installments({
        required this.availablePlans,
        required this.enabled,
        required this.plan,
    });

    factory Installments.fromRawJson(String str) => Installments.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Installments.fromJson(Map<String, dynamic> json) => Installments(
        availablePlans: List<dynamic>.from(json["available_plans"].map((x) => x)),
        enabled: json["enabled"],
        plan: json["plan"],
    );

    Map<String, dynamic> toJson() => {
        "available_plans": List<dynamic>.from(availablePlans.map((x) => x)),
        "enabled": enabled,
        "plan": plan,
    };
}
