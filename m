Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0B3540151D
	for <lists+linux-input@lfdr.de>; Mon,  6 Sep 2021 04:57:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239100AbhIFC5g (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 5 Sep 2021 22:57:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239097AbhIFC5f (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 5 Sep 2021 22:57:35 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7064C061575;
        Sun,  5 Sep 2021 19:56:31 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id q3so3057243plx.4;
        Sun, 05 Sep 2021 19:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JH6TtgtQhGIwE9M2MLPh7OfMEzqjYHtchmJv+WM7wsc=;
        b=qP5WFrkVyFdeiAH6cAv6ziDuOUlLsFg5QoKrnjdPJgXrOF0Nn7jZsuuSwA7ZjkoJG9
         RCcpEgkCV6VFAyMW2NRO1/BdDaFzEJOde3LIu0tjjEd3VQN2hxfwt6bgXQjLPSKschLz
         imrk0OP65/TquJNmjIGQbuq4hEq9LAW/YcB7qUEhEFnjw6fz8/B61ohsakHzZcJTQNHS
         r6W6bbNT6T6klkfoi3SsKL7dKM1RRoscmwAs0hioHYvYjJ/QGLW8N9L5IZ/GOfiP25Cf
         DkNOVDtg42EjwWfX7R/p8XflGm0Kw81eD6VppxBJqIVyEQfXkIym6jX5q9swSTmYCQeq
         7BFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JH6TtgtQhGIwE9M2MLPh7OfMEzqjYHtchmJv+WM7wsc=;
        b=ApOc/qX5kYLY8lRCn+0w/RDJxvXlFrQh8dyoI1d1AbityIQQi+Nl3eq4y3AEtSi4yj
         xhzDJLBb6tpH8+m0LZAw+AjKJjOItXb8X0i5bnkSNUAdnSjGf28B/O4sT6KshXNdcwUo
         VghcN+7EUVnVHatnNtHZGvDmjuOX0M5v7my7txhQj2iwlDFJQR3p2dec6OwiBqSx6LIU
         mhFftBS6/Zqf7cUM7VwAxXlzrAc4WAluk57vfVkcODV9ReKkfBZ32LwN6lMQHUYp2Wyb
         pe8+WkA0tlQ8X/46EQG8qsLLrVqfuwpPbbCz0+2NKxfQQeCthol6MMWjjeasXpnxPaY/
         LqyA==
X-Gm-Message-State: AOAM5331vSRwUnFWfVo0SmrRzOAUUhpzNUQ91p1taqLu6mLERxw/zjeX
        KLf3aSAzQuPa3vcp3TWpVD8=
X-Google-Smtp-Source: ABdhPJxibDR2zS0bzw6FDJlKGnXb4Tjcm1CctWMZ0hgHGEC1u17TUfu0ebgSshEl5tk3wm3bvS6b/g==
X-Received: by 2002:a17:90b:3603:: with SMTP id ml3mr11550953pjb.96.1630896991089;
        Sun, 05 Sep 2021 19:56:31 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:4bc3:62de:220d:cd94])
        by smtp.gmail.com with ESMTPSA id u2sm5582650pjv.10.2021.09.05.19.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Sep 2021 19:56:29 -0700 (PDT)
Date:   Sun, 5 Sep 2021 19:56:27 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     "simba.hsu" <simba.hsu@raydium.corp-partner.google.com>
Cc:     simba.hsu@rad-ic.com, furquan@google.com, seanpaul@chromium.org,
        rrangle@chromium.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, KP.li@rad-ic.com,
        jeffrey.lin@rad-ic.com
Subject: Re: [PATCH] Input: raydium_i2c_ts - read device version in
 bootloader mode
Message-ID: <YTWDW0bt32GRp3PU@google.com>
References: <20210818063644.8654-1-simba.hsu@rad-ic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210818063644.8654-1-simba.hsu@rad-ic.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Aug 18, 2021 at 02:36:44PM +0800, simba.hsu wrote:
> Add support reading device ID when controller is in bootloader
> mode, which may happen if firmware update has been interrupted.
> 
> Signed-off-by: simba.hsu <simba.hsu@rad-ic.com>
> ---
>  drivers/input/touchscreen/raydium_i2c_ts.c | 52 ++++++++++++++++++----
>  1 file changed, 44 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/raydium_i2c_ts.c b/drivers/input/touchscreen/raydium_i2c_ts.c
> index 4d2d22a86977..d3f8cc3285a2 100644
> --- a/drivers/input/touchscreen/raydium_i2c_ts.c
> +++ b/drivers/input/touchscreen/raydium_i2c_ts.c
> @@ -36,7 +36,8 @@
>  #define RM_CMD_BOOT_CHK		0x33		/* send data check */
>  #define RM_CMD_BOOT_READ	0x44		/* send wait bl data ready*/
>  
> -#define RM_BOOT_RDY		0xFF		/* bl data ready */
> +#define RM_BOOT_RDY		0xFF			/* bl data ready */
> +#define RM_BOOT_CMD_READHWID	0x0E	/* read hwid */
>  
>  /* I2C main commands */
>  #define RM_CMD_QUERY_BANK	0x2B
> @@ -155,6 +156,7 @@ static int raydium_i2c_xfer(struct i2c_client *client, u32 addr,
>  	 * sent first. Else, skip the header i.e. xfer[0].
>  	 */
>  	int xfer_start_idx = (addr > 0xff) ? 0 : 1;
> +
>  	xfer_count -= xfer_start_idx;

I dropped this unrelated chunk, made couple of cosmetic changes and
applied, thank you.

-- 
Dmitry
