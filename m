Return-Path: <linux-input+bounces-1232-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B1F82CDE5
	for <lists+linux-input@lfdr.de>; Sat, 13 Jan 2024 18:20:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2ADA51C20FA0
	for <lists+linux-input@lfdr.de>; Sat, 13 Jan 2024 17:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D6065227;
	Sat, 13 Jan 2024 17:20:14 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A675226
	for <linux-input@vger.kernel.org>; Sat, 13 Jan 2024 17:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m.gmane-mx.org
Received: from list by ciao.gmane.io with local (Exim 4.92)
	(envelope-from <glki-linux-input-2@m.gmane-mx.org>)
	id 1rOhb4-0008Eg-2l
	for linux-input@vger.kernel.org; Sat, 13 Jan 2024 18:15:02 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: linux-input@vger.kernel.org
From: Nikos Chantziaras <realnc@gmail.com>
Subject: 8BitDo USB controller disconnect/reconnect loop
Date: Sat, 13 Jan 2024 19:02:58 +0200
Message-ID: <unufo3$det$1@ciao.gmane.io>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
User-Agent: Mozilla Thunderbird
Content-Language: en-US

Hello.

Support for the 8BitDo Pro 2 Wired controller was added in kernel 6.3. 
I'm currently using 6.6.11 (I use LTS kernels.)

When I connect the controller, it rumbles every few seconds. Looking at 
dmesg, the reason is that it constantly disconnects and reconnects:

usb 1-4: new full-speed USB device number 6 using xhci_hcd
usb 1-4: New USB device found, idVendor=2dc8, idProduct=3106, bcdDevice= 
1.14
usb 1-4: New USB device strings: Mfr=1, Product=2, SerialNumber=3
usb 1-4: Product: 8BitDo Pro 2 Wired Controller
usb 1-4: Manufacturer: 8BitDo
usb 1-4: SerialNumber: 817EC44BB302
input: 8BitDo Pro 2 Wired Controller as 
/devices/pci0000:00/0000:00:01.2/0000:02:00.0/usb1/1-4/1-4:1.0/input/input13
input input13: unable to receive magic message: -121
usb 1-4: USB disconnect, device number 6
xpad 1-4:1.0: xpad_try_sending_next_out_packet - usb_submit_urb failed 
with result -19
usb 1-4: new full-speed USB device number 7 using xhci_hcd
usb 1-4: New USB device found, idVendor=2dc8, idProduct=3106, bcdDevice= 
1.14
usb 1-4: New USB device strings: Mfr=1, Product=2, SerialNumber=3
usb 1-4: Product: 8BitDo Pro 2 Wired Controller
usb 1-4: Manufacturer: 8BitDo
usb 1-4: SerialNumber: 817EC44BB302
input: 8BitDo Pro 2 Wired Controller as 
/devices/pci0000:00/0000:00:01.2/0000:02:00.0/usb1/1-4/1-4:1.0/input/input14
input input14: unable to receive magic message: -121
usb 1-4: USB disconnect, device number 7
xpad 1-4:1.0: xpad_try_sending_next_out_packet - usb_submit_urb failed 
with result -19

The index in /devices/ is also changing each time.

This goes on forever. It only stops happening when I launch an 
application that uses the controller. Once I exit the application, this 
behavior returns and it rumbles every 4 seconds or so.

Apparently this controller has a quirk where it needs to be polled once 
in a while to keep it from disconnecting. I can't be sure why, but I 
suspect it's because it tries to auto-detect the host system it's being 
connected to. For example if it's connected to a PC, it switches to 
X-Input mode. when it's connected to a Nintendo Switch, it switches to 
that mode instead. But when it hasn't been polled for a few second, it 
probably enters its auto-detection mode again.

While searching the web for this issue, I found other users with exactly 
the same problem (I'm on Gentoo Linux, other users on Fedora and Arch 
Linux.)

This behavior does not occur when using the controller in Microsoft 
Windows 10. The controller's firmware is upgraded to the latest version 
(1.03.)

Is there something I can do to fix this? Is there some kernel option or 
perhaps a udev option I can use that would poll the controller once a 
second or so to keep it alive?


