Return-Path: <linux-input+bounces-6291-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2769701BD
	for <lists+linux-input@lfdr.de>; Sat,  7 Sep 2024 12:48:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C2CD1B22099
	for <lists+linux-input@lfdr.de>; Sat,  7 Sep 2024 10:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DF935381B;
	Sat,  7 Sep 2024 10:48:25 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [213.95.27.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690F94594A
	for <linux-input@vger.kernel.org>; Sat,  7 Sep 2024 10:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.27.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725706105; cv=none; b=N+kxBZ6H7NiYFaQYr3+PcuhG+JKVg9cu3UmnJcnD+ZuPDxFjwxtlOFIW8SrDnszKZLSdjw9R04bPxwk53cu+OT6GkdxJiEYGfW//AJYHNuSAb7NQKxC79Q9QIvmcsVgs6MLiihxIv5hxkwzKVBoz8fU67e0FKagB1CP0PlZEy38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725706105; c=relaxed/simple;
	bh=Y7XL+avUv2P9JSY4B2uFn9hxBiWWq3HusDvtWzWt/PI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mRnDacnhdyS+9qZBxW65gOEx9nSgfjR3NVDSah9dkjctxyA8brc6MmwReIkT/uTI0/TmJxcksYuIM+4DnAadFVDg8nDWR6DBAi/V/nDr22csW9fcBotrEjIKgmCO6i+NwI+T0+YgNSa8+azLEwIGAB3zvKBaz1SE4i6eo8vek94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gnumonks.org; spf=pass smtp.mailfrom=gnumonks.org; arc=none smtp.client-ip=213.95.27.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gnumonks.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gnumonks.org
Received: from uucp by ganesha.gnumonks.org with local-bsmtp (Exim 4.94.2)
	(envelope-from <laforge@gnumonks.org>)
	id 1smshh-00Gitc-3v; Sat, 07 Sep 2024 12:30:05 +0200
Received: from laforge by localhost.localdomain with local (Exim 4.98)
	(envelope-from <laforge@gnumonks.org>)
	id 1smsWI-000000017Mc-12rA;
	Sat, 07 Sep 2024 12:18:18 +0200
Date: Sat, 7 Sep 2024 12:18:18 +0200
From: Harald Welte <laforge@gnumonks.org>
To: ValdikSS <iam@valdikss.org.ru>
Cc: linux-input@vger.kernel.org
Subject: hid-lenovo breaks middle mouse button on tpIIkbd
Message-ID: <Ztwoai8_1L0rJkYp@nataraja>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Dear ValdikSS,
Dear Linux Input maintainers,

I've recently acquired a brand new tpIIkbd (ThinkPad TrackPoint Keyboard II)
which I use via bloetooth.  Sadly, the center mouse button never worked and
I finally got to try to debug what's going on here.

The keyboard has a small slider swithc to select between Android and
Windows mode.  I've set it to "windows" mode, but couldn't observe any
difference in the bug in both modes.

The keyboard shows up as /sys/kernel/debug/hid/0005:17EF:60E1.000F

== btmon

* the events are visible on bluetooth with "BTMON". Middle mouse button
  press+release looks like this:

> ACL Data RX: Handle 10 flags 0x02 dlen 11                                          #32 [hci0] 14.353057
      ATT: Handle Value Notification (0x1b) len 6
        Handle: 0x001c
          Data[4]: 04000000
> ACL Data RX: Handle 10 flags 0x02 dlen 11                                          #33 [hci0] 15.357078
      ATT: Handle Value Notification (0x1b) len 6
        Handle: 0x001c
          Data[4]: 00000000

== bluetoothd

* bluetoothd is feeding those into uhid (I checked this via strace,
  looks like this:

read(30, "\x1b\x1c\x00\x04\x00\x00\x00", 23) = 7
writev(33, [{iov_base="\x0c\x00\x00\x00\x05\x00\x02\x04\x00 ...

where '30' is the L2CAP socket and '33' is the /dev/uhid device


== /sys/kernel/debug/hid/*/event

/sys/kernel/debug/hid/*/event:

report (size 5) (numbered) =  02 04 00 00 00
Button.0001 = 0
Button.0002 = 0
Button.0003 = 1
GenericDesktop.X = 0
GenericDesktop.Y = 0
GenericDesktop.Wheel = 0

== evtest

However, evtest shows exactly nothing when the centre button is pressed
or depressed.  It works just fine for left and right button.

so somehow the events that look perfectly valid on btmon and as HID event
are lost between /dev/uhid and /dev/event*

When I rmmod the hid-lenovo module, it suddenly starts working and the
evnets are showing up in evtest (and I can start to paste the buffer
with the center button like on any other mouse/trackpad).

There are some BTN_MIDDLE quirks/workarounds in hid-lenovo.c that I don't
understand (I'm not a HID or linux input expert at all).  But my best
guess at this point is that either that code is broken, or Lenovo has
released a new version of that keyboard [or its firmware] which doesn't
need the workaround designed for earlier versions?

Having the module loaded but doing
echo 0 > /sys/devices/virtual/misc/uhid/0005:17EF:60E1.000F/middleclick_workaround
will *not* fix the bug.  The middle button is not working for both 1 or
0 in that middleclick_workaround file.

Regards,
	Harald

-- 
- Harald Welte <laforge@gnumonks.org>          https://laforge.gnumonks.org/
============================================================================
"Privacy in residential applications is a desirable marketing option."
                                                  (ETSI EN 300 175-7 Ch. A6)

