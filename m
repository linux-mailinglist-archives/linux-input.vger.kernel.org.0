Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 665F2E905A
	for <lists+linux-input@lfdr.de>; Tue, 29 Oct 2019 20:54:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726070AbfJ2Tyb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Oct 2019 15:54:31 -0400
Received: from mail-eopbgr760085.outbound.protection.outlook.com ([40.107.76.85]:30400
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725830AbfJ2Tyb (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Oct 2019 15:54:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IkEoz4lNQmYbiaLU0/SWVoIeW7W1Y0YtuMy/Soy9hNQ2ugFNkcnAu+5PwW9dd4PzjvK67RdXs57JHfeBX3dW0UZduqUfRAVWKZ5pWNI/iMcFjqJLrYXKvD63IVkDnWtSHvgM1x62oXUYRpSYdzSvadINfZrrr6befA9tModCwNoQndP34S4dVZMIlD5xWohYEWzmTXGN5J/TMt2BvydE+dWoFqrFXNeJYPpx8X2PDHaMEjXscoNnvJkD3J5a5cURZCjqcMbO9fQ+HHmK/E339MhZXVLxGYJz0IBh7VPAtrzOhX+3P0d2Bb5peJW1K3keZcp/CJ+ENdhUMneZ125ikA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=znjCa8zI0q68x+XGLgf6Rmam0XAfaH6jV2sdeI0QLiI=;
 b=HAw8zPlUz3m2wa0EiEt1eCm+zeeeeawsTuhtaWiVKvdUk+QS2+Te5BHayD8Bj3IBflkKCBmwExt7zXtD8qmmrx37nUHAQlyjmIUyEGDM5eEVBY8gLT+/a96ADzVBj2cA5DN1skLrmsBJ+g/dIKk0tBdx721AZQbWmHom6NYelIORb1WSVFQ9bJ/unpL7szFyJU5JU5fjvQQa+Cj10IGFlIoCEEkBVIKNik70OGoS00yf82Dy3+UFdYb6zvvdZBKrqrCJgp24wkzDrsuOj0FzsWfMS4wDr7voH1dbBtsxe8uRM56qrpJOKhL2hB51/e0+69/y7x60dJWbl7ZSxllqvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=znjCa8zI0q68x+XGLgf6Rmam0XAfaH6jV2sdeI0QLiI=;
 b=MxyfswLkANHiNm9cq4XMfiDT4ANXxyJkUCcCLQ9FZjz9ADcjYlZvSeS55IfraLYYmnplHit1vMonZxRj56ZUqkROKth9jxYmf0NUK9qHhBBNwn941NpUnBo7fkWZVr+4FUCbFvH0GwY2SoM38GblzYKEsJsLrb0Ls8aLLhin0rY=
Received: from BYAPR03MB4135.namprd03.prod.outlook.com (20.177.127.85) by
 BYAPR03MB4903.namprd03.prod.outlook.com (20.179.92.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20; Tue, 29 Oct 2019 19:54:25 +0000
Received: from BYAPR03MB4135.namprd03.prod.outlook.com
 ([fe80::1c9c:d382:1308:515c]) by BYAPR03MB4135.namprd03.prod.outlook.com
 ([fe80::1c9c:d382:1308:515c%7]) with mapi id 15.20.2387.027; Tue, 29 Oct 2019
 19:54:25 +0000
From:   Andrew Duggan <aduggan@synaptics.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Christopher Heiny <Cheiny@synaptics.com>,
        Simon Wood <simon@mungewell.org>,
        Nick Dyer <nick@shmanahar.org>
Subject: Re: [PATCH 1/3] Input: synaptics-rmi4 - disable the relative position
 IRQ in the F12 driver
Thread-Topic: [PATCH 1/3] Input: synaptics-rmi4 - disable the relative
 position IRQ in the F12 driver
Thread-Index: AQHVisrE0vTfWVJQc0GvTvForKD/Kadvjm4AgAKBToA=
Date:   Tue, 29 Oct 2019 19:54:25 +0000
Message-ID: <09cba6d5-b282-a0ea-8774-4bd121930df9@synaptics.com>
References: <20191025002527.3189-1-aduggan@synaptics.com>
 <20191025002527.3189-2-aduggan@synaptics.com>
 <20191028053904.GG163068@dtor-ws>
In-Reply-To: <20191028053904.GG163068@dtor-ws>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.147.44.15]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-clientproxiedby: BYAPR05CA0104.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::45) To BYAPR03MB4135.namprd03.prod.outlook.com
 (2603:10b6:a03:77::21)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aduggan@synaptics.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3e76f186-074d-4230-606a-08d75ca9ccb9
x-ms-traffictypediagnostic: BYAPR03MB4903:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR03MB49037C93178576BA1ACDB2D6B2610@BYAPR03MB4903.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0205EDCD76
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(346002)(376002)(396003)(366004)(39860400002)(199004)(189003)(386003)(186003)(14454004)(102836004)(53546011)(26005)(6506007)(6486002)(66066001)(25786009)(36756003)(476003)(65956001)(966005)(2616005)(65806001)(478600001)(446003)(71200400001)(71190400001)(316002)(14444005)(76176011)(256004)(4326008)(486006)(11346002)(58126008)(52116002)(5660300002)(6916009)(6246003)(66946007)(86362001)(64756008)(99286004)(6116002)(305945005)(229853002)(66446008)(66556008)(66476007)(54906003)(6512007)(6306002)(6436002)(2906002)(3846002)(31696002)(81156014)(7736002)(81166006)(8676002)(31686004)(8936002);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR03MB4903;H:BYAPR03MB4135.namprd03.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:3;
received-spf: None (protection.outlook.com: synaptics.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /SNUfvYYQYFRAnQq1w5fUKEBBogHg8PsxTuXjtJztu/J+KQrqYbj/cHCFxcvW5Pgv/eLXOMy2F2Wvt33iOiHVtiqiwcfpB/PnOJUFm1aOHKsLYncxlqv1Qb+XrfguGESGjmZUw2T9i/6KD1ehZpw5Jhwb3Go5fljc+lOR49Gy4w0HwpdvTMKL8D0Uebpk9mcpL6W1HlyYpy1pvEws92pO5vjqEX8ydhbg6s34XOqcHClzNh7JjIMaVlDcnZRTEAI6ywmTkh96adRObPpYF6WRVIoMpZZdYob7rJTDc1ZTGUM2MafktGx+VVeBg2d052+fSMTtVQiXkpxX0ZRhLiuFJWnORYssSZD3qlYyjMFy0Fn3ZySQZ/pW3iGDINocpVSFYMIsMrW/e5EHNEX5RKJmpiFtRrj3W5KXc8kaka0JQgPq3c7xsw/Sjv03JoHCqSzEdE9Hjnk/SnAr2C2KQw8yW9jFZ8DXLH7Pmj18JN63rU=
Content-Type: text/plain; charset="utf-8"
Content-ID: <62365E303A9537428EF24CC65EA10A3D@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e76f186-074d-4230-606a-08d75ca9ccb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2019 19:54:25.1682
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: epWmPlgHJukKHeyTJw6LhSKLlz361/18Cekgw+BB4equaPCT5bzrUkHHCeCcrVjuanJYTZ4hSmEq2GFZRUPuNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4903
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

SGkgRG1pdHJ5LA0KDQpPbiAxMC8yNy8xOSAxMDozOSBQTSwgRG1pdHJ5IFRvcm9raG92IHdyb3Rl
Og0KPg0KPiBIaSBBbmRyZXcsDQo+DQo+IE9uIEZyaSwgT2N0IDI1LCAyMDE5IGF0IDEyOjI1OjU2
QU0gKzAwMDAsIEFuZHJldyBEdWdnYW4gd3JvdGU6DQo+PiBUaGlzIHBhdGNoIGZpeGVzIGFuIGlz
c3VlIHNlZW4gb24gSElEIHRvdWNocGFkcyB3aGljaCByZXBvcnQgZmluZ2VyDQo+PiBwb3NpdGlv
bnMgdXNpbmcgUk1JNCBGdW5jdGlvbiAxMi4gVGhlIGlzc3VlIG1hbmlmZXN0cyBpdHNlbGYgYXMN
Cj4+IHNwdXJpb3VzIGJ1dHRvbiBwcmVzc2VzIGFzIGRlc2NyaWJlZCBpbjoNCj4+IGh0dHBzOi8v
d3d3LnNwaW5pY3MubmV0L2xpc3RzL2xpbnV4LWlucHV0L21zZzU4NjE4Lmh0bWwNCj4+DQo+PiBD
b21taXQgMjRkMjhlNGYxMjcxICgiSW5wdXQ6IHN5bmFwdGljcy1ybWk0IC0gY29udmVydCBpcnEg
ZGlzdHJpYnV0aW9uDQo+PiB0byBpcnFfZG9tYWluIikgc3dpdGNoZWQgdGhlIFJNSTQgZHJpdmVy
IHRvIHVzaW5nIGFuIGlycV9kb21haW4gdG8gaGFuZGxlDQo+PiBSTUk0IGZ1bmN0aW9uIGludGVy
cnVwdHMuIEZ1bmN0aW9ucyB3aXRoIG1vcmUgdGhlbiBvbmUgaW50ZXJydXB0IG5vdyBoYXZlDQo+
PiBlYWNoIGludGVycnVwdCBtYXBwZWQgdG8gdGhlaXIgb3duIElSUSBhbmQgSVJRIGhhbmRsZXIu
IFRoZSByZXN1bHQgb2YNCj4+IHRoaXMgY2hhbmdlIGlzIHRoYXQgdGhlIEYxMiBJUlEgaGFuZGxl
ciB3YXMgbm93IGdldHRpbmcgY2FsbGVkIHR3aWNlLiBPbmNlDQo+PiBmb3IgdGhlIGFic29sdXRl
IGRhdGEgaW50ZXJydXB0IGFuZCBvbmNlIGZvciB0aGUgcmVsYXRpdmUgZGF0YSBpbnRlcnJ1cHQu
DQo+PiBGb3IgSElEIGRldmljZXMsIGNhbGxpbmcgcm1pX2YxMl9hdHRlbnRpb24oKSBhIHNlY29u
ZCB0aW1lIGNhdXNlcyB0aGUNCj4+IGF0dG5fZGF0YSBkYXRhIHBvaW50ZXIgYW5kIHNpemUgdG8g
YmUgc2V0IGluY29ycmVjdGx5LiBXaGVuIHRoZSB0b3VjaHBhZA0KPj4gYnV0dG9uIGlzIHByZXNz
ZWQsIEYzMCB3aWxsIGdlbmVyYXRlIGFuIGludGVycnVwdCBhbmQgYXR0ZW1wdCB0byByZWFkIHRo
ZQ0KPj4gRjMwIGRhdGEgZnJvbSB0aGUgaW52YWxpZCBhdHRuX2RhdGEgZGF0YSBwb2ludGVyIGFu
ZCByZXBvcnQgaW5jb3JyZWN0DQo+PiBidXR0b24gZXZlbnRzLg0KPiBNYXliZSB3ZSBzaG91bGQg
Y3JlYXRlIG9ubHkgMSBpbnRlcnJ1cHQgcGVyIGZ1bmN0aW9uIGluc3RlYWQgb2YNCj4gbXVsdGlw
bGU/IEl0IGxvb2tzIGxpa2UgdGhlIGZ1bmN0aW9ucyByZWFkIHRoZWlyIGVudGlyZSBibG9jayBv
ZiBkYXRhIG9uDQo+IGFueSBpbnRlcnJ1cHQgcmVjZWl2ZWQuDQoNClllcywgd2UgY291bGQgb25s
eSBjcmVhdGUgMSBpbnRlcnJ1cHQgcGVyIGZ1bmN0aW9uLiBXZSBjb3VsZCBtb2RpZnkgdGhlIA0K
cm1pX2NyZWF0ZV9mdW5jdGlvbl9pcnEoKSBmdW5jdGlvbiB0byBvbmx5IG1hcCBhIHNwZWNpZmlj
IElSUSBhbmQgY2FsbCANCml0IGZyb20gdGhlIGZ1bmN0aW9uIGRyaXZlcidzIHByb2JlIGZ1bmN0
aW9uIGluc3RlYWQgb2YgDQpybWlfZnVuY3Rpb25fcHJvYmUoKS4gSSBjb25zaWRlcmVkIHRoYXQs
IGJ1dCBpdCB3YXMgYSBiaXQgbW9yZSBvZiBhIA0KbW9kaWZpY2F0aW9uIHRoZW4gSSB3YW50ZWQg
dG8gbWFrZSBhdCB0aGlzIHBvaW50Lg0KDQo+PiBUaGlzIHBhdGNoIGRpc2FibGVzIHRoZSBGMTIg
cmVsYXRpdmUgaW50ZXJydXB0IHdoaWNoIHByZXZlbnRzDQo+PiBybWlfZjEyX2F0dGVudGlvbigp
IGZyb20gYmVpbmcgY2FsbGVkIHR3aWNlLg0KPiBEb24ndCB3ZSBoYXZlIHNpbWlsYXIgaXNzdWUg
d2l0aCBGMTEsIGFuZCBtYXliZSBvdGhlcnM/DQoNCkN1cnJlbnRseSwgRjExIHByZXZlbnRzIHRo
aXMgZnJvbSBoYXBwZW5pbmcgYnkgZGlzYWJsaW5nIG9uZSBvZiB0aGUgdHdvIA0KSVJRcyBvbiB0
aGUgdG91Y2ggY29udHJvbGxlciAodXN1YWxseSB0aGUgcmVsYXRpdmUgSVJRKS4gRjExIHdpbGwg
ZGVjaWRlIA0KdG8gcmVwb3J0IGFicyBvciByZWwgZXZlbnRzIGJhc2VkIG9uIHRoZSBGMTEgcXVl
cnkgcmVnaXN0ZXJzLiBUaGVuIGl0IA0Kd2lsbCBzZXQgdGhlIElSUSBpdCB3YW50cyBhbmQgY2xl
YXIgdGhlIElSUSBpdCBkb2VzIG5vdCBpbiANCnJtaV9mMTFfY29uZmlnKCkuIEJvdGggSVJRcyBh
cmUgc3RpbGwgbWFwcGVkIGluIHRoZSBpcnFfZG9tYWluLCBidXQgdGhlIA0KdG91Y2ggY29udHJv
bGxlciB3aWxsIG9ubHkgZ2VuZXJhdGUgYW4gSVJRIGZvciBvbmUgb2YgdGhlbSBhbmQgDQpybWlf
ZjExX2F0dGVudGlvbigpIHdpbGwgb25seSBiZSBjYWxsZWQgb25jZS4gSSBiZWxpZXZlIEYxMSBh
bmQgRjEyIGFyZSANCnRoZSBvbmx5IFJNSSBmdW5jdGlvbnMgd2hpY2ggcmVwb3J0IG1vcmUgdGhl
biBvbmUgSVJRLiBFdmVuIGlmIA0KdGVjaG5pY2FsbHkgdGhlIHNwZWMgYWxsb3dzIHVwIHRvIDYg
dG8gYmUgZGVjbGFyZWQuIFRoaXMgcGF0Y2gganVzdCANCmltcGxlbWVudHMgdGhlIHNhbWUgYmVo
YXZpb3IgYXMgRjExIGZvciBGMTIuDQoNCj4NCj4gQWxzbywgYXMgZmFyIGFzIEYxMiBnb2VzLCBJ
IHNlZSB0aGF0IGl0IG1heSBtYXJrIHNlbnNvciBhcyByZXBvcnRpbmcNCj4gcmVsYXRpdmUgY29v
cmRpbmF0ZXMsIGJ1dCBJIGRvIG5vdCBzZWUgd2hlcmUgaXQgd291bGQgYWN0dWFsbHkgZW1pdA0K
PiByZWxhdGl2ZSBldmVudHMuIEkgbXVzdCBiZSBtaXNzaW5nIHNvbWV0aGluZyBoZXJlLi4uDQoN
Ck5vcGUsIHlvdSBhcmUgbm90IG1pc3NpbmcgYW55dGhpbmcuIFRoZSBjb2RlIHRvIHBhcnNlIHRo
ZSByZWxhdGl2ZSBkYXRhIA0KZnJvbSB0aGUgZGF0YTkgcmVnaXN0ZXIgd2FzIG5ldmVyIGltcGxl
bWVudGVkLiBJIG5vdGljZWQgdGhhdCB0b28gd2hlbiANCmNyZWF0aW5nIHRoaXMgcGF0Y2guIFRo
aXMgbXVzdCBoYXZlIGJlZW4gYW4gb3ZlcnNpZ2h0IGR1cmluZyB0aGUgDQpvcmlnaW5hbCBpbXBs
ZW1lbnRhdGlvbiBvZiB0aGUgRjEyIGRyaXZlci4gSSBjb25zaWRlcmVkIGFkZGluZyB0aGUgY29k
ZSANCnRvIHJlcG9ydCByZWxhdGl2ZSBldmVudHMsIGJ1dCBJIGRpZCBub3QgaGF2ZSBhbnkgaGFy
ZHdhcmUgcmVhZGlseSANCmF2YWlsYWJsZSB0byB0ZXN0IHdpdGguIEl0IHNlZW1zIHVubGlrZWx5
IHRoYXQgdGhlcmUgd291bGQgYmUgYSBkZXZpY2UgDQp1c2luZyBvbmUgb2Ygb3VyIHRvdWNoIGNv
bnRyb2xsZXJzIHN1cHBvcnRpbmcgRjEyIHdoaWNoIG9ubHkgcmVwb3J0ZWQgDQpyZWxhdGl2ZSBl
dmVudHMuIEFsc28sIG5vIG9uZSBzZWVtcyB0byBoYXZlIGNvbXBsYWluZWQgYWJvdXQgdGhlIGxh
c3Qgb2YgDQpyZXBvcnRpbmcgcmVsYXRpdmUgZXZlbnRzIGluIHRoZSBsYXN0IGZldyB5ZWFycy4g
SW5zdGVhZCwgaW4gdGhpcyBwYXRjaCANCkkganVzdCBjbGVhciB0aGUgcmVsYXRpdmUgSVJRIHRv
IHByZXZlbnQgcm1pX2YxMl9hdHRlbnRpb24oKSBmcm9tIGJlaW5nIA0KY2FsbGVkIHR3aWNlLiBJ
IGNvdWxkIGFkZCBhIGNvbW1lbnQgb3IgYSB3YXJuaW5nIHN0YXRpbmcgdGhhdCByZXBvcnRpbmcg
DQpyZWxhdGl2ZSBldmVudHMgaW4gRjEyIGlzIHVuc3VwcG9ydGVkLg0KDQpUaGFua3MsDQoNCkFu
ZHJldw0KDQo+IFRoYW5rcy4NCj4NCj4gLS0NCj4gRG1pdHJ5DQo=
