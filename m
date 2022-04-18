Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87C81504C84
	for <lists+linux-input@lfdr.de>; Mon, 18 Apr 2022 08:17:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233647AbiDRGTG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Apr 2022 02:19:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233208AbiDRGTG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Apr 2022 02:19:06 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75C7917E23
        for <linux-input@vger.kernel.org>; Sun, 17 Apr 2022 23:16:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 21E33B80DC9
        for <linux-input@vger.kernel.org>; Mon, 18 Apr 2022 06:16:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21639C385AA;
        Mon, 18 Apr 2022 06:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1650262584;
        bh=yATHdJdUxYh1pnwizlem6jHisfk5Ovg3d4deT0EuMf4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tulFfhDD6qveG1eiRG+k/zlTffKEttwT9j6/1Ryyref4RcKe0k29K6yiFl/tzB/NX
         UjecHDeKpo9x1ntslTmegFgNnqDtI0m46h7oHcCLbH4ehdF/R1gIfZ+UN0V2WLUCZh
         031w5WDko9HaTWm4Gk6a7X5YOuGdrXbhtvq4uSXQ=
Date:   Mon, 18 Apr 2022 08:16:21 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Pavel Rojtberg <rojtberg@gmail.com>
Cc:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        Jasper Poppe <jgpoppe@gmail.com>,
        Jeremy Palmer <jpalmer@linz.govt.nz>,
        Ruineka <ruinairas1992@gmail.com>
Subject: Re: [PATCH 1/3] Input: xpad - add supported devices as contributed
 on github
Message-ID: <Yl0CNSYpN9swl8om@kroah.com>
References: <20220417161526.138019-1-rojtberg@gmail.com>
 <20220417161526.138019-2-rojtberg@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220417161526.138019-2-rojtberg@gmail.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Apr 17, 2022 at 06:15:24PM +0200, Pavel Rojtberg wrote:
> From: Pavel Rojtberg <rojtberg@gmail.com>
> 
> This is based on multiple commits at https://github.com/paroj/xpad
> 
> Signed-off-by: Jasper Poppe <jgpoppe@gmail.com>
> Signed-off-by: Jeremy Palmer <jpalmer@linz.govt.nz>
> Signed-off-by: Ruineka <ruinairas1992@gmail.com>
> Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>
> ---
>  drivers/input/joystick/xpad.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
> index 53126d9..257fc2c 100644
> --- a/drivers/input/joystick/xpad.c
> +++ b/drivers/input/joystick/xpad.c
> @@ -244,6 +244,7 @@ static const struct xpad_device {
>  	{ 0x0f0d, 0x0063, "Hori Real Arcade Pro Hayabusa (USA) Xbox One", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
>  	{ 0x0f0d, 0x0067, "HORIPAD ONE", 0, XTYPE_XBOXONE },
>  	{ 0x0f0d, 0x0078, "Hori Real Arcade Pro V Kai Xbox One", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
> +	{ 0x0f0d, 0x00c5, "Hori Fighting Commander ONE", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
>  	{ 0x0f30, 0x010b, "Philips Recoil", 0, XTYPE_XBOX },
>  	{ 0x0f30, 0x0202, "Joytech Advanced Controller", 0, XTYPE_XBOX },
>  	{ 0x0f30, 0x8888, "BigBen XBMiniPad Controller", 0, XTYPE_XBOX },
> @@ -260,6 +261,7 @@ static const struct xpad_device {
>  	{ 0x1430, 0x8888, "TX6500+ Dance Pad (first generation)", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX },
>  	{ 0x1430, 0xf801, "RedOctane Controller", 0, XTYPE_XBOX360 },
>  	{ 0x146b, 0x0601, "BigBen Interactive XBOX 360 Controller", 0, XTYPE_XBOX360 },
> +	{ 0x146b, 0x0604, "Bigben Interactive DAIJA Arcade Stick", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
>  	{ 0x1532, 0x0037, "Razer Sabertooth", 0, XTYPE_XBOX360 },
>  	{ 0x1532, 0x0a00, "Razer Atrox Arcade Stick", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
>  	{ 0x1532, 0x0a03, "Razer Wildcat", 0, XTYPE_XBOXONE },
> @@ -325,6 +327,7 @@ static const struct xpad_device {
>  	{ 0x24c6, 0x5502, "Hori Fighting Stick VX Alt", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
>  	{ 0x24c6, 0x5503, "Hori Fighting Edge", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
>  	{ 0x24c6, 0x5506, "Hori SOULCALIBUR V Stick", 0, XTYPE_XBOX360 },
> +	{ 0x24c6, 0x5510, "Hori Fighting Commander ONE (Xbox 360/PC Mode)", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
>  	{ 0x24c6, 0x550d, "Hori GEM Xbox controller", 0, XTYPE_XBOX360 },
>  	{ 0x24c6, 0x550e, "Hori Real Arcade Pro V Kai 360", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
>  	{ 0x24c6, 0x551a, "PowerA FUSION Pro Controller", 0, XTYPE_XBOXONE },
> @@ -337,6 +340,8 @@ static const struct xpad_device {
>  	{ 0x3285, 0x0607, "Nacon GC-100", 0, XTYPE_XBOX360 },
>  	{ 0x3767, 0x0101, "Fanatec Speedster 3 Forceshock Wheel", 0, XTYPE_XBOX },
>  	{ 0xffff, 0xffff, "Chinese-made Xbox Controller", 0, XTYPE_XBOX },
> +	{ 0x2563, 0x058d, "OneXPlayer Gamepad", 0, XTYPE_XBOX360 },
> +	{ 0x2dc8, 0x2000, "8BitDo Pro 2 Wired Controller fox Xbox", 0, XTYPE_XBOXONE },
>  	{ 0x0000, 0x0000, "Generic X-Box pad", 0, XTYPE_UNKNOWN }
>  };
>  
> @@ -429,9 +434,11 @@ static const struct usb_device_id xpad_table[] = {
>  	{ USB_DEVICE(0x0738, 0x4540) },		/* Mad Catz Beat Pad */
>  	XPAD_XBOXONE_VENDOR(0x0738),		/* Mad Catz FightStick TE 2 */
>  	XPAD_XBOX360_VENDOR(0x07ff),		/* Mad Catz GamePad */
> +	XPAD_XBOX360_VENDOR(0x0c12),		/* Zeroplus X-Box 360 controllers */
>  	XPAD_XBOX360_VENDOR(0x0e6f),		/* 0x0e6f X-Box 360 controllers */
>  	XPAD_XBOXONE_VENDOR(0x0e6f),		/* 0x0e6f X-Box One controllers */
>  	XPAD_XBOX360_VENDOR(0x0f0d),		/* Hori Controllers */
> +	XPAD_XBOX360_VENDOR(0x24c6),		/* Hori Controllers */
>  	XPAD_XBOXONE_VENDOR(0x0f0d),		/* Hori Controllers */
>  	XPAD_XBOX360_VENDOR(0x1038),		/* SteelSeries Controllers */
>  	XPAD_XBOX360_VENDOR(0x11c9),		/* Nacon GC100XF */

Why isn't this kept in sorted order?

thanks,

greg k-h
