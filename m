Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73D3E63B56F
	for <lists+linux-input@lfdr.de>; Tue, 29 Nov 2022 00:00:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234694AbiK1XAQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Nov 2022 18:00:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234621AbiK1W7q (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Nov 2022 17:59:46 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98EF52B195
        for <linux-input@vger.kernel.org>; Mon, 28 Nov 2022 14:59:45 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id fy37so29580466ejc.11
        for <linux-input@vger.kernel.org>; Mon, 28 Nov 2022 14:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=17CpSrVEamfTq5xuUUDzrPWfetU5MF5FVrRiXoK5q/c=;
        b=OWJS6qfb0KmCBvcz8v4OR3nqEOJXxappOQVdhQRiTRXQN7EOvs7F3Liz6nYuCykLZV
         jI7r/ZnMMc84dX98wYFziBUr6UwArAQMlTp4ZlRrvXUyH5GiUORezVUWYH4fDHn3TtBR
         Z3VhGmHKbGiHoIc4qNsl821drVxde4iBElo2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=17CpSrVEamfTq5xuUUDzrPWfetU5MF5FVrRiXoK5q/c=;
        b=PHS1UjODEGfJm5qvB4aSWqVxSBZYJRoU5EIQumTjBYBkr1yy3hWpDPhD870wDvmFr4
         A01hbYwyzsncmYhiQBlmqVPZVtLmDc6gFaXCH+99fY+KuLElU9HyWgZtyeJkiBGI6ixl
         BN3Qum7yASwVV77j7aySfh84nVEnIM+6P5QF1RiFl7qxmq1fl7fK/rDfY3bSuSvyHRkU
         i2l03+aZwqDnbuR5jzwF46WmgyENWGZJqNTFGWAWZFLIpkQ39tdA0rsyDOoCmAFCV3x2
         r+BXVbqkMOBaxyatoiir0RiQv5cX9quQk3DU6JjklPA3XNZOUkvbS+0+RhAXzjX1baNK
         f2YA==
X-Gm-Message-State: ANoB5pmNCAqBygTsp0HukarPeUgoKmaTV19EuRhahOVISEBHjcRveWCW
        k0plzASeMlsUAQnjL51xtkUJJWWJFCdHwy9x
X-Google-Smtp-Source: AA0mqf7p87PpbteUXKiVxGRefHrjSkUwHxBlx2RfiwQRSTPEA05C3hkdtrmi4qMRaIWsVdkppuHyEg==
X-Received: by 2002:a17:907:3117:b0:7ae:6746:f26b with SMTP id wl23-20020a170907311700b007ae6746f26bmr45385458ejb.171.1669676383371;
        Mon, 28 Nov 2022 14:59:43 -0800 (PST)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id bq21-20020a170906d0d500b00781be3e7badsm5422795ejb.53.2022.11.28.14.59.42
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 14:59:42 -0800 (PST)
Received: by mail-wm1-f51.google.com with SMTP id p13-20020a05600c468d00b003cf8859ed1bso9524238wmo.1
        for <linux-input@vger.kernel.org>; Mon, 28 Nov 2022 14:59:42 -0800 (PST)
X-Received: by 2002:a05:600c:5118:b0:3cf:8e70:f34f with SMTP id
 o24-20020a05600c511800b003cf8e70f34fmr26775070wms.93.1669676382413; Mon, 28
 Nov 2022 14:59:42 -0800 (PST)
MIME-Version: 1.0
References: <Y33BD9xkRC9euIdO@kili>
In-Reply-To: <Y33BD9xkRC9euIdO@kili>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 28 Nov 2022 14:59:30 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W7692aCq1kamDJeyG6TLnVoZrfhM2=TgmjLgoaEO1GTw@mail.gmail.com>
Message-ID: <CAD=FV=W7692aCq1kamDJeyG6TLnVoZrfhM2=TgmjLgoaEO1GTw@mail.gmail.com>
Subject: Re: [PATCH] Input: elants_i2c - delete some dead code
To:     Dan Carpenter <error27@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Johnny Chuang <johnny.chuang.emc@gmail.com>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Tue, Nov 22, 2022 at 10:43 PM Dan Carpenter <error27@gmail.com> wrote:
>
> We shuffled the error handling around so this condition is dead code
> now.  The "error" variable is always zero.
>
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
> No Fixes tag because this does not fix a bug but if we were to assign
> a tag it would be:
>
> Fixes: a85fbd649844 ("Input: elants_i2c - properly handle the reset GPIO when power is off")
>
>  drivers/input/touchscreen/elants_i2c.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
> index e1308e179dd6..af1dc43e988c 100644
> --- a/drivers/input/touchscreen/elants_i2c.c
> +++ b/drivers/input/touchscreen/elants_i2c.c
> @@ -1353,8 +1353,6 @@ static int elants_i2c_power_on(struct elants_data *ts)
>         udelay(ELAN_POWERON_DELAY_USEC);
>
>         gpiod_set_value_cansleep(ts->reset_gpio, 0);
> -       if (error)
> -               return error;

Reviewed-by: Douglas Anderson <dianders@chromium.org>
