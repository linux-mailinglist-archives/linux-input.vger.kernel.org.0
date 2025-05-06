Return-Path: <linux-input+bounces-12185-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E3492AACEFF
	for <lists+linux-input@lfdr.de>; Tue,  6 May 2025 22:51:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 363A34C88E3
	for <lists+linux-input@lfdr.de>; Tue,  6 May 2025 20:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF3FC17CA1B;
	Tue,  6 May 2025 20:49:56 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from p01.hosting.plutex.de (p01.hosting.plutex.de [31.24.148.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC9817AE11
	for <linux-input@vger.kernel.org>; Tue,  6 May 2025 20:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=31.24.148.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746564596; cv=none; b=YTC9W43S59HKeyC3gMZKg47t8Yn63jn3VmeOpHM2iLHO/v4Qe6URPRFeem/SNttulWH/t1fTG9/xDYQ3nf3R1gR3Ac4LmUoNx5phpNhdnjxhpYGQX0EbAU6A9fruhqfJeyOBySSMBtZt3Sb4t0cCQ9RE8rfs6YYkuXPHS6rHD/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746564596; c=relaxed/simple;
	bh=LRW+6gwdPNETtxdVmzHnDE5St7G9ARH+n3F+coI0Uz0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=pyv7VtMaT5eiMWaJGIugMOsJbbHnMKxd3EY1+5CcBf2DSw96VVAULbMhk0o4dENEAyB2/QxGDJtisz4Vg9LW9U0ALES2C8nn6iikfFxKuT/QGPkqFyUVdRkumcpybnGauywzNx2L0noAfNqJFAJRsQhVCj2o0grmwWgPiyQpFKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eilert.tech; spf=pass smtp.mailfrom=eilert.tech; arc=none smtp.client-ip=31.24.148.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eilert.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eilert.tech
Received: from [192.168.20.22] (dynamic-002-214-051-085.2.214.pool.telefonica.de [2.214.51.85])
	by p01.hosting.plutex.de (Postfix) with ESMTPSA id 8A16C15D2C80;
	Tue,  6 May 2025 22:49:51 +0200 (CEST)
Message-ID: <aea15a49-4e1c-41dd-bb09-24d2169f1caa@eilert.tech>
Date: Tue, 6 May 2025 22:49:51 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Matthias <hias@eilert.tech>
Subject: Re: Synaptics touchpad not working after suspend,
 psmouse.synaptics_intertouch
To: Aditya Garg <gargaditya08@live.com>
Cc: linux-input@vger.kernel.org
References: <325001b5-12e3-42db-96ec-05bd3f23ab35@eilert.tech>
 <3530EFD3-68F2-4890-9ACB-EF963769D079@live.com>
Content-Language: en-US
In-Reply-To: <3530EFD3-68F2-4890-9ACB-EF963769D079@live.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <174656459174.44935.14279832853176530195@p01.hosting.plutex.de>
X-PPP-Vhost: eilert.tech


Am 04.05.25 um 08:34 schrieb Aditya Garg:
> Hi Hias

Hi Aditya,

thanks for your patch!

>> On 2 May 2025, at 1:34 AM,arch.hias@eilert.tech wrote:
>>
>> Hi,
>>
>> I'm experiencing an issue with the Synaptics touchpad on my laptop not working after resuming from suspend.
>>
>> This began after upgrading from linux-lts 6.12.19-1 -> 6.12.21-1 [2]
>>
>>
>> Hardware:
>> - Touchpad: SynPS/2 Synaptics TouchPad (PNP: SYN1221 PNP0f13)
>> - Distro: Arch Linux issue began after systemupgrade linux-lts (6.12.19-1 -> 6.12.21-1) (kernel 6.12.24-1-lts)
>>
>> Description:
>> After resuming from suspend, the touchpad is not detected. However, if I suspend and resume a second time, it works again. While checking the logs, I found the following kernel message:
>>
>> kernel: psmouse serio2: synaptics: Your touchpad (PNP: SYN1221 PNP0f13) says it can support a different bus. If i2c-hid and hid-rmi are not used, you might want to try setting psmouse.synaptics_intertouch to 1 and report this tolinux-input@vger.kernel.org.
>>
>> I had previously set `psmouse.synaptics_intertouch=0`, as recommended in the Arch Wiki[1].
>> After changing it to `1`, the touchpad now consistently works after suspend.
>>
>> This setting appears to resolve the issue for my device. I wanted to share this in case it’s helpful for others or worth considering for default handling of this hardware.
>>
>> # libinput list-devices | grep Synaptics -A4
>> Device:                  Synaptics TM3175-002
>> Kernel:                  /dev/input/event13
>> Id:                      <unknown>:06cb:0000
>> Group:                   6
>> Seat:                    seat0, default
>>
>> $ udevadm info /dev/input/event13
>> P: /devices/pci0000:00/0000:00:1f.4/i2c-6/6-002c/rmi4-00/input/input21/event13
>> M: event13
>> R: 13
>> J: c13:77
>> U: input
>> D: c 13:77
>> N: input/event13
>> L: 0
>> S: input/by-path/pci-0000:00:1f.4-event-mouse
>> E: DEVPATH=/devices/pci0000:00/0000:00:1f.4/i2c-6/6-002c/rmi4-00/input/input21/event13
>> E: DEVNAME=/dev/input/event13
>> E: MAJOR=13
>> E: MINOR=77
>> E: SUBSYSTEM=input
>> E: USEC_INITIALIZED=40782030
>> E: ID_INPUT=1
>> E: ID_INPUT_TOUCHPAD=1
>> E: ID_INPUT_WIDTH_MM=81
>> E: ID_INPUT_HEIGHT_MM=39
>> E: ID_BUS=rmi
>> E: ID_SERIAL=noserial
>> E: ID_PATH=pci-0000:00:1f.4
>> E: ID_PATH_TAG=pci-0000_00_1f_4
>> E: ID_INPUT_TOUCHPAD_INTEGRATION=internal
>> E: LIBINPUT_DEVICE_GROUP=1d/6cb/0:rmi4-00
>> E: DEVLINKS=/dev/input/by-path/pci-0000:00:1f.4-event-mouse
>>
>> Links:
>>
>> 1:https://wiki.archlinux.org/title/Touchpad_Synaptics#Touchpad_does_not_work_after_resuming_from_hibernate/suspend
>>
>> 2:http://0x0.st/84b8.txt
>>
>>
>> Let me know if I can provide further Information, logs or tests.
>>
>> Best regards,
>>
>> hias
>>
>>       The ASCII Ribbon Campaign
>> ()     No HTML/RTF in email
>> /\     No Word docs in email
>>      Respect for open standards
> Please test this patch for your device:
To test it, I first removed the kernel command line option 
`psmouse.synaptics_intertouch=1`.

The issue still occurs with the unpatched kernel `linux-lts-6.12.27-1` 
from the Arch Linux repositories [1].

After building and installing the package [1] with your patch applied, 
the touchpad works reliably — even without the 
`psmouse.synaptics_intertouch=1` option.
> —>8—
>
>  From ace747d33f1b9d329309c277879fa8a632606c93 Mon Sep 17 00:00:00 2001
> From: Aditya Garg<gargaditya08@live.com>
> Date: Sun, 4 May 2025 11:46:44 +0530
> Subject: [PATCH] Update synaptics.c
>
> ---
>   drivers/input/mouse/synaptics.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
> index 309c360aab5597..24db13ceae3ba2 100644
> --- a/drivers/input/mouse/synaptics.c
> +++ b/drivers/input/mouse/synaptics.c
> @@ -195,6 +195,7 @@ static const char * const smbus_pnp_ids[] = {
>   	"SYN3221", /* HP 15-ay000 */
>   	"SYN323d", /* HP Spectre X360 13-w013dx */
>   	"SYN3257", /* HP Envy 13-ad105ng */
> +	"SYN1221",
>   	NULL
>   };
>   #endif
>
> --------
>
> You can also download the patch from:https://github.com/AdityaGarg8/linux/commit/ace747d33f1b9d329309c277879fa8a632606c93.patch
>
>
> Also, please share you laptops model (Eg: HP Envy 13-ad105ng)

TUXEDO InfinityBook Pro 14 v5 / Barebone N14xCU


This is my first time testing and reporting a kernel patch, so the 
process is new and quite interesting to me. Let me know if I can help 
with further testing or provide additional infos.

> And if you want to be credited for your report, please share your full legal name and email.
Feel free to credit the report as follows:
Name: Matthias Eilert
Email: kernel.hias@eilert.tech


> Thanks
> Aditya

hias

Links:
1:https://gitlab.archlinux.org/archlinux/packaging/packages/linux-lts/-/commit/6b2e8530afda872a3460e7c29cebd302223c1fa8


