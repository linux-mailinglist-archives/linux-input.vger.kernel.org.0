Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDF4D626A57
	for <lists+linux-input@lfdr.de>; Sat, 12 Nov 2022 16:54:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232311AbiKLPyQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 12 Nov 2022 10:54:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231404AbiKLPyQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 12 Nov 2022 10:54:16 -0500
X-Greylist: delayed 1858 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 12 Nov 2022 07:54:13 PST
Received: from marmot.wormnet.eu (marmot.wormnet.eu [IPv6:2a03:9800:10:2d:3203:b3a5:8bdc:5b68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56ECF234
        for <linux-input@vger.kernel.org>; Sat, 12 Nov 2022 07:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=lentin.co.uk; s=budgerigar; h=Message-ID:References:In-Reply-To:Subject:Cc:
        To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:
        Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
        :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=omvvfR3YDbqrohFHNj/MayIbwsrzvhGgOUIUPvhuPB0=; b=DqbWsF8L/JYugGLJCbl/2FoNIk
        5qZWHUHlANrypkgPXrwo78Kzf2Qb34biz67aoS13qLawIghsY4pMOjN7DbxxV/avY4oTH64XpDUJZ
        QUUBNrv1X90ixB1x69RJ5nWJ8RmjKh+6vLJUxJf6Q7/HhziA6H51kXQ8kWxDNxZedKO0=;
Received: from localhost ([::1] helo=webmail.wormnet.eu)
        by marmot.wormnet.eu with esmtp (Exim 4.94)
        (envelope-from <jm@lentin.co.uk>)
        id 1otsLf-0001jf-Ky; Sat, 12 Nov 2022 15:23:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Sat, 12 Nov 2022 15:23:11 +0000
From:   Jamie Lentin <jm@lentin.co.uk>
To:     Josh Triplett <josh@joshtriplett.org>
Cc:     linux-input@vger.kernel.org, 1006251@bugs.debian.org
Subject: Re: USB Lenovo ThinkPad Compact Keyboard has fn_lock inverted
In-Reply-To: <Y26BMXn15Kbt6a2u@localhost>
References: <Y26BMXn15Kbt6a2u@localhost>
Message-ID: <a031b2a5ed783b1558bceedd3041bf6a@lentin.co.uk>
X-Sender: jm@lentin.co.uk
User-Agent: Roundcube Webmail/1.3.16
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 2022-11-11 17:06, Josh Triplett wrote:
> I have an external ThinkPad USB keyboard:
> 
> $ lsusb | grep -i keyboard
> Bus 003 Device 022: ID 17ef:6047 Lenovo ThinkPad Compact Keyboard with
> TrackPoint
> 
> The Linux kernel exposes a fn_lock attribute in sysfs for this 
> keyboard:
> 
> $ cat
> sys/devices/pci0000:00/0000:00:14.0/usb3/3-5/3-5.4/3-5.4.3/3-5.4.3:1.1/0003:17EF:6047.000F/fn_lock
> 1
> 
> However, this attribute appears inverted for this particular keyboard:
> it seems to be 1 when FnLock is *disabled* and 0 when FnLock is
> *enabled*. In order to enable FnLock, I have to write 0 to this file.

Under Windows the default actions of the Function keys are the media 
keys, i.e. pressing F1 is Mute. Fn-"Mute" is F1, or enabling Fn-Lock & 
"Mute". That's why when /fn_lock is 1, the Mute key is F1.

With keyboards built into Thinkpads there's a BIOS setting to invert the 
behaviour of Fn-Lock (and thus have Fn keys by default), as well as 
swapping Fn<->Ctrl, but there's no equivalent option for the external 
keyboards.

What's the wrong way around here is hid-lenovo assumes that you want 
Fn-Lock on when connecting to the keyboard, not off. My assumption at 
the time was that whilst it's different to how the keyboard behaves 
under Windows, it'd be a more useful default.

> (Also, separately from that, it would be nice if the kernel could 
> handle
> fn_lock toggling *internally*, rather than expecting userspace to do 
> it.
> As far as I can tell, it does handle similar things for some keyboards,
> but not this one.)

Agreed. This was something I looked into when I was adding support for 
the keyboards. For yours it's a pretty trivial addition, but for the USB 
variant you can't send the command in the middle of the USB interrupt 
receiving the keypress, solving this seemed to require quite a lot of 
boilerplate for what would have been pretty trivial in userland.

Of course, It's very easily possible that I missed something, or there's 
a helper to do this sort of thing that now exists.

Cheers,
