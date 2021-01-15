Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED64B2F709B
	for <lists+linux-input@lfdr.de>; Fri, 15 Jan 2021 03:33:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732051AbhAOCdX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 Jan 2021 21:33:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726059AbhAOCdX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 Jan 2021 21:33:23 -0500
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50A70C061575
        for <linux-input@vger.kernel.org>; Thu, 14 Jan 2021 18:32:43 -0800 (PST)
Received: by mail-yb1-xb31.google.com with SMTP id b11so1459142ybj.9
        for <linux-input@vger.kernel.org>; Thu, 14 Jan 2021 18:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SYPyMMtYoGmTpYo5uTF3sYMQrf2HJmyoPinqb7mUiZI=;
        b=It3W7q21Lp2VJEpihDIjXsP05P+kRz+QzKILrRoncxpeI5cMnr8u/W3Kr122Z4lp6g
         +qJF2Vwqpy1pHLLzKGearweZlWqVZeaqcDYnUlkRuocUNPb+pcm7hAQWWzoeVkOeYlQA
         JIStW87/30JoU619posHpsslVhRz+dNU9DHLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SYPyMMtYoGmTpYo5uTF3sYMQrf2HJmyoPinqb7mUiZI=;
        b=QjTSNZxVM7FVjjX3sKc1KRMFSTukPbhFNDxKsULo9TQrN87mSAeDTasnuxpc0VwdFG
         bVv3kBUzFhK3qC6AxGblWY8+2rAeT/MYtllx2EpFpDBtq0uZn8teMF/Uzz4/XRQQkmps
         fIxGVtvStcG39FANUvYoDtSVlBz89khJdlnrBmIEmpZAdwBEodk8Ss/yaDmSN2Lgk7fh
         W2zS2zJw6SzOjIZzVoc4V5Vmo4O7gm6LZ1u70oOWe3zEZiISgSdbe0qDerAn7xbCrDO+
         wdDeLKUQ7yOOsk8pVxrNls1i+i5XFtdbLU5vp1SlhzK7UhUWkRQRkvbNz8jAWfo2dfPc
         45ug==
X-Gm-Message-State: AOAM532+6GyQXyDCZMPfk40hQ/nuYEo1KvvAWNhR0AMPkteJjv8juZMF
        IBASZDLtj9gHO/JgSP3y6t/yb2LJ6syqRtVb7reEMg==
X-Google-Smtp-Source: ABdhPJx7dOcNbpBjdhf5MvxvoS8I1K8S+M1Qf5AvKL3Qi9UUOwCQrHsC7ihKS7kah7PHKEUc3p5r/+MfltMG6JQAU0w=
X-Received: by 2002:a25:3a04:: with SMTP id h4mr14675417yba.285.1610677962683;
 Thu, 14 Jan 2021 18:32:42 -0800 (PST)
MIME-Version: 1.0
References: <20210113172450.v5.1.I025fb861cd5fa0ef5286b7dce514728e9df7ae74@changeid>
 <20210113172450.v5.2.I38e90f114f0311b8aa3bcfff750ba381c09dd3b6@changeid> <161058820506.3661239.14441197324080899810@swboyd.mtv.corp.google.com>
In-Reply-To: <161058820506.3661239.14441197324080899810@swboyd.mtv.corp.google.com>
From:   Philip Chen <philipchen@chromium.org>
Date:   Thu, 14 Jan 2021 18:32:31 -0800
Message-ID: <CA+cxXh=FRy446k_Qs6AsQuzZKY7Y8cA+0ky=QO=ntryX8o5EJw@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] Input: cros-ec-keyb - Expose function row physical
 map to userspace
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Lee Jones <lee.jones@linaro.org>,
        Rajat Jain <rajatja@google.com>, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jan 13, 2021 at 5:36 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Philip Chen (2021-01-13 17:25:13)
> > diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
> > index b379ed7628781..273e3c9ba0b03 100644
> > --- a/drivers/input/keyboard/cros_ec_keyb.c
> > +++ b/drivers/input/keyboard/cros_ec_keyb.c
> > @@ -578,6 +590,19 @@ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
> >         ckdev->idev = idev;
> >         cros_ec_keyb_compute_valid_keys(ckdev);
> >
> > +       of_property_for_each_u32(dev->of_node, "function-row-physmap",
> > +                                prop, p, key_pos) {
> > +               if (i >= MAX_NUM_TOP_ROW_KEYS) {
> > +                       dev_err(dev, "Only support up to %d top row keys.\n",
>
> dev_warn? And drop the period please as we don't add them in the kernel
> usually.
Done.
>
> > +                               MAX_NUM_TOP_ROW_KEYS);
> > +                       break;
> > +               }
> > +               ckdev->function_row_physmap[i] = MATRIX_SCAN_CODE(
>
> Maybe grow some more local variables, like for function_row_physmap so
> this can fit on one line?
Done. Please take a look at v6.
>
>                 row = KEY_ROW(key_pos);
>                 col = KEY_COL(key_pos);
>                 map[i] = MATRIX_SCAN_CODE(row, col, ckdev->row_shift);
>
> > +                       KEY_ROW(key_pos), KEY_COL(key_pos), ckdev->row_shift);
> > +               i++;
>
> We could remove this and just increment num_function_row_keys instead.
> Then that condition check may be a little longer but probably still ok.
Done. Please take a look at v6.
>
>
> > +       }
> > +       ckdev->num_function_row_keys = i;
> > +
> >         err = input_register_device(ckdev->idev);
> >         if (err) {
> >                 dev_err(dev, "cannot register input device\n");
