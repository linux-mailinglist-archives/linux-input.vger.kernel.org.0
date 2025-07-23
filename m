Return-Path: <linux-input+bounces-13652-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E1AB0E791
	for <lists+linux-input@lfdr.de>; Wed, 23 Jul 2025 02:26:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6FF991C28588
	for <lists+linux-input@lfdr.de>; Wed, 23 Jul 2025 00:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA6FB20330;
	Wed, 23 Jul 2025 00:25:58 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com [216.40.44.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382F4139E;
	Wed, 23 Jul 2025 00:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753230358; cv=none; b=ncy8xOBOXGyoAlOH4/x4TKIaGEw3KfEKPj6qX8LWt/tSGP2w2S6Zw4FN/9vTn3+QuYFcyK/YXthObkQoU/XBV+/ARb/TzmnkBf5P6JxrAUfQKCxeptGtu56SxFq3cU6nBf0RvAYqbFL57zSUVwfhLovuKU6yvjVxmS1/ar7qo7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753230358; c=relaxed/simple;
	bh=hul9bcAAdEwyaiKKCTx2o+tVzV4pehmPablumkZG3Y8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D6AzORpyf7ffMz4TzMHGpH42TFuRBotvnmfSkRCuNstPX3LSwl6+jAjRGfT6Iz6SltXrle4aX0QyTfSSeycZFcrW9OpI3e9fP5yGAP8tBKyOkC5HOdn1+1mR3ZTQxuAnE6IlaHaWtFv/6NN1+7vvH8bB4E9DJfEayxpzzSoej9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf04.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id 60783132168;
	Wed, 23 Jul 2025 00:25:54 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf04.hostedemail.com (Postfix) with ESMTPA id E63B920023;
	Wed, 23 Jul 2025 00:25:51 +0000 (UTC)
Date: Tue, 22 Jul 2025 20:25:51 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: WangYuli <wangyuli@uniontech.com>
Cc: dmitry.torokhov@gmail.com, guanwentao@uniontech.com,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, mathieu.desnoyers@efficios.com,
 mhiramat@kernel.org, niecheng1@uniontech.com, wangyuli@deepin.org,
 zhanjun@uniontech.com, Winston Wen <wentao@uniontech.com>
Subject: Re: [PATCH 1/2] input: Add tracepoint support
Message-ID: <20250722202551.1614f59a@gandalf.local.home>
In-Reply-To: <C1C54D7FA3DF3958+20250710073148.3994900-1-wangyuli@uniontech.com>
References: <19571F312EE197A5+20250710072634.3992019-1-wangyuli@uniontech.com>
	<C1C54D7FA3DF3958+20250710073148.3994900-1-wangyuli@uniontech.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: baeic9fzi43tc78qgo3kei49w1y5cezr
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: E63B920023
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX193A/s2WGqzx4pBRRNDJ1gOIKL8W9+9Jf0=
X-HE-Tag: 1753230351-603085
X-HE-Meta: U2FsdGVkX19GNv9QaZQuPy7p4ue5inL2b1yJ9jONT6HKBRFgQczDarm1qZ6KNCZvYsTT8GPK8uvLjgkbdAH+g+YYlt7F3eFqqYlIbB/crZ/VDJtczMSgxWbOaD5GvlS1Eq+lk8o2meGwMvya755aaiRatrtwarFPrKFklaD8KEmufIkm9T5DXov45Di5n78dks1b4sQZUctnDFhWUWTFRT7UfQq8QWjE28GkXDPNfI9VRpw8G1dDvg2W1REluc2SRAcLxbnRq372J82mpnLZDS+KVUOLQYMwVdnAPTzgtQQWnfxAxZA/mwRq+YJimlIUqB6PHOT+nxT9wNQul1KqMya3lTKSeO2kwSMtIS04RCPhxDx8Ee8nAyRkyfrLi6+I4HBgzn93IBBbs6dexRFFm/i5DT0O0Wh4

On Thu, 10 Jul 2025 15:31:38 +0800
WangYuli <wangyuli@uniontech.com> wrote:

> diff --git a/include/trace/events/input.h b/include/trace/events/input.h
> new file mode 100644
> index 000000000000..3c5ffcfb7c8d
> --- /dev/null
> +++ b/include/trace/events/input.h
> @@ -0,0 +1,251 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* input tracepoints
> + *
> + * Copyright (C) 2025 WangYuli <wangyuli@uniontech.com>
> + */
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM input
> +
> +#if !defined(_TRACE_INPUT_H) || defined(TRACE_HEADER_MULTI_READ)
> +#define _TRACE_INPUT_H
> +
> +#include <linux/tracepoint.h>
> +#include <linux/input.h>
> +
> +/**
> + * input_event - called when an input event is processed
> + * @dev: input device that generated the event
> + * @type: event type (EV_KEY, EV_REL, EV_ABS, etc.)
> + * @code: event code within the type
> + * @value: event value
> + *
> + * This tracepoint fires for every input event processed by the input core.
> + * It can be used to monitor input device activity and debug input issues.
> + */
> +TRACE_EVENT(
> +	input_event,
> +
> +	TP_PROTO(struct input_dev *dev, unsigned int type, unsigned int code,
> +		 int value),
> +
> +	TP_ARGS(dev, type, code, value),
> +
> +	TP_STRUCT__entry(__string(name, dev->name ?: "unknown") __field(
> +		unsigned int, type) __field(unsigned int, code)
> +				 __field(int, value) __field(u16, bustype)
> +					 __field(u16, vendor)
> +						 __field(u16, product)),
> +

The contents of the tracepoints in the subsystems are determined by the
subsystem maintainers, but please follow the tracepoint formatting. The
above is horrible. It should look like a structure layout. One wouldn't
write:

struct entry { char *name;
		unsigned int type; unsigned int code;
			int value; u16 bustype;
				u16 vendor;
					u16 product; };

That's what the above looks like. It should be instead:

	TP_STRUCT__entry(
		__string(	name,		dev->name ?: "unknown"	)
		__field(	unsigned int,	type			)
		__field(	unsigned int,	code			)
		__field(	int,		value			)
		__field(	u16,		bustype			)
		__field(	u16,		vendor			)
		__field(	u16,		product			)
	),

So the fields can be easily visible and easily reviewed.


> +	TP_fast_assign(__assign_str(name); __entry->type = type;
> +		       __entry->code = code; __entry->value = value;
> +		       __entry->bustype = dev->id.bustype;
> +		       __entry->vendor = dev->id.vendor;
> +		       __entry->product = dev->id.product;),
> +
> +	TP_printk(
> +		"dev=%s type=%u code=%u value=%d bus=%04x vendor=%04x product=%04x",
> +		__get_str(name), __entry->type, __entry->code, __entry->value,
> +		__entry->bustype, __entry->vendor, __entry->product));
> +
> +/**
> + * input_device_register - called when an input device is registered
> + * @dev: input device being registered
> + *
> + * This tracepoint fires when a new input device is registered with the
> + * input subsystem. Useful for monitoring device hotplug events.
> + */
> +TRACE_EVENT(
> +	input_device_register,
> +
> +	TP_PROTO(struct input_dev *dev),
> +
> +	TP_ARGS(dev),
> +
> +	TP_STRUCT__entry(__string(name, dev->name ?: "unknown") __string(
> +		phys, dev->phys ?: "") __field(u16, bustype)
> +				 __field(u16, vendor) __field(u16, product)
> +					 __field(u16, version)),

Same here.

> +
> +	TP_fast_assign(__assign_str(name); __assign_str(phys);
> +		       __entry->bustype = dev->id.bustype;
> +		       __entry->vendor = dev->id.vendor;
> +		       __entry->product = dev->id.product;
> +		       __entry->version = dev->id.version;),
> +
> +	TP_printk(
> +		"dev=%s phys=%s bus=%04x vendor=%04x product=%04x version=%04x",
> +		__get_str(name), __get_str(phys), __entry->bustype,
> +		__entry->vendor, __entry->product, __entry->version));
> +
> +/**
> + * input_device_unregister - called when an input device is unregistered
> + * @dev: input device being unregistered
> + *
> + * This tracepoint fires when an input device is unregistered from the
> + * input subsystem. Useful for monitoring device hotplug events.
> + */
> +TRACE_EVENT(input_device_unregister,
> +
> +	    TP_PROTO(struct input_dev *dev),
> +
> +	    TP_ARGS(dev),
> +
> +	    TP_STRUCT__entry(__string(name, dev->name ?: "unknown") __string(
> +		    phys, dev->phys ?: "") __field(u16, bustype)
> +				     __field(u16, vendor)
> +					     __field(u16, product)),

ditto.

> +
> +	    TP_fast_assign(__assign_str(name); __assign_str(phys);
> +			   __entry->bustype = dev->id.bustype;
> +			   __entry->vendor = dev->id.vendor;
> +			   __entry->product = dev->id.product;),
> +
> +	    TP_printk("dev=%s phys=%s bus=%04x vendor=%04x product=%04x",
> +		      __get_str(name), __get_str(phys), __entry->bustype,
> +		      __entry->vendor, __entry->product));
> +
> +/**
> + * input_handler_connect - called when an input handler connects to a device
> + * @handler: input handler
> + * @dev: input device
> + * @minor: assigned minor number (if applicable)
> + *
> + * This tracepoint fires when an input handler (like evdev, mousedev) connects
> + * to an input device, creating a new input handle.
> + */
> +TRACE_EVENT(input_handler_connect,
> +
> +	    TP_PROTO(struct input_handler *handler, struct input_dev *dev,
> +		     int minor),
> +
> +	    TP_ARGS(handler, dev, minor),
> +
> +	    TP_STRUCT__entry(__string(handler_name, handler->name)
> +				     __string(dev_name, dev->name ?: "unknown")
> +					     __field(int, minor)),

ditto.

> +
> +	    TP_fast_assign(__assign_str(handler_name); __assign_str(dev_name);
> +			   __entry->minor = minor;),
> +
> +	    TP_printk("handler=%s dev=%s minor=%d", __get_str(handler_name),
> +		      __get_str(dev_name), __entry->minor));
> +
> +/**
> + * input_grab_device - called when a device is grabbed by a handler
> + * @dev: input device being grabbed
> + * @handle: input handle doing the grab
> + *
> + * This tracepoint fires when an input device is grabbed exclusively
> + * by an input handler, typically for security or special processing.
> + */
> +TRACE_EVENT(input_grab_device,
> +
> +	    TP_PROTO(struct input_dev *dev, struct input_handle *handle),
> +
> +	    TP_ARGS(dev, handle),
> +
> +	    TP_STRUCT__entry(__string(dev_name, dev->name ?: "unknown")
> +				     __string(handler_name,
> +					      handle->handler->name)),

ditto.

> +
> +	    TP_fast_assign(__assign_str(dev_name); __assign_str(handler_name);),
> +
> +	    TP_printk("dev=%s grabbed_by=%s", __get_str(dev_name),
> +		      __get_str(handler_name)));
> +
> +/**
> + * input_release_device - called when a grabbed device is released
> + * @dev: input device being released
> + * @handle: input handle releasing the grab
> + *
> + * This tracepoint fires when an input device grab is released.
> + */
> +TRACE_EVENT(input_release_device,
> +
> +	    TP_PROTO(struct input_dev *dev, struct input_handle *handle),
> +
> +	    TP_ARGS(dev, handle),
> +
> +	    TP_STRUCT__entry(__string(dev_name, dev->name ?: "unknown")
> +				     __string(handler_name,
> +					      handle->handler->name)),

ditto.

> +
> +	    TP_fast_assign(__assign_str(dev_name); __assign_str(handler_name);),
> +
> +	    TP_printk("dev=%s released_by=%s", __get_str(dev_name),
> +		      __get_str(handler_name)));
> +
> +DECLARE_EVENT_CLASS(input_device_state,
> +
> +		    TP_PROTO(struct input_dev *dev),
> +
> +		    TP_ARGS(dev),
> +
> +		    TP_STRUCT__entry(__string(name, dev->name ?: "unknown")
> +					     __field(unsigned int, users)
> +						     __field(bool, inhibited)),

ditto.

-- Steve

> +
> +		    TP_fast_assign(__assign_str(name);
> +				   __entry->users = dev->users;
> +				   __entry->inhibited = dev->inhibited;),
> +
> +		    TP_printk("dev=%s users=%u inhibited=%s", __get_str(name),
> +			      __entry->users,
> +			      __entry->inhibited ? "true" : "false"));
> +

