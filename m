Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D5342D622
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2019 09:21:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726080AbfE2HVK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 29 May 2019 03:21:10 -0400
Received: from mga17.intel.com ([192.55.52.151]:56432 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726076AbfE2HVK (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 29 May 2019 03:21:10 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 May 2019 00:21:10 -0700
X-ExtLoop1: 1
Received: from orsmsx105.amr.corp.intel.com ([10.22.225.132])
  by fmsmga007.fm.intel.com with ESMTP; 29 May 2019 00:21:10 -0700
Received: from orsmsx111.amr.corp.intel.com (10.22.240.12) by
 ORSMSX105.amr.corp.intel.com (10.22.225.132) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 29 May 2019 00:21:10 -0700
Received: from orsmsx121.amr.corp.intel.com ([169.254.10.47]) by
 ORSMSX111.amr.corp.intel.com ([169.254.12.165]) with mapi id 14.03.0415.000;
 Wed, 29 May 2019 00:21:09 -0700
From:   "Yang, Hyungwoo" <hyungwoo.yang@intel.com>
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
CC:     "jikos@kernel.org" <jikos@kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: RE: [PATCH 1/2] HID: intel-ish-hid: fix wrong type conversion
Thread-Topic: [PATCH 1/2] HID: intel-ish-hid: fix wrong type conversion
Thread-Index: AQHVFcAUp0WZphGmAEqc3eYPMfuoe6aBrsmQ
Date:   Wed, 29 May 2019 07:21:09 +0000
Message-ID: <7A4F467111FEF64486F40DFE7DF3500A221AE4ED@ORSMSX121.amr.corp.intel.com>
References: <1559079417-32039-1-git-send-email-hyungwoo.yang@intel.com>
 <03654457d996c839e8f91bf329819defd8726a14.camel@linux.intel.com>
In-Reply-To: <03654457d996c839e8f91bf329819defd8726a14.camel@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNWY0NTdhYzUtNTk2ZC00MTdmLWEzMWYtY2M1MDhkMGJlMjZiIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiMWtRV3lHUlVLMWdUNUgrY29id0UzR0hkUzY1SHI4VDgwNEhWanRVRXBpMURjXC92MitIWnpNSDNScGJDM1JUXC90In0=
x-ctpclassification: CTP_NT
x-originating-ip: [10.22.254.140]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

PiBPbiBUdWUsIDIwMTktMDUtMjggYXQgMTQ6MzYgLTA3MDAsIEh5dW5nd29vIFlhbmcgd3JvdGU6
DQo+ID4gInN0cnVjdCBkZXZpY2UiIGlzIGVtYmVkZGVkIGluICJzdHJ1Y3QgaXNodHBfY2xfZGV2
aWNlIi4NCj4gPiBzbyB0aGUgY29udmVyc2lvbiBzaG91bGQgYmUgZG9uZSBieSBjb250YWluZXJf
b2YoKSBtZXRob2QuDQo+IFdoaWNoIHRyZWUgdGhpcyBwYXRjaCBpcyBnb2luZyB0bz8gWW91IGNh
bid0IGV2ZW4gYXBwbHkgb24gdGhlIG1haW5saW5lIHRyZWUgKDUuMi1yYzIpLiBBbHNvIHlvdSB3
aWxsIG5vdCBiZSBhYmxlIHRvIGNvbXBpbGUgZXZlbiBpZiB5b3UgYWRkcmVzcyB0aGUgY29uZmxp
Y3QgKFRoZSBwYXRjaCBvcmRlcmluZyBpcyB3cm9uZykuIA0KDQpPaC4uIEkgd2Fzbid0IGNhcmVm
dWwgdG8gc3BsaXQgdGhlIHBhdGNoIGFmdGVyIHRlc3RpbmcuIEkndmUgY29ycmVjdGVkLg0KDQo+
IA0KPiBXaGF0IHdhcyBzeW1wdG9tIG9yIHByb2JsZW0geW91IHRyeSB0byBhZGRyZXNzPyBJcyB0
aGVyZSBhbnkgY3Jhc2ggb3IgYnVnIG9jY3VycmVkPyBEb2VzIGl0IGhhcHBlbiB3aXRoIHRoZSBt
YWlubGluZSBrZXJuZWw/DQpJJ3ZlIGFkZGVkIHRoZSBkZXRhaWwgaW4gY29tbWl0IG1lc3NhZ2Ug
aW4gdjIuIEJhc2ljYWxseSBkdWUgdG8gd3JvbmcgdXNhZ2Ugb2YgZHJpdmVyX2RhdGEgb2YgaXNo
dHAgY2xpZW50IGRldmljZSwgd2Ugc2VlIGtlcm5lbCBjcmFzaC4gQ3VycmVudGx5IGRyaXZlcl9k
YXRhIGlzIHNldCBieSBidXMgZHJpdmVyIHdoaWNoIGlzIHdyb25nIHNpbmNlIGRyaXZlcl9kYXRh
IHNob3VsZCBiZSBvd25lZCBieSBjb3JyZXNwb25kaW5nIGRldmljZSBkcml2ZXIuIFJpZ2h0IG5v
dywgd2Ugc2VlIGtlcm5lbCBjcmFzaCBkdXJpbmcgc3VzcGVuZCgpIG9mIGNyb3NfZWNfaXNodHAu
IFllcywgaXQgaGFwcGVucyB3aXRoIHRoZSBtYWlubGluZSBrZXJuZWwgc2luY2UgY3Jvc19lY19p
c2h0cCBpcyBhbHJlYWR5IHVwc3RyZWFtZWQuDQoNCj4gDQo+IA0KPiA+IA0KPiA+IENoYW5nZS1J
ZDogSWRjYmFmZTcyNGUyMTZlZTYyNzVmOWQxZTM1YTNiNzljZWU1Y2U4OGMNCj4gVGhpcyB0ZWxs
cyBtZSB0aGF0IHlvdSBhcmUgdHJ5aW5nIHRvIGZpeCBzb21lIENocm9tZSBpc3N1ZS4gRG9uJ3Qg
aW5jbHVkZSB0aGVzZSB0YWdzIGZvciBtYWlubGluZSBrZXJuZWwuDQpkb25lIGluIHYyLiBUaGFu
ayB5b3UuDQoNCj4gDQo+IFRoYW5rcywNCj4gU3Jpbml2YXMNCg0KVGhhbmtzLA0KSHl1bmd3b28N
Cg==
