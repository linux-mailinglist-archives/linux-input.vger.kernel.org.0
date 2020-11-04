Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65A592A6935
	for <lists+linux-input@lfdr.de>; Wed,  4 Nov 2020 17:16:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730001AbgKDQQA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Nov 2020 11:16:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729996AbgKDQQA (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 4 Nov 2020 11:16:00 -0500
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1515DC0613D3;
        Wed,  4 Nov 2020 08:16:00 -0800 (PST)
Received: by mail-io1-xd41.google.com with SMTP id k21so22720758ioa.9;
        Wed, 04 Nov 2020 08:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1LDgaP5RgBx3Cz/2iszLQ0gO0EmWR7Xqq3YkLqHHCSY=;
        b=vQiomp7TcmEMXx5tbW25jo+Wta7ya2r4bONFst0sdW+U/pjqzhwdbXzt8XUCZ8Qizd
         /SdQV2zt97jc8U5iU+anjDMgrmtQBFMLZIr2SQIrnOLCDPVdbj3fI3YSxIoKR+OShiqs
         CBeHEWSkrSyJG05vcotEUM4jK2YL2nkIYUAV/4NsMMoYsOxcncAKYHwxbO3NyvGdCD77
         x3q2oJf1721Tnd5klUoQsvSP0IcWj2TT03spf9WQHnCy5Hjv9S3lBH+V4KQxGKpTS6SV
         yJE/TAlNWQr33740BMyn51dHJDvNg89bCalkz9+qIOgCE92ULEOGZpySZmLtD7F0zwAN
         rILw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1LDgaP5RgBx3Cz/2iszLQ0gO0EmWR7Xqq3YkLqHHCSY=;
        b=PgChFVa20MB6fF66VPSgJgD2DNmsel8D5LJv8x4I3O3SdRM9h/8mc9SBfLpYH/Huoh
         CVvFZ2ujpHE4L2I58MzJGObmmnkEktUj97EQIEYQlwbYmVofGbdi2cnuVm4nLHNHUv/c
         zJPhwdCxe2bydIHprSfoscd7xCURlqfVdZz//+8BNcZ7aTJkoFS52xJ672apNtGHGWrK
         yo+LBF6eQ7YGRGhhrFC4Nkr660zVA4f14ViMe709SQu4IvIFTC8I0BDqFdJfMtIlv9ff
         zRmD/wgh7vuIf+xCVnbpN3D6z2FLDoO5TBGtEPChaOxaK5dJ/Cs8TCZ9NrcNLUt8MgGL
         rFAg==
X-Gm-Message-State: AOAM532lb/4xatLTbpCDZEiD+iG9wdpE7/rLgOwGhs9JzS0g5cMtpm4+
        BCOsDENic8Vij6vSkCtMD5oITfgbkczn6VNmJRhd1Ccs
X-Google-Smtp-Source: ABdhPJxd4O0R5Fx5p+rvSVPmjAWZm5oxcBbMr3dWkdNlKF5fYDoCf/aiBpMJpeZHRt4SOO5ZUvUDUjL6i/nMjXojyRg=
X-Received: by 2002:a5e:860d:: with SMTP id z13mr10867494ioj.92.1604506558848;
 Wed, 04 Nov 2020 08:15:58 -0800 (PST)
MIME-Version: 1.0
References: <20200918143352.93135-1-aford173@gmail.com>
In-Reply-To: <20200918143352.93135-1-aford173@gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Wed, 4 Nov 2020 10:15:47 -0600
Message-ID: <CAHCN7xLMGhuGq8WFn8B2W_dwAgDgjo1YczDnf0uJJw3kvJWhjw@mail.gmail.com>
Subject: Re: [PATCH] Input: ili210x: Enable suspend/resume functions
To:     linux-input@vger.kernel.org
Cc:     Adam Ford-BE <aford@beaconembedded.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Sep 18, 2020 at 9:34 AM Adam Ford <aford173@gmail.com> wrote:
>
> Some people may wish to wake their system from sleep, so this
> patch enables a suspend and resume function which enables
> and disables IRQ wake functions.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>

Gentle ping.  Any feedback on this?

>
> diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
> index 199cf3daec10..9b1a61447054 100644
> --- a/drivers/input/touchscreen/ili210x.c
> +++ b/drivers/input/touchscreen/ili210x.c
> @@ -474,6 +474,28 @@ static int ili210x_i2c_probe(struct i2c_client *client,
>         return 0;
>  }
>
> +static int __maybe_unused ili210x_i2c_suspend(struct device *dev)
> +{
> +       struct i2c_client *client = to_i2c_client(dev);
> +
> +       if (device_may_wakeup(&client->dev))
> +               enable_irq_wake(client->irq);
> +
> +       return 0;
> +}
> +
> +static int __maybe_unused ili210x_i2c_resume(struct device *dev)
> +{
> +       struct i2c_client *client = to_i2c_client(dev);
> +
> +       if (device_may_wakeup(&client->dev))
> +               disable_irq_wake(client->irq);
> +
> +       return 0;
> +}
> +
> +static SIMPLE_DEV_PM_OPS(ili210x_i2c_pm, ili210x_i2c_suspend, ili210x_i2c_resume);
> +
>  static const struct i2c_device_id ili210x_i2c_id[] = {
>         { "ili210x", (long)&ili210x_chip },
>         { "ili2117", (long)&ili211x_chip },
> @@ -495,6 +517,7 @@ MODULE_DEVICE_TABLE(of, ili210x_dt_ids);
>  static struct i2c_driver ili210x_ts_driver = {
>         .driver = {
>                 .name = "ili210x_i2c",
> +               .pm = &ili210x_i2c_pm,
>                 .of_match_table = ili210x_dt_ids,
>         },
>         .id_table = ili210x_i2c_id,
> --
> 2.25.1
>
