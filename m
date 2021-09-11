Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2DDC407475
	for <lists+linux-input@lfdr.de>; Sat, 11 Sep 2021 03:36:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234182AbhIKBhr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Sep 2021 21:37:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231864AbhIKBhq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Sep 2021 21:37:46 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D43EFC061574
        for <linux-input@vger.kernel.org>; Fri, 10 Sep 2021 18:36:34 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id s10so7702624lfr.11
        for <linux-input@vger.kernel.org>; Fri, 10 Sep 2021 18:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vg56X5nw8AfVJrO3rKePAVtu/ihWCrd3JW2fgM/iuP8=;
        b=VuYqbmooE4hN/ZXcCcWatOinX3ZIV9cQnMNSVoB72JU4r4Si/cbERs+4mNj8nzX1qc
         MjNmhwQqdyOB+tTXWkK0rl+tL2UajURC4Zg1HJ44nsfRqQXKC2TEykwVE+W3HHf9UAp5
         1yHjuwzQOBDm3J7xeyWWTgTnkZa3iC1eCMGu0LN2tAaguMkWEEixumBSyYrcL0RIRh8W
         hiNy7IggVPh3Ij6RuvXn0bII9mvT/aUcwxjofIJ2FTOchB/6eQ6MVnmmAcuDLboEmrZH
         osWDjZqN01avsBkfo3+LMa5XTB5tocZfbSh0eJKW2iLj3TVlIZL456D7DBnW49GoH0lS
         ltVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vg56X5nw8AfVJrO3rKePAVtu/ihWCrd3JW2fgM/iuP8=;
        b=e11jHnczEHc/dGE2UwJJE/W3Mrho41MmYOA0QYYoGkeyxAm4pDVynMhCG3uIVPyANe
         4RjCabrQRmiKMorXGMtC3o738QwMyPQA6z19qCGiIZcUFtGm1cLxbuefN4Saydc5Rw3S
         eqUlPdtZ2AEKv6jf/BVMfvtfmHfRbJAmuFB8PCBKDGiaFEMbm4rBEdXz/taRl4hXHAqt
         V1Hr5nqREDZWDBf1W9VI3L2tIm84m9IOcjj/ajzfrGVY/B64Qul12HcPw2HkTY/5EOoA
         OpCUCaOjggOSMhKpHwQx1XRBM1QInYG+1tk/OCdtUat0gKG6Vl9gDGPskuWkZNNWwfdK
         gDjQ==
X-Gm-Message-State: AOAM5326xpThXxsC3jeIFwhjRTAYy+ntaTOHpVssN1/XQcaXIzbdIEGh
        vB4A+SIssCwNJ+CBbNmQ3o1G89MGEGo/yaZzz40=
X-Google-Smtp-Source: ABdhPJwYIxE38SmDmRcY0e77IbU3q+J8c0ptD37ujWF7KN2cRnHTKZyGvBpGH3cSJysAJHoSlRlSlgKQFV/uA85z46U=
X-Received: by 2002:a05:6512:21b0:: with SMTP id c16mr398817lft.100.1631324193155;
 Fri, 10 Sep 2021 18:36:33 -0700 (PDT)
MIME-Version: 1.0
References: <s5ho890n1rh.wl-tiwai@suse.de> <CAOMZO5C-wFv0LmbHfZQUMMchJAwvxMxTs=eT6oby8O8k4QyoFQ@mail.gmail.com>
 <s5hee9wmy6e.wl-tiwai@suse.de>
In-Reply-To: <s5hee9wmy6e.wl-tiwai@suse.de>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Fri, 10 Sep 2021 22:36:21 -0300
Message-ID: <CAOMZO5CACdcxGWn++f0+zhQaKevH7b5c-Xkv3QLBpwxc2GxizQ@mail.gmail.com>
Subject: Re: Delaying i8042 probe?
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000000c147705cbae43a6"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

--0000000000000c147705cbae43a6
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 10, 2021 at 9:07 AM Takashi Iwai <tiwai@suse.de> wrote:

> Thanks, I'll try to build a test kernel and let you know the result.

Just saw the report in bugzilla and it failed like this:

[    1.015028] i8042 i8042: probe deferral not supported

This is because the driver is currently registered via platform_create_bundle().

Changing it to platform_driver_register() would allow defer probe and hopefully
fix the problem.

Please find attached a new patch (only build-tested).

Regards,

Fabio Estevam

--0000000000000c147705cbae43a6
Content-Type: text/x-patch; charset="US-ASCII"; name="0001-i8042.patch"
Content-Disposition: attachment; filename="0001-i8042.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_ktf46obw0>
X-Attachment-Id: f_ktf46obw0

