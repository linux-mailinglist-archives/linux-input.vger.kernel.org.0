Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D8D133BCA
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2019 01:13:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726136AbfFCXN5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 3 Jun 2019 19:13:57 -0400
Received: from mga18.intel.com ([134.134.136.126]:30634 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726097AbfFCXN5 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 3 Jun 2019 19:13:57 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Jun 2019 16:13:56 -0700
X-ExtLoop1: 1
Received: from orsmsx110.amr.corp.intel.com ([10.22.240.8])
  by fmsmga004.fm.intel.com with ESMTP; 03 Jun 2019 16:13:56 -0700
Received: from orsmsx116.amr.corp.intel.com (10.22.240.14) by
 ORSMSX110.amr.corp.intel.com (10.22.240.8) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 3 Jun 2019 16:13:55 -0700
Received: from orsmsx121.amr.corp.intel.com ([169.254.10.47]) by
 ORSMSX116.amr.corp.intel.com ([169.254.7.165]) with mapi id 14.03.0415.000;
 Mon, 3 Jun 2019 16:13:55 -0700
From:   "Yang, Hyungwoo" <hyungwoo.yang@intel.com>
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
CC:     "jikos@kernel.org" <jikos@kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "Kadam, Rushikesh S" <rushikesh.s.kadam@intel.com>,
        "jettrink@chromium.org" <jettrink@chromium.org>
Subject: RE: [PATCH v3 1/2] Add linux-next specific files for 20190524
Thread-Topic: [PATCH v3 1/2] Add linux-next specific files for 20190524
Thread-Index: AQHVGl/asZREYayojEuPY7KmhPsy6qaKjvLg
Date:   Mon, 3 Jun 2019 23:13:54 +0000
Message-ID: <7A4F467111FEF64486F40DFE7DF3500A221AF959@ORSMSX121.amr.corp.intel.com>
References: <1559171345-28248-1-git-send-email-hyungwoo.yang@intel.com>
 <d76d3c17776d66595efc586f65ec1a6d7f40b244.camel@linux.intel.com>
In-Reply-To: <d76d3c17776d66595efc586f65ec1a6d7f40b244.camel@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOTMxZThhNjYtODU1Yy00MTI5LTlmMDktMjFmY2JkMzIyZDFjIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiUkZHRzVIQVcrZlhrdmlsZG9RaVhubFJ4QVJuWko5Sm9rTk1CZThhZTB6Wk5aWmtNTHhqalFFN29ieEJxYmVcL2gifQ==
x-ctpclassification: CTP_NT
x-originating-ip: [10.22.254.138]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

SGksDQoNCkkgZG9uJ3QgdW5kZXJzdGFuZCB3aGF0IHlvdSBtZWFuLg0KDQpZb3UgbWVhbiB0aGUg
bGF0ZXN0IHBhdGNoKGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTA5Njc5MjEv
KSBzaG91bGQgYmUgcmV2aWV3ZWQgaW50ZXJuYWxseSBmaXJzdD8NClRoaXMgaXMgYSBzaW1wbGUg
Zml4IHNvIEkgZGlkbid0IGRvLg0KDQpIb3cgYWJvdXQgb3RoZXIgcGVvcGxlIG5vdCBmcm9tIElu
dGVsIGJ1dCBmb3VuZCBhIGJ1Zz8NCg0KVGVsbCBtZSB3aGF0IHRvIGRvLg0KDQpUaGFua3MsDQpI
eXVuZ3dvbw0KDQo+IEhpIEh5dW5nd29vLA0KPiANCj4gVGhpcyBpcyBub3QgdGhlIGNvcnJlY3Qg
cHJvY2VzcyB0byBzdWJtaXQgYnkgYnJpbmdpbmcgbmV4dCBmaWxlcyB0bw0KPiBtYWlubGluZS4g
UGxlYXNlIGxldCB5b3VyIHBhdGNoZXMgZ2V0IHJldmlld2VkIGludGVybmFsbHkgdG8gYXZvaWQg
c3VjaA0KPiBtaXN0YWtlcy4NCj4gDQo+IEkgYW0gb24gdmFjYXRpb24gdGlsbCBsYXRlciB0aGlz
IG1vbnRoLCBzbyBpdCBpcyBkaWZmaWN1bHQgZm9yIG1lIHRvDQo+IGFkZHJlc3MgdGhpcyBpc3N1
ZS4gQW55d2F5IHRoaXMgaXMgbm90IGEgYnVnIHRvIGJlIGZpeGVkIGZvciB0aGUNCj4gY3VycmVu
dCA1LjItcmMqDQo+IA0KPiANCj4gVGhhbmtzLA0KPiBTcmluaXZhcw0KDQo=
