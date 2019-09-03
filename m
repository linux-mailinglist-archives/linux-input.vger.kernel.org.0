Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2C07A61F5
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2019 08:56:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727459AbfICG4C (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Sep 2019 02:56:02 -0400
Received: from mail-eopbgr140072.outbound.protection.outlook.com ([40.107.14.72]:52256
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725919AbfICG4C (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 3 Sep 2019 02:56:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YMti9hOcPkqPiSNezjFBky7VwS/CExYnScczV8EdJr4Hvge3ITRQ0LPr7nj23FC7On6wC21VQyfVStHJSL5UCi80noDefllSImdQ8T4gvCeBU9ZtkyZ4hhMPpcG2F9D249/uk/0hnjLN+IdpUEmiQ7bwRW4IKK5JNMDIWHDijbeAhoRkQNR1XHDbtNtsZys/18rgwus5QzjJdr5TDLbW1ivDiVGpEvMSkHQGKoboxOpHGouxqjSfPXU/H9Vq0+D+E4xt03sEIeplJZsSgYAUdoasgz19Xd1fWJfht6u/XYvl8vcOxcj6oIvD7v3MWnfbrhGKMOFIfpfKbOqRsqoWJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wPhTBwghFkpFZZ3LAF620WAMuwib6uEHrGVjIPcWcAI=;
 b=KQMmsD0cKZtkAsfZ1UcMu6g82B1n4ZeOXCz4H9w6wpojfwvwun1vPUNWGEer6AxjIw268dh0cxxyngiPPeQmcDIK0ruu/FcWGmHLCk5LpUGYDoBI1ItXEchUjQZE8aXdstPPiTxt0jLtAvsZLsKw7cTpNfdaWSx27tw84OCC+cNHxnMjJwnUgpYjYEEgWgj46aSnqZnTa4X4v3Og7SJhGXWqKqAMuCAUi2zpyFVuOQ0c7H9amiA+JqjoIGbNFfEUy3tX1A5DaxGyBlcGS7oE/FFijcwsEiOJbu+O1/ygW8fN9nZD9niftr6cvCJO1qJ55HfbsCyh8eBzMXL4EDercw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wPhTBwghFkpFZZ3LAF620WAMuwib6uEHrGVjIPcWcAI=;
 b=fGoRfVh7G/ZZUpxaTGlnU4OrCA1J1f1af3O5yHKzws0zB8uXhjDi4mvdxpN4us9Esnde497vwC2+A7K1tlfMauuCBn6c6tLVxEB9GbLuib1Em2WgWxNMOnPe6sihgOKOp21axMy1g/BGoyoJP3doU06+ue66PkQHh17tQuGMmUE=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) by
 DB3PR0402MB3852.eurprd04.prod.outlook.com (52.134.71.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.21; Tue, 3 Sep 2019 06:55:56 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::8958:299c:bc54:2a38]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::8958:299c:bc54:2a38%7]) with mapi id 15.20.2199.021; Tue, 3 Sep 2019
 06:55:56 +0000
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
Thread-Index: AQHVYfv+INaxBRtrokqtKaL9fDhNpqcZfq6AgAAAnFCAAAPHgIAAAKtg
Date:   Tue, 3 Sep 2019 06:55:56 +0000
Message-ID: <DB3PR0402MB39166F389FA13B290F357C80F5B90@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1567519424-32271-1-git-send-email-Anson.Huang@nxp.com>
 <21d2e400-976a-35c3-6875-4cc0c476fdf2@pengutronix.de>
 <DB3PR0402MB391656FC3603B30300ADBF27F5B90@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <7c3b6ae3-9f22-11f8-2464-79d02ac656f3@pengutronix.de>
