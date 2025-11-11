Return-Path: <linux-input+bounces-15987-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB56C4B80C
	for <lists+linux-input@lfdr.de>; Tue, 11 Nov 2025 06:11:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90A2018845FE
	for <lists+linux-input@lfdr.de>; Tue, 11 Nov 2025 05:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B756427C84B;
	Tue, 11 Nov 2025 05:11:36 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from cosmicgizmosystems.com (cosmicgizmosystems.com [63.249.102.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE762609CC;
	Tue, 11 Nov 2025 05:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.249.102.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762837896; cv=none; b=FBhe1uQT26OXOaJ3x8Fw8PuYDExDvJROEyL3mIS9IxGoahat2Sly/0Oj3NUJHR12rG2Ujgcexq/43zOwhLuQewF28ySkfkJQ81jz96NU+d87GIv2In4+odyMIWbP4bNLtc+nx4Bn90zOAkK4y+UCS+YEGtLR7eZ4WLrAubpBYu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762837896; c=relaxed/simple;
	bh=1XVk5MgQup43FaAJqBGIxhaX8aWKDK8Qp8UR3yvfBJA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Q+TLM1WMaLoTJvhw3Whji2EB6tG+zXcDi4qaSMMETDdGec5ge3foFrYhWd3fmy6w6RkdZlywo9O2haEp1KR3PvKRFEAYImgYTJZn8BYV6JEhIeJJ5sVg+5gV4Q+t9WHyuCrblDBTbbTkJUnY948bg2RdOT4gCIGD1t8BFoPrEZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com; spf=pass smtp.mailfrom=cosmicgizmosystems.com; arc=none smtp.client-ip=63.249.102.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cosmicgizmosystems.com
Received: from [10.0.0.100] (c-71-193-224-155.hsd1.wa.comcast.net [71.193.224.155])
	by host11.cruzio.com (Postfix) with ESMTPSA id 2BFEB205B370;
	Mon, 10 Nov 2025 21:11:26 -0800 (PST)
Message-ID: <c6d506f7-f13b-4d57-a522-a2ccd09e7a1f@cosmicgizmosystems.com>
Date: Mon, 10 Nov 2025 21:11:25 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Terry Junge <linuxhid@cosmicgizmosystems.com>
Subject: Re: [BUG] Edifier QR30 (2d99:a101, Jieli Technology) reboots itself
 when RGB brightness button is used under Linux
To: The-Luga <lugathe2@gmail.com>, Alan Stern <stern@rowland.harvard.edu>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Michal Pecio <michal.pecio@gmail.com>,
 Terry Junge <linuxsound@cosmicgizmosystems.com>,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>
References: <25f2419a-ee91-41eb-9446-87d238b4c7c4@rowland.harvard.edu>
 <CALvgqEBu_RzQYRSJnbu58XZt5wHX6PRD8i-J7Tovh7+KuhOyag@mail.gmail.com>
 <6999b5b2-a242-432e-8100-5d8ee58bcae8@rowland.harvard.edu>
 <CALvgqEBD05PwMpm00cAbFkpSWpCFP9jaBU0r-8+op+RGPtkktg@mail.gmail.com>
 <7adc816d-169d-4213-bb67-9d070af3c4a7@cosmicgizmosystems.com>
 <30528153-95f1-4ec7-a6bf-5da396441f86@rowland.harvard.edu>
 <xrfmda5rohporc3bjax35fc7xjziai6cmdt5svjak5rps6y6jz@k6h4zlt3jgg2>
 <CALvgqEDZ=g+uvdSYqbD22sL_VP+n6Pda2xXuFAJyKkh3bjm6HQ@mail.gmail.com>
 <CALvgqEC6UW96NEYOCM5v0m4x8Si0A7AwPuMpwXt3PMqkO3eqww@mail.gmail.com>
 <52fc4350-2930-44d3-b844-03f00806f142@cosmicgizmosystems.com>
 <1ac9d1dd-822a-487a-bd42-45c163dfbfe7@rowland.harvard.edu>
 <CALvgqED5NCNjrtv_YSfg9rzerK-xWAE5TaJjZtMBMcY=8MSk3g@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CALvgqED5NCNjrtv_YSfg9rzerK-xWAE5TaJjZtMBMcY=8MSk3g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/10/2025 3:48 PM, The-Luga wrote:
>>> Are you sure?
>>>
>>> HID_QUIRK_ALWAYS_POLL = 0x400
>>> would stop suspending the device.
>>
>> Actually, it forces the kernel to poll the device's IN endpoints even
>> when no program is holding the device file open (see where
>> usbhid_start() calls hid_start_in() if the ALWAYS_POLL quirk is set).
>> This is exactly what the speaker seems to need.
>>
>> As a side effect, it prevents the device from being suspended.  But that
>> doesn't seem to be the important thing here.

Polling for input reports is handled by the hardware at the interval 
requested by the device during enumeration. There is no intervention by 
the kernel to poll for an input report. The only way the kernel can stop 
polling a device for input reports is to suspend it.

So ALWAYS_POLL means never suspend.

> 
> From: https://github.com/torvalds/linux/blob/master/include/linux/hid.h
> 
> #define HID_QUIRK_ALWAYS_POLL          BIT(10)    ->  2^10=1024=#400
> #define HID_QUIRK_NO_IGNORE            BIT(30)    ->  2^30=1073741824=#40000000
> 
> Sorry about that. I'm still learning and the documentation was not
> very clear on this.
> 
> Trying the 0x40000000: `usbhid.quirks=0x2d99:0xa101:0x40000000`  the
> usbmon stays silent when changing volume/button and reboots when
> changing brightness.
> 
> With HID_QUIRK_ALWAYS_POLL: `usbhid.quirks=0x2d99:0xa101:0x400`
> (reboot does not happen).
> 
> Is there a different quirk to try?

No, HID_QUIRK_ALWAYS_POLL is the one you want.

Do you want to write the patch and submit it?

> 
> Off-topic:
> I was trying to decode this protocol... and did it with volume control.
> 
> I can control my speaker directly with:
> 
> Full volume:
> `echo \
>   "2eaaec670001100e000000000000000000000000000000000000000000000000" \
> | xxd -r -p | dd bs=64 count=1 conv=sync | sudo tee /dev/hidraw1`
> 
> muted:
> `echo \
> "2eaaec67000100fe0000000000000000000000000000000000000000000000000" \
> | xxd -r -p | dd bs=64 count=1 conv=sync | sudo tee /dev/hidraw1`
> 
> I renamed the steps to be similar to the audio stack where 0 is very
> low but not muted.
> 
> ad it stays consistent on this full range. (tested)
> 
> volume muted
> 2eaaec670001 00fe 00000000000000000000000000000000000000000000000000
> volume 0
> 2eaaec670001 01ff 00000000000000000000000000000000000000000000000000
> volume 1
> 2eaaec670001 0200 00000000000000000000000000000000000000000000000000
> volume 2
> 2eaaec670001 0301 00000000000000000000000000000000000000000000000000
> volume 3
> 2eaaec670001 0402 00000000000000000000000000000000000000000000000000
> volume 4
> 2eaaec670001 0503 00000000000000000000000000000000000000000000000000
> volume 5
> 2eaaec670001 0604 00000000000000000000000000000000000000000000000000
> volume 6
> ...
> volume 14
> 2eaaec670001 0f0d 00000000000000000000000000000000000000000000000000
> Volume 15 (max)
> 2eaaec670001 100e 00000000000000000000000000000000000000000000000000
> 
> 
> 
> And I also decoded the speaker volume it outputs by rotating the knob:
> 
> volume muted
> 2fbbec660002 1000 1f00 00000000000000000000000000000000000000000000
> volume 0
> 2fbbec660002 1001 2000 00000000000000000000000000000000000000000000
> volume 1
> 2fbbec660002 1002 2100 00000000000000000000000000000000000000000000
> volume 2
> 2fbbec660002 1003 2200 00000000000000000000000000000000000000000000
> volume 3
> 2fbbec660002 1004 2300 00000000000000000000000000000000000000000000
> ...
> volume 14
> 2fbbec660002 100f 2e00 00000000000000000000000000000000000000000000
> Volume 15 (max)
> 2fbbec660002 1010 2f00 00000000000000000000000000000000000000000000
> 
> When sending the volume change command to hidraw. The device outputs
> the volume it was set to go like the knob on that value:
> 
> ffff8d49f36b3680 206654552 S Io:3:002:4 -115:1 64 = 2eaaec67 0001100e
> 00000000 00000000 00000000 00000000 00000000 00000000
> ffff8d49f36b3680 206654840 C Io:3:002:4 0:1 64 >
> ffff8d494c8ee0c0 206655831 C Ii:3:002:4 0:1 64 = 2fbbec66 00021010
> 2f000000 00000000 00000000 00000000 00000000 00000000
> ffff8d494c8ee0c0 206655832 S Ii:3:002:4 -115:1 64 <
> ffff8d494c8ee0c0 206656830 C Ii:3:002:4 0:1 64 = 2fbbec67 00010110
> 00000000 00000000 00000000 00000000 00000000 00000000
> ffff8d494c8ee0c0 206656831 S Ii:3:002:4 -115:1 64 <
> 
> If, I mean it's a very big IF. I wanted to have this device with
> hardware volume control working with alsa/pipewire/wireplumber/etc.
> What would be needed?

ALSA and the rest are triggered to bump the volume up or down with the 
Consumer Control Volume Up and Volume Down events. Those HID usages are 
declared in the other HID interface but never fired as your testing shows.

You would need a kernel driver and detect the volume change using the 
vendor unique reports and then inject KEY_VOLUMEUP or KEY_VOLUMEDOWN 
events as needed. It may or may not work...

> 
> Maybe this vendor uses the same method of communication for other devices?
> 
> Maybe related: https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/thread/CYSG6A62JJID5N2V5YUDW43CELEZDF36/
> 
> The decibel range is bogus:
> 
> lugathe wireplumber[1231]: spa.alsa: The decibel volume range for
> element 'PCM' (-2837 dB - -94 dB) has negative maximum. Disabling the
> decibel range.
> 
> The RGB/Equalizer/profiles/etc. I don't think it's really important in
> the kernel context except with the reboot apparently solved with
> always poll quirk.
> 
> Before this I really *knew nothing* and I am having a really good time
> and happy with this challenge. Thank you all for the wonderful work
> and knowledge you are sharing.

