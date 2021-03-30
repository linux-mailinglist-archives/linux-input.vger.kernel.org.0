Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61AAE34E5D8
	for <lists+linux-input@lfdr.de>; Tue, 30 Mar 2021 12:55:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231269AbhC3Kyv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Mar 2021 06:54:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbhC3KyX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Mar 2021 06:54:23 -0400
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1027C061574
        for <linux-input@vger.kernel.org>; Tue, 30 Mar 2021 03:54:19 -0700 (PDT)
Received: by mail-il1-x133.google.com with SMTP id h7so6652699ilj.8
        for <linux-input@vger.kernel.org>; Tue, 30 Mar 2021 03:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dowhile0-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6CCZGIssOZOyb8v8rumLKlLNOLYnhipt9YPVdKqOdYU=;
        b=zzV3PEDKO5ab+eAktDnzcv8D9uZzRj+UvnDcyDbKcFq/ZEQWeiIig7cUV1eFSkb1Xc
         cfsRdYD+M73gdRIEEf/WJzBzmBgkLtAsBz4tx823mKoEneXfC85/7yCX5Ov8qfHwsvKp
         hiZ2GjjKqayeUjohLHMShCyJ6Nzb8PGNahH1m7pbW7/qsiV6/SenX+dyv/a288N6EGsB
         E7O3bXh/z2NaXBTxpoHOiLEw3XgoJfBBmmRhGjxtLQEPV1prGq+ZfLI/3O3IjdjIeSrX
         oaJwiM8vT4WDhdu1Hz4D64ggJMfycfKZCYJFDMHTYKnYVy2dPY5Mq1hHQwcbCel8STfT
         M/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6CCZGIssOZOyb8v8rumLKlLNOLYnhipt9YPVdKqOdYU=;
        b=F9QqDAoeWRNHOdAFD8BL54NkEm7AKpW3jgBgXTBP3CkO2gNJeBP6iI+Mmx3FO7bbIU
         46XEK/m8bLY8BXLvw0u1+h3ELnxTWMGV9IwAx02b1BRPaSQzsgYH+XzkJb86pV8LdphF
         IJqhxwMw8JDgEmxXzlVnBuF38CgfLcODdRCPTQSloKwQ5WwCgcGYrfkOQHQvOdUNAiSS
         d/+3TZ2JZVhGKSnGixoP297YKOjxK1QPxe9K/N+J+K1A465Nf4blKFxOrIyFomGJ4fdk
         R0B7EBooogWcEugmOWNjJYF2QSYpqN11oZh913sjp+bSgOwxM95XhfbkXKUgLJccBJq9
         pv0g==
X-Gm-Message-State: AOAM5329LjvDP4rJeD8l3JEmCfGle8yOvaNkMKijkqDtO0fmHWIpnBys
        astD2S0WfBDTJcSP0VYBK1abvErbqlRFKJ+cKIYAHg==
X-Google-Smtp-Source: ABdhPJxrtLzgMZnJMp65lbEttxtCDl9wNff6TEHOZH4DNGKIC9Lapd580lUdtyei0fOenFjeUb+boFO0nddkVqLUBNg=
X-Received: by 2002:a92:ccd0:: with SMTP id u16mr5387700ilq.6.1617101659495;
 Tue, 30 Mar 2021 03:54:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210330085424.2244653-1-linus.walleij@linaro.org> <20210330085424.2244653-3-linus.walleij@linaro.org>
In-Reply-To: <20210330085424.2244653-3-linus.walleij@linaro.org>
From:   Javier Martinez Canillas <javier@dowhile0.org>
Date:   Tue, 30 Mar 2021 12:54:08 +0200
Message-ID: <CABxcv=nWUsKyDBKqsW_mTnJctWpgyTrk96V0p5PjVn=r6F1tpQ@mail.gmail.com>
Subject: Re: [PATCH 2/7] Input: cyttsp - Obtain regulators
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Ferruh Yigit <fery@cypress.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Mar 30, 2021 at 10:54 AM Linus Walleij <linus.walleij@linaro.org> wrote:

[snip]

>
> +       struct regulator_bulk_data regulators[2];
>         struct gpio_desc *reset_gpio;
>         bool use_hndshk;
>         u8 act_dist;

Wonder if it is worth adding a constant macro for the 2.

Patch looks good to me:

Reviewed-by: Javier Martinez Canillas <javier@dowhile0.org>

Best regards,
Javier
