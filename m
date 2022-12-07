Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1522646362
	for <lists+linux-input@lfdr.de>; Wed,  7 Dec 2022 22:47:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbiLGVrO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 7 Dec 2022 16:47:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbiLGVrO (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 7 Dec 2022 16:47:14 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79977813B1
        for <linux-input@vger.kernel.org>; Wed,  7 Dec 2022 13:47:13 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id q15so17912750pja.0
        for <linux-input@vger.kernel.org>; Wed, 07 Dec 2022 13:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QeCNoJO1ElaOD/IrQO62gHBtbT08iN7jT/UoXhy3boM=;
        b=DSoDYQOfBjUeakHtOJwrumCMOOMDeW7jGiirIpPu0wmKTJI0QOc99nvgRGTcamtjkT
         OpazOezR1GKBiONCfKkvBRqyf6CxwQe43HF3p38R+SaEtLywuCAhsKQDMMToSiGe+fwq
         bzZB1mHPAgvUWP5qCGDjGIlVTTMWXPusl/PgOKnjIuDApvO4ujXVeZSP/F2yqnCqzoNg
         vIHUOkpclYeVTrTKBbZUsNrYNfdcAEFILBVAv1HbsE9mWalwWwaOpPjm6PtM8eyXtqU8
         O6af/K+0pm49UOekhp+m635KL9FqkmbPIPOXrt+QXYBx31ehkyGU0LO/dv50UP9rJv7q
         5rmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QeCNoJO1ElaOD/IrQO62gHBtbT08iN7jT/UoXhy3boM=;
        b=BhLkKmx1TMEKfGEIkKFfIgiREf8gwcIVun9MhhMk5m/DOskrbrB7lQTtGg73HPZhw2
         J70lsQL05H1ALXCefZGqL+XWYfxu7DvyCWawONz8K8GzefZiVafZxCCNU80LDpUxbV1o
         rp1tPczUdB1Ytauf+1MPJoQ/DSjrxPKE8GFEwK/CqaV1GeU+IhrE1MgFRppTTzVNxHCY
         iRMe+kPVfOTPoMYbt/1H3obRNk9qjqj9m6DaejODw79QrMaWfA+LO3pRBAb1UOlECqFz
         F/9TYG2AELDLTcCB50nPHkQf68zWdR3rakya+JfMJzu3XB4bq9tHoNoKi9gjRIgUsxD5
         YZhg==
X-Gm-Message-State: ANoB5pmiNlvDBs8muwNAmH2eMSDs3vZ7l0YBbVC8sebbpY4lyscx5P5m
        /QixsjcYYjWqw33DsM4eLzw=
X-Google-Smtp-Source: AA0mqf5bzoX/3dd7KpTqhjPyYZ16NNjka5OQh+PuozZYKvspj278ZzyemLrs7hedBcl1kI1apizupw==
X-Received: by 2002:a17:90a:9312:b0:218:6f4b:8366 with SMTP id p18-20020a17090a931200b002186f4b8366mr103783807pjo.137.1670449632819;
        Wed, 07 Dec 2022 13:47:12 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:524a:9944:58ed:e916])
        by smtp.gmail.com with ESMTPSA id w17-20020a63f511000000b00478e7f87f3bsm2650723pgh.67.2022.12.07.13.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 13:47:12 -0800 (PST)
Date:   Wed, 7 Dec 2022 13:47:08 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     linux-input@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Tomohiro Yoshidomi <sylph23k@gmail.com>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Stephan Gerhold <stephan@gerhold.net>,
        Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH 00/32] Input: Joystick keyboard switch to
 DEFINE_SIMPLE_DEV_PM_OPS()
Message-ID: <Y5EJ3PyXaoZbWTVH@google.com>
References: <20221204180841.2211588-1-jic23@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221204180841.2211588-1-jic23@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Dec 04, 2022 at 06:08:09PM +0000, Jonathan Cameron wrote:
> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> As part of recent changes to the macros in linux/pm.h, the
> SIMPLE_DEV_PM_OPS() macro is deprecated in favor of the comination
> of DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr().
> More details in the relevant commit message.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1a3c7bb088266fa2db017be299f91f1c1894c857
> 
> The main advantage of the new versions is that they allow the compiler
> to 'see' the callbacks registered, thus avoiding the need to either
> protect them with ifdef guards or to mark them __maybe_unused.
> The compiler then removes the structure and the callbacks as dead code
> in event of !CONFIG_PM_SLEEP.
> 
> Ultimately to clean up the old macros the change needs to be done to
> all instances of the SIMPLE_DEV_PM_OPS() in the kernel. There are similar
> changes to be done for runtime PM macros and more complex PM handling.
> This set is just meant to switch over some of the low hanging fruit in
> a bite sized chunk.
> 
> Also included at the end of this series are:
> * a warning fix for pxspad
> * allowing various drivers to be build with CONFIG_COMPILE_TEST.
> 
> There was one case that really is architecture specific for which I
> did only a partial build test.  I pushed these out in a branch that
> 0-day build and it didn't see any problems.

Applied the lot, thank you.

-- 
Dmitry
