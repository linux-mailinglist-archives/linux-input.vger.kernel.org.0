Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8CD7B4590
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 04:42:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391880AbfIQCmh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Sep 2019 22:42:37 -0400
Received: from mail-eopbgr60073.outbound.protection.outlook.com ([40.107.6.73]:12967
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728470AbfIQCmg (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Sep 2019 22:42:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VeBjNlqLlgYEIH+rcgxxynYeMM9b9TojXZUcbCJCrRfvJqkV8R50tCoWm8UggEIRdHzwdBjGQbKKKDNjLIwiRJF18gwoo5MVE4mi9UAd3XuHfWlc6Uv7VepPy730/vKiRUDfXDHjaXHhxKvzOzOFH7Bgh40T1dzc1UbiguxzKUjm8sjMTRPBgJiujvW7FC0tVZ0NIvWFqJ6OPO0Y2IvtVj5CKFYAJT+b7oBcl+E61HBdFywxa2iNSL10WpYpbJryCKj3UytEY6n+B03ptVMM1H8CSsTjgHSn2eVNEGRqYIYdiPVKRAmQtD05PFS3Z9ttimiB+m+ypfGbGbg1tAe6rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=baIm9h3PDUpUsaSHjX0W6yJEysEisCnEL0oKdj7EK9o=;
 b=eOMKQHzc527Ef6QQing9B4dMRp0VZLieOMfHFrqc23WRRAGlbldGi0jWw/nlLiL6Wi2fXqfUYf4qbPcj5+hFeWkhbl3129fS6M1kCb/dgJTB5u1wQrOpGDUJWujC1f0h6sA8cUOExHCbg8rjt3pIyjRdlUJwOb8cI606Udv0vEHbNsE9UnueSQjXcJngl4OOqvTFxkApzZsNJtgLgYVkvgj7RrDA+XVZ/9odgS50xQ3peHMYnd3pqxDvNTEmB301lrhnoDiwTPN1aiLxMFhrCQ5ZhHZPEJtFCprtXNvzkzoLhCYdiDJt+FDaGn6g9hScd9AQ4lx52z5MSHYvQwZW+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=baIm9h3PDUpUsaSHjX0W6yJEysEisCnEL0oKdj7EK9o=;
 b=mAYZXEPEYnUS45Gs0Ctx/WwzSFFhcDE4siDtx2Qtx/jSMQ/cc4wnx/BvnU3+eqdHRDwPEj5vgjSuHav42wfMayT1ItLgLirnVe/HHE/gpLYQ4FpclNPTqe7mq8D1KwzVfC5OaRghP/8AMJdtqZL2Cx4VwdGSzKzf+JCAx9CqUxM=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) by
 DB3PR0402MB3946.eurprd04.prod.outlook.com (52.134.72.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.22; Tue, 17 Sep 2019 02:42:30 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::8958:299c:bc54:2a38]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::8958:299c:bc54:2a38%7]) with mapi id 15.20.2263.023; Tue, 17 Sep 2019
 02:42:30 +0000
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
Thread-Index: AQHVbDoTG9IptYOIlUSe8in/1bTkN6cu+20AgAAdosA=
Date:   Tue, 17 Sep 2019 02:42:30 +0000
Message-ID: <DB3PR0402MB3916859326C76BC9BC1F781CF58F0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1568602373-14164-1-git-send-email-Anson.Huang@nxp.com>
 <1568602373-14164-2-git-send-email-Anson.Huang@nxp.com>
 <20190916235330.GI237523@dtor-ws>
