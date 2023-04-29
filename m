Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1513F6F23C2
	for <lists+linux-input@lfdr.de>; Sat, 29 Apr 2023 11:02:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230184AbjD2JCG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 29 Apr 2023 05:02:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbjD2JCF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 29 Apr 2023 05:02:05 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F1D81BCD
        for <linux-input@vger.kernel.org>; Sat, 29 Apr 2023 02:02:03 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-95678d891d6so136259366b.1
        for <linux-input@vger.kernel.org>; Sat, 29 Apr 2023 02:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682758922; x=1685350922;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MD6FsLRMb44SS2IRF4Js3f7Flq6D4RRnuj4SUAZ8zmA=;
        b=P8MAA3ppJiqoF11u4tkUxWgU2/ECyfI0fuW5f1RqoEy+CdXOM65qOEiaXLwItMZT0r
         AdSNI/EgqaB3nN1IVr7Wz1c575RqdT6wVjeOrmLm3exeze9hRqK9DITFh5oS4CEjwU8m
         OOVTBSB/GIuhTTFSaWZ2rj6QY9dhnS8cBgFUMtCaSzFoSK6Z5UW2YvdeN+ESmORqJSE3
         8+U/8M2szRtD5DK78+Mqtjonujsh58m/qVcg3TDtVdA6ssGfAbx6U4Ev1BXwfrnfyovP
         ZMh7kOzJLTAx/Yvi5B+o8fiX3wXCIVpU62YUypHvmi2wK86bxQY3kyelAD7Tc6jl/p/S
         QNKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682758922; x=1685350922;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MD6FsLRMb44SS2IRF4Js3f7Flq6D4RRnuj4SUAZ8zmA=;
        b=iaaQI2oEM9hDjzFEsoQbzu5MfRNQYkKOHKvAcMfIY8hSYaOlB8KNDP3eWbntyi6TcS
         uueWE9Z2sSrYfhf9cxI3AHGPPIrFkwF/U5MRp+WmIwS+8lL1RjYPQKp1ld9OeV5Zq00k
         xTqD8dzxAqaDCysFCaV0jLZxFG5cLt2icKuSxW/Kf8BYpx3EHEVMvj2jf87mcvAZfTu5
         iFbLgGlQaWYQq7i8xlRxza9guLlDHqSM6a9g3ZUzcguimW1naL2y4IMLQ8ftNpPIVScQ
         3r/rRAHjM8LvC4R9decCXV339eMmrKMBkMvUxGb7NpYH15pFaZXLoIkNV5Js/IdUilbf
         HDEw==
X-Gm-Message-State: AC+VfDwRjFH6/myV4POD8DV6fBMhUvXGAshgjWTT7hmqoQntdyZVfTHA
        FJu7ezrIkdpczxSmyO/kZYBcP0VwpLz7O55ujX1rfvDyC/hWGw==
X-Google-Smtp-Source: ACHHUZ5oaie81zAKzZPt/tx1AdA6BQhVHbbInaKKAwSXrl5psvaGTPsv0wddh7aZZ0NKLVM2HcGVZNxWwlB1BJYhRaI=
X-Received: by 2002:a17:906:eec8:b0:94a:9c4e:d2e9 with SMTP id
 wu8-20020a170906eec800b0094a9c4ed2e9mr8324640ejb.0.1682758921462; Sat, 29 Apr
 2023 02:02:01 -0700 (PDT)
MIME-Version: 1.0
From:   "Alexander E. Patrakov" <patrakov@gmail.com>
Date:   Sat, 29 Apr 2023 17:01:34 +0800
Message-ID: <CAN_LGv0cS-mR7HxCfAwO4U9CG+r6mfrxty-woQuYxfvjZ8SBbw@mail.gmail.com>
Subject: Quirks needed for Dell Inspiron 7415 2-in-1 touchscreen
To:     Benjamin Tissoires <btissoir@redhat.com>,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

A few days ago, I bought a new laptop, Dell Inspiron 7415 2-in-1. It
has a touchscreen that works out of the box - until you buy a stylus
recommended by Dell. The stylus is "Dell Active Pen PN350M", which
uses Microsoft Pen Protocol.

The problem is that, when I lift the pen off the screen, the touch
point remains active, but jumps into one of the corners. This
persists, and makes doing anything in the GUI impossible, until the
laptop is powered off.

