Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C39B407A24
	for <lists+linux-input@lfdr.de>; Sat, 11 Sep 2021 20:50:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232267AbhIKSvx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 11 Sep 2021 14:51:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbhIKSvx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 11 Sep 2021 14:51:53 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2223EC061574
        for <linux-input@vger.kernel.org>; Sat, 11 Sep 2021 11:50:40 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id o11so1605336ljp.8
        for <linux-input@vger.kernel.org>; Sat, 11 Sep 2021 11:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j9WOLaLAhiQMN1BUxFLKRhXlVtXCAN1KBosruoXue+A=;
        b=COyPKvdkb0sPc5ljZl9C45Lr9062U5M8q0vsD1ksd183qyL/PMT2ZAP78lPTLfCRes
         wcUyKZvyfm8ZZzeGCjmcmsvUNgEk4hMU2QuM4XQ2VaSWYx6IIJqp3NBSUG+MarFzMSDv
         UAACPeAICia4Jcao4d7HRQviy2nmb80iJXUHK79Ev6Gn+mcbUharJpnDv+A/K5sxL8uN
         cQr4nOWIzAVY5ltKSd2+lvC5Ybcfnhd/sTlR83WOQj4bijB6hk6lzvGoaQp3kC3RuPYN
         xi0nhiCJHsajm2h5HaKp/wkmXqC7KhtIB2VqorNauUXJU/wJK5y+xcsRh2rf5NJYP1yC
         ZizQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j9WOLaLAhiQMN1BUxFLKRhXlVtXCAN1KBosruoXue+A=;
        b=okq770t3RM36X2p8iL3hGE5NPWTAmHo5FEzQNt67YsXyJuFGZU/BNcJgGlY3cXzbcs
         BdD8mxeeIWLkLe7CyQ0zaqfHqIWC5F0F1MKs3FLw58RHpq5Lw9tnfI++NPGrFVa+wIur
         EjqX5TWfkpJQkTEl5MavQi1NZAmi4WCorzc3V0D/ZGeLulIMZhifLOoTl3GWrUNStBqG
         WBIpDroDgDb58bpWK6p55k9zPv6Wq/QH9sKgj50VquQ/Y37I/sMWnjFP3oLGe1RDo3YH
         eNVOZWt7Wy7q1t7F1GqktqWa++POx2fXfc4DG6RfyKBFiZCfp145F+ynLD14nrkYr0Y6
         zaWA==
X-Gm-Message-State: AOAM531ixCCwQ9XyTmuqFu6zO22knrRTVuJIly1v8wjCGDNDb2tBRHZH
        KYsQ6oD4vwZiN603gMJJ/DBeCdiFA0eEXRzyfFkxtcaF
X-Google-Smtp-Source: ABdhPJz8b+VG8V6mezZaZXPtwvkXHVdkPHYDisVA++2woJJfEldv+iGzU8vyV5OMwnUcmV6zqH7MvcnYURGYN7EavnY=
X-Received: by 2002:a2e:8014:: with SMTP id j20mr3204159ljg.228.1631386238361;
 Sat, 11 Sep 2021 11:50:38 -0700 (PDT)
MIME-Version: 1.0
References: <s5ho890n1rh.wl-tiwai@suse.de> <CAOMZO5C-wFv0LmbHfZQUMMchJAwvxMxTs=eT6oby8O8k4QyoFQ@mail.gmail.com>
 <s5hee9wmy6e.wl-tiwai@suse.de> <CAOMZO5CACdcxGWn++f0+zhQaKevH7b5c-Xkv3QLBpwxc2GxizQ@mail.gmail.com>
 <s5hee9vlg8i.wl-tiwai@suse.de> <CAOMZO5C+gki7HT-n5D6qj06NbMxo2su2d6X+8AvM9PSmLUZ0jg@mail.gmail.com>
In-Reply-To: <CAOMZO5C+gki7HT-n5D6qj06NbMxo2su2d6X+8AvM9PSmLUZ0jg@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Sat, 11 Sep 2021 15:50:25 -0300
Message-ID: <CAOMZO5DepuVScmDU7yZGVOVUs1JzHOd4bmu1z3erE2GNpcjZ+w@mail.gmail.com>
Subject: Re: Delaying i8042 probe?
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000003ac0f505cbbcb5cc"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

