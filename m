Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88D4A2947B1
	for <lists+linux-input@lfdr.de>; Wed, 21 Oct 2020 07:09:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440358AbgJUFJz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Oct 2020 01:09:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:48516 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2440357AbgJUFJy (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Oct 2020 01:09:54 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B220421D43;
        Wed, 21 Oct 2020 05:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603256994;
        bh=IdutI6kcf3DrDEnl2ResNV9pkENKCDuMmln8DC3a2Sw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XWR465sEBJRMEo9XWg/rzOUi4X4zoZPLCpB72Wgb6NZIdDf/f/GLaGQDOl5SdxQdE
         4g7HXJODAFP3ikrO1MAL/L+vlohewsT30BschtcWrvOFyqgDG1ESuQXS7icWw/VyPs
         1y3a8Wj9npcr+GtEilun5m3MKkPk4kKWtKZalYmg=
Date:   Wed, 21 Oct 2020 07:10:35 +0200
From:   "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To:     HyungJae Im <hj2.im@samsung.com>
Cc:     "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "rydberg@bitmath.org" <rydberg@bitmath.org>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] FROMLIST: input: add 2 kind of switch
Message-ID: <20201021051035.GA966058@kroah.com>
References: <CGME20201021031216epcms1p556d8d7d5d763ec47f67cd8cbe3972935@epcms1p5>
 <20201021031216epcms1p556d8d7d5d763ec47f67cd8cbe3972935@epcms1p5>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201021031216epcms1p556d8d7d5d763ec47f67cd8cbe3972935@epcms1p5>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Oct 21, 2020 at 12:12:16PM +0900, HyungJae Im wrote:
> >From ec9859ee01b7bc0e04255971e0fe97348847dab7 Mon Sep 17 00:00:00 2001

You sent this 3 times, why?

And why is this in the body of the email, have you read the "how to send
your first kernel patch" document at kernelnewbies.org?

> From: "hj2.im" <hj2.im@samsung.com>
> Date: Tue, 20 Oct 2020 16:57:04 +0900
> Subject: [PATCH] FROMLIST: input: add 2 kind of switch

What does "FROMLIST:" mean?

> 
> We need support to various accessories on the device,
> some switch does not exist in switch list.
> So added switch for the following purpose.
> 
> SW_COVER_ATTACHED is for the checking the cover
> attached or not on the device. SW_EXT_PEN_ATTACHED is for the
> checking the external pen attached or not on the device
> 
> Signed-off-by: hj2.im <hj2.im@samsung.com>

As per the kernel documentation, you need to use your real name here,
please do so.

> ---
>  include/linux/mod_devicetable.h        | 2 +-
>  include/uapi/linux/input-event-codes.h | 4 +++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
> index 5b08a473cdba..897f5a3e7721 100644
> --- a/include/linux/mod_devicetable.h
> +++ b/include/linux/mod_devicetable.h
> @@ -320,7 +320,7 @@ struct pcmcia_device_id {
>  #define INPUT_DEVICE_ID_LED_MAX		0x0f
>  #define INPUT_DEVICE_ID_SND_MAX		0x07
>  #define INPUT_DEVICE_ID_FF_MAX		0x7f
> -#define INPUT_DEVICE_ID_SW_MAX		0x10
> +#define INPUT_DEVICE_ID_SW_MAX		0x12
>  #define INPUT_DEVICE_ID_PROP_MAX	0x1f
>  
>  #define INPUT_DEVICE_ID_MATCH_BUS	1
> diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
> index 0c2e27d28e0a..8ca2acee1f92 100644
> --- a/include/uapi/linux/input-event-codes.h
> +++ b/include/uapi/linux/input-event-codes.h
> @@ -889,7 +889,9 @@
>  #define SW_MUTE_DEVICE		0x0e  /* set = device disabled */
>  #define SW_PEN_INSERTED		0x0f  /* set = pen inserted */
>  #define SW_MACHINE_COVER	0x10  /* set = cover closed */
> -#define SW_MAX			0x10
> +#define SW_COVER_ATTACHED	0x11  /* set = cover attached */
> +#define SW_EXT_PEN_ATTACHED	0x12  /* set = external pen attached */

Is there an in-kernel user for these values anywhere?  Please submit
this patch along with the users at the same time, otherwise this change
makes no sense at all.

thanks,

greg k-h
