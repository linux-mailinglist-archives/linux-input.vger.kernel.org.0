Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14BB7254170
	for <lists+linux-input@lfdr.de>; Thu, 27 Aug 2020 11:05:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726882AbgH0JFE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Aug 2020 05:05:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726266AbgH0JFE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Aug 2020 05:05:04 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAA41C061264;
        Thu, 27 Aug 2020 02:05:03 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id g6so2269902pjl.0;
        Thu, 27 Aug 2020 02:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iIfA+GxX85Gj1bAthAYHRSrfcGnp/xsOEmEp4XdH5vQ=;
        b=KBzSALV+r2YBd2X6uAAyss5KHRarOMMBJP6PQJ88ZfaEXcd9Gt5amK2GVADUp6QizT
         4OVUoGNTNLlnUb5qWT/cJZAhkiLQA9b5tobHoV/YDGm7z/r7ZNBst5vDyP4l1b+ijN9C
         GoQJ0Dvu5XK4lakc8cqjppWnCuKp5eQsoIyrYKBp4ifVPDCLn4hv+6wWEEpubjGFrZFF
         4uzJoikFD9V0oP4bKIaEAdgimo7/5PXGAy34tqBj4NVChbt/NC8aR2fKtjRAwWEhO3z/
         +bFfp/VlnkVZc/Lv4Cbr5gPVV06zjHAqQeZOp4nzZQDZ2iuNGHpohzjQjtjWUsBR/zXo
         qZpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iIfA+GxX85Gj1bAthAYHRSrfcGnp/xsOEmEp4XdH5vQ=;
        b=WHbq9ofOOpX/a+moRfIfRGrmupfZh4qpQL0ECPnEuwqDwqhEHOEj/DUKtIkGb2yEpz
         KvI0WbaDnXBMM65Fri35p65JFMToZ3VlbuRormwM7q7Iy1saZ4gztfsJhkonMcxD5keS
         ftmGeyb85XJlelG34HZvYzb7kWdRs/gKMDjtIv7rK0SA7U1bI8fKoFqlfFWyNpFzEU+H
         pno6JdNUC25513J/ptBC/b/cCYqKsyULFG+6sPGggLLhMxDNw8s43b4HU4D9XjOQX7Fk
         I1XPba9OFwr+1e4LLLlXxm8gX0hlQDsm6fwmO+wolLTD5cdsii+OnVCYAt4xWjgutYnf
         2t5g==
X-Gm-Message-State: AOAM531nusTcneoA4qlBzBfE5FpHnT7FhEnWbz5qPUQ3tHv6hgAb2dXA
        jD9s8UlYGpVFfZ1tVdUgGd16hGUr4th6pF2atYE=
X-Google-Smtp-Source: ABdhPJzK4F9OP6UMhidZCUw2HZmdMf40lwQnnwq7CEnjTbjuSqpz4kbhu2/VzgAPsosWljnBiOaml/sj/xc9dWPOosA=
X-Received: by 2002:a17:90a:e7cb:: with SMTP id kb11mr9427386pjb.181.1598519103400;
 Thu, 27 Aug 2020 02:05:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200826200436.30669-1-krzk@kernel.org>
In-Reply-To: <20200826200436.30669-1-krzk@kernel.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 27 Aug 2020 12:04:47 +0300
Message-ID: <CAHp75VdRXnuiZiZt+pjiZybwT9jYbym0Uw69R5w2r=TdH=ixgA@mail.gmail.com>
Subject: Re: [PATCH v2] Input: bcm-keypad - Simplify with dev_err_probe()
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-input <linux-input@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Aug 26, 2020 at 11:04 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe() and devm_clk_get_optional().  Less code and the error
> value gets printed.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>
> ---
>
> Changes since v1:
> 1. Use also devm_clk_get_optional()
> ---
>  drivers/input/keyboard/bcm-keypad.c | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/input/keyboard/bcm-keypad.c b/drivers/input/keyboard/bcm-keypad.c
> index 2b771c3a5578..23e11b4efd13 100644
> --- a/drivers/input/keyboard/bcm-keypad.c
> +++ b/drivers/input/keyboard/bcm-keypad.c
> @@ -376,17 +376,11 @@ static int bcm_kp_probe(struct platform_device *pdev)
>                 return PTR_ERR(kp->base);
>
>         /* Enable clock */
> -       kp->clk = devm_clk_get(&pdev->dev, "peri_clk");
> +       kp->clk = devm_clk_get_optional(&pdev->dev, "peri_clk");
>         if (IS_ERR(kp->clk)) {
> -               error = PTR_ERR(kp->clk);
> -               if (error != -ENOENT) {
> -                       if (error != -EPROBE_DEFER)
> -                               dev_err(&pdev->dev, "Failed to get clock\n");
> -                       return error;
> -               }
> -               dev_dbg(&pdev->dev,
> -                       "No clock specified. Assuming it's enabled\n");
> -               kp->clk = NULL;
> +               return dev_err_probe(&pdev->dev, error, "Failed to get clock\n");
> +       } else if (!kp->clk) {
> +               dev_dbg(&pdev->dev, "No clock specified. Assuming it's enabled\n");
>         } else {
>                 unsigned int desired_rate;
>                 long actual_rate;
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
