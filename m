Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA5F0744E6
	for <lists+linux-input@lfdr.de>; Thu, 25 Jul 2019 07:27:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390612AbfGYF1g (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Jul 2019 01:27:36 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:44636 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390562AbfGYF1f (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Jul 2019 01:27:35 -0400
Received: by mail-lf1-f67.google.com with SMTP id r15so16556006lfm.11;
        Wed, 24 Jul 2019 22:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=B1dzgBDqxDd22puO1aTj0L2Ad5IBjs7oPRfsYiUq1VE=;
        b=KhakXsdtcjeWJe3Yj2rD3o2RePTZo94CcrXipiEIPqXAyb7r+uEZgDYDfdAK2w7PoR
         izTwuXvDM31FraSELXo+9qmPIsE4zy7F7zkZ6+kZf8cyUvuRxKfFtrsesR4zjlHeknDT
         wT4oxYuYAxzUA6WXvwxqWWQmjkTG8+OhXbRNXM6+95/TtLgKTuIpZp2A2UrjxYuci4h8
         q0iqgJTW5bR8LCWqgRkdttXTP+chmfF1qJh8HR9aE8+BY7D8Llk9r58WjR8zO3aWunlj
         QJeba9MQkjW+O7Ee77SkKDxduR39k6/zirwYT17y4Jm4pmYjPjFkf/r2uMmjCwsAz7wJ
         kCtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=B1dzgBDqxDd22puO1aTj0L2Ad5IBjs7oPRfsYiUq1VE=;
        b=UX70vPWEUhaIVDio1WXPGKckQcLSS+C5gd3gChOmNEiOgjoOBcpi/PSCfzXIfXHCVu
         zAaqDy0WW1FE71d+0x7VkpmZ6lxRNuhgYX1B9Fmfs7VeiqOZqXFxgw9P7il78zfg0EpS
         JfYDxKFLixwdX4Hc6g4811jS6piuoKmPHvrwRJ0iUaZGIJDMGCg48o2FmLZApNz/GZMT
         0zETpgnwdLF24cvUyvq3FkwWDMVxHjJ9Mcv1TT0w/qve/Q/xlJCd8FmGFywArY5BLgBP
         i0x5XdhjPSLUmADsDTf/kFCPnnxydbcYANNlRiejhk+RfLtUlhhzVOKmFNF+j5sdTT4D
         xvmw==
X-Gm-Message-State: APjAAAVVp8sZW/8q+msQjqL+A69RIAvWpclCgJFOOZxZU8pB1/QQAeeL
        lDIATxswK0CNp57HIl6r89w=
X-Google-Smtp-Source: APXvYqw8v7oAfeqT04y3KKHYAxuaGlluJli4wZh7zK1xQWJsQbD5QEroZ9trHZa1fU+L9BzCM64CIQ==
X-Received: by 2002:a19:8c56:: with SMTP id i22mr40141693lfj.105.1564032453499;
        Wed, 24 Jul 2019 22:27:33 -0700 (PDT)
Received: from localhost ([188.170.223.67])
        by smtp.gmail.com with ESMTPSA id z23sm7322650lfq.77.2019.07.24.22.27.31
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jul 2019 22:27:31 -0700 (PDT)
Date:   Thu, 25 Jul 2019 08:27:28 +0300
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Atif Niyaz <atifniyaz@google.com>
Cc:     Atif Niyaz <atifniyaz11@gmail.com>,
        Siarhei Vishniakou <svv@google.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] input: API for Setting a Timestamp from a Driver
Message-ID: <20190725052728.GA874@penguin>
References: <20190718194133.64034-1-atifniyaz@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190718194133.64034-1-atifniyaz@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Atif,

On Thu, Jul 18, 2019 at 12:41:33PM -0700, Atif Niyaz wrote:
> @@ -150,16 +143,19 @@ static void __evdev_flush_queue(struct evdev_client *client, unsigned int type)
>  static void __evdev_queue_syn_dropped(struct evdev_client *client)
>  {
>  	struct input_event ev;
> -	ktime_t time;
>  	struct timespec64 ts;
> +	ktime_t *time = input_get_timestamp(client->evdev->handle.dev);
>  
> -	time = client->clk_type == EV_CLK_REAL ?
> -			ktime_get_real() :
> -			client->clk_type == EV_CLK_MONO ?
> -				ktime_get() :
> -				ktime_get_boottime();
> +	switch (client->clk_type) {
> +	case INPUT_CLK_REAL:
> +	case INPUT_CLK_MONO:
> +		ts = ktime_to_timespec64(time[client->clk_type]);
> +		break;
> +	default:
> +		ts = ktime_to_timespec64(time[INPUT_CLK_BOOT]);
> +		break;

Since we trust client->clk_type be valid in evdev_event() we can also
trust it here. I replaced the switch statement with:

	ts = ktime_to_timespec64(ev_time[client->clkk_type]);

> +	}
>  
> -	ts = ktime_to_timespec64(time);
>  	ev.input_event_sec = ts.tv_sec;
>  	ev.input_event_usec = ts.tv_nsec / NSEC_PER_USEC;
>  	ev.type = EV_SYN;
> @@ -185,21 +181,21 @@ static void evdev_queue_syn_dropped(struct evdev_client *client)
>  	spin_unlock_irqrestore(&client->buffer_lock, flags);
>  }
>  
> -static int evdev_set_clk_type(struct evdev_client *client, unsigned int clkid)
> +static int evdev_set_clk_type(struct evdev_client *client, clockid_t clkid)

The data passed to evdev_set_clk_type() is an integer with values that
coincide with the enum's values, so I kept the type of parameter as it
was.

> +/**
> + * input_set_timestamp - set timestamp for input events
> + * @dev: input device to set timestamp for
> + * @timestamp: the time at which the event has occurred
> + *   in CLOCK_MONOTONIC
> + *
> + * This function is intended to provide to the input system a more
> + * accurate time of when an event actually occurred. The driver should
> + * call this function as soon as a timestamp is acquired ensuring
> + * clock conversions in input_set_timestamp are done correctly.
> + *
> + * The system entering a suspend between timestamp acquisition and
> + * calling input_set_timestamp can result in inaccurate conversions.
> + *
> + */
> +static inline void input_set_timestamp(struct input_dev *dev,
> +	ktime_t timestamp)
> +{
> +	dev->timestamp[INPUT_CLK_MONO] = timestamp;
> +	dev->timestamp[INPUT_CLK_REAL] = ktime_mono_to_real(timestamp);
> +	dev->timestamp[INPUT_CLK_BOOT] = ktime_mono_to_any(
> +		timestamp, TK_OFFS_BOOT);
> +}

I moved this input input.c, together with input_get_timestamp().

Applied, thank you.

-- 
Dmitry
