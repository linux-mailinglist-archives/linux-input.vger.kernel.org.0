Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0A522A0045
	for <lists+linux-input@lfdr.de>; Fri, 30 Oct 2020 09:45:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725888AbgJ3Ip2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 30 Oct 2020 04:45:28 -0400
Received: from mail-am6eur05on2085.outbound.protection.outlook.com ([40.107.22.85]:35649
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725355AbgJ3Ip2 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 30 Oct 2020 04:45:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FC7lCsleATvxNHeAgJS2PDOgfQBXxCnUwb50DgRlokSLmmWTLoxtrNvJ4hvOPU7Tjtm00ktwpkptEqHpb/1nwTgsQFUmThMGd2dqILr6/emxegCnSa/PbvOIJzdgVpiydLcUYaXBJHFaEoS7cbOsjOLqTAnwtOH/XTaUlZEzFWm+Vz8sWzUlFRhNPteznEwnFGu+BsTIq+224XBK6+mbOSmi5J6KHgBKPB5RXubK5tND4UXmsRKpKGIz1E5IfC32B3c9KdryI7xyBALT9JEPs+A8srwNI4e0JWq4HVAK8h/ZfHaoJwqoPYD6MKNfF1rjlVbIWIkQ/B2p0EeIPdmtnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y7h4JGprGTpbXCcjeFqkuYEvMPUkFnNFXZCQAhifMhE=;
 b=Q7PLcwthS742cvRT0nmto/ePRSATMG0w9NuZ6rwb3dUA92hhPo0qGWxeDpn4PwaaQBfLUJ/qKbe4YmSW8RZkA6CfK1ieL3RJWfNq+2/BCdZOFgc2s9QJaGYKRw2yQ2OKNtBXl1cSsohA5aZjt7eHizirGHwlYtb+IxkVkHiimVXj3WsXx+9DOxdEspjqc8rVzdFy9Llpd+Gkxu0EZbawMsVKQKpCYJCXrFozRljkOl7p39TDJHuYs71yzLJG4YmGD6sWJsBoj9AUS9dM7pqgtF9xEETUyB9+wR6LJ2vdDcCjVVFP1WmaWOf9u7szMuiqzEpeeBjtJ4QZfUcm1Aloow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=siemens.onmicrosoft.com; s=selector1-siemens-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y7h4JGprGTpbXCcjeFqkuYEvMPUkFnNFXZCQAhifMhE=;
 b=gQ8kzTnJuW2q3MwpApYdye5afUIs1IpxooXMicJeol2+G26W+jys/dB9LbUJ9FiAwP+HmiTCVNjHzNUES5HTAoHThSocdlTkEIUg0MmxPa8v774VO6D3GirWWL2sbdEXF/li0+39zhwSxYQBbdSAIt7oha8eO3R9maSMjbh+twU=
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by DB8PR10MB3466.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:131::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Fri, 30 Oct
 2020 08:45:22 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::190f:9fc5:dbb0:a1f4]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::190f:9fc5:dbb0:a1f4%3]) with mapi id 15.20.3499.029; Fri, 30 Oct 2020
 08:45:22 +0000
From:   "Valek, Andrej" <andrej.valek@siemens.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>
CC:     "nick@shmanahar.org" <nick@shmanahar.org>,
        "hadess@hadess.net" <hadess@hadess.net>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH 1/3] Input: goodix - add option to disable firmware
 loading
Thread-Topic: [PATCH 1/3] Input: goodix - add option to disable firmware
 loading
Thread-Index: AQHWrjMlMLnptYxPakOG3laEf6V3eKmv1Dlw
Date:   Fri, 30 Oct 2020 08:45:22 +0000
Message-ID: <DB8PR10MB3977AD402979E266661DB9FD92150@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
References: <20201029170313.25529-1-andrej.valek@siemens.com>
 <20201029170313.25529-2-andrej.valek@siemens.com>
 <20201029203608.GE2547185@dtor-ws>
