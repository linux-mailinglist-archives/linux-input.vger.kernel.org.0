Return-Path: <linux-input+bounces-31-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B937E97F0
	for <lists+linux-input@lfdr.de>; Mon, 13 Nov 2023 09:40:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A84ED1F20C20
	for <lists+linux-input@lfdr.de>; Mon, 13 Nov 2023 08:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56663883B;
	Mon, 13 Nov 2023 08:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-input@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13541FAE
	for <linux-input@vger.kernel.org>; Mon, 13 Nov 2023 08:40:08 +0000 (UTC)
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7533010FD
	for <linux-input@vger.kernel.org>; Mon, 13 Nov 2023 00:40:03 -0800 (PST)
Received: from [192.168.0.183] (ip5f5aeeb2.dynamic.kabel-deutschland.de [95.90.238.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 7214A61E5FE04;
	Mon, 13 Nov 2023 09:39:51 +0100 (CET)
Message-ID: <978f5891-5167-4a07-884a-4ba464af30f3@molgen.mpg.de>
Date: Mon, 13 Nov 2023 09:39:50 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: How to disable the touchscreen so it does not draw power?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Linux folks,


On a Dell XPS 13 9360 with a touchscreen, when it’s connect to an 
external monitor, that is set up as the only display, the touchscreen – 
although the internal monitor is disabled (in GNOME) – is still active 
and draws power according to PowerTOP:

     $ uname -a
     Linux abreu 6.5.0-4-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.5.10-1 
(2023-11-03) x86_64 GNU/Linux
     $ lsusb  | grep Touchscreen
     Bus 001 Device 003: ID 04f3:2234 Elan Microelectronics Corp. 
Touchscreen
     $ sudo LANG= powertop
     Power est.              Usage       Events/s    Category 
Description
       9.39 W    100.0%                      Device         USB device: 
DELL DA300 (Bizlink)
       1.39 W    100.0%                      Device         USB device: 
Touchscreen (ELAN)

Is there a way to disable the touchscreen, so it does not draw power?

`sudo modprobe -r hid-multitouch` also affects the touchpad, which is 
not wanted.


Kind regards,

Paul


```
$ lsusb
Bus 004 Device 003: ID 0bda:8153 Realtek Semiconductor Corp. RTL8153 
Gigabit Ethernet Adapter
Bus 004 Device 002: ID 2109:0820 VIA Labs, Inc. VL820 Hub
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 003: ID 06c4:c412 Bizlink International Corp. DELL DA300
Bus 003 Device 002: ID 2109:2820 VIA Labs, Inc. VL820 Hub
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 004: ID 0c45:670c Microdia Integrated Webcam HD
Bus 001 Device 003: ID 04f3:2234 Elan Microelectronics Corp. Touchscreen
Bus 001 Device 002: ID 0cf3:e300 Qualcomm Atheros Communications QCA61x4 
Bluetooth 4.0
Bus 001 Device 016: ID 413c:2113 Dell Computer Corp. KB216 Wired Keyboard
Bus 001 Device 015: ID 1bcf:0005 Sunplus Innovation Technology Inc. 
Optical Mouse
Bus 001 Device 014: ID 0bda:5409 Realtek Semiconductor Corp. 4-Port USB 
2.0 Hub
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
```

