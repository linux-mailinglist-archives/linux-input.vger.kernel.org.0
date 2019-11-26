Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0B84109752
	for <lists+linux-input@lfdr.de>; Tue, 26 Nov 2019 01:40:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbfKZAk6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 Nov 2019 19:40:58 -0500
Received: from mail-eopbgr30042.outbound.protection.outlook.com ([40.107.3.42]:3471
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725945AbfKZAk6 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Nov 2019 19:40:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rw9CoWdS+QEQEIrZ8AiHHBvJbkeQECfqX4sWA47XbsbN9CINrXsGrxgJJrTVqepS7rm4PfsB22VY85B6HF2QqmMB3wSfCJrKCuYeai+x0AioWmxyam7+BlQBDqrZQ5UFbByORaK2VuFOoMjiz35b3O6neqapRQzRYPBL7PAjfy0kRGWXjtZFELgFTZlqfm2HKIs88qTdDx7kIxu4pMmKF/EqIjbd4wo/zZqpkYX2cowmITyR/3wePy++Zz2pxPuyOMOFy2shZ4lnVysCCW9aUyj6FSfJBoJwgZBvUV948WOOKMXndsjkzrj70l9h/yLMXrFrs2qpSq+YiJ0f/zgeIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EiBAVsljDA/SfFk8epcfxgpHODH38kUCE5rRytx6Boo=;
 b=V3A1nkgoAc500WXG7WCGld8QSL95vOkGMYtDKD00JtY6C4Ihg/T62ls4Bhd5n2vWLbAzI4YPdSgC+SCt3R+gUMWG2OClsMXLeALNRxHyZ9XWmLqo74zc3XCEE5F5/had3oSTlmVGdftPxy6a1YBMlq2udd9wMUfI7+D6Eq4motzx6Vw0M/n+tAkHdpuMEsGrEiwuwIgkgKhLx+Ir68QpLSNI6JTOggmlZtVMX46vXnOgrI9zJfZc15Sf2H3gyOOFaHLAh4acIHvLHr0XNtEE1zCnTJsIC23RLO5EZC+AlXq0nfsBeH2omnwEl/Qi7Mg3rcsb/jHB8XOdp/3UHlyvPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EiBAVsljDA/SfFk8epcfxgpHODH38kUCE5rRytx6Boo=;
 b=VORC0sevimx6GDzrAB72azaIWsYOq5Ws9AsEFD/TfTKssJG3uatTY8Wilmq+UZNgaoW50OnKBQSLPk3SVVkIAVqHndiexPqA1yoDUyIDskSysMzVwLHlOQxa3rMlrWakvQqRKY69ulLjrWtoZTahguje1OQxrAgiODHQpgNKyVw=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) by
 DB3PR0402MB3657.eurprd04.prod.outlook.com (52.134.69.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17; Tue, 26 Nov 2019 00:40:54 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::b8dd:75d4:49ea:6360]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::b8dd:75d4:49ea:6360%5]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 00:40:54 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
CC:     Robin van der Gracht <robin@protonic.nl>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] Input: snvs_pwrkey - remove gratuitous NULL initializers
Thread-Topic: [PATCH] Input: snvs_pwrkey - remove gratuitous NULL initializers
Thread-Index: AQHVo9VJFM6r3EYivU+il0UEVRuJJqecnG8w
Date:   Tue, 26 Nov 2019 00:40:54 +0000
Message-ID: <DB3PR0402MB3916D29B5D0D6D3E849138E4F5450@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <20191125211407.GA97812@dtor-ws>
In-Reply-To: <20191125211407.GA97812@dtor-ws>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=anson.huang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 32ed2fa6-40ae-44d8-bc9b-08d772094b98
x-ms-traffictypediagnostic: DB3PR0402MB3657:
x-microsoft-antispam-prvs: <DB3PR0402MB3657B317990DB3E386DD53ABF5450@DB3PR0402MB3657.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:341;
x-forefront-prvs: 0233768B38
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(346002)(376002)(136003)(39860400002)(396003)(189003)(199004)(33656002)(14444005)(256004)(99286004)(446003)(11346002)(186003)(229853002)(26005)(74316002)(7736002)(305945005)(2501003)(6436002)(66066001)(44832011)(9686003)(25786009)(6116002)(3846002)(14454004)(71200400001)(71190400001)(478600001)(76176011)(102836004)(6506007)(55016002)(7696005)(66446008)(4326008)(64756008)(66476007)(66556008)(76116006)(66946007)(2906002)(6246003)(5660300002)(4744005)(316002)(81166006)(81156014)(54906003)(110136005)(8936002)(8676002)(52536014)(86362001);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3657;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jtCX14pHJajTSvtc9/EE/+Eg8cBS4wJ55O7AN46p7TfLQVQ9eO4FugR4G19gwJEuZpRshNgN0xnFbbEdPxFj4teJCvW0pxGKHaf1/nUgwvsnqmTtk9cxdpJZfyVIRpg7X5nX8Dkdw27CXDubMCFXQF+Glb2U+8f1s2uoxV5fDERKR8+AYx3QkMt4Me+wCs88mTiiRlSmxITxVu7Kp1OliB1hNIw9jd/A8pmB6Zuww1/TRksWc3atKoBMRz5G4iE2Ft8mQcXyFoEgC+4/m5yfciBwpXAlyawOKLhuDISWUYhwWw68MXYeWmkUfRmtn6GrrJ3VPpV1BuTvPFdtbL7MpuVo6ulGKk0ZEVkKjAeUJyBVeVGMtZgh6I4sRR8oH+a9IxED1+ZB2/0zz5xdCBGhHNNbQFegy80rvd0O41ua/uV/IEH3kpEv5G/GJvH0J3fh
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32ed2fa6-40ae-44d8-bc9b-08d772094b98
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2019 00:40:54.3748
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NLIx8lS0nIplK9l4+zYt7vqGEwkuM9rvY3PplGurK4i92x8GdKLbvCZ6F7uQm4Zv9zFmkGnJac69zOMedUtkYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3657
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

