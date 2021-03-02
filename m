Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B76432A580
	for <lists+linux-input@lfdr.de>; Tue,  2 Mar 2021 17:20:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350775AbhCBMt2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 2 Mar 2021 07:49:28 -0500
Received: from mail.ilitek.com.tw ([60.248.80.92]:40597 "EHLO cello.ilitek.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1442935AbhCBCRG (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 1 Mar 2021 21:17:06 -0500
X-UUID: a8cca4f7c214477da15ffb0ed0b3f805-20210302
X-UUID: a8cca4f7c214477da15ffb0ed0b3f805-20210302
Received: from ex1.ili.com.tw [(192.168.1.131)] by cello.ilitek.com
        (envelope-from <joe_hung@ilitek.com>)
        (Cellopoint E-mail Firewall v4.1.12 Build 0701 with TLSv1.2 ECDHE-RSA-AES128-GCM-SHA256 128/128)
        with ESMTP id 549005813; Tue, 02 Mar 2021 10:06:36 +0800
Received: from EX2.ili.com.tw (192.168.1.132) by EX1.ili.com.tw
 (192.168.1.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Tue, 2 Mar 2021
 10:06:34 +0800
Received: from EX2.ili.com.tw ([fe80::89a8:5a29:1f3a:8b1f]) by EX2.ili.com.tw
 ([fe80::89a8:5a29:1f3a:8b1f%4]) with mapi id 15.01.2176.002; Tue, 2 Mar 2021
 10:06:34 +0800
From:   =?utf-8?B?Sm9lIEh1bmcgKOa0qumKmOmZvSk=?= <joe_hung@ilitek.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        =?utf-8?B?THVjYSBIc3UgKOW+kOWYiemNiik=?= <luca_hsu@ilitek.com>
Subject: RE: [PATCH v3 2/2] input: touchscreen: Add support for ILITEK Lego
 Series
Thread-Topic: [PATCH v3 2/2] input: touchscreen: Add support for ILITEK Lego
 Series
Thread-Index: AQHXBcGFMZWAxP5I60GjiTB9vp3IZKphmbUAgAHrrYCABGZ6gIAAsoEAgAWGhoCAAdoH4A==
Date:   Tue, 2 Mar 2021 02:06:34 +0000
Message-ID: <13ed84f1653144f384949fd04686368d@ilitek.com>
References: <20210218064435.1360483-1-joe_hung@ilitek.com>
 <20210218064435.1360483-2-joe_hung@ilitek.com> <YDH0/tSytUagrzKP@google.com>
 <3d8c4d2e56fd40cc859b393c292432ac@ilitek.com> <YDdCZdRJAqBvVZFZ@google.com>
 <4c0d711cd2f046938dbd34a1bf0d9661@ilitek.com> <YDx6udLZf6thd4KQ@google.com>
In-Reply-To: <YDx6udLZf6thd4KQ@google.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.30.38]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

SGkgRG1pdHJ5LA0KDQpUaGFuayB5b3UgZm9yIHRoZSBxdWljayByZXNwb25zZS4NCldvdWxkIHVw
ZGF0ZSBLY29uZmlnIGFsc28gaW4gdjQuDQoNCk9uIFN1biwgRmViIDI4LCAyMDIxIGF0IDIxOjI1
OjEzUE0gLTA4MDAsIERtaXRyeSBUb3Jva2hvdiB3cm90ZToNCj4gSGkgSm9lLA0KPiANCj4gT24g
RnJpLCBGZWIgMjYsIDIwMjEgYXQgMDg6MzA6MjVBTSArMDAwMCwgSm9lIEh1bmcgKOa0qumKmOmZ
vSkgd3JvdGU6DQo+ID4gSGVsbG8gRG1pdHJ5LA0KPiA+IA0KPiA+IFRoYW5rIHlvdSBmb3IgdGhl
IHF1aWNrIHJlc3BvbnNlLg0KPiA+IFVuZGVyc3RhbmQgYW5kIGFncmVlZCBvbiBhbGwgeW91ciBj
b21tZW50cy4NCj4gPiANCj4gPiBMaXR0bGUgcXVlc3Rpb24gYWJvdXQgdGhlIG5hbWUgb2YgcHJl
Zml4IGFuZCB0aGlzIGRyaXZlciBmaWxlLA0KPiA+IGNvdWxkIGl0IGJlIG5hbWVkIGFjY29yZGlu
ZyB0byBkaWZmZXJlbnQgcHJvdG9jb2wgdmVyc2lvbiBuYW1lZCBieSBJTElURUsgaW50ZXJuYWxs
eQ0KPiA+IGFzIGlsaXRla19wNnguYyAoYXMgcHJvdG9jb2wgdmVyc2lvbiA2IGZvciBMZWdvIHNl
cmllcywgYW5kIGlsaTIxMHguYyBzaG91bGQgYmUgcHJvdG9jb2wgMikuDQo+ID4gDQo+ID4gSW4g
YWRkaXRpb24sIGNvdWxkIHdlIG5hbWVkIGl0IGxpa2UgaG93IHRvdWNoc2NyZWVuL2VsYW50c19p
MmMuYyBhbmQgZWZ0ZjIxMjcuYyB3b3JrZWQ/DQo+IA0KPiBTbyBlbGFudHNfaTJjIHZzIGVmdGYy
MTI3IGlzIGhpc3RvcmljYWwgYXJ0ZWZhY3Qgd2l0aCBlbGFudHNfaTJjIGJlaW5nDQo+IHRoZXJl
IGZpcnN0Lg0KPiANCj4gPiBJcyB0aGVyZSBhIHdheSB0aGF0IHdlIGNvdWxkIGtlZXAgaWxpdGVr
IGFzIHByZWZpeCBhbmQgZHJpdmVyIGZpbGUncyBuYW1lPw0KPiANCj4gT0ssIHRoaXMgaXMgcmVh
bGx5IGEgbWlub3IgcG9pbnQgYXMgZmFyIGFzIEkgYW0gY29uY2VybmVkIGFuZCB3ZSBzcGVudA0K
PiB3YXkgdG9vIG11Y2ggdGltZSBkZWJhdGluZyBpdC4gWW91IG1heSBrZWVwIGlsaXRlayBmaWxl
IG5hbWUgYW5kIHByZWZpeA0KPiBpZiB5b3Ugd291bGQgcHJlZmVyLiBKdXN0IG1ha2Ugc3VyZSB5
b3UgbGlzdCBzdXBwb3J0ZWQNCj4gY29udHJvbGxlcnMvcHJvdG9jb2xzIGluIEtjb25maWcgYW5k
IHRoYXQgc2hvdWxkIGJlIGVub3VnaC4NCg0KQWdyZWVkOyB0aGFuayB5b3UgdmVyeSBtdWNoLg0K
DQo+IA0KPiBUaGFua3MuDQo+IA0KPiAtLSANCj4gRG1pdHJ5DQoNClRoYW5rIHlvdSB2ZXJ5IG11
Y2guDQoNCi0tDQpKb2UgSHVuZw0K

