Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 787C5256CC1
	for <lists+linux-input@lfdr.de>; Sun, 30 Aug 2020 10:11:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728685AbgH3ILH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 30 Aug 2020 04:11:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728621AbgH3IKd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 30 Aug 2020 04:10:33 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F7CDC061573
        for <linux-input@vger.kernel.org>; Sun, 30 Aug 2020 01:10:25 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id e17so2555061wme.0
        for <linux-input@vger.kernel.org>; Sun, 30 Aug 2020 01:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=IViE7P9mSzzTYC1GDCHXSUNnU7l4L1m8MMr/le26oqQ=;
        b=Zi2+8CdF13maAIsEhQNpPOiMSqOV9rsiWcTew7+Qdm5Qh6l8tVgCKfT+RQFT33n8tA
         nybH3WwxG6Hkxd9+3B7N3Aiw6HT5mW5PX3JNSq6Q/dFauz6D8IO6fitHzzKSsZ92K+if
         4784pxC54t1mlOR+v6cxKCIBRboZeZ8U0EadUACmEuoLWrs+8ZossoHj7i5SREYOR11T
         16zWyUv13qHtKgKWAit2+KPv0vOsNmYDCZnKOH0Y3i/tC2xs8X1mRm+5rDPNz8kOf0fi
         BW+l59XvKtACnrBull2efv7RLWvuwCqx26wbU8cCD1Fr94emPy8N9hkgaAOVdjFaQv/l
         IYpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=IViE7P9mSzzTYC1GDCHXSUNnU7l4L1m8MMr/le26oqQ=;
        b=RPcak5V1CoCz91gynWd8DD6kONq/XG0vPwnuBmwNLZONSlj8J5q1bkV9u93eRUtaO3
         /2GhMQNARY10hIXpS4QlBmIqCpgLljIA13CSDmUs4+CYHLvBgD5H4PjaodCvK0r0SSGp
         ISIid52aFjbcrvAAcZ559floYJDfoO3uUdKwzK+j6TLQsUBjboB3fg3bx11LnmQF2CB9
         uLZ3HTLevuEdpc3s+c6ANAg/o6KT1LtzVdGJtbaUuf+9pUOUHq3NRCpwtV54XavasNir
         XtjBLNiSKVOf4M2p/S47XLaIhLltZ4kkWCdpto3wlEl8EQpNH75MEC6O7StghTKp+6cT
         Fgcw==
X-Gm-Message-State: AOAM530macInbDE94qHQNz1Wh+8/5oDo44aQzFSYhWduuzJwlk6aOxDR
        c4FoTkAU0EqwothwdkvzPJzJLrHIupnrqw==
X-Google-Smtp-Source: ABdhPJxp1kgEs5jctWMg+a7qUE6FRYaloD+bu6pT4JFTGpS/xJ7JArGbESi5T5ejp6Yt/y1p5DdF5g==
X-Received: by 2002:a1c:dd87:: with SMTP id u129mr6079185wmg.172.1598775022148;
        Sun, 30 Aug 2020 01:10:22 -0700 (PDT)
Received: from [192.168.1.113] ([83.240.60.89])
        by smtp.gmail.com with ESMTPSA id q6sm5993598wmq.19.2020.08.30.01.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 01:10:21 -0700 (PDT)
Message-ID: <1e4e728832dc53439e95753e2ae101526084b3e9.camel@gmail.com>
Subject: logitech-hidpp-device 0003:046D:406F.0006: item fetching failed at
 offset 0/0
