Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F11C54854E
	for <lists+linux-input@lfdr.de>; Mon, 17 Jun 2019 16:27:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726028AbfFQO0p (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 Jun 2019 10:26:45 -0400
Received: from mailu01.usrpro.com ([116.203.53.249]:32784 "EHLO
        mailu01.usrpro.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbfFQO0p (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 Jun 2019 10:26:45 -0400
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
        by mailu01.usrpro.com (Postfix) with ESMTPA id BD6475DC437;
        Mon, 17 Jun 2019 14:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=usrpro.com; s=dkim;
        t=1560781602; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IWbfPDgTqaJagdxP+FPeTYJBjCJ09fxeSKuD1BU7U/o=;
        b=juNniHraXRSEnQEAGsKVvds/xcwIN4qw62rl6DYOb3Ix6gwWj+hvQHPEy8LVEEEFy9naAu
        +SlOPTd8RIjl9PEg6t++p8gB2xSBObhpIBSJ4oq5WZeCu9rRA2DQrJJOTz8860c6EiexN6
        YGxTg0m79ClDZq9lGjjaEIiumFeWWB8=
Subject: Re: Synaptics i2c and rmi: dmesg requested to send report
From:   Tim Mohlmann <tim@usrpro.com>
To:     Teika Kazura <teika@gmx.com>, linux-input@vger.kernel.org
References: <df3db17a-db2c-b8b8-e399-271149ea9b76@usrpro.com>
 <7CDB47F5-65C2-4B09-8C02-EE72D4EAE1BE@usrpro.com>
 <20190615.082110.1448671611220266574.teika@gmx.com>
 <e925e3b4-f2de-7408-779c-cccdc4d41cbd@usrpro.com>
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
Message-ID: <30811639-e7da-6406-4f08-ddccdcfe29b9@usrpro.com>
Date:   Mon, 17 Jun 2019 17:26:40 +0300
MIME-Version: 1.0
In-Reply-To: <e925e3b4-f2de-7408-779c-cccdc4d41cbd@usrpro.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=usrpro.com;
        s=dkim; t=1560781602; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IWbfPDgTqaJagdxP+FPeTYJBjCJ09fxeSKuD1BU7U/o=;
        b=PDDETswd8sc0tZEcvPo8I257wsZzurybxtJuYSJcjaVjQ68tnGL3ZOd37PGw4kvRmVw0a5
        B8V2RW+qiYGagBLc8kWxVotyHs48nXTX757PIKfIs/0XC5MzNEXvXe+1KN12gAB1N8ViZ3
        TtkjQe1MirPA+fc5QdizP6L8x35J1NY=
ARC-Seal: i=1; s=dkim; d=usrpro.com; t=1560781602; a=rsa-sha256; cv=none;
        b=cQdVwovG4pLRSrzzuYYxmEglmSt/RjUk1xM6YTvlA34i1c2fAmuMTu+Z2mDdOfyFG6IuU5aI3iiInpOEg7I9Vxh+7msDNVkqwWoaZ+S8EZ3eRPMyOKeoC/rUse9OnlFEhFCZJIjP0dFFKmZW8qROp2oznpZKoRnC62cFPgM4DJk=
ARC-Authentication-Results: i=1; mailu01.usrpro.com;
        auth=pass smtp.auth=tim@usrpro.com smtp.mailfrom=tim@usrpro.com
Authentication-Results: mailu01.usrpro.com;
        auth=pass smtp.auth=tim@usrpro.com smtp.mailfrom=tim@usrpro.com
X-Spamd-Bar: /
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

I also wouldn't mind trying to write a patch myself, if its just a
trivial mapping. Some tips where to look, some documentation perhaps?

On 6/15/19 9:11 AM, Tim Mohlmann wrote:
> Hi Teika,
>
> Thanks for your reply. s2ram and s2disk work fine. Just double checked
> it. I've been using "psmouse.synaptics_intertouch=3D1" for more then tw=
o
> weeks now and haven't noticed anything strange.
>
> Yes, I can apply a patch and compile. Just tell me which kernel version=
=2E
>
> Br, Tim Mohlmann
>
> On 6/15/19 2:21 AM, Teika Kazura wrote:
>> Hi, Tim. Thanks for your report.
>>
>> With "psmouse.synaptics_intertouch=3D1", do suspend and hibernation (a=
ka s2ram and s2disk) work without problem? (This is a must check.)
>>
>> If it is possible for you to apply a patch to the source and compile t=
he kernel, I'll prepare a patch and send it.
>>
>>> I have not received any response on below message.
>> Sorry to hear that. I'm not a kernel developer, but have been working =
on this issue to help them. Unless someone volunteers, a change won't hap=
pen, unfortunately. (In fact, I was aware of your first message, but I've=
 been busy. ;-)
>>
>> Regards,
>> Teika
>>
>> From: Tim Mohlmann <tim@usrpro.com>
>> Subject: Synaptics i2c and rmi: dmesg requested to send report
>> Date: Mon, 27 May 2019 14:08:13 +0300
>>
>>> Good day,
>>>
>>> I'm sending this report as suggested by dmesg message:
>>>
>>> psmouse serio2: synaptics: Your touchpad (PNP: SYN1218 PNP0f13) says =
it
>>> can support a different bus. If i2c-hid and hid-rmi are not used, you=

>>> might want to try setting psmouse.synaptics_intertouch to 1 and repor=
t
>>> this to linux-input@vger.kernel.org.
>>>
>>> Checked in /proc/bus/input/devices:
>>>
>>> I: Bus=3D0011 Vendor=3D0002 Product=3D0007 Version=3D01b1
>>> N: Name=3D"SynPS/2 Synaptics TouchPad"
>>> P: Phys=3Disa0060/serio2/input0
>>> S: Sysfs=3D/devices/platform/i8042/serio2/input/input10
>>> U: Uniq=3D
>>> H: Handlers=3Devent5
>>> B: PROP=3D1
>>> B: EV=3Db
>>> B: KEY=3De520 30000 0 0 0 0
>>> B: ABS=3D660800011000003
>>>
>>> So I've set psmouse.synaptics_intertouch=3D1 on kernel command line a=
nd
>>> after reboot:
>>>
>>> I: Bus=3D001d Vendor=3D06cb Product=3D0000 Version=3D0000
>>> N: Name=3D"Synaptics TM3189-001"
>>> P: Phys=3Drmi4-00/input0
>>> S: Sysfs=3D/devices/rmi4-00/input/input11
>>> U: Uniq=3D
>>> H: Handlers=3Devent5
>>> B: PROP=3D1
>>> B: EV=3Db
>>> B: KEY=3De520 30000 0 0 0 0
>>> B: ABS=3D6f3800001000003
>>>
>>> Its worth to mention that the touchpad worked using PS/2, but was a b=
it
>>> choppy in its response. It works way better after setting
>>> psmouse.synaptics_intertouch=3D1.
>>>
>>> I don't now the make of the touchpad, as it does not show up in lspci=
=2E
>>> It's part of a custom built laptop, based on a Clevo N350DW model.
>>> Hopefully the above vendor ID is all you need.
>>>
>>> |$ uname -r 5.1.4-gentoo $ grep -E 'INPUT|I2C_HID|HID_RMI' .config
>>> CONFIG_RFKILL_INPUT=3Dy CONFIG_INPUT=3Dy CONFIG_INPUT_LEDS=3Dm
>>> CONFIG_INPUT_FF_MEMLESS=3Dy CONFIG_INPUT_POLLDEV=3Dy
>>> CONFIG_INPUT_SPARSEKMAP=3Dm # CONFIG_INPUT_MATRIXKMAP is not set #
>>> CONFIG_INPUT_MOUSEDEV is not set # CONFIG_INPUT_JOYDEV is not set
>>> CONFIG_INPUT_EVDEV=3Dy # CONFIG_INPUT_EVBUG is not set
>>> CONFIG_INPUT_KEYBOARD=3Dy CONFIG_INPUT_MOUSE=3Dy CONFIG_INPUT_JOYSTIC=
K=3Dy
>>> CONFIG_INPUT_TABLET=3Dy CONFIG_INPUT_TOUCHSCREEN=3Dy CONFIG_INPUT_MIS=
C=3Dy #
>>> CONFIG_INPUT_AD714X is not set # CONFIG_INPUT_BMA150 is not set #
>>> CONFIG_INPUT_E3X0_BUTTON is not set # CONFIG_INPUT_MSM_VIBRATOR is no=
t
>>> set # CONFIG_INPUT_PCSPKR is not set # CONFIG_INPUT_MMA8450 is not se=
t #
>>> CONFIG_INPUT_APANEL is not set # CONFIG_INPUT_ATLAS_BTNS is not set #=

>>> CONFIG_INPUT_ATI_REMOTE2 is not set # CONFIG_INPUT_KEYSPAN_REMOTE is =
not
>>> set # CONFIG_INPUT_KXTJ9 is not set # CONFIG_INPUT_POWERMATE is not s=
et
>>> # CONFIG_INPUT_YEALINK is not set # CONFIG_INPUT_CM109 is not set #
>>> CONFIG_INPUT_UINPUT is not set # CONFIG_INPUT_PCF8574 is not set #
>>> CONFIG_INPUT_ADXL34X is not set # CONFIG_INPUT_IMS_PCU is not set #
>>> CONFIG_INPUT_CMA3000 is not set # CONFIG_INPUT_IDEAPAD_SLIDEBAR is no=
t
>>> set # CONFIG_INPUT_DRV2665_HAPTICS is not set #
>>> CONFIG_INPUT_DRV2667_HAPTICS is not set
>>> CONFIG_USB_VIDEO_CLASS_INPUT_EVDEV=3Dy CONFIG_USB_PWC_INPUT_EVDEV=3Dy=

>>> CONFIG_SND_JACK_INPUT_DEV=3Dy # CONFIG_SND_HDA_INPUT_BEEP is not set
>>> CONFIG_HID_RMI=3Dy CONFIG_I2C_HID=3Dy|
>>>
>>> Let me know if there is anything else you need from me.
>>>
>>> Br, Tim Mohlmann

