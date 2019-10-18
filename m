Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 415A1DBB56
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2019 03:40:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407065AbfJRBkP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Oct 2019 21:40:15 -0400
Received: from mail-eopbgr150087.outbound.protection.outlook.com ([40.107.15.87]:33090
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388373AbfJRBkP (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Oct 2019 21:40:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eyj2WtKX7gVWxLSQ2Kj8nWq+QNLTvBv+xGpuAJMZ/vYQTkvSTOeVbnyg3qQOqaADhDGVu7cxgTRCEl1yPL9HeJMEuT3w/XgIGDp6n8wsXnPzh7znEYyY1suS3sLzdX29+Sg+qTIkpFSbKQilYqq28BTFlJhuTsMjUhfmgqIwJBTk4zqM2boHwN2QQufTvmy/P/5GqkqzsxMhOC0NrWs/2jeZfDf/bvqW4CgrqTF7/Y8F7hjjXnfKrWWnXookVXoEW4t4i5wvalNHwsWGe2RwisM8j3HOu+0p1GXBhULGXnnj/JAAYHoR8R7IqBFP9svL1wQhb3ReYDqy7W+WHl4Kjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VvpBT7uci3ETWyMsDwGLIzuRRHPudaOH7VYydqD3xx8=;
 b=R3PY02+7ioSori648+tQmfqEM/NAgSwkBsRume6mXvliUH0Dlv8lV5qykzFakmDzsYDe201/KyZ7p/ciVHrRColSnO++jEvfuRqheF9isHQj93+cAG6VtHfWb46QnjPgV3y2LDX71m2+vRj2tm7zxxLt3nrPGTii8OcUa9dWyHZxqbWOH9qRY7mdc5nH3BbxGoZlH5/JnxOLith8kLzX2Yf0EYT+T19Bjw76snSze1lv9c45VMqc1Rc9V5KQhEFGH2qL/LBvYc/73ewetc7kyJzyyV3QrOSrE2lndw2SvpIPOU+5t8vShbKPPsjMgVPqg7t7xoq/l2XXpHiCqD3gwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VvpBT7uci3ETWyMsDwGLIzuRRHPudaOH7VYydqD3xx8=;
 b=SUDrhBrYk84PqV8x8xrk8sQgBfdxXwNm8UgeMYvU2if2vJvxlrHGPWrNC01aMyVb6sR9kqJczgj2Ifd5WZPIsg0YVpyfrH3/732r5HGLBQE0c9wkN96atHGTdY/LdmMoP6kG1LUnqymCVIsT4QvlEZFbb0wEWRpH7jttjZZAhHw=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) by
 DB3PR0402MB3801.eurprd04.prod.outlook.com (52.134.65.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Fri, 18 Oct 2019 01:40:10 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::d469:ad51:2bec:19f0]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::d469:ad51:2bec:19f0%6]) with mapi id 15.20.2347.023; Fri, 18 Oct 2019
 01:40:10 +0000
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
        Peng Fan <peng.fan@nxp.com>, Andy Duan <fugang.duan@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        "olof@lixom.net" <olof@lixom.net>,
        "mripard@kernel.org" <mripard@kernel.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>,
        "dinguyen@kernel.org" <dinguyen@kernel.org>,
        "marcin.juszkiewicz@linaro.org" <marcin.juszkiewicz@linaro.org>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "stefan@agner.ch" <stefan@agner.ch>,
        "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>,
        "yuehaibing@huawei.com" <yuehaibing@huawei.com>,
        Jacky Bai <ping.bai@nxp.com>,
        "m.felsch@pengutronix.de" <m.felsch@pengutronix.de>,
        "ronald@innovation.ch" <ronald@innovation.ch>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
