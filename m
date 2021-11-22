Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4F3F4595F5
	for <lists+linux-input@lfdr.de>; Mon, 22 Nov 2021 21:13:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239667AbhKVUQd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Nov 2021 15:16:33 -0500
Received: from netrider.rowland.org ([192.131.102.5]:44527 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S236203AbhKVUQc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Nov 2021 15:16:32 -0500
Received: (qmail 112284 invoked by uid 1000); 22 Nov 2021 15:13:24 -0500
Date:   Mon, 22 Nov 2021 15:13:24 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     David Niklas <Hgntkwis@vfemail.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: Re: I need advice with UPS connection. (ping)
Message-ID: <YZv55KMsuSYanfYp@rowland.harvard.edu>
References: <20201109220000.2ae98fa5@Phenom-II-x6.niklas.com>
 <20211114144842.72463ccc@Zen-II-x12.niklas.com>
 <20211114211435.GA87082@rowland.harvard.edu>
 <20211114220222.31755871@Zen-II-x12.niklas.com>
 <20211115160918.GB109771@rowland.harvard.edu>
 <20211117002359.03b36ec6@Zen-II-x12.niklas.com>
 <20211117170817.GD172151@rowland.harvard.edu>
 <20211119171915.6a8cac47@Zen-II-x12.niklas.com>
 <YZm03KTcWOwtMtCN@rowland.harvard.edu>
 <20211122112526.501c5f66@Zen-II-x12.niklas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211122112526.501c5f66@Zen-II-x12.niklas.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Nov 22, 2021 at 11:25:26AM -0500, David Niklas wrote:
> Ok, I first edited the kernel to return -ENOMEM like you suggested but
> the UPS still disconnected. I then edited it again to re-add the 1060
> byte request and the UPS still disconnected.
> 
> I'm attaching the usbmon traces.
> If you need any additional info I'll do my best to provide it.

Holy cow!  I just realized what's going on.  And these little changes 
we've been messing around with have nothing to do with it.

For the first time, I looked at the timestamps in the usbmon traces.  It 
turns out that the disconnects occur several seconds after the kernel 
retrieves the HID report descriptor from the device.  Under normal 
conditions we would expect to see report packets coming in from the 
device, starting just a fraction of a second after the descriptor is 
received.  But that isn't happening in the Linux traces, whereas it does 
happen in the Windows pcap log.

I would guess that the UPS is programmed to disconnect itself 
electronically from the USB bus if it doesn't get any requests for 
reports within a couple of seconds.  That certainly would explain what 
you've been seeing.  I can't imagine why it would be programmed to 
behave this way, but companies have been known to do stranger things.

As for why the kernel doesn't try to get the reports...  That's a little 
harder to answer.  Maybe Jiri or Benjamin will know something about it.  

The UPS's vendor ID is 0d9f (POWERCOM) and the product ID is 0004.  Now, 
the drivers/hid/hid-quirks.c file contains a quirk entry for 0d9f:0002 
(product POWERCOM_UPS), which is probably an earlier model of the same 
device, or a very similar device.  This quirk entry is in the 
hid_ignore_list; it tells the HID core not to handle the device at all.

I don't know why that quirk entry is present, and furthermore, it can't 
directly affect what is happening with your device because the product 
IDs are different.  Still, it is an indication that something strange is 
going on behind the scenes.

Perhaps there is no kernel driver for these UPS devices?  Perhaps the 
intention is that some user program will handle all the communication 
when one of them is detected?  A quick search on Google turns up 
usbhid-ups, part of Network USB Tools (NUT) -- maybe you need to 
install that package in order to use the device.

I don't know what the full story is.  With luck, Jiri or Benjamin can 
help more.

Alan Stern
