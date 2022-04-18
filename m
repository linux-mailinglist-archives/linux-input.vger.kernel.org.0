Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F01D4504C8E
	for <lists+linux-input@lfdr.de>; Mon, 18 Apr 2022 08:22:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232716AbiDRGX2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Apr 2022 02:23:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232163AbiDRGX1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Apr 2022 02:23:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 798411837C
        for <linux-input@vger.kernel.org>; Sun, 17 Apr 2022 23:20:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 142F160FC6
        for <linux-input@vger.kernel.org>; Mon, 18 Apr 2022 06:20:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11E6BC385A1;
        Mon, 18 Apr 2022 06:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1650262848;
        bh=41me/PZW1v7XZ0mRdW6PKLc7Cxt33fh+UtCjLr+Vel0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cOKDLq/BvaV7KiB+Y5o9oPOCsA9iwSzthboHZjYpSrDgDqZfgnVqBTiaXCz801zRi
         GPVEafjDvd8QO7SlVk5bTFEkPAtQY0BQ8kEp8pDA5P085n/ISUMF3+Lo8wAFfg+o5e
         pFbJ3riN8J7shAY39ZqeD9p9xAngXUXmhDao7Nt0=
Date:   Mon, 18 Apr 2022 08:20:45 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Pavel Rojtberg <rojtberg@gmail.com>
Cc:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        Christopher Crockett <chaorace@gmail.com>,
        Fmstrat <nospam@nowsci.com>
Subject: Re: [PATCH] Input: xpad - add support for XBOX One Elite paddles
Message-ID: <Yl0DPYdzSK5C+hEF@kroah.com>
References: <20220417161908.138625-1-rojtberg@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220417161908.138625-1-rojtberg@gmail.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_FILL_THIS_FORM_SHORT,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Apr 17, 2022 at 06:19:08PM +0200, Pavel Rojtberg wrote:
> From: Christopher Crockett <chaorace@gmail.com>
> 
> An effort has been made to support every official model and firmware
> version I could track down info on. The following controllers _should_
> have working paddles with this PR:
> - Xbox Elite (**untested**)
> - Xbox Elite Series 2 on early firmwares (**untested**)
> - Xbox Elite Series 2 on v4 firmwares (Tested v4.8.1908.0)
> - Xbox Elite Series 2 on v5 pre-BLE firmwares (**untested**)
> - Xbox Elite Series 2 on v5 post-BLE firmwares (Tested v5.13.3143.0)
> 
> This patch also introduces correct handling for the Elite 1 controller
> and properly suppresses paddle inputs when using a custom profile slot.
> 
> Starting in v5.11, certain inputs for the Elite 2 were moved to an extra
> packet that is not enabled by default.

why does 5.11 matter here?

> 
> We must first manually enable this extra packet in order to correctly
> process paddle input data with these later firmwares.
> 
> For further details see: https://github.com/paroj/xpad/pull/195

don't like to random web sites, summarize in here properly.

> 
> Signed-off-by: Fmstrat <nospam@nowsci.com>

