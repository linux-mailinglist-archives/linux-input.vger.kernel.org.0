Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9882129A36E
	for <lists+linux-input@lfdr.de>; Tue, 27 Oct 2020 04:48:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437644AbgJ0Dsz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 26 Oct 2020 23:48:55 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:36674 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406292AbgJ0Dsz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 26 Oct 2020 23:48:55 -0400
Received: by mail-pg1-f194.google.com with SMTP id z24so1209pgk.3;
        Mon, 26 Oct 2020 20:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pIU+eJrKipvoL+xJlvndpIp8jUWD+TSQyGYQmcJjhw4=;
        b=aprXITN1sTOLCaHYTqf/JETAhA58UEL8qvD5zDv7FFIC6wCfh8WQNvh0TZm0d/HBE7
         mHxgcuRVWu4+8JXfdRdA1HVFh2Pd2dYScOZQwqPCyhfn+CjVzEA51X+rX/6qnS+R6mSz
         dmux6wUIaYTzhkyR6D3c+qRENe8kd9szbqFq8lDxLZWLcKpig3gxxsW0byQxeB1AKoA/
         MVo5vodz0Sz/0a3YT5xnYcvppeUFQU6CwkhQ/GXU6bs9MKuI/H46BeDk4WUz+BgV0omW
         Ra/4lZsvgLj8tj1S36kAVHK4cSwQe7zFIHAPpJ1emqttzZNeojxFa35dYJJ1GiWKh5O0
         114w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pIU+eJrKipvoL+xJlvndpIp8jUWD+TSQyGYQmcJjhw4=;
        b=iydY5O8kvZGHmKd0V5LFhUBeLOV3nqgxM1FD/Jrln8G2BLT6i0SYaGx7ReIGETtjlo
         dbCwRXw+HHqILzzqQjzOM3RuzNYBK43V3/kJkjKB022UGlbEWIGBSBGm5c1eY388tgwB
         JJ67MIniVpbCISvMg0SHh8Gy69uJJsmCk1lZCtsMm2pvxeUiZnMdcUoizfGpVFLKCFyu
         mGxtWtzjgDju1HWcy4AkCrG+p5Ix1Jk+hqmMF28f+7ZFEiM3HGYaTRPyTKCI6XuHk1l4
         OanVMiDd3pX4YqREdGkFlopjLgLCRhY4/g+VTFihadx1DiAQqxnSXsRu3dPJo25lFhdu
         bcQw==
X-Gm-Message-State: AOAM530llYzLBS2oGn5UTdMP9knPE10XVpRxX0IEHd+f/z1I6oYcbLoK
        4WNWymFnoZEtpHimJuu2J3w=
X-Google-Smtp-Source: ABdhPJxCHzOMI7tZGakI6vZ2AyCAuJbwavSXmfnqi0fIf022nRW9pcRIhJYmKEQ2vNVI0PsOt/fXAg==
X-Received: by 2002:a63:7c8:: with SMTP id 191mr185690pgh.410.1603770534330;
        Mon, 26 Oct 2020 20:48:54 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id lk13sm201234pjb.43.2020.10.26.20.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 20:48:53 -0700 (PDT)
Date:   Mon, 26 Oct 2020 20:48:51 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     Alexandru Ardelean <alexandru.ardelean@analog.com>,
        David Jander <david@protonic.nl>, kernel@pengutronix.de,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v1] Input: touchscreen: ads7846.c: Fix race that causes
 missing releases
Message-ID: <20201027034851.GH444962@dtor-ws>
References: <20201026132117.20887-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201026132117.20887-1-o.rempel@pengutronix.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Oleksij,

On Mon, Oct 26, 2020 at 02:21:17PM +0100, Oleksij Rempel wrote:
> From: David Jander <david@protonic.nl>
> 
> If touchscreen is released while busy reading HWMON device, the release
> can be missed. The IRQ thread is not started because no touch is active
> and BTN_TOUCH release event is never sent.
> 
> Fixes: f5a28a7d4858f94a ("Input: ads7846 - avoid pen up/down when reading hwmon")
> Co-Developed-by: David Jander <david@protonic.nl>
> Signed-off-by: David Jander <david@protonic.nl>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  drivers/input/touchscreen/ads7846.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/ads7846.c b/drivers/input/touchscreen/ads7846.c
> index ea31956f3a90..0236a119c52d 100644
> --- a/drivers/input/touchscreen/ads7846.c
> +++ b/drivers/input/touchscreen/ads7846.c
> @@ -211,10 +211,26 @@ static void ads7846_stop(struct ads7846 *ts)
>  	}
>  }
>  
> +static int get_pendown_state(struct ads7846 *ts);

Not a fan forward declarations, just move the definition if needed.

> +
>  /* Must be called with ts->lock held */
>  static void ads7846_restart(struct ads7846 *ts)
>  {
> +	unsigned int pdstate;

I do not see it being used. Do you have more patches for the driver?

> +
>  	if (!ts->disabled && !ts->suspended) {
> +		/* Check if pen was released since last stop */
> +		if (ts->pendown && !get_pendown_state(ts)) {
> +			struct input_dev *input = ts->input;
> +
> +			input_report_key(input, BTN_TOUCH, 0);
> +			input_report_abs(input, ABS_PRESSURE, 0);
> +			input_sync(input);
> +
> +			ts->pendown = false;
> +			dev_vdbg(&ts->spi->dev, "UP\n");

I wonder if we should not have ads7846_report_pen_up(struct ads7846 *ts) 

> +		}
> +
>  		/* Tell IRQ thread that it may poll the device. */
>  		ts->stopped = false;
>  		mb();
> -- 
> 2.28.0
> 

Thanks.

-- 
Dmitry
