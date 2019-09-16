Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7B08B3377
	for <lists+linux-input@lfdr.de>; Mon, 16 Sep 2019 04:44:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726887AbfIPCoZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 15 Sep 2019 22:44:25 -0400
Received: from mail-eopbgr10069.outbound.protection.outlook.com ([40.107.1.69]:50246
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726676AbfIPCoZ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 15 Sep 2019 22:44:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kZI4HAVFhsC4Vv2T8GsF0iUNliYTMr2MRx0QiaaW1U3tQtDbUPcShWPQrsndSB7bhvR6c8QCuWNFkljoUce4xpg2cwiFDmNJK5HAYFu101iHt65jj+WSOnxgOF7cWRcqlzZ2qP6cs+X/GXeKJ0Jmw+3xZIP+5hHWOpawZnGbUGk1zxhSbI5+wDikw2pzgKPT+7SwNbfPmgRixQ2w1j64VJUnnFi+dB1WCSEHEhwKFGOxQYaPSuQBr4RwXLN8Xk6vkYCFjxm04rx5yIAzhMo87TpROGkT0IccIs6q6n8viZODroF+nBRK0nDNWwxlmbOdL1pW0mmta7MKGoeP/v6GTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IO6lkenfb0Epl3Rf7LdU4Qp1bnCOYWCo5KS8nFzAN3U=;
 b=EU5NgmuJIqyNmMdKeA/AUNr1CajN0N3GalKkdDlrXLO4d74QEa7xp6QliFUOgPiTylIcarRBjSAKdnZOpgMWrYrAAFXvlwJhoZZ04/SbOBE5ha6Gqi+KeMtB/fv8Q6fRktIVmqJZ/jrL4PM6v/JMw2WD2MTkrVDalgki34U+zugjybDIFSHPHBTrzIYiSIPh2SYEBianYhPhOE9Okyqk1WP1rpekrgrhk8xTG2zQXQ2vcHdtQI63ZgaseqVGqfDQZcS6d2mqxW7CtfJhzNO/eEHFjYBY4zcL7DAPVo8gdGdNaIp3xi6qZWUXCWPY0EOxNSgwD2Uml/fOaAgbYF6Y9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IO6lkenfb0Epl3Rf7LdU4Qp1bnCOYWCo5KS8nFzAN3U=;
 b=bjLbmJZi8uB0iPlrTCbPpZaWved9XY3y+xPF3gvKBpRIafOaCqmCDMzwTX0f88MzT0Q8gJVSrr1A7ufjmfNxV49pg9E4bFN/nACez4w1OGHapV0wy/DsjmnlaiWj52tO58TH0vXQ0f1d+zmk2bAm9RmT5iNhZ6D7YMElNiTwFEA=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) by
 DB3PR0402MB3692.eurprd04.prod.outlook.com (52.134.65.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.23; Mon, 16 Sep 2019 02:44:06 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::8958:299c:bc54:2a38]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::8958:299c:bc54:2a38%7]) with mapi id 15.20.2263.023; Mon, 16 Sep 2019
 02:44:06 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
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
        Daniel Baluta <daniel.baluta@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        "mripard@kernel.org" <mripard@kernel.org>,
        "olof@lixom.net" <olof@lixom.net>, "arnd@arndb.de" <arnd@arndb.de>,
        "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "dinguyen@kernel.org" <dinguyen@kernel.org>,
        "marcin.juszkiewicz@linaro.org" <marcin.juszkiewicz@linaro.org>,
        "stefan@agner.ch" <stefan@agner.ch>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "yuehaibing@huawei.com" <yuehaibing@huawei.com>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "ronald@innovation.ch" <ronald@innovation.ch>,
        "m.felsch@pengutronix.de" <m.felsch@pengutronix.de>,
        Jacky Bai <ping.bai@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH V3 2/5] input: keyboard: imx_sc: Add i.MX system
 controller key support
Thread-Topic: [PATCH V3 2/5] input: keyboard: imx_sc: Add i.MX system
 controller key support
