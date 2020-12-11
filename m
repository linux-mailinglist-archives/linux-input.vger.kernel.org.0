Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1B912D7104
	for <lists+linux-input@lfdr.de>; Fri, 11 Dec 2020 08:38:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404246AbgLKHhz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Dec 2020 02:37:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405422AbgLKHhg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Dec 2020 02:37:36 -0500
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1971CC0613D3;
        Thu, 10 Dec 2020 23:36:56 -0800 (PST)
Received: by mail-pj1-x1044.google.com with SMTP id h7so1438103pjk.1;
        Thu, 10 Dec 2020 23:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=CYF46QCSnldHm2Egw+CU2LcS0ifqtJhpD96wyZa5IQw=;
        b=SwOB0r3KUPn6/Yiu3reLOatzecbwDPBSZOiM//Caqae/myLM3Qt9O/5xAhV9H+Vylk
         cD6FofIBj1e2kozbMa9iTEQCLcbse2b04WcelpBrgPhsLZ5YacCcEsKEP3M10EZeaxWv
         I0jJi5EEeV+GW3CijK50E4bk/Ulyl6EqH58eO9vKPyDJ5CA5WITpcZqCax8CrCV1nYWP
         uAh+guJQRlk/Q+jc3YmERQApnXVf3GpIAwudsFccO2RFTSity0iJC/n/cGml2jik+Qlp
         T+qzrj3xazcuYGC8qHatK9OW4gboF2jgUWu2/0AJ6w9N73SDKfgLfMbNiBGPPrnYYa3O
         3Msg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=CYF46QCSnldHm2Egw+CU2LcS0ifqtJhpD96wyZa5IQw=;
        b=FAjrFAMav/HYns94j3snAMXzR16+WMkzYt0KOVUZY1WpremC35pznFbHO6Uv1ghQkC
         Nvz4A3LRhzuG1zx8nF2CUEIr9HDFPQNlj/mk7Fh2htX0+AnaxdxJFPRQ8AIwN/sQOHVu
         uhtH7smVVUx7x+JFK0cPWvwLzN6gZ4bHww30RvVZvWYGAA/EBOGU+/jFl5vNvsofgzyS
         4JpB/vFUWH+XMDNkMstIApwOQR5YqyABPp+CZvanMH3vgbXTryTeQyhvOLXLmsrnE4m5
         bA71toI4Yqx1bv3X2nfd1LguXWGb2rTzB5lpn5r9zU/dCKM9RvPkIptdQHQvSc1oU8FL
         75fA==
X-Gm-Message-State: AOAM531SDq9Bs8fbzswoLfoBIWO4IEmEAWUkHF1tgaPVYuTRpu8QTVuG
        clPXq8pG31Do2PPH/R2d8Mo=
X-Google-Smtp-Source: ABdhPJyytMoQUk0CvFXL6xPwYzoZ9zcC2yIbPpUhmN6Yw4mViIxTO06FVP+sPIjIbyGsiE8g3wP4fQ==
X-Received: by 2002:a17:90a:b118:: with SMTP id z24mr11642931pjq.14.1607672215616;
        Thu, 10 Dec 2020 23:36:55 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id c184sm8949711pfb.11.2020.12.10.23.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 23:36:54 -0800 (PST)
Date:   Thu, 10 Dec 2020 23:36:52 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Johnny Chuang <johnny.chuang.emc@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v8 4/4] input: elants: support 0x66 reply opcode
 for reporting touches
Message-ID: <X9MhlP8+e6WXukv8@google.com>
References: <cover.1607669375.git.mirq-linux@rere.qmqm.pl>
 <b0120b1dc884591364834da7b8c16e576a1d7226.1607669375.git.mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b0120b1dc884591364834da7b8c16e576a1d7226.1607669375.git.mirq-linux@rere.qmqm.pl>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Dec 11, 2020 at 07:53:57AM +0100, Michał Mirosław wrote:
> From: Dmitry Osipenko <digetx@gmail.com>
> 
> eKTF3624 touchscreen firmware uses two variants of the reply opcodes for
> reporting touch events: one is 0x63 (used by older firmware) and other is
> 0x66 (used by newer firmware). The 0x66 variant is equal to 0x63 of
> eKTH3500, while 0x63 needs small adjustment of the touch pressure value.
> 
> Nexus 7 tablet device has eKTF3624 touchscreen and it uses 0x66 opcode for
> reporting touch events, let's support it now. Other devices, eg. ASUS TF300T,
> use 0x63.
> 
> Note: CMD_HEADER_REK is used for replying to calibration requests, it has
> the same 0x66 opcode number which eKTF3624 uses for reporting touches.
> The calibration replies are handled separately from the the rest of the
> commands in the driver by entering into ELAN_WAIT_RECALIBRATION state
> and thus this change shouldn't change the old behavior.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> Tested-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> ---
>  drivers/input/touchscreen/elants_i2c.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
> index c24d8cdc4251..1cbda6f20d07 100644
> --- a/drivers/input/touchscreen/elants_i2c.c
> +++ b/drivers/input/touchscreen/elants_i2c.c
> @@ -61,6 +61,15 @@
>  #define QUEUE_HEADER_NORMAL	0X63
>  #define QUEUE_HEADER_WAIT	0x64
>  
> +/*
> + * Depending on firmware version, eKTF3624 touchscreens may utilize one of
> + * these opcodes for the touch events: 0x63 and 0x66. The 0x63 is used by
> + * older firmware version and differs from 0x66 such that touch pressure
> + * value needs to be adjusted. The 0x66 opcode of newer firmware is equal
> + * to 0x63 of eKTH3500.
> + */
> +#define QUEUE_HEADER_NORMAL2	0x66
> +
>  /* Command header definition */
>  #define CMD_HEADER_WRITE	0x54
>  #define CMD_HEADER_READ		0x53
> @@ -1052,7 +1061,6 @@ static irqreturn_t elants_i2c_irq(int irq, void *_dev)
>  		switch (ts->buf[FW_HDR_TYPE]) {
>  		case CMD_HEADER_HELLO:
>  		case CMD_HEADER_RESP:
> -		case CMD_HEADER_REK:
>  			break;
>  
>  		case QUEUE_HEADER_WAIT:
> @@ -1072,6 +1080,7 @@ static irqreturn_t elants_i2c_irq(int irq, void *_dev)
>  			break;
>  
>  		case QUEUE_HEADER_NORMAL:
> +		case QUEUE_HEADER_NORMAL2:

I think here I would also prefer that we only accepted this for the
devices where we expect to see such packets:

		case CMD_HEADER_REK:
			/* comment from above why this is done ... */
			if (ts->chip_id != EKTF3624)
				break;
			fallthrough;
		case QUEUE_HEADER_NORMAL2:

...

Given this comments I wonder if it would not make sense to combine the 3
patches into one adding support for EKTF3624...


>  			report_count = ts->buf[FW_HDR_COUNT];
>  			if (report_count == 0 || report_count > 3) {
>  				dev_err(&client->dev,
> -- 
> 2.20.1
> 

Thanks.

-- 
Dmitry
