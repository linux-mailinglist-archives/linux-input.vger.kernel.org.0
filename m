Return-Path: <linux-input+bounces-16945-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB5ED0F82C
	for <lists+linux-input@lfdr.de>; Sun, 11 Jan 2026 18:28:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8E6083001BE8
	for <lists+linux-input@lfdr.de>; Sun, 11 Jan 2026 17:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 780ED33E36D;
	Sun, 11 Jan 2026 17:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ke7mFqLT"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196183346A6
	for <linux-input@vger.kernel.org>; Sun, 11 Jan 2026 17:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768152502; cv=none; b=sThWCs/8gaP6YkXYd+qU5Uhfge5TKtjsIHuPvPb5zL7eYX4663IXQbTEQQoVFF1oERsszw5+CYIevLFen1vwCXfIIYf1R0SyPB33pDdmgb6BTE2AExWuscwmL+VXP7tw7DScVFx/iPQDOwh2FgylQbkzvo5C2yGCckUz64HsSU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768152502; c=relaxed/simple;
	bh=o4BaGXBErZ5pZfcN/UdRIyB07V/thHCNrI85tsZwE5Q=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=qEI0YU8A0g/K3879PNk/tA1G62lz0vMvygRM8KASN5ngjwiZ4dSpkxzD/x3PcsR/Ua/7dOMCbrwxRTJOgCVBcMVeWObR5aVUHuy6OojUolq1E0KX34MJc22rZy8tPcSbLr9NoCgJimUM3eqJ7PFajGgyQcnbAr+j9U1QR4+c1/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ke7mFqLT; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-121b14d0089so6087510c88.0
        for <linux-input@vger.kernel.org>; Sun, 11 Jan 2026 09:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768152500; x=1768757300; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZobrGZwsfEC3p386gzggt35WBC6dl+3K3yYEgYayqrc=;
        b=ke7mFqLThTbXi4IjFoqLuFdL3eG4tUSMAHwLfvb+MNZA6hI+jg/MxfaPD0CjWhGsQ9
         72GYumNH15aVu0yr84Fo+qJkvJXGzddxuI8Sl3QWRsL+2IFFGAnqRqty0JcnTjviThVd
         BAn2B5vebRCgfjZHFEHblm5C6glxL29+fhOBU+P7/1CD33/GyxAujkZoui1xSa8ekZ5j
         yLtypbTv8YC5bcQG8RyhXD2AJAeLTbSjcdNkioNlLAB7bhHzs4exQxViFmK+Dxlog+2Q
         XxXMzKLk9cbnH7OtYl6lyIfHh7sBTshPUxMpfxreVXQLwuREAmX6Sj6A2Cy1YxQ/rxHW
         kFcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768152500; x=1768757300;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZobrGZwsfEC3p386gzggt35WBC6dl+3K3yYEgYayqrc=;
        b=T0rReu7OFPnolcKbrDFX/gMmDQisDReYxzSJmiGB3dZNxs0cgWtQvVOG3PVqgyGD9M
         jTbXCGTh5NxotkmBgJ2Xs+HLrbdAcS2Uq1ZX5vgt5LRjwMLIYIsoqv/s0JJ7eUoZAock
         Jrm1duF/VdIX/+wRl20d7+fqtE6psdATG7I0++8JPiZyM9kZuNYFeUZhvliV+FoSer/T
         zIONoL6JDFhv4cJ/TDrzKyGQmNS9g9P7xvdQuy9zdhDHd2K0IDTpXENHKQQIkElRPvvl
         58b9QlVXhIjNIWKSa96FIzhuAjVszm81HD8oQdDWNwKUZ5++pdXTafIFn+zVj3FZK0NS
         DMFg==
X-Gm-Message-State: AOJu0Yzb5J2m3IOs0HH1MUEaeQaEXL3IUSjVZPwZctjikBE+g9HqT/Xu
	Sa2FVbTHjHKwryLn6cpgf0Rs22LuU3Wxi1Tujc3ttGYLO93JgfzIDsTtjsETmWYoH1TYxHmZmKQ
	wT9pcako6oRvJqMAhRgnlk1gjDq022SYwFnoO
X-Gm-Gg: AY/fxX58G9ZUxc3skcvQmUWw3sSwFz3OQdWfLZ4SfJtcYhs4WhuztVxGwjpUabeiRgg
	fT63pcWezLFzt5ujy1Nt2HvcQA8yLJZF9MFQFdLnjBvgMDncaB/8GHdIEsJwqPptAiOmesI7Bc5
	M/Wz4BNM5EPj+6utSa+GmluJZb0uuslLAS2xcanWYgvIlBziu+rZbssV7SgtnvmlPUikD9TJBxC
	TuA6YaMtXTFb6ulrgxN53U8M97RP6pG5T+IEkHsW0NjFPRsv+vlApiS8prxnh+H29NGyabjN522
	p50gqj04zbFEw2bWW1HFDIzGSpWDcqxIDbZUHRs=
X-Google-Smtp-Source: AGHT+IFFJPxB8oIuyHWykOFVRZXqqQajR1hUYAxZ2pLtx7+XLQgK7ls8NT9ilU38vs1bDMDYhD2tN+7AwcyKQW5HRlU=
X-Received: by 2002:a05:7022:799:b0:11b:7dcd:ca9a with SMTP id
 a92af1059eb24-121f8b8b46emr14380859c88.34.1768152500105; Sun, 11 Jan 2026
 09:28:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Liam Mitchell <mitchell.liam@gmail.com>
Date: Sun, 11 Jan 2026 18:28:09 +0100
X-Gm-Features: AZwV_QgKD_sYvUU8L2dIdsxVIJ1KEBHmVuWktm4JnLN66woCEXUj2PG75iAGzZQ
Message-ID: <CAOQ1CL4+DP1TuLAGNsz5GdFBTHvnTg=5q=Dr2Z1OQc6RXydSYA@mail.gmail.com>
Subject: bcm5974 trackpad broken after USB reset
To: Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

