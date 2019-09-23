Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F9D2BACA8
	for <lists+linux-input@lfdr.de>; Mon, 23 Sep 2019 04:34:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404487AbfIWCeN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 22 Sep 2019 22:34:13 -0400
Received: from mail-eopbgr40046.outbound.protection.outlook.com ([40.107.4.46]:8483
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2404135AbfIWCeM (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 22 Sep 2019 22:34:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mg4vD9ymds1DhtMIKmBv6QCg2T63Wmf+TEszKqft23a0TYmEe2DLm1QJSi8gUdGgyJ/ztLGrf/60UAfCuXk8HAOPekh6L8YgmA4i9/f8l6F8Z0LwOVd0Qu4K1edxIuiFPjvV92tkRGJgBas1Vb7orefRcLRGcqUqtW8J4IUdhfH8vTAlXsZYpkRW5B3k/zO8MzR5TuDSb2vGi95zWpG97K7lTWlIfqyUhjwQlRgha1xGCrjzRxWkH+lbJQ1jVh4u1WlNaRsDTZYMQj5qayEG6q9J77KzNz1Dyjg7poLbucpq6GWhv79W9cFncRTzKr3RfuaYtcwAdp+JCxOU00GQFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BIB8reF8ZJulh2+Bq0eXH3RvKOKQJBYzvqQ4/KEr0wU=;
 b=kf02hr2r28BKy60kRRrg2eL/f6K64NoyaPOzGTPsmk/bMcbqgq0XUFkFyGievZCKQSCmAn6DdkCvnRDweO4cgUSB7joCCVLGzeB0ITUX2+p21ykjNbDHpnpxFX8av/mqHWg/3pxwLHqDjNNYBNN70YlrYCc2ykYSkDyTfPhQbmQZ8wnJlIVooZ7Cgz5BAZKJKw7ItvBAA3S6YSXYErs6IoEmJgeR7L+4Aj+zqvOYG9ZntPwkwOug1oPv3u10pRdoGh1pcPbSdj76vNfRRm9rR1bW3SqPqfdnD11jSSRlJG4CZtsumPd05JwfL9FA+SfxLNRL7O/gMFwAzWSyVw0/8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BIB8reF8ZJulh2+Bq0eXH3RvKOKQJBYzvqQ4/KEr0wU=;
 b=VeY2Vi3Nlf/WGhISQCqZPdHK0NKwcOeog/omtNVTxPAhFVsrNiE7fb/5GN9cB6ZNs5TBgXoPJHKfCsFbQw7EtqiGmPkoH4H/gXB/DSbcDUI8zGeXkZ13GLRLHin70IIz49mPqLXFN8RPrVreS8RHb/lOHTHE9vWZ5EpRd1WI2Zo=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) by
 DB3PR0402MB3945.eurprd04.prod.outlook.com (52.134.65.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Mon, 23 Sep 2019 02:34:07 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::8958:299c:bc54:2a38]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::8958:299c:bc54:2a38%7]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 02:34:07 +0000
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
Thread-Index: AQHVYfv+INaxBRtrokqtKaL9fDhNpqc3/ZaAgACs9fA=
Date:   Mon, 23 Sep 2019 02:34:07 +0000
Message-ID: <DB3PR0402MB3916F48DA2A16E57C624432BF5850@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1567519424-32271-1-git-send-email-Anson.Huang@nxp.com>
 <20190922161415.GD1999@bug>
In-Reply-To: <20190922161415.GD1999@bug>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=anson.huang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 82796835-2c6a-456e-12ce-08d73fce825a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:DB3PR0402MB3945;
x-ms-traffictypediagnostic: DB3PR0402MB3945:|DB3PR0402MB3945:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0402MB39453BEC49A7526822837F8CF5850@DB3PR0402MB3945.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0169092318
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(366004)(346002)(39860400002)(376002)(136003)(189003)(199004)(256004)(6436002)(305945005)(8676002)(66446008)(66476007)(64756008)(76116006)(66946007)(66556008)(25786009)(476003)(11346002)(81166006)(14454004)(5660300002)(71200400001)(71190400001)(81156014)(6916009)(26005)(86362001)(7736002)(478600001)(7416002)(74316002)(8936002)(76176011)(6506007)(186003)(9686003)(52536014)(33656002)(7696005)(3846002)(486006)(6246003)(102836004)(99286004)(66066001)(4326008)(44832011)(55016002)(2906002)(316002)(54906003)(446003)(6116002)(229853002);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3945;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eYvOSZWaT2i+bXf8YtdrpBVstRzdWnVy3aF6Z4SjJWMS6NVS+4cak2NgxasN++EtpZnxTLoXh+bsM8aKaFrBdaNiUuCmZtNRK2nSt94IlkFIA7rC4wenUj5W5d8XXs5M20uoc7+qTNBG//I1YD0W9QnQxDGMSOlXDb+NjELTYwNZQSM333YPNPMb2GhCVZQlqx45W4DEPernFq0ntQcVRHezFgqE4b+1IRlejLH16uQWLIGlVtMOyMQ3KAkH8NVnp3qYlXM04XSa40jao1WF1EX2V5q8J4ZJ2hRZQ57sALhvYy/Vcx8VAosukI5sMs4oliQ3HNTn3oBddYKG8TjKFfF4hd7KjUwSA3g30oVftgYd8NL39zDCzS0msgqOnFf4uJzxshnSuNRBcaByB30eFUpkm5lF+QMDYo/MmVMHddE=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82796835-2c6a-456e-12ce-08d73fce825a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 02:34:07.7689
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jh5FZn2/A0J4G8IN0IlN2v5qppsDBDo9nvOQhd5NX7ZAy5Df1RYHS90/i6YZaLARo7bNV0bcBRT9dyGnInxTPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3945
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

SGksIFBhdmVsDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCBWMiAxLzVdIGR0LWJpbmRpbmdzOiBm
c2w6IHNjdTogYWRkIHNjdSBwb3dlciBrZXkgYmluZGluZw0KPiANCj4gT24gVHVlIDIwMTktMDkt
MDMgMTA6MDM6NDAsIEFuc29uIEh1YW5nIHdyb3RlOg0KPiA+IE5YUCBpLk1YOFFYUCBpcyBhbiBB
Uk12OCBTb0Mgd2l0aCBhIENvcnRleC1NNCBjb3JlIGluc2lkZSBhcyBzeXN0ZW0NCj4gPiBjb250
cm9sbGVyLCB0aGUgc3lzdGVtIGNvbnRyb2xsZXIgaXMgaW4gY2hhcmdlIG9mIHN5c3RlbSBwb3dl
ciwgY2xvY2sNCj4gPiBhbmQgcG93ZXIga2V5IGV2ZW50IGV0Yy4gbWFuYWdlbWVudCwgTGludXgg
a2VybmVsIGhhcyB0byBjb21tdW5pY2F0ZQ0KPiA+IHdpdGggc3lzdGVtIGNvbnRyb2xsZXIgdmlh
IE1VIChtZXNzYWdlIHVuaXQpIElQQyB0byBnZXQgcG93ZXIga2V5DQo+ID4gZXZlbnQsIGFkZCBi
aW5kaW5nIGRvYyBmb3IgaS5NWCBzeXN0ZW0gY29udHJvbGxlciBwb3dlciBrZXkgZHJpdmVyLg0K
PiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQW5zb24gSHVhbmcgPEFuc29uLkh1YW5nQG54cC5jb20+
DQo+ID4gLS0tDQo+ID4gQ2hhbmdlcyBzaW5jZSBWMToNCj4gPiAJLSByZW1vdmUgIndha2V1cC1z
b3VyY2UiIHByb3BlcnR5LCBhcyBpdCBpcyBOT1QgbmVlZGVkIGZvciBTQ1UNCj4gaW50ZXJydXB0
Ow0KPiA+IAktIHJlbW92ZSAic3RhdHVzIiBpbiBleGFtcGxlLg0KPiA+IC0tLQ0KPiA+ICAuLi4v
ZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vZnJlZXNjYWxlL2ZzbCxzY3UudHh0ICAgICAgICAgIHwg
MTQNCj4gKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMo
KykNCj4gPg0KPiA+IGRpZmYgLS1naXQNCj4gPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9hcm0vZnJlZXNjYWxlL2ZzbCxzY3UudHh0DQo+ID4gYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvYXJtL2ZyZWVzY2FsZS9mc2wsc2N1LnR4dA0KPiA+IGluZGV4IGMx
NDlmYWQuLmY5M2UyZTQgMTAwNjQ0DQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2FybS9mcmVlc2NhbGUvZnNsLHNjdS50eHQNCj4gPiArKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2ZyZWVzY2FsZS9mc2wsc2N1LnR4dA0KPiA+IEBA
IC0xNTcsNiArMTU3LDE1IEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6DQo+ID4gIE9wdGlvbmFsIHBy
b3BlcnRpZXM6DQo+ID4gIC0gdGltZW91dC1zZWM6IGNvbnRhaW5zIHRoZSB3YXRjaGRvZyB0aW1l
b3V0IGluIHNlY29uZHMuDQo+ID4NCj4gPiArUG93ZXIga2V5IGJpbmRpbmdzIGJhc2VkIG9uIFND
VSBNZXNzYWdlIFByb3RvY29sDQo+ID4gKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+ICsNCj4gPiArUmVxdWlyZWQgcHJvcGVy
dGllczoNCj4gPiArLSBjb21wYXRpYmxlOiBzaG91bGQgYmU6DQo+ID4gKyAgICAgICAgICAgICAg
ImZzbCxpbXg4cXhwLXNjLXB3cmtleSINCj4gPiArICAgICAgICAgICAgICBmb2xsb3dlZCBieSAi
ZnNsLGlteC1zYy1wd3JrZXkiOw0KPiA+ICstIGxpbnV4LGtleWNvZGVzOiBTZWUNCj4gPiArRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lucHV0L2tleXMudHh0DQo+IA0KPiBOb3Rl
IHlvdSBoYXZlIGtleWNvZGVfc18gaGVyZSwgYnV0IGtleWNvZGUgaW4gdGhlIGV4YW1wbGUgYW5k
IGluIHRoZSBkdHMNCj4gcGF0Y2guDQoNCk5PVCBxdWl0ZSB1bmRlcnN0YW5kIHlvdXIgcG9pbnQs
IGNvdWxkIHlvdSBwbGVhc2UgcHJvdmlkZSBtb3JlIGRldGFpbHM/DQoNClRoYW5rcywNCkFuc29u
DQo=
