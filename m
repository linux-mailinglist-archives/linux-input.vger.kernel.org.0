Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E0B3A6296
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2019 09:35:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727555AbfICHfS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Sep 2019 03:35:18 -0400
Received: from mail-eopbgr60085.outbound.protection.outlook.com ([40.107.6.85]:54149
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726062AbfICHfS (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 3 Sep 2019 03:35:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n4w2hIHODrLD5b+RbrrxeOI9OKJwXTUIv3IoZLvhdAN64lk3O4v57467+BYRv1nu/FMwxxuix+7wZ3G2iazHUufD2YQNZYKqCevt23ZhrkTL6S10rRIvN92x132xyt/nlFspJ2RW4DYP7GJPN5cW4psgYErrcysk7QpLKhm+dJ2Xo1P3bX2+2sd2c0vhnjDs+WytpLH6gVBfIjSWWz/eM8g7Z/KTeGbTIVnskNu5Fcph650gz/dXjfwSP7NZeb1Bdw5z36bXiMtv5N5m8lM3G4Pc2ybKhO1ug3zsOF/PRx4hrWCRSx7axKFMoBJa9WmvSdBzE/raIRAVUFGkoVFLsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YrGq/an+p7FYN3YZA3rKZsfAmH60otLnwdUC0Y/TIjE=;
 b=bMZIbGeJheUnQJZziJmENGWyTOYDJ3zVNT8DuOOatXSX2InJKU3oHnN2Oqe7M+Q0tvpjImEmrcZQ5J8FaJZhwWSDFO7ldTgKftoXRUjqIJ3o8Y6oc1pxbrkQMdmgexGNElnscuQgUqU/z8x3KxKOchULQaJPMdnBjlSbfVCCu4wCdNs97nxfjOuBMZFvvR0Kp2asZGeOX0InHIBwHvhBgX26sNxWZFkhzui4jct6V3LoTU8TJ8Ni9bpV3XIkEfTKyWIKV6HQ8OAaxLU+zKTuksARWX87B8BmFBTn7VdsnXRVF3E31ZjQwbA07uLyvHfcYufH9UZ/AuternAFBS2BOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YrGq/an+p7FYN3YZA3rKZsfAmH60otLnwdUC0Y/TIjE=;
 b=Y9Pd0Qir8e2xh43YVLSI7JAMQ8ABS86n/yMayg1WLbLhNkZJambiLsA5Mq5zkxpGo8mOch95+UtT6PVqkv+iwbuh05sbXJMm33Dp6lfLHcCUzbdazNO+qXOxBhVgcEp+koCPWFn8j23dEccygd8gcSR5DHm66UcJ6kJ24ugZlWI=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) by
 DB3PR0402MB3818.eurprd04.prod.outlook.com (52.134.71.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Tue, 3 Sep 2019 07:35:06 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::8958:299c:bc54:2a38]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::8958:299c:bc54:2a38%7]) with mapi id 15.20.2199.021; Tue, 3 Sep 2019
 07:35:06 +0000
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
Subject: RE: [PATCH V2 2/5] input: keyboard: imx_sc: Add i.MX system
 controller power key support
Thread-Topic: [PATCH V2 2/5] input: keyboard: imx_sc: Add i.MX system
 controller power key support
Thread-Index: AQHVYfwAkBJd0uw8O0iWCkl8q7ZXAqcZfd4AgAACgQCAAA4OAIAAALzA
Date:   Tue, 3 Sep 2019 07:35:06 +0000
Message-ID: <DB3PR0402MB3916FB4618F86DD891013FEEF5B90@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1567519424-32271-1-git-send-email-Anson.Huang@nxp.com>
 <1567519424-32271-2-git-send-email-Anson.Huang@nxp.com>
 <6d8dd5df-02da-b4cd-e61d-a4a15d0bf0c8@pengutronix.de>
 <DB3PR0402MB391602C6B425DD7EBFB9AF1DF5B90@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <dbe0ba0a-29bc-ee96-541d-244b3dbf0b81@pengutronix.de>
