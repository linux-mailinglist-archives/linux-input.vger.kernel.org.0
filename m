Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57BC66BCA9F
	for <lists+linux-input@lfdr.de>; Thu, 16 Mar 2023 10:19:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229669AbjCPJT4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Mar 2023 05:19:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230448AbjCPJTx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Mar 2023 05:19:53 -0400
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 440FB23A4C
        for <linux-input@vger.kernel.org>; Thu, 16 Mar 2023 02:19:51 -0700 (PDT)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id 5BEE5C0005;
        Thu, 16 Mar 2023 09:19:49 +0000 (UTC)
Message-ID: <1aa6be4ede37b1c7f9d11896c4b23a7a630592fa.camel@hadess.net>
Subject: Re: [PATCH] Input: goodix - Add Lenovo Yoga Book X90F to
 nine_bytes_report DMI table
From:   Bastien Nocera <hadess@hadess.net>
To:     Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Date:   Thu, 16 Mar 2023 10:19:48 +0100
In-Reply-To: <20230315134442.71787-1-hdegoede@redhat.com>
References: <20230315134442.71787-1-hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

T24gV2VkLCAyMDIzLTAzLTE1IGF0IDE0OjQ0ICswMTAwLCBIYW5zIGRlIEdvZWRlIHdyb3RlOgo+
IFRoZSBBbmRyb2lkIExlbm92byBZb2dhIEJvb2sgWDkwRiAvIFg5MEwgdXNlcyB0aGUgc2FtZSBn
b29kaXgKPiB0b3VjaHNjcmVlbgo+IHdpdGggOSBieXRlcyB0b3VjaCByZXBvcnRzIGZvciBpdHMg
dG91Y2gga2V5Ym9hcmQgYXMgdGhlIGFscmVhZHkKPiBzdXBwb3J0ZWQKPiBXaW5kb3dzIExlbm92
byBZb2dhIEJvb2sgWDkxRi9MLCBhZGQgYSBETUkgbWF0Y2ggZm9yIHRoaXMgdG8KPiB0aGUgbmlu
ZV9ieXRlc19yZXBvcnQgRE1JIHRhYmxlLgo+IAo+IFdoZW4gdGhlIHF1aXJrIGZvciB0aGUgWDkx
Ri9MIHdhcyBpbml0aWFsbHkgYWRkZWQgaXQgd2FzIHdyaXR0ZW4gdG8KPiBhbHNvIGFwcGx5IHRv
IHRoZSBYOTBGL0wgYnV0IHRoaXMgZG9lcyBub3Qgd29yayBiZWNhdXNlIHRoZSBBbmRyb2lkCj4g
dmVyc2lvbiBvZiB0aGUgWW9nYSBCb29rIHVzZXMgY29tcGxldGVseSBkaWZmZXJlbnQgRE1JIHN0
cmluZ3MuCj4gQWxzbyBhZGp1c3QgdGhlIFg5MUYvTCBxdWlyayB0byByZWZsZWN0IHRoYXQgaXQg
b25seSBhcHBsaWVzIHRvCj4gdGhlIFg5MUYvTCBtb2RlbHMuCj4gCj4gU2lnbmVkLW9mZi1ieTog
SGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4KCkxHVE0KClJldmlld2VkLWJ5OiBC
YXN0aWVuIE5vY2VyYSA8aGFkZXNzQGhhZGVzcy5uZXQ+Cgo+IC0tLQo+IMKgZHJpdmVycy9pbnB1
dC90b3VjaHNjcmVlbi9nb29kaXguYyB8IDE0ICsrKysrKysrKysrLS0tCj4gwqAxIGZpbGUgY2hh
bmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9pbnB1dC90b3VjaHNjcmVlbi9nb29kaXguYwo+IGIvZHJpdmVycy9pbnB1dC90b3Vj
aHNjcmVlbi9nb29kaXguYwo+IGluZGV4IDNjNzFmMGRmOTc2OS4uODhjMjIzYTRkYTYxIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvaW5wdXQvdG91Y2hzY3JlZW4vZ29vZGl4LmMKPiArKysgYi9kcml2
ZXJzL2lucHV0L3RvdWNoc2NyZWVuL2dvb2RpeC5jCj4gQEAgLTEyOCwxMCArMTI4LDE4IEBAIHN0
YXRpYyBjb25zdCB1bnNpZ25lZCBsb25nIGdvb2RpeF9pcnFfZmxhZ3NbXSA9Cj4gewo+IMKgc3Rh
dGljIGNvbnN0IHN0cnVjdCBkbWlfc3lzdGVtX2lkIG5pbmVfYnl0ZXNfcmVwb3J0W10gPSB7Cj4g
wqAjaWYgZGVmaW5lZChDT05GSUdfRE1JKSAmJiBkZWZpbmVkKENPTkZJR19YODYpCj4gwqDCoMKg
wqDCoMKgwqDCoHsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLmlkZW50ID0gIkxl
bm92byBZb2dhQm9vayIsCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8qIFlCMS1Y
OTFML0YgYW5kIFlCMS1YOTBML0YgKi8KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
LyogTGVub3ZvIFlvZ2EgQm9vayBYOTBGIC8gWDkwTCAqLwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgLm1hdGNoZXMgPSB7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBETUlfTUFUQ0goRE1JX1BST0RVQ1RfTkFNRSwgIkxlbm92byBZQjEt
WDkiKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgRE1J
X0VYQUNUX01BVENIKERNSV9TWVNfVkVORE9SLCAiSW50ZWwKPiBDb3Jwb3JhdGlvbiIpLAo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgRE1JX0VYQUNUX01B
VENIKERNSV9QUk9EVUNUX05BTUUsICJDSEVSUllWSUVXCj4gRDEgUExBVEZPUk0iKSwKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoERNSV9FWEFDVF9NQVRD
SChETUlfUFJPRFVDVF9WRVJTSU9OLCAiWUVUSS0KPiAxMSIpLAo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqB9Cj4gK8KgwqDCoMKgwqDCoMKgfSwKPiArwqDCoMKgwqDCoMKgwqB7Cj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8qIExlbm92byBZb2dhIEJvb2sgWDkxRiAv
IFg5MUwgKi8KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLm1hdGNoZXMgPSB7Cj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAvKiBOb24gZXhh
Y3QgbWF0Y2ggdG8gbWF0Y2ggRiArIEwgdmVyc2lvbnMgKi8KPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoERNSV9NQVRDSChETUlfUFJPRFVDVF9OQU1FLCAi
TGVub3ZvIFlCMS0KPiBYOTEiKSwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0K
PiDCoMKgwqDCoMKgwqDCoMKgfSwKPiDCoCNlbmRpZgoK

