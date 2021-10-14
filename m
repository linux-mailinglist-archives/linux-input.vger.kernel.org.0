Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE5E342E309
	for <lists+linux-input@lfdr.de>; Thu, 14 Oct 2021 23:02:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232218AbhJNVFD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 Oct 2021 17:05:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232153AbhJNVFC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 Oct 2021 17:05:02 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55C14C061570
        for <linux-input@vger.kernel.org>; Thu, 14 Oct 2021 14:02:57 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id x27so32723511lfu.5
        for <linux-input@vger.kernel.org>; Thu, 14 Oct 2021 14:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jI0siKnxYryfR0Wrdx331NbLBs00Z1e/lOmM3iHWBvg=;
        b=FkHJ1+SuGsYHNEnajUrbdjmmenaWDJxK5uswFbuDCEAZAe+L70XBTKeyNh4LDkvWZ1
         h2BmYh8hGU/POVpfrmDBuUc0KWG6gHaAx7iA55l7wCKaumVPrEhCbGWnI00rv3K2jkwH
         XhBcKWk8QVQmDRjijfarw0WgNaaJX65EjuZpkTGCVcSEQFYYPWMpPIPxcri8sD4iJpto
         GcH5SowKvbolFnGTF9RXRWLC8VsJVihgAT4p0tyLbubZqWO+WWk23HMhXgufamoaME5g
         x5HZl0oEesVm+x79xGRaQrjiXZObv3w2HJVFC5G89JUWDeXtgyGmQx31y9UeYo7R6Lhh
         EuSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jI0siKnxYryfR0Wrdx331NbLBs00Z1e/lOmM3iHWBvg=;
        b=G7GxsHPN29+wGayGnoB/PYrGi2vz6fus34hwrq3N/ghOEfSE0xW6EjKCApcNeoTnVG
         HuyFwqV05lgPngLziLX0tqjOHptxmujmpRIUdz0NluBz4epSm0fGQXYYoTEuWzzy+Jug
         owN68LsMp+nmSPuzlFpMJba1XdxIj1p4z2ilfuY4lta0IhvGuddHG14n8dfpw1MtEuBq
         tTkzJ0GqSqF+SNhqfdjF1l406xTp2Gl4mG/6qnGC4BepkwznJ9OrjxZH4uL0gYdcAEL/
         N3yE7jdEzkVTqmqIOc5LoIZKXF1VMPjdCTuigz0gaoNzlgQysPFsKBvUXIsiyFKvSST8
         sBEA==
X-Gm-Message-State: AOAM531NA0WshtqSJNJX+tuOr77OMiY8z2frSUSSHUiZB4aZBXKrGnr6
        z1A1jg+oVAgZ+VJ7C4wncjilbiOe1Co01SQbUgU+Jg==
X-Google-Smtp-Source: ABdhPJwTvQTGh1URN6uGWIaDr5yfdMy42ZkRQxPCYN3hB8z7lX/APA5HvogdIqDENmGqBLzJfMcvBeq49Qzc3nHofV0=
X-Received: by 2002:ac2:434c:: with SMTP id o12mr7092282lfl.82.1634245375477;
 Thu, 14 Oct 2021 14:02:55 -0700 (PDT)
