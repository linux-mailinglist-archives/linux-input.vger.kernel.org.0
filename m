Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA77EA5F1F
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2019 04:06:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726785AbfICCFl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Sep 2019 22:05:41 -0400
Received: from mail-eopbgr20082.outbound.protection.outlook.com ([40.107.2.82]:61923
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726053AbfICCFk (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 2 Sep 2019 22:05:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nQDn4BjVsYArf33qIB/jVt0uKYnbhNVZVGMDVTBPUA3Pjn6nLX/H2qVSUxrY2fsLgLizLRaiE7b0TprNXiobRtG1oLG2CzFIf+2LsSRxWIeAY8kq45ax673pLBeCwjVxqDC99JlNAxLgXtg9sqSCaKl9qIF/dLyFPs96XBdDo84ZbEVEUHwjHCzP6ofhAed/zyPi4cWWOfh+4P4rDgEWKcuF9M/jvwZKKlxA5s6hst81+NbzG5FVuyZbkMkEAL9HJHJeecX+gAje68SxjkP9f/kp4ON0ZOcVAeYcjpU2nLgrcsgXkVBQUM0pfSxI2xwN9WC+jx1+X4E3xLAei7m9cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FiyIedPARBcs6sNS0DslsfXPaNnfErxU9/VGxwmSQhI=;
 b=lC5kaHP61NK9v6f9LAVLQeYXhotFFjvCDC+frgHadQR/dEgqDkXVJEOWEEa+1o5Kg1shatD9qTheQAhL+2kA0WEfPbbwEHYutM9lVXbwvfjXqSnLHM8b65TnL2F4RQ+lddyBAWRZ2hrCVEae9z7GfcupK271zS3pqoqnxWY37kKnNB1CG92JHbdjjw2lsaWzDXjN9R+2xxpyQW1G43HJKf25W+zf/mv4PCLvY778bv/b6hjnp932wgNr8ARs/EX+sAYFmZR4PLX/ksPG9tCH7sGS6OgFClurfuZemKt5O4dQHPNX02sDpIRRMk7yCQcNDoK3RI+PRbLfCPzekzcOSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FiyIedPARBcs6sNS0DslsfXPaNnfErxU9/VGxwmSQhI=;
 b=mefGqYV0n8cgYpVz17DpZ2reI9iLnyQoeSaZJWyOXW/mEv4YJ6WwDal+I3redNoQ1fct5kLJj76GSGB4tfATAIV1tipCsfWcC2RMIHb92DOvdXI0nnWqPRORcbg+r2tsWAux2fvNN8dMLS2vcMxXo4jP1FL+2BOWoW2vABAQHoQ=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) by
 DB3PR0402MB3819.eurprd04.prod.outlook.com (52.134.71.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.19; Tue, 3 Sep 2019 02:05:33 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::8958:299c:bc54:2a38]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::8958:299c:bc54:2a38%7]) with mapi id 15.20.2199.021; Tue, 3 Sep 2019
 02:05:33 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Rob Herring <robh@kernel.org>
CC:     "mark.rutland@arm.com" <mark.rutland@arm.com>,
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
        "olof@lixom.net" <olof@lixom.net>,
        "mripard@kernel.org" <mripard@kernel.org>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "dinguyen@kernel.org" <dinguyen@kernel.org>,
        "marcin.juszkiewicz@linaro.org" <marcin.juszkiewicz@linaro.org>,
        "hsweeten@visionengravers.com" <hsweeten@visionengravers.com>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "stefan@agner.ch" <stefan@agner.ch>,
        "ronald@innovation.ch" <ronald@innovation.ch>,
        Jacky Bai <ping.bai@nxp.com>,
        "m.felsch@pengutronix.de" <m.felsch@pengutronix.de>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH 1/5] dt-bindings: fsl: scu: add scu power key binding
Thread-Topic: [PATCH 1/5] dt-bindings: fsl: scu: add scu power key binding
Thread-Index: AQHVXxCk6/I09s7BV0y76ajf6ryt2qcYaXwAgADQJXA=
Date:   Tue, 3 Sep 2019 02:05:33 +0000
Message-ID: <DB3PR0402MB3916135233AA2DDD5DA177B8F5B90@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1567198429-27886-1-git-send-email-Anson.Huang@nxp.com>
 <20190902043521.GA14143@bogus>