--0000000000003ac0f505cbbcb5cc
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 11, 2021 at 3:43 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> On Sat, Sep 11, 2021 at 4:32 AM Takashi Iwai <tiwai@suse.de> wrote:
>
> > OK, I'll update and let the reporter testing it.
>
> Sorry, platform_device_alloc() and platform_device_add() were missing
> in the earlier patch.
>
> New patch atached.
>
> Dmitry, does this look correct?

Please consider this one instead.

--0000000000003ac0f505cbbcb5cc
Content-Type: text/x-patch; charset="US-ASCII"; name="0001-i8042v4.patch"
Content-Disposition: attachment; filename="0001-i8042v4.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_ktg58h4g0>
X-Attachment-Id: f_ktg58h4g0

RnJvbSA3ZWNiYzQ3NjFhYTJiMmE4MmQyMTdlN2EzY2YyODU3NjhmYzg1Yzc1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+CkRh
dGU6IFNhdCwgMTEgU2VwIDIwMjEgMTU6NDg6MzkgLTAzMDAKU3ViamVjdDogW1BBVENIXSBJbnB1
dDogaTgwNDIgLSBhZGQgcHJvYmUgZGVmZXIgc3VwcG9ydAoKU2lnbmVkLW9mZi1ieTogRmFiaW8g
RXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPgotLS0KIGRyaXZlcnMvaW5wdXQvc2VyaW8vaTgw
NDIuYyB8IDUwICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2lucHV0L3NlcmlvL2k4MDQyLmMgYi9kcml2ZXJzL2lucHV0L3NlcmlvL2k4MDQyLmMK
aW5kZXggMGI5ZjFkMGE4ZjhiLi5hNzJhOGM1MzgxNjQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaW5w
dXQvc2VyaW8vaTgwNDIuYworKysgYi9kcml2ZXJzL2lucHV0L3NlcmlvL2k4MDQyLmMKQEAgLTcx
MSw3ICs3MTEsNyBAQCBzdGF0aWMgaW50IGk4MDQyX3NldF9tdXhfbW9kZShib29sIG11bHRpcGxl
eCwgdW5zaWduZWQgY2hhciAqbXV4X3ZlcnNpb24pCiAgKiBMQ1MvVGVsZWdyYXBoaWNzLgogICov
CiAKLXN0YXRpYyBpbnQgX19pbml0IGk4MDQyX2NoZWNrX211eCh2b2lkKQorc3RhdGljIGludCBp
ODA0Ml9jaGVja19tdXgodm9pZCkKIHsKIAl1bnNpZ25lZCBjaGFyIG11eF92ZXJzaW9uOwogCkBA
IC03NDAsMTAgKzc0MCwxMCBAQCBzdGF0aWMgaW50IF9faW5pdCBpODA0Ml9jaGVja19tdXgodm9p
ZCkKIC8qCiAgKiBUaGUgZm9sbG93aW5nIGlzIHVzZWQgdG8gdGVzdCBBVVggSVJRIGRlbGl2ZXJ5
LgogICovCi1zdGF0aWMgc3RydWN0IGNvbXBsZXRpb24gaTgwNDJfYXV4X2lycV9kZWxpdmVyZWQg
X19pbml0ZGF0YTsKLXN0YXRpYyBib29sIGk4MDQyX2lycV9iZWluZ190ZXN0ZWQgX19pbml0ZGF0
YTsKK3N0YXRpYyBzdHJ1Y3QgY29tcGxldGlvbiBpODA0Ml9hdXhfaXJxX2RlbGl2ZXJlZDsKK3N0
YXRpYyBib29sIGk4MDQyX2lycV9iZWluZ190ZXN0ZWQ7CiAKLXN0YXRpYyBpcnFyZXR1cm5fdCBf
X2luaXQgaTgwNDJfYXV4X3Rlc3RfaXJxKGludCBpcnEsIHZvaWQgKmRldl9pZCkKK3N0YXRpYyBp
cnFyZXR1cm5fdCBpODA0Ml9hdXhfdGVzdF9pcnEoaW50IGlycSwgdm9pZCAqZGV2X2lkKQogewog
CXVuc2lnbmVkIGxvbmcgZmxhZ3M7CiAJdW5zaWduZWQgY2hhciBzdHIsIGRhdGE7CkBAIC03NzAs
NyArNzcwLDcgQEAgc3RhdGljIGlycXJldHVybl90IF9faW5pdCBpODA0Ml9hdXhfdGVzdF9pcnEo
aW50IGlycSwgdm9pZCAqZGV2X2lkKQogICogdmVyaWZpZXMgc3VjY2VzcyBieSByZWFkaW5uZyBD
VFIuIFVzZWQgd2hlbiB0ZXN0aW5nIGZvciBwcmVzZW5jZSBvZiBBVVgKICAqIHBvcnQuCiAgKi8K
LXN0YXRpYyBpbnQgX19pbml0IGk4MDQyX3RvZ2dsZV9hdXgoYm9vbCBvbikKK3N0YXRpYyBpbnQg
aTgwNDJfdG9nZ2xlX2F1eChib29sIG9uKQogewogCXVuc2lnbmVkIGNoYXIgcGFyYW07CiAJaW50
IGk7CkBAIC03OTgsNyArNzk4LDcgQEAgc3RhdGljIGludCBfX2luaXQgaTgwNDJfdG9nZ2xlX2F1
eChib29sIG9uKQogICogdGhlIHByZXNlbmNlIG9mIGFuIEFVWCBpbnRlcmZhY2UuCiAgKi8KIAot
c3RhdGljIGludCBfX2luaXQgaTgwNDJfY2hlY2tfYXV4KHZvaWQpCitzdGF0aWMgaW50IGk4MDQy
X2NoZWNrX2F1eCh2b2lkKQogewogCWludCByZXR2YWwgPSAtMTsKIAlib29sIGlycV9yZWdpc3Rl
cmVkID0gZmFsc2U7CkBAIC0xMDA1LDcgKzEwMDUsNyBAQCBzdGF0aWMgaW50IGk4MDQyX2NvbnRy
b2xsZXJfaW5pdCh2b2lkKQogCiAJCWlmIChpODA0Ml9jb21tYW5kKCZjdHJbbisrICUgMl0sIEk4
MDQyX0NNRF9DVExfUkNUUikpIHsKIAkJCXByX2VycigiQ2FuJ3QgcmVhZCBDVFIgd2hpbGUgaW5p
dGlhbGl6aW5nIGk4MDQyXG4iKTsKLQkJCXJldHVybiAtRUlPOworCQkJcmV0dXJuIC1FUFJPQkVf
REVGRVI7CiAJCX0KIAogCX0gd2hpbGUgKG4gPCAyIHx8IGN0clswXSAhPSBjdHJbMV0pOwpAQCAt
MTMyMCw3ICsxMzIwLDcgQEAgc3RhdGljIHZvaWQgaTgwNDJfc2h1dGRvd24oc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqZGV2KQogCWk4MDQyX2NvbnRyb2xsZXJfcmVzZXQoZmFsc2UpOwogfQogCi1z
dGF0aWMgaW50IF9faW5pdCBpODA0Ml9jcmVhdGVfa2JkX3BvcnQodm9pZCkKK3N0YXRpYyBpbnQg
aTgwNDJfY3JlYXRlX2tiZF9wb3J0KHZvaWQpCiB7CiAJc3RydWN0IHNlcmlvICpzZXJpbzsKIAlz
dHJ1Y3QgaTgwNDJfcG9ydCAqcG9ydCA9ICZpODA0Ml9wb3J0c1tJODA0Ml9LQkRfUE9SVF9OT107
CkBAIC0xMzQ5LDcgKzEzNDksNyBAQCBzdGF0aWMgaW50IF9faW5pdCBpODA0Ml9jcmVhdGVfa2Jk
X3BvcnQodm9pZCkKIAlyZXR1cm4gMDsKIH0KIAotc3RhdGljIGludCBfX2luaXQgaTgwNDJfY3Jl
YXRlX2F1eF9wb3J0KGludCBpZHgpCitzdGF0aWMgaW50IGk4MDQyX2NyZWF0ZV9hdXhfcG9ydChp
bnQgaWR4KQogewogCXN0cnVjdCBzZXJpbyAqc2VyaW87CiAJaW50IHBvcnRfbm8gPSBpZHggPCAw
ID8gSTgwNDJfQVVYX1BPUlRfTk8gOiBJODA0Ml9NVVhfUE9SVF9OTyArIGlkeDsKQEAgLTEzODYs
MTMgKzEzODYsMTMgQEAgc3RhdGljIGludCBfX2luaXQgaTgwNDJfY3JlYXRlX2F1eF9wb3J0KGlu
dCBpZHgpCiAJcmV0dXJuIDA7CiB9CiAKLXN0YXRpYyB2b2lkIF9faW5pdCBpODA0Ml9mcmVlX2ti
ZF9wb3J0KHZvaWQpCitzdGF0aWMgdm9pZCBpODA0Ml9mcmVlX2tiZF9wb3J0KHZvaWQpCiB7CiAJ
a2ZyZWUoaTgwNDJfcG9ydHNbSTgwNDJfS0JEX1BPUlRfTk9dLnNlcmlvKTsKIAlpODA0Ml9wb3J0
c1tJODA0Ml9LQkRfUE9SVF9OT10uc2VyaW8gPSBOVUxMOwogfQogCi1zdGF0aWMgdm9pZCBfX2lu
aXQgaTgwNDJfZnJlZV9hdXhfcG9ydHModm9pZCkKK3N0YXRpYyB2b2lkIGk4MDQyX2ZyZWVfYXV4
X3BvcnRzKHZvaWQpCiB7CiAJaW50IGk7CiAKQEAgLTE0MDIsNyArMTQwMiw3IEBAIHN0YXRpYyB2
b2lkIF9faW5pdCBpODA0Ml9mcmVlX2F1eF9wb3J0cyh2b2lkKQogCX0KIH0KIAotc3RhdGljIHZv
aWQgX19pbml0IGk4MDQyX3JlZ2lzdGVyX3BvcnRzKHZvaWQpCitzdGF0aWMgdm9pZCBpODA0Ml9y
ZWdpc3Rlcl9wb3J0cyh2b2lkKQogewogCWludCBpOwogCkBAIC0xNDQzLDcgKzE0NDMsNyBAQCBz
dGF0aWMgdm9pZCBpODA0Ml9mcmVlX2lycXModm9pZCkKIAlpODA0Ml9hdXhfaXJxX3JlZ2lzdGVy
ZWQgPSBpODA0Ml9rYmRfaXJxX3JlZ2lzdGVyZWQgPSBmYWxzZTsKIH0KIAotc3RhdGljIGludCBf
X2luaXQgaTgwNDJfc2V0dXBfYXV4KHZvaWQpCitzdGF0aWMgaW50IGk4MDQyX3NldHVwX2F1eCh2
b2lkKQogewogCWludCAoKmF1eF9lbmFibGUpKHZvaWQpOwogCWludCBlcnJvcjsKQEAgLTE0ODUs
NyArMTQ4NSw3IEBAIHN0YXRpYyBpbnQgX19pbml0IGk4MDQyX3NldHVwX2F1eCh2b2lkKQogCXJl
dHVybiBlcnJvcjsKIH0KIAotc3RhdGljIGludCBfX2luaXQgaTgwNDJfc2V0dXBfa2JkKHZvaWQp
CitzdGF0aWMgaW50IGk4MDQyX3NldHVwX2tiZCh2b2lkKQogewogCWludCBlcnJvcjsKIApAQCAt
MTUzNSw3ICsxNTM1LDcgQEAgc3RhdGljIGludCBpODA0Ml9rYmRfYmluZF9ub3RpZmllcihzdHJ1
Y3Qgbm90aWZpZXJfYmxvY2sgKm5iLAogCXJldHVybiAwOwogfQogCi1zdGF0aWMgaW50IF9faW5p
dCBpODA0Ml9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpkZXYpCitzdGF0aWMgaW50IGk4
MDQyX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKmRldikKIHsKIAlpbnQgZXJyb3I7CiAK
QEAgLTE2MDAsNiArMTYwMCw3IEBAIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIGk4MDQy
X2RyaXZlciA9IHsKIAkJLnBtCT0gJmk4MDQyX3BtX29wcywKICNlbmRpZgogCX0sCisJLnByb2Jl
CQk9IGk4MDQyX3Byb2JlLAogCS5yZW1vdmUJCT0gaTgwNDJfcmVtb3ZlLAogCS5zaHV0ZG93bgk9
IGk4MDQyX3NodXRkb3duLAogfTsKQEAgLTE2MTAsNyArMTYxMSw2IEBAIHN0YXRpYyBzdHJ1Y3Qg
bm90aWZpZXJfYmxvY2sgaTgwNDJfa2JkX2JpbmRfbm90aWZpZXJfYmxvY2sgPSB7CiAKIHN0YXRp
YyBpbnQgX19pbml0IGk4MDQyX2luaXQodm9pZCkKIHsKLQlzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2OwogCWludCBlcnI7CiAKIAlkYmdfaW5pdCgpOwpAQCAtMTYyNiwxNyArMTYyNiwyOSBA
QCBzdGF0aWMgaW50IF9faW5pdCBpODA0Ml9pbml0KHZvaWQpCiAJLyogU2V0IHRoaXMgYmVmb3Jl
IGNyZWF0aW5nIHRoZSBkZXYgdG8gYWxsb3cgaTgwNDJfY29tbWFuZCB0byB3b3JrIHJpZ2h0IGF3
YXkgKi8KIAlpODA0Ml9wcmVzZW50ID0gdHJ1ZTsKIAotCXBkZXYgPSBwbGF0Zm9ybV9jcmVhdGVf
YnVuZGxlKCZpODA0Ml9kcml2ZXIsIGk4MDQyX3Byb2JlLCBOVUxMLCAwLCBOVUxMLCAwKTsKLQlp
ZiAoSVNfRVJSKHBkZXYpKSB7Ci0JCWVyciA9IFBUUl9FUlIocGRldik7CisJZXJyID0gcGxhdGZv
cm1fZHJpdmVyX3JlZ2lzdGVyKCZpODA0Ml9kcml2ZXIpOworCWlmIChlcnIpCiAJCWdvdG8gZXJy
X3BsYXRmb3JtX2V4aXQ7CisKKwlpODA0Ml9wbGF0Zm9ybV9kZXZpY2UgPSBwbGF0Zm9ybV9kZXZp
Y2VfYWxsb2MoImk4MDQyIiwgLTEpOworCWlmICghaTgwNDJfcGxhdGZvcm1fZGV2aWNlKSB7CisJ
CWVyciA9IC1FTk9NRU07CisJCWdvdG8gZXJyX3VucmVnaXN0ZXJfZHJpdmVyOwogCX0KIAorCWVy
ciA9IHBsYXRmb3JtX2RldmljZV9hZGQoaTgwNDJfcGxhdGZvcm1fZGV2aWNlKTsKKwlpZiAoZXJy
KQorCQlnb3RvIGVycl9mcmVlX2RldmljZTsKKwogCWJ1c19yZWdpc3Rlcl9ub3RpZmllcigmc2Vy
aW9fYnVzLCAmaTgwNDJfa2JkX2JpbmRfbm90aWZpZXJfYmxvY2spOwogCXBhbmljX2JsaW5rID0g
aTgwNDJfcGFuaWNfYmxpbms7CiAKIAlyZXR1cm4gMDsKIAorZXJyX2ZyZWVfZGV2aWNlOgorCXBs
YXRmb3JtX2RldmljZV9wdXQoaTgwNDJfcGxhdGZvcm1fZGV2aWNlKTsKK2Vycl91bnJlZ2lzdGVy
X2RyaXZlcjoKKwlwbGF0Zm9ybV9kcml2ZXJfdW5yZWdpc3RlcigmaTgwNDJfZHJpdmVyKTsKICBl
cnJfcGxhdGZvcm1fZXhpdDoKIAlpODA0Ml9wbGF0Zm9ybV9leGl0KCk7CiAJcmV0dXJuIGVycjsK
LS0gCjIuMjUuMQoK
--0000000000003ac0f505cbbcb5cc--