From:   Igor Raits <igor.raits@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Sun, 30 Aug 2020 10:10:20 +0200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.37.90 (3.37.90-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Hello,

I've hit some weird issue when upgrading from 5.8 to 5.9-rc2 in Fedora.
My Logitech MX Ergo is not working anymore after update. Moving trackball does not move cursor.

In the logs I see following:

Aug 30 09:44:51 kernel: logitech-hidpp-device: probe of 0003:046D:406F.0006 failed with error -22
Aug 30 09:44:51 kernel: logitech-hidpp-device 0003:046D:406F.0006: hidpp_probe:parse failed
Aug 30 09:44:51 kernel: logitech-hidpp-device 0003:046D:406F.0006: item fetching failed at offset 0/0
Aug 30 09:44:51 kernel: hid-generic: probe of 0003:046D:406F.0006 failed with error -22
Aug 30 09:44:51 kernel: hid-generic 0003:046D:406F.0006: item fetching failed at offset 0/0
Aug 30 09:44:41 kernel: apple 0003:05AC:024F.0005: input,hiddev97,hidraw2: USB HID v1.11 Keyboard [Keytron Keychron K2] on usb-0000:3c:00.0-1.4/input1
Aug 30 09:44:41 kernel: apple 0003:05AC:024F.0004: input,hidraw1: USB HID v1.11 Keyboard [Keytron Keychron K2] on usb-0000:3c:00.0-1.4/input0
Aug 30 09:44:40 kernel: logitech-djreceiver 0003:046D:C52B.0003: hiddev96,hidraw0: USB HID v1.11 Device [Logitech USB Receiver] on usb-0000:3c:00.0-1.1/input2
Aug 30 09:44:39 kernel: hid-generic 0003:046D:C52B.0003: hiddev97,hidraw2: USB HID v1.11 Device [Logitech USB Receiver] on usb-0000:3c:00.0-1.1/input2
Aug 30 09:44:39 kernel: hid-generic 0003:046D:C52B.0002: input,hiddev96,hidraw1: USB HID v1.11 Mouse [Logitech USB Receiver] on usb-0000:3c:00.0-1.1/input1
Aug 30 09:44:39 kernel: hid-generic 0003:046D:C52B.0001: input,hidraw0: USB HID v1.11 Keyboard [Logitech USB Receiver] on usb-0000:3c:00.0-1.1/input0

Looking into the git-log does not show anything suspicious on a first glance in the drivers/hid/. On the working kernel I see:

Aug 30 09:46:08 kernel: apple 0003:05AC:024F.0006: input,hiddev97,hidraw3: USB HID v1.11 Keyboard [Keytron Keychron K2] on usb-0000:3c:00.0-1.4/input1
Aug 30 09:46:08 kernel: apple 0003:05AC:024F.0005: input,hidraw2: USB HID v1.11 Keyboard [Keytron Keychron K2] on usb-0000:3c:00.0-1.4/input0
Aug 30 09:46:08 kernel: logitech-hidpp-device 0003:046D:406F.0004: input,hidraw1: USB HID v1.11 Keyboard [Logitech MX Ergo] on usb-0000:3c:00.0-1.1/input2:1
Aug 30 09:46:07 kernel: logitech-hidpp-device 0003:046D:406F.0004: HID++ 4.5 device connected.
Aug 30 09:46:07 kernel: hid-generic 0003:046D:406F.0004: input,hidraw1: USB HID v1.11 Keyboard [Logitech Wireless Device PID:406f] on usb-0000:3c:00.0-1.1/input2:1
Aug 30 09:46:07 kernel: logitech-djreceiver 0003:046D:C52B.0003: hiddev96,hidraw0: USB HID v1.11 Device [Logitech USB Receiver] on usb-0000:3c:00.0-1.1/input2
Aug 30 09:46:07 kernel: hid-generic 0003:046D:C52B.0003: hiddev97,hidraw2: USB HID v1.11 Device [Logitech USB Receiver] on usb-0000:3c:00.0-1.1/input2
Aug 30 09:46:07 kernel: hid-generic 0003:046D:C52B.0002: input,hiddev96,hidraw1: USB HID v1.11 Mouse [Logitech USB Receiver] on usb-0000:3c:00.0-1.1/input1
Aug 30 09:46:07 kernel: hid-generic 0003:046D:C52B.0001: input,hidraw0: USB HID v1.11 Keyboard [Logitech USB Receiver] on usb-0000:3c:00.0-1.1/input0

Anybody knows what might be the problem? I'll try to revert commits 1 by 1 to see which one could help.
- -- 
Igor Raits <igor.raits@gmail.com>
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEcwgJ58gsbV5f5dMcEV1auJxcHh4FAl9LXuwACgkQEV1auJxc
Hh5XRg/+J9Pn5ZagpBeryDxQUF10+Mf/j0iTmfyDtDcL3upKhWA8HFKsL2ueJpjv
ztp6BT6qFE2aiA5yyH4RL02VnPYdVip3FjesOv+4wp0m6IfDRc60qc4gDo3FxhaV
Dd2YgxrkU7XkoFxNFYIQ1MKI9P04+p9yXtfF/sbjlok705vNDMEYpLOVTZuyljeB
PjoxxBN6mwl/csTr3sDJFvk8oIhMdS2pvw1GSQ+09a6VvxFuDrfEbXxM6TMFUCgY
m5Gi3pCm/R+6cx+OKx9NA+VQPc5MH+wQL7qvwi9FfxIg+oPNdy8NsldGi2F2qGZZ
8bylgWa80Df53UBb1twu/yqf4UY7tfup0C7z+CEIBeRNK4iTuhH1STihe5vNvn0P
yasI+0T7RPTudek8SHpLb9it1grNcUdmkaP7w4tkTNOhkbWdjS5+SOc8Xe2QWiBg
+54pGkdh4eG2+L00WWKx3iQv2ngp78G8y4owdsH//PECU4HW0Xp/9VxzfSW8tFsp
wYStpXM7iJwx9oDGmla/Rk6RN1cPUMTImqbV4RrQPSdxr5TqZiYN/QnI9Pa2yNks
adiIgME2V4PYwJXpGvun/XEX/9fV7QayvxCsflru4oQkrrz3i/SZ+RSxc73y9kxO
MmjV+QYtWOXk/+hoznPLvDREhLNWi0QbQ0rnKxDMp3sPFhEc5zI=
=QyvR
-----END PGP SIGNATURE-----

