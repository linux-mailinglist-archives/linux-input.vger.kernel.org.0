Return-Path: <linux-input+bounces-4750-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2E891D911
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 09:36:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98AD2B209B6
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 07:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD77B7E58D;
	Mon,  1 Jul 2024 07:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="urTlMEjt"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864ED7E110;
	Mon,  1 Jul 2024 07:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719819373; cv=none; b=Cug4ov5UZWaUA/5w/28XpwZNNTHzHwVh8XncdDGSItZrf7O9NxbNCcPTP/ehIC/yzqYJ5xc40vFYTCPwhxfSX+YzLMODM5SRqJcRNq2p2q0F0QByFKJ8GITD8DzRw/Ge77DgLLvubJy23eo6e7Rq/aslbft8Sg8qYLObTiiVF/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719819373; c=relaxed/simple;
	bh=rQ/PY2VWUnfw+FYccw7ARj24Suz8u/p2eHcFrTdUxtM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=db5JyF8ulk0GVjx+Mgixmvf6wjofJqS2pJbbXQVJ0ky/QqUauNygex7gg++H0mpVe5JfoiuByFtAdvEGyaHsQr2PPiY4XRRRIJo9qHIgkb7dHXQ5W6NyAyEDF4f+vf6lI5D9cOllWerKllTcE6Gr5DMO9oGRmwQDXzYFSylBmqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=urTlMEjt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9816C32781;
	Mon,  1 Jul 2024 07:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719819373;
	bh=rQ/PY2VWUnfw+FYccw7ARj24Suz8u/p2eHcFrTdUxtM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=urTlMEjtjrSXwML7JT5Ik5qC4AoYE66mey2RAIvFIvOrJc/8VCfznEkr1kDpTe0dz
	 YXa93ElZSjzMzOn/e8F0L6L51SH+kgSb8J30PM+KaGhxEQ3jQ27HhN+OwoP0WaSXZK
	 ZoF+JxbtdDpzIkYjWOGOd1jy6humGZtLbp8w25StfKKvkes7bq2p3bsesDJ0mpSuAF
	 rKXEdcPAzfi7bMPHmFtBkxshZhHG3U5Fjie1wJXQnXiB/EcTa9Mqw6a/sBVauXUlPF
	 O2OtxxTiWqVGWGCZ2VlnMhKpqYB97SB6OUyXRKSeB+Q/HVcTumang1+xTkzuOGMs3N
	 DcM1TrxNuXREQ==
Date: Mon, 1 Jul 2024 09:36:08 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, Jeff LaBundy <jeff@labundy.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] Input: make sure input handlers define only one
 processing method
Message-ID: <cg35cp36opttnr2jgsqda2gsgqdn6vplc2pq3n3of3e356igua@vei6pdsw25si>
References: <20240701060553.869989-1-dmitry.torokhov@gmail.com>
 <20240701060553.869989-2-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701060553.869989-2-dmitry.torokhov@gmail.com>

Hi Dmitry,

On Jun 30 2024, Dmitry Torokhov wrote:
> Input core expects input handlers to be either filters, or regular
> handlers, but not both. Additionally, for regular handlers it does
> not make sense to define both single event method and batch method.
> 
> Refuse registering handler if it defines more than one method.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/input.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/input/input.c b/drivers/input/input.c
> index fd4997ba263c..8434348faeac 100644
> --- a/drivers/input/input.c
> +++ b/drivers/input/input.c
> @@ -2517,6 +2517,26 @@ void input_unregister_device(struct input_dev *dev)
>  }
>  EXPORT_SYMBOL(input_unregister_device);
>  
> +static int input_handler_check_methods(const struct input_handler *handler)
> +{
> +	int count = 0;
> +
> +	if (handler->filter)
> +		count++;
> +	if (handler->events)
> +		count++;
> +	if (handler->event)
> +		count++;
> +
> +	if (count != 1) {

Am I missing some upstream commit? I have the following:

in drivers/input/evdev.c:

static struct input_handler evdev_handler = {
	.event		= evdev_event,
	.events		= evdev_events,
	.connect	= evdev_connect,
	.disconnect	= evdev_disconnect,
	.legacy_minors	= true,
	.minor		= EVDEV_MINOR_BASE,
	.name		= "evdev",
	.id_table	= evdev_ids,
};

So here count should be 2 and evdev would be rejected?

And in drivers/tty/serial/kgdboc.c:

static struct input_handler kgdboc_reset_handler = {
	.connect	= kgdboc_reset_connect,
	.disconnect	= kgdboc_reset_disconnect,
	.name		= "kgdboc_reset",
	.id_table	= kgdboc_reset_ids,
};

here count would be 0 and kgdboc would also be rejected.

I agree on the intent of the patch, but these couple of input handlers
should be fixed if they are not already.

Cheers,
Benjamin

> +		pr_err("%s: only one event processing method should be defined (%s)\n",
> +		       __func__, handler->name);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * input_register_handler - register a new input handler
>   * @handler: handler to be registered
> @@ -2530,6 +2550,10 @@ int input_register_handler(struct input_handler *handler)
>  	struct input_dev *dev;
>  	int error;
>  
> +	error = input_handler_check_methods(handler);
> +	if (error)
> +		return error;
> +
>  	error = mutex_lock_interruptible(&input_mutex);
>  	if (error)
>  		return error;
> -- 
> 2.45.2.803.g4e1b14247a-goog
> 

