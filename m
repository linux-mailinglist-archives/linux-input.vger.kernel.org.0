Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA7CA2A0318
	for <lists+linux-input@lfdr.de>; Fri, 30 Oct 2020 11:44:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726236AbgJ3Ko1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 30 Oct 2020 06:44:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:34488 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725801AbgJ3Ko1 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 30 Oct 2020 06:44:27 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 14FB320720;
        Fri, 30 Oct 2020 10:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604054665;
        bh=ppbuAI+W7nY0G+0QkAsjoiOlnWYiUYwhaoxDj+dZeCI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mUGdN5+8qnLNSy0dpMY2+ziw+HhYwFf+fCtqEEal/tTi6H1FfJv+8opF0eEWiDM0w
         2owrqhz2Z6ZJMflZjSEbMKyrNu4aYNYjhsuxl5+HUyNQ1MZvqNSdFR4GXwJaXVb6Qk
         S96uDp0YWj/mhE5hRB77X/2HfA4chigwqWpRtKTc=
Date:   Fri, 30 Oct 2020 11:45:13 +0100
From:   "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To:     HyungJae Im <hj2.im@samsung.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "rydberg@bitmath.org" <rydberg@bitmath.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH] Input: add switch event(SW_EXT_PEN_ATTACHED)
Message-ID: <20201030104513.GA2395528@kroah.com>
References: <CGME20201030062740epcms1p614195fb639c807cd2db762d117cc69fc@epcms1p6>
 <20201030062740epcms1p614195fb639c807cd2db762d117cc69fc@epcms1p6>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201030062740epcms1p614195fb639c807cd2db762d117cc69fc@epcms1p6>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Oct 30, 2020 at 03:27:40PM +0900, HyungJae Im wrote:
> We need support to various accessories on the device,
> some requiring switch does not exist in switch list.
> So added switch for the following purpose.
> 
> SW_EXT_PEN_ATTACHED is for the checking the external pen
> attached or not on the device. We also added driver
> that uses such event.
> 
> Signed-off-by: Hyungjae Im <hj2.im@samsung.com>
> ---
>  drivers/input/Kconfig                  |  12 ++
>  drivers/input/Makefile                 |   1 +
>  drivers/input/ext_pen_detect.c         | 237 +++++++++++++++++++++++++
>  include/linux/mod_devicetable.h        |   2 +-
>  include/uapi/linux/input-event-codes.h |   3 +-
>  5 files changed, 253 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/input/ext_pen_detect.c
> 
> diff --git a/drivers/input/Kconfig b/drivers/input/Kconfig
> index ba5e7444c547..5d6d15c8f7e7 100644
> --- a/drivers/input/Kconfig
> +++ b/drivers/input/Kconfig
> @@ -197,6 +197,18 @@ config INPUT_COVER_DETECT
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called cover_detect.
>  
> +config INPUT_EXT_PEN_DETECT
> +	tristate "Enable external pen attach detection"
> +	help
> +	  Say Y here to enable external pen detection
> +	  and send a event when external pen is attached/detached.
> +	  Active gpio state is low and active event value is 0.
> +
> +	  If unsure, say N.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called ext_pen_detect.
> +
>  comment "Input Device Drivers"
>  
>  source "drivers/input/keyboard/Kconfig"
> diff --git a/drivers/input/Makefile b/drivers/input/Makefile
> index fc8dd9091821..0ccf02e34557 100644
> --- a/drivers/input/Makefile
> +++ b/drivers/input/Makefile
> @@ -31,3 +31,4 @@ obj-$(CONFIG_INPUT_APMPOWER)	+= apm-power.o
>  obj-$(CONFIG_RMI4_CORE)		+= rmi4/
>  
>  obj-$(CONFIG_INPUT_COVER_DETECT)+= cover_detect.o
> +obj-$(CONFIG_INPUT_EXT_PEN_DETECT)+= ext_pen_detect.o
> diff --git a/drivers/input/ext_pen_detect.c b/drivers/input/ext_pen_detect.c
> new file mode 100644
> index 000000000000..9a0d106e49f8
> --- /dev/null
> +++ b/drivers/input/ext_pen_detect.c
> @@ -0,0 +1,237 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Support detection pen attachment externally on device
> + *
> + * Copyright (C) 2020 Samsung Electronics Co. Ltd. All Rights Reserved.
> + *
> + */
> +
> +#include <linux/module.h>
> +#include <linux/interrupt.h>
> +#include <linux/pm.h>
> +#include <linux/slab.h>
> +#include <linux/platform_device.h>
> +#include <linux/input.h>
> +#include <linux/gpio.h>
> +#include <linux/of_gpio.h>
> +#include <linux/wakelock.h>
> +
> +struct ext_pen_detect_drvdata {
> +	struct input_dev *input;
> +	struct delayed_work ext_pen_detect_dwork;
> +	struct wakeup_source *ws;
> +	int gpio_ext_pen_detect;
> +	int irq_ext_pen_detect;
> +};
> +
> +static void ext_pen_detect_work(struct work_struct *work)
> +{
> +	struct ext_pen_detect_drvdata *ddata =
> +		container_of(work, struct ext_pen_detect_drvdata,
> +				ext_pen_detect_dwork.work);
> +	bool ext_pen_status;
> +
> +	ext_pen_status = gpio_get_value(ddata->gpio_ext_pen_detect);
> +
> +	input_report_switch(ddata->input,
> +			SW_EXT_PEN_ATTACHED, ext_pen_status);

As this is just a gpio device, again, why is this needed and you can't
just use the gpio_keys driver instead?

Why does this have to be a new driver?

thanks,

greg k-h
