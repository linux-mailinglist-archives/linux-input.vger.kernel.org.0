Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6545C14AFFD
	for <lists+linux-input@lfdr.de>; Tue, 28 Jan 2020 08:02:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725822AbgA1HCc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 28 Jan 2020 02:02:32 -0500
Received: from mail-bn8nam11on2079.outbound.protection.outlook.com ([40.107.236.79]:64754
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725799AbgA1HCc (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 28 Jan 2020 02:02:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jKocenrh8S40cVT8jjkE3DfZmK4sMnyjFUJ7otCVYLeH83FTDMStrRi7FWptXOd9HCnh4cHnzewxReOtM4ZzWbWEpSroT/csrTotyjI/77bt6ZgrOPWAbGufr5QllsuXgSSTnKSv+ofQCXDEkJ7v0gOX8AvVGKSwfDRXduhhIPOnl8X0LIy0Uy/dDQ44rYf/RKhBmry036c1KgUjDHestrcYD2TZm6WIKR2fh5n0k1m0yu3iv1CpYtBeHYQFEDBu80dHz3AZ8ydh9URlOhYydSC8qp35rWr3QcAHA9Xsz18S/iBFC6f39Oj8WbQzmiDa/hbACTCbSZP3o9AV8qAToA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C0PdQUCDSX87LAxVl4XCmved4YpghHE1mw0vF+WntNw=;
 b=HGHsZuokKWaEyXOSQTvf3DizN4NsW3U4fqWhc3BYIDf4vZTfr6/oBr5Jcptd+x2Z4DLUbAODqRUeJ754qgz/VPR84lWyCmdcpYsCjKQr2lH6huIavVXc/oThByxx5tDycVrEWg8uZvjhf8/NiLenewtmxYi0xAeAmXx1nO/pxUIqRbWPBsOuSRwgp8bxplMPe/1msDQOsI1cah2gJGHZTQbfH64BCF5uBAeKS0075cZJ5J00bH+AWa3Mh3u/LJSLWxfcesuLFjxS2Ud1pkk7Y4PfIoFLCuGRxIcro7w7FxTwNvaTIAgdxTTTTc1JGKgVk73ugt+0HtiJZE4T4fBPkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C0PdQUCDSX87LAxVl4XCmved4YpghHE1mw0vF+WntNw=;
 b=Hm7hsuxxFGkqJkmZxeKk7UCD8tR1kh9XNzJ40HkcPV77M3sjPbCwoUnQCiF7M+ycdS2Qw5L3LY1xjJBfFj0UZ4O5c/GvBhxF7ZrlI8SuEbpSJWyJMq7VCFuCnhwMNNtIrCFu+2yk/qhp0W+5euwJwJCBS10b2YsKXZvykrjpOAg=
Received: from DM6PR03MB4713.namprd03.prod.outlook.com (20.179.71.209) by
 DM6PR03MB5353.namprd03.prod.outlook.com (10.186.143.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.20; Tue, 28 Jan 2020 07:02:28 +0000
Received: from DM6PR03MB4713.namprd03.prod.outlook.com
 ([fe80::415e:438a:ddc8:e90e]) by DM6PR03MB4713.namprd03.prod.outlook.com
 ([fe80::415e:438a:ddc8:e90e%6]) with mapi id 15.20.2665.026; Tue, 28 Jan 2020
 07:02:28 +0000
Received: from mastodon (166.171.250.97) by BYAPR08CA0037.namprd08.prod.outlook.com (2603:10b6:a03:117::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2665.20 via Frontend Transport; Tue, 28 Jan 2020 07:02:26 +0000
From:   Christopher Heiny <Cheiny@synaptics.com>
To:     Andrew Duggan <aduggan@synaptics.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lucas Stach <l.stach@pengutronix.de>
CC:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "patchwork-lst@pengutronix.de" <patchwork-lst@pengutronix.de>
Subject: Re: [PATCH] Input: synaptics-rmi4 - switch to reduced reporting mode
Thread-Topic: [PATCH] Input: synaptics-rmi4 - switch to reduced reporting mode
Thread-Index: AQHVz4MWwJyn9f/+jUmt8mxQJL0NZKf90t4AgAEb7ACAAMP3gA==
Date:   Tue, 28 Jan 2020 07:02:27 +0000
Message-ID: <23ecff7a48f801fcc18680fb6cb150e32fc3c858.camel@synaptics.com>
References: <20200120111628.18376-1-l.stach@pengutronix.de>
         <20200127022448.GC184237@dtor-ws>
         <b2ca3006-281a-c991-4c6c-7ae7ce5cc3f7@synaptics.com>
In-Reply-To: <b2ca3006-281a-c991-4c6c-7ae7ce5cc3f7@synaptics.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [166.171.250.97]
user-agent: Evolution 3.32.5 (3.32.5-1.fc30) 
x-clientproxiedby: BYAPR08CA0037.namprd08.prod.outlook.com
 (2603:10b6:a03:117::14) To DM6PR03MB4713.namprd03.prod.outlook.com
 (2603:10b6:5:15f::17)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Cheiny@synaptics.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 99d8f8a8-3bb3-4ad3-38fa-08d7a3c00911
x-ms-traffictypediagnostic: DM6PR03MB5353:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR03MB53530D2250CA29D649E9D352DD0A0@DM6PR03MB5353.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 029651C7A1
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(39850400004)(366004)(346002)(136003)(396003)(199004)(189003)(54906003)(53546011)(478600001)(186003)(52116002)(110136005)(16526019)(81166006)(8676002)(86362001)(2906002)(71200400001)(26005)(6496006)(36756003)(81156014)(2616005)(4326008)(8936002)(316002)(6486002)(956004)(66946007)(66556008)(66476007)(66446008)(64756008)(5660300002);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR03MB5353;H:DM6PR03MB4713.namprd03.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synaptics.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rrI/g3DNYmQFC7upENONSnCKmzzbMJdSrj+YdrFV97tG+lQSyrgY/lnjNTnqfTc50rmXAviqog0NOceGd0ohqfbgXUZNYmrpHlZBB4VXxmeTf2MPXLNQehvHirvy/UpcN4HmrYm+AGXiRR1iMmPXt6jWZwTqk1lbRp49Bs1u3xIjQqa/13oGxkoRkWyALN962A9i9NIso+fn2rsgWkWNdzSruJnX8tMGNVDH9eORC36v2ePXMf3gGvYJJ1S/8PyYtRcu5WllzEwkkvhBjhdzc4bCJmzve8JiFqB93BGDMczIUlmTXhuCXZN/WVAz7C6kn516lOKa4zRxiNiokPODPaasa339k6oFVG4/rkFMbMRVY4c1qc6AHCvy8m3/pf+fEera3d2RDIFbwD+rcUR3NvM2ccFmww4cq0bC8NtjXu5c7aSYM8b2nqyO2zxasgfT
x-ms-exchange-antispam-messagedata: wPcMMEv/U7XLwHu3+B89I+cFAWUJYnJn7AqfNrX+NJqXKYJOVAyS7sy4zUuY5MZ61mioxal+Q6iaqlj7Dfz3BbZ63v74VqWAzw5cPxysS3ETlsckkY2VV9IEv8O4aODTgaRdry31oPTAP3RLfZeU0g==
Content-Type: text/plain; charset="utf-8"
Content-ID: <0BF7533F4D0D9E46BFEF11AAB50E2117@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99d8f8a8-3bb3-4ad3-38fa-08d7a3c00911
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2020 07:02:28.1923
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QYe+xbwhBEMWJTOHeAEOSF4linlKOeI1bCzGNe3nQO+5mJKN+I9H6OL7WbIh/1vzbhI6XtBc/D2WS5h1afqjoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5353
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

T24gTW9uLCAyMDIwLTAxLTI3IGF0IDExOjIxIC0wODAwLCBBbmRyZXcgRHVnZ2FuIHdyb3RlOg0K
PiBIaSBEbWl0cnksDQo+IA0KPiBPbiAxLzI2LzIwIDY6MjQgUE0sIERtaXRyeSBUb3Jva2hvdiB3
cm90ZToNCj4gPiANCj4gPiBPbiBNb24sIEphbiAyMCwgMjAyMCBhdCAxMjoxNjoyOFBNICswMTAw
LCBMdWNhcyBTdGFjaCB3cm90ZToNCj4gPiA+IFdoZW4gdGhlIGRpc3RhbmNlIHRocmVzaG9sZHMg
YXJlIHNldCB0aGUgY29udHJvbGxlciBtdXN0IGJlIGluDQo+ID4gPiByZWR1Y2VkDQo+ID4gPiBy
ZXBvcnRpbmcgbW9kZSBmb3IgdGhlbSB0byBoYXZlIGFueSBlZmZlY3Qgb24gdGhlIGludGVycnVw
dA0KPiA+ID4gZ2VuZXJhdGlvbi4NCj4gPiA+IFRoaXMgaGFzIGEgcG90ZW50aWFsbHkgbGFyZ2Ug
aW1wYWN0IG9uIHRoZSBudW1iZXIgb2YgZXZlbnRzIHRoZQ0KPiA+ID4gaG9zdA0KPiA+ID4gbmVl
ZHMgdG8gcHJvY2Vzcy4NCj4gPiA+IA0KPiA+ID4gU2lnbmVkLW9mZi1ieTogTHVjYXMgU3RhY2gg
PGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU+DQo+ID4gPiAtLS0NCj4gPiA+IEknbSBub3Qgc3VyZSBp
ZiB3ZSB3YW50IGEgc2VwYXJhdGUgRFQgcHJvcGVydHkgdG8gYWxsb3cgdGhlIHVzZQ0KPiA+ID4g
b2YNCj4gPiA+IHJlZHVjZWQgcmVwb3J0aW5nIG1vZGUsIGFzIHRoaXMgY2hhbmdlIG1pZ2h0IGxl
YWQgdG8gcHJvYmxlbXMgZm9yDQo+ID4gPiBjb250cm9sbGVycyB3aXRoIHVucmVhc29uYWJseSBs
YXJnZSB0aHJlc2hvbGQgdmFsdWVzLiBJJ20gbm90DQo+ID4gPiBzdXJlIGlmDQo+ID4gPiBhbnkg
Y29udHJvbGxlciB3aXRoIGJvZ3VzIHRocmVzaG9sZCB2YWx1ZXMgZXhpc3QgaW4gdGhlIHdpbGQu
DQo+ID4gPiAtLS0NCj4gPiBBbmRyZXcsIGFueSBmZWVkYmFjayBvbiB0aGlzIHBhdGNoPw0KPiA+
IA0KPiA+IFRoYW5rcyENCj4gDQo+IFRoZSBSTUk0IHNwZWMgZG9lcyBzYXkgdGhhdCBkZWx0YSBY
L1kgdGhyZXNob2xkcyBhcmUgb25seSB1c2VkIGluIA0KPiByZWR1Y2VkIHJlcG9ydGluZyBtb2Rl
LCBzbyB0aGlzIHBhdGNoIGlzIG5lZWRlZCBmb3IgdGhlIHRocmVzaG9sZA0KPiB2YWx1ZXMgDQo+
IHRvIGhhdmUgYW4gZWZmZWN0Lg0KPiANCj4gUmV2aWV3ZWQtYnk6IEFuZHJldyBEdWdnYW4gPGFk
dWdnYW5Ac3luYXB0aWNzLmNvbT4NCj4gDQo+IEJlY2F1c2UgcmVkdWNlZCByZXBvcnRpbmcgbW9k
ZSBpcyBzbyBkZXBlbmRlbnQgb24gdGhlc2UgdGhyZXNob2xkcywNCj4gbXkgDQo+IG9waW5pb24g
aXMgdGhhdCBpdCBpcyBiZXR0ZXIgbm90IHRvIGFkZCBhIHNlcGFyYXRlIERUIHByb3BlcnR5LCBi
dXQNCj4gdG8gDQo+IGluc3RlYWQgY29udHJvbCByZWR1Y2VkIHJlcG9ydGluZyBtb2RlIHRocm91
Z2ggdGhlIHNldHRpbmcgb2YgdGhlc2UgDQo+IHRocmVzaG9sZHMuIE15IGd1ZXNzIGlzIHRoYXQg
dGhlIGlmIHJlZHVjZWQgcmVwb3J0aW5nIGlzIG5vdCBlbmFibGVkDQo+IGluIA0KPiB0aGUgZmly
bXdhcmUgYnkgZGVmYXVsdCwgdGhlbiB0aGUgdGhyZXNob2xkcyBtYXkgbm90IGJlIHZhbGlkLg0K
PiBTZXR0aW5nIA0KPiB0aGUgdGhyZXNob2xkcyB0byAwIHdpbGwgZXNzZW50aWFsbHkgZGlzYWJs
ZSByZWR1Y2VkIHJlcG9ydGluZyBtb2RlLg0KPiBTbyANCj4gdGhhdCB3b3VsZCBiZSBob3cgYSB1
c2VyIGNvdWxkIGRpc2FibGUgcmVkdWNlZCByZXBvcnRpbmcgbW9kZSB3aXRob3V0DQo+IGEgDQo+
IHNlcGFyYXRlIERUIHByb3BlcnR5LiBDaHJpcywgZG8geW91IGhhdmUgYW4gb3BpbmlvbiBvbiB0
aGlzPyBBbnl0aGluZw0KPiBJIA0KPiBvdmVybG9va2VkPw0KDQpIaSBEbWl0cnksIEFuZHJldywg
THVjYXMsDQoNCkknbSBpbiBhZ3JlZW1lbnQgd2l0aCBBbmRyZXcgb24gdGhpcy4gIEhhdmluZyB0
d28gd2F5cyB0bw0KZW5hYmxlL2Rpc2FibGUgcmVkdWNlZCByZXBvcnRpbmcgKHRoYXQgaXMsIGJv
dGggdGhlIERUIHByb3BlcnR5IGFuZCB0aGUNCnRocmVzaG9sZHMpIGNvdWxkIGxlYWQgdG8gY29u
ZnVzaW9uIGFuZCB1bmV4cGVjdGVkIGJlaGF2aW9yLiAgU2ltcGxlcg0KaXMgYmV0dGVyLCBpbiBt
eSBvcGluaW9uLg0KDQpIb3dldmVyLCBpbiB0aGF0IGNhc2UgSSdtIGEgbGl0dGxlIGNvbmNlcm5l
ZCBhYm91dCB0aGUgbG9naWMgaW4gdGhlDQpwYXRjaCBiZWxvdy4gIFdoZW4gZWl0aGVyIG9mIHRo
ZSB0aHJlc2hvbGRzIGFyZSBzZXQgdG8gbm9uLXplcm8sIHdlDQpjbGVhciB0aGUgcmVwb3J0IG1h
c2sgYW5kIHRoZW4gZW5hYmxlIHRoZSByZWR1Y2VkIHJlcG9ydGluZyBiaXQuIA0KU3Vic2VxdWVu
dGx5IHNldHRpbmcgYm90aCB0aHJlc2hvbGRzIHRvIHplcm8gd2lsbCBkaXNhYmxlIHJlZHVjZWQN
CnJlcG9ydGluZywgYnV0IHdpbGwgbm90IGVuYWJsZSBhbm90aGVyIHJlcG9ydCBtb2RlLiAgVW5s
ZXNzIHRoZXJlIGlzDQpjb2RlIGVsc2V3aGVyZSB0byBjYXRjaCB0aGlzIGNhc2UgKGFuZCBpZiB0
aGVyZSBpcywgaXQgc2VlbXMgbGlrZSBhIGJhZA0KaWRlYSB0byBiZSBoYW5kbGluZyB0aGlzIGlu
IHR3byBkaWZmZXJlbnQgcGxhY2VzKSwgaXQgY291bGQgcmVzdWx0IGluDQp0aGUgdG91Y2hwYWQg
YmVpbmcgZGlzYWJsZWQuDQoNCkFzIGEgaHlwb3RoZXRpY2FsIGluc3RhbmNlIG9mIHRoaXMsIGlt
YWdpbmUgYSB1c2VyIHVzaW5nIHRoZSB0b3VjaHBhZA0KdG8gbWFuaXB1bGF0ZSByZXBvcnQgdGhy
ZXNob2xkIHNsaWRlcnMgaW4gYSBHVUkuICBTZXR0aW5nIGJvdGggc2xpZGVycw0KdG8gemVybyB3
b3VsZCBkaXNhYmxlIHRoZSB0b3VjaCBzZW5zb3IgcmVwb3J0aW5nLCBwb3RlbnRpYWxseSBsZWF2
aW5nDQp0aGUgdXNlciB3aXRoIGEgZGVhZCB0b3VjaCBzZW5zb3IgYW5kIG5vIGVhc3kgd2F5IHRv
IHJlY292ZXIgZnJvbSB0aGF0Lg0KDQoJCQkJCUNoZWVycywNCgkJCQkJCUNocmlzDQoNCj4gDQo+
IEFuZHJldw0KPiANCj4gPiA+ICAgZHJpdmVycy9pbnB1dC9ybWk0L3JtaV9mMTEuYyB8IDE0ICsr
KysrKysrKysrKysrDQo+ID4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspDQo+
ID4gPiANCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lucHV0L3JtaTQvcm1pX2YxMS5jDQo+
ID4gPiBiL2RyaXZlcnMvaW5wdXQvcm1pNC9ybWlfZjExLmMNCj4gPiA+IGluZGV4IGJiZjlhZTlm
M2YwYy4uNmFkZWE4YTNlOGZiIDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9pbnB1dC9ybWk0
L3JtaV9mMTEuYw0KPiA+ID4gKysrIGIvZHJpdmVycy9pbnB1dC9ybWk0L3JtaV9mMTEuYw0KPiA+
ID4gQEAgLTQxMiw2ICs0MTIsMTAgQEAgc3RydWN0IGYxMV8yZF9zZW5zb3JfcXVlcmllcyB7DQo+
ID4gPiANCj4gPiA+ICAgLyogRGVmcyBmb3IgQ3RybDAuICovDQo+ID4gPiAgICNkZWZpbmUgUk1J
X0YxMV9SRVBPUlRfTU9ERV9NQVNLICAgICAgICAweDA3DQo+ID4gPiArI2RlZmluZSBSTUlfRjEx
X1JFUE9SVF9NT0RFX0NPTlRJTlVPVVMgICgwIDw8IDApDQo+ID4gPiArI2RlZmluZSBSTUlfRjEx
X1JFUE9SVF9NT0RFX1JFRFVDRUQgICAgICgxIDw8IDApDQo+ID4gPiArI2RlZmluZSBSTUlfRjEx
X1JFUE9SVF9NT0RFX0ZTX0NIQU5HRSAgICgyIDw8IDApDQo+ID4gPiArI2RlZmluZSBSTUlfRjEx
X1JFUE9SVF9NT0RFX0ZQX0NIQU5HRSAgICgzIDw8IDApDQo+ID4gPiAgICNkZWZpbmUgUk1JX0Yx
MV9BQlNfUE9TX0ZJTFQgICAgICAgICAgICAoMSA8PCAzKQ0KPiA+ID4gICAjZGVmaW5lIFJNSV9G
MTFfUkVMX1BPU19GSUxUICAgICAgICAgICAgKDEgPDwgNCkNCj4gPiA+ICAgI2RlZmluZSBSTUlf
RjExX1JFTF9CQUxMSVNUSUNTICAgICAgICAgICgxIDw8IDUpDQo+ID4gPiBAQCAtMTE5NSw2ICsx
MTk5LDE2IEBAIHN0YXRpYyBpbnQgcm1pX2YxMV9pbml0aWFsaXplKHN0cnVjdA0KPiA+ID4gcm1p
X2Z1bmN0aW9uICpmbikNCj4gPiA+ICAgICAgICAgICAgICAgIGN0cmwtPmN0cmwwXzExW1JNSV9G
MTFfREVMVEFfWV9USFJFU0hPTERdID0NCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgc2Vu
c29yLT5heGlzX2FsaWduLmRlbHRhX3lfdGhyZXNob2xkOw0KPiA+ID4gDQo+ID4gPiArICAgICAv
Kg0KPiA+ID4gKyAgICAgICogSWYgZGlzdGFuY2UgdGhyZXNob2xkIHZhbHVlcyBhcmUgc2V0LCBz
d2l0Y2ggdG8gcmVkdWNlZA0KPiA+ID4gcmVwb3J0aW5nDQo+ID4gPiArICAgICAgKiBtb2RlIHNv
IHRoZXkgYWN0dWFsbHkgZ2V0IHVzZWQgYnkgdGhlIGNvbnRyb2xsZXIuDQo+ID4gPiArICAgICAg
Ki8NCj4gPiA+ICsgICAgIGlmIChjdHJsLT5jdHJsMF8xMVtSTUlfRjExX0RFTFRBX1hfVEhSRVNI
T0xEXSB8fA0KPiA+ID4gKyAgICAgICAgIGN0cmwtPmN0cmwwXzExW1JNSV9GMTFfREVMVEFfWV9U
SFJFU0hPTERdKSB7DQo+ID4gPiArICAgICAgICAgICAgIGN0cmwtPmN0cmwwXzExWzBdICY9IH5S
TUlfRjExX1JFUE9SVF9NT0RFX01BU0s7DQo+ID4gPiArICAgICAgICAgICAgIGN0cmwtPmN0cmww
XzExWzBdIHw9IFJNSV9GMTFfUkVQT1JUX01PREVfUkVEVUNFRDsNCj4gPiA+ICsgICAgIH0NCj4g
PiA+ICsNCj4gPiA+ICAgICAgICBpZiAoZjExLT5zZW5zX3F1ZXJ5Lmhhc19kcmliYmxlKSB7DQo+
ID4gPiAgICAgICAgICAgICAgICBzd2l0Y2ggKHNlbnNvci0+ZHJpYmJsZSkgew0KPiA+ID4gICAg
ICAgICAgICAgICAgY2FzZSBSTUlfUkVHX1NUQVRFX09GRjoNCj4gPiA+IC0tDQo+ID4gPiAyLjIw
LjENCj4gPiA+IA0KPiA+IC0tDQo+ID4gRG1pdHJ5DQoNCg0K
