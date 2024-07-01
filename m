Return-Path: <linux-input+bounces-4751-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0413391D91C
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 09:37:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 944EC1F2205B
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 07:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8143054765;
	Mon,  1 Jul 2024 07:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kjv+8yOT"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55889502BD;
	Mon,  1 Jul 2024 07:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719819464; cv=none; b=VhRHLboCgWgjGtp7CCTAIcdtsewczUP2ABxtlsBOuY34V8hROz+TYcDsx4QRnWZ5t81BOFq7/5p9c12tE4R6kryFnK4YniCDk8sP5dgoG7R5eZ0BPya4AAI+RQbhTPRc+VjPU4m+fKr90ZZ/+eM4BKdJVGzuBsxtURPZg4qoOBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719819464; c=relaxed/simple;
	bh=BhAlKVTvL5abtou59jRZCxb5CQYI4SDdsUJnyIVDGfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cLE0E81sIa/nu0+3AR6asBp+QQOXuGAA9JdqRTbCEeOUgxpr+yKh8iVckbW7TZian41Myv7ntGOCNpHNxcolMdIFQW6+k1SJzJwkjeo4rsQsLUAAqWPbSSOZqRve9weWE0c/3Z22Qvk9OGnB653Wjn8VvyxQsmHbwCziG0U3RZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kjv+8yOT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2D43C116B1;
	Mon,  1 Jul 2024 07:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719819463;
	bh=BhAlKVTvL5abtou59jRZCxb5CQYI4SDdsUJnyIVDGfc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kjv+8yOTH5/hmwJ+NSJFlV3tVGsbWPxsX/pfT9mE9y8ZEZbWXxovE+YV3ecWhdiUg
	 Z12OJQn9x328QP3mE8YrIJ7f7mTRPfmnhw5hUdcJEwHi9uivDpdolgqS1qfjfwfLDl
	 a0jQdhYM7qy8gGn5XLnLwPhbveSxQmBYyhpHXJOLAYO9hTEVJWx+kp166W0SymCLS2
	 VYN0qbgCOaNjcI1I5DXwKYeVeX+YQi5+vBKt744c015NSmY4Uit00M28nvwAaiCBjr
	 j9yhhxunWYABQGGOBMN1IkXySbRLfA9/GDRKz/hR2LPTFCrOhL9OitX3pIqgdRoHcE
	 ahY6Hp+ruXFUA==
Date: Mon, 1 Jul 2024 09:37:39 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, Jeff LaBundy <jeff@labundy.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] Input: make events() method return number of events
 processed
Message-ID: <my7tmdbjskljxhp5vdu6cervetpwvalqmgeg3g4yfgzxereqqx@cidajfox7dzr>
References: <20240701060553.869989-1-dmitry.torokhov@gmail.com>
 <20240701060553.869989-3-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701060553.869989-3-dmitry.torokhov@gmail.com>

On Jun 30 2024, Dmitry Torokhov wrote:
> In preparation to consolidating filtering and event processing in the
> input core change events() method to return number of events processed
> by it.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/evdev.c | 6 ++++--
>  include/linux/input.h | 7 ++++---
>  2 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/input/evdev.c b/drivers/input/evdev.c
> index 51e0c4954600..c8eca8cdb976 100644
> --- a/drivers/input/evdev.c
> +++ b/drivers/input/evdev.c
> @@ -288,8 +288,8 @@ static void evdev_pass_values(struct evdev_client *client,
>  /*
>   * Pass incoming events to all connected clients.
>   */
> -static void evdev_events(struct input_handle *handle,
> -			 const struct input_value *vals, unsigned int count)
> +static unsigned int evdev_events(struct input_handle *handle,
> +				 struct input_value *vals, unsigned int count)
>  {
>  	struct evdev *evdev = handle->private;
>  	struct evdev_client *client;
> @@ -306,6 +306,8 @@ static void evdev_events(struct input_handle *handle,
>  			evdev_pass_values(client, vals, count, ev_time);
>  
>  	rcu_read_unlock();
> +
> +	return count;
>  }
>  
>  /*
> diff --git a/include/linux/input.h b/include/linux/input.h
> index c22ac465254b..89a0be6ee0e2 100644
> --- a/include/linux/input.h
> +++ b/include/linux/input.h
> @@ -275,7 +275,8 @@ struct input_handle;
>   *	it may not sleep
>   * @events: event sequence handler. This method is being called by
>   *	input core with interrupts disabled and dev->event_lock
> - *	spinlock held and so it may not sleep
> + *	spinlock held and so it may not sleep. The method must return
> + *	number of events passed to it.
>   * @filter: similar to @event; separates normal event handlers from
>   *	"filters".
>   * @match: called after comparing device's id with handler's id_table
> @@ -312,8 +313,8 @@ struct input_handler {
>  	void *private;
>  
>  	void (*event)(struct input_handle *handle, unsigned int type, unsigned int code, int value);
> -	void (*events)(struct input_handle *handle,
> -		       const struct input_value *vals, unsigned int count);
> +	unsigned int (*events)(struct input_handle *handle,
> +			       struct input_value *vals, unsigned int count);
>  	bool (*filter)(struct input_handle *handle, unsigned int type, unsigned int code, int value);
>  	bool (*match)(struct input_handler *handler, struct input_dev *dev);
>  	int (*connect)(struct input_handler *handler, struct input_dev *dev, const struct input_device_id *id);
> -- 
> 2.45.2.803.g4e1b14247a-goog
> 

Reviewed-by: Benjamin Tissoires <bentiss@kernel.org>

Cheers,
Benjamin

