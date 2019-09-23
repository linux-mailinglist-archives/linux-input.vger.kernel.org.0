Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30B99BACBB
	for <lists+linux-input@lfdr.de>; Mon, 23 Sep 2019 04:43:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729301AbfIWCnM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 22 Sep 2019 22:43:12 -0400
Received: from mail-eopbgr80070.outbound.protection.outlook.com ([40.107.8.70]:30756
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729208AbfIWCnL (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 22 Sep 2019 22:43:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WWGExeEh32Hh3t8E0MCJ2yOiM5FQoeY1bGkn63JNmdOZ4Uoa5/GuW88NoKvjIIlHZmf0bouZpBW1bPR0DQ2fRdluXEP/dC/H9laasbWEqkh5QD6fNA5US9YoH1hHNSUa0HVIayNybvTkN7j8Tr9n37THaTCvLC6BmjZ5s8IggtBuOQssIFGC/B+yOmT4bLdfVjDsBiHXFlrPt7xpU1c3FPEhi52nxKaadZaI1n96Y/ECPQR7R/q/8lNwFLkDPTStJbcPAN9RcxE2Hq5hWC6bdWJRa8IVFMeLe8+uDkEEtvf1gVS4hL37p5fagOfmlEvJIg3UZ0KZMnk6p8O8EoGPtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kZ3WwySqHZpVC3nCDqJzq9KyMX1d7jOomWbYLq2ukYw=;
 b=kakvkf1wcBmKe4liDdoCy2bA7X4w5kft6t5jBNIrNMwVDQbrDv+yJ9czFwriBlHsLn8yJmta9mByMCh61A6E2+8owHzQIz9Pig15H1vZgPd0fqbp97Mo3bteYCeAhMaWyvVtvU1hL3Hjg1O2NMePEQROCZrGNahY7moxr/25O8kXLzP4WsWAUOJR1RsSMK39s3luGwb0HmjNDBZTjPV6e/daUBaftmeqvNuOiMrdy84IFcQahfddX/d70asVXPBgKJbjXn1531I90fjbI0e+di7TPTLOKPL8X+6FiFdl+dpkXVsJPsBJv1JdC35bLBu3JKHB9ihqSPcKojjlosKiWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kZ3WwySqHZpVC3nCDqJzq9KyMX1d7jOomWbYLq2ukYw=;
 b=Qu4GPOCjRgkNDSl39ZZj/wVddzU0m642lTw5rSHWtHTZ3Lj4tHPbZ3qtOvg75c/EHqsX4RTpx9UdYYvJdd6tq/mnUjomIMCnLQOnUsvF3q7Fl7r+zf6OGaisjaxT6NO9eMdA1EpBfqZfJncYPdA4Th0u4PoPj0aoIx7ccez6PdQ=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) by
 DB3PR0402MB3643.eurprd04.prod.outlook.com (52.134.66.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.23; Mon, 23 Sep 2019 02:43:04 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::8958:299c:bc54:2a38]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::8958:299c:bc54:2a38%7]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 02:43:04 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Pavel Machek <pavel@ucw.cz>
CC:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
        "will@kernel.org" <will@kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        Andy Duan <fugang.duan@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        "olof@lixom.net" <olof@lixom.net>,
        "mripard@kernel.org" <mripard@kernel.org>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>,
        "dinguyen@kernel.org" <dinguyen@kernel.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "marcin.juszkiewicz@linaro.org" <marcin.juszkiewicz@linaro.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "yuehaibing@huawei.com" <yuehaibing@huawei.com>,
        "cw00.choi@samsung.com" <cw00.choi@samsung.com>,
        "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>,
        "m.felsch@pengutronix.de" <m.felsch@pengutronix.de>,
        Jacky Bai <ping.bai@nxp.com>,
        "ronald@innovation.ch" <ronald@innovation.ch>,
        "stefan@agner.ch" <stefan@agner.ch>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH V4 2/5] input: keyboard: imx_sc: Add i.MX system
 controller key support
Thread-Topic: [PATCH V4 2/5] input: keyboard: imx_sc: Add i.MX system
 controller key support
Thread-Index: AQHVbDoTG9IptYOIlUSe8in/1bTkN6cu+20AgAAdosCACNAggIAArZGA
Date:   Mon, 23 Sep 2019 02:43:04 +0000
Message-ID: <DB3PR0402MB39164F6EB8141BA5CC4F26FCF5850@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1568602373-14164-1-git-send-email-Anson.Huang@nxp.com>
 <1568602373-14164-2-git-send-email-Anson.Huang@nxp.com>
 <20190916235330.GI237523@dtor-ws>
 <DB3PR0402MB3916859326C76BC9BC1F781CF58F0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <20190922161432.GE1999@bug>
