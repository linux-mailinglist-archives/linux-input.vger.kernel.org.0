Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AE6A2F92B7
	for <lists+linux-input@lfdr.de>; Sun, 17 Jan 2021 15:03:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728089AbhAQOCx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 17 Jan 2021 09:02:53 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:43619 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727480AbhAQOCw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 17 Jan 2021 09:02:52 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.west.internal (Postfix) with ESMTP id 95DA3F83;
        Sun, 17 Jan 2021 09:01:45 -0500 (EST)
Received: from imap2 ([10.202.2.52])
  by compute2.internal (MEProxy); Sun, 17 Jan 2021 09:01:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=derhofbauer.at;
         h=mime-version:message-id:date:from:to:subject:content-type; s=
        fm1; bh=xncB9EeN1hTrn2rDFmYImd//8LwAbyXvQUwIrhXWe1M=; b=tNLW5Gek
        pKxFAYRqG/CtHYCr7l3kmvBPezQskRen75S5CXTuDQcKHMWmPAu83UnDwomlutkc
        K1t791HZT5QUyN0K+cQVYK6+U6BngGT28GFidrcMZXAoH0C23CCFgye4aRT996c2
        wpi56cSMa7YiAuz3YLeo2qQRp3ec9LBnxE+rm5OCddEAxqlJO3E4EI+8cLAvMZsA
        G5E9tiNgvkig1CfXHqX/sETd2hYo06zY26n777vf9Td4p6I8BZHyOjQ0tLnpmQ/9
        MrpAAUBXkXLeLsM0Z57qAuwpbi3Nxaqs4dgr6lYMko6NsssI1d5YL9SlkFRkLlH4
        v6LdnyQHZNbK1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-type:date:from:message-id
        :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm1; bh=xncB9EeN1hTrn2rDFmYImd//8LwAb
        yXvQUwIrhXWe1M=; b=QaV2zn5WMvcrB6mqDd9pSHQU1VrcEZJIDQ2AvWv2wXcCC
        C7Q/5wKaJJ91YqLZ0G5k6nDuqpEEHY4DonvPgjK6zNTXIT3NlkpzJL61jGA+lbis
        rXHWQnkNvJFn7I+Ct5PlHzWmUpOw1TaqvXREBLy6yzdVZ66TywJ2lMzwOtieWlfT
        QGJ87FVlBh+Qd5WzRz2mqF78JkQM2UYqJSBHZJm2Hz6q4o+i8GjVedaPCXjIUwhj
        J5snxQB13NJ99kZ3HnpqKkdDeSQItFs3O6Cga1KSnD5bkOsjIzGVbQdXldARmskO
        5YaGP1lsevjhj2xN/FYCfuo4L74yX3lNCxRlI4/6g==
X-ME-Sender: <xms:SEMEYGZwmlNwH7l-SoNauSC5Pf9qSBv0hw0CLKcamshyTgJaQQhgmw>
    <xme:SEMEYJabu7PD5WXdzCPnkEyRSGWZLIKm7l0W3ZwZmp1H4EfHp_KLg4VCg_IV9fBRo
    BriIaBye3q5gGWkiQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdeigdeiudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkfffhvffutgesthdtredtre
    ertdenucfhrhhomhepfdetlhgvgicujfhofhgsrghuvghrfdcuoehkvghrnhgvlhgsuhhg
    shesmhgrihhlrdguvghrhhhofhgsrghuvghrrdgrtheqnecuggftrfgrthhtvghrnheptd
    dvtedtveektddvffejvdekieegheefgfdtleehgffhhfeuvddtgeekfeeftddtnecuffho
    mhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehkvghrnhgvlhgsuhhgshesmhgrihhlrdguvghrhhhofhgs
    rghuvghrrdgrth
X-ME-Proxy: <xmx:SEMEYA9bUo6W8vSFyiQ8yCTMIAYXXO6thkNRZvvvaesLG68_rwPs6Q>
    <xmx:SEMEYIqrl8-9nJyf-5IwjZY5lxnahhhNf7EHDDU02t3cE9N4qJLb_g>
    <xmx:SEMEYBrKLbOWpREOMNc-HG80n0lTBuP2q8HFCU7S2Az46SblhWMz-g>
    <xmx:SUMEYO1BxtcOUKmOhgLeHEGkTG-S4SXsjR3W0JdfWUB2L2VBI9QTPQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id BE869E00A3; Sun, 17 Jan 2021 09:01:44 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-45-g4839256-fm-20210104.001-g48392560
Mime-Version: 1.0
Message-Id: <d267a4d9-94cb-4ae0-bb5d-3cf990b5202a@www.fastmail.com>
Date:   Sun, 17 Jan 2021 15:01:24 +0100
From:   "Alex Hofbauer" <kernelbugs@mail.derhofbauer.at>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org
Subject: [BUG] Elantech trackpoint on Thinkpad loses sync, jumps to edge
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On my Thinkpad T14s AMD (but observed on multiple models), the trackpoint sometimes jumps to an edge while being used.

