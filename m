Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79287523F0F
	for <lists+linux-input@lfdr.de>; Wed, 11 May 2022 22:51:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242188AbiEKUvr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 May 2022 16:51:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240502AbiEKUvq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 May 2022 16:51:46 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D672153A47
        for <linux-input@vger.kernel.org>; Wed, 11 May 2022 13:51:45 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id l19so4107772ljb.7
        for <linux-input@vger.kernel.org>; Wed, 11 May 2022 13:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ginkel.com; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=uMkay1imjS7kVt9lWYFsl95b2toXxxfuyTMXxb/FZro=;
        b=kHAB/5vwa//8mm/L+819GVShXjG0hER5DxnfJk4+10X6kfwQ4n9Dm4Fy0WRWRRdWPk
         kcoSLVGX7D9owfwF5X+EHm+hFG0Dpu2uX9OLwOsZYMQC0pw5p1OsKr9+1AV4nj+zLEvN
         pAPgDVWrI03gJbH/GAZtryli8VtO5QA4Cj4N8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=uMkay1imjS7kVt9lWYFsl95b2toXxxfuyTMXxb/FZro=;
        b=UdBVsQFuIs+WHdOqszNjmvebw4UqX7roJAToFagkw1MUHO65uGecYoTs4DDEvKkScB
         ir15hrqSqOm76MLsbNfn+XHw/3cwiySrbc8HCpofTdOnmkigryrGBuZRx9aEn4/cb3iI
         J24tWPHXmRGh+TdqRJFpPJ/gbn++qjyr5pfQV3iQpOxNhERvjiABB0kV3ElqGctR7hzq
         em2j/mAj/Lax3nPI4UFW+C/jctib2VPTgwFe+/sDv5TfqRyoxB1udwqdZkbEFk3TnIdg
         mykWNt7xhRuRs48i1qFRKoDRCtzHvdcOFG7c7qBxENHyHQSWhuvpTyGarA5U8x07ijQU
         FPCg==
X-Gm-Message-State: AOAM532xig7Onx43V+GH61oRhLYABiqLnsYlVtUmGdiMiWSxjOKP6OcO
        dap6mFsZt6qyc64/0iAk9xiHEnlVYMmiBrd45hIMS6WXFX9ImQ==
X-Google-Smtp-Source: ABdhPJz/EkIelBaexkfLGCL/zXzDXpNl1lGpOrdXFS3EWQWYQncuJPEmWuDYcDrcfpV5mcTpLGDBgglfvVvpvCZ2cK4=
X-Received: by 2002:a2e:bf12:0:b0:249:3a3b:e91a with SMTP id
 c18-20020a2ebf12000000b002493a3be91amr18676451ljr.343.1652302303892; Wed, 11
 May 2022 13:51:43 -0700 (PDT)
MIME-Version: 1.0
From:   Thilo-Alexander Ginkel <thilo@ginkel.com>
Date:   Wed, 11 May 2022 22:51:27 +0200
Message-ID: <CANvSZQ9LSbo6JUMR27tqoe=z6srHks5_pU_AGwqP1aWd1fQSsA@mail.gmail.com>
Subject: ThinkPad X1 Extreme Gen 4 i8042 keyboard sporadically loses key-presses
To:     linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi there,

I am using a Lenovo ThinkPad X1 Extreme Gen 4 (X1E4, 20Y5) that
sporadically loses key-press events, i.e. no key is detected when
pressing the key switch. Usually only single keys are missed, I have
not experienced multiple lost consecutive key-press events.

Lenovo has already swapped the keyboard, keyboard sub-card and
mainboard, so I would rule out a hardware defect with high certainty
(as only chassis, battery and screen are unchanged). The issue only
happens when using the internal keyboard, using an external USB
keyboard works flawlessly. I know two other users that experience the
same issue.

The X1E4 AFAIK accesses the keyboard via the i8042 driver.

An older ThinkPad model (the X1E2) had a firmware/EC bug [1] that
caused key-press events to be lost, so I can't completely rule out
that Lenovo messed up the firmware implementation again.

Affected systems: Lenovo ThinkPad X1 Extreme Gen 4 / P1 Gen 4 (Intel
Tiger Lake H). Mine has a Core i7-11850H.

uname -a
Linux vega 5.17.5-arch1-1 #1 SMP PREEMPT Wed, 27 Apr 2022 20:56:11
+0000 x86_64 GNU/Linux

Any ideas on how to troubleshoot this?

Thanks,
Thilo

[1] https://www.notebookcheck.net/ThinkPad-X1-Extreme-Gen-2-Lenovo-fixes-the-keystrokes-bug.464923.0.html