In-Reply-To: <20190916235330.GI237523@dtor-ws>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=anson.huang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cea7282a-923e-4e25-619c-08d73b18afac
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:DB3PR0402MB3946;
x-ms-traffictypediagnostic: DB3PR0402MB3946:|DB3PR0402MB3946:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0402MB3946A251CCA343267B1AD228F58F0@DB3PR0402MB3946.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1303;
x-forefront-prvs: 01630974C0
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(376002)(366004)(136003)(39860400002)(346002)(199004)(189003)(43544003)(44832011)(3846002)(478600001)(8676002)(81156014)(5660300002)(7416002)(99286004)(81166006)(229853002)(86362001)(7696005)(102836004)(6916009)(26005)(186003)(74316002)(6506007)(6246003)(6436002)(9686003)(55016002)(66476007)(64756008)(66946007)(476003)(6116002)(4326008)(446003)(11346002)(66066001)(25786009)(486006)(8936002)(76176011)(76116006)(52536014)(2906002)(66446008)(33656002)(14454004)(316002)(305945005)(7736002)(54906003)(71190400001)(71200400001)(14444005)(66556008)(256004);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3946;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RfuUy/kP/OLX6/QLTztxFD91/jW5cdOcL7SnmTtJkb88cWRabiR51Y8YmdX8FrtR+lQCkjkdlo2ADzpv3VVeITd/AdO7Kai3GDjutIE/WKkHRWdc9tzJxUdq3n1f8tJBMUGkv1wty9909bfWhMfs2v8WW3H4s8OP0wDZ2eDXGRzM8DGYMQMuRbLTr0UvEuC6heTclr2nsxDUBczScB1ULzgG2Rwy7rzb2QYPw3hODgqL4fvptBdnA5AAaVRs7ioeFxmRiIDqRmK6d47vpq+2OHgBRb1V1Rj4lnLhGzr+LMpJQk+Uuxp/dR1/1y5LUiixp8i1XmW+O4GgL6dr0KPmqjFZzPwGM5j2UZfoArwHe6zgGBAm4knrYUZLEh5nHKbPT5VCBhfoyGFGAIHD0cnvB99EOz+6ca0M72uozRU8aYc=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cea7282a-923e-4e25-619c-08d73b18afac
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2019 02:42:30.7099
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YG1Pk5opLotdtfIQlgmihwQgWjSt0mGKTimQnK08dTgxNjiS3SA3HM7xk6rFC59sAOQYGzo/mY24/pbJJP2gSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3946
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

