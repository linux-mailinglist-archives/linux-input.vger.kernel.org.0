Return-Path: <linux-input+bounces-16010-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AC224C4FF9C
	for <lists+linux-input@lfdr.de>; Tue, 11 Nov 2025 23:34:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65F89188FE7D
	for <lists+linux-input@lfdr.de>; Tue, 11 Nov 2025 22:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79AF3272E45;
	Tue, 11 Nov 2025 22:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sb9iQ40K"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA48825A640
	for <linux-input@vger.kernel.org>; Tue, 11 Nov 2025 22:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762900477; cv=none; b=T68Y9oFBsgov+wuD2fOsAdr03iLagtDwKz7gsaRqlcNRHN2fSpQ83gFBLNfw0N7ye9MRmFmlXO2BvejJSeQqGNYCI9pU2/eKWW8k2SnKM3cGWgChCSDszeJbMb2KWmYVCGQBL8d6IUU5XJzmanS93wTfg08U0hRMSPAEPu27BEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762900477; c=relaxed/simple;
	bh=MKttSrpjw6QWsPg95rk6fpiw6ac992auCnAaONTOVts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pzTNl5TeJz57Jdm9KuJQhPbEcnR5vQ+stBdf6q8W2IBN4a6Gm/EmrR+KulsSdxzZdcgTtfuhrOEcfbVf6eMlD9PUbkscFSLjuIJ0eVW29kUrACt2I4icaVI+9xWwMFd8HGrZnRYZaMejhZvkrbt5tobsXwwo53wLqyl3sHmArFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sb9iQ40K; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2980d9b7df5so1616595ad.3
        for <linux-input@vger.kernel.org>; Tue, 11 Nov 2025 14:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762900475; x=1763505275; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6Hy40ZMKHaLblCgrg8d9mHoEY/ESGBO/Q5ZktpGRvsw=;
        b=Sb9iQ40KNTUzW68xtP727hPi4ObwN6zr9qESVObjMvBRaxHNzc7SSXsxfuzF3zGjuR
         M+v40k1lY6BD0BQ6w+m7EM19VTQCc78Y8rvjtuUBTltTUw64J3jehlosCcBzMfT7/qJr
         p5aTF5joyCR3rl7io5q/Kq2iMcK9vfG1G8XMzm6zVMsMymMx6h0zLa0uy3dYoHcY5gD9
         TC4cgaerXgrPw5RBXl/ISuNhMXUzR6mUWpRCjb0d/5Dq5xwCeVj5efCJRZuvUIToknn6
         +cVniEAgR/dC8ynY20uLztbpQnRT0yLNI2R9lBHe4X8QcLcaMY/mmfl0Nbq7l3rTHZLB
         AQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762900475; x=1763505275;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Hy40ZMKHaLblCgrg8d9mHoEY/ESGBO/Q5ZktpGRvsw=;
        b=T0kv+lJehDccJvNC5jKtBnwIxiOQtx3FHbgL3TDw+FvQgwYiEv5Yr3sNZ9IZ5oTMYk
         z52o7CWmof8GDU64O599RKs9CjSLfD5nq2Ykeeb5zmY7O6+OtKG/H/8T+zuTqRvdjhag
         zH1LL7TwJ0iMjExlqbYEymhBAI3uM04+Ychr3lpeJQ633zJjT2vM4FrIfk1igXRG1FFb
         kl2Y8KsJv7TKo7wOneQ0wJh728Nb58uq/2BvgjrLyT8dvBlesMUK12O+Xb9+ic5sWUKq
         lpXgMMiI3M63IWsfXVbB7N7DIov55LuBqs04yDGay4UDwEhteMTKTQ5YgNv8sqKq3uHD
         Rswg==
X-Forwarded-Encrypted: i=1; AJvYcCWunQ8sdVPkMaYoIfL1Pss5aWSrF0ZMaxCDlX8OPwFC5MoY+EHGQ2wbJn8H1g93+XEFHpNZ9Cl9PmuUPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5fM1H1gmeKWvXZVKRoxC7aMOrUkPTU/CHHt8ZhNigpZYzFJcR
	+256GizMyVsvMIdGi+pR2MkzBWTb9m1sJARmKlCVerVQUPm+Iv8eT1NcYlGbkg==
