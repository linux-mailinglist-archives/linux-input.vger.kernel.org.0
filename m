Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D01E9487EDE
	for <lists+linux-input@lfdr.de>; Fri,  7 Jan 2022 23:18:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231127AbiAGWSI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 7 Jan 2022 17:18:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230393AbiAGWSI (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 7 Jan 2022 17:18:08 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5437AC061574
        for <linux-input@vger.kernel.org>; Fri,  7 Jan 2022 14:18:08 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id s15so5912276plg.12
        for <linux-input@vger.kernel.org>; Fri, 07 Jan 2022 14:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TAJmGYC/D26EnQvrs8mWkPfX2wxh4O0uPeI7CcvLKwc=;
        b=CxU1HbjZEaEbQVntmTRf09rTujEopSoHZ3XIxDNQBid5ustoHjWbAi9v/V9g3Kq/uE
         Ecz0F6IPdiOaIuvlpI0fSCs8RX5FUFjPi3LnHtulO8a/8jKAHIgPYSW3L1PlVEjca7tS
         iF8jr61GkWejZWPF5bFBSmg7DMbHAgoPfSzUHr6UMqJAtGf8RjrZGHUxoIsGR+hWq3U1
         k0HBHYaYpXI+mXTKvKiRY1C9k/hXYeTWmNHpY569PvDG/MdEIB12lYbrk4a21s65o2Ik
         OsQIYDpvtTQVRsfZy+eWx9Rd0KV5I+4AlAy/6vd/NbCIcJN+Z4hnZuf0atuebZDZWiLp
         GXAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TAJmGYC/D26EnQvrs8mWkPfX2wxh4O0uPeI7CcvLKwc=;
        b=Re40D11jVF4zyl7Ie6GsXk0zeq5mPCXnK5HVdoFh5peNHfd27U7JCJtU8lqwzXMZbh
         27rX9tPwvZDdSU9fwxkWrfYPEW52kDyWnscoKiYtnWdMAEI4xH3heMLDq3C/uD1c5VDE
         QV/wWAspxK/aZmlwjsDxEfn8tFfJFTHo1xESzlzoki5FvN0iIczzbbI51Wh2uGZ9MDkD
         /yzhlIBQhPPnAk69vafyVRW2/ZRn26zkCQXvBGI6wy1b00CqCzBusnu+C9Ic5K961Jdp
         s50j79vRmVJ2nocXrFGUSrY0dNKRrCHNxcfopIaREzhdgn7Pu0zwMrn1v0U4Od4499Rf
         3jGw==
X-Gm-Message-State: AOAM532hozFltr+y/fQwnI+g4N4cXU1UjrJUeoASNHAodcrpR+m/kL3s
        e9lU51BGu2VX5Z0jdkLrc8g=
X-Google-Smtp-Source: ABdhPJyuKTvmZR4SUbkrRUF6qylAf0RCMn8sO988oWz40b0yNSQPT8u0b03SPaUzHuOCGF9BLYZYwQ==
X-Received: by 2002:a17:90b:14e:: with SMTP id em14mr15791294pjb.12.1641593887628;
        Fri, 07 Jan 2022 14:18:07 -0800 (PST)
Received: from google.com ([2620:15c:202:201:4a85:a3d:72a9:2009])
        by smtp.gmail.com with ESMTPSA id k2sm7013353pfc.53.2022.01.07.14.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 14:18:06 -0800 (PST)
Date:   Fri, 7 Jan 2022 14:18:04 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Angela Czubak <acz@semihalf.com>
Cc:     linux-input@vger.kernel.org, upstream@semihalf.com
Subject: Re: [PATCH 04/18] HID: haptic: introduce hid_haptic_device
Message-ID: <Ydi8HAdQWjEOn+Jj@google.com>
References: <20211221191743.1893185-1-acz@semihalf.com>
 <20211221191743.1893185-5-acz@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211221191743.1893185-5-acz@semihalf.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Dec 21, 2021 at 07:17:29PM +0000, Angela Czubak wrote:
> Define a new structure that contains simple haptic device configuration
> as well as current state.
> 
> Signed-off-by: Angela Czubak <acz@semihalf.com>
> ---
>  drivers/hid/Kconfig      |  4 +++
>  drivers/hid/Makefile     |  1 +
>  drivers/hid/hid-haptic.c | 10 ++++++
>  drivers/hid/hid-haptic.h | 68 ++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 83 insertions(+)
>  create mode 100644 drivers/hid/hid-haptic.c
>  create mode 100644 drivers/hid/hid-haptic.h
> 
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index a7c78ac96270..8d1eb4491a7f 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -89,6 +89,10 @@ config HID_GENERIC
>  
>  	If unsure, say Y.
>  
> +config HID_HAPTIC
> +	bool
> +	default n

'n' is the default, no need to have it explicit.

> +
>  menu "Special HID drivers"
>  	depends on HID
>  
> diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
> index 55a6fa3eca5a..65d54ccd4574 100644
> --- a/drivers/hid/Makefile
> +++ b/drivers/hid/Makefile
> @@ -4,6 +4,7 @@
>  #
>  hid-y			:= hid-core.o hid-input.o hid-quirks.o
>  hid-$(CONFIG_DEBUG_FS)		+= hid-debug.o
> +hid-$(CONFIG_HID_HAPTIC)	+= hid-haptic.o
>  
>  obj-$(CONFIG_HID)		+= hid.o
>  obj-$(CONFIG_UHID)		+= uhid.o
> diff --git a/drivers/hid/hid-haptic.c b/drivers/hid/hid-haptic.c
> new file mode 100644
> index 000000000000..0910d8af9f38
> --- /dev/null
> +++ b/drivers/hid/hid-haptic.c
> @@ -0,0 +1,10 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + *  HID Haptic support for Linux
> + *
> + *  Copyright (c) 2021 Angela Czubak
> + */
> +
> +/*
> + */

What is this comment block for? Actually I do not see why this needs to
be a separate patch.

> +#include "hid-haptic.h"
> diff --git a/drivers/hid/hid-haptic.h b/drivers/hid/hid-haptic.h
> new file mode 100644
> index 000000000000..41f19cd22f75
> --- /dev/null
> +++ b/drivers/hid/hid-haptic.h
> @@ -0,0 +1,68 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + *  HID Haptic support for Linux
> + *
> + *  Copyright (c) 2021 Angela Czubak
> + */
> +
> +/*
> + */
> +
> +
> +#include <linux/hid.h>
> +
> +#define HID_HAPTIC_ORDINAL_WAVEFORMNONE 1
> +#define HID_HAPTIC_ORDINAL_WAVEFORMSTOP 2
> +
> +#define HID_HAPTIC_PRESS_THRESH 200
> +#define HID_HAPTIC_RELEASE_THRESH 180
> +
> +#define HID_HAPTIC_MODE_DEVICE 0
> +#define HID_HAPTIC_MODE_KERNEL 1
> +
> +struct hid_haptic_effect {
> +	__u8 *report_buf;

This is a matter of preference, but in kernel we normally use u8, s16,
etc, and underscored versions are for headers that are part of uapi.

> +	struct input_dev *input_dev;
> +	struct work_struct work;
> +	struct list_head control;
> +	struct mutex control_mutex;
> +};
> +
> +struct hid_haptic_effect_node {
> +	struct list_head node;
> +	struct file *file;
> +};
> +
> +struct hid_haptic_device {
> +	struct input_dev *input_dev;
> +	struct hid_device *hdev;
> +	struct hid_report *auto_trigger_report;
> +	struct mutex auto_trigger_mutex;
> +	struct workqueue_struct *wq;
> +	struct hid_report *manual_trigger_report;
> +	struct mutex manual_trigger_mutex;
> +	size_t manual_trigger_report_len;
> +	int pressed_state;
> +	__s32 pressure_sum;
> +	__s32 force_logical_minimum;
> +	__s32 force_physical_minimum;
> +	__s32 force_resolution;
> +	__u32 press_threshold;
> +	__u32 release_threshold;
> +	__u32 mode;
> +	__u32 default_auto_trigger;
> +	__u32 vendor_page;
> +	__u32 vendor_id;
> +	__u32 max_waveform_id;
> +	__u32 max_duration_id;
> +	__u16 *hid_usage_map;
> +	__u32 *duration_map;
> +	__u16 press_ordinal_orig;
> +	__u16 press_ordinal_cur;
> +	__u16 release_ordinal_orig;
> +	__u16 release_ordinal_cur;
> +#define HID_HAPTIC_RELEASE_EFFECT_ID 0
> +#define HID_HAPTIC_PRESS_EFFECT_ID 1

Why these definitions are here?

> +	struct hid_haptic_effect *effect;
> +	struct hid_haptic_effect stop_effect;
> +};
> -- 
> 2.34.1.307.g9b7440fafd-goog
> 

Thanks.

-- 
Dmitry
