Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47E1770AA96
	for <lists+linux-input@lfdr.de>; Sat, 20 May 2023 21:01:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229957AbjETTBg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 20 May 2023 15:01:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229779AbjETTBf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 20 May 2023 15:01:35 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CFFAFB
        for <linux-input@vger.kernel.org>; Sat, 20 May 2023 12:01:32 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-510e682795fso5612348a12.3
        for <linux-input@vger.kernel.org>; Sat, 20 May 2023 12:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684609290; x=1687201290;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jDpVLzfHRu/A6T18PncJMK8uEOYbgZv0u0+Mp+JXuJE=;
        b=BuG9E7qmcWoJqBp+FXt29DZZ0NX5ZJYl07vHgWPCDOASgO1csExU0QZtgvc1VO7e+k
         Y37Odg3oJQO/dR9GfZsUpVbRXwiWsGhYiQnHi9XHz7c6LmGP8RSLXBtLgS3ko2qjPMIv
         57jn/s2RozS3Rlc4PtkPXS3YiVRR0v7EsZCfr+3NrTksddJK0B2Osx2QGP3L1QWnnf+2
         vt4HHuRaCRMwbh+rym9GDaEEPhOorOs7p4j4/STh6buSddooA6AceOz1uNvpkEJg4OJT
         2LxPL3tMxSnkmk1qKjcMvy+ds2XyBTrbcXpXwuiGwMHwit+GWgXk1xWXWN/vYX6LOA+O
         1Fsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684609290; x=1687201290;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jDpVLzfHRu/A6T18PncJMK8uEOYbgZv0u0+Mp+JXuJE=;
        b=aSu1ukLrVkprPR8haPO9ohTJSj7tgBvS4f66QAiIWC6Egb0mMP7P0efxDyVsHS3erv
         PxnXiQBGo0LIlju/bpavBp9Zi/wk3zyNK8C/RO/3pD/tGjDqXwJvxOjY0it+HITeCbjf
         X2eh9AhnfQeKUMRe6n17Gxj/On/stVeThR80KWjS6BKqSGfoC/4GfBn30c0qQtkcnSmo
         w9gPivbjvS5KN+aqaNig/JdMgW8rOMn1+dr0GstJq0ppzn93NFMm0xoeWEFBeIdGsZ2T
         VTxv+UrfCZi/JSZP/4KiTSzvLxK1sn2VhWt0jq4yfzWvr4T/6CUSeje+07DaZRxDk4sV
         Enag==
X-Gm-Message-State: AC+VfDzSxbolx5EY3WO2DlvdwPOkLjw6mKucw609FlGhTT93rEf647aH
        h7jXJsdJuMIbmZvFghy+goMqfxphMOggRO7fxBZsePtu2qg=
X-Google-Smtp-Source: ACHHUZ6/FpLx4yB7FqUKqkHNmkonkpWtWrLBaD6+zKWrouPUM7OQm1EucQkb7/pFTlrtYIuyVWxFRqAwWgkGIMswFvs=
X-Received: by 2002:a05:6402:1b08:b0:50b:e1e2:f6db with SMTP id
 by8-20020a0564021b0800b0050be1e2f6dbmr4588773edb.33.1684609290249; Sat, 20
 May 2023 12:01:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAN_LGv0cS-mR7HxCfAwO4U9CG+r6mfrxty-woQuYxfvjZ8SBbw@mail.gmail.com>
In-Reply-To: <CAN_LGv0cS-mR7HxCfAwO4U9CG+r6mfrxty-woQuYxfvjZ8SBbw@mail.gmail.com>
From:   "Alexander E. Patrakov" <patrakov@gmail.com>
Date:   Sun, 21 May 2023 03:01:03 +0800
Message-ID: <CAN_LGv2Wxq2oOsiM7nJRbLA9+A7aSmjum6L7rKgMRxGV793cYA@mail.gmail.com>
Subject: Re: Quirks needed for Dell Inspiron 7415 2-in-1 touchscreen
To:     Benjamin Tissoires <btissoir@redhat.com>,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello again,

Please ignore the report quoted below. Everything is working as
expected on linux 6.3.2.