X-Gm-Gg: ASbGncvTKX/S4jiFcyOW2qXPNQvIzEd8MiOI1LptSEW5Ns6Qza9DsxHv/IYWu/34Ing
	yasHhGzHbjFS8mT85guv+SApL7NkWZx2HsV60/tUxYhcKT7Kwx+8g69My5UfGF6ZwVZf1An/8m/
	B3wGO38jwzJD+KZEVLOi7tVhgnpJiMis4qcNW5TEztZTx3r4jHiPirWdZ0kpzT9CC8tN1ifFbIF
	jDWt5+wuo7152i+yjrpH6TfIB2wD/4cxop+K570ePDMFtJgYwWnpXHQa1o5H7Nb6p09zHl1UEXx
	WUal77f8aHZIf5AhUEQGQ8+4SG/PYZEY9sqP+yoF2Ze+pzl2Wcv4iDEVc2cgOKdQef1KC2Q/xje
	9KkcWgBSFonW32VxRfRjwgTg/PLYxbUyeOuNjWvaUPqgMjXC5FsLlHWE6CKuAryk28HukvbfVgk
	W4+UpfQBlI3rvibdtSlRTffUsqo0W6l/llyRIQi7vn1huFw3WldC2E
X-Google-Smtp-Source: AGHT+IF9QQPH+gJH8KntSB7Rwy8vzqw7n+HZ8aPvviHNmqgfUyRLSbtrGmVJLzrEsq8+P4iOrVOKkw==
X-Received: by 2002:a17:903:286:b0:250:1c22:e78 with SMTP id d9443c01a7336-2984ed281bfmr12130735ad.1.1762900474952;
        Tue, 11 Nov 2025 14:34:34 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:3da7:808e:130d:eeb4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bbf167e2fd0sm658034a12.17.2025.11.11.14.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 14:34:34 -0800 (PST)
Date: Tue, 11 Nov 2025 14:34:18 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jonathan Denose <jdenose@google.com>
Cc: Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] Input: Add lid switch notifier
Message-ID: <s7nk2xerfa7ocscyaaez7qnygkmrdy2ch355uziodda654ws5p@zswljdmx3747>
References: <20251111-lid-switch-notifier-v2-0-789723d78d89@google.com>
 <20251111-lid-switch-notifier-v2-1-789723d78d89@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111-lid-switch-notifier-v2-1-789723d78d89@google.com>

Hi Jonathan,

On Tue, Nov 11, 2025 at 09:34:06PM +0000, Jonathan Denose wrote:
> This change creates a new input handler which can be included in the
> build via a new Kconfig option CONFIG_INPUT_LID_NOTIFIER. This input
> handler listens for lid switch events and publishes them through an
> atomic notification chain. Other modules may register for events
> through this notification chain with register_lid_notifier.
> 
> Signed-off-by: Jonathan Denose <jdenose@google.com>
> ---
>  drivers/input/Kconfig        | 11 +++++
>  drivers/input/Makefile       |  1 +
>  drivers/input/lid-notifier.c | 98 ++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/input.h        |  2 +
>  4 files changed, 112 insertions(+)
> 
> diff --git a/drivers/input/Kconfig b/drivers/input/Kconfig
> index 88ecdf5218ee9ba35e1efec6341f8605b621bd49..16f6d24fd04ac8cb5af9d36cc47155ea9be0e177 100644
> --- a/drivers/input/Kconfig
> +++ b/drivers/input/Kconfig
> @@ -38,6 +38,17 @@ config INPUT_LEDS
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called input-leds.
>  
> +config INPUT_LID_NOTIFIER
> +	tristate "Include notifier for lid switch events"
> +	help
> +	  Say Y here if you would like to create a notifier to publish lid switch
> +		events.
> +
> +	  If unsure, say N.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called lid-notifier.

I think this better not surfaced to users but rather interested drivers
'select' it.

> +
>  config INPUT_FF_MEMLESS
>  	tristate "Support for memoryless force-feedback devices"
>  	help
> diff --git a/drivers/input/Makefile b/drivers/input/Makefile
> index 2cd6e1c9a77844fe09cd3d99533e5d3efb038c7d..1efdba04f79a97e2a122b9198341b18a1855b4b9 100644
> --- a/drivers/input/Makefile
> +++ b/drivers/input/Makefile
> @@ -15,6 +15,7 @@ obj-$(CONFIG_INPUT_MATRIXKMAP)	+= matrix-keymap.o
>  obj-$(CONFIG_INPUT_VIVALDIFMAP)	+= vivaldi-fmap.o
>  
>  obj-$(CONFIG_INPUT_LEDS)	+= input-leds.o
> +obj-$(CONFIG_INPUT_LID_NOTIFIER)	+= lid-notifier.o
>  obj-$(CONFIG_INPUT_MOUSEDEV)	+= mousedev.o
>  obj-$(CONFIG_INPUT_JOYDEV)	+= joydev.o
>  obj-$(CONFIG_INPUT_EVDEV)	+= evdev.o
> diff --git a/drivers/input/lid-notifier.c b/drivers/input/lid-notifier.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..954b9855532dbd0514860e309d0b76982e947673
> --- /dev/null
> +++ b/drivers/input/lid-notifier.c
> @@ -0,0 +1,98 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + *  Lid event notifier
> + *
> + *  Copyright (c) 2025 Jonathan Denose <jdenose@google.com>
> + */
> +
> +#include <linux/device.h>
> +#include <linux/input.h>
> +#include <linux/notifier.h>
> +
> +static struct input_handler lid_handler;
> +static struct atomic_notifier_head input_notifier_head;
> +
> +int register_lid_notifier(struct notifier_block *notifier)
> +{
> +	return atomic_notifier_chain_register(&input_notifier_head, notifier);
> +}
> +EXPORT_SYMBOL(register_lid_notifier);

