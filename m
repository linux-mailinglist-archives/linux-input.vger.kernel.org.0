Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC60C4FEC27
	for <lists+linux-input@lfdr.de>; Wed, 13 Apr 2022 03:20:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230130AbiDMBW3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Apr 2022 21:22:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbiDMBW2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Apr 2022 21:22:28 -0400
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B06128994
        for <linux-input@vger.kernel.org>; Tue, 12 Apr 2022 18:20:07 -0700 (PDT)
Received: by mail-vs1-xe32.google.com with SMTP id u2so267445vsl.6
        for <linux-input@vger.kernel.org>; Tue, 12 Apr 2022 18:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=thk9VZH8MFAHYbNuTUYH9aoiEW3x2okuKRZKoOuS5B8=;
        b=VSfbvTt/1LhVRGGcSyvyl6YXaHfbYajflmjVKdlEceTIePfJU4eVNChzhrLcdhRxaj
         p2p2InVE4VzScmSsppiFdbR47RHty2h5YB4+ZFffnUSvne4fBJkHamdUfDEX+hlaUSvJ
         PGOg3953bmPF+68toyDFPkuv5mw+gwQPokaZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=thk9VZH8MFAHYbNuTUYH9aoiEW3x2okuKRZKoOuS5B8=;
        b=QTCrF28M0aw+3+6ugvUHIrTaidmCmO1Ek/Xz/Hf9wYr95kaRGhBWb6O/ZxOp1NR/Yf
         G0OridwXLpz/nMzptJiCEB/23QeXp1AuP2z+Aywh5ur2k7VpvzHGPK8tAdcnlL+zXBBa
         l4adDdbjdaPunY0TSUy0pFiWcc/8gydhBKZuwfL3XzCUi9RCtlRYAZ4aN6cOYPapFib7
         MU1DnFtMLtBb4CvGjFn6C6JauFPoOPVVqTBgWYShjCZRrSWJvxTC5aoGqka6AKloHpsc
         u7xBFc+KVpAqnwhu1lObp/QpXr4XJLE3yfuf40yUJsp8/c7e4o3FYrScC6gAzbErEhta
         wgbA==
X-Gm-Message-State: AOAM531MTC1RpvXlQ7LSCqdfI8g4nymA248VHQI3fM4pBUT+u4GNOiY+
        HzVVkue24pw1lCpz4Qjal77e2y//pcWdHA==
X-Google-Smtp-Source: ABdhPJySwNKdsOMYr3vkj9K6oFz6OEGbWoln6EKFPpGURc1I8mTujwk9kpCe4k4/nxUA3H9p50xf7g==
X-Received: by 2002:a67:bc04:0:b0:328:2a0c:2dc6 with SMTP id t4-20020a67bc04000000b003282a0c2dc6mr6762369vsn.7.1649812806067;
        Tue, 12 Apr 2022 18:20:06 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id z189-20020a1fc9c6000000b0034520ec1f6dsm1838922vkf.30.2022.04.12.18.20.05
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 18:20:05 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id w21so121319uan.3
        for <linux-input@vger.kernel.org>; Tue, 12 Apr 2022 18:20:05 -0700 (PDT)
X-Received: by 2002:ab0:15ae:0:b0:359:6107:43b8 with SMTP id
 i43-20020ab015ae000000b00359610743b8mr2292028uae.23.1649812805261; Tue, 12
 Apr 2022 18:20:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAO3Us=m-Tj2yrt4=1nnr=CgUA2LR29W5DbPAP4T8xwt2VS=FnA@mail.gmail.com>
In-Reply-To: <CAO3Us=m-Tj2yrt4=1nnr=CgUA2LR29W5DbPAP4T8xwt2VS=FnA@mail.gmail.com>
From:   Harry Cutts <hcutts@chromium.org>
Date:   Tue, 12 Apr 2022 18:19:54 -0700
X-Gmail-Original-Message-ID: <CA+jURctcSHLb3-7VYpUUP9_RF_71xgWnM-v8UwcynRZkdHYDkg@mail.gmail.com>
Message-ID: <CA+jURctcSHLb3-7VYpUUP9_RF_71xgWnM-v8UwcynRZkdHYDkg@mail.gmail.com>
Subject: Re: Getting the raw keycode to implement a new key in Linux
To:     Marcos Alano <marcoshalano@gmail.com>
Cc:     HID CORE LAYER <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 12 Apr 2022 at 16:29, Marcos Alano <marcoshalano@gmail.com> wrote:
> I have a Dell G15 5511 laptop and this machine has a very particular
> feature: a key called "G- key" (accessed pressing Fn+F7) which is used
> (on Windows at least) to do a boost in the machine. The details about
> how this boost works is not the question here. The question is: How
> can I find, in the kernel level, what code is emitted? I want to know
> that, so I can start hacking around and come up with a patch, so the
> key can be recognized by the OS, so a user space daemon can be
> triggered to do the boost part (or any other action).

Probably the best starting place is to run the evtest command, choose
your keyboard, and press the key. That should at least give you an
MSC_SCAN line giving you the scan code, unless Dell have done
something in their keyboard controller to treat Fn+F7 as something
other than a normal keypress.

Harry Cutts
Chrome OS Touch/Input team
