Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94E733AF13
	for <lists+linux-input@lfdr.de>; Mon, 10 Jun 2019 08:44:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387815AbfFJGoH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Jun 2019 02:44:07 -0400
Received: from mail-eopbgr70072.outbound.protection.outlook.com ([40.107.7.72]:27780
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387655AbfFJGoH (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Jun 2019 02:44:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QOw+8RG6TiPIg1IJb6MH9vPRw0/JTcOKgymZbG+4g+w=;
 b=Jaa9EAs0Gd9eTWUzWj5r2qfncsCKu5wscb3afSodq4qxW8dX5KmgUATyiXD+WGKXj4T0m1e+tcVeq0/sIKvugF7o3eFKjuI/JwAMtaeV+/ao4AZZjSA1FgLETIOW02Zo3dRvCcfz4WO8Tpo+8ympuI5aMfuL6BcznvsQv/YrmEA=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) by
 DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.14; Mon, 10 Jun 2019 06:44:00 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::5835:e874:bd94:fec]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::5835:e874:bd94:fec%5]) with mapi id 15.20.1965.017; Mon, 10 Jun 2019
 06:44:00 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>
CC:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [RESEND] input: keyboard: imx: make sure keyboard can always wake
 up system
Thread-Topic: [RESEND] input: keyboard: imx: make sure keyboard can always
 wake up system
Thread-Index: AQHU6odaZd/8EWsin0yXXO1zjKS4q6Z1V6CAgAALV+CAH3eEoA==
Date:   Mon, 10 Jun 2019 06:44:00 +0000
Message-ID: <DB3PR0402MB39169646E73C1A78958EA325F5130@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1554341727-16084-1-git-send-email-Anson.Huang@nxp.com>
 <20190521053047.GG183429@dtor-ws>
 <DB3PR0402MB3916ED371BF79D823FBC5171F5070@DB3PR0402MB3916.eurprd04.prod.outlook.com>
In-Reply-To: <DB3PR0402MB3916ED371BF79D823FBC5171F5070@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=anson.huang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a9a2fc0e-032f-49b7-14c6-08d6ed6f0555
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DB3PR0402MB3916;
x-ms-traffictypediagnostic: DB3PR0402MB3916:
x-microsoft-antispam-prvs: <DB3PR0402MB39160C61CA48C14F718487D9F5130@DB3PR0402MB3916.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 0064B3273C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(346002)(366004)(136003)(396003)(39860400002)(13464003)(199004)(189003)(6246003)(54906003)(2906002)(446003)(53936002)(11346002)(25786009)(4326008)(476003)(7736002)(81166006)(68736007)(8676002)(486006)(5660300002)(8936002)(305945005)(1361003)(81156014)(316002)(52536014)(186003)(2501003)(44832011)(86362001)(26005)(229853002)(14444005)(66446008)(64756008)(66556008)(66476007)(66946007)(73956011)(9686003)(71200400001)(33656002)(76116006)(74316002)(256004)(3846002)(66066001)(55016002)(6436002)(6116002)(5640700003)(14454004)(2351001)(102836004)(99286004)(6916009)(478600001)(76176011)(6506007)(53546011)(71190400001)(7696005);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3916;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GDMYDNc4fAq9cl8nkO60D/tDt9ffV3JXVz0MuYtiGMR4VLQUPdus2f9dg6tIwa/G29tgq6coaBBek7dqkFk9fFnNm93LShCfnDmzeQfo4dYcGneXXfiuD20+s6gDemP7gWHx6z9UmVHwpBoB65j6yYTsnecxXtHQgfywFyYu/O/4hX2zrGaIlEnWZP+CiqWtS3IeX/+K4BEzVW8ey6aN19XcrT4ykcLeqv+5TumUIc7274mQBBNcMLpnmhQQLV6vHXrE15kMabd7e4gtEKuQ62etjl4lMlTMGqRXTRFCyfrA3TK9ycbht926R1VNKI6/pxyx4IfVR3wZ4jBC2hy2cVVLOgFQP68tizXJ5GiA8mlVtvxF8DVGHPOHTyHRweGpgB89QP/X5M0BsGdzVIgN5S2EdV2HOoF6d6ukeXWy804=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9a2fc0e-032f-49b7-14c6-08d6ed6f0555
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2019 06:44:00.4919
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: anson.huang@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3916
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

