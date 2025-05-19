Return-Path: <linux-input+bounces-12444-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE93FABC434
	for <lists+linux-input@lfdr.de>; Mon, 19 May 2025 18:18:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43C1D188765D
	for <lists+linux-input@lfdr.de>; Mon, 19 May 2025 16:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8E602868A9;
	Mon, 19 May 2025 16:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GUTDGwhW"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A841DD9AC
	for <linux-input@vger.kernel.org>; Mon, 19 May 2025 16:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747671308; cv=none; b=LdYm8wcFEHWuBduUB0Rs/weXLIwtKjWUa+CF9qN7Xnj1EHrIdWjwoJbdEdiknN9jFGhRRoFA5bMSWZ7I0z/zfSIYmqmAHXyh4P5Zh61oaa0x+g0Q06WXlACWr43R+IuBSg+OSDdIjBYDwbo0xFIZAngHLzglvqYHPc6ko6czERU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747671308; c=relaxed/simple;
	bh=c93LfdDMdxxL1G2N4IRzJFli1vNWVx+Ilmk1Vy42WsU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=saNdJ/KqNAToI5ucJ3o3WvJT3TgTXM/IGp+2n6uXnxxeL9IM8vlSAsNy/nfpFAcfvUp6AAplToHxbTYq6TBXP41iWCS36OMK4up4dX149H3wYbGboWP5/F2SwXPHdU2k6+JPer1VYeNR3S7DsqF3Y3fgw0XnWXUA9xTnhBrgBoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GUTDGwhW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747671305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RhRu6EuymcFvDIFk2FD/5bzqcstVfgi8WU4KbHCXAUU=;
	b=GUTDGwhWLWBIpsFntEHbb9gyV9QXw68aM8tEzCR3o1scDGcAKUuEbIFiWAapOCKQLGT4yj
	5Y1AcsINvr8wBD3JEl4ij9COfmuZrgdhbPBnx1XFbFEag9jdkB1oCNb3vbjcQnaz8Y4jHM
	V8zXZ/nwY/PX4aWD2UKYsFgow6kVOF8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-513-Yo1ZnUUuNBSjLHxmBFh6Zw-1; Mon, 19 May 2025 12:15:04 -0400
X-MC-Unique: Yo1ZnUUuNBSjLHxmBFh6Zw-1
X-Mimecast-MFC-AGG-ID: Yo1ZnUUuNBSjLHxmBFh6Zw_1747671303
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac79e4764e5so422522566b.0
        for <linux-input@vger.kernel.org>; Mon, 19 May 2025 09:15:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747671303; x=1748276103;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RhRu6EuymcFvDIFk2FD/5bzqcstVfgi8WU4KbHCXAUU=;
        b=eZVvWn/2oh+OuSx8F9AgOjUOTmJir7BPBxKo+8DC1A4KWWa0CDalD8jXFldiFSVsUi
         PjLgkwJY79PYXZOoE2mYXohWKxH9S+vO53J4G5F8hbrQPa+N1wme3m6OYR/U31gPf99g
         CoKQUJg6EusK8NtNjuoP0LdkvBzoHSyMjPKT4dXnnlPHK+UMHp83tt9c4ozSOyLs3jlK
         2wK3IbmQB3HSW5XHWTeZrd0IVmS0jDozfB8adl7ARFI0prxvr9Iqb9G+EPLgsZdh0SU5
         M0VVjSccziWH1Ih0wVd2Ihsf9Fxp8Mzwnu1WitUxK5YuW8pTbYSThNvCVi+kaesx9/vk
         vh4w==
X-Forwarded-Encrypted: i=1; AJvYcCWV35W+xxCgDT+3zra97taNOn7ERzR911qcKv96Qzrw9HI5Q0YOvdKoIpjQ88pis/wHgH3mpNpjDc8//w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1ZXAwJrgdJQBlSvD+gEoDXizTVrDAGJrU6+ZqlxNjEAKAqwvR
	17dp8QgrXSkqj5zK6WewunNiEwQGDTScYpKVFbUqwm0O49k7yssVuXXja8+sXcOetKZgZ5VJrZJ
	ioOV0wsfBobXEoLo186ymLARBY0FjnlJm2f4CuMYmNsSmlhci3orPnSwTkVql0mhd
