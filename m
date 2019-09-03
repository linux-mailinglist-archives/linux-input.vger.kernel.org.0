Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE742A6194
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2019 08:37:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726408AbfICGhF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Sep 2019 02:37:05 -0400
Received: from mail-eopbgr00081.outbound.protection.outlook.com ([40.107.0.81]:29548
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725878AbfICGhF (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 3 Sep 2019 02:37:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RtudYmO8v+UPJxMaoAELM7/wwlgcdCh/ioIE2PAYCb9xbpwV/kllD1R0Xl3IG8d9rpyfvv7NnBjiSKhz7QrC7So66yxPyGD2QIC5XiZHDNhX21F8ZQWNCC12SM6JR14MIwj8KQfFM2ssdCdnekEQUCBHwBrjFVc0JoDxV5NyIUqUIG/6A8utfHqi2py0SiOVUR/W4Jk3un/9Us/8jpmbgd2i0/qaspQGWqZT7dD8ynEl4HnznJDg2CXmy7G1YatdzeWumij4PlZ8X/qAEe1/q0qi2ydxpbEBU42QdPlIEWakWfFXoiNduCqOFIRT6IlkvA0XzXrPB028yiDwFxIljA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NZhGOE9OrA4rJkPnM+TFObsmfrNy0UdJMrs+mrHKYBU=;
 b=m46A4SMtK4fYdMlpEM7M0ydKC3yqpoS2TbKOYjF5djGyXIwYMcIrwArCfCqySq4EJR2aN3rNxiZlC4Nv/UcjW4Nw10GPw6GSXnbJWlC1IUcu3sJjithSiTRZffz5sE3o4pnwjQFMmcEyHAfTgSPuM0iyULMQxY2Rnbdh5vzOyaDkU7vrrh3co2c4XhffqZuvDoxzV0owKnBgALCJ7yLU8wAt9PQdcWZBh1kZhBIJsxlJqvE2zbGpkU69TZ8nURlm2CD/bEN+6GzKkRg0x0WAOvhEuXrlHMYoSVLYwqCh5cQLDg1JNqcliBcsULQr605WM6WaW7PReFJZvXUIbq7Suw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NZhGOE9OrA4rJkPnM+TFObsmfrNy0UdJMrs+mrHKYBU=;
 b=H33/MIEgDY41Y1Jk/tE2cwKqlmq6kLKDefuBuJso4+bUTw0sNSi9qk7GmAnA9EpuXHTg9MM4WOBEJYF51rayomhnqU7moeicwgLXXA7MW7s+L7soLo7iNINDkMJrbpHegfwEQOj4LK7Ck4rbHaVlyvlTtz8weuLxHtb5KLtgsUs=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) by
 DB3PR0402MB3914.eurprd04.prod.outlook.com (52.134.71.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Tue, 3 Sep 2019 06:37:00 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::8958:299c:bc54:2a38]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::8958:299c:bc54:2a38%7]) with mapi id 15.20.2199.021; Tue, 3 Sep 2019
 06:37:00 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Oleksij Rempel <o.rempel@pengutronix.de>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
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
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
CC:     dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH V2 1/5] dt-bindings: fsl: scu: add scu power key binding
Thread-Topic: [PATCH V2 1/5] dt-bindings: fsl: scu: add scu power key binding
Thread-Index: AQHVYfv+INaxBRtrokqtKaL9fDhNpqcZfq6AgAAAnFA=
Date:   Tue, 3 Sep 2019 06:37:00 +0000
Message-ID: <DB3PR0402MB391656FC3603B30300ADBF27F5B90@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1567519424-32271-1-git-send-email-Anson.Huang@nxp.com>
 <21d2e400-976a-35c3-6875-4cc0c476fdf2@pengutronix.de>
