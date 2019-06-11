Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76BD341737
	for <lists+linux-input@lfdr.de>; Tue, 11 Jun 2019 23:53:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407196AbfFKVxX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Jun 2019 17:53:23 -0400
Received: from cloudserver094114.home.pl ([79.96.170.134]:53870 "EHLO
        cloudserver094114.home.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407159AbfFKVxX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Jun 2019 17:53:23 -0400
Received: from 79.184.253.190.ipv4.supernova.orange.pl (79.184.253.190) (HELO kreacher.localnet)
 by serwer1319399.home.pl (79.96.170.134) with SMTP (IdeaSmtpServer 0.83.267)
 id 4ec8a4f90c997497; Tue, 11 Jun 2019 23:53:21 +0200
From:   "Rafael J. Wysocki" <rjw@rjwysocki.net>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing <linux-kernel@vger.kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org
Subject: Strange regression in hid_llogitech_dj (was: Re: Linux 5.2-rc4)
Date:   Tue, 11 Jun 2019 23:53:20 +0200
Message-ID: <2268131.Lc39eCoc3j@kreacher>
In-Reply-To: <CAHk-=wjm7FQxdF=RKa8Xe23CLNNpbGDOACewgo8e-hwDJ8TyQg@mail.gmail.com>
References: <CAHk-=wjm7FQxdF=RKa8Xe23CLNNpbGDOACewgo8e-hwDJ8TyQg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sunday, June 9, 2019 5:46:48 AM CEST Linus Torvalds wrote:
> No, I'm not confused, and I haven't lost track of what day it is, I do
> actually know that it's still Saturday here, not Sunday, and I'm just
> doing rc4 a bit early because I'll be on an airplane during my normal
> release time. And while I've done releases on airports and airplanes
> before, I looked at my empty queue of pull requests and went "let's
> just do it now".
> 
> We've had a fairly calm release so far, and on the whole that seems to
> hold. rc4 isn't smaller than rc3 was (it's a bit bigger), but rc3 was
> fairly small, so the size increase isn't all that worrisome. I do hope
> that we'll start actually shrinking now, though.

I noticed that the cordless mouse used by me with one of the machines here
stopped to work in 5.2-rc (up to and including the -rc4).

Bisection turned up commit 74808f9115ce ("HID: logitech-dj: add support for non
unifying receivers").

Of course, that commit does not revert cleanly from 5.2-rc4, but I have reverted
the changes made by it in hid/hid-ids.h and I took the version of hid/hid-logitech-dj.c
from commit b6aeeddef68d ("HID: logitech-dj: add logi_dj_recv_queue_unknown_work
helper"), which is the parent of commit 74808f9115ce, and that made the mouse
work again for me.

Here's the output of "dmesg | grep -i logitech" from 5.2-rc4 with the above changes:

[    4.288905] usb 1-2: Manufacturer: Logitech
[    5.444621] input: Logitech USB Receiver as /devices/pci0000:00/0000:00:14.0/usb1/1-2/1-2:1.0/0003:046D:C52F.0002/input/input23
[    5.446960] hid-generic 0003:046D:C52F.0002: input,hidraw1: USB HID v1.11 Mouse [Logitech USB Receiver] on usb-0000:00:14.0-2/input0
[    5.451265] input: Logitech USB Receiver Consumer Control as /devices/pci0000:00/0000:00:14.0/usb1/1-2/1-2:1.1/0003:046D:C52F.0003/input/input24
[    5.507545] hid-generic 0003:046D:C52F.0003: input,hiddev96,hidraw2: USB HID v1.11 Device [Logitech USB Receiver] on usb-0000:00:14.0-2/input1

Please let me know what you need to diagnose this.

Thanks,
Rafael




