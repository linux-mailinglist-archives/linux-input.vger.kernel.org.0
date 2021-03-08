Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8B993309FF
	for <lists+linux-input@lfdr.de>; Mon,  8 Mar 2021 10:11:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229471AbhCHJLB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Mar 2021 04:11:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229756AbhCHJK4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 8 Mar 2021 04:10:56 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59D60C06174A
        for <linux-input@vger.kernel.org>; Mon,  8 Mar 2021 01:10:56 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id e6so6017660pgk.5
        for <linux-input@vger.kernel.org>; Mon, 08 Mar 2021 01:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZBShHwNStV/5ShpgOK6Aa8aoFllWBpI9aNckDNrIEHc=;
        b=vFbLUjhv/6L3fnJmVvBtWFrOpEk0CXt91xPIKVIclZ8YgAUMoANL0RLUZRSIl+PZH1
         3C26KFNfBDTTw4GZoiddmW1VJD9gKf7CWi1pcShasb1QI5+c14He3cVSrnQPjZZ2NNtA
         prc1ko2Y/Dt86RovYmUcwhcXZMaypHe12e5ONY2jPv+1f63DNSL0yOkYejrG1M24i7Pj
         HS8zcYsbext0JsMLsyLR+s/uRYN7Bb6vTeB8vjmV9KTj8Xmzw8SILwJcsT753EVjLDV4
         Bwzrv9WWJvoXC5URc8mswH+ssStETf+1psncr53uQzsTeV6TI1IaFpNiR7imfvwjyUVD
         JsaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZBShHwNStV/5ShpgOK6Aa8aoFllWBpI9aNckDNrIEHc=;
        b=Pxi3GLvoGdm9zSbaJjDtoQECriWJ7QKLOMtPTItxYmhOsPMeAaeXlte/lHmy0oUayK
         KIxBZClABncUnLe4gVpPP+q6INJDuU37nxa2c4eJJZmACiaCJofQjfdcvvP+8mtU/8zK
         JiV5ETvQxsi6zHUPon5rNx6YyVOLKqI/Z4w03nYK0zCVnlORETBwkCq3lLxQ97WJKu2r
         14viDbtwA1Udl3W+Rt13+SjVZ3lmfEmz+GKenUmyXPIPGXxBz3ZfLiXc8K+y5fVaVC6T
         Lc7JitBDhcBDcxq7X2KmWSwEGk4S9a7i6CeqdZ380M4X5f+BHtXLG8P6jMXwWhxINL/k
         E+zw==
X-Gm-Message-State: AOAM530AqYNPgu1eXKQ/wiffBWmtS98ldsbcri2CtfvS8C3FEoOKLvCd
        cz4KEATS7pYZ4gOcnjgaeQtfesLSJzCIgjZ00h5RG5hMoeGwr0OV
X-Google-Smtp-Source: ABdhPJzrr7dpxkQB3I6oKCe+fK4v11RNckACbFYWML2mpe/4AgXMDLbmOF4LetcBTCxcqqKQ7cSpaH2n6b3SvK0uYhM=
X-Received: by 2002:a65:4c08:: with SMTP id u8mr19294886pgq.203.1615194655723;
 Mon, 08 Mar 2021 01:10:55 -0800 (PST)
MIME-Version: 1.0
References: <20210307220549.354263-1-andy.shevchenko@gmail.com> <YEVaYiA9Faylr9il@google.com>
In-Reply-To: <YEVaYiA9Faylr9il@google.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 8 Mar 2021 11:10:38 +0200
Message-ID: <CAHp75VerojbEjAjtmFqhyrmyhT_WCZxQihgAac80_GAZHyH9LQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] Input: tsc2007 - convert to GPIO descriptors
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Mar 8, 2021 at 12:57 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> On Mon, Mar 08, 2021 at 12:05:48AM +0200, Andy Shevchenko wrote:

...

> > -     return !gpio_get_value(ts->gpio);
> > +     return !gpiod_get_value(ts->gpiod);
>
> This is not correct. gpio_get_value() is raw polarity vs
> gpiod_get_value() using logical active/inactive, and tsc2007 GPIO lines
> are active low. The negation must be dropped after switching to GPIOD
> API.

Ah, indeed, I missed that, thanks!

...

> > -     ts->gpio = of_get_gpio(np, 0);
> > -     if (gpio_is_valid(ts->gpio))
> > -             ts->get_pendown_state = tsc2007_get_pendown_state_gpio;
> > -     else
> > -             dev_warn(&client->dev,
> > -                      "GPIO not specified in DT (of_get_gpio returned %d)\n",
> > -                      ts->gpio);
> > +     ts->gpiod = devm_gpiod_get_optional(dev, NULL, GPIOD_IN);
>
> GPIO is definitely not optional in DT case, at least in the way the
> driver written right now.

Can you elaborate this, please? I don't see from the dev_warn() w/o
any error code returned that it's mandatory.
In the bindings one may read:

  Optional properties:
  - gpios: the interrupt gpio the chip is connected to (trough the penirq pin).
    The penirq pin goes to low when the panel is touched.
    (see GPIO binding[1] for more details).

Nothing suggested it's mandatory. What have I missed?

> > +     if (IS_ERR(ts->gpiod))
> > +             return PTR_ERR(ts->gpiod);

-- 
With Best Regards,
Andy Shevchenko