I have looked into hid-multitouch.c, and found that there is a quirk
that might be relevant: MT_QUIRK_VALID_IS_INRANGE. Unfortunately, it
does not really help, see below.

The default quirks for this touchscreen are 0x51c10, which means
MT_QUIRK_ALWAYS_VALID | MT_QUIRK_IGNORE_DUPLICATES | MT_QUIRK_HOVERING
| MT_QUIRK_CONTACT_CNT_ACCURATE | MT_QUIRK_STICKY_FINGERS |
MT_QUIRK_WIN8_PTP_BUTTONS. So I guessed I should remove
MT_QUIRK_ALWAYS_VALID and add MT_QUIRK_VALID_IS_INRANGE, which results
in 0x51c20.

So:

echo 0x51c20 > /sys/devices/platform/AMDI0010:00/i2c-0/i2c-04F31234:00/0018:04F3:2C68.0004/quirks

Result: the touchscreen now tracks the stylus correctly, but does not
react to fingers anymore.

I am willing to try kernel patches, but have too much other work to
try writing myself a new quirk that applies the "in range means valid"
logic for stylus only.

If you need any other debug info, please tell me.

The /proc/bus/input/devices file contains:
============================
I: Bus=0019 Vendor=0000 Product=0001 Version=0000
N: Name="Power Button"
P: Phys=PNP0C0C/button/input0
S: Sysfs=/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input0
U: Uniq=
H: Handlers=kbd event0
B: PROP=0
B: EV=3
B: KEY=10000000000000 0

I: Bus=0019 Vendor=0000 Product=0005 Version=0000
N: Name="Lid Switch"
P: Phys=PNP0C0D/button/input0
S: Sysfs=/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0D:00/input/input1
U: Uniq=
H: Handlers=event1
B: PROP=0
B: EV=21
B: SW=1

I: Bus=0019 Vendor=0000 Product=0003 Version=0000
N: Name="Sleep Button"
P: Phys=PNP0C0E/button/input0
S: Sysfs=/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input2
U: Uniq=
H: Handlers=kbd event2
B: PROP=0
B: EV=3
B: KEY=4000 0 0

I: Bus=0011 Vendor=0001 Product=0001 Version=ab41
N: Name="AT Translated Set 2 keyboard"
P: Phys=isa0060/serio0/input0
S: Sysfs=/devices/platform/i8042/serio0/input/input3
U: Uniq=
H: Handlers=sysrq kbd leds event3
B: PROP=0
B: EV=120013
B: KEY=1100f02902000 8380307cf910f001 feffffdfffefffff fffffffffffffffe
B: MSC=10
B: LED=7

I: Bus=0019 Vendor=0000 Product=0006 Version=0000
N: Name="Video Bus"
P: Phys=LNXVIDEO/video/input0
S: Sysfs=/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:10/LNXVIDEO:00/input/input5
U: Uniq=
H: Handlers=kbd event4
B: PROP=0
B: EV=3
B: KEY=3e000b00000000 0 0 0

I: Bus=0019 Vendor=0000 Product=0000 Version=0000
N: Name="DELL Wireless hotkeys"
P: Phys=dellabce/input0
S: Sysfs=/devices/virtual/input/input6
U: Uniq=
H: Handlers=kbd event5 rfkill
B: PROP=0
B: EV=3
B: KEY=80000000000000 0 0 0

I: Bus=0010 Vendor=001f Product=0001 Version=0100
N: Name="PC Speaker"
P: Phys=isa0061/input0
S: Sysfs=/devices/platform/pcspkr/input/input7
U: Uniq=
H: Handlers=kbd event6
B: PROP=0
B: EV=40001
B: SND=6

I: Bus=0019 Vendor=0000 Product=0000 Version=0000
N: Name="Dell WMI hotkeys"
P: Phys=
S: Sysfs=/devices/platform/PNP0C14:00/wmi_bus/wmi_bus-PNP0C14:00/9DBB5994-A997-11DA-B012-B622A1EF5492/input/input18
U: Uniq=
H: Handlers=kbd event7 rfkill
B: PROP=0
B: EV=13
B: KEY=800000000000 0 0 101500b00000c00 1200300000 e000000000000 0
B: MSC=10

