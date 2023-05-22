Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C938570C519
	for <lists+linux-input@lfdr.de>; Mon, 22 May 2023 20:24:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233355AbjEVSYS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 May 2023 14:24:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233092AbjEVSYP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 May 2023 14:24:15 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 745AD189
        for <linux-input@vger.kernel.org>; Mon, 22 May 2023 11:24:13 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-969f90d71d4so969652866b.3
        for <linux-input@vger.kernel.org>; Mon, 22 May 2023 11:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1684779852; x=1687371852;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OYRWgCDntd6M6zPwTuoO6FVTAIFdNPknpscZnk3SHyI=;
        b=Ofksx1ADeKMt2VcKR5PNj8h2rWgSuMI5ykhm0eqik/MiT4Dfvufymy9EFS7S4B0WnG
         +ja1fF6b/7b44u3KNTqt/AobDaxSfNW8gDphCQRQCC93k/ubNkG4NODNsH+sOiGxlID7
         iOnw9AwNl7aIxVGQ75QaKU+gJ35P38UGSVI2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684779852; x=1687371852;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OYRWgCDntd6M6zPwTuoO6FVTAIFdNPknpscZnk3SHyI=;
        b=Xrl3YElpvNagTPGHacpoWZkpVZmB+bs98xbcMQDOm1teAz+L/fzLN6nry55rYsrDJa
         8HtdKcglJUvYvAozTJoizqNbB9mnp4j13lc/KM1GMwuqyBt6kb/JoJbncqLpP8USxelZ
         k0j7XHyD1kItky1jL+ju13YyvWOH7gXxBQiiTgMOl9c4nhD2JhVSUSi9BW3TlZBuBMZh
         M7Jq80me6Ry1x2/pN4BOUF45w53xZWjmBDDEUBsWGi1p7c4yp0093wzxw9Jl0NWOwRyT
         s4a6IDiRvydkhJqY/ImYyc6r0Z95pTO86IR5ss3dRdRG7K26tyisHcelVA9qJou8K6y6
         xB3g==
X-Gm-Message-State: AC+VfDyr0FEVPnS3FzhSb9IBKKi5zyRm2gJc6gKMRtOawbg2bW5YD5K0
        wUNV9lTXN1dSuL6a9Dhx6SD6C47F8QRWRJIuJKWEayHG
X-Google-Smtp-Source: ACHHUZ69SLP6BIlmDxwNp5L8RKro5viTU28Nd5glGxJ+4LfXfeaXmNeHu3GqX2/+8Ihjx0f7Dy6gBQ==
X-Received: by 2002:a17:906:b044:b0:96f:4927:7a96 with SMTP id bj4-20020a170906b04400b0096f49277a96mr9741435ejb.70.1684779851702;
        Mon, 22 May 2023 11:24:11 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id my37-20020a1709065a6500b0096f0c8beebbsm3434246ejc.79.2023.05.22.11.24.10
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 May 2023 11:24:10 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-96fd3a658eeso256405266b.1
        for <linux-input@vger.kernel.org>; Mon, 22 May 2023 11:24:10 -0700 (PDT)
X-Received: by 2002:a17:907:86a2:b0:96f:a39c:86d6 with SMTP id
 qa34-20020a17090786a200b0096fa39c86d6mr8145445ejc.8.1684779850024; Mon, 22
 May 2023 11:24:10 -0700 (PDT)
MIME-Version: 1.0
References: <9b987585-0834-bb8c-3414-283c29f3f2ab@leemhuis.info>
 <bec024d5-4088-00ae-f7b5-7188868b1707@leemhuis.info> <b7717c43-74bf-b91d-d3ce-874493df602c@gmail.com>
 <CAO-hwJ+At1J_yUpX2q_dJekzZ-PoTDAvxmkTk_e4Yu0Z338bEA@mail.gmail.com> <55dda0bb-fe42-6dee-28ea-00121554d092@leemhuis.info>
