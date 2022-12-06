Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 759B8644FC4
	for <lists+linux-input@lfdr.de>; Wed,  7 Dec 2022 00:43:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbiLFXnT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Dec 2022 18:43:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbiLFXnS (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 6 Dec 2022 18:43:18 -0500
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B3B3E0F4
        for <linux-input@vger.kernel.org>; Tue,  6 Dec 2022 15:43:17 -0800 (PST)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-3bf4ade3364so169336647b3.3
        for <linux-input@vger.kernel.org>; Tue, 06 Dec 2022 15:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WDBy1ZX9QysH28XJNbL9bzLXcSLcYyJdYFWOUapLf1Q=;
        b=flf3AcRtIil+hMBL7fdAmYr9xL/0ACmpWrEca2yY7nASAo0OcRPiuv0BOfUqaccfUm
         MsD2T6eWjLo8iI8zXxHRgTchUutUdpBmXryUzdMDJKcCi8zx5kXS4fETChZDe52Af9zC
         8mk3qVW1wmTkE7UbecFEM81zrEcFvofAddh2DXU8+Ir+BFttAAu56w1pRSrfaSZONEH2
         y6CvxbdGhTt2/lumLqYWCi5gN2X843kM3yks8MXmKQsA4rRwcSFfkxDWT1BL7pnYh0cL
         XF6Db1NqtrgtY6F8ggoiBKQtdR+0ohtqNHWyK/fsHLoTD0sAYi+JFT/TPelJFPu+8AWR
         1iPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WDBy1ZX9QysH28XJNbL9bzLXcSLcYyJdYFWOUapLf1Q=;
        b=Rf7vdFNtyXAoqPRzieaupxkZu/+h2dCPsedoqAyIQLpkSg4FhU/I/mm1C5Tu2Jxf+P
         p1Y/XlEZaVxyeh/G9jP8DntWHiLzSDD3jtSBojWvo1Xx8ndotatzFz1sf7l6NEdhoBJM
         EB5WOvC+gEPVzxidN5m9e+swOYXJTxuWhLd5fGyY8A/rWOxIMARmQj5swX1bMAaTnVbE
         AL5hK/lDIkoyumRAZcLjGcJOCZUZT9cPiM+rX0vERHj2rJqiwzTFs/dz8rgY0NUulk/0
         8rE1kWFkMSIR7yr+IMvuZrdOzK3ovuBAeDaJipPcumW9ovh0m8mu2pBLg5vF8ThGh+yN
         H/jg==
X-Gm-Message-State: ANoB5pkTyLRWnIUojYYYHkpp3RTu2KyJkp5J8Xf0yjuk8l94GxAygWbo
        vHf9BfqC92gGEpGMrQkXOf1cp/MC5ACFsHcG0kJ8Mw==
X-Google-Smtp-Source: AA0mqf7GkLf5jrHq65j2MC+bn2XgCoMtXuJfZVHBH0fEqL7IZXfo8GbAkF3Wen9oiLlWp+O7rxfrQoXfzfDfFLwRpcs=
X-Received: by 2002:a81:65c1:0:b0:376:f7e2:4b12 with SMTP id
 z184-20020a8165c1000000b00376f7e24b12mr66827194ywb.0.1670370196679; Tue, 06
 Dec 2022 15:43:16 -0800 (PST)
MIME-Version: 1.0
References: <20221204180841.2211588-1-jic23@kernel.org> <20221204180841.2211588-8-jic23@kernel.org>
In-Reply-To: <20221204180841.2211588-8-jic23@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 7 Dec 2022 00:43:05 +0100
Message-ID: <CACRpkdb31DtE77pYzLvpzkVXvp3PSSx-aLGpAHVNKUDxE9EFnw@mail.gmail.com>
Subject: Re: [PATCH 07/32] Input: ipaq-micro-keys - switch to
 DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Dec 4, 2022 at 6:56 PM Jonathan Cameron <jic23@kernel.org> wrote:

> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>
> SIMPLE_DEV_PM_OPS() is deprecated as it requires explicit protection
> against unused function warnings.  The new combination of pm_sleep_ptr()
> and DEFINE_SIMPLE_DEV_PM_OPS() allows the compiler to see the functions,
> thus suppressing the warning, but still allowing the unused code to be
> removed. Thus also drop the __maybe_unused markings.
>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
