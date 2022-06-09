var Options = {
    options: {
        methods: ["card"],
        cardIcons: ["mastercard", "visa", "diners-club", "american-express"],
        fields: false,
        title: "my_title",
        link: "https://shop.com",
        fullScreen: true,
        button: true,
        locales: ["en"],
        email: true,
        tooltip: true,
        fee: true
    },
    params: {
        merchant_id: 1396424,
        required_rectoken: "y",
        currency: "USD",
        amount: 500,
        order_desc: "my_order_desc",
        response_url: "http://shop.com/thankyoupage",
        email: "",
        lang: "ru"
    },
    messages: {
        ru: {
            card_number: "Номер карты",
            my_title: "Назначение платежа",
            my_order_desc: "Тестовый платеж",
            pay: "Оплатить"
        },
        en: {
            card_number: "Card number",
            my_title: "Order description",
            my_order_desc: "Test order",
            pay: "Pay now"
        }
    }
};

fondy("#app", Options);