I: Bus=0003 Vendor=0c45 Product=6a10 Version=0271
N: Name="Integrated_Webcam_HD: Integrate"
P: Phys=usb-0000:03:00.4-1/button
S: Sysfs=/devices/pci0000:00/0000:00:08.1/0000:03:00.4/usb3/3-1/3-1:1.0/input/input19
U: Uniq=
H: Handlers=kbd event8
B: PROP=0
B: EV=3
B: KEY=100000 0 0 0

I: Bus=0000 Vendor=0000 Product=0000 Version=0000
N: Name="HD-Audio Generic HDMI/DP,pcm=3"
P: Phys=ALSA
S: Sysfs=/devices/pci0000:00/0000:00:08.1/0000:03:00.1/sound/card0/input20
U: Uniq=
H: Handlers=event9
B: PROP=0
B: EV=21
B: SW=140

I: Bus=0018 Vendor=06cb Product=ce26 Version=0100
N: Name="DELL0A8C:00 06CB:CE26 Mouse"
P: Phys=i2c-DELL0A8C:00
S: Sysfs=/devices/platform/AMDI0010:03/i2c-1/i2c-DELL0A8C:00/0018:06CB:CE26.0005/input/input22
U: Uniq=
H: Handlers=event11 mouse0
B: PROP=0
B: EV=17
B: KEY=30000 0 0 0 0
B: REL=3
B: MSC=10

I: Bus=0000 Vendor=0000 Product=0000 Version=0000
N: Name="HD-Audio Generic HDMI/DP,pcm=7"
P: Phys=ALSA
S: Sysfs=/devices/pci0000:00/0000:00:08.1/0000:03:00.1/sound/card0/input21
U: Uniq=
H: Handlers=event10
B: PROP=0
B: EV=21
B: SW=140

I: Bus=0018 Vendor=06cb Product=ce26 Version=0100
N: Name="DELL0A8C:00 06CB:CE26 Touchpad"
P: Phys=i2c-DELL0A8C:00
S: Sysfs=/devices/platform/AMDI0010:03/i2c-1/i2c-DELL0A8C:00/0018:06CB:CE26.0005/input/input23
U: Uniq=
H: Handlers=event12 mouse1
B: PROP=5
B: EV=1b
B: KEY=e520 10000 0 0 0 0
B: ABS=2e0800000000003
B: MSC=20

I: Bus=0018 Vendor=04f3 Product=2c68 Version=0100
N: Name="04F31234:00 04F3:2C68"
P: Phys=i2c-04F31234:00
S: Sysfs=/devices/platform/AMDI0010:00/i2c-0/i2c-04F31234:00/0018:04F3:2C68.0004/input/input25
U: Uniq=
H: Handlers=event13 mouse2
B: PROP=2
B: EV=1b
B: KEY=400 0 0 0 0 0
B: ABS=3273800000000003
B: MSC=20

I: Bus=0018 Vendor=04f3 Product=2c68 Version=0100
N: Name="04F31234:00 04F3:2C68 UNKNOWN"
P: Phys=i2c-04F31234:00
S: Sysfs=/devices/platform/AMDI0010:00/i2c-0/i2c-04F31234:00/0018:04F3:2C68.0004/input/input26
U: Uniq=
H: Handlers=event14
B: PROP=0
B: EV=9
B: ABS=10000000000

I: Bus=0018 Vendor=04f3 Product=2c68 Version=0100
N: Name="04F31234:00 04F3:2C68 UNKNOWN"
P: Phys=i2c-04F31234:00
S: Sysfs=/devices/platform/AMDI0010:00/i2c-0/i2c-04F31234:00/0018:04F3:2C68.0004/input/input27
U: Uniq=
H: Handlers=event15
B: PROP=0
B: EV=100001

I: Bus=0018 Vendor=04f3 Product=2c68 Version=0100
N: Name="04F31234:00 04F3:2C68 Stylus"
P: Phys=i2c-04F31234:00
S: Sysfs=/devices/platform/AMDI0010:00/i2c-0/i2c-04F31234:00/0018:04F3:2C68.0004/input/input28
U: Uniq=
H: Handlers=event16 mouse3
B: PROP=2
B: EV=1b
B: KEY=c03 0 0 0 0 0
B: ABS=1000d000003
B: MSC=10

