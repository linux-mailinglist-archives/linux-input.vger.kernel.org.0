Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AA9930481
	for <lists+linux-input@lfdr.de>; Fri, 31 May 2019 00:02:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726576AbfE3WCd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 30 May 2019 18:02:33 -0400
Received: from mga09.intel.com ([134.134.136.24]:19108 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726498AbfE3WCc (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 30 May 2019 18:02:32 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 May 2019 14:34:58 -0700
X-ExtLoop1: 1
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
  by orsmga005.jf.intel.com with ESMTP; 30 May 2019 14:34:58 -0700
Received: from orsmsx121.amr.corp.intel.com ([169.254.10.47]) by
 ORSMSX106.amr.corp.intel.com ([169.254.1.30]) with mapi id 14.03.0415.000;
 Thu, 30 May 2019 14:34:58 -0700
From:   "Yang, Hyungwoo" <hyungwoo.yang@intel.com>
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
CC:     "jikos@kernel.org" <jikos@kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: RE: [PATCH 1/2] HID: intel-ish-hid: fix wrong type conversion
Thread-Topic: [PATCH 1/2] HID: intel-ish-hid: fix wrong type conversion
Thread-Index: AQHVFcAUp0WZphGmAEqc3eYPMfuoe6aBrsmQgAEAxgD//8WNoIAAgPaAgAAICICAATVaYA==
Date:   Thu, 30 May 2019 21:34:57 +0000
Message-ID: <7A4F467111FEF64486F40DFE7DF3500A221AEB6A@ORSMSX121.amr.corp.intel.com>
References: <1559079417-32039-1-git-send-email-hyungwoo.yang@intel.com>
         <03654457d996c839e8f91bf329819defd8726a14.camel@linux.intel.com>
         <7A4F467111FEF64486F40DFE7DF3500A221AE4ED@ORSMSX121.amr.corp.intel.com>
         <ae3d89b762181828b8c8ae4eb3cd59110d864b9b.camel@linux.intel.com>
         <7A4F467111FEF64486F40DFE7DF3500A221AE604@ORSMSX121.amr.corp.intel.com>
         <e2cc2cefeb74c86e49945b7fc2c222c663ea80f7.camel@linux.intel.com>
 <0315386b41f5b5446b5b5b55c957f6346a953fa5.camel@linux.intel.com>
In-Reply-To: <0315386b41f5b5446b5b5b55c957f6346a953fa5.camel@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNmY2Y2FjZmEtYTEzMS00ZTIwLTg5YmMtZGI1NzI4OWZlMDg4IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiRnprTDhYN09ONlFZSkRuUHprVFFWSlwvODBmKzk1SWJzMTdlNEFHQkNyRkRENGtKTkhTcTdndVdqT0RyN3AxOSsifQ==
x-ctpclassification: CTP_NT
x-originating-ip: [10.22.254.140]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

PiBPbiBXZWQsIDIwMTktMDUtMjkgYXQgMTI6MzggLTA3MDAsIFNyaW5pdmFzIFBhbmRydXZhZGEg
d3JvdGU6DQo+ID4gT24gV2VkLCAyMDE5LTA1LTI5IGF0IDE5OjAzICswMDAwLCBZYW5nLCBIeXVu
Z3dvbyB3cm90ZToNCj4gPiA+ID4gPiBPbiBXZWQsIDIwMTktMDUtMjkgYXQgMDc6MjEgKzAwMDAs
IFlhbmcsIEh5dW5nd29vIHdyb3RlOg0KPiA+ID4gPiA+ID4gPiBPbiBUdWUsIDIwMTktMDUtMjgg
YXQgMTQ6MzYgLTA3MDAsIEh5dW5nd29vIFlhbmcgd3JvdGU6DQo+ID4gPiA+ID4gPiANCj4gPiA+
ID4gPiA+IFdoYXQgd2FzIHN5bXB0b20gb3IgcHJvYmxlbSB5b3UgdHJ5IHRvIGFkZHJlc3M/IElz
IHRoZXJlIGFueSANCj4gPiA+ID4gPiA+IGNyYXNoIG9yIGJ1ZyBvY2N1cnJlZD8gRG9lcyBpdCBo
YXBwZW4gd2l0aCB0aGUgbWFpbmxpbmUgDQo+ID4gPiA+ID4gPiBrZXJuZWw/DQo+ID4gPiA+ID4g
DQo+ID4gPiA+ID4gSSd2ZSBhZGRlZCB0aGUgZGV0YWlsIGluIGNvbW1pdCBtZXNzYWdlIGluIHYy
LiBCYXNpY2FsbHkgZHVlIHRvIA0KPiA+ID4gPiA+IHdyb25nIHVzYWdlIG9mIGRyaXZlcl9kYXRh
IG9mIGlzaHRwIGNsaWVudCBkZXZpY2UsIHdlIHNlZSBrZXJuZWwgDQo+ID4gPiA+ID4gY3Jhc2gu
DQo+ID4gPiA+ID4gQ3VycmVudGx5IGRyaXZlcl9kYXRhIGlzIHNldCBieSBidXMgZHJpdmVyIHdo
aWNoIGlzIHdyb25nIHNpbmNlIA0KPiA+ID4gPiA+IGRyaXZlcl9kYXRhIHNob3VsZCBiZSBvd25l
ZCBieSBjb3JyZXNwb25kaW5nIGRldmljZSBkcml2ZXIuDQo+ID4gPiA+ID4gUmlnaHQNCj4gPiA+
ID4gPiBub3csDQo+ID4gPiA+ID4gd2Ugc2VlIGtlcm5lbCBjcmFzaCBkdXJpbmcgc3VzcGVuZCgp
IG9mIGNyb3NfZWNfaXNodHAuIFllcywgaXQgDQo+ID4gPiA+ID4gaGFwcGVucyB3aXRoIHRoZSBt
YWlubGluZSBrZXJuZWwgc2luY2UgY3Jvc19lY19pc2h0cCBpcyBhbHJlYWR5IA0KPiA+ID4gPiA+
IHVwc3RyZWFtZWQuDQo+ID4gPiA+IA0KPiA+ID4gPiBUZWNobmljYWxseSB0aGlzIGRyaXZlciBp
cyBub3QgbWFpbmxpbmUuIEl0IHdpbGwgZ28gaW4gNS4zLg0KPiA+ID4gPiANCj4gPiA+ID4gVGhl
IHByb2JsZW0gaXMgIGNyb3NfZWMgaXNoIGRyaXZlciBpcyBvdmVycmlkaW5nIGRyaXZlcl9kYXRh
ICINCj4gPiA+ID4gCWNsaWVudF9kYXRhLT5lY19kZXYgPSBlY19kZXY7DQo+ID4gPiA+IAlkZXYt
PmRyaXZlcl9kYXRhID0gZWNfZGV2Ow0KPiA+ID4gPiAiDQo+ID4gPiA+IFRoZSBjbGllbnQgZHJp
dmVycyBvd24gdGhlIGRyaXZlciBkYXRhIGluIGl0cyAic3RydWN0IA0KPiA+ID4gPiBpc2h0cF9j
bF9kZXZpY2UgKiIgbm90IHRoZSBzdHJ1Y3QgZGV2aWNlICouDQo+ID4gPiANCj4gPiA+IE5vLiBz
dGlsbCBkcml2ZXJfZGF0YSBpbiAic3RydWN0IGRldmljZSIgc2hvdWxkIGJlIG93bmVkIGJ5IGl0
cyANCj4gPiA+IGRldmljZSBkcml2ZXIuIFNvIHRoZXJlJ3Mgbm8gcHJvYmxlbSBoZXJlIHNpbmNl
IGNyb3NfZWNfaXNoIGRyaXZlciANCj4gPiA+IGlzIG93bmVyIG9mIHRoZSBkZXZpY2UuDQo+ID4g
DQo+ID4gSSBkb24ndCBrbm93IGhvdyB0aGUgZHJpdmVyIHdhcyBzdWJtaXR0ZWQgd2l0aG91dCBz
dXNwZW5kL3Jlc3VtZSB0ZXN0Lg0KPiA+IA0KPiA+IFNwaWx0IHRoZSBwYXRjaCBpbiB0aGlzIGZv
ciBiaXNlY3QgYW5kIHRoZSBjcm9zLWVjIGlzIG5vdCBpbiA1LjIgeWV0Lg0KPiA+IA0KPiA+IFRo
ZSBmaXJzdCBwYXRjaCwgaXMgdGhlIGNvbWJpbmF0aW9uIG9mIHBhdGNoIDEgYW5kIHBhdGNoIDIg
ZXhjbHVkaW5nIA0KPiA+IGNyb3MtZWMgY2hhbmdlcy4NCj4gPiANCj4gPiBUaGUgc2Vjb25kIHBh
dGNoIGZvciBjcm9zLWVjIG9ubHkgdXNpbmcgdGhlIG5ldyBBUEkuDQo+IA0KPiBBbHNvIHJ1bg0K
PiAuL3NjcmlwdHMvZ2V0X21haW50YWluZXIucGwgb24gdGhlIHBhdGNoZXMNCj4gDQo+IHRvIGdl
dCBtYWludGFpbmVycy9tYWlsaW5nIGxpc3QgdG8gc2VuZC9jb3B5LiBUaGlzIHBhdGNoIHByb2Jh
Ymx5IG5lZWRzIHRvIGdvIGFsb25nIHdpdGggY3Jvcy1lYyBkcml2ZXJzIHB1bGwgcmVxdWVzdC4N
Cg0KVGhhbmsgeW91LCB0aGVyZSB3YXMgc29tZSBtaXN0YWtlIGluIHNlbmRpbmcgcGF0Y2hlcyBi
dXQgYW55d2F5IGxpa2UgeW91IHNhaWQsDQpJJ3ZlIHN1Ym1pdHRlZCBhIHBhdGNoIGNvbWJpbmlu
ZyBwYXRjaDEgYW5kIHBhdGNoMiB3aXRob3V0IGNyb3MtZWMtaXNodHAuIGFuZCBhbHNvIHN1Ym1p
dHRlZCBvbmUgZm9yIGNyb3MtZWMtaXNodHAuDQoNClRoYW5rcywNCkh5dW5nd29vDQo=
