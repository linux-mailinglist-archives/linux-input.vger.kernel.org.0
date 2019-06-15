Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56AE546E89
	for <lists+linux-input@lfdr.de>; Sat, 15 Jun 2019 08:11:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725820AbfFOGLT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 15 Jun 2019 02:11:19 -0400
Received: from mailu01.usrpro.com ([116.203.53.249]:50494 "EHLO
        mailu01.usrpro.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725786AbfFOGLS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 15 Jun 2019 02:11:18 -0400
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
        by mailu01.usrpro.com (Postfix) with ESMTPA id 2798E5DC437;
        Sat, 15 Jun 2019 06:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=usrpro.com; s=dkim;
        t=1560579075; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WDH5qarKDcVEK9UPeJxmJp832j7pqcrNV1tcI4gJYNo=;
        b=LeY0x9jYky2dfrG3Lv9YUo6NVxW1U0sYdkUxLGX04pDUihSrsLQEMM/6FBRYgMcTjmPSyJ
        mhphSfPAqjT4TWw3SfZGxXXzssjxyCL82sYyW9nNlqPOrKme9C/epXORgsL2/wv0R0pn2a
        9ifSHTHpy9IDSVuYa/A0I+B9666QYHs=
Subject: Re: Synaptics i2c and rmi: dmesg requested to send report
To:     Teika Kazura <teika@gmx.com>, linux-input@vger.kernel.org
References: <df3db17a-db2c-b8b8-e399-271149ea9b76@usrpro.com>
 <7CDB47F5-65C2-4B09-8C02-EE72D4EAE1BE@usrpro.com>
 <20190615.082110.1448671611220266574.teika@gmx.com>
From:   Tim Mohlmann <tim@usrpro.com>
Openpgp: preference=signencrypt
Autocrypt: addr=tim@usrpro.com; keydata=
 mQENBFvgCH0BCADU4UCssggvd0udKsKa3d3PCDwVUkSm2xzLRxNob7IZjCODs4FtBMKW4D/z
 Gzr7a+P1cHQT2S0kfMO6mV7BGhKJRwGAEVCTnV+292LvzEie8qWo2yuheFGPJIcfLWS4uIxn
 qUmdI31K32irpoLlAexBai0PaLp74nYlNE4ffqfL5rd/8tO1Qs3natbq+uxNyJdL4wrbv9Yc
 qI/0rEwcxmdmmOpFyHU5PDAbQP+6xMtP2EfjbSxQmMZkCMiGvxoBCWGMJxd9JlOry1MYS7oQ
 YU88KNCkrZH/hemC4h7vN3ODOYMwjSTY5VaNCfnNxhnJjl5Vhp2G/NjqVCigcXYon8qlABEB
 AAG0Q1RpbSBNb2hsbWFubiAoR2VuZXJhbCBNYW5hZ2VyIG9mIHRoZSB1c3Jwcm8gYnJhbmQp
 IDx0aW1AdXNycHJvLmNvbT6JAVQEEwEIAD4WIQQFOffTVi842DFoUgmGd5iNgHLo3gUCW+AI
 9gIbAwUJAeEzgAULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRCGd5iNgHLo3mCIB/oDJ/e6
 egBCCQmuyl8TtodhiHmKvQM6fN6dT39UbbJDbtz0yDMjYcgqMS6sHUbUBeKWo4inYtwocpRw
 2sIwRMcEzEQwjii36TaBMujBWWLQFN/Ztus6kZmap+zqRQRbJyLybDT3a5ZzKYT+5r89n3cs
 Pv45qLA4/UtrW8AdXwW1LKW7SxsHX7YGg/M7Y21DqoK6REtgiHu4bp8x5BfI9Xgfq3+Gyn/1
 7VQOa7gJQPKRumGpN122Plsnpw4Smnx24IokgNqu+NmVLGrkPA3YjHQJpwW8I2msP5mZVraS
 UEzEX/1snJMAwb6u7ksIT4KqfdmTsqK6ErYlXKq9WNMbNRknuQENBFvgCH0BCADK2qMS+6Rl
 O4iLLqDpiM/sOIpNokxCv0AgEP/cTuHdZKksRt4cvLFYGQvGEywekLtcHQUrlYlwz6oUpuET
 fxGHq8S1zImUIok1Y5A7TsJhC4d4Rf4lSuKm+yKarrLuqHp2pLNa2hRt2azxipSC/QNvVk5H
 52AE9UKK5gqPjMqoTP2WWzRJIJFzTPbHUjppfAkS4a432UsNmcAvSQCzo8cytFPj7oaT/bSr
 eIAE0Hj2eQRNIMpwRkGFgr9TgW/K0EaK2oUAhxeD9Rdg5VE5WrG+JKhZahjCLTP3R0PidYsa
 oeUZWrMiZIWCEi9kKfXoMHxU32gWruAYNtPmDRPH04QnABEBAAGJATwEGAEIACYWIQQFOffT
 Vi842DFoUgmGd5iNgHLo3gUCW+AIfQIbDAUJAeEzgAAKCRCGd5iNgHLo3hAHCADU0qBcTRuJ
 O4scVn5dKQLKGZwnCSrV5aDi29w5zFDGwtbAF/nAmYsQZyM+h/TD9azGKT1S/P9ljtg0xROT
 Ncl6hOAfqUNPKNCy18cbnZPqQ4FYAwwwqmMElhIfmLB1wO2VlMXw2PNHPzk5NlpJsa/PC8Wn
 RuX9Kw+wK/ZXsQICMo/RT1ZDpEYXrwcvAoBNftHjT/oAdXlTX43tk7NNqZTfCgthF9VS2lqZ
 BwXrnYg0ziDwvPw5Jbf/fpL5o/jlN/bRO2qMGELqmfA0HNb+wJZndfO9DODylz+D8eSMldDp
 35pKoy29Yuktf2iqvw8qhI9AJbLiXOyR0YrY2IoOjyxi
Message-ID: <e925e3b4-f2de-7408-779c-cccdc4d41cbd@usrpro.com>
Date:   Sat, 15 Jun 2019 09:11:13 +0300
MIME-Version: 1.0
In-Reply-To: <20190615.082110.1448671611220266574.teika@gmx.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=usrpro.com;
        s=dkim; t=1560579076; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WDH5qarKDcVEK9UPeJxmJp832j7pqcrNV1tcI4gJYNo=;
        b=aYAy2X2gAGD1L6xILfn1za/w3CJ4T7cGXuk+xQFWXMgxgEk3vipPz0Zz9WWIScWvULMIyA
        GAG3kden29c7lzA/riLXCDp7VT67TDbxip1zWnQZYieq6tCz96ZXMt01vF67Q+Mrbdro14
        Q5Q1R488DHyUk9z2ghaI2QHi4Z8DGnY=
ARC-Seal: i=1; s=dkim; d=usrpro.com; t=1560579076; a=rsa-sha256; cv=none;
        b=kqWFuEFs9/p6IjS4BSb4r6O5G7vLPhEGxa9pMoeq8L1/oaSkaH3IJtrXviz7BZyMltwKBJWgmufwps0/5cEnts0gkY9pZv2ApchjuODud6/7trmlyI0s9Q+qKL1atZKQ6oMjv/8/EhRWCUaEfh57g1+8GsaQV+sbbXvluQY8+TM=
ARC-Authentication-Results: i=1; mailu01.usrpro.com;
        auth=pass smtp.auth=tim@usrpro.com smtp.mailfrom=tim@usrpro.com
Authentication-Results: mailu01.usrpro.com;
        auth=pass smtp.auth=tim@usrpro.com smtp.mailfrom=tim@usrpro.com
X-Spamd-Bar: /
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Teika,

Thanks for your reply. s2ram and s2disk work fine. Just double checked
it. I've been using "psmouse.synaptics_intertouch=1" for more then two
weeks now and haven't noticed anything strange.

Yes, I can apply a patch and compile. Just tell me which kernel version.

Br, Tim Mohlmann

On 6/15/19 2:21 AM, Teika Kazura wrote:
> Hi, Tim. Thanks for your report.
>
> With "psmouse.synaptics_intertouch=1", do suspend and hibernation (aka s2ram and s2disk) work without problem? (This is a must check.)
>
> If it is possible for you to apply a patch to the source and compile the kernel, I'll prepare a patch and send it.
>
>> I have not received any response on below message.
> Sorry to hear that. I'm not a kernel developer, but have been working on this issue to help them. Unless someone volunteers, a change won't happen, unfortunately. (In fact, I was aware of your first message, but I've been busy. ;-)
>
> Regards,
> Teika
>
> From: Tim Mohlmann <tim@usrpro.com>
> Subject: Synaptics i2c and rmi: dmesg requested to send report
> Date: Mon, 27 May 2019 14:08:13 +0300
>
>> Good day,
>>
>> I'm sending this report as suggested by dmesg message:
>>
>> psmouse serio2: synaptics: Your touchpad (PNP: SYN1218 PNP0f13) says it
>> can support a different bus. If i2c-hid and hid-rmi are not used, you
>> might want to try setting psmouse.synaptics_intertouch to 1 and report
>> this to linux-input@vger.kernel.org.
>>
>> Checked in /proc/bus/input/devices:
>>
>> I: Bus=0011 Vendor=0002 Product=0007 Version=01b1
>> N: Name="SynPS/2 Synaptics TouchPad"
>> P: Phys=isa0060/serio2/input0
>> S: Sysfs=/devices/platform/i8042/serio2/input/input10
>> U: Uniq=
>> H: Handlers=event5
>> B: PROP=1
>> B: EV=b
>> B: KEY=e520 30000 0 0 0 0
>> B: ABS=660800011000003
>>
>> So I've set psmouse.synaptics_intertouch=1 on kernel command line and
>> after reboot:
>>
>> I: Bus=001d Vendor=06cb Product=0000 Version=0000
>> N: Name="Synaptics TM3189-001"
>> P: Phys=rmi4-00/input0
>> S: Sysfs=/devices/rmi4-00/input/input11
>> U: Uniq=
>> H: Handlers=event5
>> B: PROP=1
>> B: EV=b
>> B: KEY=e520 30000 0 0 0 0
>> B: ABS=6f3800001000003
>>
>> Its worth to mention that the touchpad worked using PS/2, but was a bit
>> choppy in its response. It works way better after setting
>> psmouse.synaptics_intertouch=1.
>>
>> I don't now the make of the touchpad, as it does not show up in lspci.
>> It's part of a custom built laptop, based on a Clevo N350DW model.
>> Hopefully the above vendor ID is all you need.
>>
>> |$ uname -r 5.1.4-gentoo $ grep -E 'INPUT|I2C_HID|HID_RMI' .config
>> CONFIG_RFKILL_INPUT=y CONFIG_INPUT=y CONFIG_INPUT_LEDS=m
>> CONFIG_INPUT_FF_MEMLESS=y CONFIG_INPUT_POLLDEV=y
>> CONFIG_INPUT_SPARSEKMAP=m # CONFIG_INPUT_MATRIXKMAP is not set #
>> CONFIG_INPUT_MOUSEDEV is not set # CONFIG_INPUT_JOYDEV is not set
>> CONFIG_INPUT_EVDEV=y # CONFIG_INPUT_EVBUG is not set
>> CONFIG_INPUT_KEYBOARD=y CONFIG_INPUT_MOUSE=y CONFIG_INPUT_JOYSTICK=y
>> CONFIG_INPUT_TABLET=y CONFIG_INPUT_TOUCHSCREEN=y CONFIG_INPUT_MISC=y #
>> CONFIG_INPUT_AD714X is not set # CONFIG_INPUT_BMA150 is not set #
>> CONFIG_INPUT_E3X0_BUTTON is not set # CONFIG_INPUT_MSM_VIBRATOR is not
>> set # CONFIG_INPUT_PCSPKR is not set # CONFIG_INPUT_MMA8450 is not set #
>> CONFIG_INPUT_APANEL is not set # CONFIG_INPUT_ATLAS_BTNS is not set #
>> CONFIG_INPUT_ATI_REMOTE2 is not set # CONFIG_INPUT_KEYSPAN_REMOTE is not
>> set # CONFIG_INPUT_KXTJ9 is not set # CONFIG_INPUT_POWERMATE is not set
>> # CONFIG_INPUT_YEALINK is not set # CONFIG_INPUT_CM109 is not set #
>> CONFIG_INPUT_UINPUT is not set # CONFIG_INPUT_PCF8574 is not set #
>> CONFIG_INPUT_ADXL34X is not set # CONFIG_INPUT_IMS_PCU is not set #
>> CONFIG_INPUT_CMA3000 is not set # CONFIG_INPUT_IDEAPAD_SLIDEBAR is not
>> set # CONFIG_INPUT_DRV2665_HAPTICS is not set #
>> CONFIG_INPUT_DRV2667_HAPTICS is not set
>> CONFIG_USB_VIDEO_CLASS_INPUT_EVDEV=y CONFIG_USB_PWC_INPUT_EVDEV=y
>> CONFIG_SND_JACK_INPUT_DEV=y # CONFIG_SND_HDA_INPUT_BEEP is not set
>> CONFIG_HID_RMI=y CONFIG_I2C_HID=y|
>>
>> Let me know if there is anything else you need from me.
>>
>> Br, Tim Mohlmann
