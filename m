Return-Path: <linux-input+bounces-4911-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F02B492ACF4
	for <lists+linux-input@lfdr.de>; Tue,  9 Jul 2024 02:08:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A58D2282039
	for <lists+linux-input@lfdr.de>; Tue,  9 Jul 2024 00:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71F83394;
	Tue,  9 Jul 2024 00:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b/oNas2D"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F88382;
	Tue,  9 Jul 2024 00:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720483703; cv=none; b=Gn/T7CUTzL4iqPLsNbro5MF3gDbBHucoP5ie7MLIbns73VYifHVgbHXPTVBScmxuvH8q8ejbO4tHE4qqm8A2GzGzpiT/SXfNgl9ihDM+R9JCpz+pWFEslmYlmPcP3OvZ8ZwXcfLeiir0dtodqYj05iZayVQQAUHuSC0Kx8Z0MiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720483703; c=relaxed/simple;
	bh=gaVdvvGicT567vVFCczRy1l1kJqIdBBzeUuU5sLRwdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kg4icUXfuVxf8gUzC1Drl4xhKTXGkaRZbE0uINtIiXYpa3g9Zvk5UNpqRN1xwlkz0u9IQeuK0GeMraYAL2aXAGbfBnHlhEg3nc6etEdMIhb3QEoIdihN+q19KnDsZRZ6jvc/NInFTg+46m9e468Q3kciXWAGQPqoYFDjir6Uvnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b/oNas2D; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3839d74a2abso15568665ab.1;
        Mon, 08 Jul 2024 17:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720483701; x=1721088501; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PQyUTvav3geX5M69VveKYVAii5SPAUbkEumnvWX/cP8=;
        b=b/oNas2DVJOBFSPnch6aKNzR2a2ha//oeQmV053kyc65mglrvHvY5BpF2nBN9U7qe6
         Klnee6J5Jzz7UOumFYji8JcH16XxbXCDGJ/TfNrwOytJ5i7OluqroaZCte84QyISJc/6
         LvqVUgUgk5pQy3VJ83lLRGZFPn1JyNi4sBsnr9se4YN2po30z1R8pXoVLbzygXsMjPPQ
         JzC57xlLP4JM3qj/Ipzp0J1W/QcPuiOWd/7FhpshSCez8Ypod6geElAgn1g2MEAoKkCE
         UJgCSRPsHNAk0FXTSUAvXBYx3fKEiqwHUp5cWkeYQF0JPd0BVfmBVq9v8Y8Df+pH5XVe
         qbMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720483701; x=1721088501;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PQyUTvav3geX5M69VveKYVAii5SPAUbkEumnvWX/cP8=;
        b=t2xnLp/Uvah1mgUsywVJS3nc8wF+/XFg0gjBTQUhaJUa40ZwMhkLw1295ihh+mpb6J
         82tRfscDSKnlvl8PLN7Z4kuFsoVzSLKDzMZowCpUXNGbgRh8gOS7hjiL2KnSk/acdgm9
         7W30OxmEUvK3hT/gTq66hSDX3uRH8Ce5WEpf1UmHklr66ylNA2GkLeA1sdm4VEzw1k91
         4QNix8RD39xoeynsLd9V4Qo487HRqmgtRcq2y5kSAkMqi2pM0XTJf3oanGnCNRKQh1qk
         xdTfppjpI8pCuawvJgWEiNx2cNnhg8fX3Fsds0cPb0CgQVYUiOkosFdfNkpYqcWu06NX
         gj2g==
X-Forwarded-Encrypted: i=1; AJvYcCVGwdmCQHoTmiyw4tDmHpzwfYZEMCpR+xWfD5U8hY7AZga8R3C+HcLkPm/VeIrgmq0lwVKTyYBXpQ7rXgsSDJoSUGG36v50neTh9yQ4szpSWC+YcQjuxGE7smne3m4l9433bqj6AwzNRDmIpwTY+4EcKRgNb/niDqDGLMyrlxv+0ZtOA11F
X-Gm-Message-State: AOJu0Yw20dQz3ciGnkRlbYYL+A/j9/EAOGVGcQuRNVJ2aaO5Cw2FiPW+
	2Chesoi8HSwKM3ybP9BV1qmtr6Ta6j7D/SaT0Q0tv4vFjIMylvwG
X-Google-Smtp-Source: AGHT+IFIc2Ri20+2OjJjk5qK4wEgUHT9NuZc8wPegHJyVXr0NxVgD1EFTld9Pwz7Waa7D2DKsJyo7Q==
X-Received: by 2002:a92:c26d:0:b0:376:1fae:463a with SMTP id e9e14a558f8ab-38a5a360459mr10611895ab.32.1720483700528;
        Mon, 08 Jul 2024 17:08:20 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:922a:af36:b3d9:2eac])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b4397f3c6sm462938b3a.157.2024.07.08.17.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 17:08:20 -0700 (PDT)
