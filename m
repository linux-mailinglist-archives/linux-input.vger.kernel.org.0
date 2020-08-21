Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D73D124D36E
	for <lists+linux-input@lfdr.de>; Fri, 21 Aug 2020 13:01:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727791AbgHULBm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 Aug 2020 07:01:42 -0400
Received: from mail.astralinux.ru ([217.74.38.120]:52947 "EHLO astralinux.ru"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727770AbgHULBm (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 Aug 2020 07:01:42 -0400
Received: from [46.148.196.138] (account dmastykin@astralinux.ru HELO [192.168.32.67])
  by astralinux.ru (CommuniGate Pro SMTP 6.2.7)
  with ESMTPSA id 2215213 for linux-input@vger.kernel.org; Fri, 21 Aug 2020 13:58:03 +0300
Subject: Upd: hid-multitouch: is pen hovering ever possible?
References: <0322c725-9eea-2947-bcf1-89958d91db92@astralinux.ru>
To:     linux-input@vger.kernel.org
From:   Dmitry Mastykin <dmastykin@astralinux.ru>
X-Forwarded-Message-Id: <0322c725-9eea-2947-bcf1-89958d91db92@astralinux.ru>
Message-ID: <c484b5f2-d227-6a09-3742-4f9c3c25d779@astralinux.ru>
Date:   Fri, 21 Aug 2020 14:01:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <0322c725-9eea-2947-bcf1-89958d91db92@astralinux.ru>
Content-Type: multipart/mixed;
 boundary="------------E842A69B8B7B6B774F645E85"
Content-Language: en-US
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This is a multi-part message in MIME format.
--------------E842A69B8B7B6B774F645E85
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello guys,

here is a 3-lines patch that made the pen working with hid-multitouch. 
It just delegates pen to hid-input.
Hope it helps someone.

Kind regards,
Dmitry Mastykin


-------- Forwarded Message --------
Subject: hid-multitouch: is pen hovering ever possible?
Date: Fri, 21 Aug 2020 13:24:40 +0300
From: Dmitry Mastykin <dmastykin@astralinux.ru>
To: linux-input@vger.kernel.org

Hello guys,
thanks to all of you for your great work!

Please, answer, is pen hovering ever possible using hid-multitouch driver?
If I remove hid-multitouch - hovering works well with hid-generic.
I can't unbind from hid-multitouch and bind to hid-generic: bind fails 
with "No such device".
I tried to modify hid-multitouch, but was not able to get hovering work 
using multitouch reports.
Then I noticed, that wacom uses non-multitouch reports for their pen 
devices, and added a quirk to hid-multitouch that changes pen's behavior 
to non-multitouch (patch attached). It works, but the way must be wrong(
How should one proceed in right way?

Thank you very much!
Dmitry Mastykin


--------------E842A69B8B7B6B774F645E85
Content-Type: text/plain; charset=UTF-8;
 name="commit-ae8672d"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="commit-ae8672d"

RnJvbSBhZTg2NzJkYzcwMjBlZDkzYTdkZmJiNmQ3OTdhZWE4NTQ2NmYyMzZiIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBEbWl0cnkgTWFzdHlraW4gPGRtYXN0eWtpbkBhc3Ry
YWxpbnV4LnJ1PgpEYXRlOiBGcmksIDIxIEF1ZyAyMDIwIDEzOjUxOjQ2ICswMzAwClN1Ympl
Y3Q6IGhpZC1tdWx0aXRvdWNoOiBkZWxlZ2F0ZSBwZW4gdG8gaGlkLWlucHV0CgoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvaGlkL2hpZC1tdWx0aXRvdWNoLmMgYi9kcml2ZXJzL2hpZC9oaWQt
bXVsdGl0b3VjaC5jCmluZGV4IDM2MjgwNWRkZjM3Ny4uNDFkODA5OTQ3YTBhIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2hpZC9oaWQtbXVsdGl0b3VjaC5jCisrKyBiL2RyaXZlcnMvaGlkL2hp
ZC1tdWx0aXRvdWNoLmMKQEAgLTEzMzQsNiArMTMzNCwxMSBAQCBzdGF0aWMgaW50IG10X2lu
cHV0X21hcHBpbmcoc3RydWN0IGhpZF9kZXZpY2UgKmhkZXYsIHN0cnVjdCBoaWRfaW5wdXQg
KmhpLAogCQlyZXR1cm4gMTsKIAl9CiAKKwlpZiAoZmllbGQtPmFwcGxpY2F0aW9uID09IEhJ
RF9ER19QRU4pIHsKKwkJcmRhdGEtPmlzX210X2NvbGxlY3Rpb24gPSBmYWxzZTsKKwkJcmV0
dXJuIDA7CisJfQorCiAJaWYgKHJkYXRhLT5pc19tdF9jb2xsZWN0aW9uKQogCQlyZXR1cm4g
bXRfdG91Y2hfaW5wdXRfbWFwcGluZyhoZGV2LCBoaSwgZmllbGQsIHVzYWdlLCBiaXQsIG1h
eCwKIAkJCQkJICAgICAgYXBwbGljYXRpb24pOwo=
--------------E842A69B8B7B6B774F645E85--
