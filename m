Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 655807A0A9E
	for <lists+linux-input@lfdr.de>; Thu, 14 Sep 2023 18:19:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230502AbjINQTo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 Sep 2023 12:19:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229992AbjINQTn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 Sep 2023 12:19:43 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 819D11BE1;
        Thu, 14 Sep 2023 09:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694708379; x=1726244379;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=9L18DpglYGuALGNLgXH0mKUUMhmDOGiuLGfiAw6wnxM=;
  b=TXKQnOtMYbRGiNfhOfrwmp9Um67ZvIrtIsMHqDEsPRFYDxWAeNGzRIkz
   8HXelzMQrtMOFfJLaxRrHK9s59gO3Om02EmpC3X+hQsyPvtWP8Q3AIXeD
   Dkq+lhny4Pv+Eqxoe1iYxdCvDxbR07wwcHSGsmMfe0Hr+ZqFmv+a15OnT
   4sMjE01Rf884VK5YayrYlknKkiiDbS+bPkbTc24L7e3L3Iq5Pi4dKF2LZ
   TMXRWsT4VA/13mg4i3Im5Ev3EhfUClKAFcGzf6joNVFRn+Z5GGK80DYZy
   IPClIDzSqpEbIVOgzg9vz1opHYuvTMJGa7yxBMcBBe6frjr9NXHQPClPs
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="359258172"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="scan'208";a="359258172"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 09:11:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="859763286"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="scan'208";a="859763286"
Received: from spandruv-desk1.amr.corp.intel.com ([10.209.46.39])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 09:11:30 -0700
Message-ID: <7b45ac2ed091497b4e21a6a5c19956161175ba16.camel@linux.intel.com>
Subject: Re: [PATCH] HID: intel-ish-hid: ipc: Rework EHL OOB wakeup
From:   srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>, jikos@kernel.org,
        benjamin.tissoires@redhat.com
Cc:     linux-pm@vger.kernel.org, linux-pci@vger.kernel.org,
        Jian Hui Lee <jianhui.lee@canonical.com>,
        Even Xu <even.xu@intel.com>, Zhang Lixu <lixu.zhang@intel.com>,
        Najumon Ba <najumon.ba@intel.com>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Thu, 14 Sep 2023 09:11:29 -0700
In-Reply-To: <20230914041806.816741-1-kai.heng.feng@canonical.com>
References: <20230914041806.816741-1-kai.heng.feng@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