SGksIERtaXRyeQ0KCUFueSBmZWVkYmFjayBmb3IgdGhpcyBwYXRjaD8NCg0KVGhhbmtzLA0KQW5z
b24NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbnNvbiBIdWFuZw0K
PiBTZW50OiBUdWVzZGF5LCBNYXkgMjEsIDIwMTkgMjozNiBQTQ0KPiBUbzogZG1pdHJ5LnRvcm9r
aG92QGdtYWlsLmNvbQ0KPiBDYzogc2hhd25ndW9Aa2VybmVsLm9yZzsgcy5oYXVlckBwZW5ndXRy
b25peC5kZTsNCj4ga2VybmVsQHBlbmd1dHJvbml4LmRlOyBmZXN0ZXZhbUBnbWFpbC5jb207IGxp
bnV4LWlucHV0QHZnZXIua2VybmVsLm9yZzsNCj4gbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZy
YWRlYWQub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBkbC1saW51eC0NCj4gaW14
IDxsaW51eC1pbXhAbnhwLmNvbT4NCj4gU3ViamVjdDogUkU6IFtSRVNFTkRdIGlucHV0OiBrZXli
b2FyZDogaW14OiBtYWtlIHN1cmUga2V5Ym9hcmQgY2FuIGFsd2F5cw0KPiB3YWtlIHVwIHN5c3Rl
bQ0KPiANCj4gSGksIERtaXRyeQ0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiA+IEZyb206IGRtaXRyeS50b3Jva2hvdkBnbWFpbC5jb20gW21haWx0bzpkbWl0cnkudG9yb2to
b3ZAZ21haWwuY29tXQ0KPiA+IFNlbnQ6IFR1ZXNkYXksIE1heSAyMSwgMjAxOSAxOjMxIFBNDQo+
ID4gVG86IEFuc29uIEh1YW5nIDxhbnNvbi5odWFuZ0BueHAuY29tPg0KPiA+IENjOiBzaGF3bmd1
b0BrZXJuZWwub3JnOyBzLmhhdWVyQHBlbmd1dHJvbml4LmRlOw0KPiA+IGtlcm5lbEBwZW5ndXRy
b25peC5kZTsgZmVzdGV2YW1AZ21haWwuY29tOw0KPiA+IGxpbnV4LWlucHV0QHZnZXIua2VybmVs
Lm9yZzsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOw0KPiA+IGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGRsLWxpbnV4LSBpbXggPGxpbnV4LWlteEBueHAuY29tPg0K
PiA+IFN1YmplY3Q6IFJlOiBbUkVTRU5EXSBpbnB1dDoga2V5Ym9hcmQ6IGlteDogbWFrZSBzdXJl
IGtleWJvYXJkIGNhbg0KPiA+IGFsd2F5cyB3YWtlIHVwIHN5c3RlbQ0KPiA+DQo+ID4gSGkgQW5z
b24sDQo+ID4gT24gVGh1LCBBcHIgMDQsIDIwMTkgYXQgMDE6NDA6MTZBTSArMDAwMCwgQW5zb24g
SHVhbmcgd3JvdGU6DQo+ID4gPiBUaGVyZSBhcmUgc2V2ZXJhbCBzY2VuYXJpb3MgdGhhdCBrZXli
b2FyZCBjYW4gTk9UIHdha2UgdXAgc3lzdGVtDQo+ID4gPiBmcm9tIHN1c3BlbmQsIGUuZy4sIGlm
IGEga2V5Ym9hcmQgaXMgZGVwcmVzc2VkIGJldHdlZW4gc3lzdGVtIGRldmljZQ0KPiA+ID4gc3Vz
cGVuZCBwaGFzZSBhbmQgZGV2aWNlIG5vaXJxIHN1c3BlbmQgcGhhc2UsIHRoZSBrZXlib2FyZCBJ
U1Igd2lsbA0KPiA+ID4gYmUgY2FsbGVkIGFuZCBib3RoIGtleWJvYXJkIGRlcHJlc3MgYW5kIHJl
bGVhc2UgaW50ZXJydXB0cyB3aWxsIGJlDQo+ID4gPiBkaXNhYmxlZCwgdGhlbiBrZXlib2FyZCB3
aWxsIG5vIGxvbmdlciBiZSBhYmxlIHRvIHdha2UgdXAgc3lzdGVtLg0KPiA+ID4gQW5vdGhlciBz
Y2VuYXJpbyB3b3VsZCBiZSwgaWYgYSBrZXlib2FyZCBpcyBrZXB0IGRlcHJlc3NlZCwgYW5kIHRo
ZW4NCj4gPiA+IHN5c3RlbSBnb2VzIGludG8gc3VzcGVuZCwgdGhlIGV4cGVjdGVkIGJlaGF2aW9y
IHdvdWxkIGJlIHdoZW4NCj4gPiA+IGtleWJvYXJkIGlzIHJlbGVhc2VkLCBzeXN0ZW0gd2lsbCBi
ZSB3YWtlZCB1cCwgYnV0IGN1cnJlbnQNCj4gPiA+IGltcGxlbWVudGF0aW9uIGNhbiBOT1QgYWNo
aWV2ZSB0aGF0LCBiZWNhdXNlIGJvdGggZGVwcmVzcyBhbmQNCj4gPiA+IHJlbGVhc2UgaW50ZXJy
dXB0cyBhcmUgZGlzYWJsZWQgaW4gSVNSLCBhbmQgdGhlIGV2ZW50IGNoZWNrIGlzIHN0aWxsIGlu
DQo+IHByb2dyZXNzLg0KPiA+ID4NCj4gPiA+IFRvIGZpeCB0aGVzZSBpc3N1ZXMsIG5lZWQgdG8g
bWFrZSBzdXJlIGtleWJvYXJkJ3MgZGVwcmVzcyBvciByZWxlYXNlDQo+ID4gPiBpbnRlcnJ1cHQg
aXMgZW5hYmxlZCBhZnRlciBub2lycSBkZXZpY2Ugc3VzcGVuZCBwaGFzZSwgdGhpcyBwYXRjaA0K
PiA+ID4gbW92ZXMgdGhlIHN1c3BlbmQvcmVzdW1lIGNhbGxiYWNrIHRvIG5vaXJxIHN1c3BlbmQv
cmVzdW1lIHBoYXNlLA0KPiBhbmQNCj4gPiA+IGVuYWJsZSB0aGUgY29ycmVzcG9uZGluZyBpbnRl
cnJ1cHQgYWNjb3JkaW5nIHRvIGN1cnJlbnQga2V5Ym9hcmQgc3RhdHVzLg0KPiA+DQo+ID4gSSBi
ZWxpZXZlIGl0IGlzIHBvc3NpYmxlIGZvciBJUlEgdG8gYmUgZGlzYWJsZWQgYW5kIHN0aWxsICBi
ZWluZw0KPiA+IGVuYWJsZWQgYXMgd2FrZXVwIHNvdXJjZS4gV2hhdCBoYXBwZW5zIGlmIHlvdSBj
YWxsIGRpc2FibGVfaXJxKCkNCj4gPiBiZWZvcmUgZGlzYWJsaW5nIHRoZSBjbG9jaz8NCj4gDQo+
IERvaW5nIGJlbG93IGRvZXMgTk9UIGZpeCB0aGUgc2NlbmFyaW8vaXNzdWUgMTAwJSwgaWYgdGhl
IGtleXBhZCdzIElSUQ0KPiBhcnJpdmVkIGR1cmluZyBzdXNwZW5kIHBoYXNlIGJ1dCBiZWZvcmUg
ZGlzYWJsaW5nIGl0cyBJUlEgaW4gaXRzIHN1c3BlbmQNCj4gY2FsbGJhY2ssIHRoZW4gaXNzdWUg
aXMgc3RpbGwgdGhlcmUsIGFzIHRoZSBpc3N1ZSBpcyB0aGF0IHdoZW4gc3lzdGVtIHN1c3BlbmQs
DQo+IGtleXBhZCdzIGlycSBhcnJpdmVkIGR1cmluZyBzdXNwZW5kIGFuZCBub2lycSBzdXNwZW5k
IHBoYXNlLCB0aGVuIGtleXBhZCdzDQo+IGhhcmR3YXJlIGludGVycnVwdCBkZXRlY3Rpb24gd2ls
bCBiZSBkaXNhYmxlZCBpbiB0aGUgSVNSIGhhbmRsZXIsIGFuZCB0aGUNCj4gdGltZXIgZXZlbnQg
c2V0dXAgYnkgSVNSIGhhbmRsZXIgaXMgTk9UIGZpcmVkLA0KPiBpbXhfa2V5cGFkX2NoZWNrX2Zv
cl9ldmVudHMoKSBpcyBOT1QgZXhlY3V0ZWQgYW5kIGhhcmR3YXJlIGtleXBhZCdzDQo+IGRlcHJl
c3MvcmVsZWFzZSBpbnRlcnJ1cHQgaXMgTk9UIHJlLWVuYWJsZWQgeWV0LCBzbyBpdCBjYW4gTk9U
IHdha2UgdXANCj4gc3lzdGVtIGFueW1vcmUuLi4NCj4gDQo+IFNvIEkgdGhpbmsgdGhlIHNvbGlk
IGZpeCBpcyB0byBtYWtlIHN1cmUga2V5cGFkIGNhbiBnZW5lcmF0ZSBJUlEgKGVpdGhlcg0KPiBk
ZXByZXNzIG9yIHJlbGVhc2UpIGF0IGFueSB0aW1lIGR1cmluZyBzeXN0ZW0gc3VzcGVuZCBmbG93
Lg0KPiANCj4gKysrIGIvZHJpdmVycy9pbnB1dC9rZXlib2FyZC9pbXhfa2V5cGFkLmMNCj4gQEAg
LTUzMyw2ICs1MzMsOCBAQCBzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIGlteF9rYmRfc3VzcGVu
ZChzdHJ1Y3QNCj4gZGV2aWNlICpkZXYpDQo+ICAgICAgICAgLyogaW14IGtiZCBjYW4gd2FrZSB1
cCBzeXN0ZW0gZXZlbiBjbG9jayBpcyBkaXNhYmxlZCAqLw0KPiAgICAgICAgIG11dGV4X2xvY2so
JmlucHV0X2Rldi0+bXV0ZXgpOw0KPiANCj4gKyAgICAgICBkaXNhYmxlX2lycShrYmQtPmlycSk7
DQo+ICsNCj4gICAgICAgICBpZiAoaW5wdXRfZGV2LT51c2VycykNCj4gICAgICAgICAgICAgICAg
IGNsa19kaXNhYmxlX3VucHJlcGFyZShrYmQtPmNsayk7DQo+IA0KPiANCj4gQEAgLTU2Miw2ICs1
NjksOCBAQCBzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIGlteF9rYmRfcmVzdW1lKHN0cnVjdA0K
PiBkZXZpY2UgKmRldikNCj4gICAgICAgICAgICAgICAgICAgICAgICAgZ290byBlcnJfY2xrOw0K
PiAgICAgICAgIH0NCj4gDQo+ICsgICAgICAgZW5hYmxlX2lycShrYmQtPmlycSk7DQo+ICsNCj4g
IGVycl9jbGs6DQo+IA0KPiBBbnNvbi4NCj4gDQo+ID4NCj4gPiBUaGFua3MuDQo+ID4NCj4gPiAt
LQ0KPiA+IERtaXRyeQ0K
