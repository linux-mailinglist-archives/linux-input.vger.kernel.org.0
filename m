Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F1B9472021
	for <lists+linux-input@lfdr.de>; Mon, 13 Dec 2021 05:56:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231757AbhLME4d (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 12 Dec 2021 23:56:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229990AbhLME4c (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 12 Dec 2021 23:56:32 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A546C06173F
        for <linux-input@vger.kernel.org>; Sun, 12 Dec 2021 20:56:31 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id l10so2541272pgm.7
        for <linux-input@vger.kernel.org>; Sun, 12 Dec 2021 20:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LlOEZ+huj6VqYduHjpAo5nvRFAbnJuliocEvAQBkmH8=;
        b=NAnhfUq5GqapUj+zaTBINyyJmLhFcwV1a/WMkfSKYmMQwme13Q49FDjUJU+8Rp5bOx
         6QraiX8OespRZY6447KDH+1XAeZPMTatqaySmjyBiMAoUnvnmu0ffynDzYDHooA8xdoe
         VY/Ewon/jKe5fe0RAO6kroaFlGN+JAvFclZtQCQ4/26KzgByHbE8chqch4FP8jEk+zfN
         oCzs5HLt9qzirNPoVxuKVtXP42p6X9Llqy/gLIVzaL3m1+Tiba+DqZSg5k9NB0J1Qlt9
         WE8jU5Aal6zTUyTg8YQoglVx/pEcKmRsGX9jrc2LzET53li5VMbTlCI3AgwoXKEKlhRh
         Nglw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LlOEZ+huj6VqYduHjpAo5nvRFAbnJuliocEvAQBkmH8=;
        b=MhXD5nMuZk+rjrZGjqM70kYX++G0assiRHWeJxaDc/Y4Hu39aGWcZKHDP3xDNvXFrS
         r1oU0fgNl3liJExjZ5QgZNVXTb9L19XcKYAqGv9x801MuyfK2K74pGY6FCTaS8hCK6sb
         7eqK3UD7KVGxN33aShiGIjwhICGhieJWftnCUu2TCPvdWcO/Y9vqeSBno689wf8N1yvp
         ABxvHPoW73i3x2AQnU3s2UIfwfL+ljcDTZBCQRdTalAPZBMp5jBcAAYveC23DjqcDFtZ
         reVvuL3FQWsRmXVHcJo3+9+WPzgFsKoU4AAF2pPuDm975eqy0hCPVePwNdWFQUkYRUu9
         T1uQ==
X-Gm-Message-State: AOAM531LcI580hjRIp0Pf97jZU6dCZ5T8CRMH+Afs0Ru9NB1tjzvROZ1
        yE28xroTcl3nZgOBYXrB3K5ipQ5wtzg=
X-Google-Smtp-Source: ABdhPJz+Bve2mwcpw+nAoQk58Xy5/JFYzvenzulvDrOtu6+hwwiYOEgUoxHMaFpl00/MkAkD4KYOAg==
X-Received: by 2002:aa7:948b:0:b0:4b1:7b0:56ba with SMTP id z11-20020aa7948b000000b004b107b056bamr19355495pfk.54.1639371390926;
        Sun, 12 Dec 2021 20:56:30 -0800 (PST)
Received: from google.com ([2620:15c:202:201:e537:8856:7d40:7c6])
        by smtp.gmail.com with ESMTPSA id z2sm10573786pff.107.2021.12.12.20.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Dec 2021 20:56:29 -0800 (PST)
Date:   Sun, 12 Dec 2021 20:56:27 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
Subject: Re: [PATCH 5/5] Input: goodix - Fix race on driver unbind
Message-ID: <YbbSe/G6wv7FMwjB@google.com>
References: <20211212124242.81019-1-hdegoede@redhat.com>
 <20211212124242.81019-6-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211212124242.81019-6-hdegoede@redhat.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Hans,

On Sun, Dec 12, 2021 at 01:42:42PM +0100, Hans de Goede wrote:
> Because there is no way to detect if the touchscreen has pen support,
> the driver is allocating and registering the input_pen input_dev on
> receiving the first pen event.
> 
> But this means that the input_dev gets allocated after the request_irq()
> call which means that the devm framework will free it before disabling
> the irq, leaving a window where the irq handler may run and reference the
> free-ed input_dev.
> 
> To fix this move the allocation of the input_pen input_dev to before
> the request_irq() call, while still only registering it on the first pen
> event so that the driver does not advertise pen capability on touchscreens
> without it (most goodix touchscreens do not have pen support).
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/input/touchscreen/goodix.c | 32 ++++++++++++++++++------------
>  drivers/input/touchscreen/goodix.h |  1 +
>  2 files changed, 20 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
> index 04baf5a770f5..1ada40fa6de6 100644
> --- a/drivers/input/touchscreen/goodix.c
> +++ b/drivers/input/touchscreen/goodix.c
> @@ -297,14 +297,14 @@ static int goodix_ts_read_input_report(struct goodix_ts_data *ts, u8 *data)
>  	return -ENOMSG;
>  }
>  
> -static struct input_dev *goodix_create_pen_input(struct goodix_ts_data *ts)
> +static int goodix_create_pen_input(struct goodix_ts_data *ts)
>  {
>  	struct device *dev = &ts->client->dev;
>  	struct input_dev *input;
>  
>  	input = devm_input_allocate_device(dev);
>  	if (!input)
> -		return NULL;
> +		return -ENOMEM;
>  
>  	input_copy_abs(input, ABS_X, ts->input_dev, ABS_MT_POSITION_X);
>  	input_copy_abs(input, ABS_Y, ts->input_dev, ABS_MT_POSITION_Y);
> @@ -331,23 +331,18 @@ static struct input_dev *goodix_create_pen_input(struct goodix_ts_data *ts)
>  		input->id.product = 0x1001;
>  	input->id.version = ts->version;
>  
> -	if (input_register_device(input) != 0) {
> -		input_free_device(input);
> -		return NULL;
> -	}
> -
> -	return input;
> +	ts->input_pen = input;
> +	return 0;
>  }
>  
>  static void goodix_ts_report_pen_down(struct goodix_ts_data *ts, u8 *data)
>  {
> -	int input_x, input_y, input_w;
> +	int input_x, input_y, input_w, error;
>  	u8 key_value;
>  
> -	if (!ts->input_pen) {
> -		ts->input_pen = goodix_create_pen_input(ts);
> -		if (!ts->input_pen)
> -			return;
> +	if (!ts->pen_input_registered) {
> +		error = input_register_device(ts->input_pen);
> +		ts->pen_input_registered = error == 0;

I do not think you want to try and re-register input device if first
registration failed. You probably also don't want to waste time and
return early from here in case of failures.

Thanks.

-- 
Dmitry