The trackpad on my 2013 MacBook Pro (10,2) stops working after the USB
device is reset, logging "bad trackpad package, length: 8" when
touching the trackpad.

The reset occurs often on my machine, caused by USB EPROTO (MMF)
errors handled by drivers/hid/usbhid/hid-core.c:hid_io_error() (HID is
handling the keyboard interface of this device). On encountering two
keyboard EPROTO errors within 1.5 seconds, the driver will reset the
USB device, also resetting bcm5974 and trackpad.

I can also reproduce this with the command:
$ sudo usbreset 05ac:0259

I can get the trackpad back into a working state by reloading the
bcm5974 driver:
$ sudo modprobe -r bcm5974; sudo modprobe bcm5974

I experimented with the driver and found that adding msleep(50) to
drivers/input/mouse/bcm5974.c:bcm5974_probe() was enough to allow the
trackpad to restart reliably after EPROTO errors and the usbreset
command.

Not sure if adding a sleep is the right way to fix this, or if I
should be looking more into the EPROTO error handling in HID or even
the source of the EPROTO errors in EHCI, power management or firmware.

Version/hardware info below, any input appreciated, thanks!
Liam

$ cat /proc/version
Linux version 6.18.4-arch1-1 (linux@archlinux) (gcc (GCC) 15.2.1
20260103, GNU ld (GNU Binutils) 2.45.1) #1 SMP PREEMPT_DYNAMIC Fri, 09
Jan 2026 19:43:48 +0000
https://gitlab.archlinux.org/archlinux/packaging/packages/linux/-/blob/ac8e7e814bb68e6291b4efd862ee9a72d7dc1165/config

$ lsusb -tvvv # only showing root containing kb/trackpad
/:  Bus 004.Port 001: Dev 001, Class=root_hub, Driver=ehci-pci/2p, 480M
    ID 1d6b:0002 Linux Foundation 2.0 root hub
    /sys/bus/usb/devices/usb4  /dev/bus/usb/004/001
    |__ Port 001: Dev 002, If 0, Class=Hub, Driver=hub/8p, 480M
        ID 8087:0024 Intel Corp. Integrated Rate Matching Hub
        /sys/bus/usb/devices/4-1  /dev/bus/usb/004/002
        |__ Port 008: Dev 003, If 0, Class=Hub, Driver=hub/2p, 480M
            ID 0424:2512 Microchip Technology, Inc. (formerly SMSC) USB 2.0 Hub
            /sys/bus/usb/devices/4-1.8  /dev/bus/usb/004/003
            |__ Port 001: Dev 004, If 0, Class=Hub, Driver=hub/3p, 12M
                ID 0a5c:4500 Broadcom Corp. BCM2046B1 USB 2.0 Hub
(part of BCM2046 Bluetooth)
                /sys/bus/usb/devices/4-1.8.1  /dev/bus/usb/004/004
                Manufacturer=Apple Inc. Product=BRCM20702 Hub
                |__ Port 003: Dev 008, If 0, Class=Vendor Specific
Class, Driver=btusb, 12M
                    ID 05ac:828c Apple, Inc. Bluetooth Host Controller
                    /sys/bus/usb/devices/4-1.8.1.3  /dev/bus/usb/004/008
                    Manufacturer=Apple Inc. Product=Bluetooth USB Host
Controller
                |__ Port 003: Dev 008, If 1, Class=Wireless, Driver=btusb, 12M
                    ID 05ac:828c Apple, Inc. Bluetooth Host Controller
                    /sys/bus/usb/devices/4-1.8.1.3  /dev/bus/usb/004/008
                    Manufacturer=Apple Inc. Product=Bluetooth USB Host
Controller
                |__ Port 003: Dev 008, If 2, Class=Vendor Specific
Class, Driver=btusb, 12M
                    ID 05ac:828c Apple, Inc. Bluetooth Host Controller
                    /sys/bus/usb/devices/4-1.8.1.3  /dev/bus/usb/004/008
                    Manufacturer=Apple Inc. Product=Bluetooth USB Host
Controller
                |__ Port 003: Dev 008, If 3, Class=Application
Specific Interface, Driver=[none], 12M
                    ID 05ac:828c Apple, Inc. Bluetooth Host Controller
                    /sys/bus/usb/devices/4-1.8.1.3  /dev/bus/usb/004/008
                    Manufacturer=Apple Inc. Product=Bluetooth USB Host
Controller
            |__ Port 002: Dev 005, If 0, Class=Human Interface Device,
Driver=usbhid, 12M
                ID 05ac:0259 Apple, Inc. Internal Keyboard/Trackpad
                /sys/bus/usb/devices/4-1.8.2  /dev/bus/usb/004/005
                Manufacturer=Apple Inc. Product=Apple Internal
Keyboard / Trackpad
            |__ Port 002: Dev 005, If 1, Class=Human Interface Device,
Driver=usbhid, 12M
                ID 05ac:0259 Apple, Inc. Internal Keyboard/Trackpad
                /sys/bus/usb/devices/4-1.8.2  /dev/bus/usb/004/005
                Manufacturer=Apple Inc. Product=Apple Internal
Keyboard / Trackpad
            |__ Port 002: Dev 005, If 2, Class=Human Interface Device,
Driver=bcm5974, 12M
                ID 05ac:0259 Apple, Inc. Internal Keyboard/Trackpad
                /sys/bus/usb/devices/4-1.8.2  /dev/bus/usb/004/005
                Manufacturer=Apple Inc. Product=Apple Internal
Keyboard / Trackpad

