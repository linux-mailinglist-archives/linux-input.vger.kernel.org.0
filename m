Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F80414BE70
	for <lists+linux-input@lfdr.de>; Tue, 28 Jan 2020 18:22:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726211AbgA1RWq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 28 Jan 2020 12:22:46 -0500
Received: from mail-bn8nam12on2072.outbound.protection.outlook.com ([40.107.237.72]:6107
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726066AbgA1RWq (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 28 Jan 2020 12:22:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mIg4bGM/d4ds3HCKygGjNpq7bLvMXcBP4+hsDi753zsbKmXMto/KJuGmMzqiEzmTeKiHzSiO5UAQVz6fhML5GNlSTRkERXJmlE/wjrqFqd40y73xX/JKQZhKycCuO2fU0ECoGQ3xKVidoTPALB0plv1JxVoeCPMr60KbEUECdHGVnFyKdmTTn3H2G4TH9yh8wPFrisXsNlExvsNwbBZRLVSXQlTWDmG8BRiGXZDMsnwd4CosjauWTJQC5pMERH+P4BdfXFgZZA6EjxemwWDoC9HY3b4nd5iQmlPMC8xJ7l9mWsNjVGHH9wiAqz+sBszbWmcQkVmmKa/z6IfDgbeRGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zl7O3kPJFpBXbiX2bDyz1HWsf/2OZtW0qYfZlf3Nbj0=;
 b=OgDk+5VpKEAYybk0bp/mMrXtRioqk42G/bEBj3ToRlWL39rYjDuVNmDeQvRrXUCWYdV3F99YXLEUpx9K57879QEKO4ZaXzXeofI/lTpo0SCPIJOOb9HCpcSSZ6joGK2iRXUHIsyBou1CB4L/AFcsK6REU6k3CHEeNxL1RJMwQX00rl3Zc5DluybEH5iI+wEuucGhNnEOsv48HBGifujXT9jWTxSlV0ztxi6+uyg85KrG3/XGCLnM7bFNJWjOikxVPd6AhyglE4esaEZN+/bl9BwD9ZrtTflRziFTAadm59UrUFNvsWxi2yoZLKLmoLihJz2Ju4ySEsMWnixUTTHKZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zl7O3kPJFpBXbiX2bDyz1HWsf/2OZtW0qYfZlf3Nbj0=;
 b=E08X21OIg68LpsVNs9cXRTVd0aZrD9Bons/rn8YSOyGGSkAwxKRWQHncfPsNV2vs8NjILuhcyJE8R/9d9fJPWCG3wkxw0bxhPsM4FuJi6ypo8ljawwgpVn7KhOCssyHwCI0TofeNjhI7B87zm5I55eZzlLQa9iyu0A7T7xNeT3Q=
Received: from DM6PR03MB4713.namprd03.prod.outlook.com (20.179.71.209) by
 DM6PR03MB4556.namprd03.prod.outlook.com (20.178.25.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.19; Tue, 28 Jan 2020 17:22:40 +0000
Received: from DM6PR03MB4713.namprd03.prod.outlook.com
 ([fe80::415e:438a:ddc8:e90e]) by DM6PR03MB4713.namprd03.prod.outlook.com
 ([fe80::415e:438a:ddc8:e90e%6]) with mapi id 15.20.2665.026; Tue, 28 Jan 2020
 17:22:40 +0000
Received: from mastodon (166.171.250.97) by BYAPR11CA0055.namprd11.prod.outlook.com (2603:10b6:a03:80::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2665.22 via Frontend Transport; Tue, 28 Jan 2020 17:22:39 +0000
From:   Christopher Heiny <Cheiny@synaptics.com>
To:     Lucas Stach <l.stach@pengutronix.de>,
        Andrew Duggan <aduggan@synaptics.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "patchwork-lst@pengutronix.de" <patchwork-lst@pengutronix.de>
Subject: Re: [PATCH] Input: synaptics-rmi4 - switch to reduced reporting mode
Thread-Topic: [PATCH] Input: synaptics-rmi4 - switch to reduced reporting mode
Thread-Index: AQHVz4MWwJyn9f/+jUmt8mxQJL0NZKf90t4AgAEb7ACAAMP3gIAALF8AgACA64A=
Date:   Tue, 28 Jan 2020 17:22:40 +0000
Message-ID: <f7b19df4972a7293a701b738426fb63738a771a0.camel@synaptics.com>
References: <20200120111628.18376-1-l.stach@pengutronix.de>
         <20200127022448.GC184237@dtor-ws>
         <b2ca3006-281a-c991-4c6c-7ae7ce5cc3f7@synaptics.com>
         <23ecff7a48f801fcc18680fb6cb150e32fc3c858.camel@synaptics.com>
         <a46120cfd113a4d016f37270eb92c4fccd00a2ed.camel@pengutronix.de>
In-Reply-To: <a46120cfd113a4d016f37270eb92c4fccd00a2ed.camel@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [166.171.250.97]
user-agent: Evolution 3.32.5 (3.32.5-1.fc30) 
x-clientproxiedby: BYAPR11CA0055.namprd11.prod.outlook.com
 (2603:10b6:a03:80::32) To DM6PR03MB4713.namprd03.prod.outlook.com
 (2603:10b6:5:15f::17)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Cheiny@synaptics.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 438a8c34-e06a-4db8-f0dc-08d7a416ad83
x-ms-traffictypediagnostic: DM6PR03MB4556:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR03MB45561DF4A339E95A3557CA96DD0A0@DM6PR03MB4556.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 029651C7A1
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(396003)(376002)(346002)(366004)(39850400004)(199004)(189003)(4326008)(478600001)(6496006)(316002)(54906003)(36756003)(110136005)(8676002)(81156014)(81166006)(8936002)(66946007)(956004)(86362001)(66476007)(64756008)(2616005)(66556008)(66446008)(2906002)(6486002)(52116002)(186003)(53546011)(26005)(16526019)(71200400001)(5660300002)(6666004);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR03MB4556;H:DM6PR03MB4713.namprd03.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synaptics.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oqAeFz1rPDD63d6EJYaI/0Sf8ItsDXRjfE6V5PFy+ZUrAtHbUXL9IUUxMOu7KjcSZlP/w6uPuTzfVhJ9bKfFhZBzVDVlOJJiLeT4OrSpqqvBAfgBuaWhmcJHg8sif/Y+DMMUqM1Dor8EX3Vzi2k9h1bQkoWG06IDMxGAWPB96wYcHE4iPyp7bCI8Zz6dKoEKf2AO6i+edBjN0Ssd2MfrKQ0+zPfQq2YoqvAqlF0I1Ydg1wwXjMT/obqRYiaG6So0oIvRrma3OAHhY6CW11ZRLxvtoza4SUCKcWTv7J6eQ24Q8BpeavNKQw99SmEKa3YStSGf2YTiq1GCNZ7u4NKZe8LXZv50FxZ107RaQVic7wAV2rdpnA3PGQPK0lX5M8fQQihjN9NxFjgd4YEAcIUlzyWZ2mxpPpelrybAfBeim/55kU/0ddghsOJpw2MxnIAf
x-ms-exchange-antispam-messagedata: NsS+z1LFoHXA+2p7z4K5igxTUSUOYQ6MHHknOQFVFVyrMd6J3CsTxrOeZf95a7EtS4xecZBIzg8uDevvBF83qO/7XJPs9gwTj4D7AbMzlQKMKk8OxX3R4F0x1e1lcWbsSeHO3tbzi+KrOFj8kHpYuA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <BEFA0C4D3278D6449336F16AC593D3C3@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 438a8c34-e06a-4db8-f0dc-08d7a416ad83
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2020 17:22:40.6234
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ffrLPTfc+iFv3K4BjCLyn2atZJmQKpD7HXwcKOOKAUw4WVmCnu63TYioPLh7rBGrLKN3B1ikdOAYL3ZveVfc/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4556
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

T24gVHVlLCAyMDIwLTAxLTI4IGF0IDEwOjQxICswMTAwLCBMdWNhcyBTdGFjaCB3cm90ZToNCj4g
Q0FVVElPTjogRW1haWwgb3JpZ2luYXRlZCBleHRlcm5hbGx5LCBkbyBub3QgY2xpY2sgbGlua3Mg
b3Igb3Blbg0KPiBhdHRhY2htZW50cyB1bmxlc3MgeW91IHJlY29nbml6ZSB0aGUgc2VuZGVyIGFu
ZCBrbm93IHRoZSBjb250ZW50IGlzDQo+IHNhZmUuDQo+IA0KPiANCj4gSGkgQ2hyaXN0b3BoZXIs
DQo+IA0KPiBPbiBEaSwgMjAyMC0wMS0yOCBhdCAwNzowMiArMDAwMCwgQ2hyaXN0b3BoZXIgSGVp
bnkgd3JvdGU6DQo+ID4gT24gTW9uLCAyMDIwLTAxLTI3IGF0IDExOjIxIC0wODAwLCBBbmRyZXcg
RHVnZ2FuIHdyb3RlOg0KPiA+ID4gSGkgRG1pdHJ5LA0KPiA+ID4gDQo+ID4gPiBPbiAxLzI2LzIw
IDY6MjQgUE0sIERtaXRyeSBUb3Jva2hvdiB3cm90ZToNCj4gPiA+ID4gT24gTW9uLCBKYW4gMjAs
IDIwMjAgYXQgMTI6MTY6MjhQTSArMDEwMCwgTHVjYXMgU3RhY2ggd3JvdGU6DQo+ID4gPiA+ID4g
V2hlbiB0aGUgZGlzdGFuY2UgdGhyZXNob2xkcyBhcmUgc2V0IHRoZSBjb250cm9sbGVyIG11c3Qg
YmUNCj4gPiA+ID4gPiBpbg0KPiA+ID4gPiA+IHJlZHVjZWQNCj4gPiA+ID4gPiByZXBvcnRpbmcg
bW9kZSBmb3IgdGhlbSB0byBoYXZlIGFueSBlZmZlY3Qgb24gdGhlIGludGVycnVwdA0KPiA+ID4g
PiA+IGdlbmVyYXRpb24uDQo+ID4gPiA+ID4gVGhpcyBoYXMgYSBwb3RlbnRpYWxseSBsYXJnZSBp
bXBhY3Qgb24gdGhlIG51bWJlciBvZiBldmVudHMNCj4gPiA+ID4gPiB0aGUNCj4gPiA+ID4gPiBo
b3N0DQo+ID4gPiA+ID4gbmVlZHMgdG8gcHJvY2Vzcy4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT4NCj4gPiA+
ID4gPiAtLS0NCj4gPiA+ID4gPiBJJ20gbm90IHN1cmUgaWYgd2Ugd2FudCBhIHNlcGFyYXRlIERU
IHByb3BlcnR5IHRvIGFsbG93IHRoZQ0KPiA+ID4gPiA+IHVzZQ0KPiA+ID4gPiA+IG9mDQo+ID4g
PiA+ID4gcmVkdWNlZCByZXBvcnRpbmcgbW9kZSwgYXMgdGhpcyBjaGFuZ2UgbWlnaHQgbGVhZCB0
byBwcm9ibGVtcw0KPiA+ID4gPiA+IGZvcg0KPiA+ID4gPiA+IGNvbnRyb2xsZXJzIHdpdGggdW5y
ZWFzb25hYmx5IGxhcmdlIHRocmVzaG9sZCB2YWx1ZXMuIEknbSBub3QNCj4gPiA+ID4gPiBzdXJl
IGlmDQo+ID4gPiA+ID4gYW55IGNvbnRyb2xsZXIgd2l0aCBib2d1cyB0aHJlc2hvbGQgdmFsdWVz
IGV4aXN0IGluIHRoZSB3aWxkLg0KPiA+ID4gPiA+IC0tLQ0KPiA+ID4gPiBBbmRyZXcsIGFueSBm
ZWVkYmFjayBvbiB0aGlzIHBhdGNoPw0KPiA+ID4gPiANCj4gPiA+ID4gVGhhbmtzIQ0KPiA+ID4g
DQo+ID4gPiBUaGUgUk1JNCBzcGVjIGRvZXMgc2F5IHRoYXQgZGVsdGEgWC9ZIHRocmVzaG9sZHMg
YXJlIG9ubHkgdXNlZCBpbg0KPiA+ID4gcmVkdWNlZCByZXBvcnRpbmcgbW9kZSwgc28gdGhpcyBw
YXRjaCBpcyBuZWVkZWQgZm9yIHRoZSB0aHJlc2hvbGQNCj4gPiA+IHZhbHVlcw0KPiA+ID4gdG8g
aGF2ZSBhbiBlZmZlY3QuDQo+ID4gPiANCj4gPiA+IFJldmlld2VkLWJ5OiBBbmRyZXcgRHVnZ2Fu
IDxhZHVnZ2FuQHN5bmFwdGljcy5jb20+DQo+ID4gPiANCj4gPiA+IEJlY2F1c2UgcmVkdWNlZCBy
ZXBvcnRpbmcgbW9kZSBpcyBzbyBkZXBlbmRlbnQgb24gdGhlc2UNCj4gPiA+IHRocmVzaG9sZHMs
DQo+ID4gPiBteQ0KPiA+ID4gb3BpbmlvbiBpcyB0aGF0IGl0IGlzIGJldHRlciBub3QgdG8gYWRk
IGEgc2VwYXJhdGUgRFQgcHJvcGVydHksDQo+ID4gPiBidXQNCj4gPiA+IHRvDQo+ID4gPiBpbnN0
ZWFkIGNvbnRyb2wgcmVkdWNlZCByZXBvcnRpbmcgbW9kZSB0aHJvdWdoIHRoZSBzZXR0aW5nIG9m
DQo+ID4gPiB0aGVzZQ0KPiA+ID4gdGhyZXNob2xkcy4gTXkgZ3Vlc3MgaXMgdGhhdCB0aGUgaWYg
cmVkdWNlZCByZXBvcnRpbmcgaXMgbm90DQo+ID4gPiBlbmFibGVkDQo+ID4gPiBpbg0KPiA+ID4g
dGhlIGZpcm13YXJlIGJ5IGRlZmF1bHQsIHRoZW4gdGhlIHRocmVzaG9sZHMgbWF5IG5vdCBiZSB2
YWxpZC4NCj4gPiA+IFNldHRpbmcNCj4gPiA+IHRoZSB0aHJlc2hvbGRzIHRvIDAgd2lsbCBlc3Nl
bnRpYWxseSBkaXNhYmxlIHJlZHVjZWQgcmVwb3J0aW5nDQo+ID4gPiBtb2RlLg0KPiA+ID4gU28N
Cj4gPiA+IHRoYXQgd291bGQgYmUgaG93IGEgdXNlciBjb3VsZCBkaXNhYmxlIHJlZHVjZWQgcmVw
b3J0aW5nIG1vZGUNCj4gPiA+IHdpdGhvdXQNCj4gPiA+IGENCj4gPiA+IHNlcGFyYXRlIERUIHBy
b3BlcnR5LiBDaHJpcywgZG8geW91IGhhdmUgYW4gb3BpbmlvbiBvbiB0aGlzPw0KPiA+ID4gQW55
dGhpbmcNCj4gPiA+IEkNCj4gPiA+IG92ZXJsb29rZWQ/DQo+ID4gDQo+ID4gSGkgRG1pdHJ5LCBB
bmRyZXcsIEx1Y2FzLA0KPiA+IA0KPiA+IEknbSBpbiBhZ3JlZW1lbnQgd2l0aCBBbmRyZXcgb24g
dGhpcy4gIEhhdmluZyB0d28gd2F5cyB0bw0KPiA+IGVuYWJsZS9kaXNhYmxlIHJlZHVjZWQgcmVw
b3J0aW5nICh0aGF0IGlzLCBib3RoIHRoZSBEVCBwcm9wZXJ0eSBhbmQNCj4gPiB0aGUNCj4gPiB0
aHJlc2hvbGRzKSBjb3VsZCBsZWFkIHRvIGNvbmZ1c2lvbiBhbmQgdW5leHBlY3RlZA0KPiA+IGJl
aGF2aW9yLiAgU2ltcGxlcg0KPiA+IGlzIGJldHRlciwgaW4gbXkgb3Bpbmlvbi4NCj4gPiANCj4g
PiBIb3dldmVyLCBpbiB0aGF0IGNhc2UgSSdtIGEgbGl0dGxlIGNvbmNlcm5lZCBhYm91dCB0aGUg
bG9naWMgaW4gdGhlDQo+ID4gcGF0Y2ggYmVsb3cuICBXaGVuIGVpdGhlciBvZiB0aGUgdGhyZXNo
b2xkcyBhcmUgc2V0IHRvIG5vbi16ZXJvLCB3ZQ0KPiA+IGNsZWFyIHRoZSByZXBvcnQgbWFzayBh
bmQgdGhlbiBlbmFibGUgdGhlIHJlZHVjZWQgcmVwb3J0aW5nIGJpdC4NCj4gPiBTdWJzZXF1ZW50
bHkgc2V0dGluZyBib3RoIHRocmVzaG9sZHMgdG8gemVybyB3aWxsIGRpc2FibGUgcmVkdWNlZA0K
PiA+IHJlcG9ydGluZywgYnV0IHdpbGwgbm90IGVuYWJsZSBhbm90aGVyIHJlcG9ydCBtb2RlLiAg
VW5sZXNzIHRoZXJlDQo+ID4gaXMNCj4gPiBjb2RlIGVsc2V3aGVyZSB0byBjYXRjaCB0aGlzIGNh
c2UgKGFuZCBpZiB0aGVyZSBpcywgaXQgc2VlbXMgbGlrZSBhDQo+ID4gYmFkDQo+ID4gaWRlYSB0
byBiZSBoYW5kbGluZyB0aGlzIGluIHR3byBkaWZmZXJlbnQgcGxhY2VzKSwgaXQgY291bGQgcmVz
dWx0DQo+ID4gaW4NCj4gPiB0aGUgdG91Y2hwYWQgYmVpbmcgZGlzYWJsZWQuDQo+ID4gDQo+ID4g
QXMgYSBoeXBvdGhldGljYWwgaW5zdGFuY2Ugb2YgdGhpcywgaW1hZ2luZSBhIHVzZXIgdXNpbmcg
dGhlDQo+ID4gdG91Y2hwYWQNCj4gPiB0byBtYW5pcHVsYXRlIHJlcG9ydCB0aHJlc2hvbGQgc2xp
ZGVycyBpbiBhIEdVSS4gIFNldHRpbmcgYm90aA0KPiA+IHNsaWRlcnMNCj4gPiB0byB6ZXJvIHdv
dWxkIGRpc2FibGUgdGhlIHRvdWNoIHNlbnNvciByZXBvcnRpbmcsIHBvdGVudGlhbGx5DQo+ID4g
bGVhdmluZw0KPiA+IHRoZSB1c2VyIHdpdGggYSBkZWFkIHRvdWNoIHNlbnNvciBhbmQgbm8gZWFz
eSB3YXkgdG8gcmVjb3ZlciBmcm9tDQo+ID4gdGhhdC4NCj4gDQo+IEkgY2FuIHNlZSBob3cgdGhp
cyB3b3VsZCBiZSBhIHByb2JsZW0sIGJ1dCB0aGVuIEkgc2VlIG5vIGludGVyZmFjZSBpbg0KPiB0
aGUgZHJpdmVyIHRvIGFjdHVhbGx5IGNoYW5nZSB0aGUgdGhyZXNob2xkIHZhbHVlcyBvbiB0aGUg
Zmx5LiBUaGV5DQo+IGFyZQ0KPiBlaXRoZXIgc2V0IGJ5IGZpcm13YXJlIG9yIHNwZWNpZmllZCB2
aWEgRFQgcHJvcGVydGllcy4gU28gSSBkb24ndCBzZWUNCj4gaG93IHRoZSB0aHJlc2hvbGQgdmFs
dWVzIHdvdWxkIGNoYW5nZSBvbiBhbiBhY3RpdmUgZGV2aWNlLiBBbnl0aGluZw0KPiBpJ20NCj4g
b3Zlcmxvb2tpbmc/DQoNCkhpIEx1Y2FzLA0KDQpZb3UncmUgbm90IG92ZXJsb29raW5nIGFueXRo
aW5nLiAgTWFpbmx5IGl0J3MgbWUgYmVpbmcgYSB3b3JyeS13YXJ0LA0KYW5kIGFzc3VtaW5nIHRo
YXQgaWYgc29tZXRoaW5nIGNhbiBiZSBhZGp1c3RlZCwgc29tZW9uZSB3aWxsIGV2ZW50dWFsbHkN
CmNvbWUgYWxvbmcgYW5kIGFkZCBhIHN5c2ZzIGludGVyZmFjZSB0byBhZGp1c3QgaXQsIGFuZCB0
aGVuIHNvbWVvbmUNCmVsc2Ugd2lsbCBjcmVhdGUgYSB1c2Vyc3BhY2UgdG9vbCB0byBhZGp1c3Qg
aXQsIGFuZCB0aGluZ3Mgd2lsbCBicmVhay4NCg0KSWYgeW91IGd1eXMgYXJlIE9LIHdpdGggQW5k
cmV3J3Mgb3JpZ2luYWwgZXZhbHVhdGlvbiwgdGhlbiB5b3UgY2FuDQppZ25vcmUgbXkgd29ycnkg
KHdoaWNoIGlzLCBhcyBhZG1pdHRlZCwgZW50aXJlbHkgYSBoeXBvdGhldGljYWwpLg0KDQoJCQkJ
CUNoZWVycywNCgkJCQkJCUNocmlzDQoNCj4gDQo+IFJlZ2FyZHMsDQo+IEx1Y2FzDQo+IA0KPiA+
ID4gPiA+ICAgZHJpdmVycy9pbnB1dC9ybWk0L3JtaV9mMTEuYyB8IDE0ICsrKysrKysrKysrKysr
DQo+ID4gPiA+ID4gICAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQ0KPiA+ID4gPiA+
IA0KPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lucHV0L3JtaTQvcm1pX2YxMS5jDQo+
ID4gPiA+ID4gYi9kcml2ZXJzL2lucHV0L3JtaTQvcm1pX2YxMS5jDQo+ID4gPiA+ID4gaW5kZXgg
YmJmOWFlOWYzZjBjLi42YWRlYThhM2U4ZmIgMTAwNjQ0DQo+ID4gPiA+ID4gLS0tIGEvZHJpdmVy
cy9pbnB1dC9ybWk0L3JtaV9mMTEuYw0KPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvaW5wdXQvcm1p
NC9ybWlfZjExLmMNCj4gPiA+ID4gPiBAQCAtNDEyLDYgKzQxMiwxMCBAQCBzdHJ1Y3QgZjExXzJk
X3NlbnNvcl9xdWVyaWVzIHsNCj4gPiA+ID4gPiANCj4gPiA+ID4gPiAgIC8qIERlZnMgZm9yIEN0
cmwwLiAqLw0KPiA+ID4gPiA+ICAgI2RlZmluZSBSTUlfRjExX1JFUE9SVF9NT0RFX01BU0sgICAg
ICAgIDB4MDcNCj4gPiA+ID4gPiArI2RlZmluZSBSTUlfRjExX1JFUE9SVF9NT0RFX0NPTlRJTlVP
VVMgICgwIDw8IDApDQo+ID4gPiA+ID4gKyNkZWZpbmUgUk1JX0YxMV9SRVBPUlRfTU9ERV9SRURV
Q0VEICAgICAoMSA8PCAwKQ0KPiA+ID4gPiA+ICsjZGVmaW5lIFJNSV9GMTFfUkVQT1JUX01PREVf
RlNfQ0hBTkdFICAgKDIgPDwgMCkNCj4gPiA+ID4gPiArI2RlZmluZSBSTUlfRjExX1JFUE9SVF9N
T0RFX0ZQX0NIQU5HRSAgICgzIDw8IDApDQo+ID4gPiA+ID4gICAjZGVmaW5lIFJNSV9GMTFfQUJT
X1BPU19GSUxUICAgICAgICAgICAgKDEgPDwgMykNCj4gPiA+ID4gPiAgICNkZWZpbmUgUk1JX0Yx
MV9SRUxfUE9TX0ZJTFQgICAgICAgICAgICAoMSA8PCA0KQ0KPiA+ID4gPiA+ICAgI2RlZmluZSBS
TUlfRjExX1JFTF9CQUxMSVNUSUNTICAgICAgICAgICgxIDw8IDUpDQo+ID4gPiA+ID4gQEAgLTEx
OTUsNiArMTE5OSwxNiBAQCBzdGF0aWMgaW50IHJtaV9mMTFfaW5pdGlhbGl6ZShzdHJ1Y3QNCj4g
PiA+ID4gPiBybWlfZnVuY3Rpb24gKmZuKQ0KPiA+ID4gPiA+ICAgICAgICAgICAgICAgIGN0cmwt
PmN0cmwwXzExW1JNSV9GMTFfREVMVEFfWV9USFJFU0hPTERdID0NCj4gPiA+ID4gPiAgICAgICAg
ICAgICAgICAgICAgICAgIHNlbnNvci0+YXhpc19hbGlnbi5kZWx0YV95X3RocmVzaG9sZDsNCj4g
PiA+ID4gPiANCj4gPiA+ID4gPiArICAgICAvKg0KPiA+ID4gPiA+ICsgICAgICAqIElmIGRpc3Rh
bmNlIHRocmVzaG9sZCB2YWx1ZXMgYXJlIHNldCwgc3dpdGNoIHRvDQo+ID4gPiA+ID4gcmVkdWNl
ZA0KPiA+ID4gPiA+IHJlcG9ydGluZw0KPiA+ID4gPiA+ICsgICAgICAqIG1vZGUgc28gdGhleSBh
Y3R1YWxseSBnZXQgdXNlZCBieSB0aGUgY29udHJvbGxlci4NCj4gPiA+ID4gPiArICAgICAgKi8N
Cj4gPiA+ID4gPiArICAgICBpZiAoY3RybC0+Y3RybDBfMTFbUk1JX0YxMV9ERUxUQV9YX1RIUkVT
SE9MRF0gfHwNCj4gPiA+ID4gPiArICAgICAgICAgY3RybC0+Y3RybDBfMTFbUk1JX0YxMV9ERUxU
QV9ZX1RIUkVTSE9MRF0pIHsNCj4gPiA+ID4gPiArICAgICAgICAgICAgIGN0cmwtPmN0cmwwXzEx
WzBdICY9IH5STUlfRjExX1JFUE9SVF9NT0RFX01BU0s7DQo+ID4gPiA+ID4gKyAgICAgICAgICAg
ICBjdHJsLT5jdHJsMF8xMVswXSB8PQ0KPiA+ID4gPiA+IFJNSV9GMTFfUkVQT1JUX01PREVfUkVE
VUNFRDsNCj4gPiA+ID4gPiArICAgICB9DQo+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ICAgICAgICBp
ZiAoZjExLT5zZW5zX3F1ZXJ5Lmhhc19kcmliYmxlKSB7DQo+ID4gPiA+ID4gICAgICAgICAgICAg
ICAgc3dpdGNoIChzZW5zb3ItPmRyaWJibGUpIHsNCj4gPiA+ID4gPiAgICAgICAgICAgICAgICBj
YXNlIFJNSV9SRUdfU1RBVEVfT0ZGOg0KPiA+ID4gPiA+IC0tDQo+ID4gPiA+ID4gMi4yMC4xDQo+
ID4gPiA+ID4gDQo+ID4gPiA+IC0tDQo+ID4gPiA+IERtaXRyeQ0KDQoNCg==
