Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AC8D2C4119
	for <lists+linux-input@lfdr.de>; Wed, 25 Nov 2020 14:25:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729504AbgKYNYo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Nov 2020 08:24:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:54548 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726284AbgKYNYo (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Nov 2020 08:24:44 -0500
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D3F92206F9;
        Wed, 25 Nov 2020 13:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606310684;
        bh=Uth3l3AAtRqxAfUEmaMbHH6l2nSJ+VikVia8DQVLVo4=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=JaNPK9Ide9xjpJqJGJVL/G5GTSBa7DwVB7apw5nh0wLkoWfpvrgY6Xc3FDumD9BwL
         J+CXklLmylOG97yPp2sNGR9NS7u/bqPBtH2rCwBBE1tUElghYgyDn+wm8UVLLvL6ot
         VKALR+Nf2fq9vcOEqjpR4LgjFEGPWnF/zDjSBa+Y=
Date:   Wed, 25 Nov 2020 14:24:40 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Pascal Giard <pascal.giard@etsmtl.ca>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sanjay Govind <sanjay.govind9@gmail.com>
Subject: Re: [PATCH v2] HID: sony: support for ghlive ps3/wii u dongles
In-Reply-To: <20201108013818.12214-1-pascal.giard@etsmtl.ca>
Message-ID: <nycvar.YFH.7.76.2011251423130.3441@cbobk.fhfr.pm>
References: <20201009022722.123943-1-pascal.giard@etsmtl.ca> <20201108013818.12214-1-pascal.giard@etsmtl.ca>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 7 Nov 2020, Pascal Giard wrote:

> This commit adds support for the Guitar Hero Live PS3 and Wii U dongles.
> 
> These dongles require a "magic" USB control message [1] to be sent
> approximately every 10 seconds otherwise the dongle will not report
> events where the strumbar is hit while a fret is being held.
> 
> Also, inspired by a patch sent on linux-input by Sanjay Govind [2], the
> accelerometer is mapped to ABS_RY for tilt.
> 
> Interestingly, the Wii U and PS3 dongles share the same VID and PID.
> 
> [1] https://github.com/ghlre/GHLtarUtility/
> [2] https://marc.info/?l=linux-input&m=157242835928542&w=2
> 
> Signed-off-by: Pascal Giard <pascal.giard@etsmtl.ca>
> ---
> differences from v1:
> * Patches hid-sony instead of creating a new driver
> * Changed memory allocation scheme in case of fail
> ---
>  drivers/hid/Kconfig    |   1 +
>  drivers/hid/hid-ids.h  |   3 ++
>  drivers/hid/hid-sony.c | 115 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 119 insertions(+)
> 
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index 34f07371716d..e2df2ae112a5 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -897,6 +897,7 @@ config HID_SONY
>  	  * Buzz controllers
>  	  * Sony PS3 Blue-ray Disk Remote Control (Bluetooth)
>  	  * Logitech Harmony adapter for Sony Playstation 3 (Bluetooth)
> +	  * Guitar Hero Live PS3 and Wii U guitar dongles
>  
>  config SONY_FF
>  	bool "Sony PS2/3/4 accessories force feedback support" 
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 1c71a1aa76b2..e3a3942079cf 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -1060,6 +1060,9 @@
>  #define USB_DEVICE_ID_SONY_BUZZ_CONTROLLER		0x0002
>  #define USB_DEVICE_ID_SONY_WIRELESS_BUZZ_CONTROLLER	0x1000
>  
> +#define USB_VENDOR_ID_SONY_GHLIVE			0x12ba
> +#define USB_DEVICE_ID_SONY_PS3WIIU_GHLIVE_DONGLE	0x074b
> +
>  #define USB_VENDOR_ID_SINO_LITE			0x1345
>  #define USB_DEVICE_ID_SINO_LITE_CONTROLLER	0x3008
>  
> diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
> index 4c6ed6ef31f1..700bea6239f6 100644
> --- a/drivers/hid/hid-sony.c
> +++ b/drivers/hid/hid-sony.c
> @@ -11,6 +11,7 @@
>   *  Copyright (c) 2013 Colin Leitner <colin.leitner@gmail.com>
>   *  Copyright (c) 2014-2016 Frank Praznik <frank.praznik@gmail.com>
>   *  Copyright (c) 2018 Todd Kelner
> + *  Copyright (c) 2020 Pascal Giard <pascal.giard@etsmtl.ca>
>   */
>  
>  /*
> @@ -35,6 +36,8 @@
>  #include <linux/idr.h>
>  #include <linux/input/mt.h>
>  #include <linux/crc32.h>
> +#include <linux/usb.h>
> +#include <linux/timer.h>
>  #include <asm/unaligned.h>
>  
>  #include "hid-ids.h"
> @@ -56,6 +59,8 @@
>  #define NSG_MR5U_REMOTE_BT        BIT(14)
>  #define NSG_MR7U_REMOTE_BT        BIT(15)
>  #define SHANWAN_GAMEPAD           BIT(16)
> +#define GHL_GUITAR_PS3WIIU        BIT(17)
> +#define GHL_GUITAR_CONTROLLER     BIT(18)

Hi Pascal,

thanks for fixing the previous version. This one looks good to me, I just 
have one remaining question -- why do we need both quirks here? Given the 
particular VID/PID gets both of them set anyway (and only that VID/PID), 
and the code is shared, what is the point of consuming the extra bit?

Thanks,

-- 
Jiri Kosina
SUSE Labs