There's a bug report I found and commented on [1] some time ago, but as far as I understood, Bugzilla is not the preferred method of reporting bugs?

Kernel: 5.10.2 (but apparently happens on 5.11.0-rc1 as well).

Firmware ID says PNP: LEN2143 PNP0f13.

Setup at boot:

serio: i8042 KBD port at 0x60,0x64 irq 1
serio: i8042 AUX port at 0x60,0x64 irq 12
psmouse serio1: elantech: assuming hardware version 4 (with firmware version 0x7f3001)
psmouse serio1: elantech: Synaptics capabilities query result 0x90, 0x18, 0x0f.
psmouse serio1: elantech: Elan sample query result 00, 80, c9
psmouse serio1: elantech: Trying to set up SMBus access
psmouse serio1: elantech: SMbus companion is not ready yet
input: ETPS/2 Elantech TrackPoint as /devices/platform/i8042/serio1/input/input8
input: ETPS/2 Elantech Touchpad as /devices/platform/i8042/serio1/input/input6

Various occurrences:

Dec 23 11:54:25 shlep kernel: psmouse serio1: elantech: PS/2 packet [24 80 80 36 00 00]
Dec 23 11:56:16 shlep kernel: psmouse serio1: elantech: PS/2 packet [10 80 80 36 00 00]
Dec 23 11:58:31 shlep kernel: psmouse serio1: Touchpad at isa0060/serio1/input0 lost sync at byte 6
Dec 23 11:58:31 shlep kernel: psmouse serio1: Touchpad at isa0060/serio1/input0 - driver resynced.
Dec 23 12:18:32 shlep kernel: psmouse serio1: Touchpad at isa0060/serio1/input0 lost sync at byte 6
Dec 23 12:18:32 shlep kernel: psmouse serio1: Touchpad at isa0060/serio1/input0 - driver resynced.
Dec 23 12:19:42 shlep kernel: psmouse serio1: elantech: PS/2 packet [10 80 80 36 00 00]
Dec 23 12:27:15 shlep kernel: psmouse serio1: Touchpad at isa0060/serio1/input0 lost sync at byte 6
Dec 23 12:27:15 shlep kernel: psmouse serio1: Touchpad at isa0060/serio1/input0 - driver resynced.
Dec 23 12:40:28 shlep kernel: psmouse serio1: elantech: PS/2 packet [34 80 80 36 00 00]
Dec 23 12:41:06 shlep kernel: psmouse serio1: Touchpad at isa0060/serio1/input0 lost sync at byte 6
Dec 23 12:41:06 shlep kernel: psmouse serio1: Touchpad at isa0060/serio1/input0 - driver resynced.
Dec 23 12:44:54 shlep kernel: psmouse serio1: Touchpad at isa0060/serio1/input0 lost sync at byte 6
Dec 23 12:44:54 shlep kernel: psmouse serio1: Touchpad at isa0060/serio1/input0 lost sync at byte 6
Dec 23 12:44:54 shlep kernel: psmouse serio1: Touchpad at isa0060/serio1/input0 lost sync at byte 6
Dec 23 12:44:54 shlep kernel: psmouse serio1: Touchpad at isa0060/serio1/input0 lost sync at byte 6
Dec 23 12:44:54 shlep kernel: psmouse serio1: Touchpad at isa0060/serio1/input0 lost sync at byte 6
Dec 23 12:44:54 shlep kernel: psmouse serio1: issuing reconnect request
Dec 23 12:47:47 shlep kernel: psmouse serio1: Touchpad at isa0060/serio1/input0 lost sync at byte 6
Dec 23 12:47:47 shlep kernel: psmouse serio1: Touchpad at isa0060/serio1/input0 - driver resynced.
Dec 23 13:02:48 shlep kernel: psmouse serio1: Touchpad at isa0060/serio1/input0 lost sync at byte 6
Dec 23 13:02:48 shlep kernel: psmouse serio1: Touchpad at isa0060/serio1/input0 - driver resynced.

/proc/input/devices:

I: Bus=0011 Vendor=0002 Product=000e Version=0000
N: Name="ETPS/2 Elantech TrackPoint"
P: Phys=isa0060/serio1/input1
S: Sysfs=/devices/platform/i8042/serio1/input/input8
U: Uniq=
H: Handlers=mouse0 event6 
B: PROP=21
B: EV=7
B: KEY=70000 0 0 0 0
B: REL=3

I: Bus=0011 Vendor=0002 Product=000e Version=0000
N: Name="ETPS/2 Elantech Touchpad"
P: Phys=isa0060/serio1/input0
S: Sysfs=/devices/platform/i8042/serio1/input/input6
U: Uniq=
H: Handlers=mouse1 event7 
B: PROP=5
B: EV=b
B: KEY=e420 10000 0 0 0 0
B: ABS=661800011000003


All the best,
Alex

[1] https://bugzilla.kernel.org/show_bug.cgi?id=209167