SGksIERtaXRyeQ0KDQo+IE9uIE1vbiwgU2VwIDE2LCAyMDE5IGF0IDEwOjUyOjUwQU0gKzA4MDAs
IEFuc29uIEh1YW5nIHdyb3RlOg0KPiA+IGkuTVg4UVhQIGlzIGFuIEFSTXY4IFNvQyB3aGljaCBo
YXMgYSBDb3J0ZXgtTTQgc3lzdGVtIGNvbnRyb2xsZXINCj4gPiBpbnNpZGUsIHRoZSBzeXN0ZW0g
Y29udHJvbGxlciBpcyBpbiBjaGFyZ2Ugb2YgY29udHJvbGxpbmcgcG93ZXIsIGNsb2NrDQo+ID4g
YW5kIHNjdSBrZXkgZXRjLi4NCj4gPg0KPiA+IEFkZHMgaS5NWCBzeXN0ZW0gY29udHJvbGxlciBr
ZXkgZHJpdmVyIHN1cHBvcnQsIExpbnV4IGtlcm5lbCBoYXMgdG8NCj4gPiBjb21tdW5pY2F0ZSB3
aXRoIHN5c3RlbSBjb250cm9sbGVyIHZpYSBNVSAobWVzc2FnZSB1bml0KSBJUEMgdG8gZ2V0DQo+
ID4gc2N1IGtleSdzIHN0YXR1cy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEFuc29uIEh1YW5n
IDxBbnNvbi5IdWFuZ0BueHAuY29tPg0KPiA+IC0tLQ0KPiA+IENoYW5nZXMgc2luY2UgVjM6DQo+
ID4gCS0gc3dpdGNoIHRoZSBkZWJvdW5jZSBhbmQgcmVwZWF0IGludGVydmFsIHRpbWUgZm9yIGRl
bGF5IHdvcmsNCj4gc2NoZHVsZTsNCj4gPiAJLSBhZGQgLnJlbW92ZSB0byBoYW5kbGUgZ3JvdXAg
aXJxIGFuZCBub3RpZnkgZXRjLi4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9pbnB1dC9rZXlib2Fy
ZC9LY29uZmlnICAgICAgfCAgIDcgKysNCj4gPiAgZHJpdmVycy9pbnB1dC9rZXlib2FyZC9NYWtl
ZmlsZSAgICAgfCAgIDEgKw0KPiA+ICBkcml2ZXJzL2lucHV0L2tleWJvYXJkL2lteF9zY19rZXku
YyB8IDE5MA0KPiA+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICAz
IGZpbGVzIGNoYW5nZWQsIDE5OCBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL2lucHV0L2tleWJvYXJkL2lteF9zY19rZXkuYw0KPiA+DQo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvaW5wdXQva2V5Ym9hcmQvS2NvbmZpZw0KPiA+IGIvZHJpdmVycy9pbnB1dC9r
ZXlib2FyZC9LY29uZmlnIGluZGV4IDg5MTFiYzIuLjAwZjg0MjggMTAwNjQ0DQo+ID4gLS0tIGEv
ZHJpdmVycy9pbnB1dC9rZXlib2FyZC9LY29uZmlnDQo+ID4gKysrIGIvZHJpdmVycy9pbnB1dC9r
ZXlib2FyZC9LY29uZmlnDQo+ID4gQEAgLTQ2OSw2ICs0NjksMTMgQEAgY29uZmlnIEtFWUJPQVJE
X0lNWA0KPiA+ICAJICBUbyBjb21waWxlIHRoaXMgZHJpdmVyIGFzIGEgbW9kdWxlLCBjaG9vc2Ug
TSBoZXJlOiB0aGUNCj4gPiAgCSAgbW9kdWxlIHdpbGwgYmUgY2FsbGVkIGlteF9rZXlwYWQuDQo+
ID4NCj4gPiArY29uZmlnIEtFWUJPQVJEX0lNWF9TQ19LRVkNCj4gPiArCXRyaXN0YXRlICJJTVgg
U0NVIEtleSBEcml2ZXIiDQo+ID4gKwlkZXBlbmRzIG9uIElNWF9TQ1UNCj4gPiArCWhlbHANCj4g
PiArCSAgVGhpcyBpcyB0aGUgc3lzdGVtIGNvbnRyb2xsZXIga2V5IGRyaXZlciBmb3IgTlhQIGku
TVggU29DcyB3aXRoDQo+ID4gKwkgIHN5c3RlbSBjb250cm9sbGVyIGluc2lkZS4NCj4gPiArDQo+
ID4gIGNvbmZpZyBLRVlCT0FSRF9ORVdUT04NCj4gPiAgCXRyaXN0YXRlICJOZXd0b24ga2V5Ym9h
cmQiDQo+ID4gIAlzZWxlY3QgU0VSSU8NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pbnB1dC9r
ZXlib2FyZC9NYWtlZmlsZQ0KPiA+IGIvZHJpdmVycy9pbnB1dC9rZXlib2FyZC9NYWtlZmlsZSBp
bmRleCA5NTEwMzI1Li5mNWIxNzUyIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvaW5wdXQva2V5
Ym9hcmQvTWFrZWZpbGUNCj4gPiArKysgYi9kcml2ZXJzL2lucHV0L2tleWJvYXJkL01ha2VmaWxl
DQo+ID4gQEAgLTI5LDYgKzI5LDcgQEAgb2JqLSQoQ09ORklHX0tFWUJPQVJEX0hJTCkJCSs9IGhp
bF9rYmQubw0KPiA+ICBvYmotJChDT05GSUdfS0VZQk9BUkRfSElMX09MRCkJCSs9IGhpbGtiZC5v
DQo+ID4gIG9iai0kKENPTkZJR19LRVlCT0FSRF9JUEFRX01JQ1JPKQkrPSBpcGFxLW1pY3JvLWtl
eXMubw0KPiA+ICBvYmotJChDT05GSUdfS0VZQk9BUkRfSU1YKQkJKz0gaW14X2tleXBhZC5vDQo+
ID4gK29iai0kKENPTkZJR19LRVlCT0FSRF9JTVhfU0NfS0VZKQkrPSBpbXhfc2Nfa2V5Lm8NCj4g
PiAgb2JqLSQoQ09ORklHX0tFWUJPQVJEX0hQNlhYKQkJKz0gam9ybmFkYTY4MF9rYmQubw0KPiA+
ICBvYmotJChDT05GSUdfS0VZQk9BUkRfSFA3WFgpCQkrPSBqb3JuYWRhNzIwX2tiZC5vDQo+ID4g
IG9iai0kKENPTkZJR19LRVlCT0FSRF9MS0tCRCkJCSs9IGxra2JkLm8NCj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9pbnB1dC9rZXlib2FyZC9pbXhfc2Nfa2V5LmMNCj4gPiBiL2RyaXZlcnMvaW5w
dXQva2V5Ym9hcmQvaW14X3NjX2tleS5jDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBp
bmRleCAwMDAwMDAwLi41OWM2OGZhDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2RyaXZl
cnMvaW5wdXQva2V5Ym9hcmQvaW14X3NjX2tleS5jDQo+ID4gQEAgLTAsMCArMSwxOTAgQEANCj4g
PiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4gPiArLyoNCj4gPiArICog
Q29weXJpZ2h0IDIwMTkgTlhQLg0KPiA+ICsgKi8NCj4gPiArDQo+ID4gKyNpbmNsdWRlIDxsaW51
eC9kZXZpY2UuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L2Vyci5oPg0KPiA+ICsjaW5jbHVkZSA8
bGludXgvZmlybXdhcmUvaW14L3NjaS5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvaW5pdC5oPg0K
PiA+ICsjaW5jbHVkZSA8bGludXgvaW5wdXQuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L2ludGVy
cnVwdC5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvamlmZmllcy5oPg0KPiA+ICsjaW5jbHVkZSA8
bGludXgva2VybmVsLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCj4gPiArI2lu
Y2x1ZGUgPGxpbnV4L29mLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9vZl9hZGRyZXNzLmg+DQo+
ID4gKyNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4NCj4gPiArDQo+ID4gKyNkZWZp
bmUgREVCT1VOQ0VfVElNRQkxMDANCj4gPiArI2RlZmluZSBSRVBFQVRfSU5URVJWQUwJNjANCj4g
PiArDQo+ID4gKyNkZWZpbmUgU0NfSVJRX0JVVFRPTgkJMQ0KPiA+ICsjZGVmaW5lIFNDX0lSUV9H
Uk9VUF9XQUtFCTMNCj4gPiArI2RlZmluZSBJTVhfU0NfTUlTQ19GVU5DX0dFVF9CVVRUT05fU1RB
VFVTCTE4DQo+ID4gKw0KPiA+ICtzdHJ1Y3QgaW14X2tleV9kcnZfZGF0YSB7DQo+ID4gKwlpbnQg
a2V5Y29kZTsNCj4gPiArCWJvb2wga2V5c3RhdGU7ICAvKiAxOiBwcmVzc2VkLCAwOiByZWxlYXNl
ICovDQo+ID4gKwlib29sIGRlbGF5X2NoZWNrOw0KPiA+ICsJc3RydWN0IGRlbGF5ZWRfd29yayBj
aGVja193b3JrOw0KPiA+ICsJc3RydWN0IGlucHV0X2RldiAqaW5wdXQ7DQo+ID4gKwlzdHJ1Y3Qg
aW14X3NjX2lwYyAqa2V5X2lwY19oYW5kbGU7DQo+ID4gKwlzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sg
a2V5X25vdGlmaWVyOw0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArc3RydWN0IGlteF9zY19tc2dfa2V5
IHsNCj4gPiArCXN0cnVjdCBpbXhfc2NfcnBjX21zZyBoZHI7DQo+ID4gKwl1OCBzdGF0ZTsNCj4g
PiArfTsNCj4gPiArDQo+ID4gK3N0YXRpYyBpbnQgaW14X3NjX2tleV9ub3RpZnkoc3RydWN0IG5v
dGlmaWVyX2Jsb2NrICpuYiwNCj4gPiArCQkJICAgICB1bnNpZ25lZCBsb25nIGV2ZW50LCB2b2lk
ICpncm91cCkgew0KPiA+ICsJc3RydWN0IGlteF9rZXlfZHJ2X2RhdGEgKnByaXYgPQ0KPiA+ICsJ
CQkJIGNvbnRhaW5lcl9vZihuYiwNCj4gPiArCQkJCQkgICAgICBzdHJ1Y3QgaW14X2tleV9kcnZf
ZGF0YSwNCj4gPiArCQkJCQkgICAgICBrZXlfbm90aWZpZXIpOw0KPiA+ICsNCj4gPiArCWlmICgo
ZXZlbnQgJiBTQ19JUlFfQlVUVE9OKSAmJiAoKih1OCAqKWdyb3VwID09DQo+IFNDX0lSUV9HUk9V
UF9XQUtFKQ0KPiA+ICsJICAgICYmICFwcml2LT5kZWxheV9jaGVjaykgew0KPiA+ICsJCXByaXYt
PmRlbGF5X2NoZWNrID0gMTsNCj4gPiArCQlzY2hlZHVsZV9kZWxheWVkX3dvcmsoJnByaXYtPmNo
ZWNrX3dvcmssDQo+ID4gKwkJCQkgICAgICBtc2Vjc190b19qaWZmaWVzKERFQk9VTkNFX1RJTUUp
KTsNCj4gDQo+IElmIEkgYW0gcmVhZGluZyB0aGlzIHJpZ2h0LCB5b3UgYXJlIHRyeWluZyB0byBh
dm9pZCBzY2hlZHVsaW5nIHRoZSB3b3JrIGFnYWluIGlmDQo+IGl0IGlzIGFscmVhZHkgc2NoZWR1
bGVkLiBZb3UgZG8gbm90IG5lZWQgdG8gZG8gdGhhdCwgYXMNCj4gc2NoZWR1bGVfZGVsYXllZF93
b3JrKCkgd2lsbCB0YWtlIGNhcmUgb2YgdGhhdCAoaWYgeW91IHdhbnQgdG8gbWFrZSBzdXJlIHRo
ZQ0KPiB3b3JrIGlzIHJlLXNjaGVkdWxlZCB3aXRoIHVwZGF0ZWQgZXhwaXJhdGlvbiwgeW91IG5l
ZWQgdG8gdXNlDQo+IG1vZF9kZWxheWVkX3dvcmspLg0KDQpUaGUgb3JpZ2luYWwgY29kZSBoZXJl
IGlzIHRvIHNraXAgdGhlIGV2ZW50IG9mIGJ1dHRvbiByZWxlYXNlLCB0cnkgdG8gT05MWSBoYW5k
bGUgdGhlIHByZXNzIGludGVycnVwdCwgdGhlIHJlbGVhc2UNCmV2ZW50IGlzIGhhbmRsZWQgYnkg
YnVzeSBsb29wIGNoZWNrLCBidXQgSSBkb3VibGUgY2hlY2sgdGhlIFNDVSBGVydzIGJlaGF2aW9y
LCBpdCBkb2VzIE5PVCBzZW5kIG91dCBpbnRlcnJ1cHQNCmZvciBidXR0b24gcmVsZWFzZSBldmVu
dCBhdCBhbGwsIHNvIGl0IGlzIE5PVCBuZWVkZWQgYW55IG1vcmUsIEkgd2lsbCByZW1vdmUgdGhl
IHByaXYtPmRlbGF5X2NoZWNrIGNvbXBsZXRlbHkgaW4gdGhpcyBkcml2ZXIuDQoNCj4gDQo+ID4g
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
ICsJCXN0YXRlID0gdHJ1ZTsNCj4gDQo+IFRoaXMgbmVlZHMgYW4gZXhwbGFuYXRpb24gcGxlYXNl
Lg0KDQpUaGlzIGlzIHRvIGhhbmRsZSB0aGUgcXVpY2sgcHJlc3Mgb2YgYnV0dG9uLCBlLmcuLCB3
aGVuIGJ1dHRvbiBpcyBwcmVzc2VkIGFuZCByZWxlYXNlZCB2ZXJ5IHF1aWNrbHksDQp3aGVuIHRo
ZSBkZWxheSB3b3JrIGlzIHNjaGVkdWxlZCwgdGhlIGJ1dHRvbiBzdGF0ZSByZWFkIGZyb20gU0NV
IEZXIGlzIGFjdHVhbGx5IGEgcmVsZWFzZSBzdGF0ZSAoMCksDQp0aGUgcHJlc3Mgc3RhdGUgaXMg
KDEpLCBzbyB0aGUgcXVpY2sgcHJlc3MvcmVsZWFzZSB3aWxsIGJlIGlnbm9yZWQuDQoNCkhvd2V2
ZXIsIGFmdGVyIGRvdWJsZSBjaGVjayBhbmQgdGVzdCwgSSB0aGluayB0aGlzIHNob3VsZCBiZSBo
YW5kbGVkIGJ5IGRlYm91bmNlIHRpbWUsIGlmIHRoZSBidXR0b24gaXMgcHJlc3NlZC9yZWxlYXNl
DQp2ZXJ5IHF1aWNrbHksIHRoZSBldmVudCBzaG91bGQgYmUgaWdub3JlZCwgSSB3aWxsIHJlbW92
ZSBpdCBhbmQgcmVkdWNlIHRoZSBkZWJvdW5jZSB0aW1lIHRvIDMwbVMsIHByZXZpb3VzIDEwMG1T
DQppcyB0b28gbG9uZywgdXNpbmcgMzBtUyBhcyBkZWJvdW5jZSB0aW1lLCBJIGRpZCBOT1Qgc2Vl
IHNpbWlsYXIgaXNzdWUgbm8gbWF0dGVyIGhvdyBxdWljayBJIHByZXNzL3JlbGVhc2UgdGhlIGJ1
dHRvbi4NCg0KPiANCj4gPiArDQo+ID4gKwlpZiAoc3RhdGUgXiBwcml2LT5rZXlzdGF0ZSkgew0K
PiA+ICsJCXBtX3dha2V1cF9ldmVudChpbnB1dC0+ZGV2LnBhcmVudCwgMCk7DQo+IA0KPiBJJ2Qg
ZXhwZWN0IHRoaXMgaGFwcGVuaW5nIGluIGlteF9zY19rZXlfbm90aWZ5KCkgc28gdGhhdCB0aGUg
ZGV2aWNlIHdvdWxkDQo+IGhhdmUgYSBjaGFuZ2UgdG8gcnVuIHRoaXMgd29yay4NCg0KQWdyZWVk
LCB3aWxsIG1vdmUgaXQgdG8gdGhlIGlteF9zY19rZXlfbm90aWZ5KCkuDQoNCj4gDQo+ID4gKwkJ
cHJpdi0+a2V5c3RhdGUgPSBzdGF0ZTsNCj4gPiArCQlpbnB1dF9ldmVudChpbnB1dCwgRVZfS0VZ
LCBwcml2LT5rZXljb2RlLCBzdGF0ZSk7DQo+ID4gKwkJaW5wdXRfc3luYyhpbnB1dCk7DQo+ID4g
KwkJaWYgKCFzdGF0ZSkNCj4gPiArCQkJcHJpdi0+ZGVsYXlfY2hlY2sgPSAwOw0KPiA+ICsJCXBt
X3JlbGF4KHByaXYtPmlucHV0LT5kZXYucGFyZW50KTsNCj4gDQo+IEFyZSB5b3Ugc3VyZSB5b3Ug
d2FudCB0byBjYWxsIHBtX3JlbGF4KCkgdW5jb25kaXRpb25hbGx5LCBhbmQgbm90IHdoZW4gc3Rh
dGUNCj4gPT0gZmFsc2UgKGkuZS4gYnV0dG9uIHJlbGVhc2VkKT8NCg0KQWdyZWVkLCB3aWxsIG1h
a2Ugc3VyZSBPTkxZIGNhbGwgaXQgd2hlbiBidXR0b24gaXMgcmVsZWFzZWQgd2hpY2ggaW5kaWNh
dGVzIHRoZSBldmVudA0KaXMgZmluaXNoZWQuDQoNCj4gDQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJ
aWYgKHN0YXRlKQ0KPiA+ICsJCXNjaGVkdWxlX2RlbGF5ZWRfd29yaygmcHJpdi0+Y2hlY2tfd29y
aywNCj4gPiArCQkJCSAgICAgIG1zZWNzX3RvX2ppZmZpZXMoUkVQRUFUX0lOVEVSVkFMKSk7DQo+
ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyBpbnQgaW14X3NjX2tleV9wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KSB7DQo+ID4gKwlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wID0gcGRl
di0+ZGV2Lm9mX25vZGU7DQo+ID4gKwlzdGF0aWMgc3RydWN0IGlteF9rZXlfZHJ2X2RhdGEgKnBy
aXY7DQo+ID4gKwlzdHJ1Y3QgaW5wdXRfZGV2ICppbnB1dDsNCj4gPiArCWludCByZXQ7DQo+ID4g
Kw0KPiA+ICsJcHJpdiA9IGRldm1fa3phbGxvYygmcGRldi0+ZGV2LCBzaXplb2YoKnByaXYpLCBH
RlBfS0VSTkVMKTsNCj4gPiArCWlmICghcHJpdikNCj4gPiArCQlyZXR1cm4gLUVOT01FTTsNCj4g
PiArDQo+ID4gKwlyZXQgPSBpbXhfc2N1X2dldF9oYW5kbGUoJnByaXYtPmtleV9pcGNfaGFuZGxl
KTsNCj4gPiArCWlmIChyZXQpDQo+ID4gKwkJcmV0dXJuIHJldDsNCj4gPiArDQo+ID4gKwlpZiAo
b2ZfcHJvcGVydHlfcmVhZF91MzIobnAsICJsaW51eCxrZXljb2RlIiwgJnByaXYtPmtleWNvZGUp
KSB7DQo+ID4gKwkJZGV2X2VycigmcGRldi0+ZGV2LCAibWlzc2luZyBLRVlfUE9XRVIgaW4gRFRc
biIpOw0KPiA+ICsJCXJldHVybiAtRUlOVkFMOw0KPiA+ICsJfQ0KPiA+ICsNCj4gPiArCUlOSVRf
REVMQVlFRF9XT1JLKCZwcml2LT5jaGVja193b3JrLA0KPiBpbXhfc2NfY2hlY2tfZm9yX2V2ZW50
cyk7DQo+ID4gKw0KPiA+ICsJaW5wdXQgPSBkZXZtX2lucHV0X2FsbG9jYXRlX2RldmljZSgmcGRl
di0+ZGV2KTsNCj4gPiArCWlmICghaW5wdXQpIHsNCj4gPiArCQlkZXZfZXJyKCZwZGV2LT5kZXYs
ICJmYWlsZWQgdG8gYWxsb2NhdGUgdGhlIGlucHV0IGRldmljZVxuIik7DQo+ID4gKwkJcmV0dXJu
IC1FTk9NRU07DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJaW5wdXQtPm5hbWUgPSBwZGV2LT5uYW1l
Ow0KPiA+ICsJaW5wdXQtPnBoeXMgPSAiaW14LXNjLWtleS9pbnB1dDAiOw0KPiA+ICsJaW5wdXQt
PmlkLmJ1c3R5cGUgPSBCVVNfSE9TVDsNCj4gPiArDQo+ID4gKwlpbnB1dF9zZXRfY2FwYWJpbGl0
eShpbnB1dCwgRVZfS0VZLCBwcml2LT5rZXljb2RlKTsNCj4gPiArDQo+ID4gKwlyZXQgPSBpbnB1
dF9yZWdpc3Rlcl9kZXZpY2UoaW5wdXQpOw0KPiA+ICsJaWYgKHJldCkgew0KPiANCj4gQ291bGQg
eW91IHBsZWFzZSByZW5hbWUgdGhpcyAoYW5kIGVsc2V3aGVyZSkgZnJvbSAncmV0JyB0byAnZXJy
b3InPw0KDQpPSy4NCg0KPiANCj4gPiArCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJmYWlsZWQgdG8g
cmVnaXN0ZXIgaW5wdXQgZGV2aWNlXG4iKTsNCj4gPiArCQlyZXR1cm4gcmV0Ow0KPiA+ICsJfQ0K
PiA+ICsNCj4gPiArCXByaXYtPmlucHV0ID0gaW5wdXQ7DQo+ID4gKwlwbGF0Zm9ybV9zZXRfZHJ2
ZGF0YShwZGV2LCBwcml2KTsNCj4gPiArDQo+ID4gKwlyZXQgPSBpbXhfc2N1X2lycV9ncm91cF9l
bmFibGUoU0NfSVJRX0dST1VQX1dBS0UsDQo+IFNDX0lSUV9CVVRUT04sIHRydWUpOw0KPiA+ICsJ
aWYgKHJldCkgew0KPiA+ICsJCWRldl93YXJuKCZwZGV2LT5kZXYsICJlbmFibGUgc2N1IGdyb3Vw
IGlycSBmYWlsZWRcbiIpOw0KPiA+ICsJCXJldHVybiByZXQ7DQo+ID4gKwl9DQo+ID4gKw0KPiA+
ICsJcHJpdi0+a2V5X25vdGlmaWVyLm5vdGlmaWVyX2NhbGwgPSBpbXhfc2Nfa2V5X25vdGlmeTsN
Cj4gPiArCXJldCA9IGlteF9zY3VfaXJxX3JlZ2lzdGVyX25vdGlmaWVyKCZwcml2LT5rZXlfbm90
aWZpZXIpOw0KPiA+ICsJaWYgKHJldCkgew0KPiA+ICsJCWlteF9zY3VfaXJxX2dyb3VwX2VuYWJs
ZShTQ19JUlFfR1JPVVBfV0FLRSwNCj4gU0NfSVJRX0JVVFRPTiwgZmFsc2UpOw0KPiA+ICsJCWRl
dl93YXJuKCZwZGV2LT5kZXYsICJyZWdpc3RlciBzY3Ugbm90aWZpZXIgZmFpbGVkXG4iKTsNCj4g
DQo+IAkJcmV0dXJuIGVycm9yOw0KPiA+ICsJfQ0KPiA+ICsNCj4gPiArCXJldHVybiByZXQ7DQo+
IA0KPiAJcmV0dXJuIDA7DQoNCk9LLg0KDQpUaGFua3MsDQpBbnNvbi4NCg==
