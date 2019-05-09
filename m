Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9E6A18343
	for <lists+linux-input@lfdr.de>; Thu,  9 May 2019 03:41:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725922AbfEIBlW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 8 May 2019 21:41:22 -0400
Received: from mail-eopbgr50049.outbound.protection.outlook.com ([40.107.5.49]:24133
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725832AbfEIBlW (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 8 May 2019 21:41:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NGDMMqRrFSAcqeoaTTTOzfrwN0ThO1W7PeepRk2N/Xk=;
 b=NUFY6WfotNz2+dNBiPK+cSXTh0OnY+r452UsFLypDQ1aJxFedAPmBaZf6iUdVnIXci7kcWa77u/5Wh9GynGLfN8XZb8DzPhRtTLKZWBaRKKk1VgOwQt3JVHOKI1jYiZchjUlgyKkDILQg++FL0W9K58RHgaJnRmALW6AUg1Nz1Y=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) by
 DB3PR0402MB3929.eurprd04.prod.outlook.com (52.134.70.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.20; Thu, 9 May 2019 01:41:17 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::d035:3bd0:a56a:189d]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::d035:3bd0:a56a:189d%2]) with mapi id 15.20.1878.022; Thu, 9 May 2019
 01:41:17 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Mukesh Ojha <mojha@codeaurora.org>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH] input: imx6ul_tsc: use devm_platform_ioremap_resource()
 to simplify code
Thread-Topic: [PATCH] input: imx6ul_tsc: use devm_platform_ioremap_resource()
 to simplify code
Thread-Index: AQHU6EqK7YCFSFAUiEmCAJSqda9wGaYm8dcAgCpVLOCAEPj3EA==
Date:   Thu, 9 May 2019 01:41:17 +0000
Message-ID: <DB3PR0402MB3916918EA010BEC627F41563F5330@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1554095712-15413-1-git-send-email-Anson.Huang@nxp.com>
 <d3b8cf17-36bb-d79d-7d60-76ae2416075d@codeaurora.org>
 <DB3PR0402MB3916D9B009F5187D52A8A7D3F5380@DB3PR0402MB3916.eurprd04.prod.outlook.com>
In-Reply-To: <DB3PR0402MB3916D9B009F5187D52A8A7D3F5380@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=anson.huang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3c8f97ab-e539-4db7-fc0f-08d6d41f6e3e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:DB3PR0402MB3929;
x-ms-traffictypediagnostic: DB3PR0402MB3929:
x-microsoft-antispam-prvs: <DB3PR0402MB392933B19B0E74990503220BF5330@DB3PR0402MB3929.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:207;
x-forefront-prvs: 003245E729
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(366004)(39860400002)(376002)(346002)(396003)(189003)(199004)(13464003)(5660300002)(316002)(52536014)(7696005)(99286004)(229853002)(478600001)(76176011)(68736007)(8936002)(102836004)(11346002)(53546011)(476003)(446003)(9686003)(81156014)(44832011)(55016002)(81166006)(33656002)(53936002)(73956011)(8676002)(2501003)(486006)(26005)(6436002)(76116006)(66946007)(64756008)(66446008)(66476007)(66556008)(110136005)(14454004)(86362001)(4326008)(66066001)(6246003)(25786009)(186003)(2201001)(6506007)(2906002)(7736002)(305945005)(256004)(71200400001)(71190400001)(3846002)(6116002)(74316002);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3929;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wwn3fFg2JbhlGM8/OOZ08syG4vTKEpl18eTHOI9IktnW+9sALIVZq+YkKOWWUDdtsig4Sts9ZnmTccQyAgsN2lguIRnvCTdO2S8JD1E5axeVXx0yPSkbRSC2OWSlVZIooincNn9JKTSmYh08R1Z/LzeoLxtQ4O0asIlRlo6Fr5GbSXtPXEcy+oe3LYxONacb5Wt6zVs+XAPsb0NYFgGriYFYjJBgJLSEimedZF9+DqwQORetulb7486z758QMkgXU49mDX8cdtnzXDFjBng1DYeZ25/X8zDeVgAzMZHSQAUkMeRFv8CSOWLmobBFeACLR61r5fLQ5I6Vy33utJiljI9w5bYpXtYWzkHnCnLlwakJ71gXD57WA/W8DbgmqAVFRmEUdS/YGVYBc3NT6cdrpp0Q67ETtBlLoKcBTQVbzNA=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c8f97ab-e539-4db7-fc0f-08d6d41f6e3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2019 01:41:17.7239
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3929
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

