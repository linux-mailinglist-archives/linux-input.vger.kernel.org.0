Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 608D12B04E7
	for <lists+linux-input@lfdr.de>; Thu, 12 Nov 2020 13:20:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728010AbgKLMUl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Nov 2020 07:20:41 -0500
Received: from mail-eopbgr70048.outbound.protection.outlook.com ([40.107.7.48]:60404
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727035AbgKLMUk (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Nov 2020 07:20:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dbmQHzbE4oxEJybOq7exN4ZNc0ifzcZZTwAz/Vc3gRodDXjXafM6Ga17MI2hc8TInH+uVHNcVegtzSEsSacZS96yUXUJj6aq23erdUOGlZxWXbp1pdJQITVEideD6jPqtzV6z8p092PeGhogku5EX0sRKhxXuwoyxOXL+Soa4Hvhwjcl7ygCyeD3jRxPvf0ZE7oKYYZXdGXq/iPl/xhhqINh7yZqLKogcQPzNP24sflYlDMRfflgoefdv2/qeZItsnJltYcnQS+aRehHM56EVJeZtxYhnqct1qoSnYHiPO2bP06SukXEtUzTXKVKiy+Oer2QQlS3tOnvKhjv9vvDSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QA3F3IaQRpRHOiRS6j4VQSMa5BjTrXFVS/S9I4GoYCg=;
 b=U4j/ISSgA7sgTDp1NXyz5Mq5EwqtGWom6BNJKZ8ABMr0VERmyYZXLF0Q2ODxyTIAsOCRyklHnAh56TAKMFBQd2bCO1Tr5Dn4H9mNpi8cVL57qRsjmbA8MpVxbyB301pe2qnUJTFsEFVoBp0ZtyRRaiNNgPzBqdmYAysVg7sMMxH35e30JA+n7soSD8hs54ePbbFMh+4NzOmr3fpl9JnReyVQ+nO4s50cayWA8UJW6YJo777MT+zDcOQNuFWovwkRh2MMzxAAnbBIOWDzNSUlj4pfsWmERpOFZVbcuoMXhYD0/XbhJHnh1/An8f5QKODdY9p+FnwS/OXPJNWa1lEUqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QA3F3IaQRpRHOiRS6j4VQSMa5BjTrXFVS/S9I4GoYCg=;
 b=DyH9opCLPEvsvqZuBb4IN+iu78CCO2CJVZc+6NGxNul4gChkP6ECc05UlWnfRpDoMGn+hrJ2XVqLJ4/NRY0yyUrDVYmrghmGf0DexXxhLj8i2/uGhaNTkeXrRC8RmEEPzNwKZmNoPm+0qfhkfG47CJGupc3Oleu7u6FlMVDJ5bM=
Received: from VI1PR04MB5294.eurprd04.prod.outlook.com (2603:10a6:803:5a::22)
 by VE1PR04MB6701.eurprd04.prod.outlook.com (2603:10a6:803:124::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Thu, 12 Nov
 2020 12:20:32 +0000
Received: from VI1PR04MB5294.eurprd04.prod.outlook.com
 ([fe80::55e4:aa36:fd88:3b93]) by VI1PR04MB5294.eurprd04.prod.outlook.com
 ([fe80::55e4:aa36:fd88:3b93%7]) with mapi id 15.20.3541.025; Thu, 12 Nov 2020
 12:20:32 +0000
From:   Bough Chen <haibo.chen@nxp.com>
To:     Lee Jones <lee.jones@linaro.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Haibo Chen <haibo.chen@freescale.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: RE: [PATCH 05/15] input: touchscreen: imx6ul_tsc: Remove set but
 unused variable 'value'
Thread-Topic: [PATCH 05/15] input: touchscreen: imx6ul_tsc: Remove set but
 unused variable 'value'
Thread-Index: AQHWuONINYhKWUleCkepUWe83cGEd6nEaijw
Date:   Thu, 12 Nov 2020 12:20:31 +0000
Message-ID: <VI1PR04MB529451BA4FB237FA6C811E0790E70@VI1PR04MB5294.eurprd04.prod.outlook.com>
References: <20201112110204.2083435-1-lee.jones@linaro.org>
 <20201112110204.2083435-6-lee.jones@linaro.org>
In-Reply-To: <20201112110204.2083435-6-lee.jones@linaro.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: fb748918-4ca7-45db-6599-08d887055992
x-ms-traffictypediagnostic: VE1PR04MB6701:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB670150950E8C5F145CD7CB6090E70@VE1PR04MB6701.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:206;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: naMmPvwhXNBgNoWdUxE3+pNGJFAbttTokewVmz5Htaf57ON7BDWbtkVckZI66U22hCbns0Gpw1rN6CniANSZMxm5YA+8I7Y6IRWNoArbUeaHc+DkC3LBUKkyAzyzO+FY53kP5h1SiWjciX2YBmRO6NQ0obasHDWnIkK5ZP5s90vPKOWzya9KxE1lQLL20Evw7wNPrj4NjpKW7I1FQeqhpGhksOsEhjndOL4W7+lZIZWZSdvmaKznWhe9aLlehEICVtD7uZZtbpjAoxaActd7HogajLSJCOCV/X9e4twEMeR6N9BYUpYIIQlbuQbMsmQ7OPa/y5uSYiq15bOV6kjHvQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5294.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(39860400002)(376002)(366004)(71200400001)(5660300002)(76116006)(64756008)(66946007)(66446008)(8676002)(83380400001)(478600001)(4326008)(26005)(316002)(54906003)(55016002)(9686003)(7696005)(6506007)(53546011)(52536014)(86362001)(186003)(66556008)(6916009)(2906002)(8936002)(33656002)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: YHc89F0Z8J6Wxtet24NYWawSJRzXTng/O3dSsCpJspT+eNegb2mQeA/yAHivTIhAIr9AQmm1YbU3mnkDKTi/29KPFH1OLT1tDT3SwE5+/3eZ/viPRUCTA46MJRBiBz95eWS2YvWlq7i36vLRrnId/NP9CeL/ZSmEVTwnmkXc7DULLbhpiLl25QfjOvR8PfGGcxGdjJqOpqSCIkabJYiGV7C/UG1woWd/F5WboqRGXEplxG4/OXrUwW6iEXbYJspaaLt0Xd071kDnZJvN6bV0Z2BTfjKDn1uH+PjOdP9YB6pUck4qT/cWm8xhZuEw2iTdD54UBAHmH/TViNr+TOw2+tbB9n0l0MdwTuCIhoYdI6s1Y64qwCZw+3M1Zm9X26pRuva9iw9gcVZrIxODwaTEvuddafa3VcxV5A+Cpx2aeklIGyRW61ZFu2hrnAwLxZXmSWs7TyMIgqsu9El+R1HNcS2aZeYP64NsapO39id/HoLu+XPkVvb0d9+Ps+hvIZ6OHZB1BnYE6FvdS2QhVIWPXHMuWcysgA6BNAyhhzDgc69zgZ6TfRQfVaf+OONKVeoq6WtSvggEQFqgf1wgBEEbkCaJ8TU4daerKkVvzllWyZbZtSbkKxYYtGau8Tbx833k6pxTpEeYs3hvRraTZ/q9qvVvySbF3oPTgfsWq2vjWl+nCB2uaGc/XEef6dGtYOSYVSbi6mnIvUjtt6UW0wRdwyfjfJEVde92GJ3gs7erLNolcP+lou/60jxcBuTlwUuiFhJOhbHuZbGRstQJ06qw8NZ1V2uYoX/QV/XEcLIXa0m9q0J/fJibHZV3cCtZXLF3+rKIi1JfMN8gqdJZeVby7jVUEcap1v21CFdla3xItz+Q6CTOCJfMl0x9+EE3xbDJFVmqRYvI2JUtECJVXLGzBA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5294.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb748918-4ca7-45db-6599-08d887055992
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2020 12:20:31.9228
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ydtqAGE2nRUlBXS2cVJcklW5ikbKJE1goN5th5EbmRAzYPSOO/OVbJ6N0l0VkKMOyO/tJ8fH2QzMijnFY/j14g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6701
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMZWUgSm9uZXMgW21haWx0bzps
ZWUuam9uZXNAbGluYXJvLm9yZ10NCj4gU2VudDogMjAyMOW5tDEx5pyIMTLml6UgMTk6MDINCj4g
VG86IGxlZS5qb25lc0BsaW5hcm8ub3JnDQo+IENjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwu
b3JnOyBEbWl0cnkgVG9yb2tob3YNCj4gPGRtaXRyeS50b3Jva2hvdkBnbWFpbC5jb20+OyBTaGF3
biBHdW8gPHNoYXduZ3VvQGtlcm5lbC5vcmc+OyBTYXNjaGENCj4gSGF1ZXIgPHMuaGF1ZXJAcGVu
Z3V0cm9uaXguZGU+OyBQZW5ndXRyb25peCBLZXJuZWwgVGVhbQ0KPiA8a2VybmVsQHBlbmd1dHJv
bml4LmRlPjsgRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPjsNCj4gZGwtbGludXgt
aW14IDxsaW51eC1pbXhAbnhwLmNvbT47IEhhaWJvIENoZW4gPGhhaWJvLmNoZW5AZnJlZXNjYWxl
LmNvbT47DQo+IGxpbnV4LWlucHV0QHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBbUEFUQ0gg
MDUvMTVdIGlucHV0OiB0b3VjaHNjcmVlbjogaW14NnVsX3RzYzogUmVtb3ZlIHNldCBidXQgdW51
c2VkDQo+IHZhcmlhYmxlICd2YWx1ZScNCj4gDQo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtl
cm5lbCBidWlsZCB3YXJuaW5nKHMpOg0KPiANCj4gIGRyaXZlcnMvaW5wdXQvdG91Y2hzY3JlZW4v
aW14NnVsX3RzYy5jOiBJbiBmdW5jdGlvbiDigJhhZGNfaXJxX2Zu4oCZOg0KPiAgZHJpdmVycy9p
bnB1dC90b3VjaHNjcmVlbi9pbXg2dWxfdHNjLmM6MzA3OjY6IHdhcm5pbmc6IHZhcmlhYmxlIOKA
mHZhbHVl4oCZIHNldA0KPiBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVd
DQo+IA0KPiBDYzogRG1pdHJ5IFRvcm9raG92IDxkbWl0cnkudG9yb2tob3ZAZ21haWwuY29tPg0K
PiBDYzogU2hhd24gR3VvIDxzaGF3bmd1b0BrZXJuZWwub3JnPg0KPiBDYzogU2FzY2hhIEhhdWVy
IDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPg0KPiBDYzogUGVuZ3V0cm9uaXggS2VybmVsIFRlYW0g
PGtlcm5lbEBwZW5ndXRyb25peC5kZT4NCj4gQ2M6IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdt
YWlsLmNvbT4NCj4gQ2M6IE5YUCBMaW51eCBUZWFtIDxsaW51eC1pbXhAbnhwLmNvbT4NCj4gQ2M6
IEhhaWJvIENoZW4gPGhhaWJvLmNoZW5AZnJlZXNjYWxlLmNvbT4NCj4gQ2M6IGxpbnV4LWlucHV0
QHZnZXIua2VybmVsLm9yZw0KPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0Bs
aW5hcm8ub3JnPg0KPiAtLS0NCj4gIGRyaXZlcnMvaW5wdXQvdG91Y2hzY3JlZW4vaW14NnVsX3Rz
Yy5jIHwgMyArLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlv
bnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lucHV0L3RvdWNoc2NyZWVuL2lteDZ1
bF90c2MuYw0KPiBiL2RyaXZlcnMvaW5wdXQvdG91Y2hzY3JlZW4vaW14NnVsX3RzYy5jDQo+IGlu
ZGV4IGNkMzY5ZjlhYzVlNjAuLmUxODUyZjdkNGQzMWUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
aW5wdXQvdG91Y2hzY3JlZW4vaW14NnVsX3RzYy5jDQo+ICsrKyBiL2RyaXZlcnMvaW5wdXQvdG91
Y2hzY3JlZW4vaW14NnVsX3RzYy5jDQo+IEBAIC0zMDQsMTEgKzMwNCwxMCBAQCBzdGF0aWMgaXJx
cmV0dXJuX3QgYWRjX2lycV9mbihpbnQgaXJxLCB2b2lkICpkZXZfaWQpDQo+IHsNCj4gIAlzdHJ1
Y3QgaW14NnVsX3RzYyAqdHNjID0gZGV2X2lkOw0KPiAgCXUzMiBjb2NvOw0KPiAtCXUzMiB2YWx1
ZTsNCj4gDQo+ICAJY29jbyA9IHJlYWRsKHRzYy0+YWRjX3JlZ3MgKyBSRUdfQURDX0hTKTsNCj4g
IAlpZiAoY29jbyAmIDB4MDEpIHsNCj4gLQkJdmFsdWUgPSByZWFkbCh0c2MtPmFkY19yZWdzICsg
UkVHX0FEQ19SMCk7DQo+ICsJCXJlYWRsKHRzYy0+YWRjX3JlZ3MgKyBSRUdfQURDX1IwKTsNCj4g
IAkJY29tcGxldGUoJnRzYy0+Y29tcGxldGlvbik7DQo+ICAJfQ0KPiANCg0KUmV2aWV3ZWQtYnk6
IEhhaWJvIENoZW4gPGhhaWJvLmNoZW5AbnhwLmNvbT4NCg0KPiAtLQ0KPiAyLjI1LjENCg0K
