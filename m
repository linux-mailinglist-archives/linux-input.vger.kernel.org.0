Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 390EC357C9C
	for <lists+linux-input@lfdr.de>; Thu,  8 Apr 2021 08:29:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbhDHG3k (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Apr 2021 02:29:40 -0400
Received: from mail.zju.edu.cn ([61.164.42.155]:17430 "EHLO zju.edu.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229512AbhDHG3h (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 8 Apr 2021 02:29:37 -0400
Received: by ajax-webmail-mail-app3 (Coremail) ; Thu, 8 Apr 2021 14:29:16
 +0800 (GMT+08:00)
X-Originating-IP: [10.192.24.118]
Date:   Thu, 8 Apr 2021 14:29:16 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   dinghao.liu@zju.edu.cn
To:     "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc:     kjlu@umn.edu, "Fuqian Huang" <huangfq.daxian@gmail.com>,
        "Benson Leung" <bleung@chromium.org>,
        "Andrzej Pietrasiewicz" <andrzej.p@collabora.com>,
        "Lee Jones" <lee.jones@linaro.org>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH] Input: cyapa - Fix rumtime PM imbalance on error
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210104(ab8c30b6)
 Copyright (c) 2002-2021 www.mailtech.cn zju.edu.cn
In-Reply-To: <YG6ggJyKT/eIlEGk@google.com>
References: <20210407040740.20257-1-dinghao.liu@zju.edu.cn>
 <YG6ggJyKT/eIlEGk@google.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <1043c456.41319.178b02bb004.Coremail.dinghao.liu@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: cC_KCgC3nz68om5g69fmAA--.28515W
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAggJBlZdtTTXjgADsV
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
        CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
        daVFxhVjvjDU=
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

PiBIaSBEaW5naGFvLAo+IAo+IE9uIFdlZCwgQXByIDA3LCAyMDIxIGF0IDEyOjA3OjM4UE0gKzA4
MDAsIERpbmdoYW8gTGl1IHdyb3RlOgo+ID4gV2hlbiBtdXRleF9sb2NrX2ludGVycnVwdGlibGUo
KSBmYWlscywgYSBwYWlyaW5nIFBNIHVzYWdlCj4gPiBjb3VudGVyIGRlY3JlbWVudCBpcyBuZWVk
ZWQgdG8ga2VlcCB0aGUgY291bnRlciBiYWxhbmNlZC4KPiAKPiBUaGFuayB5b3UgZm9yIHRoZSBw
YXRjaC4KPiAKPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogRGluZ2hhbyBMaXUgPGRpbmdoYW8ubGl1
QHpqdS5lZHUuY24+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2lucHV0L21vdXNlL2N5YXBhLmMgfCA0
ICsrKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
Cj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lucHV0L21vdXNlL2N5YXBhLmMgYi9kcml2
ZXJzL2lucHV0L21vdXNlL2N5YXBhLmMKPiA+IGluZGV4IDc3Y2M2NTNlZGNhMi4uZTQxMWFiNDVh
MjE4IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9pbnB1dC9tb3VzZS9jeWFwYS5jCj4gPiArKysg
Yi9kcml2ZXJzL2lucHV0L21vdXNlL2N5YXBhLmMKPiA+IEBAIC05MDQsOCArOTA0LDEwIEBAIHN0
YXRpYyBzc2l6ZV90IGN5YXBhX3VwZGF0ZV9ydF9zdXNwZW5kX3NjYW5yYXRlKHN0cnVjdCBkZXZp
Y2UgKmRldiwKPiA+ICAJcG1fcnVudGltZV9nZXRfc3luYyhkZXYpOwo+ID4gIAo+ID4gIAllcnJv
ciA9IG11dGV4X2xvY2tfaW50ZXJydXB0aWJsZSgmY3lhcGEtPnN0YXRlX3N5bmNfbG9jayk7Cj4g
PiAtCWlmIChlcnJvcikKPiA+ICsJaWYgKGVycm9yKSB7Cj4gPiArCQlwbV9ydW50aW1lX3B1dF9u
b2lkbGUoZGV2KTsKPiAKPiBXaHkgIm5vaWRsZSIgYW5kIG5vdCBwbV9ydW50aW1lX3B1dF9zeW5j
X2F1dG9zdXNwZW5kKCkgbGlrZSB3ZSBkbyBpbgo+IGNhc2Ugb2Ygbm9ybWFsIGZsb3c/Cj4gCgpw
bV9ydW50aW1lX3B1dF9ub2lkbGUoKSBvbmx5IGRlY3JlYXNlIHRoZSByZWZjb3VudCwgd2hpbGUg
CnBtX3J1bnRpbWVfcHV0X3N5bmNfYXV0b3N1c3BlbmQoKSB3aWxsIGV4ZWN1dGUgYW4gZXh0cmEK
cG1fcnVudGltZV9hdXRvc3VzcGVuZCgpLiBJJ20gbm90IHN1cmUgaWYgdGhlIGF1dG9zdXNwZW5k
IGlzIG5lY2Vzc2FyeQppbiB0aGlzIGVycm9yIGhhbmRsaW5nIHBhdGgsIHNvIEkgb25seSBiYWxh
bmNlIHRoZSBjb3VudGVyLgoKUmVnYXJkcywKRGluZ2hhbwo=