SGkgRXZlbiwKCk9uIFRodSwgMjAyMy0wOS0xNCBhdCAxMjoxOCArMDgwMCwgS2FpLUhlbmcgRmVu
ZyB3cm90ZToKPiBTeXN0ZW0gY2Fubm90IHN1c3BlbmQgbW9yZSB0aGFuIDI1NSB0aW1lcyBiZWNh
dXNlIHRoZSBkcml2ZXIgZG9lc24ndAo+IGhhdmUgY29ycmVzcG9uZGluZyBhY3BpX2Rpc2FibGVf
Z3BlKCkgZm9yIGFjcGlfZW5hYmxlX2dwZSgpLCBzbyB0aGUKPiBHUEUKPiByZWZjb3VudCBvdmVy
Zmxvd3MuCj4gCj4gU2luY2UgUENJIGNvcmUgYW5kIEFDUEkgY29yZSBhbHJlYWR5IGhhbmRsZXMg
UENJIFBNRSB3YWtlIGFuZCBHUEUKPiB3YWtlCj4gd2hlbiB0aGUgZGV2aWNlIGhhcyB3YWtldXAg
Y2FwYWJpbGl0eSwgdXNlIGRldmljZV9pbml0X3dha2V1cCgpIHRvCj4gbGV0Cj4gdGhlbSBkbyB0
aGUgd2FrZXVwIHNldHRpbmcgd29yay4KPiAKPiBBbHNvIGFkZCBhIHNodXRkb3duIGNhbGxiYWNr
IHdoaWNoIHVzZXMgcGNpX3ByZXBhcmVfdG9fc2xlZXAoKSB0byBsZXQKPiBQQ0kgYW5kIEFDUEkg
c2V0IE9PQiB3YWtldXAgZm9yIFM1Lgo+IApQbGVhc2UgdGVzdCB0aGlzIGNoYW5nZS4KClRoYW5r
cywKU3Jpbml2YXMKCj4gRml4ZXM6IDJlMjNhNzBlZGFiZSAoIkhJRDogaW50ZWwtaXNoLWhpZDog
aXBjOiBmaW5pc2ggcG93ZXIgZmxvdyBmb3IKPiBFSEwgT09CIikKPiBDYzogSmlhbiBIdWkgTGVl
IDxqaWFuaHVpLmxlZUBjYW5vbmljYWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEthaS1IZW5nIEZl
bmcgPGthaS5oZW5nLmZlbmdAY2Fub25pY2FsLmNvbT4KPiAtLS0KPiDCoGRyaXZlcnMvaGlkL2lu
dGVsLWlzaC1oaWQvaXBjL3BjaS1pc2guYyB8IDU5ICsrKysrKystLS0tLS0tLS0tLS0tLS0tCj4g
LS0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCA0NCBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9oaWQvaW50ZWwtaXNoLWhpZC9pcGMvcGNpLWlzaC5j
Cj4gYi9kcml2ZXJzL2hpZC9pbnRlbC1pc2gtaGlkL2lwYy9wY2ktaXNoLmMKPiBpbmRleCA1NWNi
MjUwMzhlNjMuLjY1ZTdlZWIyZmE2NCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2hpZC9pbnRlbC1p
c2gtaGlkL2lwYy9wY2ktaXNoLmMKPiArKysgYi9kcml2ZXJzL2hpZC9pbnRlbC1pc2gtaGlkL2lw
Yy9wY2ktaXNoLmMKPiBAQCAtMTE5LDQyICsxMTksNiBAQCBzdGF0aWMgaW5saW5lIGJvb2wgaXNo
X3Nob3VsZF9sZWF2ZV9kMGkzKHN0cnVjdAo+IHBjaV9kZXYgKnBkZXYpCj4gwqDCoMKgwqDCoMKg
wqDCoHJldHVybiAhcG1fcmVzdW1lX3ZpYV9maXJtd2FyZSgpIHx8IHBkZXYtPmRldmljZSA9PQo+
IENIVl9ERVZJQ0VfSUQ7Cj4gwqB9Cj4gwqAKPiAtc3RhdGljIGludCBlbmFibGVfZ3BlKHN0cnVj
dCBkZXZpY2UgKmRldikKPiAtewo+IC0jaWZkZWYgQ09ORklHX0FDUEkKPiAtwqDCoMKgwqDCoMKg
wqBhY3BpX3N0YXR1cyBhY3BpX3N0czsKPiAtwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgYWNwaV9kZXZp
Y2UgKmFkZXY7Cj4gLcKgwqDCoMKgwqDCoMKgc3RydWN0IGFjcGlfZGV2aWNlX3dha2V1cCAqd2Fr
ZXVwOwo+IC0KPiAtwqDCoMKgwqDCoMKgwqBhZGV2ID0gQUNQSV9DT01QQU5JT04oZGV2KTsKPiAt
wqDCoMKgwqDCoMKgwqBpZiAoIWFkZXYpIHsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgZGV2X2VycihkZXYsICJnZXQgYWNwaSBoYW5kbGUgZmFpbGVkXG4iKTsKPiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIC1FTk9ERVY7Cj4gLcKgwqDCoMKgwqDCoMKgfQo+
IC3CoMKgwqDCoMKgwqDCoHdha2V1cCA9ICZhZGV2LT53YWtldXA7Cj4gLQo+IC3CoMKgwqDCoMKg
wqDCoGFjcGlfc3RzID0gYWNwaV9lbmFibGVfZ3BlKHdha2V1cC0+Z3BlX2RldmljZSwgd2FrZXVw
LQo+ID5ncGVfbnVtYmVyKTsKPiAtwqDCoMKgwqDCoMKgwqBpZiAoQUNQSV9GQUlMVVJFKGFjcGlf
c3RzKSkgewo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkZXZfZXJyKGRldiwgImVu
YWJsZSBvc2VfZ3BlIGZhaWxlZFxuIik7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oHJldHVybiAtRUlPOwo+IC3CoMKgwqDCoMKgwqDCoH0KPiAtCj4gLcKgwqDCoMKgwqDCoMKgcmV0
dXJuIDA7Cj4gLSNlbHNlCj4gLcKgwqDCoMKgwqDCoMKgcmV0dXJuIC1FTk9ERVY7Cj4gLSNlbmRp
Zgo+IC19Cj4gLQo+IC1zdGF0aWMgdm9pZCBlbmFibGVfcG1lX3dha2Uoc3RydWN0IHBjaV9kZXYg
KnBkZXYpCj4gLXsKPiAtwqDCoMKgwqDCoMKgwqBpZiAoKHBjaV9wbWVfY2FwYWJsZShwZGV2LCBQ
Q0lfRDApIHx8Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGNpX3BtZV9jYXBhYmxlKHBkZXYs
IFBDSV9EM2hvdCkgfHwKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwY2lfcG1lX2NhcGFibGUo
cGRldiwgUENJX0QzY29sZCkpICYmICFlbmFibGVfZ3BlKCZwZGV2LQo+ID5kZXYpKSB7Cj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHBjaV9wbWVfYWN0aXZlKHBkZXYsIHRydWUpOwo+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkZXZfZGJnKCZwZGV2LT5kZXYsICJpc2gg
aXBjIGRyaXZlciBwbWUgd2FrZQo+IGVuYWJsZWRcbiIpOwo+IC3CoMKgwqDCoMKgwqDCoH0KPiAt
fQo+IC0KPiDCoC8qKgo+IMKgICogaXNoX3Byb2JlKCkgLSBQQ0kgZHJpdmVyIHByb2JlIGNhbGxi
YWNrCj4gwqAgKiBAcGRldjrCoMKgwqDCoMKgwqBwY2kgZGV2aWNlCj4gQEAgLTIyNSw3ICsxODks
NyBAQCBzdGF0aWMgaW50IGlzaF9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwgY29uc3QKPiBz
dHJ1Y3QgcGNpX2RldmljZV9pZCAqZW50KQo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoC8qIEVuYWJs
ZSBQTUUgZm9yIEVITCAqLwo+IMKgwqDCoMKgwqDCoMKgwqBpZiAocGRldi0+ZGV2aWNlID09IEVI
TF9BeF9ERVZJQ0VfSUQpCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGVuYWJsZV9w
bWVfd2FrZShwZGV2KTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZGV2aWNlX2lu
aXRfd2FrZXVwKGRldiwgdHJ1ZSk7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgcmV0ID0gaXNoX2lu
aXQoaXNodHApOwo+IMKgwqDCoMKgwqDCoMKgwqBpZiAocmV0KQo+IEBAIC0yNDgsNiArMjEyLDE5
IEBAIHN0YXRpYyB2b2lkIGlzaF9yZW1vdmUoc3RydWN0IHBjaV9kZXYgKnBkZXYpCj4gwqDCoMKg
wqDCoMKgwqDCoGlzaF9kZXZpY2VfZGlzYWJsZShpc2h0cF9kZXYpOwo+IMKgfQo+IMKgCj4gKwo+
ICsvKioKPiArICogaXNoX3NodXRkb3duKCkgLSBQQ0kgZHJpdmVyIHNodXRkb3duIGNhbGxiYWNr
Cj4gKyAqIEBwZGV2OsKgwqDCoMKgwqDCoHBjaSBkZXZpY2UKPiArICoKPiArICogVGhpcyBmdW5j
dGlvbiBzZXRzIHVwIHdha2V1cCBmb3IgUzUKPiArICovCj4gK3N0YXRpYyB2b2lkIGlzaF9zaHV0
ZG93bihzdHJ1Y3QgcGNpX2RldiAqcGRldikKPiArewo+ICvCoMKgwqDCoMKgwqDCoGlmIChwZGV2
LT5kZXZpY2UgPT0gRUhMX0F4X0RFVklDRV9JRCkKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgcGNpX3ByZXBhcmVfdG9fc2xlZXAocGRldik7Cj4gK30KPiArCj4gwqBzdGF0aWMgc3Ry
dWN0IGRldmljZSBfX21heWJlX3VudXNlZCAqaXNoX3Jlc3VtZV9kZXZpY2U7Cj4gwqAKPiDCoC8q
IDUwbXMgdG8gZ2V0IHJlc3VtZSByZXNwb25zZSAqLwo+IEBAIC0zNzAsMTMgKzM0Nyw2IEBAIHN0
YXRpYyBpbnQgX19tYXliZV91bnVzZWQgaXNoX3Jlc3VtZShzdHJ1Y3QKPiBkZXZpY2UgKmRldmlj
ZSkKPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHBjaV9kZXYgKnBkZXYgPSB0b19wY2lfZGV2KGRl
dmljZSk7Cj4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBpc2h0cF9kZXZpY2UgKmRldiA9IHBjaV9n
ZXRfZHJ2ZGF0YShwZGV2KTsKPiDCoAo+IC3CoMKgwqDCoMKgwqDCoC8qIGFkZCB0aGlzIHRvIGZp
bmlzaCBwb3dlciBmbG93IGZvciBFSEwgKi8KPiAtwqDCoMKgwqDCoMKgwqBpZiAoZGV2LT5wZGV2
LT5kZXZpY2UgPT0gRUhMX0F4X0RFVklDRV9JRCkgewo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBwY2lfc2V0X3Bvd2VyX3N0YXRlKHBkZXYsIFBDSV9EMCk7Cj4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoGVuYWJsZV9wbWVfd2FrZShwZGV2KTsKPiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgZGV2X2RiZyhkZXYtPmRldmMsICJzZXQgcG93ZXIgc3RhdGUgdG8g
RDAgZm9yCj4gZWhsXG4iKTsKPiAtwqDCoMKgwqDCoMKgwqB9Cj4gLQo+IMKgwqDCoMKgwqDCoMKg
wqBpc2hfcmVzdW1lX2RldmljZSA9IGRldmljZTsKPiDCoMKgwqDCoMKgwqDCoMKgZGV2LT5yZXN1
bWVfZmxhZyA9IDE7Cj4gwqAKPiBAQCAtMzkyLDYgKzM2Miw3IEBAIHN0YXRpYyBzdHJ1Y3QgcGNp
X2RyaXZlciBpc2hfZHJpdmVyID0gewo+IMKgwqDCoMKgwqDCoMKgwqAuaWRfdGFibGUgPSBpc2hf
cGNpX3RibCwKPiDCoMKgwqDCoMKgwqDCoMKgLnByb2JlID0gaXNoX3Byb2JlLAo+IMKgwqDCoMKg
wqDCoMKgwqAucmVtb3ZlID0gaXNoX3JlbW92ZSwKPiArwqDCoMKgwqDCoMKgwqAuc2h1dGRvd24g
PSBpc2hfc2h1dGRvd24sCj4gwqDCoMKgwqDCoMKgwqDCoC5kcml2ZXIucG0gPSAmaXNoX3BtX29w
cywKPiDCoH07Cj4gwqAKCg==

