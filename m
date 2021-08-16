Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B5DE3ED743
	for <lists+linux-input@lfdr.de>; Mon, 16 Aug 2021 15:34:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239426AbhHPNag (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Aug 2021 09:30:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:49794 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241361AbhHPN04 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Aug 2021 09:26:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A027B60F46;
        Mon, 16 Aug 2021 13:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1629120383;
        bh=FccUo5HenUCGhdfiLwZKVkvAVRIVEBhpQVlmGfIRgRI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=A8qh3KrolVbPYupxdGchxWpE2mlynWjj74Lg1g5n7uzaM5CgD4VXbNnOD8P1enS9k
         EcktPJ7Bm01+AkVNq3ktTm9/AGKjgLNJ54zN500+g9lpK+tgGM1MuJ+NxDrR8UGK/w
         nToDQXm4oacgdCeZx41q2A9vqmS56rLa+j2LUS0g=
Date:   Mon, 16 Aug 2021 15:26:20 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Michal Kubecek <mkubecek@suse.cz>
Cc:     linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [REGRESSION][BISECTED] flood of "hid-generic ... control queue
 full" since v5.14-rc1
Message-ID: <YRpnfJ719DwPu2B0@kroah.com>
References: <20210816130059.3yxtdvu2r7wo4uu3@lion.mk-sys.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210816130059.3yxtdvu2r7wo4uu3@lion.mk-sys.cz>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Aug 16, 2021 at 03:00:59PM +0200, Michal Kubecek wrote:
> Hello,
> 
> starting with v5.14-rc1, my kernel log gets flooded with messages
> 
>   hid-generic 0003:051D:0002.0002: control queue full
> 
> at rate of ~33 per second. Device 051d:0002 is an APC UPS (BR-650 VA).
> I bisected the issue to commit
> 
>   7652dd2c5cb7 ("USB: core: Check buffer length matches wLength for control transfers")
> 
> Reverting this commit on top of v5.14-rc6 resolves the issue. I suspect
> the problem is some missing cleanup when usb_submit_urb() bails out on
> the newly added check but I'm not familiar enough with the code to see
> what is missing or if the problem is on USB or HID side.

But the message in the above commit does not match the message you are
seeing in your log.

Your message is coming from the hid-core.c file, where it checks to
verify if you have enough room in the buffer.  Ah, is the buffer filling
up because a driver is trying to send the wrong amount of data?

thanks,

greg k-h
