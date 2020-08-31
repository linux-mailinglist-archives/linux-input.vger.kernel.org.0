Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F4AC2574CA
	for <lists+linux-input@lfdr.de>; Mon, 31 Aug 2020 09:57:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728129AbgHaH5D (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 31 Aug 2020 03:57:03 -0400
Received: from spam.zju.edu.cn ([61.164.42.155]:18554 "EHLO zju.edu.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726573AbgHaH46 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 31 Aug 2020 03:56:58 -0400
Received: by ajax-webmail-mail-app2 (Coremail) ; Mon, 31 Aug 2020 15:56:42
 +0800 (GMT+08:00)
X-Originating-IP: [10.192.85.18]
Date:   Mon, 31 Aug 2020 15:56:42 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   dinghao.liu@zju.edu.cn
To:     "Jiri Kosina" <jikos@kernel.org>
Cc:     kjlu@umn.edu, "Benjamin Tissoires" <benjamin.tissoires@redhat.com>,
        "Alexandrov Stansilav" <neko@nya.ai>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH] HID: elan: Fix memleak in elan_input_configured
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.12 build 20200616(0f5d8152)
 Copyright (c) 2002-2020 www.mailtech.cn zju.edu.cn
In-Reply-To: <nycvar.YFH.7.76.2008310947070.27422@cbobk.fhfr.pm>
References: <20200824072400.9612-1-dinghao.liu@zju.edu.cn>
 <nycvar.YFH.7.76.2008310947070.27422@cbobk.fhfr.pm>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <16ff9408.14137.1744384ac0b.Coremail.dinghao.liu@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: by_KCgD3n506rUxfDNhaAg--.58009W
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAg0EBlZdtPrBDAA7s+
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJTRUUUblvS07vEb7Iv0x
        C_Cr1lV2xY67kC6x804xWlV2xY67CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DMIAI
        bVAFxVCF77xC64kEw24lV2xY67C26IkvcIIF6IxKo4kEV4ylV2xY628lY4IE4IxF12IF4w
        CS07vE84x0c7CEj48ve4kI8wCS07vE84ACjcxK6xIIjxv20xvE14v26w1j6s0DMIAIbVA2
        z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJr0_GcWlV2xY628EF7xvwVC2z280aVAFwI0_Gc
        CE3s1lV2xY628EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wCS07vEe2I262IYc4CY6c8I
        j28IcVAaY2xG8wCS07vE5I8CrVACY4xI64kE6c02F40Ex7xfMIAIbVAv7VC0I7IYx2IY67
        AKxVWUJVWUGwCS07vEYx0Ex4A2jsIE14v26r1j6r4UMIAIbVAm72CE4IkC6x0Yz7v_Jr0_
        Gr1lV2xY6x02cVAKzwCS07vEc2IjII80xcxEwVAKI48JMIAIbVCF04k20xvE74AGY7Cv6c
        x26r4fKr1UJr1lV2xY6xCjnVCjjxCrMIAIbVCFx2IqxVCFs4IE7xkEbVWUJVW8JwCS07vE
        x2IqxVAqx4xG67AKxVWUJVWUGwCS07vEx2IqxVCjr7xvwVAFwI0_JrI_JrWlV2xY6I8E67
        AF67kF1VAFwI0_JF0_Jw1lV2xY6IIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lV2xY6IIF0xvE
        2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCS07vEIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s
        1lV2xY6IIF0xvEx4A2jsIE14v26r1j6r4UMIAIbVCI42IY6I8E87Iv6xkF7I0E14v26r1j
        6r4UYxBIdaVFxhVjvjDU=
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

PiBPbiBNb24sIDI0IEF1ZyAyMDIwLCBEaW5naGFvIExpdSB3cm90ZToKPiAKPiA+IFdoZW4gaW5w
dXRfbXRfaW5pdF9zbG90cygpIGZhaWxzLCBpbnB1dCBzaG91bGQgYmUKPiA+IGZyZWVkIHRvIHBy
ZXZlbnQgbWVtbGVhay4KPiA+IAo+ID4gRml4ZXM6IDlhNmE0MTkzZDY1YjggKCJISUQ6IEFkZCBk
cml2ZXIgZm9yIFVTQiBFTEFOIFRvdWNocGFkIikKPiA+IFNpZ25lZC1vZmYtYnk6IERpbmdoYW8g
TGl1IDxkaW5naGFvLmxpdUB6anUuZWR1LmNuPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9oaWQvaGlk
LWVsYW4uYyB8IDEgKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+ID4gCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9oaWQvaGlkLWVsYW4uYyBiL2RyaXZlcnMvaGlkL2hpZC1l
bGFuLmMKPiA+IGluZGV4IDQ1YzRmODg4YjdjNC4uODU4NDQyMDA0MjU4IDEwMDY0NAo+ID4gLS0t
IGEvZHJpdmVycy9oaWQvaGlkLWVsYW4uYwo+ID4gKysrIGIvZHJpdmVycy9oaWQvaGlkLWVsYW4u
Ywo+ID4gQEAgLTE4OCw2ICsxODgsNyBAQCBzdGF0aWMgaW50IGVsYW5faW5wdXRfY29uZmlndXJl
ZChzdHJ1Y3QgaGlkX2RldmljZSAqaGRldiwgc3RydWN0IGhpZF9pbnB1dCAqaGkpCj4gPiAgCXJl
dCA9IGlucHV0X210X2luaXRfc2xvdHMoaW5wdXQsIEVMQU5fTUFYX0ZJTkdFUlMsIElOUFVUX01U
X1BPSU5URVIpOwo+ID4gIAlpZiAocmV0KSB7Cj4gPiAgCQloaWRfZXJyKGhkZXYsICJGYWlsZWQg
dG8gaW5pdCBlbGFuIE1UIHNsb3RzOiAlZFxuIiwgcmV0KTsKPiA+ICsJCWlucHV0X2ZyZWVfZGV2
aWNlKGlucHV0KTsKPiA+ICAJCXJldHVybiByZXQ7Cj4gCj4gR29vZCBjYXRjaCwgYnV0IGFwcGFy
ZW50bHkgaXQncyBub3QgdGhlIG9ubHkgbWVtbGVhayB0aGVyZSAtLSAKPiBpbnB1dF9tdF9pbml0
X3Nsb3RzKCkgYWxsb2NhdGVzIHRoZSBpbnB1dF9tdCBzbG90cyBhbmQgZnJpZW5kcywgc28gd2Ug
bmVlZCAKPiBpbnB1dF9tdF9kZXN0cm95X3Nsb3RzKCkgdGhlcmUgYXMgd2VsbC4KPiAKPiBDb3Vs
ZCB5b3UgcGxlYXNlIGFkZCB0aGlzIHRvIHlvdXIgcGF0Y2ggdG9vLCB3aGlsZSB5b3UgYXJlIGF0
IGZpeGluZyB0aGlzIAo+IGVycm9yIGNvZGVwYXRoIGFueXdheSwgYW5kIHJlc3VibWl0Pwo+IAoK
VGhhbmsgeW91IGZvciB5b3VyIGFkdmljZSEgSSB3aWxsIGZpeCB0aGlzIGFuZCByZXNlbmQgdGhl
IHBhdGNoIHNvb24uCgpSZWdhcmRzLApEaW5naGFvCg==
