Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03774658F11
	for <lists+linux-input@lfdr.de>; Thu, 29 Dec 2022 17:29:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230212AbiL2Q3D (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Dec 2022 11:29:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233948AbiL2Q2Y (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Dec 2022 11:28:24 -0500
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CE1515701
        for <linux-input@vger.kernel.org>; Thu, 29 Dec 2022 08:28:12 -0800 (PST)
Received: by mail-yb1-xb30.google.com with SMTP id v126so21099391ybv.2
        for <linux-input@vger.kernel.org>; Thu, 29 Dec 2022 08:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tEy6Pz6TZ8wgxld9QXf7UKFktEosG4qIJ+7nbxoskd0=;
        b=eQU6BMaZXw6wFtfgRfgeODYRW+mQm/oukmxWbrYkGYLiU58VED3Jyb5OH3Ekqhe3Be
         /X7XQxKx4LeNPQTpceeTPSBCb5qxAWEm6zt2BOlDCK/an9+rggcovv+Bwts/hjHyJc78
         SE0uZA9jMaohAIdt0nvybUyDdMxaWdqUFW2c0u/yQtN2p76QlIJ3Z60F63dCY76af5Qk
         bcltayTgVmDOY+3+LJSVpNVdHY3ZyJI8wJVBdxpz6msKHXg3Il1A71MLUopUK2E9/f5z
         5nEyn3nshmNSRNoCclsFAIDxpeJReQRaESB9d08AKMIToV3R42qNp1ghnkaKh5YL9pki
         4ziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tEy6Pz6TZ8wgxld9QXf7UKFktEosG4qIJ+7nbxoskd0=;
        b=oR8nhLEhnGCq6/jqOm7RjmSVQ32n+7vn5h31X+9UwWbFTgw1kQm0FhawGvg8kcBQGE
         AyHaPHBHc39yzz5SYKzzvfVU2BRrRvbOYUvV16xrGClZSQ0pvIRH/s/3YKJ9B+NF7qMW
         RFzG28L2z8KORt5VXp12MXII8lCjIv3XDdpzewqG46rFsVLRodfD2vWkUvghEoLx6vMj
         I0mcWS4dXkFu944QGaHH87t3ysAzyAEknxz447brkxoEcKJKwPmQ2ya+MdptuOBEn9iA
         pU755la6kIVmUysM05rKbrNAC28FYwJqxFxOG8+iPRDqLwDtPy7vQYSWiYCpQTC9quBZ
         dnjQ==
X-Gm-Message-State: AFqh2ko/B9SmZq9jOxQKvAVpj8PMFklA5vAD2qQb6jx4moKihc2lyImt
        TfSb8md1GqPL4Pt7ZFNPu/B2qbAKI9h5yJcRbfE=
X-Google-Smtp-Source: AMrXdXufNmxLAcUFSSpkcCLH91+x6N1Ncap1j16tVtTIf9oUE+OF1d235lRYEYSGYi+RGvElh4tr4D9e/Bp0QP7cck0=
X-Received: by 2002:a25:bc0f:0:b0:76c:f1a:8a81 with SMTP id
 i15-20020a25bc0f000000b0076c0f1a8a81mr2405089ybh.479.1672331291709; Thu, 29
 Dec 2022 08:28:11 -0800 (PST)
MIME-Version: 1.0
References: <20221226000722.2xgbvsnrl6k7f7tk@ananas> <CAEc3jaDf_TqzxRt3m=OscjLcg=L-jYhNq2r7jEyD6Z1pFo3NRA@mail.gmail.com>
 <20221228180130.47ix3afwbv4bmqfc@ananas> <CAEc3jaD-Z4F8CQBHKrBV=H1JwO3LhQMxy1rv2k30rCYhkr1CmQ@mail.gmail.com>
 <20221228215838.7rxsevi4wfldmm2j@ananas>
In-Reply-To: <20221228215838.7rxsevi4wfldmm2j@ananas>
From:   Roderick Colenbrander <thunderbird2k@gmail.com>
Date:   Thu, 29 Dec 2022 08:28:00 -0800
Message-ID: <CAEc3jaAq7wH1b_jmw-t__Fc4xG6bTpW8hTnBf0gF8L04-sSiEw@mail.gmail.com>
Subject: Re: [PATCH] HID: sony: Fix division by zero
To:     Alain Carlucci <alain.carlucci@gmail.com>
Cc:     linux-input <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>
Content-Type: multipart/mixed; boundary="00000000000097804e05f0f9f841"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

--00000000000097804e05f0f9f841
Content-Type: text/plain; charset="UTF-8"

Hi Alain,

Give this patch a try. It is against hid-playstation, which as of 6.2
supports DS4. Let me know if it works. You can see the sensors working
through evdev on the motion sensors device.

In regards to your DS4. I am not sure if yours is an official one or
not. There are many official DS4 revisions (probably 10+ different
PCBs) and the clones go to great length. Considering the sensors do
seem to work, it does feel odd that the data is zero. Either something
cleared the calibration data (would be strange) or it might be a
clone. If you want to dig deeper, you can play around with
dualshock4_get_calibration_data in hid-playstation. The particular
report (though not fully documented in the driver) does contain a lot
of device info (firmware info, manufacturing dates, various strings).
You can probably find the details online. Some data there might be
weird or not populated.

Thanks,
Roderick

On Wed, Dec 28, 2022 at 1:58 PM Alain Carlucci <alain.carlucci@gmail.com> wrote:
>
> On Wed, Dec 28, 2022 at 11:38:03AM -0800, Roderick Colenbrander wrote:
> >Hi Alain,
> >
> >Thanks for the info. Out of curiosity are the reported sensor values in the
> >hid report non zero?
>
> Just wrote the print code and unexpectedly.. yes!
>
> Here's a report of the raw_data variable in dualshock4_parse_report()
> using printk:
>
> [10793.137066] rd0=4 rd1=1  rd2=17 rd3=707 rd4=-8063 rd5=-1536
> [10793.141121] rd0=4 rd1=0  rd2=17 rd3=698 rd4=-8061 rd5=-1546
> [10793.145101] rd0=4 rd1=-1 rd2=19 rd3=699 rd4=-8062 rd5=-1544
> [10793.149059] rd0=3 rd1=0  rd2=19 rd3=695 rd4=-8052 rd5=-1554
> [10793.153085] rd0=4 rd1=-1 rd2=19 rd3=691 rd4=-8052 rd5=-1547
> [10793.157059] rd0=4 rd1=0  rd2=18 rd3=709 rd4=-8057 rd5=-1551
>
> >As for testing there are no good apps. Evtest can at least do gamepad and
> >touchpad. Unfortunately we didn't make a proper desktop test app. Hopefully
> >in the future.
> Ok got it, thank you.
>
> Thanks,
> Alain

--00000000000097804e05f0f9f841
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0002-HID-playstation-sanity-check-DS4-calibration-data.patch"
Content-Disposition: attachment; 
	filename="0002-HID-playstation-sanity-check-DS4-calibration-data.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lc9apbfj0>
X-Attachment-Id: f_lc9apbfj0

RnJvbSA2ZTJkOGY5ZmQyNDNiY2I4Y2MzZGUxOTIxMmY2NGZjZDg3MDFmY2EwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBSb2RlcmljayBDb2xlbmJyYW5kZXIgPHJvZGVyaWNrLmNvbGVu
YnJhbmRlckBzb255LmNvbT4KRGF0ZTogVGh1LCAyOSBEZWMgMjAyMiAwODoxOToyOCAtMDgwMApT
dWJqZWN0OiBbUEFUQ0ggMi8yXSBISUQ6IHBsYXlzdGF0aW9uOiBzYW5pdHkgY2hlY2sgRFM0IGNh
bGlicmF0aW9uIGRhdGEuCgpTb21lIER1YWxTaG9jazQgZGV2aWNlcyByZXBvcnQgaW52YWxpZCBj
YWxpYnJhdGlvbiBkYXRhIHJlc3VsdGluZwppbiBrZXJuZWwgb29wc2VzIGR1ZSB0byBkaXZpc2lv
biBieSB6ZXJvIGR1cmluZyByZXBvcnQgaGFuZGxpbmcuCgpUaGUgZGV2aWNlcyBhZmZlY3RlZCBh
cHBlYXIgdG8gYmUgY2xvbmUgZGV2aWNlcywgd2hpY2ggZG9uJ3QKaW1wbGVtZW50IGFsbCByZXBv
cnRzIHByb3Blcmx5IGFuZCBkb24ndCBwb3B1bGF0ZSBwcm9wZXIgY2FsaWJyYXRpb24KZGF0YS4K
ClRoaXMgcGF0Y2ggcHJldmVudHMgdGhlIGNyYXNoZXMgYnkgZXNzZW50aWFsbHkgZGlzYWJsaW5n
IGNhbGlicmF0aW9uCndoZW4gaW52YWxpZCB2YWx1ZXMgYXJlIGRldGVjdGVkLgotLS0KIGRyaXZl
cnMvaGlkL2hpZC1wbGF5c3RhdGlvbi5jIHwgMzEgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2hpZC9oaWQtcGxheXN0YXRpb24uYyBiL2RyaXZlcnMvaGlkL2hpZC1wbGF5c3RhdGlvbi5j
CmluZGV4IDg2NmNjNGU5NDMyMC4uYmRjMzJjODE4ZGM3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2hp
ZC9oaWQtcGxheXN0YXRpb24uYworKysgYi9kcml2ZXJzL2hpZC9oaWQtcGxheXN0YXRpb24uYwpA
QCAtMTczNyw2ICsxNzM3LDcgQEAgc3RhdGljIGludCBkdWFsc2hvY2s0X2dldF9jYWxpYnJhdGlv
bl9kYXRhKHN0cnVjdCBkdWFsc2hvY2s0ICpkczQpCiAJaW50IHNwZWVkXzJ4OwogCWludCByYW5n
ZV8yZzsKIAlpbnQgcmV0ID0gMDsKKwlpbnQgaTsKIAl1aW50OF90ICpidWY7CiAKIAlpZiAoZHM0
LT5iYXNlLmhkZXYtPmJ1cyA9PSBCVVNfVVNCKSB7CkBAIC0xODI5LDYgKzE4MzAsMjMgQEAgc3Rh
dGljIGludCBkdWFsc2hvY2s0X2dldF9jYWxpYnJhdGlvbl9kYXRhKHN0cnVjdCBkdWFsc2hvY2s0
ICpkczQpCiAJZHM0LT5neXJvX2NhbGliX2RhdGFbMl0uc2Vuc19udW1lciA9IHNwZWVkXzJ4KkRT
NF9HWVJPX1JFU19QRVJfREVHX1M7CiAJZHM0LT5neXJvX2NhbGliX2RhdGFbMl0uc2Vuc19kZW5v
bSA9IGd5cm9fcm9sbF9wbHVzIC0gZ3lyb19yb2xsX21pbnVzOwogCisJLyogU2FuaXR5IGNoZWNr
IGd5cm8gY2FsaWJyYXRpb24gZGF0YS4gVGhpcyBpcyBuZWVkZWQgZm9yIGNsb25lIGRldmljZXMs
CisJICogd2hpY2ggcG9vcmx5IGltcGxlbWVudCBzdXBwb3J0LiBTb21lIGRldmljZXMgYXBwZWFy
IHRvIHJldHVybiB6ZXJvcworCSAqIGZvciBhbGwgZGF0YSwgd2hpbGUgc29tZSBoYXJkY29kZSBh
bGwgdGhlIHNhbWUgdmFsdWVzIGFuZCBmb3Igc29tZQorCSAqIHVzZSB0aGUgd3Jvbmcgc2lnbiAo
dGhlIGRlbHRhIGlzIHRoZW4gMCkuCisJICogV2hlbiB3ZSBkZXRlY3Qgc29tZXRoaW5nIGZpc2h5
LCBqdXN0IGRpc2FibGUgdGhlIGNhbGlicmF0aW9uIGxvZ2ljCisJICogYWx0b2dldGhlciBhcyBu
b3RoaW5nIGNhbiBiZSB0cnVzdGVkIGZvciB0aGF0IGF4aXMuCisJICovCisJZm9yIChpID0gMDsg
QVJSQVlfU0laRShkczQtPmd5cm9fY2FsaWJfZGF0YSk7IGkrKykgeworCQlpZiAoZHM0LT5neXJv
X2NhbGliX2RhdGFbaV0uc2Vuc19kZW5vbSA9PSAwKSB7CisJCQloaWRfd2FybihoZGV2LCAiSW52
YWxpZCBneXJvIGNhbGlicmF0aW9uIGRhdGEgZm9yIGF4aXMgKCVkKSwgZGlzYWJsaW5nIGNhbGli
cmF0aW9uLiIsCisJCQkJCWRzNC0+Z3lyb19jYWxpYl9kYXRhW2ldLmFic19jb2RlKTsKKwkJCWRz
NC0+Z3lyb19jYWxpYl9kYXRhW2ldLmJpYXMgPSAwOworCQkJZHM0LT5neXJvX2NhbGliX2RhdGFb
aV0uc2Vuc19udW1lciA9IERTNF9HWVJPX1JFU19QRVJfREVHX1M7CisJCQlkczQtPmd5cm9fY2Fs
aWJfZGF0YVtpXS5zZW5zX2Rlbm9tID0gMTsKKwkJfQorCX0KKwogCS8qCiAJICogU2V0IGFjY2Vs
ZXJvbWV0ZXIgY2FsaWJyYXRpb24gYW5kIG5vcm1hbGl6YXRpb24gcGFyYW1ldGVycy4KIAkgKiBE
YXRhIHZhbHVlcyB3aWxsIGJlIG5vcm1hbGl6ZWQgdG8gMS9EUzRfQUNDX1JFU19QRVJfRyBnLgpA
QCAtMTg1MSw2ICsxODY5LDE5IEBAIHN0YXRpYyBpbnQgZHVhbHNob2NrNF9nZXRfY2FsaWJyYXRp
b25fZGF0YShzdHJ1Y3QgZHVhbHNob2NrNCAqZHM0KQogCWRzNC0+YWNjZWxfY2FsaWJfZGF0YVsy
XS5zZW5zX251bWVyID0gMipEUzRfQUNDX1JFU19QRVJfRzsKIAlkczQtPmFjY2VsX2NhbGliX2Rh
dGFbMl0uc2Vuc19kZW5vbSA9IHJhbmdlXzJnOwogCisJLyogU2FuaXR5IGNoZWNrIGFjY2VsZXJv
bWV0ZXIgY2FsaWJyYXRpb24gZGF0YS4gVGhpcyBpcyBuZWVkZWQgZm9yIGNsb25lIGRldmljZXMs
CisJICogd2hpY2ggcG9vcmx5IGltcGxlbWVudCBzdXBwb3J0LgorCSAqLworCWZvciAoaSA9IDA7
IEFSUkFZX1NJWkUoZHM0LT5hY2NlbF9jYWxpYl9kYXRhKTsgaSsrKSB7CisJCWlmIChkczQtPmFj
Y2VsX2NhbGliX2RhdGFbaV0uc2Vuc19kZW5vbSA9PSAwKSB7CisJCQloaWRfd2FybihoZGV2LCAi
SW52YWxpZCBhY2NlbGVyb21ldGVyIGNhbGlicmF0aW9uIGRhdGEgZm9yIGF4aXMgKCVkKSwgZGlz
YWJsaW5nIGNhbGlicmF0aW9uLiIsCisJCQkJCWRzNC0+YWNjZWxfY2FsaWJfZGF0YVtpXS5hYnNf
Y29kZSk7CisJCQlkczQtPmFjY2VsX2NhbGliX2RhdGFbaV0uYmlhcyA9IDA7CisJCQlkczQtPmFj
Y2VsX2NhbGliX2RhdGFbaV0uc2Vuc19udW1lciA9IERTNF9BQ0NfUkVTX1BFUl9HOworCQkJZHM0
LT5hY2NlbF9jYWxpYl9kYXRhW2ldLnNlbnNfZGVub20gPSAxOworCQl9CisJfQorCiBlcnJfZnJl
ZToKIAlrZnJlZShidWYpOwogCXJldHVybiByZXQ7Ci0tIAoyLjM4LjEKCg==
--00000000000097804e05f0f9f841--
