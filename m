Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4B4D41F8B
	for <lists+linux-input@lfdr.de>; Wed, 12 Jun 2019 10:46:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730353AbfFLIq2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Jun 2019 04:46:28 -0400
Received: from mailu01.usrpro.com ([116.203.53.249]:43288 "EHLO
        mailu01.usrpro.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726731AbfFLIq2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Jun 2019 04:46:28 -0400
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
        by mailu01.usrpro.com (Postfix) with ESMTPA id 993F45DC42A
        for <linux-input@vger.kernel.org>; Wed, 12 Jun 2019 08:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=usrpro.com; s=dkim;
        t=1560329186; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ChtgBnC0UtNFC+XvolHglHRMcozrbeFGw/gOeXI5GKY=;
        b=XRzEV9HISzB1crzKyv/3guiOVZCH0XVpbegIys1d2ZDWns2WAEiafrwK8aO9U+G780P8A3
        EwOY4mBEDCoe0ZOjak+6q1XoYwurWEP3CPh3yRQrf9kewpq5tDm/zQbhzrJae7rMlPok8N
        Jp3/stwwmDO5+m0qr227PPVGhwda+lI=
Date:   Wed, 12 Jun 2019 10:45:45 +0200
In-Reply-To: <df3db17a-db2c-b8b8-e399-271149ea9b76@usrpro.com>
References: <df3db17a-db2c-b8b8-e399-271149ea9b76@usrpro.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: Synaptics i2c and rmi: dmesg requested to send report
To:     linux-input@vger.kernel.org
From:   Tim Mohlmann <tim@usrpro.com>
Message-ID: <7CDB47F5-65C2-4B09-8C02-EE72D4EAE1BE@usrpro.com>
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=usrpro.com;
        s=dkim; t=1560329186; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ChtgBnC0UtNFC+XvolHglHRMcozrbeFGw/gOeXI5GKY=;
        b=QmjZ06FJYSJCwmC8Y8FeQNWJ4G34SEcHeFNbodyholPlU072I4zTK5yIJEGCLkiowe0Tnn
        W4Tl2AlZeeYXuqWSVIlLpaKECuvzpB5DK/KGpMt74QmR0d50ciEHNWPXtIeS0o6xwM/CBD
        OCn+7XQTlp9z/ns+gts7fphVPbuFF+Q=
ARC-Seal: i=1; s=dkim; d=usrpro.com; t=1560329186; a=rsa-sha256; cv=none;
        b=pA16ULOx5gOpbbSZ14Au3B+Yvj4eQZ3YYpgt3eFCw4vYp1DCE+nhhXszr5QBN4zupEuuju98a1715XL3PKc/AjbKq3Fn9N7jF8OoAi6NG46M1Oths6UMaS2DAiP3j/pRVEr1LusQ8G2bzeJ1fnUYCUpVq/sCpORcpXmDoBD/FwM=
ARC-Authentication-Results: i=1; mailu01.usrpro.com;
        auth=pass smtp.auth=tim@usrpro.com smtp.mailfrom=tim@usrpro.com
Authentication-Results: mailu01.usrpro.com;
        auth=pass smtp.auth=tim@usrpro.com smtp.mailfrom=tim@usrpro.com
X-Spamd-Bar: /
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Good day again,

I have not received any response on below message=2E However, I believe I'=
ve done my civil duty by reporting this=2E No hard feelings, but I intend t=
o unsubscribe from this ML as I don't have any other business here=2E

So unless there are some additional questions in the comming day, I will c=
onsider this case closed and I'll unsubscribe=2E

Thanks for your continuous effort on the kernel input drivers ;)=2E

Tim Mohlmann

