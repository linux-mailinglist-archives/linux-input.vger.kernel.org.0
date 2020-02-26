Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E99F16F4E7
	for <lists+linux-input@lfdr.de>; Wed, 26 Feb 2020 02:15:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729403AbgBZBP3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 25 Feb 2020 20:15:29 -0500
Received: from mail-eopbgr20071.outbound.protection.outlook.com ([40.107.2.71]:15106
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729346AbgBZBP2 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 25 Feb 2020 20:15:28 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M4kTsX/8lPw23g2JEViK32KQgp1V9GKQdq4WgI2iybR0B7BoyizG1IWeYMP0BpxFBY3/6+6grnAOTJcMSKVvQDkJZcbLZkUnLBRj8pNnk/RAPDTAlzoBNjLJj8xmqQ9aoF29PJ1R2YR5ceDzviW+s5CfRtFeycQtyiShf/lGeLE+TnzHsF4CdHavjJ2MzEsr7NyKJzZr/6vMUGE1Zm/E3TlHDVfJ5Kbkg92Svdxr7/XnHbgRTAjQDRhuz1QpBI4QWmsDI8J/JL5rczIqAeadMWrRMpwNdCVGOyyTpjdSq8LUWMSMNfyC4EZrrpt9mTFr5gArbeSnMa3Xhhdq52Pm7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YGwBXjH65ANMue6vNN9DogQv5/N4MeZ6TOk1IlhLwDA=;
 b=kDslWEY3qVd9BD6+Zm0rnGbAvZ08dQQJGCApLbHO8bbukDQqJWPYDfC8NSskX5LnsoVUBKN0MeoERg/YD4h3sLkxqDMnIBZ9rKLNnS2qecDAAzVjAMOsY+Ggb5HLsawrdgc/ZAoZ+wt2SKfW9FI5zS8Ks/C4J7vIGnkGnlVowBO9uGGqREJ7u5Y9igMbvweKZlyITi3ZMEdIe4onT1S3X+plRDRyR+zAxiEtjqXWIfqzC2ViU7mSrjRwVN1fdpcGbHc5uebuBTUjzVEIucrqk+dFAzCEh+mg7kPfegPW6AiP7PpCnPLrHRzRaACz/K5JE6rBvXMjX57zJSvZEfygcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YGwBXjH65ANMue6vNN9DogQv5/N4MeZ6TOk1IlhLwDA=;
 b=lg7DwZROa9FZariLitQ1t4cknvEJJfDUW2utvenYPpUn9qiXhyYIBvdBGaq8iZy6tLXIgr12YRHfyZfIfo6Bnc/ph7I4860q3Gz6Rbf8zndll9tIAT+ZvTCLGqFreEqKPeRSDYfncPecYsT66xr1A0Y7/NfdDRssredzec7xeL4=
Received: from VE1PR04MB6638.eurprd04.prod.outlook.com (20.179.232.15) by
 VE1PR04MB6368.eurprd04.prod.outlook.com (20.179.232.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.22; Wed, 26 Feb 2020 01:15:23 +0000
Received: from VE1PR04MB6638.eurprd04.prod.outlook.com
 ([fe80::490:6caa:24b:4a31]) by VE1PR04MB6638.eurprd04.prod.outlook.com
 ([fe80::490:6caa:24b:4a31%6]) with mapi id 15.20.2750.021; Wed, 26 Feb 2020
 01:15:23 +0000
From:   Robin Gong <yibin.gong@nxp.com>
To:     =?utf-8?B?QW5kcsOpIERyYXN6aWs=?= <git@andred.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     Horia Geanta <horia.geanta@nxp.com>,
        Aymen Sghaier <aymen.sghaier@nxp.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Anson Huang <anson.huang@nxp.com>,
        "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: RE: [PATCH v2 6/6] Input: snvs_pwrkey - only IRQ_HANDLED for our own
 events
Thread-Topic: [PATCH v2 6/6] Input: snvs_pwrkey - only IRQ_HANDLED for our own
 events
Thread-Index: AQHV6/ZVtFBmLLNhAkqJunTqxVUTUqgsqtgA
Date:   Wed, 26 Feb 2020 01:15:23 +0000
Message-ID: <VE1PR04MB66385DDED7C654AE2181E08E89EA0@VE1PR04MB6638.eurprd04.prod.outlook.com>
References: <20200225161201.1975-1-git@andred.net>
 <20200225161201.1975-6-git@andred.net>
In-Reply-To: <20200225161201.1975-6-git@andred.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yibin.gong@nxp.com; 
x-originating-ip: [183.192.236.243]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: cc10a075-ff00-41d4-2862-08d7ba595b11
x-ms-traffictypediagnostic: VE1PR04MB6368:|VE1PR04MB6368:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB63684B6B47A524144CDB47AE89EA0@VE1PR04MB6368.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0325F6C77B
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(189003)(199004)(55016002)(9686003)(86362001)(54906003)(110136005)(2906002)(7696005)(66556008)(7416002)(478600001)(81166006)(8676002)(4326008)(52536014)(64756008)(8936002)(316002)(33656002)(5660300002)(66946007)(66446008)(81156014)(186003)(26005)(6506007)(71200400001)(66476007)(76116006);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR04MB6368;H:VE1PR04MB6638.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d7zUShpg7eyxbOvG8zAqJPMErvs+v0unSa80B6A7mOAtcu7O3ok53cMa2Ai31wULPC4XPf6MNxxQfGOLkQBvt6jYccR2XcY6GxfUfNHLW5XwvxaKFieF7q1dZ0Yu4UQJA5CaTA8NjWFNxmx8Mou3TA+xNJUEh8ffB0nrPWCFBTyOOHG/e/qpVeK3jHpLDq2SjxWY73yFlpCBzF70gT6vEjpVIPjDkrd6JxEjVr6VRBJ6pVLs0KYWzgWFvAqk/aNuf/bisZeU1mHQn4m6W4dda2g3uyz8zCURVgeWb/VIM3v71OiznCn8x7krgCq1aEsaPFcCWhEXsI22msjzTRIqgd0FcMqiryJ9GFvpiEZZq63+bLLg1M5xFdM3jPKCanV/EliwC18HkbkG32kXp+0DwURNW092MwRyLjv27dcxNBJEjUFjVDydyBoBejfUKrd0
x-ms-exchange-antispam-messagedata: ehWTJuhuKV0HSGWJKqBx22dy/5otLAvoOmv95+LwIXI3EdnSDek0aDbi18ubuUOzDvSdfjnN/Hy8LAaYWXoXgZnh9cWxoSUjoxHTEZ5QArKrLy7EI4FPvBD+/NflVJ0xl7UTF0tUJMY/Ut8PuU8dJA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc10a075-ff00-41d4-2862-08d7ba595b11
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2020 01:15:23.7811
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n2CfGAHRiJmFBrynKaiIDOS3hvtVcJXzfvZRVMO0K7/eM5QbIRdhu73tSPUjDL2yv+DZWVnYYKHl/BWN5A0WDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6368
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

T24gMjAyMC8wMi8yNiBBbmRyw6kgRHJhc3ppayA8Z2l0QGFuZHJlZC5uZXQ+IHdyb3RlOiANCj4g
VGhlIHNudnNfcHdya2V5IHNoYXJlcyB0aGUgU05WUyBMUFNSIHN0YXR1cyByZWdpc3RlciB3aXRo
IHRoZSBzbnZzX3J0Yy4NCj4gDQo+IFRoaXMgZHJpdmVyIGhlcmUgc2hvdWxkIG9ubHkgcmV0dXJu
IElSUV9IQU5ETEVEIGlmIHRoZSBzdGF0dXMgcmVnaXN0ZXINCj4gaW5kaWNhdGVzIHRoYXQgdGhl
IGV2ZW50IHdlJ3JlIGhhbmRsaW5nIGluIHRoZSBpcnEgaGFuZGxlciB3YXMgZ2VudWluZWx5DQo+
IGludGVuZGVkIGZvciB0aGlzIGRyaXZlci4gT3RoZXJpd3NlIHRoZSBpbnRlcnJ1cHQgc3Vic3lz
dGVtIHdpbGwgYXNzdW1lIHRoZQ0KPiBpbnRlcnJ1cHQgd2FzIGhhbmRsZWQgc3VjY2Vzc2Z1bGx5
IGV2ZW4gdGhvdWdoIGl0IHdhc24ndCBhdCBhbGwuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmRy
w6kgRHJhc3ppayA8Z2l0QGFuZHJlZC5uZXQ+DQo+IENjOiAiSG9yaWEgR2VhbnTEgyIgPGhvcmlh
LmdlYW50YUBueHAuY29tPg0KPiBDYzogQXltZW4gU2doYWllciA8YXltZW4uc2doYWllckBueHAu
Y29tPg0KPiBDYzogSGVyYmVydCBYdSA8aGVyYmVydEBnb25kb3IuYXBhbmEub3JnLmF1Pg0KPiBD
YzogIkRhdmlkIFMuIE1pbGxlciIgPGRhdmVtQGRhdmVtbG9mdC5uZXQ+DQo+IENjOiBSb2IgSGVy
cmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPg0KPiBDYzogTWFyayBSdXRsYW5kIDxtYXJrLnJ1dGxh
bmRAYXJtLmNvbT4NCj4gQ2M6IFNoYXduIEd1byA8c2hhd25ndW9Aa2VybmVsLm9yZz4NCj4gQ2M6
IFNhc2NoYSBIYXVlciA8cy5oYXVlckBwZW5ndXRyb25peC5kZT4NCj4gQ2M6IFBlbmd1dHJvbml4
IEtlcm5lbCBUZWFtIDxrZXJuZWxAcGVuZ3V0cm9uaXguZGU+DQo+IENjOiBGYWJpbyBFc3RldmFt
IDxmZXN0ZXZhbUBnbWFpbC5jb20+DQo+IENjOiBOWFAgTGludXggVGVhbSA8bGludXgtaW14QG54
cC5jb20+DQo+IENjOiBEbWl0cnkgVG9yb2tob3YgPGRtaXRyeS50b3Jva2hvdkBnbWFpbC5jb20+
DQo+IENjOiBBbnNvbiBIdWFuZyA8QW5zb24uSHVhbmdAbnhwLmNvbT4NCj4gQ2M6IFJvYmluIEdv
bmcgPHlpYmluLmdvbmdAbnhwLmNvbT4NCj4gQ2M6IGxpbnV4LWNyeXB0b0B2Z2VyLmtlcm5lbC5v
cmcNCj4gQ2M6IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnDQo+IENjOiBsaW51eC1hcm0ta2Vy
bmVsQGxpc3RzLmluZnJhZGVhZC5vcmcNCj4gQ2M6IGxpbnV4LWlucHV0QHZnZXIua2VybmVsLm9y
Zw0KPiANCj4gLS0tDQo+IHYyOg0KPiAqIG5vIGNoYW5nZXMNCj4gLS0tDQo+ICBkcml2ZXJzL2lu
cHV0L2tleWJvYXJkL3NudnNfcHdya2V5LmMgfCAxMiArKysrKysrLS0tLS0NCj4gIDEgZmlsZSBj
aGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9pbnB1dC9rZXlib2FyZC9zbnZzX3B3cmtleS5jDQo+IGIvZHJpdmVycy9pbnB1
dC9rZXlib2FyZC9zbnZzX3B3cmtleS5jDQo+IGluZGV4IDM4MmQyYWU4MmM5Yi4uOTgwODY3ODg2
YjM0IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2lucHV0L2tleWJvYXJkL3NudnNfcHdya2V5LmMN
Cj4gKysrIGIvZHJpdmVycy9pbnB1dC9rZXlib2FyZC9zbnZzX3B3cmtleS5jDQo+IEBAIC04Miw3
ICs4Miw5IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBpbXhfc252c19wd3JrZXlfaW50ZXJydXB0KGlu
dCBpcnEsIHZvaWQNCj4gKmRldl9pZCkNCj4gIAljbGtfZW5hYmxlKHBkYXRhLT5jbGspOw0KPiAN
Cj4gIAlyZWdtYXBfcmVhZChwZGF0YS0+c252cywgU05WU19MUFNSX1JFRywgJmxwX3N0YXR1cyk7
DQo+IC0JaWYgKGxwX3N0YXR1cyAmIFNOVlNfTFBTUl9TUE8pIHsNCj4gKwlscF9zdGF0dXMgJj0g
U05WU19MUFNSX1NQTzsNCj4gKw0KPiArCWlmIChscF9zdGF0dXMpIHsNCj4gIAkJaWYgKHBkYXRh
LT5taW5vcl9yZXYgPT0gMCkgew0KPiAgCQkJLyoNCj4gIAkJCSAqIFRoZSBmaXJzdCBnZW5lcmF0
aW9uIGkuTVhbNnw3XSBTb0NzIG9ubHkgc2VuZCBhbiBAQCAtOTgsMTQNCj4gKzEwMCwxNCBAQCBz
dGF0aWMgaXJxcmV0dXJuX3QgaW14X3NudnNfcHdya2V5X2ludGVycnVwdChpbnQgaXJxLCB2b2lk
DQo+ICpkZXZfaWQpDQo+ICAJCQltb2RfdGltZXIoJnBkYXRhLT5jaGVja190aW1lciwNCj4gIAkJ
CSAgICAgICAgICBqaWZmaWVzICsgbXNlY3NfdG9famlmZmllcyhERUJPVU5DRV9USU1FKSk7DQo+
ICAJCX0NCj4gLQl9DQo+IA0KPiAtCS8qIGNsZWFyIFNQTyBzdGF0dXMgKi8NCj4gLQlyZWdtYXBf
d3JpdGUocGRhdGEtPnNudnMsIFNOVlNfTFBTUl9SRUcsIFNOVlNfTFBTUl9TUE8pOw0KPiArCQkv
KiBjbGVhciBTUE8gc3RhdHVzICovDQo+ICsJCXJlZ21hcF93cml0ZShwZGF0YS0+c252cywgU05W
U19MUFNSX1JFRywgU05WU19MUFNSX1NQTyk7DQpCdXQgaXJxIHN0b3JtIHdpbGwgY29tZSBpbiBv
bmNlIHRoZXJlIGlzIG90aGVyIGludGVycnVwdCB0cmlnZ2VyZWQgYXMgdW5leHBlY3RlZCwNCmFs
dGhvdWdoIEkgbmV2ZXIgbWV0IGl0IGJlZm9yZS4gQ291bGQgd2UgZHJvcCB0aGlzIHBhdGNoIG5v
dz8gT3RoZXJzIGFyZSBvayBmb3IgbWUuDQoNClJldmlld2VkLWJ5OiBSb2JpbiBHb25nIDx5aWJp
bi5nb25nQG54cD4NCj4gKwl9DQo+IA0KPiAgCWNsa19kaXNhYmxlKHBkYXRhLT5jbGspOw0KPiAN
Cj4gLQlyZXR1cm4gSVJRX0hBTkRMRUQ7DQo+ICsJcmV0dXJuIGxwX3N0YXR1cyA/IElSUV9IQU5E
TEVEIDogSVJRX05PTkU7DQo+ICB9DQo+IA0KPiAgc3RhdGljIHZvaWQgaW14X3NudnNfcHdya2V5
X2FjdCh2b2lkICpwZGF0YSkNCj4gLS0NCj4gMi4yMy4wLnJjMQ0KDQo=
