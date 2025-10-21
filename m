Return-Path: <linux-input+bounces-15626-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF6ABF4A23
	for <lists+linux-input@lfdr.de>; Tue, 21 Oct 2025 07:22:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 681BC4E18CB
	for <lists+linux-input@lfdr.de>; Tue, 21 Oct 2025 05:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33DBB148850;
	Tue, 21 Oct 2025 05:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IJpMKNqF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829D38460
	for <linux-input@vger.kernel.org>; Tue, 21 Oct 2025 05:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761024174; cv=none; b=M0nc+jN953HkZz6XhU7ZzsPo+C10kwnJk4bhDsG8bJlTviUqRpYwHyz2ed1LyIyAo36VIC55hiSAvW/4Azs+Avtva5tufOjtBb3N/vjeyj1ZXWOfqLCWOgDYZIo1bBCw09O/vSOjsSjyw8VxO+i0tMzV3CSwAJphO+OR65CQw2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761024174; c=relaxed/simple;
	bh=gQz4hFOJioXy0VprA2p0cDxzWin7j/k/IjErKLa0jak=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=NJPMumwo6bjHxo9IBsEj/sRZtI7wQOKmoafktYKokEyyBnp7IxF/rZih72f/R14kHIjMyHPBKvSpa0ffNf1yIwsv//U7IH80a6EKQgJc0yWJ91RKJ+0rMX/kJq0ex2cd22aqpRkoFb+t1wG93J/PX73MqXLcjc0SZ2q6Vb1TGMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IJpMKNqF; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-59d576379b9so1727735137.1
        for <linux-input@vger.kernel.org>; Mon, 20 Oct 2025 22:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761024171; x=1761628971; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=P16EwMxd1xvCSnX9bsol2JQHTl27LT5Gi63dav7i+Cw=;
        b=IJpMKNqF1FVK6XhJQg1MmNKTt07eNNlRgY9BBuWQ9geOStPH3CkXF2n9Uzy8u8I0G/
         orGUU0Z9ni73D50YhYJKSvJUPUFeU003Qb/2B/o5wWpwZhByB4HyC52+bp8FoTOV4viP
         Sibo4ikNT2cxiHC1Zi2Flz7XGph7d+5YP9MUoNO932RJ0V0K8PToq72INH/OtI5U+kIN
         9HbJC/21olopuSJ3C7/2kZSyBhOSWcOqfBgLpbpIfSM1lTxnA8na/djZqQ6es/LDOaCv
         lPRU7GGOtyp0uToodwrG3AqhUlulk+Rn8ALc76tb8/VgCYODfN3YqJg6476u40vRJ0kU
         1VUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761024171; x=1761628971;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P16EwMxd1xvCSnX9bsol2JQHTl27LT5Gi63dav7i+Cw=;
        b=hqbSx9otKtqzl4CFaENyGHkKmKRZ1ntJXsmwejmY+NaVzsc85Dn0H22sqi15Rwvm2x
         dsb7QUGkKgyjtZ0xJZZVlAuIbHX16mYMFOQOGwGl9Wfxv+U5iZlkH4fR95KL6cf2WR4N
         +oeFfF6SeGcBW984oFm6ByllzFAqrbm2rz/RAxGTrcuBZMKlb/79LW8YN3dTJ01f0KKx
         OvBmI+qdAHVKLSDEPo8z2PDVIDte+lol+TQar8BpnGTCjr1RmtvbUwz+5I2/UwQeU0lI
         Xoc9xNFv5ZqurDaYp8DMNFVaO8mcaSEmFHk0EFrM+bnQm3VCfqh+eKtfC8KfnCgaKnPG
         1tIA==
X-Gm-Message-State: AOJu0YyVCTv9Y4kcJ+P/ACXl6TOPRWM7r7rv/fkCBeQ+RkfELERd5aP4
	bU0n7xVPj33bWPBIJZ/zdyGnStNXSKm/+HIAwyOpTfArHYIDUw9s53aULHgXgZfacA+n/uUwibH
	uaquIu5moZ4mU8yytXiyCPn64/4lJNpqQIMd9
X-Gm-Gg: ASbGncuGOYcZWw3cOqHM4Y1/N6lwvj27H4oq2ut4mofu8ErPzseifcW/l439qUuDZwW
	Z448klNCKeDkwjQLp9mECj9TmPoDMcDhMuaFzZ07TWL04olH0vuywxVaUnkdDEhGclUvRXQVhnL
	nDqOpFF13udah3P4manMffXnyjvlvVwlc3m0mzliULTdj63A7tt2/kbTPyBrbrSr4WiNivKT+un
	un7qF/S9849mw9YMD1HzrYwmmjGBI9izf6lG8XorhCWQvx1fpgbDlz0SdOEhAnpyOoRdKHWsYMG
	Lghe
