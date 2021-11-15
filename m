Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEFAE451742
	for <lists+linux-input@lfdr.de>; Mon, 15 Nov 2021 23:13:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240090AbhKOWQM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 15 Nov 2021 17:16:12 -0500
Received: from smtp161.vfemail.net ([146.59.185.161]:47959 "EHLO
        smtp161.vfemail.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352654AbhKOWLd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 15 Nov 2021 17:11:33 -0500
Received: (qmail 30833 invoked from network); 15 Nov 2021 22:08:30 +0000
Received: from localhost (HELO nl101-3.vfemail.net) ()
  by smtpout.vfemail.net with ESMTPS (ECDHE-RSA-AES256-GCM-SHA384 encrypted); 15 Nov 2021 22:08:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=vfemail.net; h=date:from
        :to:cc:subject:message-id:in-reply-to:references:mime-version
        :content-type:content-transfer-encoding; s=2018; bh=1U3HQA2cAVR9
        R4PHxpIc1daf4O0wxl3nAXblz5xStV0=; b=soTu/HOI+vyhszPPtEn+ydYKHrw8
        2/KZNLU4MgfMf4Pi5JYle98XBoj7eemqDAzTqJOllYEdxVl4mA3UUNVTmestOpHQ
        yJQer86TUGWq2UwqVE9NHmpr/6CQOhkZoJ1fEGNCM9U2i6bbA+TZj0P6XSKXuJrB
        Pm+rc8EOFR7UxkM=
Received: (qmail 22847 invoked from network); 15 Nov 2021 22:08:00 -0000
Received: by simscan 1.4.0 ppid: 22788, pid: 22793, t: 0.3754s
         scanners:none
Received: from unknown (HELO bmwxMDEudmZlbWFpbC5uZXQ=) (aGdudGt3aXNAdmZlbWFpbC5uZXQ=@MTkyLjE2OC4xLjE5Mg==)
  by nl101.vfemail.net with ESMTPA; 15 Nov 2021 22:07:59 -0000
Date:   Mon, 15 Nov 2021 17:08:25 -0500
From:   David Niklas <Hgntkwis@vfemail.net>
To:     linux-kernel@vger.kernel.org
Cc:     stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: Re: I need advice with UPS connection. (ping)
Message-ID: <20211115170825.24a13cf3@Zen-II-x12.niklas.com>
In-Reply-To: <20211115160918.GB109771@rowland.harvard.edu>
References: <20201109220000.2ae98fa5@Phenom-II-x6.niklas.com>
        <20211114144842.72463ccc@Zen-II-x12.niklas.com>
        <20211114211435.GA87082@rowland.harvard.edu>
        <20211114220222.31755871@Zen-II-x12.niklas.com>
        <20211115160918.GB109771@rowland.harvard.edu>
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 15 Nov 2021 11:09:18 -0500
stern@rowland.harvard.edu wrote:
> On Sun, Nov 14, 2021 at 10:02:22PM -0500, David Niklas wrote:
> >
<snip>
> Has this device ever worked with any version of Linux?

I am unaware of this device working on any version of Linux. I assumed
when I bought it that it would a least be able to connect to the USB port
correctly. I might then have to make a contribution to add support for it
to nut or apcupsd.

<snip>
> The kernel sends a Set-Idle request to the device, telling it not to 
> send any data reports when nothing has changed.  This is done 
> automatically by the usbhid driver for every USB HID device, including 
> keyboards and mice as well as your UPS.
> 
> ffff93eaa3edad80 2136086737 S Ci:3:009:0 s 81 06 2200 0000 03e4 996 <
> ffff93eaa3edad80 2136122734 C Ci:3:009:0 0 996 = 05840904 a1010924
> a1028501 09fe7901 75089501 150026ff 00b12285 0209ff79
> 
> The kernel reads the device's HID descriptor.  (The usbmon trace shows 
> only the first 32 bytes of the 996-byte descriptor.)  Again, this is 
> normal and necessary for using any HID device.
> 
> ffff93e482efb440 2139520170 C Ii:3:001:1 0:2048 1 = 08
> ffff93e482efb440 2139520180 S Ii:3:001:1 -115:2048 4 <
> 
> At this point the USB controller tells the kernel that there has been a 
> status change on port 3 of bus 3.
> 
> ffff93eaa2ff8240 2139520188 S Ci:3:001:0 s a3 00 0000 0003 0004 4 <
> ffff93eaa2ff8240 2139520197 C Ci:3:001:0 0 4 = 00010100
> 
> The kernel reads the port's status and sees that there is a "connection 
> status change" bit set and the port is no longer connected.  In other 
> words, the UPS device has disconnected itself electronically from the 
> USB bus.
> 
> ffff93eaa2ff8240 2139520200 S Co:3:001:0 s 23 01 0010 0003 0000 0
> ffff93eaa2ff8240 2139520203 C Co:3:001:0 0 0
> 
> The kernel clears the "connection status change" flag.  Following this 
> the cycle repeats.
> 
> 
> Out of all this information, the only conclusion I can draw is that the 
> UPS is not behaving like a normal device.  One possibility is that it 
> doesn't like the Set-Idle request (although if that is the case, why 
> did it remain connected long enough to send the HID descriptor?).

Thanks for the detailed breakdown!

> You can test the theory by patching the kernel, if you want.  The code 
> to change is in the source file drivers/hid/usbhid/hid-core.c, and the 
> function in question is hid_set_idle() located around line 659 in the 
> file.  Just change the statement:
> 
> 	return usb_control_msg(dev, usb_sndctrlpipe(dev, 0),
> 		HID_REQ_SET_IDLE, USB_TYPE_CLASS | USB_RECIP_INTERFACE,
> (idle << 8) | report, ifnum, NULL, 0, USB_CTRL_SET_TIMEOUT);
> 
> to:
> 
> 	return 0;
> 
> to prevent the Set-Idle request from being sent.  If the device still 
> insists on disconnecting then we'll know that this wasn't the reason.

Will do tomorrow. (I'm busy ATM)

> Also, if you have another system (say, one running Windows) which the 
> UPS does work properly with, you could try collecting the equivalent of 
> a usbmon trace from that system for purposes of comparison.  (On 
> Windows, I believe you can use Wireshark to trace USB communications.)
> 
> Alan Stern
> 

I'll have to look into that.

Thanks again!
David
