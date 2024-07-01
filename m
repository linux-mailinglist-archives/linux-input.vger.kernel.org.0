Return-Path: <linux-input+bounces-4753-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA4E91D974
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 09:53:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D7116B23156
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 07:53:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 749DB768FD;
	Mon,  1 Jul 2024 07:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QQPjE1la"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4676F073;
	Mon,  1 Jul 2024 07:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719820385; cv=none; b=bjXRzZOeXA//qAMfib5x5QoJ7+52qQL7st9i4ZYE+6KLSacaEZ4n0WAk4zIq47ZrgJcHmJniKd1pzpo9accEWSq9pUEY19wKmP1yU2Mvi5ns2ZM4pxwSNZNpb0WaaUPNEIDioonYIe0KehH3M+yTs9FARQnWzfQljcd+XhQIAlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719820385; c=relaxed/simple;
	bh=hDpWgwSVQ5Ukrel+3JWNk0RsmebH4XHE9ysBkqTz5YY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gBl+ROXUWpEtNBWbVqRxka8nDb7/Y/Lijhuo1Bxa7n9j/v5EBrq7dxqPp0MyKFuvZaTW3pBuvQwPyJ+EpluvT++1IUXz17WXrN2f+YhoGZ4zepjlmiUa/gKflJ7en2mZ9fZE2/FgctD4n3/9hfcQR5WeD7A6/V/wqYne0/O1hTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QQPjE1la; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EB9BC116B1;
	Mon,  1 Jul 2024 07:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719820384;
	bh=hDpWgwSVQ5Ukrel+3JWNk0RsmebH4XHE9ysBkqTz5YY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QQPjE1lazVNsIQLAEYALQMN6MNlJSaRtMFyuukrF8xJNyWJF+M5u7WPFHmPO+wAEH
	 77cs8oTWmTRQvjJForpJ5S36RFrTu4tk2CxFodaKMrrllzyFlmELZrYLnjDc8A1gvB
	 HrgpmV7tKrp3DVwBPBQOV7swtS/shaUb5zQppzARflG6IkndTAD29thQnjN08A+aKz
	 leLyzyZXozB4DN0seq1zT4YQO83YKX+wMroBM2DO/MZXnRocutkIGTPCe35IBTsjyT
	 GSDNE3ubu6nXgW0dXsBuBPPOsAUvitWyPAbu4Ubr9LBtJ0bwNCiezhO0yPTocYDhLw
	 8BPd6iy1HkZow==
Date: Mon, 1 Jul 2024 09:53:01 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, Jeff LaBundy <jeff@labundy.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] Input: preallocate memory to hold event values
Message-ID: <uhw27xijopkzogbs6ekt5bo3trrg4yu6pkxtpd3udeosjungwm@es6j6h6mjka6>
References: <20240701060553.869989-1-dmitry.torokhov@gmail.com>
 <20240701060553.869989-5-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701060553.869989-5-dmitry.torokhov@gmail.com>

On Jun 30 2024, Dmitry Torokhov wrote:
> Preallocate memory for holding event values (input_dev->vals) so that
> there is no need to check if it was allocated or not in the event
> processing code.
> 
> The amount of memory will be adjusted after input device has been fully
> set up upon registering device with the input core.

As a general comment on this patch, I think it should be split in 2 or
3:
- reorder input_allocate_device() and introduce the `if (!dev) return`
  statement
- introduce input_device_tune_vals()
- and then preallocate the memory for dev->vals.

I think the code is OK in its current form, but the rewrite in the
middle are giving me a hard time ensuring we are not losing anything in
the change.

> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/input.c | 98 ++++++++++++++++++++++++++++---------------
>  1 file changed, 64 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/input/input.c b/drivers/input/input.c
> index eeb755cb12e7..b65b645d9478 100644
> --- a/drivers/input/input.c
> +++ b/drivers/input/input.c
> @@ -112,9 +112,6 @@ static void input_pass_values(struct input_dev *dev,
>  
>  	lockdep_assert_held(&dev->event_lock);
>  
> -	if (!count)
> -		return;

This doesn't seem to be related to the commit. Should this be in a
separate one?

> -
>  	rcu_read_lock();
>  
>  	handle = rcu_dereference(dev->grab);
> @@ -320,9 +317,6 @@ static void input_event_dispose(struct input_dev *dev, int disposition,
>  	if ((disposition & INPUT_PASS_TO_DEVICE) && dev->event)
>  		dev->event(dev, type, code, value);
>  
> -	if (!dev->vals)
> -		return;
> -
>  	if (disposition & INPUT_PASS_TO_HANDLERS) {
>  		struct input_value *v;
>  
> @@ -1979,22 +1973,41 @@ struct input_dev *input_allocate_device(void)
>  	struct input_dev *dev;
>  
>  	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
> -	if (dev) {
> -		dev->dev.type = &input_dev_type;
> -		dev->dev.class = &input_class;
> -		device_initialize(&dev->dev);
> -		mutex_init(&dev->mutex);
> -		spin_lock_init(&dev->event_lock);
> -		timer_setup(&dev->timer, NULL, 0);
> -		INIT_LIST_HEAD(&dev->h_list);
> -		INIT_LIST_HEAD(&dev->node);
> -
> -		dev_set_name(&dev->dev, "input%lu",
> -			     (unsigned long)atomic_inc_return(&input_no));
> -
> -		__module_get(THIS_MODULE);
> +	if (!dev)
> +		return NULL;
> +
> +	/*
> +	 * Start with space for SYN_REPORT + 7 EV_KEY/EV_MSC events + 2 spare,
> +	 * see input_estimate_events_per_packet(). We will tune the number
> +	 * when we register the device.
> +	 */
> +	dev->max_vals = 10;
> +	dev->vals = kcalloc(dev->max_vals, sizeof(*dev->vals), GFP_KERNEL);
> +	if (!dev->vals) {
> +		kfree(dev);
> +		return NULL;
>  	}
>  
> +	mutex_init(&dev->mutex);
> +	spin_lock_init(&dev->event_lock);
> +	timer_setup(&dev->timer, NULL, 0);
> +	INIT_LIST_HEAD(&dev->h_list);
> +	INIT_LIST_HEAD(&dev->node);
> +
> +	dev->dev.type = &input_dev_type;
> +	dev->dev.class = &input_class;
> +	device_initialize(&dev->dev);
> +	/*
> +	 * From this point on we can no longer simply "kfree(dev)", we need
> +	 * to use input_free_device() so that device core properly frees its
> +	 * resources associated with the input device.
> +	 */
> +
> +	dev_set_name(&dev->dev, "input%lu",
> +		     (unsigned long)atomic_inc_return(&input_no));
> +
> +	__module_get(THIS_MODULE);
> +
>  	return dev;
>  }
>  EXPORT_SYMBOL(input_allocate_device);
> @@ -2334,6 +2347,34 @@ bool input_device_enabled(struct input_dev *dev)
>  }
>  EXPORT_SYMBOL_GPL(input_device_enabled);
>  
> +static int input_device_tune_vals(struct input_dev *dev)
> +{
> +	struct input_value *vals;
> +	unsigned int packet_size;
> +	unsigned int max_vals;
> +
> +	packet_size = input_estimate_events_per_packet(dev);
> +	if (dev->hint_events_per_packet < packet_size)
> +		dev->hint_events_per_packet = packet_size;
> +
> +	max_vals = dev->hint_events_per_packet + 2;
> +	if (dev->max_vals >= max_vals)
> +		return 0;
> +
> +	vals = kcalloc(max_vals, sizeof(*vals), GFP_KERNEL);
> +	if (!vals)
> +		return -ENOMEM;
> +
> +	spin_lock_irq(&dev->event_lock);
> +	dev->max_vals = max_vals;
> +	swap(dev->vals, vals);
> +	spin_unlock_irq(&dev->event_lock);
> +
> +	kfree(vals);

Maybe add a comment here that we are freeing the *old* value of
dev->vals, not the brand new we just allocated a few lines above.
This made me look at the code a few time and wondered why we just
allocate and free the same data...

Cheers,
Benjamin

> +
> +	return 0;
> +}
> +
>  /**
>   * input_register_device - register device with input core
>   * @dev: device to be registered
> @@ -2361,7 +2402,6 @@ int input_register_device(struct input_dev *dev)
>  {
>  	struct input_devres *devres = NULL;
>  	struct input_handler *handler;
> -	unsigned int packet_size;
>  	const char *path;
>  	int error;
>  
> @@ -2389,16 +2429,9 @@ int input_register_device(struct input_dev *dev)
>  	/* Make sure that bitmasks not mentioned in dev->evbit are clean. */
>  	input_cleanse_bitmasks(dev);
>  
> -	packet_size = input_estimate_events_per_packet(dev);
> -	if (dev->hint_events_per_packet < packet_size)
> -		dev->hint_events_per_packet = packet_size;
> -
> -	dev->max_vals = dev->hint_events_per_packet + 2;
> -	dev->vals = kcalloc(dev->max_vals, sizeof(*dev->vals), GFP_KERNEL);
> -	if (!dev->vals) {
> -		error = -ENOMEM;
> +	error = input_device_tune_vals(dev);
> +	if (error)
>  		goto err_devres_free;
> -	}
>  
>  	/*
>  	 * If delay and period are pre-set by the driver, then autorepeating
> @@ -2418,7 +2451,7 @@ int input_register_device(struct input_dev *dev)
>  
>  	error = device_add(&dev->dev);
>  	if (error)
> -		goto err_free_vals;
> +		goto err_devres_free;
>  
>  	path = kobject_get_path(&dev->dev.kobj, GFP_KERNEL);
>  	pr_info("%s as %s\n",
> @@ -2448,9 +2481,6 @@ int input_register_device(struct input_dev *dev)
>  
>  err_device_del:
>  	device_del(&dev->dev);
> -err_free_vals:
> -	kfree(dev->vals);
> -	dev->vals = NULL;
>  err_devres_free:
>  	devres_free(devres);
>  	return error;
> -- 
> 2.45.2.803.g4e1b14247a-goog
> 

