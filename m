Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5BFC34E5EC
	for <lists+linux-input@lfdr.de>; Tue, 30 Mar 2021 12:59:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbhC3K6j (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Mar 2021 06:58:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231154AbhC3K6I (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Mar 2021 06:58:08 -0400
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4877BC061574
        for <linux-input@vger.kernel.org>; Tue, 30 Mar 2021 03:58:08 -0700 (PDT)
Received: by mail-il1-x135.google.com with SMTP id d2so13771932ilm.10
        for <linux-input@vger.kernel.org>; Tue, 30 Mar 2021 03:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dowhile0-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6flt73mwGWF2jYK9KsfO9uSTZ8oOYusq5pcWUa8txa4=;
        b=SKt4ibmjNLmDFrIDIuF3/z8Fxl+fgo2fIKdYV0wgEKxzOLTboJBKP/E0JMG6DSPDW+
         NeZ1RqrfOwxT8zEcJ6p/KxB1mkFYCmgh64eTHWBxvPfe+EWxIkdd8NoCvZTZ5CeDN/bn
         5Mzvi1ShKqGoRWL7imCag8bkqOyEgdsSOKk9cxyfh46qY1p1DtF5iA36oz+KHiShvwdS
         6IzU+/nwUIEN48wOLVFmo2hKqiNafZ8h7IW1q7NNa6Zl5O1SpjPkQJ7xUPGW2ysFsq1Z
         2tZNCVOl5CFzTzCZeyxrxI0MBcKM7pQUtYrel6qalJVr1qEmxNaPjy4yagtZ0KQyRoj6
         TSZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6flt73mwGWF2jYK9KsfO9uSTZ8oOYusq5pcWUa8txa4=;
        b=dU8W6cGmLACvUINgcT7pFFYj29bjVYtFKqfhYH32xxwJAv4NzoaRbWfCRNUyuN84sF
         79yXQvSKZlGl5H86WjHrTTb1Hd0Xg1qzuiV5u5p1N9fVWoH4TuqymAlb/FO2hkX4A/Mb
         JdGMjKdbnYg6HC1HX7BHRt928V1yhsKR/ZlCmBa+ywqpHBmVdxHj398p8O4Dzr7dB5PA
         4PxA5dKDGbzqPreVrJpVEiH26nH1Vtgy/PhPywyQTZxohtJ8AEPlZff4vdAn5ijyVU3b
         9nbvW2Xuu0zX+o3HGeQDdf4EZVtEBZPQUMDEDDlJgjE3iUkjH/OcR8zkwDnQhN0G/G9r
         /KxQ==
X-Gm-Message-State: AOAM5304Dg5aNQQIrB5iXjstsFRKGheMweDHA8OLWAkWh+DaFQGIv+MN
        mR+eDSQ5bX+nsLJmO3MJqXFteMTCHdW/WsD0r2zabg==
X-Google-Smtp-Source: ABdhPJxRKZUViG9sEaIWkIrpLY1TnsUkoLGVSSGwBxH4d/odoHrWsHB0a+hRm7oRtRka0/Zy3UW/EU+AhFAGfnbbwq4=
X-Received: by 2002:a92:d691:: with SMTP id p17mr20439092iln.166.1617101887826;
 Tue, 30 Mar 2021 03:58:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210330085424.2244653-1-linus.walleij@linaro.org> <20210330085424.2244653-5-linus.walleij@linaro.org>
In-Reply-To: <20210330085424.2244653-5-linus.walleij@linaro.org>
From:   Javier Martinez Canillas <javier@dowhile0.org>
Date:   Tue, 30 Mar 2021 12:57:57 +0200
Message-ID: <CABxcv=kHCPkQdpSgbm_pNMZxBG9X++Yog5LP1qffSg6fdE4WEg@mail.gmail.com>
Subject: Re: [PATCH 4/7] Input: cyttsp - Reduce reset pulse timings
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
>
> The data sheet for CY8CTMA340 specifies that the reset pulse
> shall be at least 1 ms. Specify 1-2 ms with usleep_range()
> to cut some slack for the scheduler.
>
> Curiously the datasheet does not specify how long we have to
> wait after a hard reset until the chip is up, but I have found
> a vendor tree (Samsung GT-S7710) that has code for this touch
> screen and there this is set to 5 ms so I use this with
> the same 1 ms fuzz.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Makes sense.

Reviewed-by: Javier Martinez Canillas <javier@dowhile0.org>