X-Google-Smtp-Source: AGHT+IEOOrb+q+ERVmGolPWi0przvpuxHQ7h9wYz1fEhvLouDiqsp0VN/ssrquzt4jqB5WkR1WevIFAMQGR+D+W6ML8=
X-Received: by 2002:a05:6102:3909:b0:523:712d:44a1 with SMTP id
 ada2fe7eead31-5d7dd4b254emr4590708137.19.1761024171183; Mon, 20 Oct 2025
 22:22:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Glenn Alexander <glenalec0@gmail.com>
Date: Tue, 21 Oct 2025 16:22:40 +1100
X-Gm-Features: AS18NWDJRbHqgmK6HKE8MyWkRbeHLhQ5zV_WH-QT5z9nqTzHQlFIB4M0VtnlRhI
Message-ID: <CAPT-+AQp_FPAYEYeA4+3-Mj6X8NaU0Rh7T_4sAPjA0aN+2TNBA@mail.gmail.com>
Subject: Specialist keyboard (Infogrip BAT) stopped working as of kernel 6.12.35
To: linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

(Hoping I got this right - First kernal mailing list post!)

Hi. I primarily use an Infogrip BAT chord keyboard (USB device) for text entry.

As of kernel 6.12.35 it no longer works beyond the GRUB bootloader
(where it does still function).

This issue has exhibited for me on Debian/Testing x86_64. and
Raspberry Pi OS AArch64.

Reverting back to boot to kernel 6.12.33 fixes the issue.

The BAT is a USB device that largely emulates a regular PC USB
keyboard from the computer's perspective (allowing it to work with a
standard BIOS, GRUB, various OSes, etc. without special drivers) but
there is presumably some differences presented to the system that the
latest Kernel is unhappy with. A regular USB QWERTY keyboard still
works with the newer kernel.

I don't expect any devs to have this device for testing purposes but I
am, of course, happy to assist in providing any information that is
useful to solve this issue for me.

I am not a programmer myself, but am reasonably comfortable on the command line.

Thanks.

...

As far as I can get on my own, KDE/InfoCenter reports the USB device
profile, under both kernels, as:

BAT Personal Keyboard v1.6
Manufacturer: InfoGrip
Class 0 ((Defined at Interface level))
Subclass 0
Protocol 0
USB Version 1.10
Vendor ID 0x04d8 (Microchip Technology, Inc.)
Product ID 0xfdd0
Speed 1.5 Mbit/s
Channels 0
Max. Packet Size 8

So the device is showing up as connected and query-able under both Kernels.

Comparing the boot logs (extracted from journalctl) I can see a
difference around the problem device ID between each kernel:

Kernel 6.12.33:

kernel: usb 1-9.4.4: new low-speed USB device number 15 using xhci_hcd
kernel: usb 1-9.4.4: New USB device found, idVendor=04d8,
idProduct=fdd0, bcdDevice= 1.00
kernel: usb 1-9.4.4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
kernel: usb 1-9.4.4: Product: BAT Personal Keyboard v1.6
kernel: usb 1-9.4.4: Manufacturer: InfoGrip
kernel: input: InfoGrip BAT Personal Keyboard v1.6 as
/devices/pci0000:00/0000:00:14.0/usb1/1-9/1-9.4/1-9.4.4/1-9.4.4:1.0/0003:04D8:FDD0.0005/input/input11
kernel: usb 1-9.4.2.3: new full-speed USB device number 16 using xhci_hcd
kernel: audit: type=1400 audit(1752227462.248:128): apparmor="ALLOWED"
operation="capable" class="cap" profile="Xorg" pid=1247 comm="Xorg"
capability=12  capname="net_admin"
kernel: hid-generic 0003:04D8:FDD0.0005: input,hidraw4: USB HID v1.00
Keyboard [InfoGrip BAT Personal Keyboard v1.6] on
usb-0000:00:14.0-9.4.4/input0


Kernel 6.12.35:

kernel: usb 1-9.4.4: new low-speed USB device number 15 using xhci_hcd
kernel: usb 1-9.4.4: New USB device found, idVendor=04d8,
idProduct=fdd0, bcdDevice= 1.00
kernel: usb 1-9.4.4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
kernel: usb 1-9.4.4: Product: BAT Personal Keyboard v1.6
kernel: usb 1-9.4.4: Manufacturer: InfoGrip
kernel: usbhid 1-9.4.4:1.0: can't add hid device: -22
kernel: usbhid 1-9.4.4:1.0: probe with driver usbhid failed with error -22

Poking through code online, error code -22 in the second log seems to
resolve to "Invalid argument" or "can't add hid device".

Which is about as far as my own knowledge/ability goes here.

If there is anything further I can do to provide information to assist
in resolving this issue, please don't hesitate to contact me. I am
more than happy to run extra commands and report output towards
narrowing down the issue. Though keep in mind I may need a little
guidance as while I am able to do basic things from a command line, I
am not an expert.

Regards,
Glenn Alexander.

