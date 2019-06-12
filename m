Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9CF941EF3
	for <lists+linux-input@lfdr.de>; Wed, 12 Jun 2019 10:24:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730995AbfFLIY0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Jun 2019 04:24:26 -0400
Received: from cloudserver094114.home.pl ([79.96.170.134]:46818 "EHLO
        cloudserver094114.home.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730187AbfFLIY0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Jun 2019 04:24:26 -0400
Received: from 79.184.253.190.ipv4.supernova.orange.pl (79.184.253.190) (HELO kreacher.localnet)
 by serwer1319399.home.pl (79.96.170.134) with SMTP (IdeaSmtpServer 0.83.267)
 id d950445aa4b6e90a; Wed, 12 Jun 2019 10:24:23 +0200
From:   "Rafael J. Wysocki" <rjw@rjwysocki.net>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing <linux-kernel@vger.kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: Strange regression in hid_llogitech_dj (was: Re: Linux 5.2-rc4)
Date:   Wed, 12 Jun 2019 10:24:22 +0200
Message-ID: <1875376.0DUQQ8o03D@kreacher>
In-Reply-To: <nycvar.YFH.7.76.1906112358580.27227@cbobk.fhfr.pm>
References: <CAHk-=wjm7FQxdF=RKa8Xe23CLNNpbGDOACewgo8e-hwDJ8TyQg@mail.gmail.com> <2268131.Lc39eCoc3j@kreacher> <nycvar.YFH.7.76.1906112358580.27227@cbobk.fhfr.pm>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wednesday, June 12, 2019 12:02:21 AM CEST Jiri Kosina wrote:
> On Tue, 11 Jun 2019, Rafael J. Wysocki wrote:
> 
> > I noticed that the cordless mouse used by me with one of the machines here
> > stopped to work in 5.2-rc (up to and including the -rc4).
> > 
> > Bisection turned up commit 74808f9115ce ("HID: logitech-dj: add support for non
> > unifying receivers").
> > 
> > Of course, that commit does not revert cleanly from 5.2-rc4, but I have reverted
> > the changes made by it in hid/hid-ids.h and I took the version of hid/hid-logitech-dj.c
> > from commit b6aeeddef68d ("HID: logitech-dj: add logi_dj_recv_queue_unknown_work
> > helper"), which is the parent of commit 74808f9115ce, and that made the mouse
> > work again for me.
> > 
> > Here's the output of "dmesg | grep -i logitech" from 5.2-rc4 with the above changes:
> > 
> > [    4.288905] usb 1-2: Manufacturer: Logitech
> > [    5.444621] input: Logitech USB Receiver as /devices/pci0000:00/0000:00:14.0/usb1/1-2/1-2:1.0/0003:046D:C52F.0002/input/input23
> > [    5.446960] hid-generic 0003:046D:C52F.0002: input,hidraw1: USB HID v1.11 Mouse [Logitech USB Receiver] on usb-0000:00:14.0-2/input0
> > [    5.451265] input: Logitech USB Receiver Consumer Control as /devices/pci0000:00/0000:00:14.0/usb1/1-2/1-2:1.1/0003:046D:C52F.0003/input/input24
> > [    5.507545] hid-generic 0003:046D:C52F.0003: input,hiddev96,hidraw2: USB HID v1.11 Device [Logitech USB Receiver] on usb-0000:00:14.0-2/input1
> 
> Hi Rafael,
> 
> 0x046d/0xc52f is known to have issues in 5.2-rcX. There is a patch queued 
> [1] that is believed to fix all this; my plan is to send it to Linus in 
> the coming 1-2 days. If you could report whether it fixes the issues 
> you've been seeing yourself as well, it'd be helpful.
> 
> Thanks.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/commit/?h=for-5.2/fixes&id=3ed224e273ac5880eeab4c3043a6b06b0478dd56

It kind of helps, but there is a catch.

hid-logitech-dj is not loaded after a fresh boot, so I need to modprobe it manually and that
appears to be blocking (apparently indefinitely) until terminated with ^C.  But then it turns
out that hid-logitech-dj is there in the list of modules and it is in use (by usbhid) and the
mouse works.

I guess I need to update the mkinitrd configuration, but even so that is not exactly
straightforward IMO. :-)

Cheers!



