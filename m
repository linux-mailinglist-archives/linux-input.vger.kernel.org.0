Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 035C5756DE3
	for <lists+linux-input@lfdr.de>; Mon, 17 Jul 2023 22:00:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbjGQT76 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 Jul 2023 15:59:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231255AbjGQT75 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 Jul 2023 15:59:57 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AC6113D
        for <linux-input@vger.kernel.org>; Mon, 17 Jul 2023 12:59:56 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b6ff1ada5dso73955021fa.2
        for <linux-input@vger.kernel.org>; Mon, 17 Jul 2023 12:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689623994; x=1692215994;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eGpgZ0ppAQlbE1Gj+/Bg3UaMxf4Eo+IdSC4T1I0Bb0M=;
        b=ZWeAZZpj1CW/M5XLO9XQ+UZCqJoC4dIactZ0Ot4+pQOBoIkh05slPEJLYcIXQGgtBf
         dIfGxTFFbWgLG1Xb/LuOOtGQVVSun0+bX5eut3Bwa+XZM1Jy2GP8cVac76suAU8J6g2N
         DgfGHGnoNls5fHNTSIHtn5Bo+2uBdztkV8tIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689623994; x=1692215994;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eGpgZ0ppAQlbE1Gj+/Bg3UaMxf4Eo+IdSC4T1I0Bb0M=;
        b=T/iOP+lozhVS6WHKbr1juhwjP0zQheXL7pvjGq2vSUywHrRKvz2BACBWmljUVE2fO2
         WkhrlDNpSNmEyfMoOueWhd9hLS3SJRV5H7XLsm0On4QRl6Sqxrp6W187nhN2t5ZoET8e
         5i/WVWOoc8Hye3IjUqnBgGgNw3IbvKZ21S5cBPPzXITpNLX0pjaVDynSKgbz1PgUBH0Y
         XclC2GQMb8kJmP5q9VHI2Vo+XvZL8pSATU5H856fGsAKrri5KM/5Es68b7kUNUjasXPl
         +bfQjmpSB5y36bIXOqBcT/ROjXMIf9jMWpoFwpW/gOvTDthID9pJf8uAUHIuhVjIyjIF
         tiWg==
X-Gm-Message-State: ABy/qLaOo17xJzffHN0Lpg7+VK4sW4Tzl6J0VzMgQA4euxDe4kowM5AN
        EYy547j95RlfG0gwVJNSaTS029jO1bzMd2CPRqcWxfdgd/t0URCr424=
X-Google-Smtp-Source: APBJJlFmwsr8iyEJLnwlU7ko+DmDHwiGP3b/pwjy8tQptk7DviTKSQeI3y+ypyJyEjTrACmpIYC92LNlbl9sxDlSzGM=
X-Received: by 2002:a2e:b609:0:b0:2b6:e2c2:d234 with SMTP id
 r9-20020a2eb609000000b002b6e2c2d234mr8490849ljn.33.1689623994143; Mon, 17 Jul
 2023 12:59:54 -0700 (PDT)
MIME-Version: 1.0
From:   Jonathan Denose <jdenose@chromium.org>
Date:   Mon, 17 Jul 2023 14:59:43 -0500
Message-ID: <CALNJtpVH0DAcnkJ+++H0ng2AWW1t1ZW0RCfbHn=fyRnRN9CJ8w@mail.gmail.com>
Subject: Lenovo N24: Touchpad lost sync at byte 6
To:     linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

I am on a Lenovo N24 laptop.

When this device resumes after closing the lid, the mouse freezes and
is unusable. After right-clicking multiple times the touchpad resumes
working. I am seeing the following in the logs:

[ 1188.690138] psmouse serio1: Touchpad at isa0060/serio1/input0 lost
sync at byte 6
[ 1188.699636] psmouse serio1: Touchpad at isa0060/serio1/input0 lost
sync at byte 6
[ 1188.709124] psmouse serio1: Touchpad at isa0060/serio1/input0 lost
sync at byte 6
[ 1188.718557] psmouse serio1: Touchpad at isa0060/serio1/input0 lost
sync at byte 6
[ 1188.728110] psmouse serio1: Touchpad at isa0060/serio1/input0 lost
sync at byte 6
[ 1188.975964] psmouse serio1: Touchpad at isa0060/serio1/input0 lost
sync at byte 6
[ 1188.985456] psmouse serio1: Touchpad at isa0060/serio1/input0 lost
sync at byte 6
[ 1188.994954] psmouse serio1: Touchpad at isa0060/serio1/input0 lost
sync at byte 6
[ 1189.004443] psmouse serio1: Touchpad at isa0060/serio1/input0 lost
sync at byte 6
[ 1189.013930] psmouse serio1: Touchpad at isa0060/serio1/input0 lost
sync at byte 6

This device has an ETPS/2 Elantech Touchpad. I am on kernel version:
5.15.117-19629-gf1eb3139d206.

Greg KH suggested that I try later kernel versions, and I've tried 6.4
and 6.1 and the issue is present on both of those versions. This issue
is also present on 5.10.

Currently the device suspends to ram when the lid closes. When the
device idles without the lid closing, the touchpad works fine on
resume.

I have tried adding various i8042 and psmouse kernel parameters from
searching different forums related to these error messages, but none
of them fix the issue. I have tried
- psmouse.resetafter=0
- psmouse.resetafter=1
- i8042.nomux=1
- i8042.resetafter=1/0
- i8042.reset=1 i8042.nomux=1
- i8042.noloop=1 i8042.nopnp=1 i8042.nomux=1 i8042.reset=1

I was able to resolve this issue by doing `modprobe -r psmouse &&
modprobe.psmouse proto=imps`. proto=bare and proto=exps also resolve
the issue. However, with those options enabled I can no longer use
gestures like two-finger scroll.

This issue reproduces on ChromeOS Flex and Ubuntu 22.04 but not on
Windows. On Windows the touchpad resuming after closing the lid works
fine.

What can I do to resolve this issue while also keeping touchpad gestures?

Any help is greatly appreciated!
