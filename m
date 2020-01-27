Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 406DB14AA62
	for <lists+linux-input@lfdr.de>; Mon, 27 Jan 2020 20:21:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725975AbgA0TVV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 Jan 2020 14:21:21 -0500
Received: from mail-bn7nam10on2075.outbound.protection.outlook.com ([40.107.92.75]:30913
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725938AbgA0TVV (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 Jan 2020 14:21:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ljqMGt6YS5Ou2y+RXjXemSme/WTxlc9IcN0w66nwAzsFgj8Gj6gagQXzTEmtVJGPpi1LHi6QNxCeEP4fpLlkCg3/vIlNbVvWZFUF+ysyF0zcJP03HYMVdaCVat/tmCAOF74mGcpi7p8VSW+0p5lfFrRhgbDS2OnV9e5lCIdSQT1x20FScAmg/r4FLfHMW4eZYlSEzt8VEEoNiDDlsLOVYmFRGh6aVnsW3Q2fT4it1OPVF3bqOZuudN1oqTjR9VIsQMsRDNFsSNN4Ids+t37RyTFFn2mRqX5mu48xOiFwJm17kEmCCMs4LzmEU6/WQQGZdNS7sHNuDFl1fclhWVSWDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rgdj1Lgytzh2E4FRqCJYGLopQr+uXydtB4Ae36pbDGo=;
 b=HPkz9M/PACybHdE0VLDSvg9v+JKyz8fNyrtTPRkNjs+elCwu/fvB6caKJ3Fx7FVjPQnKteEYAc1HkLR0xrVauW3Sr0pGemqNMI7lGs3sDCVE8a6Dep3W1pW4bCWYTt25etcE37y+nSUcywILiaQ23Mmhru1U2hJNiY4m7JgRZMFNVsNaphZBh6AeYRThzhUN+mg/ts+NH8ouAm2h01rmDXXWDWxJZqgjyoTMSLAhA8uABAVjS1QQnxrNhI5KMHBNTFaw7ni3kdtWCB4VqlUtxNiuC0T4jCASD9fHaZSWuMbhnNFz84c3jQYcBHULfwOKS6c0z+BbXlJRKzhe6l+BCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rgdj1Lgytzh2E4FRqCJYGLopQr+uXydtB4Ae36pbDGo=;
 b=ZpBc4y9cMq8UCcqQK8NVIwhwbCA3BSQfiTGkUpe9k+VkbxZANXQqxWm+3ih7TGAwExqjz3mBuzhCibDGOSucL3GKmr60s3SHPsVtiJGbFvmOzA1nTQBoZfAW/zfAIa3msb4sU0rHePGpHWKBE0McaPUQ604lwBWzkFQDhgtCTcQ=
Received: from BYAPR03MB4135.namprd03.prod.outlook.com (20.177.127.85) by
 BYAPR03MB4344.namprd03.prod.outlook.com (20.178.49.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.20; Mon, 27 Jan 2020 19:21:18 +0000
Received: from BYAPR03MB4135.namprd03.prod.outlook.com
 ([fe80::64aa:faa8:c503:302d]) by BYAPR03MB4135.namprd03.prod.outlook.com
 ([fe80::64aa:faa8:c503:302d%5]) with mapi id 15.20.2665.026; Mon, 27 Jan 2020
 19:21:18 +0000
Received: from [10.1.10.74] (192.147.44.15) by BYAPR05CA0042.namprd05.prod.outlook.com (2603:10b6:a03:74::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2686.21 via Frontend Transport; Mon, 27 Jan 2020 19:21:17 +0000
From:   Andrew Duggan <aduggan@synaptics.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Christopher Heiny <Cheiny@synaptics.com>
CC:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "patchwork-lst@pengutronix.de" <patchwork-lst@pengutronix.de>
Subject: Re: [PATCH] Input: synaptics-rmi4 - switch to reduced reporting mode
Thread-Topic: [PATCH] Input: synaptics-rmi4 - switch to reduced reporting mode
Thread-Index: AQHVz4MWwJyn9f/+jUmt8mxQJL0NZKf90t4AgAEb7AA=
Date:   Mon, 27 Jan 2020 19:21:17 +0000
Message-ID: <b2ca3006-281a-c991-4c6c-7ae7ce5cc3f7@synaptics.com>
References: <20200120111628.18376-1-l.stach@pengutronix.de>
 <20200127022448.GC184237@dtor-ws>
In-Reply-To: <20200127022448.GC184237@dtor-ws>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.147.44.15]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-clientproxiedby: BYAPR05CA0042.namprd05.prod.outlook.com
 (2603:10b6:a03:74::19) To BYAPR03MB4135.namprd03.prod.outlook.com
 (2603:10b6:a03:77::21)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aduggan@synaptics.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a8ed7eec-b520-4aae-9d57-08d7a35e1571
x-ms-traffictypediagnostic: BYAPR03MB4344:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR03MB434424A2EA78A4ABC7BD0215B20B0@BYAPR03MB4344.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 02951C14DC
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(39850400004)(346002)(396003)(376002)(366004)(189003)(199004)(2906002)(6636002)(36756003)(478600001)(54906003)(110136005)(16526019)(4326008)(53546011)(316002)(186003)(31686004)(52116002)(16576012)(6486002)(26005)(81156014)(81166006)(8676002)(956004)(5660300002)(8936002)(2616005)(66476007)(71200400001)(66946007)(66556008)(64756008)(66446008)(31696002)(86362001);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR03MB4344;H:BYAPR03MB4135.namprd03.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: synaptics.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QKSFguL6jJtMCB0l/M0GcicPW7jpUup+7TfwhyPwERVQOZm0AMKAZd1baQ8rmsIxRaCdlooh2q6nKj2pL9sgbPcTkp74OTy+twXQtPCiS/7b8TM/QTKg8N5cxkhuPiWFKW7mm1A77i+TCdpRgjaeWnv6Bk9idcXk5dUkLeC7n5Yuwmw6eb/enDUn+dNX4Y8YIR9A47uxQkxqJWZN95/Gf0Vfc67EngGnlFKvjJy11bC1zOXbDvCEFMNJ9EpHOCw48ML454bRiv+5qbNfcfq+/TyZuIWhHqlaVcyAZpsAV+Yc5wXccR2WFwzgeb72L3HeFqgaFR3Ca1grHC+gJYeCbNwtG4tHaBysoEcxDPva4oj2agqHWo/0H1CENcTzVUO2nTVM/+JMFXeA0GFe3v5/yV9AHy1JuQcZZWj3kys9Jxyyolg5AASFVUguf4pp3r5D
x-ms-exchange-antispam-messagedata: SXjG01OrdcjQx738c8XTLKKnwb8DOSiW/SwSpKumYg5TvHhVs1nMRl1yB4u5D4ofA+wJuX8iynOwWkDxpkORna4EMmM0OtOlEolz6rYi7fb7F189lXwWjJW0KlNKZJBgFYkI3xrMatA+c981wYcCXQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <4033254A937C06448BD8B01B576E264B@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8ed7eec-b520-4aae-9d57-08d7a35e1571
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2020 19:21:17.9884
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EI74w6cQGF4aI/jWFNXSEy6FDfA7tEzk9wktnfSyDRvwFCa++m1xbu4n532po0iDIpQ0Xnqj9Jpkhnys0lYCQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4344
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

SGkgRG1pdHJ5LA0KDQpPbiAxLzI2LzIwIDY6MjQgUE0sIERtaXRyeSBUb3Jva2hvdiB3cm90ZToN
Cj4gQ0FVVElPTjogRW1haWwgb3JpZ2luYXRlZCBleHRlcm5hbGx5LCBkbyBub3QgY2xpY2sgbGlu
a3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IHJlY29nbml6ZSB0aGUgc2VuZGVyIGFu
ZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuDQo+DQo+DQo+IE9uIE1vbiwgSmFuIDIwLCAyMDIw
IGF0IDEyOjE2OjI4UE0gKzAxMDAsIEx1Y2FzIFN0YWNoIHdyb3RlOg0KPj4gV2hlbiB0aGUgZGlz
dGFuY2UgdGhyZXNob2xkcyBhcmUgc2V0IHRoZSBjb250cm9sbGVyIG11c3QgYmUgaW4gcmVkdWNl
ZA0KPj4gcmVwb3J0aW5nIG1vZGUgZm9yIHRoZW0gdG8gaGF2ZSBhbnkgZWZmZWN0IG9uIHRoZSBp
bnRlcnJ1cHQgZ2VuZXJhdGlvbi4NCj4+IFRoaXMgaGFzIGEgcG90ZW50aWFsbHkgbGFyZ2UgaW1w
YWN0IG9uIHRoZSBudW1iZXIgb2YgZXZlbnRzIHRoZSBob3N0DQo+PiBuZWVkcyB0byBwcm9jZXNz
Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4
LmRlPg0KPj4gLS0tDQo+PiBJJ20gbm90IHN1cmUgaWYgd2Ugd2FudCBhIHNlcGFyYXRlIERUIHBy
b3BlcnR5IHRvIGFsbG93IHRoZSB1c2Ugb2YNCj4+IHJlZHVjZWQgcmVwb3J0aW5nIG1vZGUsIGFz
IHRoaXMgY2hhbmdlIG1pZ2h0IGxlYWQgdG8gcHJvYmxlbXMgZm9yDQo+PiBjb250cm9sbGVycyB3
aXRoIHVucmVhc29uYWJseSBsYXJnZSB0aHJlc2hvbGQgdmFsdWVzLiBJJ20gbm90IHN1cmUgaWYN
Cj4+IGFueSBjb250cm9sbGVyIHdpdGggYm9ndXMgdGhyZXNob2xkIHZhbHVlcyBleGlzdCBpbiB0
aGUgd2lsZC4NCj4+IC0tLQ0KPiBBbmRyZXcsIGFueSBmZWVkYmFjayBvbiB0aGlzIHBhdGNoPw0K
Pg0KPiBUaGFua3MhDQoNClRoZSBSTUk0IHNwZWMgZG9lcyBzYXkgdGhhdCBkZWx0YSBYL1kgdGhy
ZXNob2xkcyBhcmUgb25seSB1c2VkIGluIA0KcmVkdWNlZCByZXBvcnRpbmcgbW9kZSwgc28gdGhp
cyBwYXRjaCBpcyBuZWVkZWQgZm9yIHRoZSB0aHJlc2hvbGQgdmFsdWVzIA0KdG8gaGF2ZSBhbiBl
ZmZlY3QuDQoNClJldmlld2VkLWJ5OiBBbmRyZXcgRHVnZ2FuIDxhZHVnZ2FuQHN5bmFwdGljcy5j
b20+DQoNCkJlY2F1c2UgcmVkdWNlZCByZXBvcnRpbmcgbW9kZSBpcyBzbyBkZXBlbmRlbnQgb24g
dGhlc2UgdGhyZXNob2xkcywgbXkgDQpvcGluaW9uIGlzIHRoYXQgaXQgaXMgYmV0dGVyIG5vdCB0
byBhZGQgYSBzZXBhcmF0ZSBEVCBwcm9wZXJ0eSwgYnV0IHRvIA0KaW5zdGVhZCBjb250cm9sIHJl
ZHVjZWQgcmVwb3J0aW5nIG1vZGUgdGhyb3VnaCB0aGUgc2V0dGluZyBvZiB0aGVzZSANCnRocmVz
aG9sZHMuIE15IGd1ZXNzIGlzIHRoYXQgdGhlIGlmIHJlZHVjZWQgcmVwb3J0aW5nIGlzIG5vdCBl
bmFibGVkIGluIA0KdGhlIGZpcm13YXJlIGJ5IGRlZmF1bHQsIHRoZW4gdGhlIHRocmVzaG9sZHMg
bWF5IG5vdCBiZSB2YWxpZC4gU2V0dGluZyANCnRoZSB0aHJlc2hvbGRzIHRvIDAgd2lsbCBlc3Nl
bnRpYWxseSBkaXNhYmxlIHJlZHVjZWQgcmVwb3J0aW5nIG1vZGUuIFNvIA0KdGhhdCB3b3VsZCBi
ZSBob3cgYSB1c2VyIGNvdWxkIGRpc2FibGUgcmVkdWNlZCByZXBvcnRpbmcgbW9kZSB3aXRob3V0
IGEgDQpzZXBhcmF0ZSBEVCBwcm9wZXJ0eS4gQ2hyaXMsIGRvIHlvdSBoYXZlIGFuIG9waW5pb24g
b24gdGhpcz8gQW55dGhpbmcgSSANCm92ZXJsb29rZWQ/DQoNCkFuZHJldw0KDQo+PiAgIGRyaXZl
cnMvaW5wdXQvcm1pNC9ybWlfZjExLmMgfCAxNCArKysrKysrKysrKysrKw0KPj4gICAxIGZpbGUg
Y2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lu
cHV0L3JtaTQvcm1pX2YxMS5jIGIvZHJpdmVycy9pbnB1dC9ybWk0L3JtaV9mMTEuYw0KPj4gaW5k
ZXggYmJmOWFlOWYzZjBjLi42YWRlYThhM2U4ZmIgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2lu
cHV0L3JtaTQvcm1pX2YxMS5jDQo+PiArKysgYi9kcml2ZXJzL2lucHV0L3JtaTQvcm1pX2YxMS5j
DQo+PiBAQCAtNDEyLDYgKzQxMiwxMCBAQCBzdHJ1Y3QgZjExXzJkX3NlbnNvcl9xdWVyaWVzIHsN
Cj4+DQo+PiAgIC8qIERlZnMgZm9yIEN0cmwwLiAqLw0KPj4gICAjZGVmaW5lIFJNSV9GMTFfUkVQ
T1JUX01PREVfTUFTSyAgICAgICAgMHgwNw0KPj4gKyNkZWZpbmUgUk1JX0YxMV9SRVBPUlRfTU9E
RV9DT05USU5VT1VTICAoMCA8PCAwKQ0KPj4gKyNkZWZpbmUgUk1JX0YxMV9SRVBPUlRfTU9ERV9S
RURVQ0VEICAgICAoMSA8PCAwKQ0KPj4gKyNkZWZpbmUgUk1JX0YxMV9SRVBPUlRfTU9ERV9GU19D
SEFOR0UgICAoMiA8PCAwKQ0KPj4gKyNkZWZpbmUgUk1JX0YxMV9SRVBPUlRfTU9ERV9GUF9DSEFO
R0UgICAoMyA8PCAwKQ0KPj4gICAjZGVmaW5lIFJNSV9GMTFfQUJTX1BPU19GSUxUICAgICAgICAg
ICAgKDEgPDwgMykNCj4+ICAgI2RlZmluZSBSTUlfRjExX1JFTF9QT1NfRklMVCAgICAgICAgICAg
ICgxIDw8IDQpDQo+PiAgICNkZWZpbmUgUk1JX0YxMV9SRUxfQkFMTElTVElDUyAgICAgICAgICAo
MSA8PCA1KQ0KPj4gQEAgLTExOTUsNiArMTE5OSwxNiBAQCBzdGF0aWMgaW50IHJtaV9mMTFfaW5p
dGlhbGl6ZShzdHJ1Y3Qgcm1pX2Z1bmN0aW9uICpmbikNCj4+ICAgICAgICAgICAgICAgIGN0cmwt
PmN0cmwwXzExW1JNSV9GMTFfREVMVEFfWV9USFJFU0hPTERdID0NCj4+ICAgICAgICAgICAgICAg
ICAgICAgICAgc2Vuc29yLT5heGlzX2FsaWduLmRlbHRhX3lfdGhyZXNob2xkOw0KPj4NCj4+ICsg
ICAgIC8qDQo+PiArICAgICAgKiBJZiBkaXN0YW5jZSB0aHJlc2hvbGQgdmFsdWVzIGFyZSBzZXQs
IHN3aXRjaCB0byByZWR1Y2VkIHJlcG9ydGluZw0KPj4gKyAgICAgICogbW9kZSBzbyB0aGV5IGFj
dHVhbGx5IGdldCB1c2VkIGJ5IHRoZSBjb250cm9sbGVyLg0KPj4gKyAgICAgICovDQo+PiArICAg
ICBpZiAoY3RybC0+Y3RybDBfMTFbUk1JX0YxMV9ERUxUQV9YX1RIUkVTSE9MRF0gfHwNCj4+ICsg
ICAgICAgICBjdHJsLT5jdHJsMF8xMVtSTUlfRjExX0RFTFRBX1lfVEhSRVNIT0xEXSkgew0KPj4g
KyAgICAgICAgICAgICBjdHJsLT5jdHJsMF8xMVswXSAmPSB+Uk1JX0YxMV9SRVBPUlRfTU9ERV9N
QVNLOw0KPj4gKyAgICAgICAgICAgICBjdHJsLT5jdHJsMF8xMVswXSB8PSBSTUlfRjExX1JFUE9S
VF9NT0RFX1JFRFVDRUQ7DQo+PiArICAgICB9DQo+PiArDQo+PiAgICAgICAgaWYgKGYxMS0+c2Vu
c19xdWVyeS5oYXNfZHJpYmJsZSkgew0KPj4gICAgICAgICAgICAgICAgc3dpdGNoIChzZW5zb3It
PmRyaWJibGUpIHsNCj4+ICAgICAgICAgICAgICAgIGNhc2UgUk1JX1JFR19TVEFURV9PRkY6DQo+
PiAtLQ0KPj4gMi4yMC4xDQo+Pg0KPiAtLQ0KPiBEbWl0cnkNCg==
