Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D09662E4EF
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2019 21:03:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726101AbfE2TDo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 29 May 2019 15:03:44 -0400
Received: from mga11.intel.com ([192.55.52.93]:26734 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726054AbfE2TDo (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 29 May 2019 15:03:44 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 May 2019 12:03:44 -0700
X-ExtLoop1: 1
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
  by orsmga008.jf.intel.com with ESMTP; 29 May 2019 12:03:43 -0700
Received: from orsmsx124.amr.corp.intel.com (10.22.240.120) by
 ORSMSX106.amr.corp.intel.com (10.22.225.133) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 29 May 2019 12:03:43 -0700
Received: from orsmsx121.amr.corp.intel.com ([169.254.10.47]) by
 ORSMSX124.amr.corp.intel.com ([169.254.2.120]) with mapi id 14.03.0415.000;
 Wed, 29 May 2019 12:03:43 -0700
From:   "Yang, Hyungwoo" <hyungwoo.yang@intel.com>
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
CC:     "jikos@kernel.org" <jikos@kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: RE: [PATCH 1/2] HID: intel-ish-hid: fix wrong type conversion
Thread-Topic: [PATCH 1/2] HID: intel-ish-hid: fix wrong type conversion
Thread-Index: AQHVFcAUp0WZphGmAEqc3eYPMfuoe6aBrsmQgAEAxgD//8WNoA==
Date:   Wed, 29 May 2019 19:03:42 +0000
Message-ID: <7A4F467111FEF64486F40DFE7DF3500A221AE604@ORSMSX121.amr.corp.intel.com>
References: <1559079417-32039-1-git-send-email-hyungwoo.yang@intel.com>
         <03654457d996c839e8f91bf329819defd8726a14.camel@linux.intel.com>
         <7A4F467111FEF64486F40DFE7DF3500A221AE4ED@ORSMSX121.amr.corp.intel.com>
 <ae3d89b762181828b8c8ae4eb3cd59110d864b9b.camel@linux.intel.com>
In-Reply-To: <ae3d89b762181828b8c8ae4eb3cd59110d864b9b.camel@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZjc5Mjk4NWItNjY3Mi00ZTUxLThiMzAtZTlkNTcyOWM5ZDI5IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoieGFJNFArODBTZ1NVOGRcL2NreWJxZ0NGemdxdVJaeXdBRUpoU1cwbVI3ak5LVHVwV2h3b2RzODljSDlqeVdqWmcifQ==
x-ctpclassification: CTP_NT
x-originating-ip: [10.22.254.140]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

PiBPbiBXZWQsIDIwMTktMDUtMjkgYXQgMDc6MjEgKzAwMDAsIFlhbmcsIEh5dW5nd29vIHdyb3Rl
Og0KPiA+ID4gT24gVHVlLCAyMDE5LTA1LTI4IGF0IDE0OjM2IC0wNzAwLCBIeXVuZ3dvbyBZYW5n
IHdyb3RlOg0KPiA+ID4gDQo+ID4gPiBXaGF0IHdhcyBzeW1wdG9tIG9yIHByb2JsZW0geW91IHRy
eSB0byBhZGRyZXNzPyBJcyB0aGVyZSBhbnkgY3Jhc2ggDQo+ID4gPiBvciBidWcgb2NjdXJyZWQ/
IERvZXMgaXQgaGFwcGVuIHdpdGggdGhlIG1haW5saW5lIGtlcm5lbD8NCj4gPiANCj4gPiBJJ3Zl
IGFkZGVkIHRoZSBkZXRhaWwgaW4gY29tbWl0IG1lc3NhZ2UgaW4gdjIuIEJhc2ljYWxseSBkdWUg
dG8gd3JvbmcgDQo+ID4gdXNhZ2Ugb2YgZHJpdmVyX2RhdGEgb2YgaXNodHAgY2xpZW50IGRldmlj
ZSwgd2Ugc2VlIGtlcm5lbCBjcmFzaC4NCj4gPiBDdXJyZW50bHkgZHJpdmVyX2RhdGEgaXMgc2V0
IGJ5IGJ1cyBkcml2ZXIgd2hpY2ggaXMgd3Jvbmcgc2luY2UgDQo+ID4gZHJpdmVyX2RhdGEgc2hv
dWxkIGJlIG93bmVkIGJ5IGNvcnJlc3BvbmRpbmcgZGV2aWNlIGRyaXZlci4gUmlnaHQgbm93LCAN
Cj4gPiB3ZSBzZWUga2VybmVsIGNyYXNoIGR1cmluZyBzdXNwZW5kKCkgb2YgY3Jvc19lY19pc2h0
cC4gWWVzLCBpdCBoYXBwZW5zIA0KPiA+IHdpdGggdGhlIG1haW5saW5lIGtlcm5lbCBzaW5jZSBj
cm9zX2VjX2lzaHRwIGlzIGFscmVhZHkgdXBzdHJlYW1lZC4NCj4gVGVjaG5pY2FsbHkgdGhpcyBk
cml2ZXIgaXMgbm90IG1haW5saW5lLiBJdCB3aWxsIGdvIGluIDUuMy4NCj4gDQo+IFRoZSBwcm9i
bGVtIGlzICBjcm9zX2VjIGlzaCBkcml2ZXIgaXMgb3ZlcnJpZGluZyBkcml2ZXJfZGF0YSAiDQo+
IAljbGllbnRfZGF0YS0+ZWNfZGV2ID0gZWNfZGV2Ow0KPiAJZGV2LT5kcml2ZXJfZGF0YSA9IGVj
X2RldjsNCj4gIg0KPiBUaGUgY2xpZW50IGRyaXZlcnMgb3duIHRoZSBkcml2ZXIgZGF0YSBpbiBp
dHMgInN0cnVjdCBpc2h0cF9jbF9kZXZpY2UgKiIgbm90IHRoZSBzdHJ1Y3QgZGV2aWNlICouDQoN
Ck5vLiBzdGlsbCBkcml2ZXJfZGF0YSBpbiAic3RydWN0IGRldmljZSIgc2hvdWxkIGJlIG93bmVk
IGJ5IGl0cyBkZXZpY2UgZHJpdmVyLiBTbyB0aGVyZSdzIG5vIHByb2JsZW0gaGVyZSBzaW5jZSBj
cm9zX2VjX2lzaCBkcml2ZXIgaXMgb3duZXIgb2YgdGhlIGRldmljZS4gDQoNCj4gDQo+IEFzIGZh
ciBhcyBJIGNhbiBzZWUgdGhlIHB1cnBvc2Ugb2YgdGhpcyBpcyB0byBnZXQgZGV2aWNlIHBvaW50
ZXIgZm9yIGRlYnVnIHB1cnBvc2Ugb25seS4NCg0KSXQncyBub3QgZm9yIGRlYnVnIHB1cnBvc2Ug
YW5kIG1vc3QgaW1wb3J0YW50bHkgZHJpdmVyX2RhdGEgaW4gInN0cnVjdCBkZXZpY2UiIGlzIHVz
ZWQgYnkgaXRzIGNoaWxkIGluIGVjX2RldmljZV9wcm9iZSgpDQpTbyB3cm9uZyB1c2FnZSBvZiBk
cml2ZXJfZGF0YSBzaG91bGQgYmUgY29ycmVjdGVkLg0KDQo+IA0KPiBJIHRoaW5rIHlvdSBjYW4g
cmVtb3ZlIHRoZSBkZXYtPmRyaXZlcl9kYXRhIGFzc2lnbm1lbnQgYW5kIHNpbXBseSByZXBsYWNl
DQo+IA0KPiBkZXZfKihkZXYsDQo+IA0KPiB0bw0KPiBkZXZfKihlY19kZXYtPmRldiwNCj4gDQo+
IFRoYW5rcywNCj4gU3Jpbml2YXMNCg0KVGhhbmtzLA0KSHl1bmd3b28NCg==
