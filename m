Return-Path: <linux-input+bounces-4752-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 401C491D938
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 09:41:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 707C81C2140B
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 07:41:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAFBD81AB6;
	Mon,  1 Jul 2024 07:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sur3jpoC"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8C854765;
	Mon,  1 Jul 2024 07:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719819687; cv=none; b=FzP0vlG3qJ/wkWpj38ISmmVMvMVbePjJ1M4eOcKFbxkndkpoRmjaMd9ch/pQSipRocWTeeuPeqI5HyqVqromj3V64icxyF/CGO0dhY7YXwQEGDCeM5BOu4slQLdq7PTkHLD0OU7n5kX5ZKVO2t0502l6L8aeVmBfGCL4zFDHaDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719819687; c=relaxed/simple;
	bh=+wsA5XhU7vHzqtmDMPNibGdTI6PoJMHM5FlgsYGU1gY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vzn0Q0dnXxv5xMLMF2BVRuzrCaFGawKmonO7fYg2i+fazAy26o/Rrhf4qigqgXKXVOsF/wmih/YGKlqxnsaTrnhL1sqAm6jSqkLU/w9KOnSqRsDWcufgZSH5+hLa1qu48Oh6QIX94YPC1Sujp9ObTPmHe3W6hTQ7XaYRWkPDHjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sur3jpoC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CABD8C116B1;
	Mon,  1 Jul 2024 07:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719819687;
	bh=+wsA5XhU7vHzqtmDMPNibGdTI6PoJMHM5FlgsYGU1gY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sur3jpoCFk0yR/fBO6PbEYvxHhdxnURxRKXgni58CM2Uwdp+Zmr1QkCIhVtjSjPXK
	 yWybLwN79gYVty9KHJtVMdamNBIFNVgRJrRm5A1iZlPOFxKQgsoDujIyNLrGPrZmDS
	 5fIPwtjEXeO/+wdr+FaXeIfatU9dHR89vf1cmaFW5yQxesljBELe/VleS/ngHibOrW
	 Hgg5jPcEuVPc4UwA4sN5lsF5CHxz8ViULEA1xqeYojUSGNh7XSPYh65UFCyxbf35vD
	 LY+rcQqkZ8eyIM5wNEJH363IRdXGx/+KqgNHRuM0LgyAvy71TB3OI07ndrkP3lE+3f
	 ezfRRO9dme1bQ==
Date: Mon, 1 Jul 2024 09:41:22 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, Jeff LaBundy <jeff@labundy.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] Input: simplify event handling logic
Message-ID: <qevkkesgw7y2bypexmogght7iozo646vowjkovht5mplegzvnl@tzfffoaglijz>
References: <20240701060553.869989-1-dmitry.torokhov@gmail.com>
 <20240701060553.869989-4-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701060553.869989-4-dmitry.torokhov@gmail.com>

On Jun 30 2024, Dmitry Torokhov wrote:
> Streamline event handling code by providing batch implementations for
> filtering and event processing and using them in place of the main
> event handler, as needed, instead of having complex branching logic
> in the middle of the event processing code.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/input.c | 90 ++++++++++++++++++++++++-------------------
>  1 file changed, 51 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/input/input.c b/drivers/input/input.c
> index 8434348faeac..eeb755cb12e7 100644
> --- a/drivers/input/input.c
> +++ b/drivers/input/input.c
> @@ -99,41 +99,6 @@ static void input_stop_autorepeat(struct input_dev *dev)
>  	del_timer(&dev->timer);
>  }
>  
> -/*
> - * Pass event first through all filters and then, if event has not been
> - * filtered out, through all open handles. This function is called with
> - * dev->event_lock held and interrupts disabled.
> - */
> -static unsigned int input_to_handler(struct input_handle *handle,
> -			struct input_value *vals, unsigned int count)
> -{
> -	struct input_handler *handler = handle->handler;
> -	struct input_value *end = vals;
> -	struct input_value *v;
> -
> -	if (handler->filter) {
> -		for (v = vals; v != vals + count; v++) {
> -			if (handler->filter(handle, v->type, v->code, v->value))
> -				continue;
> -			if (end != v)
> -				*end = *v;
> -			end++;
> -		}
> -		count = end - vals;
> -	}
> -
> -	if (!count)
> -		return 0;
> -
> -	if (handler->events)
> -		handler->events(handle, vals, count);
> -	else if (handler->event)
> -		for (v = vals; v != vals + count; v++)
> -			handler->event(handle, v->type, v->code, v->value);
> -
> -	return count;
> -}
> -
>  /*
>   * Pass values first through all filters and then, if event has not been
>   * filtered out, through all open handles. This function is called with

Nitpick: maybe that comment above input_pass_values() should also be
amended now that the processing is more straightforward?

> @@ -154,11 +119,12 @@ static void input_pass_values(struct input_dev *dev,
>  
>  	handle = rcu_dereference(dev->grab);
>  	if (handle) {
> -		count = input_to_handler(handle, vals, count);
> +		count = handle->handler->events(handle, vals, count);
>  	} else {
>  		list_for_each_entry_rcu(handle, &dev->h_list, d_node)
>  			if (handle->open) {
> -				count = input_to_handler(handle, vals, count);
> +				count = handle->handler->events(handle, vals,
> +								count);
>  				if (!count)
>  					break;
>  			}
> @@ -2537,6 +2503,47 @@ static int input_handler_check_methods(const struct input_handler *handler)
>  	return 0;
>  }
>  
> +/*
> + * An implementation of input_handler's events() method that simply
> + * invokes handler->event() method for each event one by one.
> + */
> +static unsigned int input_handler_events_default(struct input_handle *handle,
> +						 struct input_value *vals,
> +						 unsigned int count)
> +{
> +	struct input_handler *handler = handle->handler;
> +	struct input_value *v;
> +
> +	for (v = vals; v != vals + count; v++)
> +		handler->event(handle, v->type, v->code, v->value);
> +
> +	return count;
> +}
> +
> +/*
> + * An implementation of input_handler's events() method that invokes
> + * handler->filter() method for each event one by one and removes events
> + * that were filtered out from the "vals" array.
> + */
> +static unsigned int input_handler_events_filter(struct input_handle *handle,
> +						struct input_value *vals,
> +						unsigned int count)
> +{
> +	struct input_handler *handler = handle->handler;
> +	struct input_value *end = vals;
> +	struct input_value *v;
> +
> +	for (v = vals; v != vals + count; v++) {
> +		if (handler->filter(handle, v->type, v->code, v->value))
> +			continue;
> +		if (end != v)
> +			*end = *v;
> +		end++;
> +	}
> +
> +	return end - vals;
> +}
> +
>  /**
>   * input_register_handler - register a new input handler
>   * @handler: handler to be registered
> @@ -2554,12 +2561,17 @@ int input_register_handler(struct input_handler *handler)
>  	if (error)
>  		return error;
>  
> +	INIT_LIST_HEAD(&handler->h_list);
> +
> +	if (handler->filter)
> +		handler->events = input_handler_events_filter;
> +	else if (handler->event)
> +		handler->events = input_handler_events_default;
> +
>  	error = mutex_lock_interruptible(&input_mutex);
>  	if (error)
>  		return error;
>  
> -	INIT_LIST_HEAD(&handler->h_list);
> -
>  	list_add_tail(&handler->node, &input_handler_list);
>  
>  	list_for_each_entry(dev, &input_dev_list, node)
> -- 
> 2.45.2.803.g4e1b14247a-goog
> 

Minor nitpick, but otherwise:

Reviewed-by: Benjamin Tissoires <bentiss@kernel.org>

Cheers,
Benjamin

