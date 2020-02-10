Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A09C8156D89
	for <lists+linux-input@lfdr.de>; Mon, 10 Feb 2020 03:04:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726950AbgBJCD6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 9 Feb 2020 21:03:58 -0500
Received: from mail-am6eur05on2055.outbound.protection.outlook.com ([40.107.22.55]:37435
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726207AbgBJCD6 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 9 Feb 2020 21:03:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fR1ChN8wtgAo0HRS8HGoCi21o4emcCXO8XsTgksifGnOD3D2cR7GBxHsJpYEEVqQhzt1V7cze1vc1nTcXonUUuxU9CPn8BrH5zgRr0A8Vzg6tL1bIVsaLen24ZCIHIyvBTphLHhGOgW1fiwTlrLaPQRnHvZuB9zc52agjiS1BHUe9F4bcUa/nCRLYsGCyDCPpKLV2+mrSLx9O4/bz5Gg6P/eBdZ+cLoI+VF1DkfKTbjv3Xp20IWjKG6JZRqoEuPfKVfRrxZiG90m0mKTAg5LksFing0WDPAQceke24ZKH4yPcOnTZbComD6z6MzY6atf3sok5dI0DKQR04yCmu0RmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KPn7VYaN5ZME74kGFXFuTj4Z2bd6mn2EJdpWBKoFPc0=;
 b=ByZ8xV34lw2PpyAwiPpHZRKk7W876Z70yxF4nrDhb2K8GAfukzuT2BrU+RwYkTCGo1cLePMgx4QzJP2MeKCh86wjgMWa6mSCo6cfpTuY+SYM3bLxeZy3aPvrPXfrAzDFBN9S5KAvcf2OXhVwIPFeab8g97MkVv84PhrdLX2rdqLZqiXNQSgxmBzaVFGksSdrj8IAdE55b/lzcKzWV3io/7/UvnaEtwMEJcRL7P03MDZ2t8IgRPtP3plSSxhhFHKcTefEYLx/oWBJlgwShlQFFGfQ8yvneu74WLj72vQPpDNd8RB6NgAzuWhbpljkGcmQDzxWhgLqzn298y6nJDZCeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KPn7VYaN5ZME74kGFXFuTj4Z2bd6mn2EJdpWBKoFPc0=;
 b=mL+bFz3Tee4tNRZ6mw4j/BYKQofaxuE2+GNXQT4FO0rhDeVOQnuLGiLeVkWfiWsfXs5fCdc+SiUdcPqFZTG79RfPTgZ60+HqLdRmqK+83523ouoKfFv+rYvFoT6NOESAMhI7P7fcvs8apT2D0VO8X+TfxU6YUc2+PMvf3Hy9JV0=
Received: from VE1PR04MB6638.eurprd04.prod.outlook.com (20.179.232.15) by
 VE1PR04MB6511.eurprd04.prod.outlook.com (20.179.233.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.21; Mon, 10 Feb 2020 02:03:51 +0000
Received: from VE1PR04MB6638.eurprd04.prod.outlook.com
 ([fe80::490:6caa:24b:4a31]) by VE1PR04MB6638.eurprd04.prod.outlook.com
 ([fe80::490:6caa:24b:4a31%6]) with mapi id 15.20.2707.028; Mon, 10 Feb 2020
 02:03:51 +0000
From:   Robin Gong <yibin.gong@nxp.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Horia Geanta <horia.geanta@nxp.com>
CC:     =?utf-8?B?QW5kcsOpIERyYXN6aWs=?= <git@andred.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Anson Huang <anson.huang@nxp.com>,
        Aymen Sghaier <aymen.sghaier@nxp.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH 2/3] Input: snvs_pwrkey - enable snvs clock as needed
Thread-Topic: [PATCH 2/3] Input: snvs_pwrkey - enable snvs clock as needed
Thread-Index: AQHV164yHhXoESmTiUqzHJu+3DHGMKgTg/gAgAA3OYA=
Date:   Mon, 10 Feb 2020 02:03:51 +0000
Message-ID: <VE1PR04MB6638A4F4E3BABE0ED0CD4A5189190@VE1PR04MB6638.eurprd04.prod.outlook.com>
References: <20200130204516.4760-1-git@andred.net>
 <20200130204516.4760-2-git@andred.net>
 <VI1PR0402MB3485EC2F82DDE52DC5CA0795981C0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
 <20200209223836.GA199269@dtor-ws>
In-Reply-To: <20200209223836.GA199269@dtor-ws>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yibin.gong@nxp.com; 
x-originating-ip: [183.192.236.243]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 28d21ce7-860e-43d5-de4b-08d7adcd795e
x-ms-traffictypediagnostic: VE1PR04MB6511:|VE1PR04MB6511:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB65110C115FEECEF4D1F0EC2089190@VE1PR04MB6511.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 03094A4065
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(346002)(136003)(39860400002)(366004)(376002)(189003)(199004)(4326008)(316002)(54906003)(110136005)(86362001)(71200400001)(33656002)(6636002)(7416002)(66946007)(76116006)(64756008)(8936002)(66556008)(8676002)(81156014)(81166006)(66446008)(66476007)(5660300002)(478600001)(55016002)(9686003)(6506007)(53546011)(52536014)(186003)(2906002)(26005)(7696005);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR04MB6511;H:VE1PR04MB6638.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: m7vTObT1hgnVb8tt8ZthL5Qh0d+YIX4tiLh8o0rtaXNocu0ajWf63OZQWlPcU0c4ksR09883GibHKCfez88+Rx1QWnd5+rOPvxpOID0P7tRjathIEw+4HisF8fGUrm46IQ2Ke6XYM5NAL+ogWWVj6TAatJwuiTUKNV8YsA+N0iaz6rf/wGeu1DPhy75mT8w61JzR9tTWGDdvmRXivkLHVMYLYtjDhl69QCeXSPACblzdM63a7XC1Lc0TAMF7/Rxewehn+fPDhQUMbp4KTe1r06GhI+u+V6Q2F0j+DB+ThTymFM01sWLeWuaeQMYHCO7pC02AaLxs9PvpindRKV6tPpjBBKIrNVQ0BKZfCxof2GO4bYdKVL0O7z8Fig3iHQhXcEcNP0INSkdSkUoP+7yoZhQrUcjBXdusZLfgS7ge2Aj4JtwVdY83oJFqgwt1y2DM
x-ms-exchange-antispam-messagedata: Foi6XdtN4gxbtG4GTsPsTXrjN6s6Iz7yfBQqp3iRyrSMy4LXxVlNrrdYJMkv8C3ZAkKfSICjSLIvKFMEH9CE5PWSbdWkkBdt3QYNMRIFpVmnlh04JiVsb3Nl2EdhI4A8IIxbbtntbSFBQUrO6iDcCw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28d21ce7-860e-43d5-de4b-08d7adcd795e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2020 02:03:51.1376
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +pXHracFFc04D97n91UTVrX0MQdEgFZZUsKaqOw+ZutSzL4llDBQhhsGjQYsNi0obSQ74LhLHv1uPEv2ro0o3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6511
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

DQpPbiAyMDIwLzAyLzEwIERtaXRyeSBUb3Jva2hvdiA8ZG1pdHJ5LnRvcm9raG92QGdtYWlsLmNv
bT4gd3JvdGU6IA0KPiBPbiBGcmksIEZlYiAwNywgMjAyMCBhdCAwODoxMDoyMkFNICswMDAwLCBI
b3JpYSBHZWFudGEgd3JvdGU6DQo+ID4gT24gMS8zMC8yMDIwIDEwOjQ1IFBNLCBBbmRyw6kgRHJh
c3ppayB3cm90ZToNCj4gPiA+IEF0IHRoZSBtb21lbnQsIGVuYWJsaW5nIHRoaXMgZHJpdmVyIHdp
dGhvdXQgdGhlIFNOVlMgUlRDIGRyaXZlcg0KPiA+ID4gYmVpbmcgYWN0aXZlIHdpbGwgaGFuZyB0
aGUga2VybmVsIGFzIHNvb24gYXMgdGhlIHBvd2VyIGJ1dHRvbiBpcw0KPiA+ID4gcHJlc3NlZC4N
Cj4gPiA+DQo+ID4gPiBUaGUgcmVhc29uIGlzIHRoYXQgaW4gdGhhdCBjYXNlIHRoZSBTTlZTIGlz
bid0IGVuYWJsZWQsIGFuZCBhbnkNCj4gPiA+IGF0dGVtcHQgdG8gcmVhZCB0aGUgU05WUyByZWdp
c3RlcnMgd2lsbCBzaW1wbHkgaGFuZyBmb3JldmVyLg0KPiA+ID4NCj4gPiA+IEVuc3VyZSB0aGUg
Y2xvY2sgaXMgZW5hYmxlZCAoZHVyaW5nIHRoZSBpbnRlcnJ1cHQgaGFuZGxlcikgdG8gbWFrZQ0K
PiA+ID4gdGhpcyBkcml2ZXIgd29yay4NCkJlc2lkZXMsIG5lZWQgdG8gYWRkIGNsb2NrIGVuYWJs
ZWQgaW4gaW14X2lteF9zbnZzX2NoZWNrX2Zvcl9ldmVudHMNCndoZXJlIHNudnMgcmVnaXN0ZXIg
dG91Y2hlZC4NCj4gPiA+DQo+ID4gPiBBbHNvIHNlZSBjb21taXQgN2Y4OTkzOTk1NDEwICgiZHJp
dmVycy9ydGMvcnRjLXNudnM6IGFkZCBjbG9jaw0KPiA+ID4gc3VwcG9ydCIpIGFuZCBjb21taXQg
ZWRiMTkwY2IxNzM0DQo+ID4gPiAoInJ0Yzogc252czogbWFrZSBzdXJlIGNsb2NrIGlzIGVuYWJs
ZWQgZm9yIGludGVycnVwdCBoYW5kbGUiKSBmb3INCj4gPiA+IHNpbWlsYXIgdXBkYXRlcyB0byB0
aGUgc252cyBydGMgZHJpdmVyLg0KPiA+ID4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEFuZHLDqSBE
cmFzemlrIDxnaXRAYW5kcmVkLm5ldD4NCj4gPiA+IENjOiBBbnNvbiBIdWFuZyA8QW5zb24uSHVh
bmdAbnhwLmNvbT4NCj4gPiA+IENjOiBEbWl0cnkgVG9yb2tob3YgPGRtaXRyeS50b3Jva2hvdkBn
bWFpbC5jb20+DQo+ID4gPiBDYzogIkhvcmlhIEdlYW50xIMiIDxob3JpYS5nZWFudGFAbnhwLmNv
bT4NCj4gPiA+IENjOiBBeW1lbiBTZ2hhaWVyIDxheW1lbi5zZ2hhaWVyQG54cC5jb20+DQo+ID4g
PiBDYzogSGVyYmVydCBYdSA8aGVyYmVydEBnb25kb3IuYXBhbmEub3JnLmF1Pg0KPiA+ID4gQ2M6
ICJEYXZpZCBTLiBNaWxsZXIiIDxkYXZlbUBkYXZlbWxvZnQubmV0Pg0KPiA+ID4gQ2M6IFJvYiBI
ZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+DQo+ID4gPiBDYzogTWFyayBSdXRsYW5kIDxtYXJr
LnJ1dGxhbmRAYXJtLmNvbT4NCj4gPiA+IENjOiBsaW51eC1jcnlwdG9Admdlci5rZXJuZWwub3Jn
DQo+ID4gPiBDYzogZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcNCj4gPiA+IENjOiBsaW51eC1p
bnB1dEB2Z2VyLmtlcm5lbC5vcmcNCj4gPiA+IC0tLQ0KPiA+ID4gIGRyaXZlcnMvaW5wdXQva2V5
Ym9hcmQvc252c19wd3JrZXkuYyB8IDI3DQo+ID4gPiArKysrKysrKysrKysrKysrKysrKysrKysr
KysNCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKQ0KPiA+ID4NCj4gPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lucHV0L2tleWJvYXJkL3NudnNfcHdya2V5LmMNCj4gPiA+
IGIvZHJpdmVycy9pbnB1dC9rZXlib2FyZC9zbnZzX3B3cmtleS5jDQo+ID4gPiBpbmRleCAyZjVl
M2FiNWVkNjMuLmMyOTcxMWQ4NzM1YyAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvaW5wdXQv
a2V5Ym9hcmQvc252c19wd3JrZXkuYw0KPiA+ID4gKysrIGIvZHJpdmVycy9pbnB1dC9rZXlib2Fy
ZC9zbnZzX3B3cmtleS5jDQo+ID4gPiBAQCAtMTYsNiArMTYsNyBAQA0KPiA+ID4gICNpbmNsdWRl
IDxsaW51eC9vZl9hZGRyZXNzLmg+DQo+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2Rl
dmljZS5oPg0KPiA+ID4gICNpbmNsdWRlIDxsaW51eC9wbV93YWtlaXJxLmg+DQo+ID4gPiArI2lu
Y2x1ZGUgPGxpbnV4L2Nsay5oPg0KPiA+ID4gICNpbmNsdWRlIDxsaW51eC9tZmQvc3lzY29uLmg+
DQo+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L3JlZ21hcC5oPg0KPiA+ID4NCj4gPiA+IEBAIC0zOCw2
ICszOSw3IEBAIHN0cnVjdCBwd3JrZXlfZHJ2X2RhdGEgew0KPiA+ID4gIAlpbnQgd2FrZXVwOw0K
PiA+ID4gIAlzdHJ1Y3QgdGltZXJfbGlzdCBjaGVja190aW1lcjsNCj4gPiA+ICAJc3RydWN0IGlu
cHV0X2RldiAqaW5wdXQ7DQo+ID4gPiArCXN0cnVjdCBjbGsgKmNsazsNCj4gPiA+ICAJdTggbWlu
b3JfcmV2Ow0KPiA+ID4gIH07DQo+ID4gPg0KPiA+ID4gQEAgLTcyLDYgKzc0LDkgQEAgc3RhdGlj
IGlycXJldHVybl90IGlteF9zbnZzX3B3cmtleV9pbnRlcnJ1cHQoaW50IGlycSwNCj4gdm9pZCAq
ZGV2X2lkKQ0KPiA+ID4gIAlzdHJ1Y3QgaW5wdXRfZGV2ICppbnB1dCA9IHBkYXRhLT5pbnB1dDsN
Cj4gPiA+ICAJdTMyIGxwX3N0YXR1czsNCj4gPiA+DQo+ID4gPiArCWlmIChwZGF0YS0+Y2xrKQ0K
PiA+ID4gKwkJY2xrX2VuYWJsZShwZGF0YS0+Y2xrKTsNCj4gPiA+ICsNCj4gPiBjbGsgZnJhbWV3
b3JrIGhhbmRsZXMgTlVMTCBwb2ludGVycyBpbnRlcm5hbGx5LCB0aGUgY2hlY2sgaXMgcmVkdW5k
YW50Lg0KPiA+DQo+ID4gPiAgCXBtX3dha2V1cF9ldmVudChpbnB1dC0+ZGV2LnBhcmVudCwgMCk7
DQo+ID4gPg0KPiA+ID4gIAlyZWdtYXBfcmVhZChwZGF0YS0+c252cywgU05WU19MUFNSX1JFRywg
JmxwX3N0YXR1cyk7IEBAIC05Niw2DQo+ID4gPiArMTAxLDkgQEAgc3RhdGljIGlycXJldHVybl90
IGlteF9zbnZzX3B3cmtleV9pbnRlcnJ1cHQoaW50IGlycSwgdm9pZA0KPiAqZGV2X2lkKQ0KPiA+
ID4gIAkvKiBjbGVhciBTUE8gc3RhdHVzICovDQo+ID4gPiAgCXJlZ21hcF93cml0ZShwZGF0YS0+
c252cywgU05WU19MUFNSX1JFRywgU05WU19MUFNSX1NQTyk7DQo+ID4gPg0KPiA+ID4gKwlpZiAo
cGRhdGEtPmNsaykNCj4gPiA+ICsJCWNsa19kaXNhYmxlKHBkYXRhLT5jbGspOw0KPiA+ID4gKw0K
PiA+ID4gIAlyZXR1cm4gSVJRX0hBTkRMRUQ7DQo+ID4gPiAgfQ0KPiA+ID4NCj4gPiA+IEBAIC0x
NDAsNiArMTQ4LDI1IEBAIHN0YXRpYyBpbnQgaW14X3NudnNfcHdya2V5X3Byb2JlKHN0cnVjdA0K
PiBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gPiAgCWlmIChwZGF0YS0+aXJxIDwgMCkNCj4g
PiA+ICAJCXJldHVybiAtRUlOVkFMOw0KPiA+ID4NCj4gPiA+ICsJcGRhdGEtPmNsayA9IGRldm1f
Y2xrX2dldCgmcGRldi0+ZGV2LCAic252cy1wd3JrZXkiKTsNCj4gPiA+ICsJaWYgKElTX0VSUihw
ZGF0YS0+Y2xrKSkgew0KPiA+ID4gKwkJcGRhdGEtPmNsayA9IE5VTEw7DQo+ID4gVXNpbmcgZGV2
bV9jbGtfZ2V0X29wdGlvbmFsKCkgd291bGQgc2ltcGxpZnkgZXJyb3IgaGFuZGxpbmcuDQo+IA0K
PiBJdCBzb3VuZHMgdG8gbWUgdGhhdCB0aGlzIGNsb2NrIGlzIG5vdCBhdCBhbGwgb3B0aW9uYWwg
YW5kIHRoZSBkcml2ZXIgY3VycmVudGx5DQo+ICJ3b3JrcyIgb25seSBieSBhY2NpZGVudCBhbmQg
dGhlcmVmb3JlIG9wdGlvbmFsIGlzIG5vdCBzdWl0YWJsZSBoZXJlLg0KWWVzLCB0aGVuIHdlIG5l
ZWQgdG8gYWRkIGFsbCBzbnZzIGNsayBpbiBkdHMgZm9yIG9uIGxlZ2FjeSBpLk1YIGNoaXBzIGlu
IHRoaXMgcGF0Y2hzZXQNCnRvIGF2b2lkIGFueSBwb3RlbnRpYWwgZnVuY3Rpb24gYnJva2VuLg0K
PiANCj4gPg0KPiA+ID4gKwl9IGVsc2Ugew0KPiA+ID4gKwkJZXJyb3IgPSBjbGtfcHJlcGFyZV9l
bmFibGUocGRhdGEtPmNsayk7DQo+IA0KPiBTbyBpZiB5b3UgZW5hYmxlIGNsb2NrIGhlcmUgYW5k
IGRvIG5vdCBkaXNhYmxlIGl0LCB3aHkgZG8geW91IG5lZWQgdG8gZW5hYmxlIGl0DQo+IGFnYWlu
IGluIGludGVycnVwdD8NCj4gDQo+IFRoYW5rcy4NCj4gDQo+IC0tDQo+IERtaXRyeQ0K