Date: Mon, 8 Jul 2024 17:08:17 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Javier Carrasco <javier.carrasco@wolfvision.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bastian Hecht <hechtb@gmail.com>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jeff LaBundy <jeff@labundy.com>
Subject: Re: [PATCH v10 2/4] Input: touch-overlay - Add touchscreen overlay
 handling
Message-ID: <Zox_cVYsErrLu4Mq@google.com>
References: <20240626-feature-ts_virtobj_patch-v10-0-873ad79bb2c9@wolfvision.net>
 <20240626-feature-ts_virtobj_patch-v10-2-873ad79bb2c9@wolfvision.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240626-feature-ts_virtobj_patch-v10-2-873ad79bb2c9@wolfvision.net>

Hi Javier,

On Wed, Jun 26, 2024 at 11:56:14AM +0200, Javier Carrasco wrote:
> Some touch devices provide mechanical overlays with different objects
> like buttons or clipped touchscreen surfaces.

Thank you for your work. I think it is pretty much ready to be merged,
just a few small comments:

> 
> In order to support these objects, add a series of helper functions
> to the input subsystem to transform them into overlay objects via
> device tree nodes.
> 
> These overlay objects consume the raw touch events and report the
> expected input events depending on the object properties.

So if we have overlays and also want to invert/swap axis then the
overlays should be processed first and only then
touchscreen_set_mt_pos() or touchscreen_report_pos() should be called?

But then it will not work if we need help frm the input core to assign
slots in cases when touch controller does not implement [reliable]
contact tracing/identification.

I think this all needs to be clarified.

> 
> Note that the current implementation allows for multiple definitions
> of touchscreen areas (regions that report touch events), but only the
> first one will be used for the touchscreen device that the consumers
> typically provide.
> Should the need for multiple touchscreen areas arise, additional
> touchscreen devices would be required at the consumer side.
> There is no limitation in the number of touch areas defined as buttons.
> 
> Reviewed-by: Jeff LaBundy <jeff@labundy.com>
> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>

