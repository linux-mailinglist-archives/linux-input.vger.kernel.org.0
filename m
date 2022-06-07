Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7AE1536891
	for <lists+linux-input@lfdr.de>; Fri, 27 May 2022 23:35:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234412AbiE0Vfj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 27 May 2022 17:35:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234306AbiE0Vfi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 27 May 2022 17:35:38 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D27370347
        for <linux-input@vger.kernel.org>; Fri, 27 May 2022 14:35:37 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id t144so7150915oie.7
        for <linux-input@vger.kernel.org>; Fri, 27 May 2022 14:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=k2w7NVm0/nIiADcBWo7qVBA+ljLyXT+6xzbW4CyFYb8=;
        b=UIvPMbmgtx5AdOoxMbwI5XkHcJ7mssqurwFIIQmNClULBwjRdi3ZsaHxg10Zgwe3ze
         tkNIf7LNsoGtJWPcIe+4Mi+J6uR9shc/GT4If1gBKsNzulUBTfcs/6rRku7uatNtmuVf
         MFRtmBb/WBY6BSGCOrZj41e6s+scHIfdBPMDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=k2w7NVm0/nIiADcBWo7qVBA+ljLyXT+6xzbW4CyFYb8=;
        b=qi/8Kt6lQIvMYhiO7J/ldrQfeMzzDJ8/JRxsKKMT52ZfgC3nQQ2dghV8WzEBPO8F0u
         ZdUCUJEEV1BoBrjKNp6Z149jJgrRmhCjzBeSFs23G8zI/y4MDG1OY2eZND2WwlLvxMK1
         49ayM+tmUpbJGSkibamuFk6fjV1P+0EPHMm/iOWzuzfwbUTi5vd1Jj6IPVQMpu3Df/hi
         dKNo6cD+qRW+HOph2fgQIEQeNno+tGvdsUJojJ962dDhKLh5y1Z+rdslLk4L5//h6Q1Y
         AHFXQXnV0tvFE0AqTBV+xCzX0j5YInz2Nm0J3R6mkoT7yazWefz7aA/Q7c/fubaB4Tn+
         kQeQ==
X-Gm-Message-State: AOAM532wR1hFRT2LN25mvhWuNi3edYeTwqSSr+dZei5JkCJf0xR2IrZp
        s+O++xreLR54l+oiSKX1HIJ7wpuWVf27v8iMGAffnA==
X-Google-Smtp-Source: ABdhPJxABLQk97KxxpevPj7+W5bgI37Bsyoxf0KgSHVFPZyJ/f8QytMOaMgSo1GjsdzYPJMG+Wt/SqGucnmWEqpQAYo=
X-Received: by 2002:a05:6808:2025:b0:32b:7da5:a598 with SMTP id
 q37-20020a056808202500b0032b7da5a598mr5013897oiw.63.1653687336469; Fri, 27
 May 2022 14:35:36 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 27 May 2022 17:35:36 -0400
MIME-Version: 1.0
In-Reply-To: <20220526231230.2805147-2-dmitry.torokhov@gmail.com>
References: <20220526231230.2805147-1-dmitry.torokhov@gmail.com> <20220526231230.2805147-2-dmitry.torokhov@gmail.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 27 May 2022 17:35:36 -0400
Message-ID: <CAE-0n51CVEUF4knuSAK7RWACaUF3Fmi3jmMORZb1cVFyARnHTw@mail.gmail.com>
Subject: Re: [PATCH 2/2] Input: cros_ec_keyb - handle x86 detachable/convertible
 Chromebooks
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Furquan Shaikh <furquan@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Quoting Dmitry Torokhov (2022-05-26 16:12:30)
> From: Furquan Shaikh <furquan@chromium.org>
>
> Some detachable/convertible x86 Chromebooks use EC buttons/switches
> interface to signal volume up/down and other buttons. This configuration is
> signalled via presence of GOOG0007 ACPI device. The main keyboard on such
> Chromebooks is still using the standard 8042/atkbd combo.
>
> Signed-off-by: Furquan Shaikh <furquan@chromium.org>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Two questions below.

>  drivers/input/keyboard/cros_ec_keyb.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
> index e8338b1c5776..c14136b733a9 100644
> --- a/drivers/input/keyboard/cros_ec_keyb.c
> +++ b/drivers/input/keyboard/cros_ec_keyb.c
> @@ -677,14 +678,19 @@ static const struct attribute_group cros_ec_keyb_attr_group = {
>
>  static int cros_ec_keyb_probe(struct platform_device *pdev)
>  {
> -       struct cros_ec_device *ec = dev_get_drvdata(pdev->dev.parent);
> +       struct cros_ec_device *ec;
>         struct device *dev = &pdev->dev;
>         struct cros_ec_keyb *ckdev;
>         bool buttons_switches_only = device_get_match_data(dev);
>         int err;
>
> -       if (!dev->of_node)
> -               return -ENODEV;
> +       /*
> +        * If the parent ec device has not been probed yet, defer the probe of
> +        * this keyboard/button driver until later.
> +        */
> +       ec = dev_get_drvdata(pdev->dev.parent);

Does cros_ec populate the child node before setting the drvdata? Or in
ACPI designs this device is created as a child of cros_ec before the
driver probes?

> +       if (!ec)
> +               return -EPROBE_DEFER;
>
>         ckdev = devm_kzalloc(dev, sizeof(*ckdev), GFP_KERNEL);
>         if (!ckdev)