In-Reply-To: <20190922161432.GE1999@bug>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=anson.huang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4408efaa-c25f-4aee-1ace-08d73fcfc259
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DB3PR0402MB3643;
x-ms-traffictypediagnostic: DB3PR0402MB3643:|DB3PR0402MB3643:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0402MB3643932DA00AB294F52AC51FF5850@DB3PR0402MB3643.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0169092318
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(376002)(396003)(39860400002)(136003)(366004)(199004)(189003)(316002)(9686003)(14454004)(6246003)(66946007)(186003)(26005)(6916009)(25786009)(86362001)(478600001)(4326008)(66446008)(64756008)(11346002)(66476007)(66556008)(52536014)(446003)(5660300002)(76116006)(102836004)(7696005)(256004)(76176011)(99286004)(81156014)(486006)(3846002)(66066001)(71190400001)(71200400001)(6506007)(8936002)(8676002)(81166006)(7416002)(2906002)(476003)(305945005)(7736002)(6116002)(74316002)(44832011)(229853002)(6436002)(55016002)(54906003)(33656002);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3643;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: K6s2ph1cijMBXRPia0JJifM4zEgMRqFIrfi42wGGQJdFAPFxnN5XeB2nwdz/RiHKIkweTI4qylbOg+6XKE4t0SZQqetmrdYtsOrri9JGw+nUYiF5xpeTeZSMDwj8yDD8IWnJOWsAnjiZxoM3s5cEn5uE1O+LtBoxnRCnLOL5gujSIHQuIcYoozE9BTiycVUbKO5aaJO1wnhtrUcUt4ABvoPmho1gCN1bUuIXCTOJdr1h+H3/mtWN4U+x9yLnzcl6mBchC0QF2Sdt/NgUGBhNAw7KOVNFRF9aceriY9/8/emIMW0iAvnYjghLSfTd26iJOsEij+NhypzpNnGFBnyKMtQPanXT5HjVuoUl6tyQdO9g/EpTqAzsPhHIGInE+u75n96SSRcSeHc+9SSAxK0Yux/eOvoAMst/T/ookruszos=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4408efaa-c25f-4aee-1ace-08d73fcfc259
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 02:43:04.6115
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SpKDS5+vS2eabR49MXeoOr0S65YqxLagLrrgrbA0QqoImE6JCoYubS2OTZvbngGy2sBPgtyO5fEc0npp5l92+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3643
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

SGksIFBhdmVsDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCBWNCAyLzVdIGlucHV0OiBrZXlib2Fy
ZDogaW14X3NjOiBBZGQgaS5NWCBzeXN0ZW0NCj4gY29udHJvbGxlciBrZXkgc3VwcG9ydA0KPiAN
Cj4gSGkhDQo+IA0KPiA+ID4gPiArCXJldCA9IGlteF9zY3VfY2FsbF9ycGMocHJpdi0+a2V5X2lw
Y19oYW5kbGUsICZtc2csIHRydWUpOw0KPiA+ID4gPiArCWlmIChyZXQpIHsNCj4gPiA+ID4gKwkJ
ZGV2X2VycigmaW5wdXQtPmRldiwgInJlYWQgaW14IHNjIGtleSBmYWlsZWQsIHJldCAlZFxuIiwg
cmV0KTsNCj4gPiA+ID4gKwkJcmV0dXJuOw0KPiA+ID4gPiArCX0NCj4gPiA+ID4gKw0KPiA+ID4g
PiArCXN0YXRlID0gKGJvb2wpbXNnLnN0YXRlOw0KPiA+ID4gPiArDQo+ID4gPiA+ICsJaWYgKCFz
dGF0ZSAmJiAhcHJpdi0+a2V5c3RhdGUpDQo+ID4gPiA+ICsJCXN0YXRlID0gdHJ1ZTsNCj4gPiA+
DQo+ID4gPiBUaGlzIG5lZWRzIGFuIGV4cGxhbmF0aW9uIHBsZWFzZS4NCj4gPg0KPiA+IFRoaXMg
aXMgdG8gaGFuZGxlIHRoZSBxdWljayBwcmVzcyBvZiBidXR0b24sIGUuZy4sIHdoZW4gYnV0dG9u
IGlzDQo+ID4gcHJlc3NlZCBhbmQgcmVsZWFzZWQgdmVyeSBxdWlja2x5LCB3aGVuIHRoZSBkZWxh
eSB3b3JrIGlzIHNjaGVkdWxlZCwNCj4gPiB0aGUgYnV0dG9uIHN0YXRlIHJlYWQgZnJvbSBTQ1Ug
RlcgaXMgYWN0dWFsbHkgYSByZWxlYXNlIHN0YXRlICgwKSwgdGhlIHByZXNzDQo+IHN0YXRlIGlz
ICgxKSwgc28gdGhlIHF1aWNrIHByZXNzL3JlbGVhc2Ugd2lsbCBiZSBpZ25vcmVkLg0KPiA+DQo+
ID4gSG93ZXZlciwgYWZ0ZXIgZG91YmxlIGNoZWNrIGFuZCB0ZXN0LCBJIHRoaW5rIHRoaXMgc2hv
dWxkIGJlIGhhbmRsZWQNCj4gPiBieSBkZWJvdW5jZSB0aW1lLCBpZiB0aGUgYnV0dG9uIGlzIHBy
ZXNzZWQvcmVsZWFzZSB2ZXJ5IHF1aWNrbHksIHRoZQ0KPiA+IGV2ZW50IHNob3VsZCBiZSBpZ25v
cmVkLCBJIHdpbGwgcmVtb3ZlIGl0IGFuZCByZWR1Y2UgdGhlIGRlYm91bmNlIHRpbWUgdG8NCj4g
MzBtUywgcHJldmlvdXMgMTAwbVMgaXMgdG9vIGxvbmcsIHVzaW5nIDMwbVMgYXMgZGVib3VuY2Ug
dGltZSwgSSBkaWQgTk9UDQo+IHNlZSBzaW1pbGFyIGlzc3VlIG5vIG1hdHRlciBob3cgcXVpY2sg
SSBwcmVzcy9yZWxlYXNlIHRoZSBidXR0b24uDQo+IA0KPiBBcmUgeW91IHN1cmUgdGhpcyBpcyBl
eHBlY3RlZCBiZWhhdmlvdXI/DQo+IA0KPiBBRkFJSyBtaWNyb3N3aXRjaGVzIGNhbiBib3VuY2Ug
d2hlbiB0aGUgYnV0dG9uIGlzIHByZXNzZWQgYW5kIHJlbGVhc2VkLA0KPiBidXQgd2lsbCBub3Qg
Z2VuZXJhdGUgZ2xpdGNoZXMgd2hlbiB0aGUgYnV0dG9uIHdhcyBub3QgcHJlc3NlZCwgc28gZXZl
bg0KPiBzaG9ydCBwcmVzc2VzIGFyZSByZWFsIGFuZCBzaG91bGQgYmUgcHJvcGFnYXRlZC4uLg0K
DQpMYXRlc3QgdmVyc2lvbiBvZiBwYXRjaCBoYW5kbGUgdGhlIHF1aWNrIHByZXNzIGFzIGJlbG93
Og0KDQotIFdoZW4gdGhlIGJ1dHRvbiBpcyBwcmVzc2VkLCB0aGUgZGVsYXllZCB3b3JrIHdpbGwg
YmUgc2NoZWR1bGVkOw0KLSBJbiB0aGUgZGVsYXllZCB3b3JrLCB0aGUgYnV0dG9uIHN0YXRlIHdp
bGwgYmUgcmVhZCwgb25jZSB0aGUgc3RhdGUgaXMgZGlmZmVyZW50IGFzIHByZXZpb3VzDQogIHN0
YXRlLCBpdCB3aWxsIGJlIHByb3BhZ2F0ZWQ7DQotIElmIHRoZSBzdGF0ZSBpcyBhIHByZXNzIHN0
YXRlLCBhbm90aGVyIGRlbGF5ZWQgd29yayB3aWxsIGJlIHNjaGVkdWxlZCBmb3IgaGFuZGxpbmcg
cmVsZWFzZQ0KICBldmVudC4NCg0KU28gdGhlcmUgY291bGQgYmUgYSBzbWFsbCB3aW5kb3cgb2Yg
REVCT1VOQ0VfVElNRSAoMzBtUykgYmV0d2VlbiBidXR0b24gcHJlc3MgYW5kIHRoZSBkZWxheWVk
DQp3b3JrIHNjaGVkdWxlZCBmb3IgcmVhZGluZyB0aGUgYnV0dG9uIHN0YXRlLCBpZiB0aGUgYnV0
dG9uIGlzIHJlbGVhc2VkIGluIGxlc3MgdGhhbiAzMG1zLCB0aGVuIHRoZQ0Kc3RhdGUgcmVhZCBj
b3VsZCBiZSBhIHJlbGVhc2Ugc3RhdGUgd2hpY2ggaXMgc2FtZSBhcyBwcmV2aW91cyBzdGF0ZSBh
bmQgaXQgd2lsbCBiZSBpZ25vcmVkLg0KDQpEbyB5b3UgdGhpbmsgaW4gdGhpcyBjYXNlLCB3ZSBz
aG91bGQgYWxzbyBwcm9wYWdhdGVkIHRoZSBwcmVzcyBldmVudD8gSWYgeWVzLCB0aGVuIHdoYXQg
YWJvdXQgdGhlDQpyZWxlYXNlIGV2ZW50PyBBbHRob3VnaCBmcm9tIHdoYXQgSSB0ZXN0ZWQsIG5v
IG1hdHRlciBob3cgcXVpY2sgSSBwcmVzcyB0aGUgYnV0dG9uLCB0aGUgZHJpdmVyDQpjYW4gYWx3
YXlzIHJlY2VpdmUgYm90aCB0aGUgcHJlc3MgYW5kIHJlbGVhc2UgZXZlbnQsIGFzIHRoZSAzMG1T
IGlzIHZlcnkgc2hvcnQuDQoNClRoYW5rcywNCkFuc29uIA0K
