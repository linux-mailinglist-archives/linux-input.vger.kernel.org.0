Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D34D15E755C
	for <lists+linux-input@lfdr.de>; Fri, 23 Sep 2022 10:02:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231158AbiIWICV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Sep 2022 04:02:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231163AbiIWICN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Sep 2022 04:02:13 -0400
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com [IPv6:2607:f8b0:4864:20::b41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDB8812AED0
        for <linux-input@vger.kernel.org>; Fri, 23 Sep 2022 01:02:10 -0700 (PDT)
Received: by mail-yb1-xb41.google.com with SMTP id 135so4331840ybl.9
        for <linux-input@vger.kernel.org>; Fri, 23 Sep 2022 01:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date;
        bh=/fuJxEvQ8hWJBVA+YQn5WV9w4flp3A4j0tI4rSSd1Ck=;
        b=cfIxv64ssPCAsFkiNHHMFgdJK+aS3ek+iLqUHDY6WnbjhiOIdSnQ44wWRghl+HhmM+
         ZgInIkmqqBXRmr0iLX3qhhwZFhR/JPfzleN6mm2nw1mLuOcoAzAHWkBFiHwZ7tqjMZgF
         PsKRUIHjUUQqGprd2uONY74u1xE5BTvss8qSBbNp7Z+Aq70BRE20eriiNGYVyBXq+Hsq
         b5rkcgTekY6IxWT4nPGAarRMzqwaFzSMb85FKRftobSoeGzks+ft+jlIfNWEogJG+3AZ
         NOSobbcfUtAgxZtAvcYwJWnSzI9bh6dTNyppITL3cUvgwoUGwW3iGN9w6X1aRyfg5wnI
         lcKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=/fuJxEvQ8hWJBVA+YQn5WV9w4flp3A4j0tI4rSSd1Ck=;
        b=d9/jk+aNxCCWC0vCi2TOyEbKbaYZ1bCugjGm+DSwLdFrf7keAesxQmteFlbMaeTj0q
         Rd9wEXiP3UTkLLm7/5t2h3Ir7bipohFu8rYot/VzO/V2WM5bRPimgXODpvPCCIwd9MGj
         1vQo2FvFEro47ZFnuYOBKUn5iPu5zEv+56jnu771ziHJSvUb3mTNnnJArQo1agsy/vcS
         8iDYsgmSmWwBrJmazqeedjLypoXXE0sNGWkueofBJObrv8YryqxGz8EBaBYt9ju/ebJo
         OxPIvIlM4+mVph9g3smCuxvUrhGROLgVR3I2HwUatVyFKB+7fTZzlY2ML8I6wKASIqHj
         bG3g==
X-Gm-Message-State: ACrzQf1OJw79GSsqu9dvw5//LnHVdBsgk0HZ0GNytvs1RuE1sERpNh0X
        wOzfFV7wZGj7hCgVlTmZP/9p81ON1BoEOh0vAVE=
X-Google-Smtp-Source: AMsMyM4xZCf+qxLt2Ywm13M7JqasT1TK3BugpgoPjyQSFw4MK8Zlc9YURZmRkEz6rKorJr4UyEvKaVmMnfEZ87d4MnU=
X-Received: by 2002:a25:2f12:0:b0:6b3:e5e4:aeeb with SMTP id
 v18-20020a252f12000000b006b3e5e4aeebmr7800323ybv.22.1663920129070; Fri, 23
 Sep 2022 01:02:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:3256:0:0:0:0:0 with HTTP; Fri, 23 Sep 2022 01:02:08
 -0700 (PDT)
Reply-To: seybasaniel@gmail.com
From:   Seyba Daniel <bellomouse33@gmail.com>
Date:   Fri, 23 Sep 2022 10:02:08 +0200
Message-ID: <CAC0qSW7sc6GUJtHgf3r23GFt653_aZzwewRn531NjpkWamAU7A@mail.gmail.com>
Subject: HELLO,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.2 required=5.0 tests=BAYES_95,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:b41 listed in]
        [list.dnswl.org]
        *  3.0 BAYES_95 BODY: Bayes spam probability is 95 to 99%
        *      [score: 0.9757]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [bellomouse33[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [bellomouse33[at]gmail.com]
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

I urgently seek your service to represent me in investing in
your region / country and you will be rewarded for your service without
affecting your present job with very little time invested in it, which you will
be communicated in details upon response.

My dearest regards

Seyba Daniel
