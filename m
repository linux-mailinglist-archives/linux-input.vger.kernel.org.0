Return-Path: <linux-input+bounces-267-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 538577FA8B3
	for <lists+linux-input@lfdr.de>; Mon, 27 Nov 2023 19:15:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 855071C2091C
	for <lists+linux-input@lfdr.de>; Mon, 27 Nov 2023 18:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF1C13AC21;
	Mon, 27 Nov 2023 18:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="HOCmpKfX"
X-Original-To: linux-input@vger.kernel.org
X-Greylist: delayed 488 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 27 Nov 2023 10:15:26 PST
Received: from ms11p00im-qufo17281701.me.com (ms11p00im-qufo17281701.me.com [17.58.38.54])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B31419B
	for <linux-input@vger.kernel.org>; Mon, 27 Nov 2023 10:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; t=1701108438;
	bh=iqGRI7XYS1dBDhWzHPED2IxVXtYj1cIPzjyBmkOZ09U=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type;
	b=HOCmpKfXy2yI4jstTkkgKnfiPfxBin+vpQBUIh6itd/3T2F28FrOTlIybdeJ9xw6c
	 KzEDcpkpkSU0Y6cYXN/6HGlmbmZ2Y4Kjdb+MFUaGu4UhGywanuCRlVAUeTxeIF3FcG
	 jMiiy2vAPIsk8p7H3rvTj+pNoo+IwAJpVBWNgK9Yj8XIocTPYFfVq12i4+JyTQMlle
	 FDpJt8lr0i33c1r4VlNk8buFAX1+axKswugq4sDbtOijHSGD3cIYXUhs34vIlj1rbK
	 jsa5Ja+UPQP8aT3C3tefTo6KbocytFYZgzaDs0qqNPWd29RQV54mJURUF44g4iA/pg
	 MY2VXUPemsPNw==
Received: from [192.168.0.49] (ms11p00im-dlb-asmtpmailmevip.me.com [17.57.154.19])
	by ms11p00im-qufo17281701.me.com (Postfix) with ESMTPSA id 501A77424BB
	for <linux-input@vger.kernel.org>; Mon, 27 Nov 2023 18:07:16 +0000 (UTC)
Message-ID: <51312c2f-ac0a-4755-924a-237bb9335b05@icloud.com>
Date: Mon, 27 Nov 2023 11:07:15 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-input@vger.kernel.org
From: Kim <kpgenti@icloud.com>
Subject: hid_logitech_dj/hidpp disable high resolution wheel scroll quirk
 needed
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 63eDNaVllxJC5UHQxlr7c7KgfsEnIyln
X-Proofpoint-GUID: 63eDNaVllxJC5UHQxlr7c7KgfsEnIyln
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.572,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2020-02-14=5F11:2020-02-14=5F02,2020-02-14=5F11,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 spamscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0 clxscore=1011
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2311270125

Reported to libinput, [Logitech G604 metal wheel unintended scroll 
caused by high resolution setting enforced by kernel 
drivers](https://gitlab.freedesktop.org/libinput/libinput/-/issues/949) 
and isolated to kernel modules hid_logitech_dj/hid_logitech_hidpp, 
though dj is for receiver setup.

The G604 exhibits extremely sensitive scroll wheel, so much so, that a 
minor jolt (from lifting and bringing the mouse back down on a surface), 
is enough to generate unintentional wheel scroll.

The problem is in hardware, caused by a trivial "bounce" of the metal 
scroll wheel, and can be mitigated by lightly holding the wheel with one 
finger.  Even so, this unintended wheel scrolling doesn't occur in 
Windows 10/11 or Android OS.  It is suspected that the hires scroll 
wheel is not enabled in those operating systems.  A quirk is needed to 
override and force lowres scroll wheel sensitivity.

hidpp initializes the mouse and sets the sensitivity such that it 
persists through a reboot.  Blacklisting hid_logitech_dj/hidpp is not 
enough.  The mouse must be disconnected from the USB bus, and is 
reinitialized upon reconnect.

Please advise on what further information needs to be provided to 
facilitate isolation and resolution.



Tested on Manjaro Linux which is rolling release the LTS Kernel 6.6.1, 
details found at [Manjaro 
releases](https://forum.manjaro.org/c/announcements/stable-updates/12)

Blacklisting just hid_logitech_dj (the lightspeed receiver) is enough to 
clear the issue, as this effectively prevents both dj and hidpp from 
being loaded.

Without hid-logitech-dj/hidpp the G604 is identified as Logitech 
Wireless Mouse PID:4085 Mouse; with, it is registered as Logitech G604.

[hid-ids.h](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/drivers/hid/hid-ids.h)
[hid-logitech-hidpp](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/drivers/hid/hid-logitech-hidpp.c)
[hid-logitech-dj](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/drivers/hid/hid-logitech-dj.c)

modinfo hid-logitech-dj has alias for G604:

lsusb
Bus 001 Device 010: ID 046d:c539 Logitech, Inc. Lightspeed Receiver

modinfo hid-logitech-dj
filename: 
/lib/modules/6.6.1-1-MANJARO/kernel/drivers/hid/hid-logitech-dj.ko.zst
author:         nlopezcasad@logitech.com
author:         Nestor Lopez Casado
author:         Logitech
license:        GPL
srcversion:     012CD0C907AC711AE721D02
alias:          hid:b0003g*v0000046Dp0000C539
depends:        usbhid

grep -i hid_logitech_ /lib/modules/$(uname -r)/modules.alias
alias hid:b0003g*v0000046Dp0000C539 hid_logitech_dj

evt=22 ; udevadm info -an /dev/input/event"$evt" |grep -B3 DRIVERS==
   looking at parent device 
'/devices/pci0000:00/0000:00:14.0/usb1/1-5/1-5.1/1-5.1.1/1-5.1.1.1/1-5.1.1.1.2/1-5.1.1.1.2:1.2/0003:046D:C539.0004/0003:046D:4085.000B':
     KERNELS=="0003:046D:4085.000B"
     SUBSYSTEMS=="hid"
     DRIVERS=="logitech-hidpp-device"
--
   looking at parent device 
'/devices/pci0000:00/0000:00:14.0/usb1/1-5/1-5.1/1-5.1.1/1-5.1.1.1/1-5.1.1.1.2/1-5.1.1.1.2:1.2/0003:046D:C539.0004':
     KERNELS=="0003:046D:C539.0004"
     SUBSYSTEMS=="hid"
     DRIVERS=="logitech-djreceiver"



ID present in hid-ids.h

#define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1	0xc539