In-Reply-To: <dbe0ba0a-29bc-ee96-541d-244b3dbf0b81@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=anson.huang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6453d263-b90a-473b-30a2-08d730413dfa
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DB3PR0402MB3818;
x-ms-traffictypediagnostic: DB3PR0402MB3818:|DB3PR0402MB3818:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0402MB38187DA710928822C15A7B96F5B90@DB3PR0402MB3818.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01494FA7F7
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(136003)(346002)(39860400002)(366004)(396003)(189003)(199004)(66066001)(76176011)(52536014)(6506007)(53546011)(26005)(9686003)(71190400001)(66446008)(7696005)(64756008)(66556008)(6116002)(3846002)(55016002)(74316002)(66476007)(102836004)(6306002)(229853002)(71200400001)(6246003)(7416002)(2501003)(6436002)(5660300002)(53936002)(186003)(99286004)(8676002)(110136005)(316002)(11346002)(446003)(76116006)(81156014)(86362001)(81166006)(4326008)(25786009)(476003)(2201001)(486006)(8936002)(66946007)(44832011)(966005)(478600001)(2906002)(45080400002)(305945005)(14454004)(7736002)(33656002)(256004)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3818;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4jj9eQsaPj4SvyYRP34DTLymPycHdwgw5Cqz7pK8TUd60vTa0z6TEoLTS8FBA8ZVNvrf1Ag9hngC3osw7TzkbDPTlL1kEQgHlTtpI/5tj3jJs8aa4SCMvcrZC4LJKckt/j4Z+xPEnsdhdGvMJScLp/B89FrttN+WbeABBSU4VHcM0TwUwOUm3xMhQHvFTwYV6sgoXG/E73YwHfSpSowqy9OsMbHe60nPCG2YA0tKV5Q9mDcveu/DNI1vIqZbsaFoqhyl6Eu8tqFidBQ859ihXij7ajT02xK0gzXWLQBYsBrxFAo2K1mz81Ts5Ya6CnSmh/3g1PozLBck2SDE2e+KyWd1h3g3kq8ZVqNYTR92bAYuTlUPTYar+TxnspjCThA6ouhkbsqaZPdoJtZi1fE5QnWXHtFsvbUcskni837UBT8=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6453d263-b90a-473b-30a2-08d730413dfa
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 07:35:06.5439
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wiLAoU2fjLoNYQ8iO05K3JJjTJuC0O5GJ57dHoYb1IS+SZCkMRXpVMIxikClFiz7kR4sDXIFLR6Ifs0vQu/n/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3818
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

