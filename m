Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 210FC4160D8
	for <lists+linux-input@lfdr.de>; Thu, 23 Sep 2021 16:16:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241467AbhIWOSM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Sep 2021 10:18:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241304AbhIWOSL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Sep 2021 10:18:11 -0400
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DCFDC061574;
        Thu, 23 Sep 2021 07:16:40 -0700 (PDT)
Received: by mail-qv1-xf2e.google.com with SMTP id z12so4213869qvx.5;
        Thu, 23 Sep 2021 07:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o/8kzs9XW2ToHrPrP9iSX9iuHMAFY16yi4FK2DUXBdM=;
        b=WuiWxD+AoOLYj4nhtmqdbSbDgYdpga2nD02lidCpbMZhbkPLAvd86SQwipKUPyqmM/
         GE+zCE/vf4bNtkw64RFVBPP+IJ+raj+EM61J7dxw8cbYXrEj6PGa4TdnCLcuB+1S+yrP
         6J1mPLG45OKbUvZUff67ejbwLK5NqwIbRnSTuk1csc1VI+tFq7gQ1ZEXSofF1HNxypxI
         gdZEfcDeKmmwQR4cHHaA03A6XGeiZ8+h3clIDrdOXIRS0uDrVH2PhP3JPimwwcanZ85c
         pZHvIzbKtQ8om5sxUiyvQP3VKFRRA1cNIDj/KrOC/KQ0z3mRu+U7Vsd4cK1ILqkSrUN8
         DRxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o/8kzs9XW2ToHrPrP9iSX9iuHMAFY16yi4FK2DUXBdM=;
        b=BYHpSVHHVEvvyIxXMcBTwktR+CZb4Q3qNimZgqF+LfOjf86YC3Y/6x+Ood2nb4eMAK
         Li9PvxNhHwywbSuwIfK/aYhrf6ri/VF7E8H58/Krk42AYigtAYBQtmAS699dfK0t7/fh
         6Gn+YoRH5Y+UE/jSm4MZNeZWBx64UmPiOCe+FY1KyvYXFDJm1aiP78DJWDez+4A3bTuY
         fkBxkpuMsGTw3cMZ561v9b+im/9xM4Ngulofge1FClKlGNWb4sY/bovfUrEFIatgJvw5
         igKLFg8+fS9M7S2p14+aCVdBoyJN/KkDgr+uhKKNp8CFslzxuS5aAmL57G9kqGSBS/48
         MdQg==
X-Gm-Message-State: AOAM532NKLU1Y7CoMf7L8/8UE/oPLF+Yp6GBwuFQPeNLT1n9wLnUA+ss
        aOdehcwLJqubKlYE29rfTK0Sqasxd8uolG13xjc=
X-Google-Smtp-Source: ABdhPJy/EdD2Zv1jzU4GZOVRv3NIxA4Aukr2ooCbgzlk4/GtIctl1tCQTmyPiD/jd0WTVa39sFqUaXCygYzf7ZtGERk=
X-Received: by 2002:ad4:4705:: with SMTP id k5mr4740101qvz.55.1632406599114;
 Thu, 23 Sep 2021 07:16:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210916153418.15105-1-caihuoqing@baidu.com>
In-Reply-To: <20210916153418.15105-1-caihuoqing@baidu.com>
From:   Baolin Wang <baolin.wang7@gmail.com>
Date:   Thu, 23 Sep 2021 22:17:04 +0800
Message-ID: <CADBw62qkp-LrHf1MUgPmZ=X24G-gAvsjY1yLFNncT-toUjUyJA@mail.gmail.com>
Subject: Re: [PATCH] Input: sc27xx-vibra - Make use of the helper function dev_err_probe()
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Thu, Sep 16, 2021 at 11:34 PM Cai Huoqing <caihuoqing@baidu.com> wrote:
>
> When possible use dev_err_probe help to properly deal with the
> PROBE_DEFER error, the benefit is that DEFER issue will be logged
> in the devices_deferred debugfs file.
> Using dev_err_probe() can reduce code size, and the error value
> gets printed.
>
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  drivers/input/misc/sc27xx-vibra.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/input/misc/sc27xx-vibra.c b/drivers/input/misc/sc27xx-vibra.c
> index 1478017f0968..7cf0a1354320 100644
> --- a/drivers/input/misc/sc27xx-vibra.c
> +++ b/drivers/input/misc/sc27xx-vibra.c
> @@ -135,10 +135,9 @@ static int sc27xx_vibra_probe(struct platform_device *pdev)
>         }
>
>         error = device_property_read_u32(&pdev->dev, "reg", &info->base);
> -       if (error) {
> -               dev_err(&pdev->dev, "failed to get vibrator base address.\n");
> -               return error;
> -       }
> +       if (error)
> +               return dev_err_probe(&pdev->dev, error,
> +                                    "failed to get vibrator base address.\n");

The device_property_read_u32() never returns an EPROBE_DEFER error, so
how can this function help? IMO, I did not see any benefits in this
case.

-- 
Baolin Wang
