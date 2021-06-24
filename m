Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5F9A3B29B2
	for <lists+linux-input@lfdr.de>; Thu, 24 Jun 2021 09:47:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231634AbhFXHto (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 24 Jun 2021 03:49:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231558AbhFXHto (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 24 Jun 2021 03:49:44 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C55F6C061574
        for <linux-input@vger.kernel.org>; Thu, 24 Jun 2021 00:47:25 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id t13so4021291pgu.11
        for <linux-input@vger.kernel.org>; Thu, 24 Jun 2021 00:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7u6ZEraKLd+ql2bG6jgRPiLxiOcks8cpfBYI42+fWtE=;
        b=Y62oM3QDlV+vYMk6jBSLEgPCbCE39erC/7lwTJ1ywDKUZzzT6LFN0rXujN4YaXKtUt
         f5LW3cytAvJTauQooJVV9VXgL/eg2pJEW5a04Hu2owXXINMlEd1d00qnMYLLzq7yCLwT
         rv7+HcdKl+jS8SSWT38yTrvP3YDj/oFjZJsWTWBMJwtuZwB0YjeeP2RuQgSIcDutqM6s
         1C7sUmDtNm9ETG5WvoBdVsP4wJgmNiz+qcPvhAiAFpmTD1i80d1L59odG1j7kzPq2phg
         QjqTTV8XAbC4gnahiOPbSEuwJnLtNYRKD1s/qEK6+PAfADsSVdKUIa9Yl76+8LLHF83m
         hzug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7u6ZEraKLd+ql2bG6jgRPiLxiOcks8cpfBYI42+fWtE=;
        b=Oyl0vreNTjC8MaEHR1cByLl9pZonlUu6s6OqZVSZXCzeovO/YZvNtAZMas/mMZiAw7
         iwDi+37fN6FmnHYImkB0a5stzCQyzUjStRrq35uzKx4odMHnHjDqDr4aDFXmZqly2vZI
         +gUlxD3wZM664OVTDo6Vft+L9D2yiaBegFoLrpcVFVcauUh3qwEsyiEmhuEnRZ59e0G1
         4Uc+1kGhsU+YsSShVT8Ynx9M+Fde2wvz42Uhw/W5uZGCJv19CIJqNYWj+pluyjI1Mc4g
         y5rA20mCMjuRoaAz1gcil5KID4Yv6tfRWRiLUpKgq8RQmwPxGkEgrtNlCJypi1ULXsfc
         wZWg==
X-Gm-Message-State: AOAM5320eduipgtFOsQdMugJzP0Nj+46+u/MnHqxtUYysn/6rHPr2dcx
        hPtlKj5L+6vh6MaYgBVOJBQP3RBgijg5XUeoTuHOMbdxgSs1DQ==
X-Google-Smtp-Source: ABdhPJyPA15HMFSR/5vcOwkXGnTz26PO7e8nvRrWhy0f2niiSe+opXPrWi3pT5AyUtAZ0uqsdNm19+I5ReY9mETRmhc=
X-Received: by 2002:a63:4a18:: with SMTP id x24mr3539336pga.303.1624520845171;
 Thu, 24 Jun 2021 00:47:25 -0700 (PDT)
MIME-Version: 1.0
References: <1624456597-9486-1-git-send-email-loic.poulain@linaro.org> <YNPUzjrJaJEnR7vo@google.com>
In-Reply-To: <YNPUzjrJaJEnR7vo@google.com>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Thu, 24 Jun 2021 09:56:55 +0200
Message-ID: <CAMZdPi85FZvJ_jr_CR+t8NQZaLa2W4QiXirLpEX=aTeRRgAhEQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] Input: atmel_mxt_ts: Add wake-up support
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     nick@shmanahar.org, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On Thu, 24 Jun 2021 at 02:41, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
>
> Hi Loic,
>
> On Wed, Jun 23, 2021 at 03:56:36PM +0200, Loic Poulain wrote:
> > Add capability for the touchscreen to wakeup the host on touch event.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > ---
> >  drivers/input/touchscreen/atmel_mxt_ts.c | 18 ++++++++++++++----
> >  1 file changed, 14 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
> > index 05de92c..807f449 100644
> > --- a/drivers/input/touchscreen/atmel_mxt_ts.c
> > +++ b/drivers/input/touchscreen/atmel_mxt_ts.c
> > @@ -3223,6 +3223,8 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
> >               return error;
> >       }
> >
> > +     device_set_wakeup_capable(&client->dev, true);
>
> We do not want to make the touch controller be wakeup source
> unconditionally. I2C core recognized "wakeup-source" in device tree,
> other platforms may employ different techniques setting I2C_CLIENT_WAKE
> when registering I2C devices to mark them as wakeup capable/enabled.

Contrary to device_init_wakeup(), used in some other input drivers,
device_set_wakeup_capable() does not enable the device as a wakeup
source but just sets it as wakeup capable, and it's up to the user or
distro policy to enable it as a wakeup source or not. It's a quite
common way to do, and it does not change the behavior of this driver.
The I2C_CLIENT_WAKE forces enabling wakeup source, which is maybe not
what we want by default for a touchscreen. remote-wakeup enabling is a
device configuration not a hardware property. Thoughts?

I should probably also add dev_pm_set_wake_irq() for auto-enabling
wake on suspend instead of doing it manually.

Regards,
Loic