Thread-Index: AQHVYjtHNMbROEgxRkyLuCpsGlrKMacoiy6AgAUEV9A=
Date:   Mon, 16 Sep 2019 02:44:05 +0000
Message-ID: <DB3PR0402MB391600DD2C5D0D23BD6B9AAFF58C0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1567546600-21566-1-git-send-email-Anson.Huang@nxp.com>
 <1567546600-21566-2-git-send-email-Anson.Huang@nxp.com>
 <20190912202239.GB636@penguin>
In-Reply-To: <20190912202239.GB636@penguin>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=anson.huang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d33bad9a-a130-4df0-025c-08d73a4fbdf7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:DB3PR0402MB3692;
x-ms-traffictypediagnostic: DB3PR0402MB3692:|DB3PR0402MB3692:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0402MB3692C5C447759F57725E2494F58C0@DB3PR0402MB3692.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0162ACCC24
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(366004)(376002)(346002)(396003)(136003)(189003)(199004)(52536014)(55016002)(478600001)(6436002)(14454004)(25786009)(99286004)(4326008)(5660300002)(71200400001)(71190400001)(64756008)(66556008)(7736002)(66476007)(66946007)(76116006)(9686003)(305945005)(2906002)(256004)(53936002)(6246003)(3846002)(6116002)(74316002)(66446008)(6916009)(26005)(476003)(102836004)(44832011)(486006)(54906003)(86362001)(6506007)(446003)(11346002)(8936002)(186003)(33656002)(229853002)(7696005)(316002)(81166006)(81156014)(8676002)(66066001)(76176011)(7416002);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3692;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0uD2M9bqjdD77W8PynqMnKD0Ncnyl49hdcT93sF54I3YADhthRafGnvL2dY0a1q0Ij1g0Cw0E2JDKf9kMpPF16PYiUNyVAHidzTfzqfx3ZDNQZcHYosL/B659IVsH1Cx+S9BcDhY8tnpl4n6w9bzCM8NpFmdjMd6RnogVjzelsOOqXeZSJfEkiSat3zWEV8wq2iD0EO7aMpCAelb8ze5wj+MrQ/cGDWPJzCJbwAsS/3B6Zr+A2stU8kg2WhJhA32QklbZHOsNDkzDL1/4+OGOaSwCAQY696c/2pXbQ6ttS65s+lRNoD/C7klYKfvE9kWfDywGLt4qtwmUhMXvvHaM0JCxwovuI0dLce/7Sb9toLmE4tVnjuBOdEKQWGaLlTd6ZMZg5X7M1+B04o4MYJYF85iQKbPywfq2jOjpmZqJ4o=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d33bad9a-a130-4df0-025c-08d73a4fbdf7
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2019 02:44:05.8334
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: byU96D9hMH7MLUpxohxQNsRiNcVEFW1DXQqWTr46pO3vcMKpKvVDj1xWGBSUZ6pkT1gsydiHcy+sB6KL0NO/xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3692
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