RnJvbSA4ZTAwYTQyMjk2MzdlMjIxMWI4OGM2YmJlMmM0MjVlYmZmMjk5NTBhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+CkRh
dGU6IEZyaSwgMTAgU2VwIDIwMjEgMjI6Mjc6MzkgLTAzMDAKU3ViamVjdDogW1BBVENIXSBJbnB1
dDogaTgwNDIgLSBhZGQgcHJvYmUgZGVmZXIgc3VwcG9ydCAKClNpZ25lZC1vZmYtYnk6IEZhYmlv
IEVzdGV2YW0gPGZlc3RldmFtQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2lucHV0L3NlcmlvL2k4
MDQyLmMgfCAzOCArKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMjAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9pbnB1dC9zZXJpby9pODA0Mi5jIGIvZHJpdmVycy9pbnB1dC9zZXJpby9pODA0Mi5j
CmluZGV4IDBiOWYxZDBhOGY4Yi4uMmI2OWQyYjVjNTY4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2lu
cHV0L3NlcmlvL2k4MDQyLmMKKysrIGIvZHJpdmVycy9pbnB1dC9zZXJpby9pODA0Mi5jCkBAIC03
MTEsNyArNzExLDcgQEAgc3RhdGljIGludCBpODA0Ml9zZXRfbXV4X21vZGUoYm9vbCBtdWx0aXBs
ZXgsIHVuc2lnbmVkIGNoYXIgKm11eF92ZXJzaW9uKQogICogTENTL1RlbGVncmFwaGljcy4KICAq
LwogCi1zdGF0aWMgaW50IF9faW5pdCBpODA0Ml9jaGVja19tdXgodm9pZCkKK3N0YXRpYyBpbnQg
aTgwNDJfY2hlY2tfbXV4KHZvaWQpCiB7CiAJdW5zaWduZWQgY2hhciBtdXhfdmVyc2lvbjsKIApA
QCAtNzQwLDEwICs3NDAsMTAgQEAgc3RhdGljIGludCBfX2luaXQgaTgwNDJfY2hlY2tfbXV4KHZv
aWQpCiAvKgogICogVGhlIGZvbGxvd2luZyBpcyB1c2VkIHRvIHRlc3QgQVVYIElSUSBkZWxpdmVy
eS4KICAqLwotc3RhdGljIHN0cnVjdCBjb21wbGV0aW9uIGk4MDQyX2F1eF9pcnFfZGVsaXZlcmVk
IF9faW5pdGRhdGE7Ci1zdGF0aWMgYm9vbCBpODA0Ml9pcnFfYmVpbmdfdGVzdGVkIF9faW5pdGRh
dGE7CitzdGF0aWMgc3RydWN0IGNvbXBsZXRpb24gaTgwNDJfYXV4X2lycV9kZWxpdmVyZWQ7Citz
dGF0aWMgYm9vbCBpODA0Ml9pcnFfYmVpbmdfdGVzdGVkOwogCi1zdGF0aWMgaXJxcmV0dXJuX3Qg
X19pbml0IGk4MDQyX2F1eF90ZXN0X2lycShpbnQgaXJxLCB2b2lkICpkZXZfaWQpCitzdGF0aWMg
aXJxcmV0dXJuX3QgaTgwNDJfYXV4X3Rlc3RfaXJxKGludCBpcnEsIHZvaWQgKmRldl9pZCkKIHsK
IAl1bnNpZ25lZCBsb25nIGZsYWdzOwogCXVuc2lnbmVkIGNoYXIgc3RyLCBkYXRhOwpAQCAtNzcw
LDcgKzc3MCw3IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBfX2luaXQgaTgwNDJfYXV4X3Rlc3RfaXJx
KGludCBpcnEsIHZvaWQgKmRldl9pZCkKICAqIHZlcmlmaWVzIHN1Y2Nlc3MgYnkgcmVhZGlubmcg
Q1RSLiBVc2VkIHdoZW4gdGVzdGluZyBmb3IgcHJlc2VuY2Ugb2YgQVVYCiAgKiBwb3J0LgogICov
Ci1zdGF0aWMgaW50IF9faW5pdCBpODA0Ml90b2dnbGVfYXV4KGJvb2wgb24pCitzdGF0aWMgaW50
IGk4MDQyX3RvZ2dsZV9hdXgoYm9vbCBvbikKIHsKIAl1bnNpZ25lZCBjaGFyIHBhcmFtOwogCWlu
dCBpOwpAQCAtNzk4LDcgKzc5OCw3IEBAIHN0YXRpYyBpbnQgX19pbml0IGk4MDQyX3RvZ2dsZV9h
dXgoYm9vbCBvbikKICAqIHRoZSBwcmVzZW5jZSBvZiBhbiBBVVggaW50ZXJmYWNlLgogICovCiAK
LXN0YXRpYyBpbnQgX19pbml0IGk4MDQyX2NoZWNrX2F1eCh2b2lkKQorc3RhdGljIGludCBpODA0
Ml9jaGVja19hdXgodm9pZCkKIHsKIAlpbnQgcmV0dmFsID0gLTE7CiAJYm9vbCBpcnFfcmVnaXN0
ZXJlZCA9IGZhbHNlOwpAQCAtMTAwNSw3ICsxMDA1LDcgQEAgc3RhdGljIGludCBpODA0Ml9jb250
cm9sbGVyX2luaXQodm9pZCkKIAogCQlpZiAoaTgwNDJfY29tbWFuZCgmY3RyW24rKyAlIDJdLCBJ
ODA0Ml9DTURfQ1RMX1JDVFIpKSB7CiAJCQlwcl9lcnIoIkNhbid0IHJlYWQgQ1RSIHdoaWxlIGlu
aXRpYWxpemluZyBpODA0MlxuIik7Ci0JCQlyZXR1cm4gLUVJTzsKKwkJCXJldHVybiAtRVBST0JF
X0RFRkVSOwogCQl9CiAKIAl9IHdoaWxlIChuIDwgMiB8fCBjdHJbMF0gIT0gY3RyWzFdKTsKQEAg
LTEzMjAsNyArMTMyMCw3IEBAIHN0YXRpYyB2b2lkIGk4MDQyX3NodXRkb3duKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKmRldikKIAlpODA0Ml9jb250cm9sbGVyX3Jlc2V0KGZhbHNlKTsKIH0KIAot
c3RhdGljIGludCBfX2luaXQgaTgwNDJfY3JlYXRlX2tiZF9wb3J0KHZvaWQpCitzdGF0aWMgaW50
IGk4MDQyX2NyZWF0ZV9rYmRfcG9ydCh2b2lkKQogewogCXN0cnVjdCBzZXJpbyAqc2VyaW87CiAJ
c3RydWN0IGk4MDQyX3BvcnQgKnBvcnQgPSAmaTgwNDJfcG9ydHNbSTgwNDJfS0JEX1BPUlRfTk9d
OwpAQCAtMTM0OSw3ICsxMzQ5LDcgQEAgc3RhdGljIGludCBfX2luaXQgaTgwNDJfY3JlYXRlX2ti
ZF9wb3J0KHZvaWQpCiAJcmV0dXJuIDA7CiB9CiAKLXN0YXRpYyBpbnQgX19pbml0IGk4MDQyX2Ny
ZWF0ZV9hdXhfcG9ydChpbnQgaWR4KQorc3RhdGljIGludCBpODA0Ml9jcmVhdGVfYXV4X3BvcnQo
aW50IGlkeCkKIHsKIAlzdHJ1Y3Qgc2VyaW8gKnNlcmlvOwogCWludCBwb3J0X25vID0gaWR4IDwg
MCA/IEk4MDQyX0FVWF9QT1JUX05PIDogSTgwNDJfTVVYX1BPUlRfTk8gKyBpZHg7CkBAIC0xMzg2
LDEzICsxMzg2LDEzIEBAIHN0YXRpYyBpbnQgX19pbml0IGk4MDQyX2NyZWF0ZV9hdXhfcG9ydChp
bnQgaWR4KQogCXJldHVybiAwOwogfQogCi1zdGF0aWMgdm9pZCBfX2luaXQgaTgwNDJfZnJlZV9r
YmRfcG9ydCh2b2lkKQorc3RhdGljIHZvaWQgaTgwNDJfZnJlZV9rYmRfcG9ydCh2b2lkKQogewog
CWtmcmVlKGk4MDQyX3BvcnRzW0k4MDQyX0tCRF9QT1JUX05PXS5zZXJpbyk7CiAJaTgwNDJfcG9y
dHNbSTgwNDJfS0JEX1BPUlRfTk9dLnNlcmlvID0gTlVMTDsKIH0KIAotc3RhdGljIHZvaWQgX19p
bml0IGk4MDQyX2ZyZWVfYXV4X3BvcnRzKHZvaWQpCitzdGF0aWMgdm9pZCBpODA0Ml9mcmVlX2F1
eF9wb3J0cyh2b2lkKQogewogCWludCBpOwogCkBAIC0xNDAyLDcgKzE0MDIsNyBAQCBzdGF0aWMg
dm9pZCBfX2luaXQgaTgwNDJfZnJlZV9hdXhfcG9ydHModm9pZCkKIAl9CiB9CiAKLXN0YXRpYyB2
b2lkIF9faW5pdCBpODA0Ml9yZWdpc3Rlcl9wb3J0cyh2b2lkKQorc3RhdGljIHZvaWQgaTgwNDJf
cmVnaXN0ZXJfcG9ydHModm9pZCkKIHsKIAlpbnQgaTsKIApAQCAtMTQ0Myw3ICsxNDQzLDcgQEAg
c3RhdGljIHZvaWQgaTgwNDJfZnJlZV9pcnFzKHZvaWQpCiAJaTgwNDJfYXV4X2lycV9yZWdpc3Rl
cmVkID0gaTgwNDJfa2JkX2lycV9yZWdpc3RlcmVkID0gZmFsc2U7CiB9CiAKLXN0YXRpYyBpbnQg
X19pbml0IGk4MDQyX3NldHVwX2F1eCh2b2lkKQorc3RhdGljIGludCBpODA0Ml9zZXR1cF9hdXgo
dm9pZCkKIHsKIAlpbnQgKCphdXhfZW5hYmxlKSh2b2lkKTsKIAlpbnQgZXJyb3I7CkBAIC0xNDg1
LDcgKzE0ODUsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBpODA0Ml9zZXR1cF9hdXgodm9pZCkKIAly
ZXR1cm4gZXJyb3I7CiB9CiAKLXN0YXRpYyBpbnQgX19pbml0IGk4MDQyX3NldHVwX2tiZCh2b2lk
KQorc3RhdGljIGludCBpODA0Ml9zZXR1cF9rYmQodm9pZCkKIHsKIAlpbnQgZXJyb3I7CiAKQEAg
LTE1MzUsNyArMTUzNSw3IEBAIHN0YXRpYyBpbnQgaTgwNDJfa2JkX2JpbmRfbm90aWZpZXIoc3Ry
dWN0IG5vdGlmaWVyX2Jsb2NrICpuYiwKIAlyZXR1cm4gMDsKIH0KIAotc3RhdGljIGludCBfX2lu
aXQgaTgwNDJfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqZGV2KQorc3RhdGljIGludCBp
ODA0Ml9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpkZXYpCiB7CiAJaW50IGVycm9yOwog
CkBAIC0xNjAwLDYgKzE2MDAsNyBAQCBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBpODA0
Ml9kcml2ZXIgPSB7CiAJCS5wbQk9ICZpODA0Ml9wbV9vcHMsCiAjZW5kaWYKIAl9LAorCS5wcm9i
ZQkJPSBpODA0Ml9wcm9iZSwKIAkucmVtb3ZlCQk9IGk4MDQyX3JlbW92ZSwKIAkuc2h1dGRvd24J
PSBpODA0Ml9zaHV0ZG93biwKIH07CkBAIC0xNjEwLDcgKzE2MTEsNiBAQCBzdGF0aWMgc3RydWN0
IG5vdGlmaWVyX2Jsb2NrIGk4MDQyX2tiZF9iaW5kX25vdGlmaWVyX2Jsb2NrID0gewogCiBzdGF0
aWMgaW50IF9faW5pdCBpODA0Ml9pbml0KHZvaWQpCiB7Ci0Jc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldjsKIAlpbnQgZXJyOwogCiAJZGJnX2luaXQoKTsKQEAgLTE2MjYsMTEgKzE2MjYsOSBA
QCBzdGF0aWMgaW50IF9faW5pdCBpODA0Ml9pbml0KHZvaWQpCiAJLyogU2V0IHRoaXMgYmVmb3Jl
IGNyZWF0aW5nIHRoZSBkZXYgdG8gYWxsb3cgaTgwNDJfY29tbWFuZCB0byB3b3JrIHJpZ2h0IGF3
YXkgKi8KIAlpODA0Ml9wcmVzZW50ID0gdHJ1ZTsKIAotCXBkZXYgPSBwbGF0Zm9ybV9jcmVhdGVf
YnVuZGxlKCZpODA0Ml9kcml2ZXIsIGk4MDQyX3Byb2JlLCBOVUxMLCAwLCBOVUxMLCAwKTsKLQlp
ZiAoSVNfRVJSKHBkZXYpKSB7Ci0JCWVyciA9IFBUUl9FUlIocGRldik7CisJZXJyID0gcGxhdGZv
cm1fZHJpdmVyX3JlZ2lzdGVyKCZpODA0Ml9kcml2ZXIpOworCWlmIChlcnIpCiAJCWdvdG8gZXJy
X3BsYXRmb3JtX2V4aXQ7Ci0JfQogCiAJYnVzX3JlZ2lzdGVyX25vdGlmaWVyKCZzZXJpb19idXMs
ICZpODA0Ml9rYmRfYmluZF9ub3RpZmllcl9ibG9jayk7CiAJcGFuaWNfYmxpbmsgPSBpODA0Ml9w
YW5pY19ibGluazsKLS0gCjIuMjUuMQoK
--0000000000000c147705cbae43a6--