> +int touch_overlay_map(struct list_head *list, struct input_dev *input)
> +{
> +	struct fwnode_handle *overlay, *fw_segment;
> +	struct device *dev = input->dev.parent;
> +	struct touch_overlay_segment *segment;
> +	int error = 0;
> +
> +	overlay = device_get_named_child_node(dev, "touch-overlay");

We can annotate this as

	struct fwnode_handle *overlay __free(fwnode_handle) = 
		device_get_named_child_node(dev, "touch-overlay");

> +	if (!overlay)
> +		return 0;
> +
> +	fwnode_for_each_available_child_node(overlay, fw_segment) {
> +		segment = devm_kzalloc(dev, sizeof(*segment), GFP_KERNEL);
> +		if (!segment) {
> +			fwnode_handle_put(fw_segment);
> +			error = -ENOMEM;

return -ENOMEM;

> +			break;
> +		}
> +		error = touch_overlay_get_segment(fw_segment, segment, input);
> +		if (error) {
> +			fwnode_handle_put(fw_segment);

return error;

> +			break;
> +		}
> +		list_add_tail(&segment->list, list);
> +	}
> +	fwnode_handle_put(overlay);

Drop.

> +
> +	return error;

return 0;

> +}
> +EXPORT_SYMBOL(touch_overlay_map);
> +
> +/**
> + * touch_overlay_get_touchscreen_abs - get abs size from the touchscreen area.
> + * @list: pointer to the list that holds the segments
> + * @x: horizontal abs
> + * @y: vertical abs
> + */
> +void touch_overlay_get_touchscreen_abs(struct list_head *list, u16 *x, u16 *y)
> +{
> +	struct touch_overlay_segment *segment;
> +	struct list_head *ptr;
> +
> +	list_for_each(ptr, list) {
> +		segment = list_entry(ptr, struct touch_overlay_segment, list);
> +		if (!segment->key) {
> +			*x = segment->x_size - 1;
> +			*y = segment->y_size - 1;
> +			break;
> +		}
> +	}
> +}
> +EXPORT_SYMBOL(touch_overlay_get_touchscreen_abs);
> +
> +static bool touch_overlay_segment_event(struct touch_overlay_segment *seg,
> +					u32 x, u32 y)
> +{
> +	if (!seg)
> +		return false;

This is a static function in the module, we are not passing NULL
segments to it ever. Such tests should be done on API boundary.

> +
> +	if (x >= seg->x_origin && x < (seg->x_origin + seg->x_size) &&
> +	    y >= seg->y_origin && y < (seg->y_origin + seg->y_size))
> +		return true;
> +
> +	return false;
> +}
> +
> +/**
> + * touch_overlay_mapped_touchscreen - check if a touchscreen area is mapped
> + * @list: pointer to the list that holds the segments
> + *
> + * Returns true if a touchscreen area is mapped or false otherwise.
> + */
> +bool touch_overlay_mapped_touchscreen(struct list_head *list)
> +{
> +	struct touch_overlay_segment *segment;
> +	struct list_head *ptr;
> +
> +	list_for_each(ptr, list) {
> +		segment = list_entry(ptr, struct touch_overlay_segment, list);
> +		if (!segment->key)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +EXPORT_SYMBOL(touch_overlay_mapped_touchscreen);
> +
> +static bool touch_overlay_event_on_ts(struct list_head *list, u32 *x, u32 *y)
> +{
> +	struct touch_overlay_segment *segment;
> +	struct list_head *ptr;
> +	bool valid_touch = true;
> +
> +	if (!x || !y)
> +		return false;
> +
> +	list_for_each(ptr, list) {
> +		segment = list_entry(ptr, struct touch_overlay_segment, list);
> +		if (segment->key)
> +			continue;
> +
> +		if (touch_overlay_segment_event(segment, *x, *y)) {
> +			*x -= segment->x_origin;
> +			*y -= segment->y_origin;
> +			return true;
> +		}
> +		/* ignore touch events outside the defined area */
> +		valid_touch = false;
> +	}
> +
> +	return valid_touch;
> +}
> +
> +static bool touch_overlay_button_event(struct input_dev *input,
> +				       struct touch_overlay_segment *segment,
> +				       const u32 *x, const u32 *y, u32 slot)
> +{
> +	bool contact = x && y;
> +
> +	if (segment->slot == slot && segment->pressed) {
> +		/* button release */
> +		if (!contact) {
> +			segment->pressed = false;
> +			input_report_key(input, segment->key, false);
> +			input_sync(input);

Do we really need to emit sync here? Can we require/rely on the driver
calling us to emit input_sync() once it's done processing current
frame/packet?

> +			return true;
> +		}
> +
> +		/* sliding out of the button releases it */
> +		if (!touch_overlay_segment_event(segment, *x, *y)) {
> +			segment->pressed = false;
> +			input_report_key(input, segment->key, false);
> +			input_sync(input);
> +			/* keep available for a possible touch event */
> +			return false;
> +		}
> +		/* ignore sliding on the button while pressed */
> +		return true;
> +	} else if (contact && touch_overlay_segment_event(segment, *x, *y)) {
> +		segment->pressed = true;
> +		segment->slot = slot;
> +		input_report_key(input, segment->key, true);
> +		input_sync(input);
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
> +/**
> + * touch_overlay_process_event - process input events according to the overlay
> + * mapping. This function acts as a filter to release the calling driver from
> + * the events that are either related to overlay buttons or out of the overlay
> + * touchscreen area, if defined.
> + * @list: pointer to the list that holds the segments
> + * @input: pointer to the input device associated to the event
> + * @x: pointer to the x coordinate (NULL if not available - no contact)
> + * @y: pointer to the y coordinate (NULL if not available - no contact)

Would it be better to have a separate argument communicating slot state
(contact/no contact)?

> + * @slot: slot associated to the event

What if we are not dealing with an MT device? Can we say that they
should use slot 0 or maybe -1?

> + *
> + * Returns true if the event was processed (reported for valid key events
> + * and dropped for events outside the overlay touchscreen area) or false
> + * if the event must be processed by the caller. In that case this function
> + * shifts the (x,y) coordinates to the overlay touchscreen axis if required.
> + */
> +bool touch_overlay_process_event(struct list_head *list,
> +				 struct input_dev *input,
> +				 u32 *x, u32 *y, u32 slot)
> +{
> +	struct touch_overlay_segment *segment;
> +	struct list_head *ptr;
> +
> +	/*
> +	 * buttons must be prioritized over overlay touchscreens to account for
> +	 * overlappings e.g. a button inside the touchscreen area.
> +	 */
> +	list_for_each(ptr, list) {
> +		segment = list_entry(ptr, struct touch_overlay_segment, list);
> +		if (segment->key &&
> +		    touch_overlay_button_event(input, segment, x, y, slot))
> +			return true;
> +	}
> +
> +	/*
> +	 * valid touch events on the overlay touchscreen are left for the client
> +	 * to be processed/reported according to its (possibly) unique features.
> +	 */
> +	return !touch_overlay_event_on_ts(list, x, y);
> +}
> +EXPORT_SYMBOL(touch_overlay_process_event);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Helper functions for overlay objects on touch devices");
> diff --git a/include/linux/input/touch-overlay.h b/include/linux/input/touch-overlay.h
> new file mode 100644
> index 000000000000..cef05c46000d
> --- /dev/null
> +++ b/include/linux/input/touch-overlay.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2023 Javier Carrasco <javier.carrasco@wolfvision.net>
> + */
> +
> +#ifndef _TOUCH_OVERLAY
> +#define _TOUCH_OVERLAY
> +
> +#include <linux/types.h>
> +
> +struct input_dev;
> +
> +int touch_overlay_map(struct list_head *list, struct input_dev *input);
> +
> +void touch_overlay_get_touchscreen_abs(struct list_head *list, u16 *x, u16 *y);
> +
> +bool touch_overlay_mapped_touchscreen(struct list_head *list);
> +
> +bool touch_overlay_process_event(struct list_head *list, struct input_dev *input,
> +				 u32 *x, u32 *y, u32 slot);
> +
> +#endif
> 
> -- 
> 2.40.1
> 

Thanks.

-- 
Dmitry

