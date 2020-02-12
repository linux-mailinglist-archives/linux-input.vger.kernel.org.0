Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD79A159E6A
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2020 01:58:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728137AbgBLA6U (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Feb 2020 19:58:20 -0500
Received: from mail-eopbgr10068.outbound.protection.outlook.com ([40.107.1.68]:4622
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728103AbgBLA6U (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Feb 2020 19:58:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q65iwtul3tt4ElkDH48uXBLiUBctvus7B02iG/QnUkxot4uv84rwPb4z7WvHASHUFYufj9i7Yjw/Nr7wMUzYnG5H40hDrDUw61yBepQk8H1rb/Zm1EZXZRNMmvnV451xT3mE64arH9BLU8Sdsab5NULdTnS/Rn9Nvg+9f0iu5uOpF0pdYoJz1ME+9CUKenhcyudiKRm0bxwMXn08IIldascmSW35xQWCtriTiBbJiJ1saXhe0k1ea24NfJxb0EDYnX0PROFqQoOkwYp0/r+nlv3emtm2B/mQrz+VoyihyNizg493dyzGf1DaZ4O4orBk7cWUiCfYCpHZy/W6AeO95Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O4LlyWR+46Ca4bY6AuLD3Hx3Ox3Eo/vor6X4YR5rNSM=;
 b=VQY2uJCLxPiXn5srpL2BwPakhKC+ZlYCe6i7znNaBi6Bjmz2Tn/7P5I9mrMlimTNiSQQuHwQX38nI2kJz6vu6qBz+dMq9LQk4ZQeJN+mqAsDH+PJ+CQmdMQ/1YqhV3qLdhC9P4eCeeCIZ/78XfUXsjPnqBzr7VQRFIuLAjN4b9s2jWf5qV+EYfZZe+/t++e2HNeSBXK3DW6t3Ppn35Qyv6dKNCYqldqtSLxA1acZ+NWfeqU7Z+TKntjYqwFxtHRraPoCAt6tyZQs/Jyw8MMkk0xRvCMs+ktLQ7ph63TDcDKt1swNvU78YDP2QOFoxx9tyDCsDur4ntbqRG+Km+xApQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O4LlyWR+46Ca4bY6AuLD3Hx3Ox3Eo/vor6X4YR5rNSM=;
 b=PpDNsrFtudAOq/sd3PqjWSYnXiiWKnb9vv9qjVMkoF0a/nBpvnUrOAcjyzS9ZY02B3ECzqv72GbwIzKxyQCVkVi1pwLKDGq+ghJcIjGeebegNXRHkowGlGLPQE5Wa/z2HziO8NZyqV44WU/BdA8ZsbgjV7VF7EBzfVQlbL5baBY=
Received: from VE1PR04MB6638.eurprd04.prod.outlook.com (20.179.232.15) by
 VE1PR04MB6365.eurprd04.prod.outlook.com (20.179.233.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.25; Wed, 12 Feb 2020 00:58:14 +0000
Received: from VE1PR04MB6638.eurprd04.prod.outlook.com
 ([fe80::490:6caa:24b:4a31]) by VE1PR04MB6638.eurprd04.prod.outlook.com
 ([fe80::490:6caa:24b:4a31%6]) with mapi id 15.20.2707.030; Wed, 12 Feb 2020
 00:58:14 +0000
From:   Robin Gong <yibin.gong@nxp.com>
To:     =?utf-8?B?QW5kcsOpIERyYXN6aWs=?= <git@andred.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Horia Geanta <horia.geanta@nxp.com>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Anson Huang <anson.huang@nxp.com>,
        Aymen Sghaier <aymen.sghaier@nxp.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH 2/3] Input: snvs_pwrkey - enable snvs clock as needed
Thread-Topic: [PATCH 2/3] Input: snvs_pwrkey - enable snvs clock as needed
Thread-Index: AQHV164yHhXoESmTiUqzHJu+3DHGMKgUx1EAgACAgDCAAH/jgIABBc0g
Date:   Wed, 12 Feb 2020 00:58:14 +0000
Message-ID: <VE1PR04MB6638C6215F71FA2EE6C4E450891B0@VE1PR04MB6638.eurprd04.prod.outlook.com>
References: <20200130204516.4760-1-git@andred.net>
         <20200130204516.4760-2-git@andred.net>
         <VI1PR0402MB3485EC2F82DDE52DC5CA0795981C0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
         <20200209223836.GA199269@dtor-ws>
         <VE1PR04MB6638A4F4E3BABE0ED0CD4A5189190@VE1PR04MB6638.eurprd04.prod.outlook.com>
         <VI1PR0402MB34851857F012286250BF3BBE98190@VI1PR0402MB3485.eurprd04.prod.outlook.com>
         <20200210175554.GB199269@dtor-ws>
         <VE1PR04MB6638761F5F8549C6528FE6B989180@VE1PR04MB6638.eurprd04.prod.outlook.com>
 <7c3a08e97281a54105225fa4f212f5279d3fac30.camel@andred.net>
In-Reply-To: <7c3a08e97281a54105225fa4f212f5279d3fac30.camel@andred.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yibin.gong@nxp.com; 
x-originating-ip: [183.192.236.243]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: eb3c0499-115c-4efa-1a99-08d7af56a3d3
x-ms-traffictypediagnostic: VE1PR04MB6365:|VE1PR04MB6365:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB6365E679AFFC1EA2619C5C70891B0@VE1PR04MB6365.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0311124FA9
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(396003)(376002)(39860400002)(346002)(366004)(189003)(199004)(7416002)(186003)(8676002)(8936002)(4326008)(26005)(81166006)(71200400001)(81156014)(55016002)(9686003)(110136005)(54906003)(316002)(6636002)(66556008)(53546011)(76116006)(5660300002)(33656002)(66946007)(2906002)(52536014)(66446008)(7696005)(6506007)(64756008)(478600001)(66476007)(86362001);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR04MB6365;H:VE1PR04MB6638.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Uht2PTUzSN5dzvs8C7u3kjM5LLxjc5ie+PgAEhyn+TEGrwpGjnv2jZhve56Hst9euvtQj4kyf/YgFUZm5OZcZXYQRSaw2pdAyNp2ySJkWrDh6fw8eVrmQbR6p+Iu8dAwErmekhH7odKsDzE4yh+5y83v3FABHutBi6IaPRAQ4YGRvtA3B0cfs2ojeqxqNOPVyJuxbMxVaZzHli8Nk3Fzl0Y/TPqyZ4oZ2hV3K41MTJql0GJDIvkhTznsijRonXwpwr79bFcF0SUBwiGLFuwY5eWF3T9a2fg4e+0kZ2BBmoT5zJM8qhRjexwu3FDbpapTUKUChgRheznD+W/prcS1bHx5NrSWPA2g591AG5qisYkjy4szvrKs035XXcdkQlZdPNeFEyeSbXKLgKjvqDkJ81sOdgZ0HnkHg9WgOPeCzyPCXzXv05lp4cFAO7hEakL/
x-ms-exchange-antispam-messagedata: d9C8y0pClovxyf1mDI2Kq6phM4Pa2zDjqhVZQqTWf7o0I//ZYYnHjfMsJtdYzwa5AMHCeyAGbq60MWGcFJPtn3SSBp/BJHF8/0bVnGn6rRZYgo+vh/8+Nz/1tO06UCPRman9Pai+UZsqjhKJij8HJQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb3c0499-115c-4efa-1a99-08d7af56a3d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2020 00:58:14.5144
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FGgdbTNgJUw2L1wWu7YTmuwGwrIcsuuuJ2TF2u8MYo6g9Kcf9kT4Ui+diwviMcG1BZr1bdiTq31HupznXBe2Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6365
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

T24gMjAyMC8wMi8xMSBBbmRyw6kgRHJhc3ppayA8Z2l0QGFuZHJlZC5uZXQ+IHdyb3RlOg0KPiBI
aSwNCj4gDQo+IE9uIFR1ZSwgMjAyMC0wMi0xMSBhdCAwMTo1NCArMDAwMCwgUm9iaW4gR29uZyB3
cm90ZToNCj4gPiBPbiAyMDIwLzAyLzExIERtaXRyeSBUb3Jva2hvdiA8ZG1pdHJ5LnRvcm9raG92
QGdtYWlsLmNvbT4gd3JvdGU6DQo+ID4gPiBPbiBNb24sIEZlYiAxMCwgMjAyMCBhdCAwNjozMzoz
MEFNICswMDAwLCBIb3JpYSBHZWFudGEgd3JvdGU6DQo+ID4gPiA+IE9uIDIvMTAvMjAyMCA0OjAz
IEFNLCBSb2JpbiBHb25nIHdyb3RlOg0KPiA+ID4gPiA+IE9uIDIwMjAvMDIvMTAgRG1pdHJ5IFRv
cm9raG92IDxkbWl0cnkudG9yb2tob3ZAZ21haWwuY29tPiB3cm90ZToNCj4gPiA+ID4gPiA+IE9u
IEZyaSwgRmViIDA3LCAyMDIwIGF0IDA4OjEwOjIyQU0gKzAwMDAsIEhvcmlhIEdlYW50YSB3cm90
ZToNCj4gPiA+ID4gPiA+ID4gT24gMS8zMC8yMDIwIDEwOjQ1IFBNLCBBbmRyw6kgRHJhc3ppayB3
cm90ZToNCj4gPiA+ID4gPiA+ID4gPiBAQCAtMTQwLDYgKzE0OCwyNSBAQCBzdGF0aWMgaW50DQo+
ID4gPiA+ID4gPiA+ID4gaW14X3NudnNfcHdya2V5X3Byb2JlKHN0cnVjdA0KPiA+ID4gPiA+ID4g
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+ID4gPiA+ID4gPiA+ICAJaWYgKHBkYXRhLT5pcnEg
PCAwKQ0KPiA+ID4gPiA+ID4gPiA+ICAJCXJldHVybiAtRUlOVkFMOw0KPiA+ID4gPiA+ID4gPiA+
DQo+ID4gPiA+ID4gPiA+ID4gKwlwZGF0YS0+Y2xrID0gZGV2bV9jbGtfZ2V0KCZwZGV2LT5kZXYs
ICJzbnZzLXB3cmtleSIpOw0KPiA+ID4gPiA+ID4gPiA+ICsJaWYgKElTX0VSUihwZGF0YS0+Y2xr
KSkgew0KPiA+ID4gPiA+ID4gPiA+ICsJCXBkYXRhLT5jbGsgPSBOVUxMOw0KPiA+ID4gPiA+ID4g
PiBVc2luZyBkZXZtX2Nsa19nZXRfb3B0aW9uYWwoKSB3b3VsZCBzaW1wbGlmeSBlcnJvciBoYW5k
bGluZy4NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBJdCBzb3VuZHMgdG8gbWUgdGhhdCB0aGlz
IGNsb2NrIGlzIG5vdCBhdCBhbGwgb3B0aW9uYWwgYW5kIHRoZQ0KPiA+ID4gPiA+ID4gZHJpdmVy
IGN1cnJlbnRseSAid29ya3MiIG9ubHkgYnkgYWNjaWRlbnQgYW5kIHRoZXJlZm9yZQ0KPiA+ID4g
PiA+ID4gb3B0aW9uYWwgaXMgbm90DQo+ID4gPiBzdWl0YWJsZSBoZXJlLg0KPiA+ID4gPiA+IFll
cywgdGhlbiB3ZSBuZWVkIHRvIGFkZCBhbGwgc252cyBjbGsgaW4gZHRzIGZvciBvbiBsZWdhY3kg
aS5NWA0KPiA+ID4gPiA+IGNoaXBzIGluIHRoaXMgcGF0Y2hzZXQgdG8gYXZvaWQgYW55IHBvdGVu
dGlhbCBmdW5jdGlvbiBicm9rZW4uDQo+ID4gPg0KPiA+ID4gSG93IG1hbnkgYXJlIHRoZXJlPyBJ
IGFtIG5vdCB0b28gdGVycmlibHkgb3Bwb3NlZCBvZiBoYXZpbmcgdGhlDQo+ID4gPiBkcml2ZXIg
aGFuZGxlIG1pc3NpbmcgY2xrIGlmIHRoZXJlIGFyZSB2ZXJ5IG1hbnkgbGVnYWN5IERUU2VzIG91
dA0KPiA+ID4gdGhlcmUuIEJ1dCB0aGVuIHdlIG5lZWQgdG8gaGFuZGxlIGl0IHByb3Blcmx5IChp
LmUuIGN1cnJlbnQNCj4gPiA+IGl0ZXJhdGlvbiBkb2VzIG5vdCBoYW5kbGUgcmVmZXJyYWwgcHJv
cGVybHkgZm9yIGV4YW1wbGUpLg0KPiA+IFRoZXJlIGFyZSBmb3VyIGR0c2kgd2hpY2ggaGF2ZSBj
bG9jayBzdXBwb3J0IGluIHNudnMtcnRjICBpbmNsdWRpbmcNCj4gPiBpLm14N3MvaS5teDhtcS84
bW0vOG1uLiBTbyBmb3IgdGhpcyBwYXRjaCBzZXQsIGl0J3MgYmV0dGVyIHVwZGF0ZQ0KPiA+IGku
bXg4bVggZHRzaSBleGNlcHQgaS5teDdzLg0KPiA+ID4gPiBJbiB0aGF0IGNhc2UgdGhlIERUIGJp
bmRpbmcgc2hvdWxkIGJlIHVwZGF0ZWQgdG9vLCB0byBtYWtlIHRoZQ0KPiA+ID4gPiBjbG9jayBt
YW5kYXRvcnkuDQo+ID4gPg0KPiA+ID4gSSB0aGluayB0aGlzIHNob3VsZCBiZSBkb25lIGluIGVp
dGhlciBjYXNlLCBhcyBhcyBmYXIgSSB1bmRlcnN0YW5kDQo+ID4gPiB0aGUgcGFydCBjYW4gbm90
IGZ1bmN0aW9uIHdpdGhvdXQgdGhlIGNsb2NrIGFuZCBpdCB3b3JrZWQgcHVyZWx5IGJ5DQo+ID4g
PiBjaGFuY2Ugb24gc29tZSBzeXN0ZW1zIGFzIHNvbWV0aGluZyBlbHNlIHdhcyB0dXJuaW5nIHRo
ZSBjbG9jayBvbi4NCj4gPiBZZXMsIGZvciBhbGwgY2hpcHMgc252cyBjbGsgbWFuYWdlbWVudCBh
ZGRlZCwgc252cyBjbG9jayBhbHNvIGhhcyB0bw0KPiA+IGJlZW4gYWRkIGluIHNudnNfcHdya2V5
IGR0cywgYnV0IGZvciBvdGhlcnMgbGVnYWN5IGNoaXBzIGxpa2UgaS5teDZYDQo+ID4gd2hpY2gg
aGF2ZSBubyBzbnZzIGNsayBtYW5hZ2VtZW50LCBzbnZzIGNsb2NrIGlzIGFsd2F5cyBvbiwgc28g
bm8gbmVlZA0KPiA+IHN1Y2ggY2xrIGluIHNudnNfcHdya2V5IGR0cyBlaXRoZXIsIG9wdGlvbmFs
IGlzIGJldHRlci4NCj4gPiA+IFRoYW5rcy4NCj4gDQo+IEl0IHNlZW1zIHRvIG1lIHRob3VnaCB0
aGF0IHRoZSBjbG9jayBzaG91bGQgcmVhbGx5IGJlIG1vdmVkIGludG8gdGhlIChwYXJlbnQpDQo+
IFNOVlMgbm9kZSBpdHNlbGYsIHJhdGhlciB0aGFuIGR1cGxpY2F0aW5nIHRoZSBjbG9jayBpbiB0
aGUgdGhlIHBvd2VyIGtleSBub2RlDQo+IGFuZCBpbiB0aGUgUlRDIG5vZGUuIElzIHRoYXQgcG9z
c2libGU/IChJIGRvbid0IGtub3cpLi4uDQpUaGF0J3MgcG9zc2libGUgYnV0IG11Y2ggY29kZSBj
aGFuZ2VzIG5lZWQgdG8gYmUgYWRkZWQgaW50byBzbnZzLXJ0Yy9zbnZzX3B3cmtleQ0KZHJpdmVy
LiBJbmRlcGVuZGVudCBwYXRjaCBpcyBiZXR0ZXIuDQo+IA0KPiBUbyBzdW1tYXJpc2UsIEknbGwg
cG9zdCBhbiB1cGRhdGVkIHBhdGNoc2V0IHdpdGhpbiB0aGUgbmV4dCBjb3VwbGUgZGF5cyBzbyB0
bzoNCj4gDQo+ICoga2VlcCB0aGUgY2xvY2sgb3B0aW9uYWwgKGZvciBpLk1YNiBwbGF0Zm9ybXMp
DQo+ICogY29udmVydCB0byBkZXZtX2Nsa19nZXRfb3B0aW9uYWwoKQ0KPiAqIG9ubHkgZW5hYmxl
IHRoZSBjbG9jayBpbiBpbnRlcnJ1cHQgaGFuZGxlciBhbmQNCj4gaW14X2lteF9zbnZzX2NoZWNr
X2Zvcl9ldmVudHMoKQ0KPiAgIGJ1dCBub3QgZHVyaW5nIGRyaXZlciBsb2FkaW5nDQo+ICogdXBk
YXRlIGFsbCBmb3VyIERUU0lzOiBpbXg4bW0uZHRzaSBpbXg4bW4uZHRzaSBpbXg4bXEuZHRzaSBp
bXg3cy5kdHNpDQo+ICAgTm90ZSB0aGF0IEknbGwgb25seSBiZSBhYmxlIHRvIHRlc3Qgb25uIHRo
ZSBpLk1YNw0KQ29ycmVjdC4NCj4gDQo+IA0KPiBDaGVlcnMsDQo+IEFuZHJlJw0KPiANCg0K
