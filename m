Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DEDC45818C
	for <lists+linux-input@lfdr.de>; Sun, 21 Nov 2021 03:54:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237644AbhKUC50 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 20 Nov 2021 21:57:26 -0500
Received: from netrider.rowland.org ([192.131.102.5]:59503 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S237643AbhKUC50 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 20 Nov 2021 21:57:26 -0500
Received: (qmail 68548 invoked by uid 1000); 20 Nov 2021 21:54:20 -0500
Date:   Sat, 20 Nov 2021 21:54:20 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     David Niklas <Hgntkwis@vfemail.net>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: Re: I need advice with UPS connection. (ping)
Message-ID: <YZm03KTcWOwtMtCN@rowland.harvard.edu>
References: <20201109220000.2ae98fa5@Phenom-II-x6.niklas.com>
 <20211114144842.72463ccc@Zen-II-x12.niklas.com>
 <20211114211435.GA87082@rowland.harvard.edu>
 <20211114220222.31755871@Zen-II-x12.niklas.com>
 <20211115160918.GB109771@rowland.harvard.edu>
 <20211117002359.03b36ec6@Zen-II-x12.niklas.com>
 <20211117170817.GD172151@rowland.harvard.edu>
 <20211119171915.6a8cac47@Zen-II-x12.niklas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211119171915.6a8cac47@Zen-II-x12.niklas.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Nov 19, 2021 at 05:19:15PM -0500, David Niklas wrote:
> On Wed, 17 Nov 2021 12:08:17 -0500
> Alan Stern <stern@rowland.harvard.edu> wrote:
> > On Wed, Nov 17, 2021 at 12:23:59AM -0500, David Niklas wrote:

> > > I can also try and use SnoopyPro and busdog if the output is
> > > undesirable. USBPcap spits out a pcap file which can be analyzed by
> > > wireshark using dissectors -- somehow (I really should practice using
> > > wireshark.)  
> > 
> > Wireshark on my system has no trouble reading your pcap file.
> 
> Misunderstanding then. I was thinking in terms of the USBPcap docs. I was
> saying a dissector would need to be written. I'm glad it worked for you.
> https://desowin.org/usbpcap/dissectors.html
> "Writing USB class dissector"

Evidently wireshark already has built-in dissectors for standard USB 
communications.

> > This will cause the kernel to ask for 1060 bytes rather than 996.
> > (It's also potentially dangerous, because it asks for 1060 bytes to be
> > stored into a 996-byte buffer; if the device sends more data than
> > expected then the excess will be written beyond the end of the buffer.)
> > 
> > Please send a usbmon trace showing what happens with this patch
> > applied. And you might as well put the Set-Idle request back in,
> > because now we know Windows does send that request.
> > 
> <snip>
> 
> It still disconnects. I've attached the usbmon output.

The trace clearly shows the request for a 1060-byte HID report 
descriptor and the device sending back a 996-byte reply, just like in 
Windows.  And yet the disconnect still occurs.

The only remaining difference is the transfer of string descriptors.  
You can prevent Linux from asking for them by editing usb_string() in 
drivers/usb/core/message.c.  Just make the function return -ENOMEM 
unconditionally.  That will stop the requests from going out.

Alan Stern
