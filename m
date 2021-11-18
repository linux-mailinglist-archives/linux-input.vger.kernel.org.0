Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E00224557B6
	for <lists+linux-input@lfdr.de>; Thu, 18 Nov 2021 10:06:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245023AbhKRJJJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 18 Nov 2021 04:09:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245080AbhKRJIP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 18 Nov 2021 04:08:15 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F7A5C061200
        for <linux-input@vger.kernel.org>; Thu, 18 Nov 2021 01:05:15 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id g14so23843447edb.8
        for <linux-input@vger.kernel.org>; Thu, 18 Nov 2021 01:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=lXnv3StCz6QOJgzKo0TU0WtB9sNFJ2NEu70wfyrmomU=;
        b=HSCFnNZdlXyl+vXxXJE2gHtqTi/WFPXBQfVGJRTbDNCC8d3FL37LjuRLAH3PllB6C7
         qAGaSKiJ6Dw6zvW8LfkEfmdVBSbxmIA39VqrLicnQ0PzgoUV8+BI+kw5BKGYaaRKm+PN
         ty4/h2ion6eBIk7tnQ3/Up6okNbJYrOHT6L5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=lXnv3StCz6QOJgzKo0TU0WtB9sNFJ2NEu70wfyrmomU=;
        b=rKC0Zw/pYRsLmTAgfEKUPm+nhwKFo9AY8ndChNHJ1jn8rUA3hUrqXSCLB77qZ2IXI8
         u9Sn6fcr3JcnSFkn/PO9jPh/TTno8OVRBXgQhOx2omX9+TQzougYKUlIkGE1YQrlb/C1
         +znNm9g3LSQuRowv6Psi/gP755EcMRFM4TAp/Ooxpvv+EuqZvcXNH5G6W5WdjDHQh7fL
         7dGRrW3EDehPK3TIVA14mHtaYaJBWCDZr0HHfVdHn4ydyACSwz6H/OM5emlXqcU7mSW7
         cuIGhMaxA1CZeHurpnTPOuXmUz5bfdQdOQkFCozVLPOezqwp+SAmxEhVyGJggPB/QAnX
         lcxw==
X-Gm-Message-State: AOAM5308EuCRSG+uPUQqOFJqFQaOpjCpF/2whdQfqKB30n6b23+fEey6
        BP2ap4iVJgTFI2SB6tS8jctRxw==
X-Google-Smtp-Source: ABdhPJylQ8JBdXxl0Xb2D3tJ7cosBlu1Mj8PTO+yC7edF/HmQtFMt97ubDhZlPf8+OCdHzz0n+uziA==
X-Received: by 2002:a05:6402:2751:: with SMTP id z17mr8692761edd.296.1637226314076;
        Thu, 18 Nov 2021 01:05:14 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id v10sm1229647edt.24.2021.11.18.01.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 01:05:13 -0800 (PST)
Date:   Thu, 18 Nov 2021 10:05:11 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Brian Norris <briannorris@chromium.org>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Doug Anderson <dianders@chromium.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Rob Clark <robdclark@gmail.com>, linux-input@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/2] drm/input_helper: Add new input-handling helper
Message-ID: <YZYXR4u6VBEi4qnM@phenom.ffwll.local>
Mail-Followup-To: Brian Norris <briannorris@chromium.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Doug Anderson <dianders@chromium.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Rob Clark <robdclark@gmail.com>, linux-input@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org
References: <20211117224841.3442482-1-briannorris@chromium.org>
 <20211117144807.v2.1.I09b516eff75ead160a6582dd557e7e7e900c9e8e@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211117144807.v2.1.I09b516eff75ead160a6582dd557e7e7e900c9e8e@changeid>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Nov 17, 2021 at 02:48:40PM -0800, Brian Norris wrote:
> A variety of applications have found it useful to listen to
> user-initiated input events to make decisions within a DRM driver, given
> that input events are often the first sign that we're going to start
> doing latency-sensitive activities:
> 
>  * Panel self-refresh: software-directed self-refresh (e.g., with
>    Rockchip eDP) is especially latency sensitive. In some cases, it can
>    take 10s of milliseconds for a panel to exit self-refresh, which can
>    be noticeable. Rockchip RK3399 Chrome OS systems have always shipped
>    with an input_handler boost, that preemptively exits self-refresh
>    whenever there is input activity.
> 
>  * GPU drivers: on GPU-accelerated desktop systems, we may need to
>    render new frames immediately after user activity. Powering up the
>    GPU can take enough time that it is worthwhile to start this process
>    as soon as there is input activity. Many Chrome OS systems also ship
>    with an input_handler boost that powers up the GPU.
> 
> This patch provides a small helper library that abstracts some of the
> input-subsystem details around picking which devices to listen to, and
> some other boilerplate. This will be used in the next patch to implement
> the first bullet: preemptive exit for panel self-refresh.
> 
> Bits of this are adapted from code the Android and/or Chrome OS kernels
> have been carrying for a while.
> 
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
> 
> Changes in v2:
>  - Honor CONFIG_INPUT dependency, via new CONFIG_DRM_INPUT_HELPER
>  - Remove void*; users should use container_of()
>  - Document the callback context
> 
>  drivers/gpu/drm/Kconfig            |   6 ++
>  drivers/gpu/drm/Makefile           |   2 +
>  drivers/gpu/drm/drm_input_helper.c | 143 +++++++++++++++++++++++++++++
>  include/drm/drm_input_helper.h     |  41 +++++++++

