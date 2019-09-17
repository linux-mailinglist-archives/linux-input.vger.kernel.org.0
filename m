Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4274EB45E9
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 05:14:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388615AbfIQDOl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Sep 2019 23:14:41 -0400
Received: from mail-eopbgr10053.outbound.protection.outlook.com ([40.107.1.53]:8611
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732239AbfIQDOl (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Sep 2019 23:14:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aa03HIN+Qi/w6y0ohJiDtjukBcwgjx19m7ICICuKHg0O8aNyk4ncUBVZ4eGc8+TlZTPX5toFEg3e9AJyu/9Zl38hpN2iDEkkR5Qh2jjVgStSylfyjMInPH7aARTgkBacQxXz6DfgbuHc36Je2UvGiP05lupUWtB2HgYnqWDuGUMJ7VTalSsPr3fDRd/ze8UiWtDQcm0jc2WH54aa0tmwr1qH6PYsKpien9klbEuBBYaRZRTb/HJPsGWKgveWHTCsq4vIDhc9tA9f1wKhAFPIVrnjDsCZHtX8tHLVWjwISKUtsVMjyHs5mDYMzUvyGfbcO+i3rLjBJqpQJr3cXejVIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g7+nWfHbgNCQ5Yt+1FqvzaAHKbtGTxIR1AmDscz07Xc=;
 b=JAZrTp1kXMPIs1yCT+avO6S6Y3SbOJblK+HYRwqCuct8ybP8r9PDGXhAz+PL4lGe0BHYRC2kNf1NQas24TeHh5NRTqHZs3B7O/ErMQOB8eEdm2gMRqIF6JlXbg6lTlznw4CoXamblWmLk2oaYzS1++tXfCXYQZhAnYMdpIEqMrBFkztsbE1cv4jBC7k0vjb5z3+x5sGafucdj1ReyBOvy4oiPXytouaJ18xufjnI2mqJQDzGzwfCSmJCaW4GCE5/Hp3PHXsraeBLK5uOvpZuap4qt5ORzJBPuP9Pt4JAwqav1nHJGr6A0umlv2f9mHPbHhyB4tBjg5J+HnzwcCfdPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g7+nWfHbgNCQ5Yt+1FqvzaAHKbtGTxIR1AmDscz07Xc=;
 b=QJbT9cmV05HyRksw8X8BNDIDeIaW3IwWHwR6GFPTBw7dAWP4HL5Ev+/xox5lOAsWyirzFQlwAMWqXNeBz+CbSfC+8t9T2n7DQEjhCepHxi45+yt1+EhGCgvrUe+vVDieb869HHkYNR1m21j4z36wXd/GlM5CAQ3f+5wpRGfmjdQ=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) by
 DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.23; Tue, 17 Sep 2019 03:14:35 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::8958:299c:bc54:2a38]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::8958:299c:bc54:2a38%7]) with mapi id 15.20.2263.023; Tue, 17 Sep 2019
 03:14:35 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
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
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
CC:     dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH V5 1/5] dt-bindings: fsl: scu: add scu key binding
Thread-Topic: [PATCH V5 1/5] dt-bindings: fsl: scu: add scu key binding
Thread-Index: AQHVbQOgbAy+nmBgzE6GK6ufj5vsxacvMaaQ
Date:   Tue, 17 Sep 2019 03:14:35 +0000
Message-ID: <DB3PR0402MB3916304253A29BA216433DA3F58F0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1568688939-13649-1-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1568688939-13649-1-git-send-email-Anson.Huang@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=anson.huang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 31dea72c-12b5-4446-cebf-08d73b1d2af4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:DB3PR0402MB3916;
x-ms-traffictypediagnostic: DB3PR0402MB3916:|DB3PR0402MB3916:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0402MB3916CE93948E13E60F29FB93F58F0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01630974C0
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(396003)(366004)(136003)(376002)(346002)(189003)(199004)(2906002)(76176011)(71200400001)(446003)(66066001)(74316002)(6246003)(66556008)(7416002)(66476007)(6436002)(66946007)(229853002)(486006)(64756008)(76116006)(55016002)(110136005)(99286004)(8676002)(81166006)(81156014)(44832011)(9686003)(186003)(7696005)(8936002)(11346002)(71190400001)(2201001)(52536014)(2501003)(6506007)(102836004)(25786009)(7736002)(66446008)(305945005)(26005)(476003)(478600001)(14454004)(33656002)(3846002)(6116002)(5660300002)(316002)(256004)(86362001)(4326008)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3916;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YPrFl314JXRsdwQAABjwPFgBPW4nM5VPczZ1PAXqo0JNmLYLe6FeJyXm/qsOaS3nDgYCwYcJYrV6na241uMeNxxvcrPWkBTve1HQe3DQbgAWDQR7Nwk1rybfRtmtGQy8Ug7gCP0Fakzy2ZVm+gW4SFRUM7lFscD53hCG+E9gZDftiU0rkHZHAXgwCgBzrDwa0eMzx2MJB1iqGm9fxSRC84HIcR+fMe4rsjkJl7fch1Mm3WZ2N1ejPQTkSJlF7YB5heMLdaqwGU0kZh8T9xgONuAZ+ucEn4O7DrKhJt4YJpjoNz8D1cTBioZBE2GVkaFB94qd7EV6uBERBHCEagkrUOoPyrx671eSPgTl871NsF8TJLBqC3WapHDcCTDEUYAqpnCSpLWckPKdSuxOiaPlEa+K0Fsizf51yXb3mbiP6MY=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31dea72c-12b5-4446-cebf-08d73b1d2af4
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2019 03:14:35.5712
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vg3AFwdvbyFKe+v/0TadttyvfkJe+AvN4oXxxGJWxKd24SvzIb7+YsdCY9LHdF0wFBpArMnYeJM/48+mkdAKJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3916
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