In-Reply-To: <20190902043521.GA14143@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=anson.huang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 31d47967-da42-43e3-2413-08d730133479
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DB3PR0402MB3819;
x-ms-traffictypediagnostic: DB3PR0402MB3819:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0402MB3819337D43B7EA56B243AB1BF5B90@DB3PR0402MB3819.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01494FA7F7
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(396003)(39860400002)(376002)(366004)(346002)(199004)(189003)(66476007)(66946007)(74316002)(66556008)(64756008)(66446008)(14444005)(316002)(76116006)(33656002)(229853002)(66066001)(71200400001)(8936002)(256004)(54906003)(81166006)(8676002)(25786009)(71190400001)(6506007)(44832011)(86362001)(7416002)(6116002)(305945005)(7736002)(102836004)(3846002)(476003)(446003)(11346002)(14454004)(5660300002)(486006)(9686003)(186003)(76176011)(99286004)(55016002)(7696005)(26005)(2906002)(478600001)(53936002)(6436002)(52536014)(6246003)(81156014)(6916009)(4326008);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3819;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RITtNNqlFogUllF4UfZHyf3EtEqzomiHfQ3NGwkj/MvnkjtVP4MEmJrqPW4CWIERLCquEJIYynnJtjPgVELrgU1G5gpdXL3TakboP7ri1HDV4VR6YzM3LBkorwHVsewxLBdNybHK7nXdaqYxAMGRGGCyYsl/3qiGRzMXKp++3tYETU0oGPkP4ZJi9kiicn+t/DbShp2ILWyIK8PX55NAEXqm9sFZmHL5r07W3Pp/4ZPNJ/iLthpkmZGntV2zu3vseJkXdh9zwzesoNF4zwTURf/jl8D12aoBXxPOLF9vswQ1d8cYINsVsvGvXPN4jWiW3rZ+/0k0aZxp4JHIfQf57BJAS1n2v6dzuXaM+uIYXHngcqNC+/r6KQCzS6lDxZBRpmI8DpTR0iUNrJ7DCrqi8J1kTLg0y1+qW3IBY/uAe/M=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31d47967-da42-43e3-2413-08d730133479
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 02:05:33.7351
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gCwugCLTAplz48+t0co9B7cU/R0qL5hS9JnIlXWY6gFI+qGSNTQ31VJP67lK0LvLIRr0vaMfvT6Zst2f+yeZRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3819
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