In-Reply-To: <21d2e400-976a-35c3-6875-4cc0c476fdf2@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=anson.huang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c3ca1df6-ca44-429e-a77a-08d730391fed
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DB3PR0402MB3914;
x-ms-traffictypediagnostic: DB3PR0402MB3914:|DB3PR0402MB3914:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0402MB39140FB68264E1BE4ECAC4F9F5B90@DB3PR0402MB3914.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 01494FA7F7
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(346002)(366004)(396003)(136003)(39860400002)(189003)(199004)(478600001)(14454004)(256004)(5660300002)(86362001)(8676002)(33656002)(316002)(446003)(71190400001)(102836004)(186003)(52536014)(2201001)(7416002)(6506007)(26005)(66066001)(2501003)(53546011)(71200400001)(476003)(44832011)(486006)(11346002)(25786009)(55016002)(9686003)(74316002)(99286004)(229853002)(7696005)(76176011)(6116002)(3846002)(76116006)(7736002)(305945005)(66946007)(66556008)(81166006)(110136005)(81156014)(66476007)(66446008)(64756008)(8936002)(6436002)(53936002)(4326008)(6246003)(2906002)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3914;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: CZ/dRw4Ot/ZiZP0iRPwX40nfstkCoVd/j/HgATYQsyMZ/9uFTbl06ILwsiBbxQZO8jQtQ1/wQCqt2cbAAuwezHwq8jaR0td5EMcwdN8QMFawA1xtGLVNCbsRMoiBF8VEyx/04WfHt1ehl9qbbvHOkqqpNJM50vvVu7//2mH7PvJmQNSNUCPHe3BZWtWq0FB9N5ltP8OsZnulqvOE643q6OjWe9iIDyC4P2blJbbYGr/zr8twYMgTpyAuOPif0+Y3kYfk59E0EWMOFbH9X8TkJwR9Z4lWDOttgQmSW7zmO+2yNfPrJyM08Bq7Y9k3AF1T5IOAi2d2LtddYkl3lJR0S2vqxEwUnPlq59I/4IOEQRZCwgcylTf32FLpUZEw0dSRLugckcgNXc5KoPLBn8mZGf0amB5Dh+v6+GhGDr6EJMM=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3ca1df6-ca44-429e-a77a-08d730391fed
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 06:37:00.2542
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9SNMIp/kyqaD5b7kPCpFrXug03bODGhFklvFuIEtR7NwPWW/4RX80ZrW6HnIGrCwocBiJF2JyQu5+hHOeVQbsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3914
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