On 27 May 2019 13:08:13 CEST, Tim Mohlmann <tim@usrpro=2Ecom> wrote:
>Good day,
>
>I'm sending this report as suggested by dmesg message:
>
>psmouse serio2: synaptics: Your touchpad (PNP: SYN1218 PNP0f13) says it
>can support a different bus=2E If i2c-hid and hid-rmi are not used, you
>might want to try setting psmouse=2Esynaptics_intertouch to 1 and report
>this to linux-input@vger=2Ekernel=2Eorg=2E
>
>Checked in /proc/bus/input/devices:
>
>I: Bus=3D0011 Vendor=3D0002 Product=3D0007 Version=3D01b1
>N: Name=3D"SynPS/2 Synaptics TouchPad"
>P: Phys=3Disa0060/serio2/input0
>S: Sysfs=3D/devices/platform/i8042/serio2/input/input10
>U: Uniq=3D
>H: Handlers=3Devent5
>B: PROP=3D1
>B: EV=3Db
>B: KEY=3De520 30000 0 0 0 0
>B: ABS=3D660800011000003
>
>So I've set psmouse=2Esynaptics_intertouch=3D1 on kernel command line and
>after reboot:
>
>I: Bus=3D001d Vendor=3D06cb Product=3D0000 Version=3D0000
>N: Name=3D"Synaptics TM3189-001"
>P: Phys=3Drmi4-00/input0
>S: Sysfs=3D/devices/rmi4-00/input/input11
>U: Uniq=3D
>H: Handlers=3Devent5
>B: PROP=3D1
>B: EV=3Db
>B: KEY=3De520 30000 0 0 0 0
>B: ABS=3D6f3800001000003
>
>Its worth to mention that the touchpad worked using PS/2, but was a bit
>choppy in its response=2E It works way better after setting
>psmouse=2Esynaptics_intertouch=3D1=2E
>
>I don't now the make of the touchpad, as it does not show up in lspci=2E
>It's part of a custom built laptop, based on a Clevo N350DW model=2E
>Hopefully the above vendor ID is all you need=2E
>
>|$ uname -r 5=2E1=2E4-gentoo $ grep -E 'INPUT|I2C_HID|HID_RMI' =2Econfig
>CONFIG_RFKILL_INPUT=3Dy CONFIG_INPUT=3Dy CONFIG_INPUT_LEDS=3Dm
>CONFIG_INPUT_FF_MEMLESS=3Dy CONFIG_INPUT_POLLDEV=3Dy
>CONFIG_INPUT_SPARSEKMAP=3Dm # CONFIG_INPUT_MATRIXKMAP is not set #
>CONFIG_INPUT_MOUSEDEV is not set # CONFIG_INPUT_JOYDEV is not set
>CONFIG_INPUT_EVDEV=3Dy # CONFIG_INPUT_EVBUG is not set
>CONFIG_INPUT_KEYBOARD=3Dy CONFIG_INPUT_MOUSE=3Dy CONFIG_INPUT_JOYSTICK=3D=
y
>CONFIG_INPUT_TABLET=3Dy CONFIG_INPUT_TOUCHSCREEN=3Dy CONFIG_INPUT_MISC=3D=
y #
>CONFIG_INPUT_AD714X is not set # CONFIG_INPUT_BMA150 is not set #
>CONFIG_INPUT_E3X0_BUTTON is not set # CONFIG_INPUT_MSM_VIBRATOR is not
>set # CONFIG_INPUT_PCSPKR is not set # CONFIG_INPUT_MMA8450 is not set
>#
>CONFIG_INPUT_APANEL is not set # CONFIG_INPUT_ATLAS_BTNS is not set #
>CONFIG_INPUT_ATI_REMOTE2 is not set # CONFIG_INPUT_KEYSPAN_REMOTE is
>not
>set # CONFIG_INPUT_KXTJ9 is not set # CONFIG_INPUT_POWERMATE is not set
># CONFIG_INPUT_YEALINK is not set # CONFIG_INPUT_CM109 is not set #
>CONFIG_INPUT_UINPUT is not set # CONFIG_INPUT_PCF8574 is not set #
>CONFIG_INPUT_ADXL34X is not set # CONFIG_INPUT_IMS_PCU is not set #
>CONFIG_INPUT_CMA3000 is not set # CONFIG_INPUT_IDEAPAD_SLIDEBAR is not
>set # CONFIG_INPUT_DRV2665_HAPTICS is not set #
>CONFIG_INPUT_DRV2667_HAPTICS is not set
>CONFIG_USB_VIDEO_CLASS_INPUT_EVDEV=3Dy CONFIG_USB_PWC_INPUT_EVDEV=3Dy
>CONFIG_SND_JACK_INPUT_DEV=3Dy # CONFIG_SND_HDA_INPUT_BEEP is not set
>CONFIG_HID_RMI=3Dy CONFIG_I2C_HID=3Dy|
>
>Let me know if there is anything else you need from me=2E
>
>Br, Tim Mohlmann

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