In-Reply-To: <7c3b6ae3-9f22-11f8-2464-79d02ac656f3@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=anson.huang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 119ac745-6b24-4c0b-7f98-08d7303bc4fd
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DB3PR0402MB3852;
x-ms-traffictypediagnostic: DB3PR0402MB3852:|DB3PR0402MB3852:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0402MB3852463CEB422BC762929A98F5B90@DB3PR0402MB3852.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-forefront-prvs: 01494FA7F7
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(376002)(136003)(39860400002)(396003)(366004)(189003)(199004)(4326008)(66946007)(76116006)(476003)(7696005)(316002)(53546011)(6506007)(102836004)(186003)(446003)(486006)(76176011)(11346002)(71200400001)(53936002)(71190400001)(99286004)(26005)(478600001)(66446008)(66476007)(66556008)(64756008)(14444005)(256004)(25786009)(52536014)(2201001)(5660300002)(14454004)(9686003)(74316002)(2906002)(7416002)(8936002)(6246003)(44832011)(86362001)(55016002)(7736002)(8676002)(6116002)(229853002)(3846002)(305945005)(81166006)(6436002)(81156014)(66066001)(110136005)(2501003)(33656002)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3852;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Kp2l8z+hOUYA9VFsQ638I6c77buenle3DYUZmmpCfTxfcJkQQnHYnhTKgbLFGhn8YpiYFNwn11ZC8WgsCXsG/DZJiZP7PMldQRDwXYl4KZrpe1Z5yNgfT4SuqT1X+WEM1sWP0UMWjojbsovhV6yjWot+fOB2A4K58IivMEeQr/sDWrkVx4WtnfG/II7hHGHdzjwI6Skr8PZSOC/7YmcYodUwc9nVw1tkWZNhUQ/ugsMGBNoGj4HxTKwPsThdAn+A/TuUuuFA/Y06nSxhkgcFyolxPF7hK0NtDx3z4ZyDIfN0+ZbUNZip9EtudszYSglYsPzLj6u3c4WNuDsoD5OZ6GYngsjWL+LyNNPXzSmdEppnO7fEtoSavv9i9r0QbdKNdIiVAXibHhCSVs8rDgXO+0fLabTILAv6pYzpUI0exP8=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 119ac745-6b24-4c0b-7f98-08d7303bc4fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 06:55:56.1336
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kRkivdznoyWw6HhBz0Lz6aFaOGGd05+FC5ndo/MWsudeTLALqjjBgYlmKWVWA3txu7deT0tauC2GUOdJleuyPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3852
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