MIME-Version: 1.0
References: <20211014205757.3474635-1-nathan@kernel.org>
In-Reply-To: <20211014205757.3474635-1-nathan@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 14 Oct 2021 14:02:43 -0700
Message-ID: <CAKwvOdm1W52TmoU5m-RokN+aZF7w4G0KUu0TcWyircWi63onsA@mail.gmail.com>
Subject: Re: [PATCH] Input: touchscreen - Avoid bitwise vs logical OR warning
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Oct 14, 2021 at 1:58 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> A new warning in clang points out a few places in this driver where a
> bitwise OR is being used with boolean types:
>
> drivers/input/touchscreen.c:81:17: warning: use of bitwise '|' with boolean operands [-Wbitwise-instead-of-logical]
>         data_present = touchscreen_get_prop_u32(dev, "touchscreen-min-x",
>                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> This use of a bitwise OR is intentional, as bitwise operations do not
> short circuit, which allows all the calls to touchscreen_get_prop_u32()
> to happen so that the last parameter is initialized while coalescing the
> results of the calls to make a decision after they are all evaluated.
>
> To make this clearer to the compiler, use the '|=' operator to assign
> the result of each touchscreen_get_prop_u32() call to data_present,
> which keeps the meaning of the code the same but makes it obvious that
> every one of these calls is expected to happen.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1472
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Thanks for the patch!
Reported-by: Nick Desaulniers <ndesaulniers@google.com>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  drivers/input/touchscreen.c | 42 ++++++++++++++++++-------------------
>  1 file changed, 21 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/input/touchscreen.c b/drivers/input/touchscreen.c
> index dd18cb917c4d..4620e20d0190 100644
> --- a/drivers/input/touchscreen.c
> +++ b/drivers/input/touchscreen.c
> @@ -80,27 +80,27 @@ void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
>
>         data_present = touchscreen_get_prop_u32(dev, "touchscreen-min-x",
>                                                 input_abs_get_min(input, axis_x),
> -                                               &minimum) |
> -                      touchscreen_get_prop_u32(dev, "touchscreen-size-x",
> -                                               input_abs_get_max(input,
> -                                                                 axis_x) + 1,
> -                                               &maximum) |
> -                      touchscreen_get_prop_u32(dev, "touchscreen-fuzz-x",
> -                                               input_abs_get_fuzz(input, axis_x),
> -                                               &fuzz);
> +                                               &minimum);
> +       data_present |= touchscreen_get_prop_u32(dev, "touchscreen-size-x",
> +                                                input_abs_get_max(input,
> +                                                                  axis_x) + 1,
> +                                                &maximum);
> +       data_present |= touchscreen_get_prop_u32(dev, "touchscreen-fuzz-x",
> +                                                input_abs_get_fuzz(input, axis_x),
> +                                                &fuzz);
>         if (data_present)
>                 touchscreen_set_params(input, axis_x, minimum, maximum - 1, fuzz);
>
>         data_present = touchscreen_get_prop_u32(dev, "touchscreen-min-y",
>                                                 input_abs_get_min(input, axis_y),
> -                                               &minimum) |
> -                      touchscreen_get_prop_u32(dev, "touchscreen-size-y",
> -                                               input_abs_get_max(input,
> -                                                                 axis_y) + 1,
> -                                               &maximum) |
> -                      touchscreen_get_prop_u32(dev, "touchscreen-fuzz-y",
> -                                               input_abs_get_fuzz(input, axis_y),
> -                                               &fuzz);
> +                                               &minimum);
> +       data_present |= touchscreen_get_prop_u32(dev, "touchscreen-size-y",
> +                                                input_abs_get_max(input,
> +                                                                  axis_y) + 1,
> +                                                &maximum);
> +       data_present |= touchscreen_get_prop_u32(dev, "touchscreen-fuzz-y",
> +                                                input_abs_get_fuzz(input, axis_y),
> +                                                &fuzz);
>         if (data_present)
>                 touchscreen_set_params(input, axis_y, minimum, maximum - 1, fuzz);
>
> @@ -108,11 +108,11 @@ void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
>         data_present = touchscreen_get_prop_u32(dev,
>                                                 "touchscreen-max-pressure",
>                                                 input_abs_get_max(input, axis),
> -                                               &maximum) |
> -                      touchscreen_get_prop_u32(dev,
> -                                               "touchscreen-fuzz-pressure",
> -                                               input_abs_get_fuzz(input, axis),
> -                                               &fuzz);
> +                                               &maximum);
> +       data_present |= touchscreen_get_prop_u32(dev,
> +                                                "touchscreen-fuzz-pressure",
> +                                                input_abs_get_fuzz(input, axis),
> +                                                &fuzz);
>         if (data_present)
>                 touchscreen_set_params(input, axis, 0, maximum, fuzz);
>
>
> base-commit: a41392e0877a271007e9209e63c34cab7527eb43
> --
> 2.33.1.637.gf443b226ca
>
>


-- 
Thanks,
~Nick Desaulniers
