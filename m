Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30A48BAC9A
	for <lists+linux-input@lfdr.de>; Mon, 23 Sep 2019 04:32:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403812AbfIWCcD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 22 Sep 2019 22:32:03 -0400
Received: from mail-eopbgr50083.outbound.protection.outlook.com ([40.107.5.83]:25093
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2392101AbfIWCcC (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 22 Sep 2019 22:32:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MiqhAYwQq/jLlgzpbB6pSqzRvy7AHC5qyqWdJmZbfHRl/BurnGZGVlF1sMRZB1oHduvhyLP+C6crwzirx1asiTF+fhEuObN2IniIFSy3RqwRNt1jGHd3/RwAlwkwTSwcKDvJL6nKG93pAL7V6aE24qqYlV4ZEsqpcXRIYwvBugVZ7LoNRj2dyhmSjeaDs/FLoWaWV2X5JknzKIYxLuxjyDN4564x+8VSn7QdtuYYX3Iy5z4FfaibRMCVw6ehV1MSdpjUsnQzkLWN0FA060sPURYsWjaFG07bVtdFfxJicCGMPwyiRTQfhrOoowQTVkrxhkRC25TXA2euDDJ//alMBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jXexYZgyb30xg8+wG1kTxvsSjldWPZdcp50aSclEpA8=;
 b=cQZxIXnzJk3Zqq3IyurCcSYfJGJW8JkkcRoD5AqukzrXdI5Q6/JWkgkln7gqAsULPfXiN03Mnxbkki69fKmOMLnc/oXZ0cu9klPw0H6CIkbIBlo3j0bjHgs0hud15tB5TXU4zty2rBQefiXJ4NThDRpE0/tI4SThi2wbGPVE7pkHE2hH2PuwawN7OzU9pwZeCicNHmn4DldxZyjGQoBceGeNnBmlKd3sTAB9WCTsxksRxaPJYyshhBrU5H5ZVJFir+SkIOpcPMR/sV6Px/Mo5Ik2BknaZ2FpFipsEYqYGB4i60/GvpD+8xlhSS3M6VEeznCNiZWJ0zP6FYy+9PtsXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jXexYZgyb30xg8+wG1kTxvsSjldWPZdcp50aSclEpA8=;
 b=phZD9OxZFT3BGCsinf/olI6Yb5cUZs5BjB0DxXiZvoXsagSw6sTUhmCsXtztVs3U1UC5hnNyHTqhS9Yb48EAH14o9gflj7YM4I4rDdLzVHVFBRe7oetLybxw0IP1gFfiHKrkxLWXqpNIJePA4Dxj/BtIy+eNT23SrSz0ONxhoBk=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) by
 DB3PR0402MB3643.eurprd04.prod.outlook.com (52.134.66.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.23; Mon, 23 Sep 2019 02:31:56 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::8958:299c:bc54:2a38]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::8958:299c:bc54:2a38%7]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 02:31:56 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Pavel Machek <pavel@ucw.cz>
CC:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
        "will@kernel.org" <will@kernel.org>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
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
Subject: RE: [PATCH V2 1/5] dt-bindings: fsl: scu: add scu power key binding
Thread-Topic: [PATCH V2 1/5] dt-bindings: fsl: scu: add scu power key binding
Thread-Index: AQHVYfv+INaxBRtrokqtKaL9fDhNpqc3/XWAgACrFbA=
Date:   Mon, 23 Sep 2019 02:31:56 +0000
Message-ID: <DB3PR0402MB391673C02411B57F815DE609F5850@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1567519424-32271-1-git-send-email-Anson.Huang@nxp.com>
 <20190922161347.GB1999@bug>
In-Reply-To: <20190922161347.GB1999@bug>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=anson.huang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cdd1d5bd-78d2-41c0-2c75-08d73fce3410
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DB3PR0402MB3643;
x-ms-traffictypediagnostic: DB3PR0402MB3643:|DB3PR0402MB3643:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0402MB36438622B7CD3A32E6B68D4AF5850@DB3PR0402MB3643.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0169092318
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(366004)(39860400002)(396003)(376002)(346002)(199004)(189003)(6506007)(71200400001)(71190400001)(476003)(2906002)(7416002)(81166006)(8676002)(8936002)(3846002)(486006)(81156014)(66066001)(54906003)(55016002)(229853002)(33656002)(6436002)(7736002)(6116002)(305945005)(44832011)(74316002)(6916009)(86362001)(478600001)(25786009)(14454004)(9686003)(316002)(26005)(186003)(66946007)(6246003)(256004)(102836004)(7696005)(76176011)(99286004)(52536014)(11346002)(64756008)(66446008)(4326008)(66556008)(66476007)(5660300002)(76116006)(446003);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3643;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: KM/QkZvK6NilBbL8WnsRefPHUP9T7AernS6G9vG8f55IDDzZhFwb35/Ap5wHPjiAy+eUt5prAu+H+fHAtGjWmrM7J7YQh1m2nXcVdvdyvv8lV9tTMSiZDcNxale2pjYa53DkKhjHImKx2cHPzO6l+74yfBbrvqmiQhiwGx8GrSHH+Bl7DPtQFWeerH6yV7IXnnmVRmAnogSNXaAGA48nvdv9HwaE5d59xTOTkmOdkVBvUcjhwbGy+aaK5fvnLNBaKNAO74c3cxTYl63HhXFcLn16KfX5aNlA6OHypOiwYCxyskkOSfYBHnFOBzRFQiHaxMw6pk05qbwJPwgc8wzpoOCFJh5i+R7fND1VFzucbMF5+BZha65vqIAYj9ZDRaG5zgL7G7jT1DiFZJTfkdPrKdWCRtGgmJL/ngjvIKyEiLM=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdd1d5bd-78d2-41c0-2c75-08d73fce3410
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 02:31:56.4233
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nyOnnErDz0NRiXgpBuaaBJH15IkhcVUcJPbDl3PzNRPRsMSqiyPjksWhIqE9X2BOyRkzGZfbncDqMhhoGxYPlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3643
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

SGksIFBhdmVsDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCBWMiAxLzVdIGR0LWJpbmRpbmdzOiBm
c2w6IHNjdTogYWRkIHNjdSBwb3dlciBrZXkgYmluZGluZw0KPiANCj4gSGkhDQo+IA0KPiA+IE5Y
UCBpLk1YOFFYUCBpcyBhbiBBUk12OCBTb0Mgd2l0aCBhIENvcnRleC1NNCBjb3JlIGluc2lkZSBh
cyBzeXN0ZW0NCj4gPiBjb250cm9sbGVyLCB0aGUgc3lzdGVtIGNvbnRyb2xsZXIgaXMgaW4gY2hh
cmdlIG9mIHN5c3RlbSBwb3dlciwgY2xvY2sNCj4gPiBhbmQgcG93ZXIga2V5IGV2ZW50IGV0Yy4g
bWFuYWdlbWVudCwgTGludXgga2VybmVsIGhhcyB0byBjb21tdW5pY2F0ZQ0KPiA+IHdpdGggc3lz
dGVtIGNvbnRyb2xsZXIgdmlhIE1VIChtZXNzYWdlIHVuaXQpIElQQyB0byBnZXQgcG93ZXIga2V5
DQo+ID4gZXZlbnQsIGFkZCBiaW5kaW5nIGRvYyBmb3IgaS5NWCBzeXN0ZW0gY29udHJvbGxlciBw
b3dlciBrZXkgZHJpdmVyLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQW5zb24gSHVhbmcgPEFu
c29uLkh1YW5nQG54cC5jb20+DQo+IA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9hcm0vZnJlZXNjYWxlL2ZzbCxzY3UudHh0DQo+ID4gQEAgLTE1Nyw2ICsxNTcs
MTUgQEAgUmVxdWlyZWQgcHJvcGVydGllczoNCj4gPiAgT3B0aW9uYWwgcHJvcGVydGllczoNCj4g
PiAgLSB0aW1lb3V0LXNlYzogY29udGFpbnMgdGhlIHdhdGNoZG9nIHRpbWVvdXQgaW4gc2Vjb25k
cy4NCj4gPg0KPiA+ICtQb3dlciBrZXkgYmluZGluZ3MgYmFzZWQgb24gU0NVIE1lc3NhZ2UgUHJv
dG9jb2wNCj4gPiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tDQo+ID4gKw0KPiA+ICtSZXF1aXJlZCBwcm9wZXJ0aWVzOg0KPiA+ICst
IGNvbXBhdGlibGU6IHNob3VsZCBiZToNCj4gPiArICAgICAgICAgICAgICAiZnNsLGlteDhxeHAt
c2MtcHdya2V5Ig0KPiA+ICsgICAgICAgICAgICAgIGZvbGxvd2VkIGJ5ICJmc2wsaW14LXNjLXB3
cmtleSI7DQo+ID4gKy0gbGludXgsa2V5Y29kZXM6IFNlZQ0KPiA+ICtEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvaW5wdXQva2V5cy50eHQNCj4gDQo+IEFjdHVhbGx5IHRoZXJlJ3Mg
bm8gcmVhc29uIGZvciBoYXZpbmcgImxpbnV4LGtleWNvZGVzIiBwcm9wZXJ0eSB3aGVuIGl0IGlz
DQo+IGFsd2F5cyBhIHBvd2VyIGJ1dHRvbi4NClRoZSBsYXRlc3QgdmVyc2lvbiBvZiBwYXRjaCBh
bHJlYWR5IGNoYW5nZSB0aGUgY29tcGF0aWJsZSBuYW1lIHRvICotc2Mta2V5IHdoaWNoDQppcyBt
b3JlIGdlbmVyYWwgYXMga2V5IGRyaXZlciwgc28gdGhlICJsaW51eCxrZXljb2RlcyIgaXMgbmVl
ZGVkIG5vdyBmb3IgZHJpdmVyDQp0byBkZWZpbmUgdGhlIGtleSBmdW5jdGlvbi4NCg0KVGhhbmtz
LA0KQW5zb24gDQo=
