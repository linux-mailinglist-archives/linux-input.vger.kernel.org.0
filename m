Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76C14504F5C
	for <lists+linux-input@lfdr.de>; Mon, 18 Apr 2022 13:25:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232243AbiDRL2W (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Apr 2022 07:28:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233887AbiDRL2T (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Apr 2022 07:28:19 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1582219029
        for <linux-input@vger.kernel.org>; Mon, 18 Apr 2022 04:25:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 456BA60A6F
        for <linux-input@vger.kernel.org>; Mon, 18 Apr 2022 11:25:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30739C385A1;
        Mon, 18 Apr 2022 11:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1650281134;
        bh=gOCpyYkYtF3EIXkr6vms+8+INiMWhTehzxMJJYZNhmk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WbmUnUZkKI/rLMwQKXiH+2lalyawxwlePE+92NJrX+rmj1RMnin5wc2egN7GOViIr
         yeTCCrOMg6J/9ua/TpXHBbW0NowForBXjBlJldu3vsFLlKnHEA21SkQSfXwEXHQCJ2
         Fot/PFqMKc6/m/QbgK0Gb6m1yqA9h0amL94Dmwls=
Date:   Mon, 18 Apr 2022 13:25:31 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Pavel Rojtberg <rojtberg@gmail.com>
Cc:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        Christopher Crockett <chaorace@gmail.com>,
        Fmstrat <nospam@nowsci.com>
Subject: Re: [PATCH] Input: xpad - add support for XBOX One Elite paddles
Message-ID: <Yl1Kq/RcqvKVrHEO@kroah.com>
References: <20220417161908.138625-1-rojtberg@gmail.com>
 <Yl0DPYdzSK5C+hEF@kroah.com>
 <c13466b1-80f1-63a6-1d39-2da397d1622a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c13466b1-80f1-63a6-1d39-2da397d1622a@gmail.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_FILL_THIS_FORM_SHORT,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Apr 18, 2022 at 12:46:53PM +0200, Pavel Rojtberg wrote:
> 
> 
> Am 18.04.22 um 08:20 schrieb Greg KH:
> > On Sun, Apr 17, 2022 at 06:19:08PM +0200, Pavel Rojtberg wrote:
> >> From: Christopher Crockett <chaorace@gmail.com>
> >>
> >> An effort has been made to support every official model and firmware
> >> version I could track down info on. The following controllers _should_
> >> have working paddles with this PR:
> >> - Xbox Elite (**untested**)
> >> - Xbox Elite Series 2 on early firmwares (**untested**)
> >> - Xbox Elite Series 2 on v4 firmwares (Tested v4.8.1908.0)
> >> - Xbox Elite Series 2 on v5 pre-BLE firmwares (**untested**)
> >> - Xbox Elite Series 2 on v5 post-BLE firmwares (Tested v5.13.3143.0)
> >>
> >> This patch also introduces correct handling for the Elite 1 controller
> >> and properly suppresses paddle inputs when using a custom profile slot.
> >>
> >> Starting in v5.11, certain inputs for the Elite 2 were moved to an extra
> >> packet that is not enabled by default.
> > 
> > why does 5.11 matter here?
> 
> This refers to the gamepad firmware, not to Linux :)

Ah, you should make that obvious :)

> >>
> >> We must first manually enable this extra packet in order to correctly
> >> process paddle input data with these later firmwares.
> >>
> >> For further details see: https://github.com/paroj/xpad/pull/195
> > 
> > don't like to random web sites, summarize in here properly.
> 
> The summary here should be complete. Do you have any specific questions?

If the summary is fine, no need to link to the github location, right?

