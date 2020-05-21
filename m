Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86E211DC6A9
	for <lists+linux-input@lfdr.de>; Thu, 21 May 2020 07:39:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726893AbgEUFj0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 May 2020 01:39:26 -0400
Received: from aliyun-cloud.icoremail.net ([47.90.88.95]:65471 "HELO
        aliyun-sdnproxy-1.icoremail.net" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with SMTP id S1726506AbgEUFj0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 May 2020 01:39:26 -0400
X-Greylist: delayed 720 seconds by postgrey-1.27 at vger.kernel.org; Thu, 21 May 2020 01:39:24 EDT
Received: by ajax-webmail-mail-app4 (Coremail) ; Thu, 21 May 2020 13:19:01
 +0800 (GMT+08:00)
X-Originating-IP: [222.205.77.158]
Date:   Thu, 21 May 2020 13:19:01 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   dinghao.liu@zju.edu.cn
To:     "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        "Kangjie Lu" <kjlu@umn.edu>,
        "Richard Fontana" <rfontana@redhat.com>,
        "Allison Randal" <allison@lohutok.net>,
        "Thomas Gleixner" <tglx@linutronix.de>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: Re: Re: [PATCH] Input: omap-keypad - fix runtime pm imbalance on
 error
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190906(84e8bf8f)
 Copyright (c) 2002-2020 www.mailtech.cn zju.edu.cn
In-Reply-To: <CAKdAkRTyVL0uV0dGxHoEgMyB9FP6b0m60CHy7C4QXeR5WTGAJw@mail.gmail.com>
References: <20200520133432.19738-1-dinghao.liu@zju.edu.cn>
 <CAKdAkRTyVL0uV0dGxHoEgMyB9FP6b0m60CHy7C4QXeR5WTGAJw@mail.gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <99e48fa.b9f12.17235aba7ac.Coremail.dinghao.liu@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: cS_KCgCnjwpFD8ZefivnAQ--.39208W
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgUHBlZdtOOvVwAKso
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJTRUUUbXvS07vEb7Iv0x
        C_Ar1lV2xY67kC6x804xWlV2xY67CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DMIAI
        bVAFxVCF77xC64kEw24lV2xY67C26IkvcIIF6IxKo4kEV4ylV2xY628lY4IE4IxF12IF4w
        CS07vE84x0c7CEj48ve4kI8wCS07vE84ACjcxK6xIIjxv20xvE14v26w1j6s0DMIAIbVA2
        z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIAIbVA2z4x0Y4vEx4A2jsIE14v26r
        xl6s0DMIAIbVA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1lV2xY62AIxVAIcxkEcVAq
        07x20xvEncxIr21lV2xY6c02F40EFcxC0VAKzVAqx4xG6I80ewCS07vEYx0E2Ix0cI8IcV
        AFwI0_Jr0_Jr4lV2xY6cIj6I8E87Iv67AKxVWUJVW8JwCS07vEOx8S6xCaFVCjc4AY6r1j
        6r4UMIAIbVCjxxvEw4WlV2xY6xkIecxEwVAFwVW8WwCS07vEc2IjII80xcxEwVAKI48JMI
        AIbVCF04k20xvE74AGY7Cv6cx26r4fKr1UJr1lV2xY6xCjnVCjjxCrMIAIbVCFx2IqxVCF
        s4IE7xkEbVWUJVW8JwCS07vEx2IqxVAqx4xG67AKxVWUJVWUGwCS07vEx2IqxVCjr7xvwV
        AFwI0_JrI_JrWlV2xY6I8E67AF67kF1VAFwI0_Jw0_GFylV2xY6IIF0xvE2Ix0cI8IcVAF
        wI0_Jr0_JF4lV2xY6IIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCS07vEIxAIcVCF04
        k26cxKx2IYs7xG6rWUJVWrZr1UMIAIbVCI42IY6I8E87Iv67AKxVWUJVW8JwCS07vEIxAI
        cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUU==
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Rml4aW5nIHRoaXMgaW4gdGhlIFBNIGNvcmUgd2lsbCBpbmZsdWVuY2UgYWxsIGNhbGxlcnMgb2Yg
cG1fcnVudGltZV9nZXRfc3luYygpLgpUaGVyZWZvcmUgSSB0aGluayB0aGUgYmV0dGVyIHNvbHV0
aW9uIGlzIHRvIGZpeCBpdHMgbWlzdXNlZCBjYWxsZXJzLgoKUmVnYXJkcywKRGluZ2hhbwoKJnF1
b3Q7RG1pdHJ5IFRvcm9raG92JnF1b3Q7ICZsdDtkbWl0cnkudG9yb2tob3ZAZ21haWwuY29tJmd0
O+WGmemBk++8mgo+IEhpIERpbmdoYW8sCj4gCj4gT24gV2VkLCBNYXkgMjAsIDIwMjAgYXQgNjoz
NSBBTSBEaW5naGFvIExpdSA8ZGluZ2hhby5saXVAemp1LmVkdS5jbj4gd3JvdGU6Cj4gPgo+ID4g
cG1fcnVudGltZV9nZXRfc3luYygpIGluY3JlbWVudHMgdGhlIHJ1bnRpbWUgUE0gdXNhZ2UgY291
bnRlciBldmVuCj4gPiB0aGUgY2FsbCByZXR1cm5zIGFuIGVycm9yIGNvZGUuIFRodXMgYSBwYWly
aW5nIGRlY3JlbWVudCBpcyBuZWVkZWQKPiA+IG9uIHRoZSBlcnJvciBoYW5kbGluZyBwYXRoIHRv
IGtlZXAgdGhlIGNvdW50ZXIgYmFsYW5jZWQuCj4gCj4gVGhpcyBpcyBhIHZlcnkgc3VycHJpc2lu
ZyBiZWhhdmlvciBhbmQgSSB3b25kZXIgaWYgdGhpcyBzaG91bGQgYmUKPiBmaXhlZCBpbiB0aGUg
UE0gY29yZSAob3IgdGhlIHJlcXVpcmVkIGNsZWFudXAgc3RlcHMgbmVlZCB0byBiZSBjYWxsZWQK
PiBvdXQgaW4gdGhlIGZ1bmN0aW9uIGRlc2NyaXB0aW9uKS4gSSBhbHNvIHNlZSB0aGF0IGEgZmV3
IGRyaXZlcnMgdGhhdAo+IGhhbmRsZSB0aGlzIHNpdHVhdGlvbiBjb3JyZWN0bHkgKD8pIGNhbGwg
cG1fcnVudGltZV9wdXRfbm9pZGxlKCkKPiBpbnN0ZWFkIG9mIHBtX3J1bnRpbWVfcHV0X3N5bmMo
KSBpbiB0aGUgZXJyb3IgcGF0aC4KPiAKPiBSYWZhZWwsIGRvIHlvdSBoYXZlIGFueSBndWlkYW5j
ZSBoZXJlPwo+IAo+IFRoYW5rcy4KPiAKPiAtLSAKPiBEbWl0cnkK
