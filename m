Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57F94504CE4
	for <lists+linux-input@lfdr.de>; Mon, 18 Apr 2022 08:59:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236884AbiDRHBg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Apr 2022 03:01:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbiDRHBa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Apr 2022 03:01:30 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD592165B6
        for <linux-input@vger.kernel.org>; Sun, 17 Apr 2022 23:58:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7B01BB8037A
        for <linux-input@vger.kernel.org>; Mon, 18 Apr 2022 06:58:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB04BC385A7;
        Mon, 18 Apr 2022 06:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1650265129;
        bh=kgVT2wO9G7XWeOTDd7EXAci8F9FssDk3ZV+RF0zrnM0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=g69u6k4VMozpz/diUF7fV5xrMICKOn2d3ItnOyXeF78xGZXCWkoNyPphxXoq6IjK9
         mcdrq+28Fb7FzHxw10/SFgnysAtqVEFlCCBRKuhty+pB0AbUVnQ9y0WArCZTWZvqvt
         wIjMlFZ8jA6i6lG4nj11g39yXjcMRmp4tQOFDRlM=
Date:   Mon, 18 Apr 2022 08:58:46 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Santosh De Massari <s.demassari@gmail.com>
Cc:     Pavel Rojtberg <rojtberg@gmail.com>, linux-input@vger.kernel.org,
        dmitry.torokhov@gmail.com
Subject: Re: [PATCH 3/3] Input: xpad - Poweroff XBOX360W on mode button long
 press
Message-ID: <Yl0MJmlcNklN6RJm@kroah.com>
References: <20220417161526.138019-1-rojtberg@gmail.com>
 <20220417161526.138019-4-rojtberg@gmail.com>
 <Yl0Cp2H6CRIsFsKT@kroah.com>
 <H4WIAR.ANYJZLRXMNAS1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <H4WIAR.ANYJZLRXMNAS1@gmail.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Apr 18, 2022 at 08:45:53AM +0200, Santosh De Massari wrote:
> 
> 
> On Mon, Apr 18, 2022 at 08:18, Greg KH <gregkh@linuxfoundation.org> wrote:
> > On Sun, Apr 17, 2022 at 06:15:26PM +0200, Pavel Rojtberg wrote:
> > >  From: Pavel Rojtberg <rojtberg@gmail.com>
> > 
> > Wait, who wrote this, "lawl" or you?
> 
> I wrote this. Santosh De Massari. But I never submitted it to LKML
> because e-mail sounded too hard and the LKML too scary. Apologies
> in advance for any misconfigured mail client etc. on my side.
> 
> If Pavel or anyone else wants to get this patch merged, they're
> more than welcome to from my side.
> 
> 
> > 
> > >  Newer gamepads turn themselves off when the mode button is held
> > > down.
> > >  For XBOX360W gamepads we must do this this in the driver.
> > > 
> > >  Signed-off-by: lawl <github@dumbinter.net>
> > 
> > We need a real name here please.
> 
> You can use Santosh De Massari <s.demassari@gmail.com>

Wonderful, thanks!

> > >  Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>
> > >  ---
> > >   drivers/input/joystick/xpad.c | 19 +++++++++++++++++++
> > >   1 file changed, 19 insertions(+)
> > > 
> > >  diff --git a/drivers/input/joystick/xpad.c
> > > b/drivers/input/joystick/xpad.c
> > >  index 7640cbb..a9894a6 100644
> > >  --- a/drivers/input/joystick/xpad.c
> > >  +++ b/drivers/input/joystick/xpad.c
> > >  @@ -620,11 +620,13 @@ struct usb_xpad {
> > >   	int pad_nr;			/* the order x360 pads were attached */
> > >   	const char *name;		/* name of the device */
> > >   	struct work_struct work;	/* init/remove device from callback */
> > >  +	time64_t mode_btn_down_ts;
> > >   };
> > > 
> > >   static int xpad_init_input(struct usb_xpad *xpad);
> > >   static void xpad_deinit_input(struct usb_xpad *xpad);
> > >   static void xpadone_ack_mode_report(struct usb_xpad *xpad, u8
> > > seq_num);
> > >  +static void xpad360w_poweroff_controller(struct usb_xpad *xpad);
> > > 
> > >   /*
> > >    *	xpad_process_packet
> > >  @@ -776,6 +778,23 @@ static void xpad360_process_packet(struct
> > > usb_xpad *xpad, struct input_dev *dev,
> > >   	}
> > > 
> > >   	input_sync(dev);
> > >  +
> > >  +	/* XBOX360W controllers can't be turned off without driver
> > > assistance */
> > >  +	if (xpad->xtype == XTYPE_XBOX360W) {
> > >  +		if (xpad->mode_btn_down_ts > 0
> > >  +		&& xpad->pad_present
> > >  +		&& (ktime_get_seconds() - xpad->mode_btn_down_ts) >= 5) {
> > 
> > Did you run this through checkpatch?  Please indent properly and put the
> > "&&" on the end of the lines.
> > 
> > And what does "5" mean here?
> 
> Assuming Pavel will take care of this, but since I'm replying anyways.
> Seconds.
> Chosen arbitrarily.

Then perhaps a #define somewhere saying this would be good for when in
the future it has to be changed :)

thanks,

greg k-h