I doubt that is a correct email address and valid name :(

> Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>
> ---
>  drivers/input/joystick/xpad.c | 239 ++++++++++++++++++++++++++++++++++++++++++---------------
>  1 file changed, 176 insertions(+), 63 deletions(-)
> 
> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
> index 53126d9..0746813 100644
> --- a/drivers/input/joystick/xpad.c
> +++ b/drivers/input/joystick/xpad.c
> @@ -80,6 +80,7 @@
>  #define MAP_TRIGGERS_TO_BUTTONS		(1 << 1)
>  #define MAP_STICKS_TO_NULL		(1 << 2)
>  #define MAP_SELECT_BUTTON		(1 << 3)
> +#define MAP_PADDLES				(1 << 4)
>  #define DANCEPAD_MAP_CONFIG	(MAP_DPAD_TO_BUTTONS |			\
>  				MAP_TRIGGERS_TO_BUTTONS | MAP_STICKS_TO_NULL)
>  
> @@ -89,6 +90,12 @@
>  #define XTYPE_XBOXONE     3
>  #define XTYPE_UNKNOWN     4
>  
> +#define PKT_XB              0
> +#define PKT_XBE1            1
> +#define PKT_XBE2_FW_OLD     2
> +#define PKT_XBE2_FW_5_EARLY 3
> +#define PKT_XBE2_FW_5_11    4
> +
>  static bool dpad_to_buttons;
>  module_param(dpad_to_buttons, bool, S_IRUGO);
>  MODULE_PARM_DESC(dpad_to_buttons, "Map D-PAD to buttons rather than axes for unknown pads");
> @@ -111,6 +118,7 @@ static const struct xpad_device {
>  	char *name;
>  	u8 mapping;
>  	u8 xtype;
> +	u8 pktType;

Please use proper Linux kernel naming schemes.

>  } xpad_device[] = {
>  	{ 0x0079, 0x18d4, "GPD Win 2 X-Box Controller", 0, XTYPE_XBOX360 },
>  	{ 0x044f, 0x0f00, "Thrustmaster Wheel", 0, XTYPE_XBOX },
> @@ -128,7 +136,8 @@ static const struct xpad_device {
>  	{ 0x045e, 0x0291, "Xbox 360 Wireless Receiver (XBOX)", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360W },
>  	{ 0x045e, 0x02d1, "Microsoft X-Box One pad", 0, XTYPE_XBOXONE },
>  	{ 0x045e, 0x02dd, "Microsoft X-Box One pad (Firmware 2015)", 0, XTYPE_XBOXONE },
> -	{ 0x045e, 0x02e3, "Microsoft X-Box One Elite pad", 0, XTYPE_XBOXONE },
> +	{ 0x045e, 0x02e3, "Microsoft X-Box One Elite pad", MAP_PADDLES, XTYPE_XBOXONE },
> +	{ 0x045e, 0x0b00, "Microsoft X-Box One Elite 2 pad", MAP_PADDLES, XTYPE_XBOXONE },
>  	{ 0x045e, 0x02ea, "Microsoft X-Box One S pad", 0, XTYPE_XBOXONE },
>  	{ 0x045e, 0x0719, "Xbox 360 Wireless Receiver", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360W },
>  	{ 0x045e, 0x0b12, "Microsoft Xbox Series S|X Controller", MAP_SELECT_BUTTON, XTYPE_XBOXONE },
> @@ -390,6 +399,13 @@ static const signed short xpad_abs_triggers[] = {
>  	-1
>  };
>  
> +/* used when the controller has extra paddle buttons */
> +static const signed short xpad_btn_paddles[] = {
> +	BTN_TRIGGER_HAPPY5, BTN_TRIGGER_HAPPY6, /* paddle upper right, lower right */
> +	BTN_TRIGGER_HAPPY7, BTN_TRIGGER_HAPPY8, /* paddle upper left, lower left */
> +	-1						/* terminating entry */

0 should be the terminator, right?

> +};
> +
>  /*
>   * Xbox 360 has a vendor-specific class, so we cannot match it with only
>   * USB_INTERFACE_INFO (also specifically refused by USB subsystem), so we
> @@ -492,6 +508,15 @@ static const u8 xboxone_s_init[] = {
>  	0x05, 0x20, 0x00, 0x0f, 0x06
>  };
>  
> +/*
> + * This packet is required to get additional input data
> + * from Xbox One Elite Series 2 (0x045e:0x0b00) pads.
> + * We mostly do this right now to get paddle data
> + */
> +static const u8 extra_input_packet_init[] = {
> +	0x4d, 0x10, 0x01, 0x02, 0x07, 0x00
> +};
> +
>  /*
>   * This packet is required for the Titanfall 2 Xbox One pads
>   * (0x0e6f:0x0165) to finish initialization and for Hori pads
> @@ -552,6 +577,7 @@ static const struct xboxone_init_packet xboxone_init_packets[] = {
>  	XBOXONE_INIT_PKT(0x0000, 0x0000, xboxone_fw2015_init),
>  	XBOXONE_INIT_PKT(0x045e, 0x02ea, xboxone_s_init),
>  	XBOXONE_INIT_PKT(0x045e, 0x0b00, xboxone_s_init),
> +	XBOXONE_INIT_PKT(0x045e, 0x0b00, extra_input_packet_init),
>  	XBOXONE_INIT_PKT(0x0e6f, 0x0000, xboxone_pdp_init1),
>  	XBOXONE_INIT_PKT(0x0e6f, 0x0000, xboxone_pdp_init2),
>  	XBOXONE_INIT_PKT(0x24c6, 0x541a, xboxone_rumblebegin_init),
> @@ -608,6 +634,7 @@ struct usb_xpad {
>  
>  	int mapping;			/* map d-pad to buttons or to axes */
>  	int xtype;			/* type of xbox device */
> +	int pktType;          /* type of the extended packet */

Again, name needs to be fixed and why no tabs like the rest of the lines
in this structure?

thanks,

greg k-h