SGksIE9sZWtzaWoNCg0KPiBPbiAwMy4wOS4xOSAwODozNywgQW5zb24gSHVhbmcgd3JvdGU6DQo+
ID4gSGksIE9sZWtzaWoNCj4gPg0KPiA+PiBPbiAwMy4wOS4xOSAxNjowMywgQW5zb24gSHVhbmcg
d3JvdGU6DQo+ID4+PiBOWFAgaS5NWDhRWFAgaXMgYW4gQVJNdjggU29DIHdpdGggYSBDb3J0ZXgt
TTQgY29yZSBpbnNpZGUgYXMgc3lzdGVtDQo+ID4+PiBjb250cm9sbGVyLCB0aGUgc3lzdGVtIGNv
bnRyb2xsZXIgaXMgaW4gY2hhcmdlIG9mIHN5c3RlbSBwb3dlciwNCj4gPj4+IGNsb2NrIGFuZCBw
b3dlciBrZXkgZXZlbnQgZXRjLiBtYW5hZ2VtZW50LCBMaW51eCBrZXJuZWwgaGFzIHRvDQo+ID4+
PiBjb21tdW5pY2F0ZSB3aXRoIHN5c3RlbSBjb250cm9sbGVyIHZpYSBNVSAobWVzc2FnZSB1bml0
KSBJUEMgdG8gZ2V0DQo+ID4+PiBwb3dlciBrZXkgZXZlbnQsIGFkZCBiaW5kaW5nIGRvYyBmb3Ig
aS5NWCBzeXN0ZW0gY29udHJvbGxlciBwb3dlciBrZXkNCj4gZHJpdmVyLg0KPiA+Pj4NCj4gPj4+
IFNpZ25lZC1vZmYtYnk6IEFuc29uIEh1YW5nIDxBbnNvbi5IdWFuZ0BueHAuY29tPg0KPiA+Pj4g
LS0tDQo+ID4+PiBDaGFuZ2VzIHNpbmNlIFYxOg0KPiA+Pj4gCS0gcmVtb3ZlICJ3YWtldXAtc291
cmNlIiBwcm9wZXJ0eSwgYXMgaXQgaXMgTk9UIG5lZWRlZCBmb3IgU0NVDQo+ID4+IGludGVycnVw
dDsNCj4gPj4+IAktIHJlbW92ZSAic3RhdHVzIiBpbiBleGFtcGxlLg0KPiA+Pj4gLS0tDQo+ID4+
PiAgICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vZnJlZXNjYWxlL2ZzbCxzY3UudHh0ICAg
ICAgICAgIHwgMTQNCj4gPj4gKysrKysrKysrKysrKysNCj4gPj4+ICAgIDEgZmlsZSBjaGFuZ2Vk
LCAxNCBpbnNlcnRpb25zKCspDQo+ID4+Pg0KPiA+Pj4gZGlmZiAtLWdpdA0KPiA+Pj4gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2ZyZWVzY2FsZS9mc2wsc2N1LnR4dA0K
PiA+Pj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2ZyZWVzY2FsZS9m
c2wsc2N1LnR4dA0KPiA+Pj4gaW5kZXggYzE0OWZhZC4uZjkzZTJlNCAxMDA2NDQNCj4gPj4+IC0t
LSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vZnJlZXNjYWxlL2ZzbCxz
Y3UudHh0DQo+ID4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJt
L2ZyZWVzY2FsZS9mc2wsc2N1LnR4dA0KPiA+Pj4gQEAgLTE1Nyw2ICsxNTcsMTUgQEAgUmVxdWly
ZWQgcHJvcGVydGllczoNCj4gPj4+ICAgIE9wdGlvbmFsIHByb3BlcnRpZXM6DQo+ID4+PiAgICAt
IHRpbWVvdXQtc2VjOiBjb250YWlucyB0aGUgd2F0Y2hkb2cgdGltZW91dCBpbiBzZWNvbmRzLg0K
PiA+Pj4NCj4gPj4+ICtQb3dlciBrZXkgYmluZGluZ3MgYmFzZWQgb24gU0NVIE1lc3NhZ2UgUHJv
dG9jb2wNCj4gPj4+ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0NCj4gPj4+ICsNCj4gPj4+ICtSZXF1aXJlZCBwcm9wZXJ0aWVzOg0K
PiA+Pj4gKy0gY29tcGF0aWJsZTogc2hvdWxkIGJlOg0KPiA+Pj4gKyAgICAgICAgICAgICAgImZz
bCxpbXg4cXhwLXNjLXB3cmtleSINCj4gPj4+ICsgICAgICAgICAgICAgIGZvbGxvd2VkIGJ5ICJm
c2wsaW14LXNjLXB3cmtleSI7DQo+ID4+PiArLSBsaW51eCxrZXljb2RlczogU2VlDQo+ID4+PiAr
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lucHV0L2tleXMudHh0DQo+ID4+DQo+
ID4+IGxpbnV4LGtleWNvZGVzIGlzIHJlcXVpcmVkIHBhcmFtZXRlci4gU28sIHRoaXMga2F5IGNh
YiBiZSBhbnl0aGluZy4NCj4gPj4gV2h5IHRoZSBjb21wYXRpYmxlIGlzIGNhbGxlZCBwd3JrZXk/
IFByb2JhYmx5IGl0IGlzIGJldHRlciB0byBjYWxsIGl0ICIqLXNjLQ0KPiBrZXkiDQo+ID4NCj4g
PiBUaGlzIGtleSBpcyBraW5kIG9mIHNwZWNpYWwsIGl0IGlzIE9OL09GRiBidXR0b24gd2hpY2gg
aXMgZGVzaWduZWQgZm9yDQo+ID4gcG93ZXIga2V5IHB1cnBvc2UsIGl0IGhhcyBIVyBmdW5jdGlv
biBzdWNoIGFzIGxvbmcgcHJlc3NpbmcgaXQgd291bGQNCj4gPiBzaHV0ZG93biB0aGUgc3lzdGVt
IHBvd2VyLCBzbyB3ZSBhbHdheXMgdXNlIGl0IGFzIHBvd2VyIGtleSwgTk9UDQo+IGdlbmVyYWwg
a2V5LCBkb2VzIGl0IG1ha2Ugc2Vuc2U/DQo+IA0KPiBJIGFzc3VtZSwgT0YgZGV2cyB3aWxsIGFy
Z3VlOiBEVCBpcyBkZXNjcmliaW5nIGhhcmR3YXJlIG5vdCBzb2Z0d2FyZS4NCj4gT24gb3RoZXIg
aGFuZCwgc29mdHdhcmUgd2lsbCBnZXQgbm90aWZpY2F0aW9uIGFib3V0IGFzc2VydGlvbi9kZWFz
c2VydGlvbiBvZg0KPiB0aGlzIGtleS4gU28sIGl0IGlzIGp1c3Qgbm9ybWFsIGtleS4gSWYsIGZv
ciBzb21lIHJlYXNvbiwgaXQgd2lsbCB0cmlnZ2VyIHdvcmxkDQo+IGRlc3RydWN0aW9uLCBpZiBp
dCBpcyBwcmVzc2VkIHRvbyBsb25nLi4uIHByb2JhYmx5IG5vIGJvZHkgY2FyZXMuDQo+IFlvdSBj
YW4gcHJvdmlkZSBmc2wsaW14LXNjLWtleSBhcyBhZGRpdGlvbmFsIGNvbXBhdGlibGUuIEluIGNh
c2UgbGludXggd2lsbA0KPiBuZWVkIHNvbWUgcXVpcmtzLCB3ZSBzdGlsbCBjYW4gZmFsbCBiYWNr
IHRvIG1vcmUgcHJlY2lzZSBjb21wYXRpYmxlDQo+ICJmc2wsaW14OHF4cC1zYy1wd3JrZXkiLg0K
DQpJIGFtIE9LIHdpdGggdGhhdCwgc28gSSB3aWxsIHVzZSAiZnNsLGlteC1zYy1rZXkiIGFzIGFk
ZGl0aW9uYWwgY29tcGF0aWJsZSBhbmQgYWxzbw0KcHJlc2VudCBpbiBkcml2ZXIuIA0KDQpBbnNv
bi4NCg==