In-Reply-To: <20201029203608.GE2547185@dtor-ws>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Enabled=true;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SetDate=2020-10-30T08:45:20Z;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Method=Standard;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Name=restricted-default;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ActionId=a77d44a7-1740-4a8d-82a6-4bf284ed5697;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ContentBits=0
document_confidentiality: Restricted
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=siemens.com;
x-originating-ip: [165.225.200.172]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c345afc9-5510-4f20-e488-08d87cb02363
x-ms-traffictypediagnostic: DB8PR10MB3466:
x-microsoft-antispam-prvs: <DB8PR10MB34661ADBA18D1259F2A6C72892150@DB8PR10MB3466.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7kSIoEEuQC3rds4D1yKjplzucGGffN0AZTPGAsvK/HeuAq4QcF3+iJ2dlPOHY3qhdOgnDKbIjeruAmqS9MbCUw9C372bI9XBQ9Vog3I5mrCQpJ38iz429JH/4hFIX+zw4PemsaAmHin+mv/nkueFSkIeX/6tWDHr6Liw4uQFZgPGtI7RoN1hd9Fq4u0yGG8Hn+jH9DltCtzCwUMeSNZq5Hlu77PMYCBnmu+X1URBMaE5w9cckckdMmj959fcewjZkUbDN7zEkvbh3WzOrCVpz87a6D6QM7McUeth/RbP10aIqdAIczz/ON5VVw01+aKa
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(366004)(396003)(39860400002)(26005)(9686003)(86362001)(186003)(5660300002)(55016002)(52536014)(76116006)(66556008)(71200400001)(66476007)(66446008)(478600001)(64756008)(66946007)(8676002)(33656002)(54906003)(55236004)(110136005)(316002)(83380400001)(2906002)(7696005)(6506007)(8936002)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: fDNycLwdzrvvbjrsDdpUuZEIxSO1U7K6XCPAm7xHjgvKaz5rVxH818aEy5AvHJAyEoGWHoCh/UOsbSd93TQ6ysTgiXUZ5HTQZq2ADwwebxrqUd/trCAnlwbg4IxdRyR3Jwj54PyHL5NuXxFOgu3CcgRnghcFb3X3EY7dtWWuu/G058RC034zd6xss41FQiug0KpqPF4D1gvTtwxxy2jtAcmH+fvDuHlIqO7S8uUR8sIKkRw384FxHCAfZdsptWkXNLZFrw67sqaYBVbqOb1yYLlU8DLfCWpl3XigdtXEJIB0KZ9+fW7f3sgGlzKjieNv9ibJ+Ud/4FyeozZTfOlCRbOZn6G9CsXCcIEhVoFmSBnO3T/zs0DzkwHzJ38g7ZMZmn87bdiuAwCUtn0Ewy+Ip4VcFyOjkg0jgllORBCbg/0Yy3qMXMOxnszUE7uByXjmcth1NIztDfQWZiWAcL5mbs3SkMr0+htYkVcJW+9XozYJkdGr7pYk88ys18wuxoCyd6J9VUKctwm/qR6CpG/8RGURJ0SoSkReifGq7E7XBx0F67WvCpZUIfuZ2bsonPHzV3bIN9+3cT8WJIgFSQwi6CFh2Cnxznq7n8lbfhwzS6jbBrPXgYflDZ13CkBzwlALbA7Bh2a+qLAreG2Bjpe9qg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c345afc9-5510-4f20-e488-08d87cb02363
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2020 08:45:22.1219
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6yjtrZtK1gewkms8CB8nNwxeeliSCxtuG59ZRTmOmKu+U/eNF4RUuOxLeh5tTjA12O5vIEFSjd8BaNl16uNmcdlRcfme7wa6AmU9cB1H8lI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3466
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