SGksIERtaXRyeQ0KDQo+IE9uIFR1ZSwgU2VwIDAzLCAyMDE5IGF0IDA1OjM2OjM3UE0gLTA0MDAs
IEFuc29uIEh1YW5nIHdyb3RlOg0KPiA+IGkuTVg4UVhQIGlzIGFuIEFSTXY4IFNvQyB3aGljaCBo
YXMgYSBDb3J0ZXgtTTQgc3lzdGVtIGNvbnRyb2xsZXINCj4gPiBpbnNpZGUsIHRoZSBzeXN0ZW0g
Y29udHJvbGxlciBpcyBpbiBjaGFyZ2Ugb2YgY29udHJvbGxpbmcgcG93ZXIsIGNsb2NrDQo+ID4g
YW5kIHNjdSBrZXkgZXRjLi4NCj4gPg0KPiA+IEFkZHMgaS5NWCBzeXN0ZW0gY29udHJvbGxlciBr
ZXkgZHJpdmVyIHN1cHBvcnQsIExpbnV4IGtlcm5lbCBoYXMgdG8NCj4gPiBjb21tdW5pY2F0ZSB3
aXRoIHN5c3RlbSBjb250cm9sbGVyIHZpYSBNVSAobWVzc2FnZSB1bml0KSBJUEMgdG8gZ2V0DQo+
ID4gc2N1IGtleSdzIHN0YXR1cy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEFuc29uIEh1YW5n
IDxBbnNvbi5IdWFuZ0BueHAuY29tPg0KPiA+IC0tLQ0KPiA+IENoYW5nZXMgc2luY2UgVjI6DQo+
ID4gCS0gdXNlIHByaXZhdGUgcGxhdGZvcm0gZGF0YSBpbnN0ZWFkIG9mIGdsb2JhbCBkYXRhOw0K
PiA+IAktIHVzZSAia2V5IiBpbnN0ZWFkIG9mICJwd3JrZXkiOw0KPiA+IAktIGZpeCBzb21lIGRh
dGEgZm9ybWF0Lg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2lucHV0L2tleWJvYXJkL0tjb25maWcg
ICAgICB8ICAgNyArKw0KPiA+ICBkcml2ZXJzL2lucHV0L2tleWJvYXJkL01ha2VmaWxlICAgICB8
ICAgMSArDQo+ID4gIGRyaXZlcnMvaW5wdXQva2V5Ym9hcmQvaW14X3NjX2tleS5jIHwgMTc4DQo+
ID4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIDMgZmlsZXMgY2hh
bmdlZCwgMTg2IGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMv
aW5wdXQva2V5Ym9hcmQvaW14X3NjX2tleS5jDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9pbnB1dC9rZXlib2FyZC9LY29uZmlnDQo+ID4gYi9kcml2ZXJzL2lucHV0L2tleWJvYXJkL0tj
b25maWcgaW5kZXggMmU2ZDI4OC4uNjA3YWNmMiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2lu
cHV0L2tleWJvYXJkL0tjb25maWcNCj4gPiArKysgYi9kcml2ZXJzL2lucHV0L2tleWJvYXJkL0tj
b25maWcNCj4gPiBAQCAtNDY5LDYgKzQ2OSwxMyBAQCBjb25maWcgS0VZQk9BUkRfSU1YDQo+ID4g
IAkgIFRvIGNvbXBpbGUgdGhpcyBkcml2ZXIgYXMgYSBtb2R1bGUsIGNob29zZSBNIGhlcmU6IHRo
ZQ0KPiA+ICAJICBtb2R1bGUgd2lsbCBiZSBjYWxsZWQgaW14X2tleXBhZC4NCj4gPg0KPiA+ICtj
b25maWcgS0VZQk9BUkRfSU1YX1NDX0tFWQ0KPiA+ICsJdHJpc3RhdGUgIklNWCBTQ1UgS2V5IERy
aXZlciINCj4gPiArCWRlcGVuZHMgb24gSU1YX1NDVQ0KPiA+ICsJaGVscA0KPiA+ICsJICBUaGlz
IGlzIHRoZSBzeXN0ZW0gY29udHJvbGxlciBrZXkgZHJpdmVyIGZvciBOWFAgaS5NWCBTb0NzIHdp
dGgNCj4gPiArCSAgc3lzdGVtIGNvbnRyb2xsZXIgaW5zaWRlLg0KPiA+ICsNCj4gPiAgY29uZmln
IEtFWUJPQVJEX05FV1RPTg0KPiA+ICAJdHJpc3RhdGUgIk5ld3RvbiBrZXlib2FyZCINCj4gPiAg
CXNlbGVjdCBTRVJJTw0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lucHV0L2tleWJvYXJkL01h
a2VmaWxlDQo+ID4gYi9kcml2ZXJzL2lucHV0L2tleWJvYXJkL01ha2VmaWxlIGluZGV4IDk1MTAz
MjUuLmY1YjE3NTIgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9pbnB1dC9rZXlib2FyZC9NYWtl
ZmlsZQ0KPiA+ICsrKyBiL2RyaXZlcnMvaW5wdXQva2V5Ym9hcmQvTWFrZWZpbGUNCj4gPiBAQCAt
MjksNiArMjksNyBAQCBvYmotJChDT05GSUdfS0VZQk9BUkRfSElMKQkJKz0gaGlsX2tiZC5vDQo+
ID4gIG9iai0kKENPTkZJR19LRVlCT0FSRF9ISUxfT0xEKQkJKz0gaGlsa2JkLm8NCj4gPiAgb2Jq
LSQoQ09ORklHX0tFWUJPQVJEX0lQQVFfTUlDUk8pCSs9IGlwYXEtbWljcm8ta2V5cy5vDQo+ID4g
IG9iai0kKENPTkZJR19LRVlCT0FSRF9JTVgpCQkrPSBpbXhfa2V5cGFkLm8NCj4gPiArb2JqLSQo
Q09ORklHX0tFWUJPQVJEX0lNWF9TQ19LRVkpCSs9IGlteF9zY19rZXkubw0KPiA+ICBvYmotJChD
T05GSUdfS0VZQk9BUkRfSFA2WFgpCQkrPSBqb3JuYWRhNjgwX2tiZC5vDQo+ID4gIG9iai0kKENP
TkZJR19LRVlCT0FSRF9IUDdYWCkJCSs9IGpvcm5hZGE3MjBfa2JkLm8NCj4gPiAgb2JqLSQoQ09O
RklHX0tFWUJPQVJEX0xLS0JEKQkJKz0gbGtrYmQubw0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2lucHV0L2tleWJvYXJkL2lteF9zY19rZXkuYw0KPiA+IGIvZHJpdmVycy9pbnB1dC9rZXlib2Fy
ZC9pbXhfc2Nfa2V5LmMNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAw
MDAuLmU2OTQ3OWINCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvZHJpdmVycy9pbnB1dC9r
ZXlib2FyZC9pbXhfc2Nfa2V5LmMNCj4gPiBAQCAtMCwwICsxLDE3OCBAQA0KPiA+ICsvLyBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KPiA+ICsvKg0KPiA+ICsgKiBDb3B5cmlnaHQg
MjAxOSBOWFAuDQo+ID4gKyAqLw0KPiA+ICsNCj4gPiArI2luY2x1ZGUgPGxpbnV4L2RldmljZS5o
Pg0KPiA+ICsjaW5jbHVkZSA8bGludXgvZXJyLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9maXJt
d2FyZS9pbXgvc2NpLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9pbml0Lmg+DQo+ID4gKyNpbmNs
dWRlIDxsaW51eC9pbnB1dC5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvaW50ZXJydXB0Lmg+DQo+
ID4gKyNpbmNsdWRlIDxsaW51eC9qaWZmaWVzLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9rZXJu
ZWwuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPg0KPiA+ICsjaW5jbHVkZSA8bGlu
dXgvb2YuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L29mX2FkZHJlc3MuaD4NCj4gPiArI2luY2x1
ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPg0KPiA+ICsNCj4gPiArI2RlZmluZSBERUJPVU5D
RV9USU1FCTEwMA0KPiA+ICsjZGVmaW5lIFJFUEVBVF9JTlRFUlZBTAk2MA0KPiA+ICsNCj4gPiAr
I2RlZmluZSBTQ19JUlFfQlVUVE9OCQkxDQo+ID4gKyNkZWZpbmUgU0NfSVJRX0dST1VQX1dBS0UJ
Mw0KPiA+ICsjZGVmaW5lIElNWF9TQ19NSVNDX0ZVTkNfR0VUX0JVVFRPTl9TVEFUVVMJMTgNCj4g
PiArDQo+ID4gK3N0cnVjdCBpbXhfa2V5X2Rydl9kYXRhIHsNCj4gPiArCWludCBrZXljb2RlOw0K
PiA+ICsJYm9vbCBrZXlzdGF0ZTsgIC8qIDE6IHByZXNzZWQsIDA6IHJlbGVhc2UgKi8NCj4gPiAr
CWJvb2wgZGVsYXlfY2hlY2s7DQo+ID4gKwlzdHJ1Y3QgZGVsYXllZF93b3JrIGNoZWNrX3dvcms7
DQo+ID4gKwlzdHJ1Y3QgaW5wdXRfZGV2ICppbnB1dDsNCj4gPiArCXN0cnVjdCBpbXhfc2NfaXBj
ICprZXlfaXBjX2hhbmRsZTsNCj4gPiArCXN0cnVjdCBub3RpZmllcl9ibG9jayBrZXlfbm90aWZp
ZXI7DQo+ID4gK307DQo+ID4gKw0KPiA+ICtzdHJ1Y3QgaW14X3NjX21zZ19rZXkgew0KPiA+ICsJ
c3RydWN0IGlteF9zY19ycGNfbXNnIGhkcjsNCj4gPiArCXU4IHN0YXRlOw0KPiA+ICt9Ow0KPiA+
ICsNCj4gPiArc3RhdGljIGludCBpbXhfc2Nfa2V5X25vdGlmeShzdHJ1Y3Qgbm90aWZpZXJfYmxv
Y2sgKm5iLA0KPiA+ICsJCQkgICAgIHVuc2lnbmVkIGxvbmcgZXZlbnQsIHZvaWQgKmdyb3VwKSB7
DQo+ID4gKwlzdHJ1Y3QgaW14X2tleV9kcnZfZGF0YSAqcHJpdiA9DQo+ID4gKwkJCQkgY29udGFp
bmVyX29mKG5iLA0KPiA+ICsJCQkJCSAgICAgIHN0cnVjdCBpbXhfa2V5X2Rydl9kYXRhLA0KPiA+
ICsJCQkJCSAgICAgIGtleV9ub3RpZmllcik7DQo+ID4gKw0KPiA+ICsJaWYgKChldmVudCAmIFND
X0lSUV9CVVRUT04pICYmICgqKHU4ICopZ3JvdXAgPT0NCj4gU0NfSVJRX0dST1VQX1dBS0UpDQo+
ID4gKwkgICAgJiYgIXByaXYtPmRlbGF5X2NoZWNrKSB7DQo+ID4gKwkJcHJpdi0+ZGVsYXlfY2hl
Y2sgPSAxOw0KPiA+ICsJCXNjaGVkdWxlX2RlbGF5ZWRfd29yaygmcHJpdi0+Y2hlY2tfd29yaywN
Cj4gPiArCQkJCSAgICAgIG1zZWNzX3RvX2ppZmZpZXMoUkVQRUFUX0lOVEVSVkFMKSk7DQo+ID4g
Kwl9DQo+ID4gKw0KPiA+ICsJcmV0dXJuIDA7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyB2
b2lkIGlteF9zY19jaGVja19mb3JfZXZlbnRzKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykgew0K
PiA+ICsJc3RydWN0IGlteF9rZXlfZHJ2X2RhdGEgKnByaXYgPQ0KPiA+ICsJCQkJIGNvbnRhaW5l
cl9vZih3b3JrLA0KPiA+ICsJCQkJCSAgICAgIHN0cnVjdCBpbXhfa2V5X2Rydl9kYXRhLA0KPiA+
ICsJCQkJCSAgICAgIGNoZWNrX3dvcmsud29yayk7DQo+ID4gKwlzdHJ1Y3QgaW5wdXRfZGV2ICpp
bnB1dCA9IHByaXYtPmlucHV0Ow0KPiA+ICsJc3RydWN0IGlteF9zY19tc2dfa2V5IG1zZzsNCj4g
PiArCXN0cnVjdCBpbXhfc2NfcnBjX21zZyAqaGRyID0gJm1zZy5oZHI7DQo+ID4gKwlib29sIHN0
YXRlOw0KPiA+ICsJaW50IHJldDsNCj4gPiArDQo+ID4gKwloZHItPnZlciA9IElNWF9TQ19SUENf
VkVSU0lPTjsNCj4gPiArCWhkci0+c3ZjID0gSU1YX1NDX1JQQ19TVkNfTUlTQzsNCj4gPiArCWhk
ci0+ZnVuYyA9IElNWF9TQ19NSVNDX0ZVTkNfR0VUX0JVVFRPTl9TVEFUVVM7DQo+ID4gKwloZHIt
PnNpemUgPSAxOw0KPiA+ICsNCj4gPiArCXJldCA9IGlteF9zY3VfY2FsbF9ycGMocHJpdi0+a2V5
X2lwY19oYW5kbGUsICZtc2csIHRydWUpOw0KPiA+ICsJaWYgKHJldCkgew0KPiA+ICsJCWRldl9l
cnIoJmlucHV0LT5kZXYsICJyZWFkIGlteCBzYyBrZXkgZmFpbGVkLCByZXQgJWRcbiIsIHJldCk7
DQo+ID4gKwkJcmV0dXJuOw0KPiA+ICsJfQ0KPiA+ICsNCj4gPiArCXN0YXRlID0gKGJvb2wpbXNn
LnN0YXRlOw0KPiA+ICsNCj4gPiArCWlmICghc3RhdGUgJiYgIXByaXYtPmtleXN0YXRlKQ0KPiA+
ICsJCXN0YXRlID0gdHJ1ZTsNCj4gPiArDQo+ID4gKwlpZiAoc3RhdGUgXiBwcml2LT5rZXlzdGF0
ZSkgew0KPiA+ICsJCXBtX3dha2V1cF9ldmVudChpbnB1dC0+ZGV2LnBhcmVudCwgMCk7DQo+ID4g
KwkJcHJpdi0+a2V5c3RhdGUgPSBzdGF0ZTsNCj4gPiArCQlpbnB1dF9ldmVudChpbnB1dCwgRVZf
S0VZLCBwcml2LT5rZXljb2RlLCBzdGF0ZSk7DQo+ID4gKwkJaW5wdXRfc3luYyhpbnB1dCk7DQo+
ID4gKwkJaWYgKCFzdGF0ZSkNCj4gPiArCQkJcHJpdi0+ZGVsYXlfY2hlY2sgPSAwOw0KPiA+ICsJ
CXBtX3JlbGF4KHByaXYtPmlucHV0LT5kZXYucGFyZW50KTsNCj4gPiArCX0NCj4gPiArDQo+ID4g
KwlpZiAoc3RhdGUpDQo+ID4gKwkJc2NoZWR1bGVfZGVsYXllZF93b3JrKCZwcml2LT5jaGVja193
b3JrLA0KPiA+ICsJCQkJICAgICAgbXNlY3NfdG9famlmZmllcyhERUJPVU5DRV9USU1FKSk7DQo+
IA0KPiBIbW0sIEkgYW0gbm90IHF1aXRlIHN1cmUgZm9sbG93IHRoZSBjb2RlLiBKdWRnaW5nIGJ5
IHRoZSBuYW1lLCB5b3UgYXJlDQo+IHRyeWluZyB0byBoYW5kbGUgZGVib3VuY2UsIGJ1dCBpZiBJ
IHVuZGVyc3RhbmQgdGhpcyBjb3JyZWN0bHkgeW91IGFscmVhZHkgc2VudA0KPiBvdXQgdGhlIHBy
ZXNzIGV2ZW50IGZvciBub3cuDQo+IA0KPiBDb3VsZCB5b3UgcGxlYXNlIGV4cGxhaW4gd2hhdCB5
b3UgYXJlIHRyeWluZyB0byBkbyBoZXJlLg0KDQpUaGUgbmFtZSBpcyBraW5kIG9mIGNvbmZ1c2Vk
LCB0aGUgIkRFQk9VTkNFX1RJTUUiIGhlcmUgc2hvdWxkIGJlICJSRVBFQVRfSU5URVJWQUwiDQph
Y3R1YWxseSwgdGhlICAiREVCT1VOQ0VfVElNRSIgc2hvdWxkIGJlIHVzZWQgaW4gdGhlIGlycSBo
YW5sZGVyIGluc3RlYWQuCQ0KQXMgdGhlIFNDVSBPTkxZIHNlbmQgb3V0IGludGVycnVwdCB3aGVu
IHRoZSBrZXkgaXMgcHJlc3NlZCwgc28gaGVyZSB3ZSBoYXZlIHRvIHJlcGVhdA0KdGhlIGRlbGF5
IHdvcmsgdG8gbG9vcCBjaGVjayB0aGUgYnV0dG9uIHJlbGVhc2UgZXZlbnQsIHRoZSBwcmVzcyBl
dmVudCBpcyBzZW50IG91dCBvbmNlIHRoZQ0Ka2V5IHN0YXRlIGlzIHZhbGlkLCBhbmQgdGhlbiBz
dGFydCB0byBjaGVjayB1bnRpbCBrZXkgaXMgcmVsZWFzZWQuDQoNCkkgd2lsbCBzd2l0Y2ggdGhl
ICJERUJPVU5DRV9USU1FIiBhbmQgIlJFUEVBVF9JTlRFUlZBTCIgaW4gVjQuDQoNCj4gDQo+ID4g
K30NCj4gPiArDQo+ID4gK3N0YXRpYyBpbnQgaW14X3NjX2tleV9wcm9iZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KSB7DQo+ID4gKwlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wID0gcGRldi0+
ZGV2Lm9mX25vZGU7DQo+ID4gKwlzdGF0aWMgc3RydWN0IGlteF9rZXlfZHJ2X2RhdGEgKnByaXY7
DQo+ID4gKwlzdHJ1Y3QgaW5wdXRfZGV2ICppbnB1dDsNCj4gPiArCWludCByZXQ7DQo+ID4gKw0K
PiA+ICsJcHJpdiA9IGRldm1fa3phbGxvYygmcGRldi0+ZGV2LCBzaXplb2YoKnByaXYpLCBHRlBf
S0VSTkVMKTsNCj4gPiArCWlmICghcHJpdikNCj4gPiArCQlyZXR1cm4gLUVOT01FTTsNCj4gPiAr
DQo+ID4gKwlyZXQgPSBpbXhfc2N1X2dldF9oYW5kbGUoJnByaXYtPmtleV9pcGNfaGFuZGxlKTsN
Cj4gPiArCWlmIChyZXQpDQo+ID4gKwkJcmV0dXJuIHJldDsNCj4gPiArDQo+ID4gKwlpZiAob2Zf
cHJvcGVydHlfcmVhZF91MzIobnAsICJsaW51eCxrZXljb2RlIiwgJnByaXYtPmtleWNvZGUpKSB7
DQo+ID4gKwkJZGV2X2VycigmcGRldi0+ZGV2LCAibWlzc2luZyBLRVlfUE9XRVIgaW4gRFRcbiIp
Ow0KPiA+ICsJCXJldHVybiAtRUlOVkFMOw0KPiA+ICsJfQ0KPiA+ICsNCj4gPiArCUlOSVRfREVM
QVlFRF9XT1JLKCZwcml2LT5jaGVja193b3JrLA0KPiBpbXhfc2NfY2hlY2tfZm9yX2V2ZW50cyk7
DQo+ID4gKw0KPiA+ICsJaW5wdXQgPSBkZXZtX2lucHV0X2FsbG9jYXRlX2RldmljZSgmcGRldi0+
ZGV2KTsNCj4gPiArCWlmICghaW5wdXQpIHsNCj4gPiArCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJm
YWlsZWQgdG8gYWxsb2NhdGUgdGhlIGlucHV0IGRldmljZVxuIik7DQo+ID4gKwkJcmV0dXJuIC1F
Tk9NRU07DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJaW5wdXQtPm5hbWUgPSBwZGV2LT5uYW1lOw0K
PiA+ICsJaW5wdXQtPnBoeXMgPSAiaW14LXNjLWtleS9pbnB1dDAiOw0KPiA+ICsJaW5wdXQtPmlk
LmJ1c3R5cGUgPSBCVVNfSE9TVDsNCj4gPiArDQo+ID4gKwlpbnB1dF9zZXRfY2FwYWJpbGl0eShp
bnB1dCwgRVZfS0VZLCBwcml2LT5rZXljb2RlKTsNCj4gPiArDQo+ID4gKwlyZXQgPSBpbnB1dF9y
ZWdpc3Rlcl9kZXZpY2UoaW5wdXQpOw0KPiA+ICsJaWYgKHJldCkgew0KPiA+ICsJCWRldl9lcnIo
JnBkZXYtPmRldiwgImZhaWxlZCB0byByZWdpc3RlciBpbnB1dCBkZXZpY2VcbiIpOw0KPiA+ICsJ
CXJldHVybiByZXQ7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJcHJpdi0+aW5wdXQgPSBpbnB1dDsN
Cj4gPiArCXBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIHByaXYpOw0KPiA+ICsNCj4gPiArCXJl
dCA9IGlteF9zY3VfaXJxX2dyb3VwX2VuYWJsZShTQ19JUlFfR1JPVVBfV0FLRSwNCj4gU0NfSVJR
X0JVVFRPTiwgdHJ1ZSk7DQo+ID4gKwlpZiAocmV0KSB7DQo+ID4gKwkJZGV2X3dhcm4oJnBkZXYt
PmRldiwgImVuYWJsZSBzY3UgZ3JvdXAgaXJxIGZhaWxlZFxuIik7DQo+ID4gKwkJcmV0dXJuIHJl
dDsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwlwcml2LT5rZXlfbm90aWZpZXIubm90aWZpZXJfY2Fs
bCA9IGlteF9zY19rZXlfbm90aWZ5Ow0KPiA+ICsJcmV0ID0gaW14X3NjdV9pcnFfcmVnaXN0ZXJf
bm90aWZpZXIoJnByaXYtPmtleV9ub3RpZmllcik7DQo+ID4gKwlpZiAocmV0KSB7DQo+ID4gKwkJ
aW14X3NjdV9pcnFfZ3JvdXBfZW5hYmxlKFNDX0lSUV9HUk9VUF9XQUtFLA0KPiBTQ19JUlFfQlVU
VE9OLCBmYWxzZSk7DQo+ID4gKwkJZGV2X3dhcm4oJnBkZXYtPmRldiwgInJlZ2lzdGVyIHNjdSBu
b3RpZmllciBmYWlsZWRcbiIpOw0KPiA+ICsJfQ0KPiA+ICsNCj4gPiArCXJldHVybiByZXQ7DQo+
ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGlteF9z
Y19rZXlfaWRzW10gPSB7DQo+ID4gKwl7IC5jb21wYXRpYmxlID0gImZzbCxpbXgtc2Mta2V5IiB9
LA0KPiA+ICsJeyAvKiBzZW50aW5lbCAqLyB9DQo+ID4gK307DQo+ID4gK01PRFVMRV9ERVZJQ0Vf
VEFCTEUob2YsIGlteF9zY19rZXlfaWRzKTsNCj4gPiArDQo+ID4gK3N0YXRpYyBzdHJ1Y3QgcGxh
dGZvcm1fZHJpdmVyIGlteF9zY19rZXlfZHJpdmVyID0gew0KPiA+ICsJLmRyaXZlciA9IHsNCj4g
PiArCQkubmFtZSA9ICJpbXgtc2Mta2V5IiwNCj4gPiArCQkub2ZfbWF0Y2hfdGFibGUgPSBpbXhf
c2Nfa2V5X2lkcywNCj4gPiArCX0sDQo+ID4gKwkucHJvYmUgPSBpbXhfc2Nfa2V5X3Byb2JlLA0K
PiANCj4gWW91IG5lZWQgYSByZW1vdmUoKSBoYW5kbGVyIHRvIGRpc2FibGUgdGhlIGl0cSBncm91
cCwgcmVtb3ZlIHRoZSBub3RpZmllciwNCj4gY2FuY2VsIHRoZSBkZWxheWVkIHdvcmssIGV0Yy4N
Cg0KSSB3aWxsIGFkZCBpdCBpbiBWNC4NCg0KVGhhbmtzLA0KQW5zb24NCg0K