SGksIE9sZWtzaWoNCg0KPiBPbiAwMy4wOS4xOSAwODo0OCwgQW5zb24gSHVhbmcgd3JvdGU6DQo+
ID4gSGksIE9sZWtzaWoNCj4gPg0KPiA+PiBPbiAwMy4wOS4xOSAxNjowMywgQW5zb24gSHVhbmcg
d3JvdGU6DQo+ID4+PiBpLk1YOFFYUCBpcyBhbiBBUk12OCBTb0Mgd2hpY2ggaGFzIGEgQ29ydGV4
LU00IHN5c3RlbSBjb250cm9sbGVyDQo+ID4+PiBpbnNpZGUsIHRoZSBzeXN0ZW0gY29udHJvbGxl
ciBpcyBpbiBjaGFyZ2Ugb2YgY29udHJvbGxpbmcgcG93ZXIsDQo+ID4+PiBjbG9jayBhbmQgcG93
ZXIga2V5IGV0Yy4uDQo+ID4+Pg0KPiA+Pj4gQWRkcyBpLk1YIHN5c3RlbSBjb250cm9sbGVyIHBv
d2VyIGtleSBkcml2ZXIgc3VwcG9ydCwgTGludXgga2VybmVsDQo+ID4+PiBoYXMgdG8gY29tbXVu
aWNhdGUgd2l0aCBzeXN0ZW0gY29udHJvbGxlciB2aWEgTVUgKG1lc3NhZ2UgdW5pdCkgSVBDDQo+
ID4+PiB0byBnZXQgcG93ZXIga2V5J3Mgc3RhdHVzLg0KPiA+Pj4NCj4gPj4+IFNpZ25lZC1vZmYt
Ynk6IEFuc29uIEh1YW5nIDxBbnNvbi5IdWFuZ0BueHAuY29tPg0KPiA+Pj4gLS0tDQo+ID4+PiBD
aGFuZ2VzIHNpbmNlIFYxOg0KPiA+Pj4gCS0gcmVtb3ZlICJ3YWtldXAtc291cmNlIiBwcm9wZXJ0
eSBvcGVyYXRpb24sIHNjdSBwb3dlciBrZXkgdXNlcw0KPiA+PiBnZW5lcmljIHNjdSBpcnEsDQo+
ID4+PiAJICBubyBuZWVkIHRvIGhhdmUgdGhpcyBwcm9wZXJ0eSBmb3IgZGV2aWNlIHdha2V1cCBv
cGVyYXRpb24uDQo+ID4+PiAtLS0NCj4gPj4+ICAgIGRyaXZlcnMvaW5wdXQva2V5Ym9hcmQvS2Nv
bmZpZyAgICAgICAgIHwgICA3ICsrDQo+ID4+PiAgICBkcml2ZXJzL2lucHV0L2tleWJvYXJkL01h
a2VmaWxlICAgICAgICB8ICAgMSArDQo+ID4+PiAgICBkcml2ZXJzL2lucHV0L2tleWJvYXJkL2lt
eF9zY19wd3JrZXkuYyB8IDE2OQ0KPiA+PiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysNCj4gPj4+ICAgIDMgZmlsZXMgY2hhbmdlZCwgMTc3IGluc2VydGlvbnMoKykNCj4gPj4+ICAg
IGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2lucHV0L2tleWJvYXJkL2lteF9zY19wd3JrZXku
Yw0KPiA+Pj4NCj4gPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lucHV0L2tleWJvYXJkL0tjb25m
aWcNCj4gPj4+IGIvZHJpdmVycy9pbnB1dC9rZXlib2FyZC9LY29uZmlnIGluZGV4IDJlNmQyODgu
LjNhYWViOWMgMTAwNjQ0DQo+ID4+PiAtLS0gYS9kcml2ZXJzL2lucHV0L2tleWJvYXJkL0tjb25m
aWcNCj4gPj4+ICsrKyBiL2RyaXZlcnMvaW5wdXQva2V5Ym9hcmQvS2NvbmZpZw0KPiA+Pj4gQEAg
LTQ2OSw2ICs0NjksMTMgQEAgY29uZmlnIEtFWUJPQVJEX0lNWA0KPiA+Pj4gICAgCSAgVG8gY29t
cGlsZSB0aGlzIGRyaXZlciBhcyBhIG1vZHVsZSwgY2hvb3NlIE0gaGVyZTogdGhlDQo+ID4+PiAg
ICAJICBtb2R1bGUgd2lsbCBiZSBjYWxsZWQgaW14X2tleXBhZC4NCj4gPj4+DQo+ID4+PiArY29u
ZmlnIEtFWUJPQVJEX0lNWF9TQ19QV1JLRVkNCj4gPj4+ICsJdHJpc3RhdGUgIklNWCBTQ1UgUG93
ZXIgS2V5IERyaXZlciINCj4gPj4+ICsJZGVwZW5kcyBvbiBJTVhfU0NVDQo+ID4+PiArCWhlbHAN
Cj4gPj4+ICsJICBUaGlzIGlzIHRoZSBzeXN0ZW0gY29udHJvbGxlciBwb3dlcmtleSBkcml2ZXIg
Zm9yIE5YUCBpLk1YIFNvQ3Mgd2l0aA0KPiA+Pj4gKwkgIHN5c3RlbSBjb250cm9sbGVyIGluc2lk
ZS4NCj4gPj4NCj4gPj4gVGhlIEtFWSBpcyBjb25maWd1cmFibGUgb3ZlciBkZXZpY2V0cmVlLCB3
aHkgaXMgaXQgY2FsbGVkIFBXUktFWT8gSXQNCj4gPj4gbG9va3MgZm9yIG1lIGFzIGdlbmVyaWMg
U0NVIGtleSBoYW5kbGVyLg0KPiA+DQo+ID4gV2UgYWx3YXlzIHVzZSBpdCBhcyBwb3dlciBrZXks
IE5PVCBhIGdlbmVyaWMga2V5LCBhcyBpdCBoYXMgSFcNCj4gPiBmdW5jdGlvbiBkZXNpZ25lZCBm
b3IgcG93ZXIga2V5IHB1cnBvc2UuDQo+IA0KPiBncGlvLWtleSBkcml2ZXIgaXMgbW9zdGx5IHVz
ZWQgZm9yIHBvd2VyIG9yIHJlYm9vdCBrZXkuIEFuZCBpdCBpcyBzdGlsbCBjYWxsZWQNCj4gZ3Bp
by1rZXkgZHJpdmVyLiBJZiBpdCBpcyB1c2VkIGZvciBwb3dlciBrZXkgb25seSwgd2h5IGlzIGl0
IGNvbmZpZ3VyYWJsZT8gSSBjYW4NCj4gY29uZmlndXJlIGl0IGFzIEtFWV9FTlRFUiBvciBzb21l
IHRoaW5nIGRpZmZlcmVudC4gVGhpcyBkcml2ZXIgaGFzIG5vdA0KPiBLRVlfUE9XRVIgc3BlY2lm
aWMgYW55IHRoaW5nLg0KDQpVbmRlcnN0b29kLCBJIGFtIG1ha2luZyB0aGUgVjMgd2l0aCBhbGwg
InBvd2VyIiByZW1vdmVkLCBqdXN0IHVzaW5nIHRoZSAia2V5Ii4NCg0KPiANCj4gPg0KPiA+Pg0K
PiA+Pj4gICAgY29uZmlnIEtFWUJPQVJEX05FV1RPTg0KPiA+Pj4gICAgCXRyaXN0YXRlICJOZXd0
b24ga2V5Ym9hcmQiDQo+ID4+PiAgICAJc2VsZWN0IFNFUklPDQo+ID4+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9pbnB1dC9rZXlib2FyZC9NYWtlZmlsZQ0KPiA+Pj4gYi9kcml2ZXJzL2lucHV0L2tl
eWJvYXJkL01ha2VmaWxlIGluZGV4IDk1MTAzMjUuLjllYTU1ODUgMTAwNjQ0DQo+ID4+PiAtLS0g
YS9kcml2ZXJzL2lucHV0L2tleWJvYXJkL01ha2VmaWxlDQo+ID4+PiArKysgYi9kcml2ZXJzL2lu
cHV0L2tleWJvYXJkL01ha2VmaWxlDQo+ID4+PiBAQCAtMjksNiArMjksNyBAQCBvYmotJChDT05G
SUdfS0VZQk9BUkRfSElMKQkJKz0NCj4gaGlsX2tiZC5vDQo+ID4+PiAgICBvYmotJChDT05GSUdf
S0VZQk9BUkRfSElMX09MRCkJCSs9IGhpbGtiZC5vDQo+ID4+PiAgICBvYmotJChDT05GSUdfS0VZ
Qk9BUkRfSVBBUV9NSUNSTykJKz0gaXBhcS1taWNyby1rZXlzLm8NCj4gPj4+ICAgIG9iai0kKENP
TkZJR19LRVlCT0FSRF9JTVgpCQkrPSBpbXhfa2V5cGFkLm8NCj4gPj4+ICtvYmotJChDT05GSUdf
S0VZQk9BUkRfSU1YX1NDX1BXUktFWSkJKz0gaW14X3NjX3B3cmtleS5vDQo+ID4+PiAgICBvYmot
JChDT05GSUdfS0VZQk9BUkRfSFA2WFgpCQkrPSBqb3JuYWRhNjgwX2tiZC5vDQo+ID4+PiAgICBv
YmotJChDT05GSUdfS0VZQk9BUkRfSFA3WFgpCQkrPSBqb3JuYWRhNzIwX2tiZC5vDQo+ID4+PiAg
ICBvYmotJChDT05GSUdfS0VZQk9BUkRfTEtLQkQpCQkrPSBsa2tiZC5vDQo+ID4+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9pbnB1dC9rZXlib2FyZC9pbXhfc2NfcHdya2V5LmMNCj4gPj4+IGIvZHJp
dmVycy9pbnB1dC9rZXlib2FyZC9pbXhfc2NfcHdya2V5LmMNCj4gPj4+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0DQo+ID4+PiBpbmRleCAwMDAwMDAwLi41M2FhOWE0DQo+ID4+PiAtLS0gL2Rldi9udWxs
DQo+ID4+PiArKysgYi9kcml2ZXJzL2lucHV0L2tleWJvYXJkL2lteF9zY19wd3JrZXkuYw0KPiA+
Pj4gQEAgLTAsMCArMSwxNjkgQEANCj4gPj4+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
R1BMLTIuMA0KPiA+Pj4gKy8qDQo+ID4+PiArICogQ29weXJpZ2h0IDIwMTkgTlhQLg0KPiA+Pj4g
KyAqLw0KPiA+Pj4gKw0KPiA+Pj4gKyNpbmNsdWRlIDxsaW51eC9kZXZpY2UuaD4NCj4gPj4+ICsj
aW5jbHVkZSA8bGludXgvZXJyLmg+DQo+ID4+PiArI2luY2x1ZGUgPGxpbnV4L2Zpcm13YXJlL2lt
eC9zY2kuaD4gI2luY2x1ZGUgPGxpbnV4L2luaXQuaD4NCj4gPj4+ICsjaW5jbHVkZSA8bGludXgv
aW5wdXQuaD4gI2luY2x1ZGUgPGxpbnV4L2ludGVycnVwdC5oPiAjaW5jbHVkZQ0KPiA+Pj4gKzxs
aW51eC9qaWZmaWVzLmg+ICNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4gI2luY2x1ZGUNCj4gPj4+
ICs8bGludXgvbW9kdWxlLmg+ICNpbmNsdWRlIDxsaW51eC9vZi5oPiAjaW5jbHVkZQ0KPiA+Pj4g
KzxsaW51eC9vZl9hZGRyZXNzLmg+ICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4N
Cj4gPj4+ICsNCj4gPj4+ICsjZGVmaW5lIERFQk9VTkNFX1RJTUUJMTAwDQo+ID4+PiArI2RlZmlu
ZSBSRVBFQVRfSU5URVJWQUwJNjANCj4gPj4+ICsNCj4gPj4+ICsjZGVmaW5lIFNDX0lSUV9CVVRU
T04JCTENCj4gPj4+ICsjZGVmaW5lIFNDX0lSUV9HUk9VUF9XQUtFCTMNCj4gPj4+ICsjZGVmaW5l
IElNWF9TQ19NSVNDX0ZVTkNfR0VUX0JVVFRPTl9TVEFUVVMJMTgNCj4gPj4+ICsNCj4gPj4+ICtz
dHJ1Y3QgaW14X3B3cmtleV9kcnZfZGF0YSB7DQo+ID4+PiArCWludCBrZXljb2RlOw0KPiA+Pj4g
Kwlib29sIGtleXN0YXRlOyAgLyogMTogcHJlc3NlZCwgMDogcmVsZWFzZSAqLw0KPiA+Pj4gKwli
b29sIGRlbGF5X2NoZWNrOw0KPiA+Pj4gKwlzdHJ1Y3QgZGVsYXllZF93b3JrIGNoZWNrX3dvcms7
DQo+ID4+PiArCXN0cnVjdCBpbnB1dF9kZXYgKmlucHV0Ow0KPiA+Pj4gK307DQo+ID4+PiArDQo+
ID4+PiArc3RydWN0IGlteF9zY19tc2dfcHdya2V5IHsNCj4gPj4+ICsJc3RydWN0IGlteF9zY19y
cGNfbXNnIGhkcjsNCj4gPj4+ICsJdTggc3RhdGU7DQo+ID4+PiArfTsNCj4gPj4+ICtzdGF0aWMg
c3RydWN0IGlteF9wd3JrZXlfZHJ2X2RhdGEgKnBkYXRhOw0KPiA+Pg0KPiA+PiBXaHkgaXMgaXQg
Z2xvYmFsIHN0cnVjdD8gSXQgc2VlbXMgdG8gYmUgZmxleGlibGUgY29uZmlndXJhYmxlIG92ZXIg
ZGV2aWNldHJlZS4NCj4gPj4gU28gSSB3b3VsZCBhc3N1bWUgaXQgc2hvdWxkIGJlIGFibGUgdG8g
aGFuZGxlIG1vcmUgdGhlbiBvbmUgYnV0dG9uLg0KPiA+PiBQbGVhc2UgcmVtb3ZlIGdsb2JhbCB2
YXJpYWJsZXMsIG1ha2UgaXQgYWxsb2NhdGFibGUgcGVyIE9GIG5vZGUuDQo+ID4NCj4gPiBUaGVy
ZSBpcyBPTkxZIG9uZSBidXR0b24gYXZhaWxhYmxlIGZvciBTQyBrZXksIGJ1dCB5ZXMsIEkgdGhp
bmsgSSBjYW4NCj4gPiBtYWtlIHRoZSBzdHJ1Y3R1cmUgcHJpdmF0ZSBhbmQgZ2V0IGFsbCBuZWNl
c3NhcnkgZGF0YSBmcm9tIHRoZSBzdHJ1Y3R1cmUNCj4gdXNpbmcgY29udGFpbmVyX29mLg0KPiAN
Cj4gQW5kIHdlIHdpbGwgbmV2ZXIgbmVlZCBtb3JlIHRoZW4gNjQwIGtCIFJBTSA7KQ0KPiBodHRw
czovL2V1cjAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0El
MkYlMkZlbi53aQ0KPiBraXF1b3RlLm9yZyUyRndpa2klMkZUYWxrJTNBQmlsbF9HYXRlcyZhbXA7
ZGF0YT0wMiU3QzAxJTdDYW5zb24uaHUNCj4gYW5nJTQwbnhwLmNvbSU3QzRkNGQ3NDU4MDg3NzQ3
ZTBkOGYwMDhkNzMwNDA1N2U5JTdDNjg2ZWExZDNiYzINCj4gYjRjNmZhOTJjZDk5YzVjMzAxNjM1
JTdDMCU3QzAlN0M2MzcwMzA5MjUyMzYxNTAyNDMmYW1wO3NkYXRhPXcNCj4gJTJGR1hCYUhmbkJk
THdqVHhqYnpXU1BlSXczRXhMJTJGczlJTU9nRjFvbkw2QSUzRCZhbXA7cmVzZXJ2ZWQNCj4gPTAN
Cj4gDQo+ID4NCj4gPj4NCj4gPj4gUGxlYXNlIHVzZSBkaWZmZXJlbnQgbmFtZSAicGRhdGEiIGlz
IHVzdWFsbHkgdXNlZCBhcyBwbGF0Zm9ybSBkYXRhLg0KPiA+PiBQbGVhc2UsIHVzZSAicHJpdiIu
DQo+ID4NCj4gPiBPSy4NCj4gPg0KPiA+Pg0KPiA+Pj4gK3N0YXRpYyBzdHJ1Y3QgaW14X3NjX2lw
YyAqcHdya2V5X2lwY19oYW5kbGU7DQo+ID4+DQo+ID4+IHNhbWUgYXMgYmVmb3JlLCBubyBnbG9i
YWwgdmFyaWFibGVzLg0KPiA+DQo+ID4gV2lsbCBtb3ZlIGl0IGludG8gcHJpdmF0ZSBwbGF0Zm9y
bSBkYXRhIHN0cnVjdHVyZS4NCj4gPg0KPiA+Pg0KPiA+Pj4gKw0KPiA+Pj4gK3N0YXRpYyBpbnQg
aW14X3NjX3B3cmtleV9ub3RpZnkoc3RydWN0IG5vdGlmaWVyX2Jsb2NrICpuYiwNCj4gPj4+ICsJ
CQkJdW5zaWduZWQgbG9uZyBldmVudCwgdm9pZCAqZ3JvdXApIHsNCj4gPj4+ICsJaWYgKChldmVu
dCAmIFNDX0lSUV9CVVRUT04pICYmICgqKHU4ICopZ3JvdXAgPT0NCj4gPj4gU0NfSVJRX0dST1VQ
X1dBS0UpDQo+ID4+PiArCSAgICAmJiAhcGRhdGEtPmRlbGF5X2NoZWNrKSB7DQo+ID4+PiArCQlw
ZGF0YS0+ZGVsYXlfY2hlY2sgPSAxOw0KPiA+Pj4gKwkJc2NoZWR1bGVfZGVsYXllZF93b3JrKCZw
ZGF0YS0+Y2hlY2tfd29yaywNCj4gPj4+ICsJCQkJICAgICAgbXNlY3NfdG9famlmZmllcyhSRVBF
QVRfSU5URVJWQUwpKTsNCj4gPj4+ICsJfQ0KPiA+Pj4gKw0KPiA+Pj4gKwlyZXR1cm4gMDsNCj4g
Pj4+ICt9DQo+ID4+PiArDQo+ID4+PiArc3RhdGljIHZvaWQgaW14X3NjX2NoZWNrX2Zvcl9ldmVu
dHMoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKSB7DQo+ID4+PiArCXN0cnVjdCBpbnB1dF9kZXYg
KmlucHV0ID0gcGRhdGEtPmlucHV0Ow0KPiA+Pj4gKwlzdHJ1Y3QgaW14X3NjX21zZ19wd3JrZXkg
bXNnOw0KPiA+Pj4gKwlzdHJ1Y3QgaW14X3NjX3JwY19tc2cgKmhkciA9ICZtc2cuaGRyOw0KPiA+
Pj4gKwlib29sIHN0YXRlOw0KPiA+Pj4gKw0KPiA+Pj4gKwloZHItPnZlciA9IElNWF9TQ19SUENf
VkVSU0lPTjsNCj4gPj4+ICsJaGRyLT5zdmMgPSBJTVhfU0NfUlBDX1NWQ19NSVNDOw0KPiA+Pj4g
KwloZHItPmZ1bmMgPSBJTVhfU0NfTUlTQ19GVU5DX0dFVF9CVVRUT05fU1RBVFVTOw0KPiA+Pj4g
KwloZHItPnNpemUgPSAxOw0KPiA+Pj4gKw0KPiA+Pj4gKwkvKg0KPiA+Pj4gKwkgKiBDdXJyZW50
IFNDVSBmaXJtd2FyZSBkb2VzIE5PVCBoYXZlIHJldHVybiB2YWx1ZSBmb3INCj4gPj4+ICsJICog
dGhpcyBBUEksIHRoYXQgbWVhbnMgaXQgaXMgYWx3YXlzIHN1Y2Nlc3NmdWwuDQo+ID4+PiArCSAq
Lw0KPiA+Pg0KPiA+PiBJdCBpcyBub3QgdHJ1ZSBmb3IgdGhlIGtlcm5lbCBwYXJ0Og0KPiA+PiBo
dHRwczovL2VsaXhpci4NCj4gPj4NCj4gYm9vdGxpbi5jb20lMkZsaW51eCUyRmxhdGVzdCUyRnNv
dXJjZSUyRmRyaXZlcnMlMkZmaXJtd2FyZSUyRmlteCUyRg0KPiA+PiBpbXgtDQo+ID4+DQo+IHNj
dS5jJTIzTDE1NyZhbXA7ZGF0YT0wMiU3QzAxJTdDYW5zb24uaHVhbmclNDBueHAuY29tJTdDN2E1
ZWQzDQo+ID4+DQo+IGVmM2IyNTQxZTYxYmU4MDhkNzMwMzgxMGE5JTdDNjg2ZWExZDNiYzJiNGM2
ZmE5MmNkOTljNWMzMDE2MzUlN0MNCj4gPj4NCj4gMCU3QzAlN0M2MzcwMzA4ODk2Njk0ODkxNDEm
YW1wO3NkYXRhPWQzdXc2eDZXQ1BlYXZKdTNRWWY5bzljeHgNCj4gPj4gUng0bUphcjA0ZlFGTEY5
RWhFJTNEJmFtcDtyZXNlcnZlZD0wDQo+ID4+DQo+ID4+IGlteF9zY3VfY2FsbF9ycGMoKSBtYXkg
ZmFpbCBpbiBkaWZmZXJlbnQgd2F5cyBhbmQgcHJvdmlkZSBwcm9wZXIgZXJyb3INCj4gdmFsdWUu
DQo+ID4+IFBsZWFzZSB1c2UgaXQuDQo+ID4NCj4gPiBUaGVyZSBhcmUgYWJvdXQgMyBBUElzIGFy
ZSBzcGVjaWFsLCB0aGlzIEFQSSBpcyBvbmUgb2YgdGhlbSwgdGhpcyBBUEkNCj4gPiBoYXMgbm8g
cmV0dXJuIHZhbHVlIGZyb20gU0NVIEZXIEFQSSwgYnV0IGl0IGhhcyByZXNwb25zZSBkYXRhIGZy
b20gaXQsDQo+ID4gc28gdGhhdCBtZWFucyBpZiB3ZSBzZXQgdGhlIHJlc3BvbnNlIHRvIGZhbHNl
LCB0aGUgc3RhY2sgd2lsbCBiZSBmcmVlDQo+ID4gYW5kIG1haWxib3ggd2lsbCBoYXZlIE5VTEwg
cG9pbnRlciBpc3N1ZSB3aGVuIHJlc3BvbnNlIGRhdGEgcGFzc2VkDQo+ID4gZnJvbSBTQ1UgRlcu
IElmIHdlIHNldCB0aGUgcmVzcG9uc2UgdG8gdHJ1ZSwgYXMgdGhlIFNDVSBGVyBoYXMgbm8NCj4g
PiByZXR1cm4gdmFsdWUsIHRoZSByZXR1cm4gdmFsdWUgd2lsbCBiZSB0aGUgbXNnLT5mdW5jIHdo
aWNoIHdpbGwgYmUNCj4gPiBhbHJlYWR5IGZhaWxlZCwgdGhhdCBpcyB3aHkgd2UgaGF2ZSB0byBz
a2lwIHRoZSByZXR1cm4gdmFsdWUgY2hlY2suIFRoaXMgaXMNCj4gb25lIHJlc3RyaWN0aW9uL2J1
ZyBvZiBTQ1UgRlcsIHdlIHdpbGwgbm90aWZ5IFNDVSBGVyBvd25lciB0byBmaXgvaW1wcm92ZS4N
Cj4gDQo+IE9rLCBJIHNlZS4gaW14X3NjdV9jYWxsX3JwYygpIGNhbiByZXR1cm4ga2VybmVsIHNp
ZGUgZXJyb3JzLCBmb3IgZXhhbXBsZSBmcm9tDQo+IGlteC1zY3UuYyBmcmFtZXdvcmsgRUlOVkFM
IG9yIEVUSU1FRE9VVCBvciB3aGF0IGV2ZXIgZXJyb3IgbWJveA0KPiBmcmFtZXdvcmsgbWF5IGFs
c28gcHJvdmlkZS4NCj4gQWFhYW5ubm5kZC4uLiBpdCBjYW4gZXh0cmFjdCBhbiBlcnJvciBmcm9t
IFNDVSBwYWNrYWdlIGFuZCByZXR1cm4gaXQgb3Zlcg0KPiBzYW1lIHdheSBhcyBvdGhlciBlcnJv
cnMuDQo+IA0KPiBBbmQgY3VycmVudCBTQ1UgdmVyc2lvbiBoYXMgc29tZSBidWdzLCBzbyBpdCBp
cyBwcm92aWRpbmcgd3JvbmcgZXJyb3IgdmFsdWUuDQo+IFNvby4uLiBhcyB1c3VhbCB0aGUgTlhQ
IGhhcyBkZWNpZGVkIHRvIG1ha2UgdGhlIGxpbnV4IGtlcm5lbCBhIGJpdCBtb3JlDQo+IHdvcnNl
IHRvIG1ha2UgdGhlIFNDVSBmaXJtd2FyZSBoYXBweT8gSXMgaXQgd2hhdCB5b3UgdHJ5aW5nIHRv
IGRlc2NyaWJlPw0KPiBSZWFsbHkgPyEgOkQNCj4gDQo+IFBsZWFzZS4gRml4IHRoZSBTQ1UgZmly
c3QuIFRoZSBwcm92aWRlIGZpeGVkIGtlcm5lbCBwYXRjaC4NCg0KVW5kZXJzdG9vZCwgSSB3aWxs
IG5vdGlmeSBTQ1Ugb3duZXIgdG8gZml4IGl0LCBtZWFud2hpbGUgaXQgZG9lcyBOT1QgYmxvY2sg
dGhpcyBkcml2ZXIsDQpJIHdpbGwgYWRkIHJldHVybiB2YWx1ZSBjaGVjayBpbiB0aGlzIGRyaXZl
ci4NCg0KVGhhbmtzLA0KQW5zb24NCg==
