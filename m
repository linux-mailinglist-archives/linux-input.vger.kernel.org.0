Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70D9E46CC9
	for <lists+linux-input@lfdr.de>; Sat, 15 Jun 2019 01:21:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725942AbfFNXV3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Jun 2019 19:21:29 -0400
Received: from mout.gmx.net ([212.227.15.18]:37887 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725809AbfFNXV3 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Jun 2019 19:21:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1560554487;
        bh=vp13mwOPYUchUZ8Ne/jG4Fddri7ZuSWv6jcXJ1hawTs=;
        h=X-UI-Sender-Class:Date:To:Subject:From:In-Reply-To:References;
        b=CiQ+sDiTeXuSgfFqi4igvv6U4OtLPYb3V1TkrloH5Uecs42rix3BOouYn0uX7S4X/
         10aAlV11bmT6IyvsR/2jgblQFVNsy/rTgtzaQcctFi6D62XvhMhb9qbvriQFhxSfYs
         FuUo83XgRNi9UDLlI/TK0hln/4H2v1GO5aeSd01Q=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([153.230.190.14]) by mail.gmx.com (mrgmx003
 [212.227.17.184]) with ESMTPSA (Nemesis) id 0LmKag-1iBoE017pK-00ZxKU; Sat, 15
 Jun 2019 01:21:26 +0200
Date:   Sat, 15 Jun 2019 08:21:10 +0900 (JST)
Message-Id: <20190615.082110.1448671611220266574.teika@gmx.com>
To:     tim@usrpro.com, linux-input@vger.kernel.org
Subject: Re: Synaptics i2c and rmi: dmesg requested to send report
From:   Teika Kazura <teika@gmx.com>
In-Reply-To: <7CDB47F5-65C2-4B09-8C02-EE72D4EAE1BE@usrpro.com>
        <df3db17a-db2c-b8b8-e399-271149ea9b76@usrpro.com>
References: <df3db17a-db2c-b8b8-e399-271149ea9b76@usrpro.com>
        <7CDB47F5-65C2-4B09-8C02-EE72D4EAE1BE@usrpro.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:U0CNjkwKcBfkzJZR9hxXRAazz7Lp5X3bQ0GUdx6Ocj035s5tkLJ
 J3xgO/laSb5YDXywYmGAuN6YSwRSd+UaIrKpUWvCP2bBnJBz7OOdCZs0GI+iSzacs9/L7DO
 xsl++Ah8U+eDH9AtSDyGmqMJmALmw787m2nfQ9xxsTJQMcXbQlg3NqKbmFypfD2Rjgejwex
 c0ZSHFaQFMqJzLYNWZnuw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:tF9jr8cd/7Q=:bogpvr6xiT2qpwjEl3TuSP
 CogPFVPC5G8E0HnELJAq8wUvYrEIXmaQDPjj298R5mLcwbzLnXMn/DCeM6SV+JpFqhsxsiury
 /fclXZHeWFl+7Be4dAAowyjUjp0q+q1rfQ/xfxHR84UXSM1Mm8fuAlqjt5ekdBN+85HHQ+Phj
 pMvdoeEvMfDH8QuRvcHlXNoR2ZeD5s1991dxqTMs+MsQJLTIx1CUKIs7peSgNZfXAqHyID6qs
 KOmzQ2fvLghbxUljlZY0D6fnR6HDJui3GZL5SUq7UeVLERIZrNDw89+vmoeoXdKz7dXdTBTi3
 S/jMPMPP9TlP3DzSrQWQ6ENQutHZWGjRlaJLAaF7PoUM+K4LNDbaq3GYbgQ5/JDFXkMOh3Oy2
 NpiN8NyhCtNkhQwr1LJFnwY5hdFuUbpQxyjIDU2ZUmz+9J7/iF1/CddCuN1v9SEHDIl1zkCGc
 pUbG5rrfB9Bia8FrafTqveD2Pa7jkmcy6hPD+Rw/PGlmanXEKRnuXKcXTFr/pt0C7jZGsftZK
 q2c2YcL34Va7rRTxwUNesQCbSKTOq3pc+g2jiwZBIe034r/Yur35tLxYaLUcz3esYlAj0jIjE
 W5QjcrH30PiPLw0hJ+vInQls9Sx0UfLbZ5vxv18iLNpT0rRlXciBgKYGeGNVtC2esnqZ8nZyi
 6PmjqOh9M36Qr8+kCLzc7cms40EEmm2nIUpwlr5D7W6H/shUWJsKoz/l5JFTCRt82FDiiUEF2
 JVK3Q2Sd/DoWNO4s/3Gfk25Np3vRlaDBsgJ+Gl6nQlGHY2s4fiUUSbYZlRM0vvShLklTQs32/
 JPSVqVLqlExqVR/l82lKu1ZsbduuZOfo5kIp6GJ+q1c+HxgsT1yiZmyNoKTrXUnn8k2u3MTjh
 kjze1Pc4LLyoYMcy7wtmuxe5AE0GbA657Vw05eBMDXgwBPeXCoH/+TiXMj+JPyAzrRXmNtT6t
 IK+HQNstBnnNavymaFipd7Dm7qdoGbJAEkaFHBlZzp49YHjcH+prM
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi, Tim. Thanks for your report.

With "psmouse.synaptics_intertouch=3D1", do suspend and hibernation (aka s=
2ram and s2disk) work without problem? (This is a must check.)

If it is possible for you to apply a patch to the source and compile the k=
ernel, I'll prepare a patch and send it.

> I have not received any response on below message.

Sorry to hear that. I'm not a kernel developer, but have been working on t=
his issue to help them. Unless someone volunteers, a change won't happen, =
unfortunately. (In fact, I was aware of your first message, but I've been =
busy. ;-)

Regards,
Teika

From: Tim Mohlmann <tim@usrpro.com>
Subject: Synaptics i2c and rmi: dmesg requested to send report
Date: Mon, 27 May 2019 14:08:13 +0300

> Good day,
>
> I'm sending this report as suggested by dmesg message:
>
> psmouse serio2: synaptics: Your touchpad (PNP: SYN1218 PNP0f13) says it
> can support a different bus. If i2c-hid and hid-rmi are not used, you
> might want to try setting psmouse.synaptics_intertouch to 1 and report
> this to linux-input@vger.kernel.org.
>
> Checked in /proc/bus/input/devices:
>
> I: Bus=3D0011 Vendor=3D0002 Product=3D0007 Version=3D01b1
> N: Name=3D"SynPS/2 Synaptics TouchPad"
> P: Phys=3Disa0060/serio2/input0
> S: Sysfs=3D/devices/platform/i8042/serio2/input/input10
> U: Uniq=3D
> H: Handlers=3Devent5
> B: PROP=3D1
> B: EV=3Db
> B: KEY=3De520 30000 0 0 0 0
> B: ABS=3D660800011000003
>
> So I've set psmouse.synaptics_intertouch=3D1 on kernel command line and
> after reboot:
>
> I: Bus=3D001d Vendor=3D06cb Product=3D0000 Version=3D0000
> N: Name=3D"Synaptics TM3189-001"
> P: Phys=3Drmi4-00/input0
> S: Sysfs=3D/devices/rmi4-00/input/input11
> U: Uniq=3D
> H: Handlers=3Devent5
> B: PROP=3D1
> B: EV=3Db
> B: KEY=3De520 30000 0 0 0 0
> B: ABS=3D6f3800001000003
>
> Its worth to mention that the touchpad worked using PS/2, but was a bit
> choppy in its response. It works way better after setting
> psmouse.synaptics_intertouch=3D1.
>
> I don't now the make of the touchpad, as it does not show up in lspci.
> It's part of a custom built laptop, based on a Clevo N350DW model.
> Hopefully the above vendor ID is all you need.
>
> |$ uname -r 5.1.4-gentoo $ grep -E 'INPUT|I2C_HID|HID_RMI' .config
> CONFIG_RFKILL_INPUT=3Dy CONFIG_INPUT=3Dy CONFIG_INPUT_LEDS=3Dm
> CONFIG_INPUT_FF_MEMLESS=3Dy CONFIG_INPUT_POLLDEV=3Dy
> CONFIG_INPUT_SPARSEKMAP=3Dm # CONFIG_INPUT_MATRIXKMAP is not set #
> CONFIG_INPUT_MOUSEDEV is not set # CONFIG_INPUT_JOYDEV is not set
> CONFIG_INPUT_EVDEV=3Dy # CONFIG_INPUT_EVBUG is not set
> CONFIG_INPUT_KEYBOARD=3Dy CONFIG_INPUT_MOUSE=3Dy CONFIG_INPUT_JOYSTICK=
=3Dy
> CONFIG_INPUT_TABLET=3Dy CONFIG_INPUT_TOUCHSCREEN=3Dy CONFIG_INPUT_MISC=
=3Dy #
> CONFIG_INPUT_AD714X is not set # CONFIG_INPUT_BMA150 is not set #
> CONFIG_INPUT_E3X0_BUTTON is not set # CONFIG_INPUT_MSM_VIBRATOR is not
> set # CONFIG_INPUT_PCSPKR is not set # CONFIG_INPUT_MMA8450 is not set #
> CONFIG_INPUT_APANEL is not set # CONFIG_INPUT_ATLAS_BTNS is not set #
> CONFIG_INPUT_ATI_REMOTE2 is not set # CONFIG_INPUT_KEYSPAN_REMOTE is not
> set # CONFIG_INPUT_KXTJ9 is not set # CONFIG_INPUT_POWERMATE is not set
> # CONFIG_INPUT_YEALINK is not set # CONFIG_INPUT_CM109 is not set #
> CONFIG_INPUT_UINPUT is not set # CONFIG_INPUT_PCF8574 is not set #
> CONFIG_INPUT_ADXL34X is not set # CONFIG_INPUT_IMS_PCU is not set #
> CONFIG_INPUT_CMA3000 is not set # CONFIG_INPUT_IDEAPAD_SLIDEBAR is not
> set # CONFIG_INPUT_DRV2665_HAPTICS is not set #
> CONFIG_INPUT_DRV2667_HAPTICS is not set
> CONFIG_USB_VIDEO_CLASS_INPUT_EVDEV=3Dy CONFIG_USB_PWC_INPUT_EVDEV=3Dy
> CONFIG_SND_JACK_INPUT_DEV=3Dy # CONFIG_SND_HDA_INPUT_BEEP is not set
> CONFIG_HID_RMI=3Dy CONFIG_I2C_HID=3Dy|
>
> Let me know if there is anything else you need from me.
>
> Br, Tim Mohlmann