> >> Signed-off-by: Fmstrat <nospam@nowsci.com>
> > 
> > I doubt that is a correct email address and valid name :(
> 
> Unfortunately this is all I get at github. The only alternative would be no attribution at all.

Did you ask?

> >> Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>
> >> ---
> >>  drivers/input/joystick/xpad.c | 239 ++++++++++++++++++++++++++++++++++++++++++---------------
> >>  1 file changed, 176 insertions(+), 63 deletions(-)
> >>
> >> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
> >> index 53126d9..0746813 100644
> >> --- a/drivers/input/joystick/xpad.c
> >> +++ b/drivers/input/joystick/xpad.c
> >> @@ -80,6 +80,7 @@
> >>  #define MAP_TRIGGERS_TO_BUTTONS		(1 << 1)
> >>  #define MAP_STICKS_TO_NULL		(1 << 2)
> >>  #define MAP_SELECT_BUTTON		(1 << 3)
> >> +#define MAP_PADDLES				(1 << 4)
> >>  #define DANCEPAD_MAP_CONFIG	(MAP_DPAD_TO_BUTTONS |			\
> >>  				MAP_TRIGGERS_TO_BUTTONS | MAP_STICKS_TO_NULL)
> >>  
> >> @@ -89,6 +90,12 @@
> >>  #define XTYPE_XBOXONE     3
> >>  #define XTYPE_UNKNOWN     4
> >>  
> >> +#define PKT_XB              0
> >> +#define PKT_XBE1            1
> >> +#define PKT_XBE2_FW_OLD     2
> >> +#define PKT_XBE2_FW_5_EARLY 3
> >> +#define PKT_XBE2_FW_5_11    4
> >> +
> >>  static bool dpad_to_buttons;
> >>  module_param(dpad_to_buttons, bool, S_IRUGO);
> >>  MODULE_PARM_DESC(dpad_to_buttons, "Map D-PAD to buttons rather than axes for unknown pads");
> >> @@ -111,6 +118,7 @@ static const struct xpad_device {
> >>  	char *name;
> >>  	u8 mapping;
> >>  	u8 xtype;
> >> +	u8 pktType;
> > 
> > Please use proper Linux kernel naming schemes.
> 
> that would be pkt_type, right?

You have vowels, "packet_type" is nicer.

> >>  } xpad_device[] = {
> >>  	{ 0x0079, 0x18d4, "GPD Win 2 X-Box Controller", 0, XTYPE_XBOX360 },
> >>  	{ 0x044f, 0x0f00, "Thrustmaster Wheel", 0, XTYPE_XBOX },
> >> @@ -128,7 +136,8 @@ static const struct xpad_device {
> >>  	{ 0x045e, 0x0291, "Xbox 360 Wireless Receiver (XBOX)", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360W },
> >>  	{ 0x045e, 0x02d1, "Microsoft X-Box One pad", 0, XTYPE_XBOXONE },
> >>  	{ 0x045e, 0x02dd, "Microsoft X-Box One pad (Firmware 2015)", 0, XTYPE_XBOXONE },
> >> -	{ 0x045e, 0x02e3, "Microsoft X-Box One Elite pad", 0, XTYPE_XBOXONE },
> >> +	{ 0x045e, 0x02e3, "Microsoft X-Box One Elite pad", MAP_PADDLES, XTYPE_XBOXONE },
> >> +	{ 0x045e, 0x0b00, "Microsoft X-Box One Elite 2 pad", MAP_PADDLES, XTYPE_XBOXONE },
> >>  	{ 0x045e, 0x02ea, "Microsoft X-Box One S pad", 0, XTYPE_XBOXONE },
> >>  	{ 0x045e, 0x0719, "Xbox 360 Wireless Receiver", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360W },
> >>  	{ 0x045e, 0x0b12, "Microsoft Xbox Series S|X Controller", MAP_SELECT_BUTTON, XTYPE_XBOXONE },
> >> @@ -390,6 +399,13 @@ static const signed short xpad_abs_triggers[] = {
> >>  	-1
> >>  };
> >>  
> >> +/* used when the controller has extra paddle buttons */
> >> +static const signed short xpad_btn_paddles[] = {
> >> +	BTN_TRIGGER_HAPPY5, BTN_TRIGGER_HAPPY6, /* paddle upper right, lower right */
> >> +	BTN_TRIGGER_HAPPY7, BTN_TRIGGER_HAPPY8, /* paddle upper left, lower left */
> >> +	-1						/* terminating entry */
> > 
> > 0 should be the terminator, right?
> 
> while 0 would probably do, the other arrays in this file also use -1.

Ah, ok, nevermind.

> Do I read correctly, that your comments merely aiming at style mean that
> you are ok with the code in general?

Yes, the logic seems fine if it has been tested by others.

thanks,

greg k-h