SGksIFJvYg0KDQo+IE9uIEZyaSwgQXVnIDMwLCAyMDE5IGF0IDA0OjUzOjQ1UE0gLTA0MDAsIEFu
c29uIEh1YW5nIHdyb3RlOg0KPiA+IE5YUCBpLk1YOFFYUCBpcyBhbiBBUk12OCBTb0Mgd2l0aCBh
IENvcnRleC1NNCBjb3JlIGluc2lkZSBhcyBzeXN0ZW0NCj4gPiBjb250cm9sbGVyLCB0aGUgc3lz
dGVtIGNvbnRyb2xsZXIgaXMgaW4gY2hhcmdlIG9mIHN5c3RlbSBwb3dlciwgY2xvY2sNCj4gPiBh
bmQgcG93ZXIga2V5IGV2ZW50IGV0Yy4gbWFuYWdlbWVudCwgTGludXgga2VybmVsIGhhcyB0byBj
b21tdW5pY2F0ZQ0KPiA+IHdpdGggc3lzdGVtIGNvbnRyb2xsZXIgdmlhIE1VIChtZXNzYWdlIHVu
aXQpIElQQyB0byBnZXQgcG93ZXIga2V5DQo+ID4gZXZlbnQsIGFkZCBiaW5kaW5nIGRvYyBmb3Ig
aS5NWCBzeXN0ZW0gY29udHJvbGxlciBwb3dlciBrZXkgZHJpdmVyLg0KPiA+DQo+ID4gU2lnbmVk
LW9mZi1ieTogQW5zb24gSHVhbmcgPEFuc29uLkh1YW5nQG54cC5jb20+DQo+ID4gLS0tDQo+ID4g
IC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9mcmVlc2NhbGUvZnNsLHNjdS50eHQgICAgICB8
IDE4DQo+ICsrKysrKysrKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0
aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdA0KPiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2FybS9mcmVlc2NhbGUvZnNsLHNjdS50eHQNCj4gPiBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vZnJlZXNjYWxlL2ZzbCxzY3UudHh0DQo+ID4gaW5k
ZXggYzE0OWZhZC4uMDAxZDBiNyAxMDA2NDQNCj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvYXJtL2ZyZWVzY2FsZS9mc2wsc2N1LnR4dA0KPiA+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vZnJlZXNjYWxlL2ZzbCxzY3UudHh0DQo+
ID4gQEAgLTE1Nyw2ICsxNTcsMTcgQEAgUmVxdWlyZWQgcHJvcGVydGllczoNCj4gPiAgT3B0aW9u
YWwgcHJvcGVydGllczoNCj4gPiAgLSB0aW1lb3V0LXNlYzogY29udGFpbnMgdGhlIHdhdGNoZG9n
IHRpbWVvdXQgaW4gc2Vjb25kcy4NCj4gPg0KPiA+ICtQb3dlciBrZXkgYmluZGluZ3MgYmFzZWQg
b24gU0NVIE1lc3NhZ2UgUHJvdG9jb2wNCj4gPiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gKw0KPiA+ICtSZXF1aXJlZCBw
cm9wZXJ0aWVzOg0KPiA+ICstIGNvbXBhdGlibGU6IHNob3VsZCBiZToNCj4gPiArICAgICAgICAg
ICAgICAiZnNsLGlteDhxeHAtc2MtcHdya2V5Ig0KPiA+ICsgICAgICAgICAgICAgIGZvbGxvd2Vk
IGJ5ICJmc2wsaW14LXNjLXB3cmtleSI7DQo+ID4gKy0gbGludXgsa2V5Y29kZXM6IFNlZQ0KPiA+
ICtEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW5wdXQva2V5cy50eHQNCj4gPiAr
T3B0aW9uYWwgUHJvcGVydGllczoNCj4gPiArLSB3YWtldXAtc291cmNlOiBTZWUNCj4gPiArRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bvd2VyL3dha2V1cC1zb3VyY2UudHh0DQo+
ID4gKw0KPiA+ICBFeGFtcGxlIChpbXg4cXhwKToNCj4gPiAgLS0tLS0tLS0tLS0tLQ0KPiA+ICBh
bGlhc2VzIHsNCj4gPiBAQCAtMjIwLDYgKzIzMSwxMyBAQCBmaXJtd2FyZSB7DQo+ID4gIAkJCWNv
bXBhdGlibGUgPSAiZnNsLGlteDhxeHAtc2MtcnRjIjsNCj4gPiAgCQl9Ow0KPiA+DQo+ID4gKwkJ
c2N1X3B3cmtleTogc2N1LXB3cmtleSB7DQo+ID4gKwkJCWNvbXBhdGlibGUgPSAiZnNsLGlteDhx
eHAtc2MtcHdya2V5IiwgImZzbCxpbXgtc2MtDQo+IHB3cmtleSI7DQo+ID4gKwkJCWxpbnV4LGtl
eWNvZGUgPSA8S0VZX1BPV0VSPjsNCj4gPiArCQkJd2FrZXVwLXNvdXJjZTsNCj4gDQo+IHdha2V1
cC1zb3VyY2UgaW1wbGllcyBhbiBpbnRlcnJ1cHQgcHJvcGVydHkuDQoNCkFmdGVyIGZ1cnRoZXIg
Y2hlY2ssIEkgY29uZmlybSB0aGlzICJ3YWtldXAtc291cmNlIiBwcm9wZXJ0eSBpcyBOT1QgbmVl
ZGVkIGZvciBTQ1UgZ2VuZXJhbCBpbnRlcnJ1cHQNCndha2V1cCwgcmVtb3ZlIGl0IGluIFYyLiAN
Cg0KPiANCj4gPiArCQkJc3RhdHVzID0gImRpc2FibGVkIjsNCj4gDQo+IERvbid0IHNob3VsZCBz
dGF0dXMgaW4gZXhhbXBsZXMuDQoNClJlbW92ZWQgaXQgaW4gVjIsIHBsZWFzZSBoZWxwIHJldmll
dywgdGhhbmtzLg0KDQpBbnNvbg0KDQo=