I wonder if we want to expose the "raw" notifier or if we want to
provide a higher-level API that would allocate a notifier blocki, set up
the callback, and return a "cookie" that can be used to free notifier
block later. This way we do not need to worry that some enterprising
driver suppresses notifications for the rest by returning NOTIFY_STOP.

> +
> +static int lid_handler_connect(struct input_handler *handler,
> +		struct input_dev *input_dev, const struct input_device_id *id)

Proper alignment of the arguments please.

> +{
> +	struct input_handle *handle;
> +	int error;
> +
> +	handle = devm_kzalloc(&input_dev->dev, sizeof(struct input_handle), GFP_KERNEL);

This is not driver probe path so devm_kzalloc must not be used here.
Also "sizeof(*handle)". 

> +	if (!handle)
> +		return -ENOMEM;
> +
> +	handle->dev = input_dev;
> +	handle->handler = handler;
> +	handle->name = "lid";
> +
> +	error = input_register_handle(handle);
> +	if (error)
> +		goto err_free_handle;
> +
> +	error = input_open_device(handle);
> +	if (error)
> +		goto err_unregister_handle;
> +
> +	return 0;
> +
> + err_unregister_handle:
> +	input_unregister_handle(handle);
> + err_free_handle:
> +	kfree(handle);

Just FYI: One must never use kfree() with devm_kalloc()ed memory.

> +	return error;
> +}
> +
> +static void lid_handler_disconnect(struct input_handle *handle)
> +{
> +	input_close_device(handle);
> +	input_unregister_handle(handle);

	kfree(handle);

> +}
> +
> +static void lid_handler_event(struct input_handle *handle, unsigned int type,
> +		unsigned int code, int value)
> +{
> +	if (type == EV_SW && code == SW_LID)
> +		atomic_notifier_call_chain(&input_notifier_head, value, handle->dev);

Why do you need to pass the device from which SW_LID originated?

> +}
> +
> +static const struct input_device_id lid_handler_ids[] = {
> +	{
> +		.flags = INPUT_DEVICE_ID_MATCH_EVBIT | INPUT_DEVICE_ID_MATCH_SWBIT
> +						| INPUT_DEVICE_ID_MATCH_BUS,
> +		.evbit = { BIT_MASK(EV_SW) },
> +		.swbit = { [BIT_WORD(SW_LID)] = BIT_MASK(SW_LID) },
> +		.bustype = 0x19

Why do we need to match in bus type? The LID does not have to always
come from ACPI.

> +	},
> +	{ },
> +};
> +
> +static struct input_handler lid_handler = {
> +	.connect = lid_handler_connect,
> +	.disconnect = lid_handler_disconnect,
> +	.event = lid_handler_event,
> +	.name = "lid",
> +	.id_table = lid_handler_ids
> +};
> +
> +static int __init lid_notifier_init(void)
> +{
> +	return input_register_handler(&lid_handler);
> +}
> +module_init(lid_notifier_init);
> +
> +static void __exit lid_notifier_exit(void)
> +{
> +	input_unregister_handler(&lid_handler);
> +}
> +module_exit(lid_notifier_exit);
> +
> +MODULE_AUTHOR("Jonathan Denose <jdenose@google.com>");
> +MODULE_DESCRIPTION("Lid event notifier");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/input.h b/include/linux/input.h
> index 7d7cb0593a63e93c4906c49cde430188db2d1ab5..023eb92c77d9e8721d482b9787632a671671de08 100644
> --- a/include/linux/input.h
> +++ b/include/linux/input.h
> @@ -592,3 +592,5 @@ int input_ff_create_memless(struct input_dev *dev, void *data,
>  		int (*play_effect)(struct input_dev *, void *, struct ff_effect *));
>  
>  #endif

I think this should go into include/linux/lid-notifier.h.

> +
> +int register_lid_notifier(struct notifier_block *notifier);

Thanks.

-- 
Dmitry