I: Bus=0000 Vendor=0000 Product=0000 Version=0000
N: Name="HD-Audio Generic Headphone Mic"
P: Phys=ALSA
S: Sysfs=/devices/pci0000:00/0000:00:08.1/0000:03:00.6/sound/card1/input31
U: Uniq=
H: Handlers=event17
B: PROP=0
B: EV=21
B: SW=4
============================

Here is some udevadm info, just in case, too:

============================

Udevadm info starts with the device specified by the devpath and then
walks up the chain of parent devices. It prints for every device
found, all possible attributes in the udev rules key format.
A rule to match, can be composed by the attributes of the device
and the attributes from one single parent device.

  looking at device
'/devices/platform/AMDI0010:00/i2c-0/i2c-04F31234:00/0018:04F3:2C68.0004/input/input28':
    KERNEL=="input28"
    SUBSYSTEM=="input"
    DRIVER==""
    ATTR{capabilities/abs}=="1000d000003"
    ATTR{capabilities/ev}=="1b"
    ATTR{capabilities/ff}=="0"
    ATTR{capabilities/key}=="c03 0 0 0 0 0"
    ATTR{capabilities/led}=="0"
    ATTR{capabilities/msc}=="10"
    ATTR{capabilities/rel}=="0"
    ATTR{capabilities/snd}=="0"
    ATTR{capabilities/sw}=="0"
    ATTR{id/bustype}=="0018"
    ATTR{id/product}=="2c68"
    ATTR{id/vendor}=="04f3"
    ATTR{id/version}=="0100"
    ATTR{inhibited}=="0"
    ATTR{name}=="04F31234:00 04F3:2C68 Stylus"
    ATTR{phys}=="i2c-04F31234:00"
    ATTR{power/control}=="auto"
    ATTR{power/runtime_active_time}=="0"
    ATTR{power/runtime_status}=="unsupported"
    ATTR{power/runtime_suspended_time}=="0"
    ATTR{properties}=="2"
    ATTR{uniq}==""

  looking at parent device
'/devices/platform/AMDI0010:00/i2c-0/i2c-04F31234:00/0018:04F3:2C68.0004':
    KERNELS=="0018:04F3:2C68.0004"
    SUBSYSTEMS=="hid"
    DRIVERS=="hid-multitouch"
    ATTRS{country}=="00"
    ATTRS{power/control}=="auto"
    ATTRS{power/runtime_active_time}=="0"
    ATTRS{power/runtime_status}=="unsupported"
    ATTRS{power/runtime_suspended_time}=="0"
    ATTRS{quirks}=="334880"

  looking at parent device
'/devices/platform/AMDI0010:00/i2c-0/i2c-04F31234:00':
    KERNELS=="i2c-04F31234:00"
    SUBSYSTEMS=="i2c"
    DRIVERS=="i2c_hid_acpi"
    ATTRS{name}=="04F31234:00"
    ATTRS{power/control}=="auto"
    ATTRS{power/runtime_active_time}=="0"
    ATTRS{power/runtime_status}=="unsupported"
    ATTRS{power/runtime_suspended_time}=="0"

  looking at parent device '/devices/platform/AMDI0010:00/i2c-0':
    KERNELS=="i2c-0"
    SUBSYSTEMS=="i2c"
    DRIVERS==""
    ATTRS{delete_device}=="(not readable)"
    ATTRS{name}=="Synopsys DesignWare I2C adapter"
    ATTRS{new_device}=="(not readable)"
    ATTRS{waiting_for_supplier}=="0"

  looking at parent device '/devices/platform/AMDI0010:00':
    KERNELS=="AMDI0010:00"
    SUBSYSTEMS=="platform"
    DRIVERS=="i2c_designware"
    ATTRS{driver_override}=="(null)"
    ATTRS{power/autosuspend_delay_ms}=="1000"
    ATTRS{power/control}=="auto"
    ATTRS{power/runtime_active_time}=="1809937"
    ATTRS{power/runtime_status}=="active"
    ATTRS{power/runtime_suspended_time}=="74571"

  looking at parent device '/devices/platform':
    KERNELS=="platform"
    SUBSYSTEMS==""
    DRIVERS==""
    ATTRS{power/control}=="auto"
    ATTRS{power/runtime_active_time}=="0"
    ATTRS{power/runtime_status}=="unsupported"
    ATTRS{power/runtime_suspended_time}=="0"

============================




-- 
Alexander E. Patrakov
