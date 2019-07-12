Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A627B66722
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2019 08:41:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725846AbfGLGli (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 12 Jul 2019 02:41:38 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38599 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725562AbfGLGli (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 12 Jul 2019 02:41:38 -0400
Received: by mail-pg1-f194.google.com with SMTP id z75so4083306pgz.5;
        Thu, 11 Jul 2019 23:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=TqbudKcqmPicYhxMzfjPIN213dkGC+QyBM4A1+588nU=;
        b=Q9p0q7xzXoI1Lc+XxxctCyFIgjf4+86NBaQUMF224i9/j8kfmB9DZKcKcP6cR2lnF9
         gQtH2u1zNRbKiZWbIKpYBeb/333+TMiOphvnflJzIxPHC+6CMNU7xXJh3fPQMwpDH3CC
         Yyd2O6eRukRBbBTSiwOE+ZWe9IHD3ULR8x2OTZzYrRy/qq+89JKtmuizw6gETS+Xp7WU
         TxAyMKbTYke/IZdmOREa8WcaYcCsV0lboWYFd3DPoZJ9JqoZhZcHtMcMQIf02Rlkp8Zd
         PNsBBttM0rd29w9lBBOKIzAucMDwwCawni36Hb8MfzmEMN358ZqEuIyYK/HYFxSn6oyq
         8sdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TqbudKcqmPicYhxMzfjPIN213dkGC+QyBM4A1+588nU=;
        b=YrkmnBdXpQYaa8Rl8eByUyycvgw0z1Kz/aGVyNFooxdzTo3YBHpFqKaYzdDlZPHFA3
         EY1+m4JPSVQY5Wdk3W63PmXXEfCaJa/h4KMoig9YwchTt+XAD6bocEAMPc3JpsoLLhMT
         ZkFxt5mIIcWG4JSdBeV1a+Z/+AUCiu5KufL2WF4Sc3wdi/ruxxPVkcXbNYRNUz4oRFXb
         UuDa/O2qdiG3MbPDzfx61Slsm9VVdInY5owuszsrqEgByIQJ19GD79TRVaZAu9ORDQ13
         n41qy3INkq0p+EuK8Xsa94M5ZFq3kTLry2uKDTtebZ5KfBULuGb+2zFmewwxQD8RJyKU
         t32Q==
X-Gm-Message-State: APjAAAWnu9/Zic+fCBU9EvoPVsuK3dkOHVR/R/OH2G8Y8JjR0F0A+U9s
        ah11apA1UoG6AxyKw/9urPg=
X-Google-Smtp-Source: APXvYqyTs5YjruaHtyFSkYfl0nakyiomy/5PFAXK7KXA5jMZTEKx0EjnTVVztr7SMcaRtXaoX/BifQ==
X-Received: by 2002:a17:90a:37ac:: with SMTP id v41mr9339113pjb.6.1562913697140;
        Thu, 11 Jul 2019 23:41:37 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id 33sm13789713pgy.22.2019.07.11.23.41.36
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 11 Jul 2019 23:41:36 -0700 (PDT)
Date:   Thu, 11 Jul 2019 23:41:34 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Atif Niyaz <atifniyaz@google.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Peter Hutterer <peter.hutterer@who-t.net>
Cc:     Atif Niyaz <atifniyaz11@gmail.com>,
        Siarhei Vishniakou <svv@google.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] input: API for Setting a Timestamp from a Driver
Message-ID: <20190712064134.GA150689@dtor-ws>
References: <20190710230410.9386-1-atifniyaz@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190710230410.9386-1-atifniyaz@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Atif,

On Wed, Jul 10, 2019 at 04:04:10PM -0700, Atif Niyaz wrote:
> Currently, evdev stamps time with timestamps acquired in
> evdev_events. However, this timestamping may not be accurate in terms of
> measuring when the actual event happened. This API allows any 3rd party
> driver to be able to call input_set_timestamp, and provide a timestamp
> that can be utilized in order to provide a more accurate sense of time
> for the event
> 
> Signed-off-by: Atif Niyaz <atifniyaz@google.com>

This looks OK to me. Benjamin, Peter, any concerns here?


> ---
>  drivers/input/evdev.c | 42 ++++++++++++++++--------------------------
>  drivers/input/input.c | 17 +++++++++++++++++
>  include/linux/input.h | 38 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 71 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/input/evdev.c b/drivers/input/evdev.c
> index 867c2cfd0038..a331efa0a3f6 100644
> --- a/drivers/input/evdev.c
> +++ b/drivers/input/evdev.c
> @@ -25,13 +25,6 @@
>  #include <linux/cdev.h>
>  #include "input-compat.h"
>  
> -enum evdev_clock_type {
> -	EV_CLK_REAL = 0,
> -	EV_CLK_MONO,
> -	EV_CLK_BOOT,
> -	EV_CLK_MAX
> -};
> -
>  struct evdev {
>  	int open;
>  	struct input_handle handle;
> @@ -53,7 +46,7 @@ struct evdev_client {
>  	struct fasync_struct *fasync;
>  	struct evdev *evdev;
>  	struct list_head node;
> -	unsigned int clk_type;
> +	input_clk_t clk_type;
>  	bool revoked;
>  	unsigned long *evmasks[EV_CNT];
>  	unsigned int bufsize;
> @@ -150,16 +143,18 @@ static void __evdev_flush_queue(struct evdev_client *client, unsigned int type)
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

Add "break" here please.

> +	}
>  
> -	ts = ktime_to_timespec64(time);
>  	ev.input_event_sec = ts.tv_sec;
>  	ev.input_event_usec = ts.tv_nsec / NSEC_PER_USEC;
>  	ev.type = EV_SYN;
> @@ -185,21 +180,21 @@ static void evdev_queue_syn_dropped(struct evdev_client *client)
>  	spin_unlock_irqrestore(&client->buffer_lock, flags);
>  }
>  
> -static int evdev_set_clk_type(struct evdev_client *client, unsigned int clkid)
> +static int evdev_set_clk_type(struct evdev_client *client, clockid_t clkid)
>  {
>  	unsigned long flags;
> -	unsigned int clk_type;
> +	input_clk_t clk_type;
>  
>  	switch (clkid) {
>  
>  	case CLOCK_REALTIME:
> -		clk_type = EV_CLK_REAL;
> +		clk_type = INPUT_CLK_REAL;
>  		break;
>  	case CLOCK_MONOTONIC:
> -		clk_type = EV_CLK_MONO;
> +		clk_type = INPUT_CLK_MONO;
>  		break;
>  	case CLOCK_BOOTTIME:
> -		clk_type = EV_CLK_BOOT;
> +		clk_type = INPUT_CLK_BOOT;
>  		break;
>  	default:
>  		return -EINVAL;
> @@ -307,12 +302,7 @@ static void evdev_events(struct input_handle *handle,
>  {
>  	struct evdev *evdev = handle->private;
>  	struct evdev_client *client;
> -	ktime_t ev_time[EV_CLK_MAX];
> -
> -	ev_time[EV_CLK_MONO] = ktime_get();
> -	ev_time[EV_CLK_REAL] = ktime_mono_to_real(ev_time[EV_CLK_MONO]);
> -	ev_time[EV_CLK_BOOT] = ktime_mono_to_any(ev_time[EV_CLK_MONO],
> -						 TK_OFFS_BOOT);
> +	ktime_t *ev_time = input_get_timestamp(handle->dev);
>  
>  	rcu_read_lock();
>  
> diff --git a/drivers/input/input.c b/drivers/input/input.c
> index 7f3c5fcb9ed6..ae8b0ee58120 100644
> --- a/drivers/input/input.c
> +++ b/drivers/input/input.c
> @@ -1894,6 +1894,23 @@ void input_free_device(struct input_dev *dev)
>  }
>  EXPORT_SYMBOL(input_free_device);
>  
> +/**
> + * input_get_timestamp - get timestamp for input events
> + * @dev: input device to get timestamp from
> + *
> + * A valid timestamp is a timestamp of non-zero value.
> + */
> +ktime_t *input_get_timestamp(struct input_dev *dev)
> +{
> +	const ktime_t invalid_timestamp = ktime_set(0, 0);
> +
> +	if (!ktime_compare(dev->timestamp[INPUT_CLK_MONO], ktime_zero)) {

You need to replace ktime_zero with invalid_timestamp here.

> +		input_set_timestamp(dev, ktime_get());
> +	}

No need for curly braces for 1-line body.

> +	return dev->timestamp;
> +}
> +EXPORT_SYMBOL(input_get_timestamp);
> +
>  /**
>   * input_set_capability - mark device as capable of a certain event
>   * @dev: device that is capable of emitting or accepting event
> diff --git a/include/linux/input.h b/include/linux/input.h
> index 510e78558c10..3929b62ccbe5 100644
> --- a/include/linux/input.h
> +++ b/include/linux/input.h
> @@ -33,6 +33,14 @@ struct input_value {
>  	__s32 value;
>  };
>  
> +enum input_clock_type {
> +	INPUT_CLK_REAL = 0,
> +	INPUT_CLK_MONO,
> +	INPUT_CLK_BOOT,
> +	INPUT_CLK_MAX
> +};
> +typedef enum input_clock_type input_clk_t;

We typically avoid typedefs unless we really want to hide kind of data
we are dealing with. Let's just use "enum input_clock_type" everywhere.

> +
>  /**
>   * struct input_dev - represents an input device
>   * @name: name of the device
> @@ -114,6 +122,8 @@ struct input_value {
>   * @vals: array of values queued in the current frame
>   * @devres_managed: indicates that devices is managed with devres framework
>   *	and needs not be explicitly unregistered or freed.
> + * @timestamp: storage for a timestamp set by input_set_timestamp called
> + *  by a driver
>   */
>  struct input_dev {
>  	const char *name;
> @@ -184,6 +194,8 @@ struct input_dev {
>  	struct input_value *vals;
>  
>  	bool devres_managed;
> +
> +	ktime_t timestamp[INPUT_CLK_MAX];
>  };
>  #define to_input_dev(d) container_of(d, struct input_dev, dev)
>  
> @@ -382,6 +394,32 @@ void input_close_device(struct input_handle *);
>  
>  int input_flush_device(struct input_handle *handle, struct file *file);
>  
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
> +
> +ktime_t *input_get_timestamp(struct input_dev *dev);
> +
>  void input_event(struct input_dev *dev, unsigned int type, unsigned int code, int value);
>  void input_inject_event(struct input_handle *handle, unsigned int type, unsigned int code, int value);
>  
> -- 
> 2.22.0.410.gd8fdbe21b5-goog
> 

-- 
Dmitry