UGluZy4uLg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFuc29uIEh1
YW5nDQo+IFNlbnQ6IFN1bmRheSwgQXByaWwgMjgsIDIwMTkgMjozMCBQTQ0KPiBUbzogTXVrZXNo
IE9qaGEgPG1vamhhQGNvZGVhdXJvcmEub3JnPjsgZG1pdHJ5LnRvcm9raG92QGdtYWlsLmNvbTsN
Cj4gc2hhd25ndW9Aa2VybmVsLm9yZzsgcy5oYXVlckBwZW5ndXRyb25peC5kZTsga2VybmVsQHBl
bmd1dHJvbml4LmRlOw0KPiBmZXN0ZXZhbUBnbWFpbC5jb207IGxpbnV4LWlucHV0QHZnZXIua2Vy
bmVsLm9yZzsgbGludXgtYXJtLQ0KPiBrZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgt
a2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiBDYzogZGwtbGludXgtaW14IDxsaW51eC1pbXhAbnhw
LmNvbT4NCj4gU3ViamVjdDogUkU6IFtQQVRDSF0gaW5wdXQ6IGlteDZ1bF90c2M6IHVzZQ0KPiBk
ZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UoKSB0byBzaW1wbGlmeSBjb2RlDQo+IA0KPiBQ
aW5nLi4uDQo+IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogTXVr
ZXNoIE9qaGEgW21haWx0bzptb2poYUBjb2RlYXVyb3JhLm9yZ10NCj4gPiBTZW50OiBNb25kYXks
IEFwcmlsIDEsIDIwMTkgNDowMiBQTQ0KPiA+IFRvOiBBbnNvbiBIdWFuZyA8YW5zb24uaHVhbmdA
bnhwLmNvbT47IGRtaXRyeS50b3Jva2hvdkBnbWFpbC5jb207DQo+ID4gc2hhd25ndW9Aa2VybmVs
Lm9yZzsgcy5oYXVlckBwZW5ndXRyb25peC5kZTsga2VybmVsQHBlbmd1dHJvbml4LmRlOw0KPiA+
IGZlc3RldmFtQGdtYWlsLmNvbTsgbGludXgtaW5wdXRAdmdlci5rZXJuZWwub3JnOyBsaW51eC1h
cm0tDQo+ID4ga2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmcNCj4gPiBDYzogZGwtbGludXgtaW14IDxsaW51eC1pbXhAbnhwLmNvbT4NCj4gPiBT
dWJqZWN0OiBSZTogW1BBVENIXSBpbnB1dDogaW14NnVsX3RzYzogdXNlDQo+ID4gZGV2bV9wbGF0
Zm9ybV9pb3JlbWFwX3Jlc291cmNlKCkgdG8gc2ltcGxpZnkgY29kZQ0KPiA+DQo+ID4NCj4gPiBP
biA0LzEvMjAxOSAxMDo0OSBBTSwgQW5zb24gSHVhbmcgd3JvdGU6DQo+ID4gPiBVc2UgdGhlIG5l
dyBoZWxwZXIgZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlKCkgd2hpY2ggd3JhcHMgdGhl
DQo+ID4gPiBwbGF0Zm9ybV9nZXRfcmVzb3VyY2UoKSBhbmQgZGV2bV9pb3JlbWFwX3Jlc291cmNl
KCkgdG9nZXRoZXIsIHRvDQo+ID4gPiBzaW1wbGlmeSB0aGUgY29kZS4NCj4gPiA+DQo+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBBbnNvbiBIdWFuZyA8QW5zb24uSHVhbmdAbnhwLmNvbT4NCj4gPg0KPiA+
DQo+ID4gUmV2aWV3ZWQtYnk6IE11a2VzaCBPamhhIDxtb2poYUBjb2RlYXVyb3JhLm9yZz4NCj4g
Pg0KPiA+IENoZWVycywNCj4gPiAtTXVrZXNoDQo+ID4NCj4gPiA+IC0tLQ0KPiA+ID4gICBkcml2
ZXJzL2lucHV0L3RvdWNoc2NyZWVuL2lteDZ1bF90c2MuYyB8IDggKystLS0tLS0NCj4gPiA+ICAg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4gPiA+DQo+
ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pbnB1dC90b3VjaHNjcmVlbi9pbXg2dWxfdHNjLmMN
Cj4gPiA+IGIvZHJpdmVycy9pbnB1dC90b3VjaHNjcmVlbi9pbXg2dWxfdHNjLmMNCj4gPiA+IGlu
ZGV4IGMxMGZjNTkuLmUwNGVlY2QgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL2lucHV0L3Rv
dWNoc2NyZWVuL2lteDZ1bF90c2MuYw0KPiA+ID4gKysrIGIvZHJpdmVycy9pbnB1dC90b3VjaHNj
cmVlbi9pbXg2dWxfdHNjLmMNCj4gPiA+IEBAIC0zNjQsOCArMzY0LDYgQEAgc3RhdGljIGludCBp
bXg2dWxfdHNjX3Byb2JlKHN0cnVjdA0KPiA+ID4gcGxhdGZvcm1fZGV2aWNlDQo+ID4gKnBkZXYp
DQo+ID4gPiAgIAlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wID0gcGRldi0+ZGV2Lm9mX25vZGU7DQo+
ID4gPiAgIAlzdHJ1Y3QgaW14NnVsX3RzYyAqdHNjOw0KPiA+ID4gICAJc3RydWN0IGlucHV0X2Rl
diAqaW5wdXRfZGV2Ow0KPiA+ID4gLQlzdHJ1Y3QgcmVzb3VyY2UgKnRzY19tZW07DQo+ID4gPiAt
CXN0cnVjdCByZXNvdXJjZSAqYWRjX21lbTsNCj4gPiA+ICAgCWludCBlcnI7DQo+ID4gPiAgIAlp
bnQgdHNjX2lycTsNCj4gPiA+ICAgCWludCBhZGNfaXJxOw0KPiA+ID4gQEAgLTQwMywxNiArNDAx
LDE0IEBAIHN0YXRpYyBpbnQgaW14NnVsX3RzY19wcm9iZShzdHJ1Y3QNCj4gPiBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpDQo+ID4gPiAgIAkJcmV0dXJuIGVycjsNCj4gPiA+ICAgCX0NCj4gPiA+DQo+
ID4gPiAtCXRzY19tZW0gPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2UocGRldiwgSU9SRVNPVVJDRV9N
RU0sIDApOw0KPiA+ID4gLQl0c2MtPnRzY19yZWdzID0gZGV2bV9pb3JlbWFwX3Jlc291cmNlKCZw
ZGV2LT5kZXYsIHRzY19tZW0pOw0KPiA+ID4gKwl0c2MtPnRzY19yZWdzID0gZGV2bV9wbGF0Zm9y
bV9pb3JlbWFwX3Jlc291cmNlKHBkZXYsIDApOw0KPiA+ID4gICAJaWYgKElTX0VSUih0c2MtPnRz
Y19yZWdzKSkgew0KPiA+ID4gICAJCWVyciA9IFBUUl9FUlIodHNjLT50c2NfcmVncyk7DQo+ID4g
PiAgIAkJZGV2X2VycigmcGRldi0+ZGV2LCAiZmFpbGVkIHRvIHJlbWFwIHRzYyBtZW1vcnk6ICVk
XG4iLA0KPiA+IGVycik7DQo+ID4gPiAgIAkJcmV0dXJuIGVycjsNCj4gPiA+ICAgCX0NCj4gPiA+
DQo+ID4gPiAtCWFkY19tZW0gPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2UocGRldiwgSU9SRVNPVVJD
RV9NRU0sIDEpOw0KPiA+ID4gLQl0c2MtPmFkY19yZWdzID0gZGV2bV9pb3JlbWFwX3Jlc291cmNl
KCZwZGV2LT5kZXYsIGFkY19tZW0pOw0KPiA+ID4gKwl0c2MtPmFkY19yZWdzID0gZGV2bV9wbGF0
Zm9ybV9pb3JlbWFwX3Jlc291cmNlKHBkZXYsIDEpOw0KPiA+ID4gICAJaWYgKElTX0VSUih0c2Mt
PmFkY19yZWdzKSkgew0KPiA+ID4gICAJCWVyciA9IFBUUl9FUlIodHNjLT5hZGNfcmVncyk7DQo+
ID4gPiAgIAkJZGV2X2VycigmcGRldi0+ZGV2LCAiZmFpbGVkIHRvIHJlbWFwIGFkYyBtZW1vcnk6
ICVkXG4iLA0KPiA+IGVycik7DQo=