In-Reply-To: <55dda0bb-fe42-6dee-28ea-00121554d092@leemhuis.info>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 22 May 2023 11:23:53 -0700
X-Gmail-Original-Message-ID: <CAHk-=whvhkSk6m8_AidhofgR9nq0Md+HbNad5r1RE69tZgbv6Q@mail.gmail.com>
Message-ID: <CAHk-=whvhkSk6m8_AidhofgR9nq0Md+HbNad5r1RE69tZgbv6Q@mail.gmail.com>
Subject: Re: [regression] Since kernel 6.3.1 logitech unify receiver not
 working properly
To:     Linux regressions mailing list <regressions@lists.linux.dev>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@riseup.net>,
        Bastien Nocera <hadess@hadess.net>,
        Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, guy.b@bluewin.ch
Content-Type: multipart/mixed; boundary="0000000000007cd31e05fc4c60e2"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

--0000000000007cd31e05fc4c60e2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 22, 2023 at 5:38=E2=80=AFAM Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> FWIW, in case anybody is interested in a status update: one reporter
> bisected the problem down to 586e8fede79 ("HID: logitech-hidpp: Retry
> commands when device is busy"); reverting that commit on-top of 6.3
> fixes the problem for that reporter. For that reporter things also work
> on 6.4-rc; but for someone else that is affected that's not the case.

Hmm. It's likely timing-dependent.

But that code is clearly buggy.

If the wait_event_timeout() returns early, the device hasn't replied,
but the code does

                if (!wait_event_timeout(hidpp->wait, hidpp->answer_availabl=
e,
                                        5*HZ)) {
                        dbg_hid("%s:timeout waiting for response\n", __func=
__);
                        memset(response, 0, sizeof(struct hidpp_report));
                        ret =3D -ETIMEDOUT;
                }

and then continues to look at the response _anyway_.

Now, depending on out hardening options, that response may have been
initialized by the compiler, or may just be random stack contents.

That bug is pre-existing (ie the problem was not introduced by that
commit), but who knows if the retry makes things worse (ie if it then
triggers on a retry, the response data will be the *previous*
response).

The whole "goto exit" games should be removed too, because we're in a
for-loop, and instead of "goto exit" it should just do "break".

IOW, something like this might be worth testing.

That said, while I think the code is buggy, I doubt this is the actual
cause of the problem people are reporting. But it would be lovely to
hear if the attached patch makes any difference, and I think this is
fixing a real - but unlikely - problem anyway.

And obviously it might be helpful to actually enable those dbg_hid()
messages, but I didn't look at what the magic config option to do so
was.

NOTE! Patch below *ENTIRELY* untested. I just looked at the code when
that commit was mentioned, and went "that's not right"...

                     Linus

--0000000000007cd31e05fc4c60e2
Content-Type: text/x-patch; charset="US-ASCII"; name="patch.diff"
Content-Disposition: attachment; filename="patch.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_lhz6dxva0>
X-Attachment-Id: f_lhz6dxva0

IGRyaXZlcnMvaGlkL2hpZC1sb2dpdGVjaC1oaWRwcC5jIHwgOCArKysrLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2hpZC9oaWQtbG9naXRlY2gtaGlkcHAuYyBiL2RyaXZlcnMvaGlkL2hpZC1sb2dpdGVjaC1o
aWRwcC5jCmluZGV4IDBmY2ZkODVmZWEwZi4uNzJiZDYyZDJmOTg0IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2hpZC9oaWQtbG9naXRlY2gtaGlkcHAuYworKysgYi9kcml2ZXJzL2hpZC9oaWQtbG9naXRl
Y2gtaGlkcHAuYwpAQCAtMzA2LDcgKzMwNiw3IEBAIHN0YXRpYyBpbnQgaGlkcHBfc2VuZF9tZXNz
YWdlX3N5bmMoc3RydWN0IGhpZHBwX2RldmljZSAqaGlkcHAsCiAJCWlmIChyZXQpIHsKIAkJCWRi
Z19oaWQoIl9faGlkcHBfc2VuZF9yZXBvcnQgcmV0dXJuZWQgZXJyOiAlZFxuIiwgcmV0KTsKIAkJ
CW1lbXNldChyZXNwb25zZSwgMCwgc2l6ZW9mKHN0cnVjdCBoaWRwcF9yZXBvcnQpKTsKLQkJCWdv
dG8gZXhpdDsKKwkJCWJyZWFrOwogCQl9CiAKIAkJaWYgKCF3YWl0X2V2ZW50X3RpbWVvdXQoaGlk
cHAtPndhaXQsIGhpZHBwLT5hbnN3ZXJfYXZhaWxhYmxlLApAQCAtMzE0LDEzICszMTQsMTQgQEAg
c3RhdGljIGludCBoaWRwcF9zZW5kX21lc3NhZ2Vfc3luYyhzdHJ1Y3QgaGlkcHBfZGV2aWNlICpo
aWRwcCwKIAkJCWRiZ19oaWQoIiVzOnRpbWVvdXQgd2FpdGluZyBmb3IgcmVzcG9uc2VcbiIsIF9f
ZnVuY19fKTsKIAkJCW1lbXNldChyZXNwb25zZSwgMCwgc2l6ZW9mKHN0cnVjdCBoaWRwcF9yZXBv
cnQpKTsKIAkJCXJldCA9IC1FVElNRURPVVQ7CisJCQlicmVhazsKIAkJfQogCiAJCWlmIChyZXNw
b25zZS0+cmVwb3J0X2lkID09IFJFUE9SVF9JRF9ISURQUF9TSE9SVCAmJgogCQkgICAgcmVzcG9u
c2UtPnJhcC5zdWJfaWQgPT0gSElEUFBfRVJST1IpIHsKIAkJCXJldCA9IHJlc3BvbnNlLT5yYXAu
cGFyYW1zWzFdOwogCQkJZGJnX2hpZCgiJXM6Z290IGhpZHBwIGVycm9yICUwMlhcbiIsIF9fZnVu
Y19fLCByZXQpOwotCQkJZ290byBleGl0OworCQkJYnJlYWs7CiAJCX0KIAogCQlpZiAoKHJlc3Bv
bnNlLT5yZXBvcnRfaWQgPT0gUkVQT1JUX0lEX0hJRFBQX0xPTkcgfHwKQEAgLTMyOSwxMyArMzMw
LDEyIEBAIHN0YXRpYyBpbnQgaGlkcHBfc2VuZF9tZXNzYWdlX3N5bmMoc3RydWN0IGhpZHBwX2Rl
dmljZSAqaGlkcHAsCiAJCQlyZXQgPSByZXNwb25zZS0+ZmFwLnBhcmFtc1sxXTsKIAkJCWlmIChy
ZXQgIT0gSElEUFAyMF9FUlJPUl9CVVNZKSB7CiAJCQkJZGJnX2hpZCgiJXM6Z290IGhpZHBwIDIu
MCBlcnJvciAlMDJYXG4iLCBfX2Z1bmNfXywgcmV0KTsKLQkJCQlnb3RvIGV4aXQ7CisJCQkJYnJl
YWs7CiAJCQl9CiAJCQlkYmdfaGlkKCIlczpnb3QgYnVzeSBoaWRwcCAyLjAgZXJyb3IgJTAyWCwg
cmV0cnlpbmdcbiIsIF9fZnVuY19fLCByZXQpOwogCQl9CiAJfQogCi1leGl0OgogCW11dGV4X3Vu
bG9jaygmaGlkcHAtPnNlbmRfbXV0ZXgpOwogCXJldHVybiByZXQ7CiAK
--0000000000007cd31e05fc4c60e2--
