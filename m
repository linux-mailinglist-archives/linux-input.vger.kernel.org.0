Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B237A1AFEB3
	for <lists+linux-input@lfdr.de>; Mon, 20 Apr 2020 00:42:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725950AbgDSWm1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 19 Apr 2020 18:42:27 -0400
Received: from netrider.rowland.org ([192.131.102.5]:59351 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1725891AbgDSWm0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 19 Apr 2020 18:42:26 -0400
Received: (qmail 29224 invoked by uid 500); 19 Apr 2020 18:42:25 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 19 Apr 2020 18:42:25 -0400
Date:   Sun, 19 Apr 2020 18:42:25 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>
cc:     Julian Squires <julian@cipht.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        syzbot <syzbot+7bf5a7b0f0a1f9446f4c@syzkaller.appspotmail.com>,
        <linux-input@vger.kernel.org>, <andreyknvl@google.com>,
        <gregkh@linuxfoundation.org>, <ingrassia@epigenesys.com>,
        Kernel development list <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        <syzkaller-bugs@googlegroups.com>, Ping Cheng <pingc@wacom.com>,
        <pinglinux@gmail.com>, <killertofu@gmail.com>
Subject: Re: KASAN: use-after-free Read in usbhid_close (3)
In-Reply-To: <20200419171855.GJ166864@dtor-ws>
Message-ID: <Pine.LNX.4.44L0.2004191835550.28419-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 19 Apr 2020, Dmitry Torokhov wrote:

> On Sun, Apr 19, 2020 at 10:07:34AM -0400, Alan Stern wrote:
> > On Sat, 18 Apr 2020, Dmitry Torokhov wrote:
> > 
> > > On Sat, Apr 18, 2020 at 09:09:44PM -0700, Dmitry Torokhov wrote:
> > > > Hi Alan,
> > > > 
> > > > On Sat, Apr 18, 2020 at 10:16:32PM -0400, Alan Stern wrote:
> > > > > linux-input people:
> > > > > 
> > > > > syzbot has found a bug related to USB/HID/input, and I have narrowed it
> > > > > down to the wacom driver.  As far as I can tell, the problem is caused
> > > > > the fact that drivers/hid/wacom_sys.c calls input_register_device()
> > > > > in several places, but it never calls input_unregister_device().
> > > > > 
> > > > > I know very little about the input subsystem, but this certainly seems 
> > > > > like a bug.
> > > > 
> > > > Wacom driver uses devm_input_allocate_device(), so unregister should
> > > > happen automatically on device removal once we exit wacom_probe().
> > > > 
> > > > > 
> > > > > When the device is unplugged, the disconnect pathway doesn't call
> > > > > hid_hw_close().  That routine doesn't get called until the user closes
> > > > > the device file (which can be long after the device is gone and
> > > > > hid_hw_stop() has run).  Then usbhid_close() gets a use-after-free
> > > > > error when it tries to access data structures that were deallocated by
> > > > > usbhid_stop().  No doubt there are other problems too, but this is
> > > > > the one that syzbot found.
> > > > 
> > > > Unregistering the input device should result in calling wacom_close()
> > > > (if device was previously opened), which, as far as I can tell, calls
> > > > hid_hw_close().
> > > > 
> > > > I wonder if it is valid to call hid_hw_stop() before hid_hw_close()?
> > 
> > No, it isn't.  If it were, for example, why would evdev_disconnect() -> 
> > evdev_cleanup() need to call input_close_device()?
> 
> Because input and HID are not the same. For input, when we attempt to
> unregister an input device we will go through all attached input
> handlers (like evdev) and if they believe they have the device open they
> will attempt to close it. How close is implemented is up to particular
> driver.
> 
> I am not sure about HID implementation details, but I could envision
> transports where you can tell the transport that you no longer want
> events to be delivered to you ("close") vs you want to disable hardware
> ("stop") and support any order of them.

Jiri, you should know: Are HID drivers supposed to work okay when the
->close callback is issued after (or concurrently with) the ->stop
callback?

The actual bug found by syzbot was a race between those two routines in 
usbhid.

> > And why would 
> > usbhid_disconnect() deallocate the usbhid structure which usbhid_stop()
> > accesses?
> 
> This happens only after we return from hid_destroy_device(), so
> even in the presence of devm I'd expect that all devm-related stuff
> instantiated by hid-wacom would have been completed before we get back
> to usbhid_disconnect().
> 
> Can we validate that calls to wacom_close() happen?

I could find out if you think it's important.  In the syzbot tests, the 
crash occurs before wacom_close() is called.

Alan Stern

