Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31D1A1AF643
	for <lists+linux-input@lfdr.de>; Sun, 19 Apr 2020 04:16:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725939AbgDSCQe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 18 Apr 2020 22:16:34 -0400
Received: from netrider.rowland.org ([192.131.102.5]:34229 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1725827AbgDSCQd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 18 Apr 2020 22:16:33 -0400
Received: (qmail 28257 invoked by uid 500); 18 Apr 2020 22:16:32 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 18 Apr 2020 22:16:32 -0400
Date:   Sat, 18 Apr 2020 22:16:32 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Julian Squires <julian@cipht.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        syzbot <syzbot+7bf5a7b0f0a1f9446f4c@syzkaller.appspotmail.com>
cc:     linux-input@vger.kernel.org, <andreyknvl@google.com>,
        <gregkh@linuxfoundation.org>, <ingrassia@epigenesys.com>,
        Kernel development list <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        <syzkaller-bugs@googlegroups.com>
Subject: Re: KASAN: use-after-free Read in usbhid_close (3)
In-Reply-To: <000000000000f610e805a39af1d0@google.com>
Message-ID: <Pine.LNX.4.44L0.2004182158020.26218-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

linux-input people:

syzbot has found a bug related to USB/HID/input, and I have narrowed it
down to the wacom driver.  As far as I can tell, the problem is caused
the fact that drivers/hid/wacom_sys.c calls input_register_device()
in several places, but it never calls input_unregister_device().

I know very little about the input subsystem, but this certainly seems 
like a bug.

When the device is unplugged, the disconnect pathway doesn't call
hid_hw_close().  That routine doesn't get called until the user closes
the device file (which can be long after the device is gone and
hid_hw_stop() has run).  Then usbhid_close() gets a use-after-free
error when it tries to access data structures that were deallocated by
usbhid_stop().  No doubt there are other problems too, but this is
the one that syzbot found.

Can any of you help fix this?  Thanks.

Alan Stern