SGksIE9sZWtzaWoNCg0KPiBPbiAwMy4wOS4xOSAxNjowMywgQW5zb24gSHVhbmcgd3JvdGU6DQo+
ID4gTlhQIGkuTVg4UVhQIGlzIGFuIEFSTXY4IFNvQyB3aXRoIGEgQ29ydGV4LU00IGNvcmUgaW5z
aWRlIGFzIHN5c3RlbQ0KPiA+IGNvbnRyb2xsZXIsIHRoZSBzeXN0ZW0gY29udHJvbGxlciBpcyBp
biBjaGFyZ2Ugb2Ygc3lzdGVtIHBvd2VyLCBjbG9jaw0KPiA+IGFuZCBwb3dlciBrZXkgZXZlbnQg
ZXRjLiBtYW5hZ2VtZW50LCBMaW51eCBrZXJuZWwgaGFzIHRvIGNvbW11bmljYXRlDQo+ID4gd2l0
aCBzeXN0ZW0gY29udHJvbGxlciB2aWEgTVUgKG1lc3NhZ2UgdW5pdCkgSVBDIHRvIGdldCBwb3dl
ciBrZXkNCj4gPiBldmVudCwgYWRkIGJpbmRpbmcgZG9jIGZvciBpLk1YIHN5c3RlbSBjb250cm9s
bGVyIHBvd2VyIGtleSBkcml2ZXIuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbnNvbiBIdWFu
ZyA8QW5zb24uSHVhbmdAbnhwLmNvbT4NCj4gPiAtLS0NCj4gPiBDaGFuZ2VzIHNpbmNlIFYxOg0K
PiA+IAktIHJlbW92ZSAid2FrZXVwLXNvdXJjZSIgcHJvcGVydHksIGFzIGl0IGlzIE5PVCBuZWVk
ZWQgZm9yIFNDVQ0KPiBpbnRlcnJ1cHQ7DQo+ID4gCS0gcmVtb3ZlICJzdGF0dXMiIGluIGV4YW1w
bGUuDQo+ID4gLS0tDQo+ID4gICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vZnJlZXNjYWxl
L2ZzbCxzY3UudHh0ICAgICAgICAgIHwgMTQNCj4gKysrKysrKysrKysrKysNCj4gPiAgIDEgZmls
ZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0DQo+ID4gYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2ZyZWVzY2FsZS9mc2wsc2N1LnR4
dA0KPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9mcmVlc2NhbGUv
ZnNsLHNjdS50eHQNCj4gPiBpbmRleCBjMTQ5ZmFkLi5mOTNlMmU0IDEwMDY0NA0KPiA+IC0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vZnJlZXNjYWxlL2ZzbCxzY3Uu
dHh0DQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9mcmVl
c2NhbGUvZnNsLHNjdS50eHQNCj4gPiBAQCAtMTU3LDYgKzE1NywxNSBAQCBSZXF1aXJlZCBwcm9w
ZXJ0aWVzOg0KPiA+ICAgT3B0aW9uYWwgcHJvcGVydGllczoNCj4gPiAgIC0gdGltZW91dC1zZWM6
IGNvbnRhaW5zIHRoZSB3YXRjaGRvZyB0aW1lb3V0IGluIHNlY29uZHMuDQo+ID4NCj4gPiArUG93
ZXIga2V5IGJpbmRpbmdzIGJhc2VkIG9uIFNDVSBNZXNzYWdlIFByb3RvY29sDQo+ID4gKy0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0K
PiA+ICsNCj4gPiArUmVxdWlyZWQgcHJvcGVydGllczoNCj4gPiArLSBjb21wYXRpYmxlOiBzaG91
bGQgYmU6DQo+ID4gKyAgICAgICAgICAgICAgImZzbCxpbXg4cXhwLXNjLXB3cmtleSINCj4gPiAr
ICAgICAgICAgICAgICBmb2xsb3dlZCBieSAiZnNsLGlteC1zYy1wd3JrZXkiOw0KPiA+ICstIGxp
bnV4LGtleWNvZGVzOiBTZWUNCj4gPiArRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2lucHV0L2tleXMudHh0DQo+IA0KPiBsaW51eCxrZXljb2RlcyBpcyByZXF1aXJlZCBwYXJhbWV0
ZXIuIFNvLCB0aGlzIGtheSBjYWIgYmUgYW55dGhpbmcuIFdoeSB0aGUNCj4gY29tcGF0aWJsZSBp
cyBjYWxsZWQgcHdya2V5PyBQcm9iYWJseSBpdCBpcyBiZXR0ZXIgdG8gY2FsbCBpdCAiKi1zYy1r
ZXkiDQoNClRoaXMga2V5IGlzIGtpbmQgb2Ygc3BlY2lhbCwgaXQgaXMgT04vT0ZGIGJ1dHRvbiB3
aGljaCBpcyBkZXNpZ25lZCBmb3IgcG93ZXIga2V5DQpwdXJwb3NlLCBpdCBoYXMgSFcgZnVuY3Rp
b24gc3VjaCBhcyBsb25nIHByZXNzaW5nIGl0IHdvdWxkIHNodXRkb3duIHRoZSBzeXN0ZW0gcG93
ZXIsDQpzbyB3ZSBhbHdheXMgdXNlIGl0IGFzIHBvd2VyIGtleSwgTk9UIGdlbmVyYWwga2V5LCBk
b2VzIGl0IG1ha2Ugc2Vuc2U/DQoNClRoYW5rcywNCkFuc29uLg0K