On Sat, Apr 29, 2023 at 5:01=E2=80=AFPM Alexander E. Patrakov
<patrakov@gmail.com> wrote:
>
> Hello,
>
> A few days ago, I bought a new laptop, Dell Inspiron 7415 2-in-1. It
> has a touchscreen that works out of the box - until you buy a stylus
> recommended by Dell. The stylus is "Dell Active Pen PN350M", which
> uses Microsoft Pen Protocol.
>
> The problem is that, when I lift the pen off the screen, the touch
> point remains active, but jumps into one of the corners. This
> persists, and makes doing anything in the GUI impossible, until the
> laptop is powered off.
>
> I have looked into hid-multitouch.c, and found that there is a quirk
> that might be relevant: MT_QUIRK_VALID_IS_INRANGE. Unfortunately, it
> does not really help, see below.
>
> The default quirks for this touchscreen are 0x51c10, which means
> MT_QUIRK_ALWAYS_VALID | MT_QUIRK_IGNORE_DUPLICATES | MT_QUIRK_HOVERING
> | MT_QUIRK_CONTACT_CNT_ACCURATE | MT_QUIRK_STICKY_FINGERS |
> MT_QUIRK_WIN8_PTP_BUTTONS. So I guessed I should remove
> MT_QUIRK_ALWAYS_VALID and add MT_QUIRK_VALID_IS_INRANGE, which results
> in 0x51c20.
>
> So:
>
> echo 0x51c20 > /sys/devices/platform/AMDI0010:00/i2c-0/i2c-04F31234:00/00=
18:04F3:2C68.0004/quirks
>
> Result: the touchscreen now tracks the stylus correctly, but does not
> react to fingers anymore.
>
> I am willing to try kernel patches, but have too much other work to
> try writing myself a new quirk that applies the "in range means valid"
> logic for stylus only.
>
> If you need any other debug info, please tell me.
>
> The /proc/bus/input/devices file contains:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> I: Bus=3D0019 Vendor=3D0000 Product=3D0001 Version=3D0000
> N: Name=3D"Power Button"
> P: Phys=3DPNP0C0C/button/input0
> S: Sysfs=3D/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input0
> U: Uniq=3D
> H: Handlers=3Dkbd event0
> B: PROP=3D0
> B: EV=3D3
> B: KEY=3D10000000000000 0
>
> I: Bus=3D0019 Vendor=3D0000 Product=3D0005 Version=3D0000
> N: Name=3D"Lid Switch"
> P: Phys=3DPNP0C0D/button/input0
> S: Sysfs=3D/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0D:00/input/input1
> U: Uniq=3D
> H: Handlers=3Devent1
> B: PROP=3D0
> B: EV=3D21
> B: SW=3D1
>
> I: Bus=3D0019 Vendor=3D0000 Product=3D0003 Version=3D0000
> N: Name=3D"Sleep Button"
> P: Phys=3DPNP0C0E/button/input0
> S: Sysfs=3D/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input2
> U: Uniq=3D
> H: Handlers=3Dkbd event2
> B: PROP=3D0
> B: EV=3D3
> B: KEY=3D4000 0 0
>
> I: Bus=3D0011 Vendor=3D0001 Product=3D0001 Version=3Dab41
> N: Name=3D"AT Translated Set 2 keyboard"
> P: Phys=3Disa0060/serio0/input0
> S: Sysfs=3D/devices/platform/i8042/serio0/input/input3
> U: Uniq=3D
> H: Handlers=3Dsysrq kbd leds event3
> B: PROP=3D0
> B: EV=3D120013
> B: KEY=3D1100f02902000 8380307cf910f001 feffffdfffefffff fffffffffffffffe
> B: MSC=3D10
> B: LED=3D7
>
> I: Bus=3D0019 Vendor=3D0000 Product=3D0006 Version=3D0000
> N: Name=3D"Video Bus"
> P: Phys=3DLNXVIDEO/video/input0
> S: Sysfs=3D/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:10/LNXVIDEO=
:00/input/input5
> U: Uniq=3D
> H: Handlers=3Dkbd event4
> B: PROP=3D0
> B: EV=3D3
> B: KEY=3D3e000b00000000 0 0 0
>
> I: Bus=3D0019 Vendor=3D0000 Product=3D0000 Version=3D0000
> N: Name=3D"DELL Wireless hotkeys"
> P: Phys=3Ddellabce/input0
> S: Sysfs=3D/devices/virtual/input/input6
> U: Uniq=3D
> H: Handlers=3Dkbd event5 rfkill
> B: PROP=3D0
> B: EV=3D3
> B: KEY=3D80000000000000 0 0 0
>
> I: Bus=3D0010 Vendor=3D001f Product=3D0001 Version=3D0100
> N: Name=3D"PC Speaker"
> P: Phys=3Disa0061/input0
> S: Sysfs=3D/devices/platform/pcspkr/input/input7
> U: Uniq=3D
> H: Handlers=3Dkbd event6
> B: PROP=3D0
> B: EV=3D40001
> B: SND=3D6
>
> I: Bus=3D0019 Vendor=3D0000 Product=3D0000 Version=3D0000
> N: Name=3D"Dell WMI hotkeys"
> P: Phys=3D
> S: Sysfs=3D/devices/platform/PNP0C14:00/wmi_bus/wmi_bus-PNP0C14:00/9DBB59=
94-A997-11DA-B012-B622A1EF5492/input/input18
> U: Uniq=3D
> H: Handlers=3Dkbd event7 rfkill
> B: PROP=3D0
> B: EV=3D13
> B: KEY=3D800000000000 0 0 101500b00000c00 1200300000 e000000000000 0
> B: MSC=3D10
>
> I: Bus=3D0003 Vendor=3D0c45 Product=3D6a10 Version=3D0271
> N: Name=3D"Integrated_Webcam_HD: Integrate"
> P: Phys=3Dusb-0000:03:00.4-1/button
> S: Sysfs=3D/devices/pci0000:00/0000:00:08.1/0000:03:00.4/usb3/3-1/3-1:1.0=
/input/input19
> U: Uniq=3D
> H: Handlers=3Dkbd event8
> B: PROP=3D0
> B: EV=3D3
> B: KEY=3D100000 0 0 0
>
> I: Bus=3D0000 Vendor=3D0000 Product=3D0000 Version=3D0000
> N: Name=3D"HD-Audio Generic HDMI/DP,pcm=3D3"
> P: Phys=3DALSA
> S: Sysfs=3D/devices/pci0000:00/0000:00:08.1/0000:03:00.1/sound/card0/inpu=
t20
> U: Uniq=3D
> H: Handlers=3Devent9
> B: PROP=3D0
> B: EV=3D21
> B: SW=3D140
>
> I: Bus=3D0018 Vendor=3D06cb Product=3Dce26 Version=3D0100
> N: Name=3D"DELL0A8C:00 06CB:CE26 Mouse"
> P: Phys=3Di2c-DELL0A8C:00
> S: Sysfs=3D/devices/platform/AMDI0010:03/i2c-1/i2c-DELL0A8C:00/0018:06CB:=
CE26.0005/input/input22
> U: Uniq=3D
> H: Handlers=3Devent11 mouse0
> B: PROP=3D0
> B: EV=3D17
> B: KEY=3D30000 0 0 0 0
> B: REL=3D3
> B: MSC=3D10
>
> I: Bus=3D0000 Vendor=3D0000 Product=3D0000 Version=3D0000
> N: Name=3D"HD-Audio Generic HDMI/DP,pcm=3D7"
> P: Phys=3DALSA
> S: Sysfs=3D/devices/pci0000:00/0000:00:08.1/0000:03:00.1/sound/card0/inpu=
t21
> U: Uniq=3D
> H: Handlers=3Devent10
> B: PROP=3D0
> B: EV=3D21
> B: SW=3D140
>
> I: Bus=3D0018 Vendor=3D06cb Product=3Dce26 Version=3D0100
> N: Name=3D"DELL0A8C:00 06CB:CE26 Touchpad"
> P: Phys=3Di2c-DELL0A8C:00
> S: Sysfs=3D/devices/platform/AMDI0010:03/i2c-1/i2c-DELL0A8C:00/0018:06CB:=
CE26.0005/input/input23
> U: Uniq=3D
> H: Handlers=3Devent12 mouse1
> B: PROP=3D5
> B: EV=3D1b
> B: KEY=3De520 10000 0 0 0 0
> B: ABS=3D2e0800000000003
> B: MSC=3D20
>
> I: Bus=3D0018 Vendor=3D04f3 Product=3D2c68 Version=3D0100
> N: Name=3D"04F31234:00 04F3:2C68"
> P: Phys=3Di2c-04F31234:00
> S: Sysfs=3D/devices/platform/AMDI0010:00/i2c-0/i2c-04F31234:00/0018:04F3:=
2C68.0004/input/input25
> U: Uniq=3D
> H: Handlers=3Devent13 mouse2
> B: PROP=3D2
> B: EV=3D1b
> B: KEY=3D400 0 0 0 0 0
> B: ABS=3D3273800000000003
> B: MSC=3D20
>
> I: Bus=3D0018 Vendor=3D04f3 Product=3D2c68 Version=3D0100
> N: Name=3D"04F31234:00 04F3:2C68 UNKNOWN"
> P: Phys=3Di2c-04F31234:00
> S: Sysfs=3D/devices/platform/AMDI0010:00/i2c-0/i2c-04F31234:00/0018:04F3:=
2C68.0004/input/input26
> U: Uniq=3D
> H: Handlers=3Devent14
> B: PROP=3D0
> B: EV=3D9
> B: ABS=3D10000000000
>
> I: Bus=3D0018 Vendor=3D04f3 Product=3D2c68 Version=3D0100
> N: Name=3D"04F31234:00 04F3:2C68 UNKNOWN"
> P: Phys=3Di2c-04F31234:00
> S: Sysfs=3D/devices/platform/AMDI0010:00/i2c-0/i2c-04F31234:00/0018:04F3:=
2C68.0004/input/input27
> U: Uniq=3D
> H: Handlers=3Devent15
> B: PROP=3D0
> B: EV=3D100001
>
> I: Bus=3D0018 Vendor=3D04f3 Product=3D2c68 Version=3D0100
> N: Name=3D"04F31234:00 04F3:2C68 Stylus"
> P: Phys=3Di2c-04F31234:00
> S: Sysfs=3D/devices/platform/AMDI0010:00/i2c-0/i2c-04F31234:00/0018:04F3:=
2C68.0004/input/input28
> U: Uniq=3D
> H: Handlers=3Devent16 mouse3
> B: PROP=3D2
> B: EV=3D1b
> B: KEY=3Dc03 0 0 0 0 0
> B: ABS=3D1000d000003
> B: MSC=3D10
>
> I: Bus=3D0000 Vendor=3D0000 Product=3D0000 Version=3D0000
> N: Name=3D"HD-Audio Generic Headphone Mic"
> P: Phys=3DALSA
> S: Sysfs=3D/devices/pci0000:00/0000:00:08.1/0000:03:00.6/sound/card1/inpu=
t31
> U: Uniq=3D
> H: Handlers=3Devent17
> B: PROP=3D0
> B: EV=3D21
> B: SW=3D4
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>
> Here is some udevadm info, just in case, too:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>
> Udevadm info starts with the device specified by the devpath and then
> walks up the chain of parent devices. It prints for every device
> found, all possible attributes in the udev rules key format.
> A rule to match, can be composed by the attributes of the device
> and the attributes from one single parent device.
>
>   looking at device
> '/devices/platform/AMDI0010:00/i2c-0/i2c-04F31234:00/0018:04F3:2C68.0004/=
input/input28':
>     KERNEL=3D=3D"input28"
>     SUBSYSTEM=3D=3D"input"
>     DRIVER=3D=3D""
>     ATTR{capabilities/abs}=3D=3D"1000d000003"
>     ATTR{capabilities/ev}=3D=3D"1b"
>     ATTR{capabilities/ff}=3D=3D"0"
>     ATTR{capabilities/key}=3D=3D"c03 0 0 0 0 0"
>     ATTR{capabilities/led}=3D=3D"0"
>     ATTR{capabilities/msc}=3D=3D"10"
>     ATTR{capabilities/rel}=3D=3D"0"
>     ATTR{capabilities/snd}=3D=3D"0"
>     ATTR{capabilities/sw}=3D=3D"0"
>     ATTR{id/bustype}=3D=3D"0018"
>     ATTR{id/product}=3D=3D"2c68"
>     ATTR{id/vendor}=3D=3D"04f3"
>     ATTR{id/version}=3D=3D"0100"
>     ATTR{inhibited}=3D=3D"0"
>     ATTR{name}=3D=3D"04F31234:00 04F3:2C68 Stylus"
>     ATTR{phys}=3D=3D"i2c-04F31234:00"
>     ATTR{power/control}=3D=3D"auto"
>     ATTR{power/runtime_active_time}=3D=3D"0"
>     ATTR{power/runtime_status}=3D=3D"unsupported"
>     ATTR{power/runtime_suspended_time}=3D=3D"0"
>     ATTR{properties}=3D=3D"2"
>     ATTR{uniq}=3D=3D""
>
>   looking at parent device
> '/devices/platform/AMDI0010:00/i2c-0/i2c-04F31234:00/0018:04F3:2C68.0004'=
:
>     KERNELS=3D=3D"0018:04F3:2C68.0004"
>     SUBSYSTEMS=3D=3D"hid"
>     DRIVERS=3D=3D"hid-multitouch"
>     ATTRS{country}=3D=3D"00"
>     ATTRS{power/control}=3D=3D"auto"
>     ATTRS{power/runtime_active_time}=3D=3D"0"
>     ATTRS{power/runtime_status}=3D=3D"unsupported"
>     ATTRS{power/runtime_suspended_time}=3D=3D"0"
>     ATTRS{quirks}=3D=3D"334880"
>
>   looking at parent device
> '/devices/platform/AMDI0010:00/i2c-0/i2c-04F31234:00':
>     KERNELS=3D=3D"i2c-04F31234:00"
>     SUBSYSTEMS=3D=3D"i2c"
>     DRIVERS=3D=3D"i2c_hid_acpi"
>     ATTRS{name}=3D=3D"04F31234:00"
>     ATTRS{power/control}=3D=3D"auto"
>     ATTRS{power/runtime_active_time}=3D=3D"0"
>     ATTRS{power/runtime_status}=3D=3D"unsupported"
>     ATTRS{power/runtime_suspended_time}=3D=3D"0"
>
>   looking at parent device '/devices/platform/AMDI0010:00/i2c-0':
>     KERNELS=3D=3D"i2c-0"
>     SUBSYSTEMS=3D=3D"i2c"
>     DRIVERS=3D=3D""
>     ATTRS{delete_device}=3D=3D"(not readable)"
>     ATTRS{name}=3D=3D"Synopsys DesignWare I2C adapter"
>     ATTRS{new_device}=3D=3D"(not readable)"
>     ATTRS{waiting_for_supplier}=3D=3D"0"
>
>   looking at parent device '/devices/platform/AMDI0010:00':
>     KERNELS=3D=3D"AMDI0010:00"
>     SUBSYSTEMS=3D=3D"platform"
>     DRIVERS=3D=3D"i2c_designware"
>     ATTRS{driver_override}=3D=3D"(null)"
>     ATTRS{power/autosuspend_delay_ms}=3D=3D"1000"
>     ATTRS{power/control}=3D=3D"auto"
>     ATTRS{power/runtime_active_time}=3D=3D"1809937"
>     ATTRS{power/runtime_status}=3D=3D"active"
>     ATTRS{power/runtime_suspended_time}=3D=3D"74571"
>
>   looking at parent device '/devices/platform':
>     KERNELS=3D=3D"platform"
>     SUBSYSTEMS=3D=3D""
>     DRIVERS=3D=3D""
>     ATTRS{power/control}=3D=3D"auto"
>     ATTRS{power/runtime_active_time}=3D=3D"0"
>     ATTRS{power/runtime_status}=3D=3D"unsupported"
>     ATTRS{power/runtime_suspended_time}=3D=3D"0"
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D


--=20
Alexander E. Patrakov