DQoNCj4gU3ViamVjdDogW1BBVENIXSBJbnB1dDogc252c19wd3JrZXkgLSByZW1vdmUgZ3JhdHVp
dG91cyBOVUxMIGluaXRpYWxpemVycw0KPiANCj4gR3JhdHVpdG91cyBOVUxMIGluaXRpYWxpemVy
cyByYXJlbHkgaGVscCBhbmQgb2Z0ZW4gcHJldmVudCBjb21waWxlciBmcm9tDQo+IHdhcm5pbmcg
YWJvdXQgdXNpbmcgdW5pbml0aWFsaXplZCB2YXJpYWJsZS4gTGV0J3MgcmVtb3ZlIHRoZW0uDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBEbWl0cnkgVG9yb2tob3YgPGRtaXRyeS50b3Jva2hvdkBnbWFp
bC5jb20+DQoNClJldmlld2VkLWJ5OiBBbnNvbiBIdWFuZyA8QW5zb24uSHVhbmdAbnhwLmNvbT4N
Cg0KPiAtLS0NCj4gIGRyaXZlcnMvaW5wdXQva2V5Ym9hcmQvc252c19wd3JrZXkuYyB8IDQgKyst
LQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4g
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lucHV0L2tleWJvYXJkL3NudnNfcHdya2V5LmMNCj4g
Yi9kcml2ZXJzL2lucHV0L2tleWJvYXJkL3NudnNfcHdya2V5LmMNCj4gaW5kZXggZmQ2ZjI0NGY0
MDNkLi4yZjVlM2FiNWVkNjMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvaW5wdXQva2V5Ym9hcmQv
c252c19wd3JrZXkuYw0KPiArKysgYi9kcml2ZXJzL2lucHV0L2tleWJvYXJkL3NudnNfcHdya2V5
LmMNCj4gQEAgLTEwOCw4ICsxMDgsOCBAQCBzdGF0aWMgdm9pZCBpbXhfc252c19wd3JrZXlfYWN0
KHZvaWQgKnBkYXRhKQ0KPiANCj4gIHN0YXRpYyBpbnQgaW14X3NudnNfcHdya2V5X3Byb2JlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpICB7DQo+IC0Jc3RydWN0IHB3cmtleV9kcnZfZGF0
YSAqcGRhdGEgPSBOVUxMOw0KPiAtCXN0cnVjdCBpbnB1dF9kZXYgKmlucHV0ID0gTlVMTDsNCj4g
KwlzdHJ1Y3QgcHdya2V5X2Rydl9kYXRhICpwZGF0YTsNCj4gKwlzdHJ1Y3QgaW5wdXRfZGV2ICpp
bnB1dDsNCj4gIAlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wOw0KPiAgCWludCBlcnJvcjsNCj4gIAl1
MzIgdmlkOw0KPiAtLQ0KPiAyLjI0LjAuNDMyLmc5ZDNmNWY1YjYzLWdvb2cNCj4gDQo+IA0KPiAt
LQ0KPiBEbWl0cnkNCg==
