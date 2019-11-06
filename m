Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48CD8F1195
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2019 09:58:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731482AbfKFI6b (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 Nov 2019 03:58:31 -0500
Received: from mail-eopbgr130100.outbound.protection.outlook.com ([40.107.13.100]:45377
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726903AbfKFI6b (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 6 Nov 2019 03:58:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T6ZvDjEjw9w1qf7QtBppmv3j0MwW727436goJUs2+qPZvlPnQN2xi5joRd2sUEZRUT0mBtDbnq7MwotOF5tmU0SvxEp9kSQMNNjaDnJDNUe2Vc1psTul/PI8AYqYvoN7e6WhvoOhQN6oWWlI9z7DishFUNtC+yUEIRrW3WdAS7LFsOtlzNFIuXEXZvoLDINB+rxRu8zqGvPVPgWGjHOM1r/8pe9sMLWFlKo9y6jF1Rl1AwccEqvxhbmJrREAcVtaVfb3egw/hDiFcFYu6uOUj4quqY8j+Z09vmrWzJGtkhcA9huzbuDzivZR2rXZIQCWpvsbndd2pT7YO5wxfVN2iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Too3ny17LSAqPtNW38ym6QAB7oLVKAUqAlvOEcwZDgE=;
 b=TwYQ0GR8YXAM+bfGam0Uixb2Pt4tiRnlbFSLOJGARKVpg6a1dCROtE+lizJ5fRQxDrFwy9SWmVqkDT0Yc+UlxJ8U+SFovduf6J24c4d5A6HipGV41W3dHglZMn7NuTZ5dF0Me+hsLrgWGKhPSQM1PImEpYLRMaIiRNnToY8rUu2z8FW337fKIXhes0PzsfOpgv9lR1GIbzmJPlaIarg3ioQvs+cBaH9CuUm8dBRmCOmbVsUuMchP00oDf/FBhW7MuUfLB3iwCNE11+aiXPQnr4zr3fYdBHjC5yVVEWVPepoRUft1+7QMMIQwYBGoHNfdsKBKI/cdn2wJ+zeZDNUXrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toradex.com; dmarc=pass action=none header.from=toradex.com;
 dkim=pass header.d=toradex.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Too3ny17LSAqPtNW38ym6QAB7oLVKAUqAlvOEcwZDgE=;
 b=YLOS1Ti9qqwHUpBR7BMWlABEijJOciEa2UjGO5SfoJ1blkO3XaebHrlBc2xksG5e5MCWUTGkBWWw20x9qeNOkoyEcnEFxJrnP/EuVvz9xuke6g3jXbLscyXiZBOpb0yNhWsWsqPVl+j0uZgu9qtrCPtTgLGdzJNH3HdAGX9yejc=
Received: from VI1PR05MB6415.eurprd05.prod.outlook.com (20.179.27.139) by
 VI1PR05MB5726.eurprd05.prod.outlook.com (20.178.121.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Wed, 6 Nov 2019 08:58:25 +0000
Received: from VI1PR05MB6415.eurprd05.prod.outlook.com
 ([fe80::284c:b89e:d17e:794e]) by VI1PR05MB6415.eurprd05.prod.outlook.com
 ([fe80::284c:b89e:d17e:794e%7]) with mapi id 15.20.2430.020; Wed, 6 Nov 2019
 08:58:25 +0000
From:   Marcel Ziswiler <marcel.ziswiler@toradex.com>
To:     "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "robh@kernel.org" <robh@kernel.org>
CC:     Philippe Schenker <philippe.schenker@toradex.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-imx@nxp.com" <linux-imx@nxp.com>
Subject: Re: [PATCH v2 3/5] dt-bindings: input: tochscreen: ad7879: generic
 node names in example
Thread-Topic: [PATCH v2 3/5] dt-bindings: input: tochscreen: ad7879: generic
 node names in example
Thread-Index: AQHVi9xiBbTK4Mn9XEC/Bt3TYQb1MqdzPkqAgACY4ICAChHOAA==
Date:   Wed, 6 Nov 2019 08:58:25 +0000
Message-ID: <c200444ba450d7884cd26e12163b68db6db63725.camel@toradex.com>
References: <20191026090403.3057-1-marcel@ziswiler.com>
         <20191026090403.3057-3-marcel@ziswiler.com> <20191030140455.GA4544@bogus>
         <20191030231205.GI57214@dtor-ws>
In-Reply-To: <20191030231205.GI57214@dtor-ws>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=marcel.ziswiler@toradex.com; 
x-originating-ip: [31.10.206.124]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ba6d87a6-bae4-4e47-c848-08d762977bfe
x-ms-traffictypediagnostic: VI1PR05MB5726:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR05MB57266BBFB9FA77D46022EF84FB790@VI1PR05MB5726.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 02135EB356
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(346002)(396003)(376002)(136003)(366004)(39850400004)(199004)(189003)(305945005)(66476007)(6436002)(66946007)(64756008)(66446008)(76116006)(91956017)(76176011)(256004)(71190400001)(71200400001)(446003)(14444005)(66556008)(6486002)(6246003)(229853002)(6512007)(4326008)(5660300002)(6116002)(3846002)(8936002)(110136005)(54906003)(36756003)(4001150100001)(99286004)(118296001)(81156014)(8676002)(81166006)(4744005)(7736002)(2906002)(2501003)(316002)(486006)(6506007)(66066001)(102836004)(86362001)(2616005)(11346002)(44832011)(476003)(478600001)(186003)(14454004)(25786009)(26005)(41533002);DIR:OUT;SFP:1102;SCL:1;SRVR:VI1PR05MB5726;H:VI1PR05MB6415.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z6Qp4CxdtTi/vbLr1xXBAST9yPtlLtHkwyaKNyzbztgqIWU8kXGoVNob0UYlRL9+wCAnVSzTW0Pw8i2n+sEMgmRK0vIV2WU1xptvjrnWkCn0+zFkZvJ1SJUju5SjDIQT+R5vhUTjxn4NHgFPEr4yb6Pa+HeCPFWRdUlqZbkjXf/ljseu1HBo1G9DeeW/GhnV/PnDm+d8rnFl1mhJCEZCU9T60o9cU01r4HYnV8T9djvL94mQjJJyc2jazKvC01WlBvx5m468XW7SnkNm5tc5K9IgfZUulvE8tE/0s0oJyX3TNTQQpwlUHDP5ZDLICDj+SxUQiDc65Z/+QeJfBcRYmiLww/yaibKEUBJaCqhK7GwlhNYYm1n5cO/RHtEdAYAW0wJkKa26eySXRsbdLGwdErh4peFKUKqkd89WSBObm/DQi6pYBLpithj9fH1Zhv10
Content-Type: text/plain; charset="utf-8"
Content-ID: <AC973709B0891240854066BF948668E0@eurprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba6d87a6-bae4-4e47-c848-08d762977bfe
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2019 08:58:25.3544
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TxzUAEeYSPRa13PsNQ0K08Njap6d6louXUi7ZZ3S6KPw8uWChbBqhvZcFOUWtdmx+n3UxLE/6O+CQcs3VAK+TOQL2dEs0DMZ1lOWKLOeoeg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5726
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

T24gV2VkLCAyMDE5LTEwLTMwIGF0IDE2OjEyIC0wNzAwLCBEbWl0cnkgVG9yb2tob3Ygd3JvdGU6
DQo+IE9uIFdlZCwgT2N0IDMwLCAyMDE5IGF0IDA5OjA0OjU1QU0gLTA1MDAsIFJvYiBIZXJyaW5n
IHdyb3RlOg0KPiA+IE9uIFNhdCwgT2N0IDI2LCAyMDE5IGF0IDExOjA0OjAxQU0gKzAyMDAsIE1h
cmNlbCBaaXN3aWxlciB3cm90ZToNCj4gPiA+IEZyb206IE1hcmNlbCBaaXN3aWxlciA8bWFyY2Vs
Lnppc3dpbGVyQHRvcmFkZXguY29tPg0KPiA+IA0KPiA+IFRoZXJlJ3MgYSB0eXBvIGluIHRoZSBz
dWJqZWN0Lg0KPiANCj4gSSBmaXhlZCBpdCB1cCBmaWxlIGFwcGx5aW5nLCB0aGFuayB5b3UgZm9y
IG5vdGljaW5nLg0KDQpXaGVyZSBleGFjdGx5IGRpZCB5b3UgYXBwbHkgdGhpcz8gQXMgSSBzdGls
bCBjYW4ndCBmaW5kIGl0IGFwcGxpZWQNCmFueXdoZXJlLiBUaGFua3MhDQoNCj4gPiA+IFVwZGF0
ZSBleGFtcGxlIGluIGFkNzg3OSBkZXZpY2V0cmVlIGRvY3VtZW50YXRpb24gdG8gdXNlIGdlbmVy
aWMNCj4gPiA+IHRvdWNoDQo+ID4gPiBjb250cm9sbGVyIG5vZGUgbmFtZXMuDQo+ID4gPiANCj4g
PiA+IFNpZ25lZC1vZmYtYnk6IE1hcmNlbCBaaXN3aWxlciA8bWFyY2VsLnppc3dpbGVyQHRvcmFk
ZXguY29tPg0KPiA+ID4gDQo+ID4gPiAtLS0NCj4gPiA+IA0KPiA+ID4gQ2hhbmdlcyBpbiB2Mjog
TmV3IHBhdGNoLg0KPiA+ID4gDQo+ID4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvaW5wdXQv
dG91Y2hzY3JlZW4vYWQ3ODc5LnR4dCAgICAgICAgICB8DQo+ID4gPiA0ICsrLS0NCj4gPiA+ICAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0K