U29ycnksIHBsZWFzZSBpZ25vcmUgdGhpcyB2ZXJzaW9uLCBpdCBoYXMgYnVpbGQgaXNzdWUsIGp1
c3QgcmVzZW50IHRoZSBwYXRjaCBzZXJpZXMuDQoNCkFuc29uLg0KDQo+IFN1YmplY3Q6IFtQQVRD
SCBWNSAxLzVdIGR0LWJpbmRpbmdzOiBmc2w6IHNjdTogYWRkIHNjdSBrZXkgYmluZGluZw0KPiAN
Cj4gTlhQIGkuTVg4UVhQIGlzIGFuIEFSTXY4IFNvQyB3aXRoIGEgQ29ydGV4LU00IGNvcmUgaW5z
aWRlIGFzIHN5c3RlbQ0KPiBjb250cm9sbGVyLCB0aGUgc3lzdGVtIGNvbnRyb2xsZXIgaXMgaW4g
Y2hhcmdlIG9mIHN5c3RlbSBwb3dlciwgY2xvY2sgYW5kIHNjdQ0KPiBrZXkgZXZlbnQgZXRjLiBt
YW5hZ2VtZW50LCBMaW51eCBrZXJuZWwgaGFzIHRvIGNvbW11bmljYXRlIHdpdGggc3lzdGVtDQo+
IGNvbnRyb2xsZXIgdmlhIE1VIChtZXNzYWdlIHVuaXQpIElQQyB0byBnZXQgc2N1IGtleSBldmVu
dCwgYWRkIGJpbmRpbmcgZG9jIGZvcg0KPiBpLk1YIHN5c3RlbSBjb250cm9sbGVyIGtleSBkcml2
ZXIuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbnNvbiBIdWFuZyA8QW5zb24uSHVhbmdAbnhwLmNv
bT4NCj4gLS0tDQo+IE5vIGNoYW5nZXMuDQo+IC0tLQ0KPiAgLi4uL2RldmljZXRyZWUvYmluZGlu
Z3MvYXJtL2ZyZWVzY2FsZS9mc2wsc2N1LnR4dCAgICAgICAgICB8IDE0ICsrKysrKysrKysrKysr
DQo+ICAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vZnJlZXNjYWxlL2ZzbCxzY3Uu
dHh0DQo+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9mcmVlc2NhbGUv
ZnNsLHNjdS50eHQNCj4gaW5kZXggYzE0OWZhZC4uNWVhYjdkMCAxMDA2NDQNCj4gLS0tIGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9mcmVlc2NhbGUvZnNsLHNjdS50eHQN
Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9mcmVlc2NhbGUv
ZnNsLHNjdS50eHQNCj4gQEAgLTE1Nyw2ICsxNTcsMTUgQEAgUmVxdWlyZWQgcHJvcGVydGllczoN
Cj4gIE9wdGlvbmFsIHByb3BlcnRpZXM6DQo+ICAtIHRpbWVvdXQtc2VjOiBjb250YWlucyB0aGUg
d2F0Y2hkb2cgdGltZW91dCBpbiBzZWNvbmRzLg0KPiANCj4gK1NDVSBrZXkgYmluZGluZ3MgYmFz
ZWQgb24gU0NVIE1lc3NhZ2UgUHJvdG9jb2wNCj4gKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiArDQo+ICtSZXF1aXJlZCBwcm9w
ZXJ0aWVzOg0KPiArLSBjb21wYXRpYmxlOiBzaG91bGQgYmU6DQo+ICsgICAgICAgICAgICAgICJm
c2wsaW14OHF4cC1zYy1rZXkiDQo+ICsgICAgICAgICAgICAgIGZvbGxvd2VkIGJ5ICJmc2wsaW14
LXNjLWtleSI7DQo+ICstIGxpbnV4LGtleWNvZGVzOiBTZWUgRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2lucHV0L2tleXMudHh0DQo+ICsNCj4gIEV4YW1wbGUgKGlteDhxeHApOg0K
PiAgLS0tLS0tLS0tLS0tLQ0KPiAgYWxpYXNlcyB7DQo+IEBAIC0yMjAsNiArMjI5LDExIEBAIGZp
cm13YXJlIHsNCj4gIAkJCWNvbXBhdGlibGUgPSAiZnNsLGlteDhxeHAtc2MtcnRjIjsNCj4gIAkJ
fTsNCj4gDQo+ICsJCXNjdV9rZXk6IHNjdS1rZXkgew0KPiArCQkJY29tcGF0aWJsZSA9ICJmc2ws
aW14OHF4cC1zYy1rZXkiLCAiZnNsLGlteC1zYy1rZXkiOw0KPiArCQkJbGludXgsa2V5Y29kZSA9
IDxLRVlfUE9XRVI+Ow0KPiArCQl9Ow0KPiArDQo+ICAJCXdhdGNoZG9nIHsNCj4gIAkJCWNvbXBh
dGlibGUgPSAiZnNsLGlteDhxeHAtc2Mtd2R0IiwgImZzbCxpbXgtc2Mtd2R0IjsNCj4gIAkJCXRp
bWVvdXQtc2VjID0gPDYwPjsNCj4gLS0NCj4gMi43LjQNCg0K
