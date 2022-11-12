Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0319626AF3
	for <lists+linux-input@lfdr.de>; Sat, 12 Nov 2022 18:58:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232026AbiKLR62 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 12 Nov 2022 12:58:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232759AbiKLR61 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 12 Nov 2022 12:58:27 -0500
Received: from mail.trevino.org (unknown [67.199.169.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30F54E4A
        for <linux-input@vger.kernel.org>; Sat, 12 Nov 2022 09:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=trevino.org.pem; s=mail; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=jUQJxPhB+eT/L097qarVimUJHDH+P1Nom3fxkfuWtoA=; b=FUHUyDQqDKhen8XFwxyjLgtpNw
        8fe+fsqLbqWiF+GTNLrLfHc5zP98EbS4EEqlMVYwJ5G69t6X8Pv8Ax6fksL/2sAg+FYZSFIvM2fwJ
        6JEjz2ImtkjJ9nznxYTJnmXGRlcFZOhdcAJzovMRU+QHBWXHmp28f/OHNKK8QcJdkwzQ=;
Received: from [192.168.10.51] (helo=beto.localnet)
        by mail.mypals.org with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.95)
        (envelope-from <alberto@trevino.org>)
        id 1otult-0004gv-5L
        for linux-input@vger.kernel.org;
        Sat, 12 Nov 2022 10:58:25 -0700
From:   Alberto =?ISO-8859-1?Q?Trevi=F1o?= <alberto@trevino.org>
To:     linux-input@vger.kernel.org
Subject: ThinkPad TrackPoint issues with new keyboard
Date:   Sat, 12 Nov 2022 10:58:24 -0700
Message-ID: <4485525.GykEUoSsop@beto>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart5149912.u1vTbnGHCI"
Content-Transfer-Encoding: 7Bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,RDNS_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This is a multi-part message in MIME format.

--nextPart5149912.u1vTbnGHCI
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hello everyone. Thank you all for the wonderful contributions you make to=20
Linux.

I had to replace the keyboard on my lenovo ThinkPad x260 laptop. The=20
keyboard, of course, required the replacement of the TrackPoint (red mouse=
=20
dot) but not the Trackpad. Since the replacement, the TrackPoint doesn't=20
work properly: the mouse pointer moves really slow across the screen, the=20
mouse pointer jumps to the edges of the screen randomly, and the mouse=20
clicks randomly which leads to moved or closed windows and weird behaviors.

Looking at dmesg I found the following message (Linux version 6.0.2):

psmouse serio1: synaptics: Your touchpad (PNP: LEN2014 PNP0f13) says it can=
=20
support a different bus. If i2c-hid and hid-rmi are not used, you might wan=
t=20
to try setting psmouse.synaptics_intertouch to 1 and report this to linux-
input@vger.kernel.org.
=20
I set psmouse.synaptics_intertouch to 1 as instructed. The change fixed the=
=20
acceleration issue but I still have random clicks and jumps. Interestingly=
=20
enough, we then get some of these errors:

psmouse serio2: Mouse at rmi4-00.fn03/serio0/input0 lost synchronization,=20
throwing 2 bytes away.

I also tried setting proto=3Dbare as suggested in a forum. That fixed the m=
ouse=20
jumping issue. The pointer was really slow, no sudden jumps or clicks, but=
=20
the TouchPad would no longer support gestures like two-finger scrolling.

I have attached the output of dmesg | grep -e input -e i2c and libinput=20
list-devices before and after setting psmouse.synaptics_intertouch=3D1. I u=
se=20
Arch Linux and I'm fairly savvy; I should be able to provide any debug=20
output you'd like and rebuild my kernel with a patch if required.

Thanks for the help.

=2D-=20
Alberto Trevi=F1o
alberto@trevino.org

--nextPart5149912.u1vTbnGHCI
Content-Disposition: attachment; filename="dmesg-input-i2c.txt"
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; name="dmesg-input-i2c.txt"

[    0.409546] input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0D:00/input/input0
[    0.409767] input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input1
[    0.409994] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input2
[    1.197051] input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input3
[    2.879554] input: PC Speaker as /devices/platform/pcspkr/input/input6
[    3.111296] i2c i2c-0: 1/1 memory slots populated (from DMI)
[    3.113375] i2c i2c-0: Successfully instantiated SPD at 0x50
[    3.404828] input: ThinkPad Extra Buttons as /devices/platform/thinkpad_acpi/input/input7
[    3.742863] psmouse serio1: synaptics: Your touchpad (PNP: LEN2014 PNP0f13) says it can support a different bus. If i2c-hid and hid-rmi are not used, you might want to try setting psmouse.synaptics_intertouch to 1 and report this to linux-input@vger.kernel.org.
[    3.798474] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input8
[    3.802416] psmouse serio1: synaptics: serio: Synaptics pass-through port at isa0060/serio1/input0
[    3.840620] input: SynPS/2 Synaptics TouchPad as /devices/platform/i8042/serio1/input/input5
[    3.871835] input: Integrated Camera: Integrated C as /devices/pci0000:00/0000:00:14.0/usb1/1-8/1-8:1.0/input/input10
[    4.062497] snd_hda_codec_realtek hdaudioC0D0:    inputs:
[    4.221765] input: HDA Intel PCH Dock Mic as /devices/pci0000:00/0000:00:1f.3/sound/card0/input11
[    4.221821] input: HDA Intel PCH Mic as /devices/pci0000:00/0000:00:1f.3/sound/card0/input12
[    4.221878] input: HDA Intel PCH Dock Headphone as /devices/pci0000:00/0000:00:1f.3/sound/card0/input13
[    4.221933] input: HDA Intel PCH Headphone as /devices/pci0000:00/0000:00:1f.3/sound/card0/input14
[    4.221987] input: HDA Intel PCH HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input15
[    4.222040] input: HDA Intel PCH HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input16
[    4.222087] input: HDA Intel PCH HDMI/DP,pcm=8 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input17
[    4.222136] input: HDA Intel PCH HDMI/DP,pcm=9 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input18
[    4.222182] input: HDA Intel PCH HDMI/DP,pcm=10 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input19
[    5.689741] input: PS/2 Generic Mouse as /devices/platform/i8042/serio1/serio2/input/input9

--nextPart5149912.u1vTbnGHCI
Content-Disposition: attachment; filename="dmesg-input-i2c-after.txt"
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; name="dmesg-input-i2c-after.txt"

# dmesg | grep -e input -e i2c
[    0.726565] input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0D:00/input/input0
[    0.726729] input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input1
[    0.726892] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input2
[    1.516567] input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input3
[    3.079419] i2c i2c-0: 1/1 memory slots populated (from DMI)
[    3.079625] input: PC Speaker as /devices/platform/pcspkr/input/input5
[    3.084941] i2c i2c-0: Successfully instantiated SPD at 0x50
[    3.382201] input: ThinkPad Extra Buttons as /devices/platform/thinkpad_acpi/input/input7
[    4.015522] input: Integrated Camera: Integrated C as /devices/pci0000:00/0000:00:14.0/usb1/1-8/1-8:1.0/input/input8
[    4.069130] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input9
[    4.230339] input: Synaptics TM3075-002 as /devices/pci0000:00/0000:00:1f.4/i2c-0/0-002c/rmi4-00/input/input10
[    4.340034] snd_hda_codec_realtek hdaudioC0D0:    inputs:
[    4.447927] input: HDA Intel PCH Dock Mic as /devices/pci0000:00/0000:00:1f.3/sound/card0/input12
[    4.448005] input: HDA Intel PCH Mic as /devices/pci0000:00/0000:00:1f.3/sound/card0/input13
[    4.448075] input: HDA Intel PCH Dock Headphone as /devices/pci0000:00/0000:00:1f.3/sound/card0/input14
[    4.448140] input: HDA Intel PCH Headphone as /devices/pci0000:00/0000:00:1f.3/sound/card0/input15
[    4.448205] input: HDA Intel PCH HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input16
[    4.448274] input: HDA Intel PCH HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input17
[    4.448339] input: HDA Intel PCH HDMI/DP,pcm=8 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input18
[    4.448404] input: HDA Intel PCH HDMI/DP,pcm=9 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input19
[    4.448468] input: HDA Intel PCH HDMI/DP,pcm=10 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input20
[    5.108948] input: PS/2 Generic Mouse as /devices/pci0000:00/0000:00:1f.4/i2c-0/0-002c/rmi4-00/rmi4-00.fn03/serio2/input/input11
[  315.498399] psmouse serio2: Mouse at rmi4-00.fn03/serio0/input0 lost synchronization, throwing 2 bytes away.
[  317.572906] input: PS/2 Generic Mouse as /devices/pci0000:00/0000:00:1f.4/i2c-0/0-002c/rmi4-00/rmi4-00.fn03/serio2/input/input21
[  395.111325] psmouse serio2: Mouse at rmi4-00.fn03/serio0/input0 lost synchronization, throwing 2 bytes away.

--nextPart5149912.u1vTbnGHCI
Content-Disposition: attachment; filename="libinput.txt"
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; name="libinput.txt"

Device:           Power Button
Kernel:           /dev/input/event2
Group:            1
Seat:             seat0, default
Capabilities:     keyboard 
Tap-to-click:     n/a
Tap-and-drag:     n/a
Tap drag lock:    n/a
Left-handed:      n/a
Nat.scrolling:    n/a
Middle emulation: n/a
Calibration:      n/a
Scroll methods:   none
Click methods:    none
Disable-w-typing: n/a
Disable-w-trackpointing: n/a
Accel profiles:   n/a
Rotation:         n/a

Device:           Video Bus
Kernel:           /dev/input/event6
Group:            2
Seat:             seat0, default
Capabilities:     keyboard 
Tap-to-click:     n/a
Tap-and-drag:     n/a
Tap drag lock:    n/a
Left-handed:      n/a
Nat.scrolling:    n/a
Middle emulation: n/a
Calibration:      n/a
Scroll methods:   none
Click methods:    none
Disable-w-typing: n/a
Disable-w-trackpointing: n/a
Accel profiles:   n/a
Rotation:         n/a

Device:           Lid Switch
Kernel:           /dev/input/event0
Group:            3
Seat:             seat0, default
Capabilities:     switch
Tap-to-click:     n/a
Tap-and-drag:     n/a
Tap drag lock:    n/a
Left-handed:      n/a
Nat.scrolling:    n/a
Middle emulation: n/a
Calibration:      n/a
Scroll methods:   none
Click methods:    none
Disable-w-typing: n/a
Disable-w-trackpointing: n/a
Accel profiles:   n/a
Rotation:         n/a

Device:           Sleep Button
Kernel:           /dev/input/event1
Group:            4
Seat:             seat0, default
Capabilities:     keyboard 
Tap-to-click:     n/a
Tap-and-drag:     n/a
Tap drag lock:    n/a
Left-handed:      n/a
Nat.scrolling:    n/a
Middle emulation: n/a
Calibration:      n/a
Scroll methods:   none
Click methods:    none
Disable-w-typing: n/a
Disable-w-trackpointing: n/a
Accel profiles:   n/a
Rotation:         n/a

Device:           Integrated Camera: Integrated C
Kernel:           /dev/input/event8
Group:            5
Seat:             seat0, default
Capabilities:     keyboard 
Tap-to-click:     n/a
Tap-and-drag:     n/a
Tap drag lock:    n/a
Left-handed:      n/a
Nat.scrolling:    n/a
Middle emulation: n/a
Calibration:      n/a
Scroll methods:   none
Click methods:    none
Disable-w-typing: n/a
Disable-w-trackpointing: n/a
Accel profiles:   n/a
Rotation:         n/a

Device:           AT Translated Set 2 keyboard
Kernel:           /dev/input/event3
Group:            6
Seat:             seat0, default
Capabilities:     keyboard 
Tap-to-click:     n/a
Tap-and-drag:     n/a
Tap drag lock:    n/a
Left-handed:      n/a
Nat.scrolling:    n/a
Middle emulation: n/a
Calibration:      n/a
Scroll methods:   none
Click methods:    none
Disable-w-typing: n/a
Disable-w-trackpointing: n/a
Accel profiles:   n/a
Rotation:         n/a

Device:           SynPS/2 Synaptics TouchPad
Kernel:           /dev/input/event7
Group:            7
Seat:             seat0, default
Size:             85x51mm
Capabilities:     pointer gesture
Tap-to-click:     disabled
Tap-and-drag:     enabled
Tap drag lock:    disabled
Left-handed:      disabled
Nat.scrolling:    disabled
Middle emulation: disabled
Calibration:      n/a
Scroll methods:   *two-finger edge 
Click methods:    *button-areas clickfinger 
Disable-w-typing: enabled
Disable-w-trackpointing: enabled
Accel profiles:   flat *adaptive
Rotation:         n/a

Device:           PS/2 Generic Mouse
Kernel:           /dev/input/event18
Group:            8
Seat:             seat0, default
Capabilities:     pointer 
Tap-to-click:     n/a
Tap-and-drag:     n/a
Tap drag lock:    n/a
Left-handed:      disabled
Nat.scrolling:    disabled
Middle emulation: disabled
Calibration:      n/a
Scroll methods:   *button
Click methods:    none
Disable-w-typing: n/a
Disable-w-trackpointing: n/a
Accel profiles:   flat *adaptive
Rotation:         n/a

Device:           ThinkPad Extra Buttons
Kernel:           /dev/input/event5
Group:            9
Seat:             seat0, default
Capabilities:     keyboard 
Tap-to-click:     n/a
Tap-and-drag:     n/a
Tap drag lock:    n/a
Left-handed:      n/a
Nat.scrolling:    n/a
Middle emulation: n/a
Calibration:      n/a
Scroll methods:   none
Click methods:    none
Disable-w-typing: n/a
Disable-w-trackpointing: n/a
Accel profiles:   n/a
Rotation:         n/a


--nextPart5149912.u1vTbnGHCI
Content-Disposition: attachment; filename="libinput-after.txt"
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; name="libinput-after.txt"

Device:           Power Button
Kernel:           /dev/input/event2
Group:            1
Seat:             seat0, default
Capabilities:     keyboard 
Tap-to-click:     n/a
Tap-and-drag:     n/a
Tap drag lock:    n/a
Left-handed:      n/a
Nat.scrolling:    n/a
Middle emulation: n/a
Calibration:      n/a
Scroll methods:   none
Click methods:    none
Disable-w-typing: n/a
Disable-w-trackpointing: n/a
Accel profiles:   n/a
Rotation:         n/a

Device:           Video Bus
Kernel:           /dev/input/event7
Group:            2
Seat:             seat0, default
Capabilities:     keyboard 
Tap-to-click:     n/a
Tap-and-drag:     n/a
Tap drag lock:    n/a
Left-handed:      n/a
Nat.scrolling:    n/a
Middle emulation: n/a
Calibration:      n/a
Scroll methods:   none
Click methods:    none
Disable-w-typing: n/a
Disable-w-trackpointing: n/a
Accel profiles:   n/a
Rotation:         n/a

Device:           Lid Switch
Kernel:           /dev/input/event0
Group:            3
Seat:             seat0, default
Capabilities:     switch
Tap-to-click:     n/a
Tap-and-drag:     n/a
Tap drag lock:    n/a
Left-handed:      n/a
Nat.scrolling:    n/a
Middle emulation: n/a
Calibration:      n/a
Scroll methods:   none
Click methods:    none
Disable-w-typing: n/a
Disable-w-trackpointing: n/a
Accel profiles:   n/a
Rotation:         n/a

Device:           Sleep Button
Kernel:           /dev/input/event1
Group:            4
Seat:             seat0, default
Capabilities:     keyboard 
Tap-to-click:     n/a
Tap-and-drag:     n/a
Tap drag lock:    n/a
Left-handed:      n/a
Nat.scrolling:    n/a
Middle emulation: n/a
Calibration:      n/a
Scroll methods:   none
Click methods:    none
Disable-w-typing: n/a
Disable-w-trackpointing: n/a
Accel profiles:   n/a
Rotation:         n/a

Device:           Integrated Camera: Integrated C
Kernel:           /dev/input/event6
Group:            5
Seat:             seat0, default
Capabilities:     keyboard 
Tap-to-click:     n/a
Tap-and-drag:     n/a
Tap drag lock:    n/a
Left-handed:      n/a
Nat.scrolling:    n/a
Middle emulation: n/a
Calibration:      n/a
Scroll methods:   none
Click methods:    none
Disable-w-typing: n/a
Disable-w-trackpointing: n/a
Accel profiles:   n/a
Rotation:         n/a

Device:           Synaptics TM3075-002
Kernel:           /dev/input/event8
Group:            6
Seat:             seat0, default
Size:             84x50mm
Capabilities:     pointer gesture
Tap-to-click:     disabled
Tap-and-drag:     enabled
Tap drag lock:    disabled
Left-handed:      disabled
Nat.scrolling:    disabled
Middle emulation: disabled
Calibration:      n/a
Scroll methods:   *two-finger edge 
Click methods:    *button-areas clickfinger 
Disable-w-typing: enabled
Disable-w-trackpointing: enabled
Accel profiles:   flat *adaptive
Rotation:         n/a

Device:           PS/2 Generic Mouse
Kernel:           /dev/input/event18
Group:            7
Seat:             seat0, default
Capabilities:     pointer 
Tap-to-click:     n/a
Tap-and-drag:     n/a
Tap drag lock:    n/a
Left-handed:      disabled
Nat.scrolling:    disabled
Middle emulation: disabled
Calibration:      n/a
Scroll methods:   *button
Click methods:    none
Disable-w-typing: n/a
Disable-w-trackpointing: n/a
Accel profiles:   flat *adaptive
Rotation:         n/a

Device:           AT Translated Set 2 keyboard
Kernel:           /dev/input/event3
Group:            8
Seat:             seat0, default
Capabilities:     keyboard 
Tap-to-click:     n/a
Tap-and-drag:     n/a
Tap drag lock:    n/a
Left-handed:      n/a
Nat.scrolling:    n/a
Middle emulation: n/a
Calibration:      n/a
Scroll methods:   none
Click methods:    none
Disable-w-typing: n/a
Disable-w-trackpointing: n/a
Accel profiles:   n/a
Rotation:         n/a

Device:           ThinkPad Extra Buttons
Kernel:           /dev/input/event5
Group:            9
Seat:             seat0, default
Capabilities:     keyboard 
Tap-to-click:     n/a
Tap-and-drag:     n/a
Tap drag lock:    n/a
Left-handed:      n/a
Nat.scrolling:    n/a
Middle emulation: n/a
Calibration:      n/a
Scroll methods:   none
Click methods:    none
Disable-w-typing: n/a
Disable-w-trackpointing: n/a
Accel profiles:   n/a
Rotation:         n/a


--nextPart5149912.u1vTbnGHCI--



