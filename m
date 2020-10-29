Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15B3829EDC0
	for <lists+linux-input@lfdr.de>; Thu, 29 Oct 2020 14:59:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725710AbgJ2N6D (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Oct 2020 09:58:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:41268 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727737AbgJ2N42 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Oct 2020 09:56:28 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AA5452076A;
        Thu, 29 Oct 2020 13:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603979787;
        bh=+tQhmwxWMle16CxKrIdDRJWo3StoJ0VOhFS1q6E4UZI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZxMqmFLfVxR3i4yTu1s8/4ug5lYkmQvLIMib3tr2oU/kBQdGwZelO6HkTrHluR95o
         pnNDl0c7sXvczWcpDncTk5KVc++gFp90oECeTYTi630ciEj/zYGKV9BTUoYIM9M35B
         l1QN1/Y3Lyh49cXuZnNqt4pvKQ+txQR0Z5/DeHJQ=
Date:   Thu, 29 Oct 2020 14:57:15 +0100
From:   "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To:     HyungJae Im <hj2.im@samsung.com>
Cc:     "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "rydberg@bitmath.org" <rydberg@bitmath.org>,
        Jungrae Kim <jryu.kim@samsung.com>
Subject: Re: [PATCH v2] input: add 2 kind of switch
Message-ID: <20201029135715.GB3470996@kroah.com>
References: <CGME20201029132747epcms1p8fae559dff47bf0eebdcc9f94efd9a1bf@epcms1p8>
 <20201029132747epcms1p8fae559dff47bf0eebdcc9f94efd9a1bf@epcms1p8>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201029132747epcms1p8fae559dff47bf0eebdcc9f94efd9a1bf@epcms1p8>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Oct 29, 2020 at 10:27:47PM +0900, HyungJae Im wrote:
> From: "hj2.im" <hj2.im@samsung.com>
> Date: Thu, 29 Oct 2020 22:11:24 +0900
> Subject: [PATCH v2] input: add 2 kind of switch

Why is this in the body of that patch?

> 
> We need support to various accessories on the device,
> some switch does not exist in switch list.
> So added switch for the following purpose.
> 
> SW_COVER_ATTACHED is for the checking the cover
> attached or not on the device. SW_EXT_PEN_ATTACHED is for the
> checking the external pen attached or not on the device

You didn't answer the previous question as to why the existing values do
not work for you instead of having to create new ones?


> 
> Signed-off-by: Hyungjae Im <hj2.im@samsung.com>
> ---
>  drivers/input/Kconfig                  |  20 ++
>  drivers/input/Makefile                 |   3 +
>  drivers/input/cover_detect.c           | 242 ++++++++++++++++++++++++
>  drivers/input/ext_pen_detect.c         | 243 +++++++++++++++++++++++++
>  include/linux/mod_devicetable.h        |   2 +-
>  include/uapi/linux/input-event-codes.h |   4 +-
>  6 files changed, 512 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/input/cover_detect.c
>  create mode 100644 drivers/input/ext_pen_detect.c

If this is v2, what changed from v1?

And this is 2 different drivers, it should be 2 different patches at the
least, right?>

> 
> diff --git a/drivers/input/Kconfig b/drivers/input/Kconfig
> index 1efd3154b68d..df902f4a549e 100644
> --- a/drivers/input/Kconfig
> +++ b/drivers/input/Kconfig
> @@ -185,6 +185,26 @@ config INPUT_APMPOWER
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called apm-power.
>  
> +config COVER_DETECT

INPUT_COVER_DETECT?

> +	tristate "Enable cover attach detection"
> +	default n

"default n" is always the default, no need for this here.

> +	help
> +	  Say Y here to enable cover attach detection
> +	  and send a event when cover is attached/detached.
> +	  Active gpio state is low and active event value is 0.
> +
> +	  If unsure, say N.

What is the module name?

> +
> +config EXT_PEN_DETECT

INPUT_EXT_PEN_DETECT?

> +	tristate "Enable external pen attach detection"
> +	default n

No default n.

> +	help
> +	  Say Y here to enable external pen attach detection
> +	  and send a event when external pen is attached/detached.
> +	  Active gpio state is low and active event value is 0.
> +
> +	  If unsure, say N.

What is the module name?

> +
>  comment "Input Device Drivers"
>  
>  source "drivers/input/keyboard/Kconfig"
> diff --git a/drivers/input/Makefile b/drivers/input/Makefile
> index e35650930371..31ee1f2d2e21 100644
> --- a/drivers/input/Makefile
> +++ b/drivers/input/Makefile
> @@ -29,3 +29,6 @@ obj-$(CONFIG_INPUT_MISC)	+= misc/
>  obj-$(CONFIG_INPUT_APMPOWER)	+= apm-power.o
>  
>  obj-$(CONFIG_RMI4_CORE)		+= rmi4/
> +
> +obj-$(CONFIG_COVER_DETECT)	+= cover_detect.o
> +obj-$(CONFIG_EXT_PEN_DETECT)	+= ext_pen_detect.o
> diff --git a/drivers/input/cover_detect.c b/drivers/input/cover_detect.c
> new file mode 100644
> index 000000000000..4d3d68c616ec
> --- /dev/null
> +++ b/drivers/input/cover_detect.c
> @@ -0,0 +1,242 @@
> +/*
> + * Copyright (C) 2015 Samsung Electronics Co. Ltd. All Rights Reserved.

Please use a SPDX line, and no need for this:

> + *
> + * This software is licensed under the terms of the GNU General Public
> + * License version 2, as published by the Free Software Foundation, and
> + * may be copied, distributed, and modified under those terms.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.

That can be removed.

Also your copyright line is wrong, unless you really have not touched
this file in 5 years.

Same comments on the other file.

thanks,

greg k-h