Please add documentation for this and include it under
Documentation/gpu/drm-kms-helpers.rst in a suitable place.

Standards for core code should be overview DOC: with references to key
functions/structs, and all driver visible structs, functions (static
inline in header or exported) fully documented.

>  4 files changed, 192 insertions(+)
>  create mode 100644 drivers/gpu/drm/drm_input_helper.c
>  create mode 100644 include/drm/drm_input_helper.h
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index fb144617055b..381476b10a9d 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -79,9 +79,15 @@ config DRM_DEBUG_SELFTEST
>  
>  	  If in doubt, say "N".
>  
> +config DRM_INPUT_HELPER
> +	def_bool y
> +	depends on DRM_KMS_HELPER
> +	depends on INPUT

Uh please no configs for each thing, it just makes everything more
complex. Do we _really_ need this?

> +
>  config DRM_KMS_HELPER
>  	tristate
>  	depends on DRM
> +	select DRM_INPUT_HELPER if INPUT
>  	help
>  	  CRTC helpers for KMS drivers.
>  
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 1c41156deb5f..9a6494aa45e6 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -56,6 +56,8 @@ drm_kms_helper-y := drm_bridge_connector.o drm_crtc_helper.o drm_dp_helper.o \
>  		drm_atomic_state_helper.o drm_damage_helper.o \
>  		drm_format_helper.o drm_self_refresh_helper.o drm_rect.o
>  
> +drm_kms_helper-$(CONFIG_DRM_INPUT_HELPER) += drm_input_helper.o
> +
>  drm_kms_helper-$(CONFIG_DRM_PANEL_BRIDGE) += bridge/panel.o
>  drm_kms_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fb_helper.o
>  drm_kms_helper-$(CONFIG_DRM_KMS_CMA_HELPER) += drm_fb_cma_helper.o
> diff --git a/drivers/gpu/drm/drm_input_helper.c b/drivers/gpu/drm/drm_input_helper.c
> new file mode 100644
> index 000000000000..470f90865c7c
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_input_helper.c
> @@ -0,0 +1,143 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2021 Google, Inc.
> + */
> +#include <linux/input.h>
> +#include <linux/slab.h>
> +
> +#include <drm/drm_device.h>
> +#include <drm/drm_input_helper.h>
> +
> +/**
> + * DOC: overview
> + *
> + * This helper library provides a thin wrapper around input handles, so that
> + * DRM drivers can easily perform domain-specific actions in response to user
> + * activity. e.g., if someone is moving a mouse, we're likely to want to
> + * display something soon, and we should exit panel self-refresh.
> + */
> +
> +static void drm_input_event(struct input_handle *handle, unsigned int type,
> +			    unsigned int code, int value)
> +{
> +	struct drm_input_handler *handler = handle->handler->private;
> +
> +	handler->callback(handler);
> +}
> +
> +static int drm_input_connect(struct input_handler *handler,
> +			     struct input_dev *dev,
> +			     const struct input_device_id *id)
> +{
> +	struct input_handle *handle;
> +	int error;
> +
> +	handle = kzalloc(sizeof(struct input_handle), GFP_KERNEL);
> +	if (!handle)
> +		return -ENOMEM;
> +
> +	handle->dev = dev;
> +	handle->handler = handler;
> +	handle->name = "drm-input-helper";
> +
> +	error = input_register_handle(handle);
> +	if (error)
> +		goto err2;
> +
> +	error = input_open_device(handle);
> +	if (error)
> +		goto err1;
> +
> +	return 0;
> +
> +err1:
> +	input_unregister_handle(handle);
> +err2:
> +	kfree(handle);
> +	return error;
> +}
> +
> +static void drm_input_disconnect(struct input_handle *handle)
> +{
> +	input_close_device(handle);
> +	input_unregister_handle(handle);
> +	kfree(handle);
> +}
> +
> +static const struct input_device_id drm_input_ids[] = {
> +	{
> +		.flags = INPUT_DEVICE_ID_MATCH_EVBIT |
> +			 INPUT_DEVICE_ID_MATCH_ABSBIT,
> +		.evbit = { BIT_MASK(EV_ABS) },
> +		.absbit = { [BIT_WORD(ABS_MT_POSITION_X)] =
> +			    BIT_MASK(ABS_MT_POSITION_X) |
> +			    BIT_MASK(ABS_MT_POSITION_Y) },
> +	}, /* multi-touch touchscreen */
> +	{
> +		.flags = INPUT_DEVICE_ID_MATCH_EVBIT,
> +		.evbit = { BIT_MASK(EV_ABS) },
> +		.absbit = { [BIT_WORD(ABS_X)] = BIT_MASK(ABS_X) }
> +
> +	}, /* stylus or joystick device */
> +	{
> +		.flags = INPUT_DEVICE_ID_MATCH_EVBIT,
> +		.evbit = { BIT_MASK(EV_KEY) },
> +		.keybit = { [BIT_WORD(BTN_LEFT)] = BIT_MASK(BTN_LEFT) },
> +	}, /* pointer (e.g. trackpad, mouse) */
> +	{
> +		.flags = INPUT_DEVICE_ID_MATCH_EVBIT,
> +		.evbit = { BIT_MASK(EV_KEY) },
> +		.keybit = { [BIT_WORD(KEY_ESC)] = BIT_MASK(KEY_ESC) },
> +	}, /* keyboard */
> +	{
> +		.flags = INPUT_DEVICE_ID_MATCH_EVBIT |
> +			 INPUT_DEVICE_ID_MATCH_KEYBIT,
> +		.evbit = { BIT_MASK(EV_KEY) },
> +		.keybit = {[BIT_WORD(BTN_JOYSTICK)] = BIT_MASK(BTN_JOYSTICK) },
> +	}, /* joysticks not caught by ABS_X above */
> +	{
> +		.flags = INPUT_DEVICE_ID_MATCH_EVBIT |
> +			 INPUT_DEVICE_ID_MATCH_KEYBIT,
> +		.evbit = { BIT_MASK(EV_KEY) },
> +		.keybit = { [BIT_WORD(BTN_GAMEPAD)] = BIT_MASK(BTN_GAMEPAD) },
> +	}, /* gamepad */
> +	{ },
> +};
> +
> +int drm_input_handle_register(struct drm_device *dev,
> +			      struct drm_input_handler *handler)
> +{
> +	int ret;
> +
> +	if (!handler->callback)
> +		return -EINVAL;
> +
> +	handler->handler.event = drm_input_event;
> +	handler->handler.connect = drm_input_connect;
> +	handler->handler.disconnect = drm_input_disconnect;
> +	handler->handler.name = kasprintf(GFP_KERNEL, "drm-input-helper-%s",
> +					  dev_name(dev->dev));
> +	if (!handler->handler.name)
> +		return -ENOMEM;
> +
> +	handler->handler.id_table = drm_input_ids;
> +	handler->handler.private = handler;
> +
> +	ret = input_register_handler(&handler->handler);
> +	if (ret)
> +		goto err;
> +
> +	return 0;
> +
> +err:
> +	kfree(handler->handler.name);
> +	return ret;
> +}
> +EXPORT_SYMBOL(drm_input_handle_register);
> +
> +void drm_input_handle_unregister(struct drm_input_handler *handler)
> +{
> +	input_unregister_handler(&handler->handler);
> +	kfree(handler->handler.name);
> +}
> +EXPORT_SYMBOL(drm_input_handle_unregister);
> diff --git a/include/drm/drm_input_helper.h b/include/drm/drm_input_helper.h
> new file mode 100644
> index 000000000000..7904f397b934
> --- /dev/null
> +++ b/include/drm/drm_input_helper.h
> @@ -0,0 +1,41 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2021 Google, Inc.
> + */
> +#ifndef __DRM_INPUT_HELPER_H__
> +#define __DRM_INPUT_HELPER_H__
> +
> +#include <linux/input.h>
> +
> +struct drm_device;
> +
> +struct drm_input_handler {
> +	/*
> +	 * Callback to call for input activity. Will be called in an atomic
> +	 * context.

How atomic? Like hardirq, and nasty spinlocks held?

> +	 */
> +	void (*callback)(struct drm_input_handler *handler);
> +
> +	struct input_handler handler;
> +};
> +
> +#if defined(CONFIG_DRM_INPUT_HELPER)
> +
> +int drm_input_handle_register(struct drm_device *dev,
> +			      struct drm_input_handler *handler);
> +void drm_input_handle_unregister(struct drm_input_handler *handler);
> +
> +#else /* !CONFIG_DRM_INPUT_HELPER */
> +
> +static inline int drm_input_handle_register(struct drm_device *dev,
> +					    struct drm_input_handler *handler)
> +{
> +	return 0;
> +}

I guess the reason behind the helper is that you also want to use this in
drivers or maybe drm/sched?

Anyway I think it looks all reasonable. Definitely need an ack from input
people that the event list you have is a good choice, I have no idea what
that all does. Maybe also document that part a bit more.
-Daniel


> +
> +static inline void
> +drm_input_handle_unregister(struct drm_input_handler *handler) {}
> +
> +#endif /* CONFIG_DRM_INPUT_HELPER */
> +
> +#endif /* __DRM_INPUT_HELPER_H__ */
> -- 
> 2.34.0.rc1.387.gb447b232ab-goog
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