CC:     dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH V6 3/5] arm64: dts: imx8qxp: Add scu key node
Thread-Topic: [PATCH V6 3/5] arm64: dts: imx8qxp: Add scu key node
Thread-Index: AQHVfLDFmP5Z6hMXG0yS4sRUAZxu6qdfsAEg
Date:   Fri, 18 Oct 2019 01:40:10 +0000
Message-ID: <DB3PR0402MB3916BA030CDAD9057017F52FF56C0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1570412509-7893-1-git-send-email-Anson.Huang@nxp.com>
 <1570412509-7893-3-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1570412509-7893-3-git-send-email-Anson.Huang@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=anson.huang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0c152cb0-64dd-47c0-9497-08d7536c1d2d
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DB3PR0402MB3801:|DB3PR0402MB3801:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0402MB380154C6ECFD9FF42F5A6C98F56C0@DB3PR0402MB3801.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 01949FE337
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(136003)(346002)(366004)(39860400002)(376002)(189003)(199004)(478600001)(229853002)(74316002)(76176011)(5660300002)(4326008)(25786009)(7736002)(44832011)(3846002)(6506007)(81166006)(66476007)(186003)(26005)(8676002)(2906002)(6116002)(71190400001)(71200400001)(81156014)(99286004)(52536014)(8936002)(7696005)(6246003)(76116006)(66946007)(102836004)(86362001)(476003)(316002)(14454004)(55016002)(446003)(9686003)(110136005)(14444005)(256004)(66066001)(486006)(11346002)(33656002)(66556008)(64756008)(66446008)(2501003)(7416002)(6436002)(2201001)(305945005)(921003)(32563001)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3801;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ccx0BBsRl7yx/z1yHG1aw4hnQQeXQ6cnO410wvum0iWDytzYLwjPk1O2nyodbQa3LW9bEVuH0xW+qYaH5OJ22VdGGKoCJB/2PocNKyGCLd2TZwBNHOk5mMztYfGtvYCaxThi+pZkgd5AMhMp1N3UAEhs/NhTk0yNZaVxu/iPiWy3hOSYsBIFIR2wWJvus8K+ApQewcj0fLdRJl1KXmjZqTlFghxSsC3rfX0M4fghGIL11KSizR/uJq8ekXiTm0GXMrvNz0pWY21t6BseYR2y2lYZZ2qrMzLugIIQ4ahYTVrU393Q7LTmMDmeOP61sTr+v0jLsTtkGM1Y25dYImBJ2DMMluNL7LW9DbH6Eh44tkDO6nl3bMm/xWngxoG2A4jsgcFl9igSNOMe7ST+lzmfw+puMmRBnq+dAslbM9Ml9QU=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c152cb0-64dd-47c0-9497-08d7536c1d2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2019 01:40:10.4126
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UzusZtMACZR1BxD+xPqABGHiuw/gCFWjaU8xL8ArCma33hVdqxz2Hmv4Q0rfPlgf+PFEWbFblOUSaWntGo9s4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3801
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

SGksIFNoYXduDQoJRG1pdHJ5IGhhcyBwaWNrZWQgdXAgdGhlICMxIGFuZCAjMiBwYXRjaCwgd291
bGQgeW91IHBsZWFzZSBwaWNrIHVwICMzIH4gIzUsIHRoYW5rcy4NCg0KQW5zb24NCg0KPiBTdWJq
ZWN0OiBbUEFUQ0ggVjYgMy81XSBhcm02NDogZHRzOiBpbXg4cXhwOiBBZGQgc2N1IGtleSBub2Rl
DQo+IA0KPiBBZGQgc2N1IGtleSBub2RlIGZvciBpLk1YOFFYUCwgZGlzYWJsZWQgYnkgZGVmYXVs
dCBhcyBpdCBkZXBlbmRzIG9uIGJvYXJkDQo+IGRlc2lnbi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IEFuc29uIEh1YW5nIDxBbnNvbi5IdWFuZ0BueHAuY29tPg0KPiAtLS0NCj4gQ2hhbmdlcyBzaW5j
ZSBWNToNCj4gCS0gdXNlICJsaW51eCxrZXljb2RlcyIgaW5zdGVhZCBvZiAibGludXgsa2V5Y29k
ZSIuDQo+IC0tLQ0KPiAgYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OHF4cC5kdHNp
IHwgNyArKysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OHF4cC5kdHNpDQo+
IGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OHF4cC5kdHNpDQo+IGluZGV4IDEx
MzNiNDEuLjJkNjlmMWEgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNj
YWxlL2lteDhxeHAuZHRzaQ0KPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9p
bXg4cXhwLmR0c2kNCj4gQEAgLTgsNiArOCw3IEBADQo+ICAjaW5jbHVkZSA8ZHQtYmluZGluZ3Mv
Y2xvY2svaW14OC1jbG9jay5oPiAgI2luY2x1ZGUgPGR0LQ0KPiBiaW5kaW5ncy9maXJtd2FyZS9p
bXgvcnNyYy5oPiAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2dwaW8vZ3Bpby5oPg0KPiArI2luY2x1
ZGUgPGR0LWJpbmRpbmdzL2lucHV0L2lucHV0Lmg+DQo+ICAjaW5jbHVkZSA8ZHQtYmluZGluZ3Mv
aW50ZXJydXB0LWNvbnRyb2xsZXIvYXJtLWdpYy5oPg0KPiAgI2luY2x1ZGUgPGR0LWJpbmRpbmdz
L3BpbmN0cmwvcGFkcy1pbXg4cXhwLmg+DQo+IA0KPiBAQCAtMTc0LDYgKzE3NSwxMiBAQA0KPiAg
CQkJI3Bvd2VyLWRvbWFpbi1jZWxscyA9IDwxPjsNCj4gIAkJfTsNCj4gDQo+ICsJCXNjdV9rZXk6
IHNjdS1rZXkgew0KPiArCQkJY29tcGF0aWJsZSA9ICJmc2wsaW14OHF4cC1zYy1rZXkiLCAiZnNs
LGlteC1zYy1rZXkiOw0KPiArCQkJbGludXgsa2V5Y29kZXMgPSA8S0VZX1BPV0VSPjsNCj4gKwkJ
CXN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+ICsJCX07DQo+ICsNCj4gIAkJcnRjOiBydGMgew0KPiAg
CQkJY29tcGF0aWJsZSA9ICJmc2wsaW14OHF4cC1zYy1ydGMiOw0KPiAgCQl9Ow0KPiAtLQ0KPiAy
LjcuNA0KDQo=