SGVsbG8gRG1pdHJ5LA0KDQpObywgSSBkb24ndCB0aGluayBzbywgdGhhdCB0aGlzIGlzIHRoZSBj
YXNlLiBCZWNhdXNlLCB3aGVuIEkgZGlzYWJsZWQgdGhlIEZXIGNvbmZpZ3VyYXRpb24gbG9hZGlu
ZyBkZXZpY2UgaXMgd29ya2luZyBhcyB3ZWxsLiBUbyBiZSBob25lc3QsIEkgZG9uJ3QgbmVlZCBh
IG5ldyBjb25maWd1cmF0aW9uIGZvciBlYWNoIGJvb3Qg8J+Yii4NCg0KUmVnYXJkcywNCkFuZHJl
ag0KDQo+IEhpIEFuZHJlaiwNCj4NCj4gT24gVGh1LCBPY3QgMjksIDIwMjAgYXQgMDY6MDM6MTFQ
TSArMDEwMCwgQW5kcmVqIFZhbGVrIHdyb3RlOg0KPiA+IEZpcm13YXJlIGZpbGUgbG9hZGluZCBm
b3IgR1Q5MTEgY29udHJvbGxlciB0YWtlcyB0b28gbXVjaCB0aW1lICh+NjBzKS4NCj4gPiBUaGVy
ZSBpcyBubyBjaGVjayB0aGF0IGNvbmZpZ3VyYXRpb24gaXMgdGhlIHNhbWUgd2hpY2ggaXMgYWxy
ZWFkeSBwcmVzZW50Lg0KPiA+IFRoaXMgaGFwcGVucyBhbHdheXMgZHVyaW5nIGJvb3QsIHdoaWNo
IG1ha2VzIHRvdWNoc2NyZWVuIHVudXNhYmxlLg0KPiA+DQo+ID4gQWRkIHRoZXJlIGFuIG9wdGlv
biB0byBwcmV2ZW50IGZpcm13YXJlIGZpbGUgbG9hZGluZywgYnV0IGtlZXAgaXQNCj4gPiBlbmFi
bGVkIGJ5IGRlZmF1bHQuDQo+DQo+IEkgdGhvdWdodCB0aGF0IEdvb2RpeCB3YXMgbG9zaW5nIGZp
cm13YXJlIGxvYWRpbmcgYXQgcG93ZXJvZmYuIElzIHRoaXMgbm90IHRoZSBjYXNlIHdpdGggdGhp
cyBtb2RlbD8NCj4NCj4gQWRkaW5nIEhhbnMgYXMgaGUgd2FzIHdvcmtpbmcgd2l0aCB0aGlzIGRy
aXZlci9jb2RlLg0KPg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQW5kcmVqIFZhbGVrIDxhbmRy
ZWoudmFsZWtAc2llbWVucy5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvaW5wdXQvdG91Y2hz
Y3JlZW4vZ29vZGl4LmMgfCA0ICsrKy0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW5wdXQv
dG91Y2hzY3JlZW4vZ29vZGl4LmMNCj4gPiBiL2RyaXZlcnMvaW5wdXQvdG91Y2hzY3JlZW4vZ29v
ZGl4LmMNCj4gPiBpbmRleCAwMmM3NWVhMzg1ZTA4Li40NDMzNmVjZDJhY2RmIDEwMDY0NA0KPiA+
IC0tLSBhL2RyaXZlcnMvaW5wdXQvdG91Y2hzY3JlZW4vZ29vZGl4LmMNCj4gPiArKysgYi9kcml2
ZXJzL2lucHV0L3RvdWNoc2NyZWVuL2dvb2RpeC5jDQo+ID4gQEAgLTk0MSw3ICs5NDEsOSBAQCBz
dGF0aWMgaW50IGdvb2RpeF9nZXRfZ3Bpb19jb25maWcoc3RydWN0IGdvb2RpeF90c19kYXRhICp0
cykNCj4gPiAgCWRlZmF1bHQ6DQo+ID4gIAkJaWYgKHRzLT5ncGlvZF9pbnQgJiYgdHMtPmdwaW9k
X3JzdCkgew0KPiA+ICAJCQl0cy0+cmVzZXRfY29udHJvbGxlcl9hdF9wcm9iZSA9IHRydWU7DQo+
ID4gLQkJCXRzLT5sb2FkX2NmZ19mcm9tX2Rpc2sgPSB0cnVlOw0KPiA+ICsJCQkvKiBQcmV2ZW50
IGNmZyBsb2FkaW5nIGZvciBlYWNoIHN0YXJ0ICovDQo+ID4gKwkJCXRzLT5sb2FkX2NmZ19mcm9t
X2Rpc2sgPSAhZGV2aWNlX3Byb3BlcnR5X3JlYWRfYm9vbChkZXYsDQo+ID4gKwkJCQkJCSAidG91
Y2hzY3JlZW4tZG8tbm90LWxvYWQtZnciKTsNCj4gPiAgCQkJdHMtPmlycV9waW5fYWNjZXNzX21l
dGhvZCA9IElSUV9QSU5fQUNDRVNTX0dQSU87DQo+ID4gIAkJfQ0KPiA+ICAJfQ0KPiA+IC0tDQo+
ID4gMi4yMC4xDQo+ID4NCj4NCj4gVGhhbmtzLg0KPg0KPiAtLQ0KPiBEbWl0cnkNCg==