X-Gm-Gg: ASbGnctbRqEW+SABVV5eUKk1EXzYFzr9IyJdvw8itSmtvmPfztnpnLXQu34GdRmNhhb
	RUdEcGY0Kj+HVq/WsRSSB8Jgl0LFSZ/UEToCX2JOhrOMofd6pDJSSd3ioduEMti8j7Kyatmo8sB
	lnalw9uWRtT4QsIItAyrFtvLtpdpbcITAcvIqWUgu1XeJkngN0wEI85GBCzf/91J3t2auK+60Nv
	2Ttzvj6CgAwONldms3F+GhnyW3bb5kalfsB8GM5oZti6Rt/HeVp7/+36442pSTvSLZ51G20jDD3
	v77s/Ujf42/PK7cTvuQeSacmAg2b+GnvHFeeBuKjhCTaJY8aZ94sbKbmpYOAQ5x0a5ImzzJjrxF
	LOeDPujDhqwTZLu4AQLra+WTXK7063S+27T06p5cVdZ8rvnJNxnb9mSTCel7+NQ==
X-Received: by 2002:a17:907:1b2a:b0:ad2:233f:f024 with SMTP id a640c23a62f3a-ad536b82ac2mr1329213266b.17.1747671302818;
        Mon, 19 May 2025 09:15:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmFp34WQgxmGxbjDO27qbsv1VbZr+WF5JVEmDYgXua/9BqdR1gBDhL+GhA1myY8aVTZpE5SA==
X-Received: by 2002:a17:907:1b2a:b0:ad2:233f:f024 with SMTP id a640c23a62f3a-ad536b82ac2mr1329210466b.17.1747671302369;
        Mon, 19 May 2025 09:15:02 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d498737sm606674366b.138.2025.05.19.09.15.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 09:15:01 -0700 (PDT)
