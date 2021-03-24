Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18EF634739E
	for <lists+linux-input@lfdr.de>; Wed, 24 Mar 2021 09:27:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233471AbhCXI1S (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 24 Mar 2021 04:27:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233939AbhCXI1N (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 24 Mar 2021 04:27:13 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69F1AC061763
        for <linux-input@vger.kernel.org>; Wed, 24 Mar 2021 01:27:13 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id o10so30687380lfb.9
        for <linux-input@vger.kernel.org>; Wed, 24 Mar 2021 01:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lmgGbrZo60eDJodDfXdzebpXpLLloCptnFqNqk8PLk8=;
        b=btl1IELrOxSbCXKAC8Bq/Q7xgkU2zDYpqN9MTHxcbxinC+g96BEerNMY0re6kURJg5
         EnwjaWsNZ9vFT53vsd0tMQuh3BMOAnuWmvf6411EkeRn+bf32STq6T6F7QOQ2cND8ISZ
         oCZ3ylRZchO3sFfoYcKWzZ2NAzplm8NIMWui3f2KT/Fl3E1ocFRaUqk9KqWNPrpgVmrC
         enf+pGmfJnVJBANtrgE+hMHIr8LzSh6dch9b6WDtl1qD5+Z+dOsJh+ZZQsm18RyfcD54
         12cRFlziFQwvIuOYW9Dvj18vB0y+jD15hWv2G50VDoLIQKyL2ecNhwnO7RnchOnGBabj
         8Wlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lmgGbrZo60eDJodDfXdzebpXpLLloCptnFqNqk8PLk8=;
        b=uCUMSpae23EfK+k8+sMFBaJ8rzeWNdaoLBJx3pO+Uxew/YJJFAVArh1FkfmihYICnC
         r9APFIG4Fvb+LvLGZi3vG9xu6GXS23SEEylKLiB1u/lcrqY0JMEJ69VZfTDrJfowFH+Z
         COZ7mVZWILPM5c33Mbb13fYIdqYSl2cPa62PcT90hVD8f8ry3t3ws5ap/qx6ANACftNG
         +MUszOGk6VmBOrKS1QNCgumcIQ/FadR3IQXCTQ2i/befWfcgWDRVG6AcSYSnnoaQoDVn
         NnVJ8udDXq5t8UDgdR9qxzph6tGh5B3ensRjFau7IoGBKuL2zIfe4vDkPHS7jKJh+ZHG
         BE6w==
X-Gm-Message-State: AOAM5332sjEEBC31KsdBO+0AkAYqX0VDrRXtylr3gMPgHIY3cchyIEQ4
        8LryeTyosW9zSgk6BfK/vLTpwnCU8z0xSWV5kRPKommxUg+29RHb
X-Google-Smtp-Source: ABdhPJz8lPl4uQdaG6bLb6Wxu5gf+YowRhIoE8LmYUybNoPkbBghRQBm/YCqLerv4GUdfY86fbXGQEoHNWomgdqxLao=
X-Received: by 2002:a19:4c08:: with SMTP id z8mr1278093lfa.157.1616574430475;
 Wed, 24 Mar 2021 01:27:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210322221349.1116666-1-linus.walleij@linaro.org> <YFlnPv3m4qfSsU/a@google.com>
In-Reply-To: <YFlnPv3m4qfSsU/a@google.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 24 Mar 2021 09:26:59 +0100
Message-ID: <CACRpkdY1_kB-Svho6KoUC9YFbGtYX7OV3AcrAU3j+BxsOFSPQQ@mail.gmail.com>
Subject: Re: [PATCH] Input: cyttsp - Verbose error on soft reset
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Ferruh Yigit <fery@cypress.com>,
        Linux Input <linux-input@vger.kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Mar 23, 2021 at 4:57 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> On Mon, Mar 22, 2021 at 11:13:49PM +0100, Linus Walleij wrote:

> >       retval = timeout ? 0 : -EIO;
> > +     if (retval)
> > +             dev_err(ts->dev, "timeout waiting for soft reset\n");
>
> I think if we have conditional for the error message then having ternary
> above does not make sense. I changed this to:

Ah nice.

I'm starting to get this driver to work on a machine, so I hope I
will be able to make a few more serious improvements.

Yours,
Linus Walleij
