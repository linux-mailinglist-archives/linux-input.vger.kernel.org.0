Return-Path: <linux-input+bounces-12101-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F012EAA6494
	for <lists+linux-input@lfdr.de>; Thu,  1 May 2025 22:10:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 648F54C112D
	for <lists+linux-input@lfdr.de>; Thu,  1 May 2025 20:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57630248871;
	Thu,  1 May 2025 20:10:27 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from p01.hosting.plutex.de (p01.hosting.plutex.de [31.24.148.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7272524729A
	for <linux-input@vger.kernel.org>; Thu,  1 May 2025 20:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=31.24.148.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746130227; cv=none; b=RQnHORFVzVDZWMHehLqXcRn0Dm308KkY0RIP87IN26l03D8vGL6Iw3Luaymc+xsXxpIrf1opU1mEF8dnfVgpT+5Kz29fGd1GwY6szrKN61P0M6A31qobrMLUSaQ4NcOYExl5U9fApUG8US+qIv07vRL8aSTdPE2C1M/U0qlH7ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746130227; c=relaxed/simple;
	bh=8aELfNd1IHJE6LjgkJ/jYEyvLY/N/EdIoUH43Qxe1dU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=ID+GiT29KSZPnIdm7KFErV3O6iyqpSImLBTIgE+EwX+vy7EIjhqJjJqvv9cbdzOoXrLt99IQIcKgSYZMioEzk3cyh57lllk2G5QoLk4ZDxptHLt4+7gjBWRgScbJGBWpJnybV5wBEHWRGijs+KshWy3Awo0lFQQ5RcE119YmilY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eilert.tech; spf=pass smtp.mailfrom=eilert.tech; arc=none smtp.client-ip=31.24.148.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eilert.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eilert.tech
Received: from [192.168.20.22] (dynamic-002-214-051-085.2.214.pool.telefonica.de [2.214.51.85])
	by p01.hosting.plutex.de (Postfix) with ESMTPSA id 5CDBE15D055E
	for <linux-input@vger.kernel.org>; Thu,  1 May 2025 22:04:23 +0200 (CEST)
Message-ID: <325001b5-12e3-42db-96ec-05bd3f23ab35@eilert.tech>
Date: Thu, 1 May 2025 22:04:22 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: arch.hias@eilert.tech
Subject: Synaptics touchpad not working after suspend,
 psmouse.synaptics_intertouch
To: linux-input@vger.kernel.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <174612986354.7184.11554999020724167709@p01.hosting.plutex.de>
X-PPP-Vhost: eilert.tech

Hi,

I'm experiencing an issue with the Synaptics touchpad on my laptop not 
working after resuming from suspend.

This began after upgrading from linux-lts 6.12.19-1 -> 6.12.21-1 [2]


Hardware:
- Touchpad: SynPS/2 Synaptics TouchPad (PNP: SYN1221 PNP0f13)
- Distro: Arch Linux issue began after systemupgrade linux-lts 
(6.12.19-1 -> 6.12.21-1) (kernel 6.12.24-1-lts)

Description:
After resuming from suspend, the touchpad is not detected. However, if I 
suspend and resume a second time, it works again. While checking the 
logs, I found the following kernel message:

kernel: psmouse serio2: synaptics: Your touchpad (PNP: SYN1221 PNP0f13) 
says it can support a different bus. If i2c-hid and hid-rmi are not 
used, you might want to try setting psmouse.synaptics_intertouch to 1 
and report this to linux-input@vger.kernel.org.

I had previously set `psmouse.synaptics_intertouch=0`, as recommended in 
the Arch Wiki[1].
After changing it to `1`, the touchpad now consistently works after suspend.

This setting appears to resolve the issue for my device. I wanted to 
share this in case it’s helpful for others or worth considering for 
default handling of this hardware.

# libinput list-devices | grep Synaptics -A4
Device:                  Synaptics TM3175-002
Kernel:                  /dev/input/event13
Id:                      <unknown>:06cb:0000
Group:                   6
Seat:                    seat0, default

$ udevadm info /dev/input/event13
P: 
/devices/pci0000:00/0000:00:1f.4/i2c-6/6-002c/rmi4-00/input/input21/event13
M: event13
R: 13
J: c13:77
U: input
D: c 13:77
N: input/event13
L: 0
S: input/by-path/pci-0000:00:1f.4-event-mouse
E: 
DEVPATH=/devices/pci0000:00/0000:00:1f.4/i2c-6/6-002c/rmi4-00/input/input21/event13
E: DEVNAME=/dev/input/event13
E: MAJOR=13
E: MINOR=77
E: SUBSYSTEM=input
E: USEC_INITIALIZED=40782030
E: ID_INPUT=1
E: ID_INPUT_TOUCHPAD=1
E: ID_INPUT_WIDTH_MM=81
E: ID_INPUT_HEIGHT_MM=39
E: ID_BUS=rmi
E: ID_SERIAL=noserial
E: ID_PATH=pci-0000:00:1f.4
E: ID_PATH_TAG=pci-0000_00_1f_4
E: ID_INPUT_TOUCHPAD_INTEGRATION=internal
E: LIBINPUT_DEVICE_GROUP=1d/6cb/0:rmi4-00
E: DEVLINKS=/dev/input/by-path/pci-0000:00:1f.4-event-mouse

Links:

1: 
https://wiki.archlinux.org/title/Touchpad_Synaptics#Touchpad_does_not_work_after_resuming_from_hibernate/suspend

2: http://0x0.st/84b8.txt


Let me know if I can provide further Information, logs or tests.

Best regards,

hias

  
      The ASCII Ribbon Campaign
()     No HTML/RTF in email
/\     No Word docs in email
      Respect for open standards


