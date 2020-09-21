Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23BA52728BA
	for <lists+linux-input@lfdr.de>; Mon, 21 Sep 2020 16:46:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728050AbgIUOpQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Sep 2020 10:45:16 -0400
Received: from mga04.intel.com ([192.55.52.120]:47344 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727782AbgIUOpK (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Sep 2020 10:45:10 -0400
IronPort-SDR: phKSgqcMCRQBHIWLg6j96d9u8k9YxBFlfVclbQ3tmX8rdY2x2AZgD5LxzCUaGSRPzqAaF75Bwk
 wln5/2Li8zmQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9751"; a="157777807"
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; 
   d="scan'208";a="157777807"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2020 07:45:06 -0700
IronPort-SDR: 8DUjGiPnGeN6AciKCMuyeW3uwQeJCvcnqGdo9BhLjLd7/UHqoR3F3GyMBZaI6aCKOLaWDPfq4y
 hohn7jr1z1+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; 
   d="scan'208";a="341604466"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
  by fmsmga002.fm.intel.com with ESMTP; 21 Sep 2020 07:45:05 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 21 Sep 2020 07:45:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 21 Sep 2020 07:45:04 -0700
Received: from orsmsx610.amr.corp.intel.com ([10.22.229.23]) by
 ORSMSX610.amr.corp.intel.com ([10.22.229.23]) with mapi id 15.01.1713.004;
 Mon, 21 Sep 2020 07:45:04 -0700
From:   "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
To:     "jikos@kernel.org" <jikos@kernel.org>,
        "benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>,
        "miaoqinglang@huawei.com" <miaoqinglang@huawei.com>
CC:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH -next] HID: intel-ish-hid: simplify the return expression
 of ishtp_bus_remove_device()
Thread-Topic: [PATCH -next] HID: intel-ish-hid: simplify the return expression
 of ishtp_bus_remove_device()
Thread-Index: AQHWkCXKtK5BXobwTUa9QkzzJLpciQ==
Date:   Mon, 21 Sep 2020 14:45:04 +0000
Message-ID: <ca452e8f61c2e828bc3ec2dc5993f87d251e5e38.camel@intel.com>
References: <20200921131033.92017-1-miaoqinglang@huawei.com>
In-Reply-To: <20200921131033.92017-1-miaoqinglang@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
x-originating-ip: [10.22.254.132]
Content-Type: text/plain; charset="utf-8"
Content-ID: <001ABCCBE88C0340A153033F12F751DB@intel.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

T24gTW9uLCAyMDIwLTA5LTIxIGF0IDIxOjEwICswODAwLCBRaW5nbGFuZyBNaWFvIHdyb3RlOg0K
PiBTaW1wbGlmeSB0aGUgcmV0dXJuIGV4cHJlc3Npb24uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBR
aW5nbGFuZyBNaWFvIDxtaWFvcWluZ2xhbmdAaHVhd2VpLmNvbT4NCkFja2VkLWJ5OiBTcmluaXZh
cyBQYW5kcnV2YWRhIDxzcmluaXZhcy5wYW5kcnV2YWRhQGxpbnV4LmludGVsLmNvbT4NCg0KPiAt
LS0NCj4gIGRyaXZlcnMvaGlkL2ludGVsLWlzaC1oaWQvaXNodHAvYnVzLmMgfCA4ICstLS0tLS0t
DQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDcgZGVsZXRpb25zKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9oaWQvaW50ZWwtaXNoLWhpZC9pc2h0cC9idXMuYw0KPiBi
L2RyaXZlcnMvaGlkL2ludGVsLWlzaC1oaWQvaXNodHAvYnVzLmMNCj4gaW5kZXggYzQ3YzMzMjhh
Li5iYmEyOWNkMzYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvaGlkL2ludGVsLWlzaC1oaWQvaXNo
dHAvYnVzLmMNCj4gKysrIGIvZHJpdmVycy9oaWQvaW50ZWwtaXNoLWhpZC9pc2h0cC9idXMuYw0K
PiBAQCAtNTAyLDggKzUwMiw2IEBAIHN0YXRpYyB2b2lkIGlzaHRwX2J1c19yZW1vdmVfZGV2aWNl
KHN0cnVjdA0KPiBpc2h0cF9jbF9kZXZpY2UgKmRldmljZSkNCj4gIGludCBpc2h0cF9jbF9kcml2
ZXJfcmVnaXN0ZXIoc3RydWN0IGlzaHRwX2NsX2RyaXZlciAqZHJpdmVyLA0KPiAgCQkJICAgICBz
dHJ1Y3QgbW9kdWxlICpvd25lcikNCj4gIHsNCj4gLQlpbnQgZXJyOw0KPiAtDQo+ICAJaWYgKCFp
c2h0cF9kZXZpY2VfcmVhZHkpDQo+ICAJCXJldHVybiAtRU5PREVWOw0KPiAgDQo+IEBAIC01MTEs
MTEgKzUwOSw3IEBAIGludCBpc2h0cF9jbF9kcml2ZXJfcmVnaXN0ZXIoc3RydWN0DQo+IGlzaHRw
X2NsX2RyaXZlciAqZHJpdmVyLA0KPiAgCWRyaXZlci0+ZHJpdmVyLm93bmVyID0gb3duZXI7DQo+
ICAJZHJpdmVyLT5kcml2ZXIuYnVzID0gJmlzaHRwX2NsX2J1c190eXBlOw0KPiAgDQo+IC0JZXJy
ID0gZHJpdmVyX3JlZ2lzdGVyKCZkcml2ZXItPmRyaXZlcik7DQo+IC0JaWYgKGVycikNCj4gLQkJ
cmV0dXJuIGVycjsNCj4gLQ0KPiAtCXJldHVybiAwOw0KPiArCXJldHVybiBkcml2ZXJfcmVnaXN0
ZXIoJmRyaXZlci0+ZHJpdmVyKTsNCj4gIH0NCj4gIEVYUE9SVF9TWU1CT0woaXNodHBfY2xfZHJp
dmVyX3JlZ2lzdGVyKTsNCj4gIA0K