Message-ID: <0dfc74c9-7cec-4453-80fc-d6ff8d1a46f6@redhat.com>
Date: Mon, 19 May 2025 18:15:01 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] input: goodix: add poll mode for goodix touchscreen
To: Joseph Guo <qijian.guo@nxp.com>, Bastien Nocera <hadess@hadess.net>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 "open list:GOODIX TOUCHSCREEN" <linux-input@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250519085744.3116042-1-qijian.guo@nxp.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250519085744.3116042-1-qijian.guo@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 19-May-25 10:57 AM, Joseph Guo wrote:
> goodix touchscreen only support interrupt mode by default.
> Some panels like waveshare panel which is widely used on raspeberry pi
> don't have interrupt pins and only work on i2c poll mode.
> The waveshare panel 7inch panel use goodix gt911 touchscreen chip.
> 
> Update goodix touchscreen to support both interrupt and poll mode.
> 
> Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
> ---
>  drivers/input/touchscreen/goodix.c | 69 +++++++++++++++++++++++++++---
>  drivers/input/touchscreen/goodix.h |  4 ++
>  2 files changed, 67 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
> index aaf79ac50004..87991b56494d 100644
> --- a/drivers/input/touchscreen/goodix.c
> +++ b/drivers/input/touchscreen/goodix.c
> @@ -47,6 +47,7 @@
>  #define RESOLUTION_LOC		1
>  #define MAX_CONTACTS_LOC	5
>  #define TRIGGER_LOC		6
> +#define POLL_INTERVAL_MS		17	/* 17ms = 60fps */
> 
>  /* Our special handling for GPIO accesses through ACPI is x86 specific */
>  #if defined CONFIG_X86 && defined CONFIG_ACPI
> @@ -497,6 +498,23 @@ static void goodix_process_events(struct goodix_ts_data *ts)
>  	input_sync(ts->input_dev);
>  }
> 
> +static void goodix_ts_irq_poll_timer(struct timer_list *t)
> +{
> +	struct goodix_ts_data *ts = from_timer(ts, t, timer);
> +
> +	schedule_work(&ts->work_i2c_poll);
> +	mod_timer(&ts->timer, jiffies + msecs_to_jiffies(POLL_INTERVAL_MS));
> +}
> +
> +static void goodix_ts_work_i2c_poll(struct work_struct *work)
> +{
> +	struct goodix_ts_data *ts = container_of(work,
> +			struct goodix_ts_data, work_i2c_poll);
> +
> +	goodix_process_events(ts);
> +	goodix_i2c_write_u8(ts->client, GOODIX_READ_COOR_ADDR, 0);
> +}
> +
>  /**
>   * goodix_ts_irq_handler - The IRQ handler
>   *
> @@ -523,16 +541,50 @@ static irqreturn_t goodix_ts_irq_handler(int irq, void *dev_id)
>  	return IRQ_HANDLED;
>  }
> 
> +static void goodix_enable_irq(struct goodix_ts_data *ts)
> +{
> +	if (ts->client->irq) {
> +		enable_irq(ts->client->irq);
> +	} else {
> +		ts->timer.expires = jiffies + msecs_to_jiffies(POLL_INTERVAL_MS);
> +		add_timer(&ts->timer);
> +	}
> +}
> +
> +static void goodix_disable_irq(struct goodix_ts_data *ts)
> +{
> +	if (ts->client->irq) {
> +		disable_irq(ts->client->irq);
> +	} else {
> +		del_timer(&ts->timer);
> +		cancel_work_sync(&ts->work_i2c_poll);
> +	}
> +}
> +
>  static void goodix_free_irq(struct goodix_ts_data *ts)
>  {
> -	devm_free_irq(&ts->client->dev, ts->client->irq, ts);
> +	if (ts->client->irq) {
> +		devm_free_irq(&ts->client->dev, ts->client->irq, ts);
> +	} else {
> +		del_timer(&ts->timer);
> +		cancel_work_sync(&ts->work_i2c_poll);
> +	}
>  }
> 
>  static int goodix_request_irq(struct goodix_ts_data *ts)
>  {
> -	return devm_request_threaded_irq(&ts->client->dev, ts->client->irq,
> -					 NULL, goodix_ts_irq_handler,
> -					 ts->irq_flags, ts->client->name, ts);
> +	if (ts->client->irq) {
> +		return devm_request_threaded_irq(&ts->client->dev, ts->client->irq,
> +						 NULL, goodix_ts_irq_handler,
> +						 ts->irq_flags, ts->client->name, ts);
> +	} else {
> +		INIT_WORK(&ts->work_i2c_poll,
> +			  goodix_ts_work_i2c_poll);
> +		timer_setup(&ts->timer, goodix_ts_irq_poll_timer, 0);
> +		if (ts->irq_pin_access_method == IRQ_PIN_ACCESS_NONE)
> +			goodix_enable_irq(ts);
> +		return 0;
> +	}
>  }
> 
>  static int goodix_check_cfg_8(struct goodix_ts_data *ts, const u8 *cfg, int len)
> @@ -1420,6 +1472,11 @@ static void goodix_ts_remove(struct i2c_client *client)
>  {
>  	struct goodix_ts_data *ts = i2c_get_clientdata(client);
> 
> +	if (!client->irq) {
> +		del_timer(&ts->timer);
> +		cancel_work_sync(&ts->work_i2c_poll);
> +	}
> +
>  	if (ts->load_cfg_from_disk)
>  		wait_for_completion(&ts->firmware_loading_complete);
>  }
> @@ -1435,7 +1492,7 @@ static int goodix_suspend(struct device *dev)
> 
>  	/* We need gpio pins to suspend/resume */
>  	if (ts->irq_pin_access_method == IRQ_PIN_ACCESS_NONE) {
> -		disable_irq(client->irq);
> +		goodix_disable_irq(ts);
>  		return 0;
>  	}
> 
> @@ -1479,7 +1536,7 @@ static int goodix_resume(struct device *dev)
>  	int error;
> 
>  	if (ts->irq_pin_access_method == IRQ_PIN_ACCESS_NONE) {
> -		enable_irq(client->irq);
> +		goodix_enable_irq(ts);
>  		return 0;
>  	}
> 
> diff --git a/drivers/input/touchscreen/goodix.h b/drivers/input/touchscreen/goodix.h
> index 87797cc88b32..132e49d66324 100644
> --- a/drivers/input/touchscreen/goodix.h
> +++ b/drivers/input/touchscreen/goodix.h
> @@ -56,6 +56,7 @@
>  #define GOODIX_ID_MAX_LEN			4
>  #define GOODIX_CONFIG_MAX_LENGTH		240
>  #define GOODIX_MAX_KEYS				7
> +#define GOODIX_NAME_MAX_LEN			38
> 
>  enum goodix_irq_pin_access_method {
>  	IRQ_PIN_ACCESS_NONE,
> @@ -91,6 +92,7 @@ struct goodix_ts_data {
>  	enum gpiod_flags gpiod_rst_flags;
>  	char id[GOODIX_ID_MAX_LEN + 1];
>  	char cfg_name[64];
> +	char name[GOODIX_NAME_MAX_LEN];

This adding of the name variable, seems to be some leftover change from another patch?

Please drop this for v2.

Regards,

Hans



>  	u16 version;
>  	bool reset_controller_at_probe;
>  	bool load_cfg_from_disk;
> @@ -104,6 +106,8 @@ struct goodix_ts_data {
>  	u8 main_clk[GOODIX_MAIN_CLK_LEN];
>  	int bak_ref_len;
>  	u8 *bak_ref;
> +	struct timer_list timer;
> +	struct work_struct work_i2c_poll;
>  };
> 
>  int goodix_i2c_read(struct i2c_client *client, u16 reg, u8 *buf, int len);
> --
> 2.34.1
> 


