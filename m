Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44007504C85
	for <lists+linux-input@lfdr.de>; Mon, 18 Apr 2022 08:18:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235420AbiDRGVA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Apr 2022 02:21:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233208AbiDRGU6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Apr 2022 02:20:58 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 077A617E23
        for <linux-input@vger.kernel.org>; Sun, 17 Apr 2022 23:18:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B87D0B80D86
        for <linux-input@vger.kernel.org>; Mon, 18 Apr 2022 06:18:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B417FC385A1;
        Mon, 18 Apr 2022 06:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1650262698;
        bh=wWlkf/jgRasHtbWeJpWIomttlDpnS/0mutycYW1CYsk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=0n1EXF3UR/1rIe+aV+2ejPADtR0z/cNo+6SNSbsd+uHub7qjp+mZD9HjWjKL7dHBW
         5D9+eVJ+iE3Zk8KUeC4iJnsuk2Yc7YecfziatKxTk806sVL9hgMGTpQLaELHsuh0vh
         YR+SvpKvJRYP0VsKTDzIdetO33jDpIcL9FZf3Gcg=
Date:   Mon, 18 Apr 2022 08:18:15 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Pavel Rojtberg <rojtberg@gmail.com>
Cc:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        lawl <github@dumbinter.net>
Subject: Re: [PATCH 3/3] Input: xpad - Poweroff XBOX360W on mode button long
 press
Message-ID: <Yl0Cp2H6CRIsFsKT@kroah.com>
References: <20220417161526.138019-1-rojtberg@gmail.com>
 <20220417161526.138019-4-rojtberg@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220417161526.138019-4-rojtberg@gmail.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Apr 17, 2022 at 06:15:26PM +0200, Pavel Rojtberg wrote:
> From: Pavel Rojtberg <rojtberg@gmail.com>

Wait, who wrote this, "lawl" or you?


> Newer gamepads turn themselves off when the mode button is held down.
> For XBOX360W gamepads we must do this this in the driver.
> 
> Signed-off-by: lawl <github@dumbinter.net>

We need a real name here please.

> Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>
> ---
>  drivers/input/joystick/xpad.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
> index 7640cbb..a9894a6 100644
> --- a/drivers/input/joystick/xpad.c
> +++ b/drivers/input/joystick/xpad.c
> @@ -620,11 +620,13 @@ struct usb_xpad {
>  	int pad_nr;			/* the order x360 pads were attached */
>  	const char *name;		/* name of the device */
>  	struct work_struct work;	/* init/remove device from callback */
> +	time64_t mode_btn_down_ts;
>  };
>  
>  static int xpad_init_input(struct usb_xpad *xpad);
>  static void xpad_deinit_input(struct usb_xpad *xpad);
>  static void xpadone_ack_mode_report(struct usb_xpad *xpad, u8 seq_num);
> +static void xpad360w_poweroff_controller(struct usb_xpad *xpad);
>  
>  /*
>   *	xpad_process_packet
> @@ -776,6 +778,23 @@ static void xpad360_process_packet(struct usb_xpad *xpad, struct input_dev *dev,
>  	}
>  
>  	input_sync(dev);
> +
> +	/* XBOX360W controllers can't be turned off without driver assistance */
> +	if (xpad->xtype == XTYPE_XBOX360W) {
> +		if (xpad->mode_btn_down_ts > 0
> +		&& xpad->pad_present
> +		&& (ktime_get_seconds() - xpad->mode_btn_down_ts) >= 5) {

Did you run this through checkpatch?  Please indent properly and put the
"&&" on the end of the lines.

And what does "5" mean here?

> +			xpad360w_poweroff_controller(xpad);
> +			xpad->mode_btn_down_ts = 0;
> +			return;
> +		}
> +
> +		/* mode button down/up */
> +		if (data[3] & 0x04)

BIT(2)?

thanks,

greg k-h
