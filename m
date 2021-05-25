Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C89038FF1D
	for <lists+linux-input@lfdr.de>; Tue, 25 May 2021 12:30:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232022AbhEYKcJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 25 May 2021 06:32:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231868AbhEYKbe (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 25 May 2021 06:31:34 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ABB3C06138A
        for <linux-input@vger.kernel.org>; Tue, 25 May 2021 03:30:04 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id i23-20020a9d68d70000b02902dc19ed4c15so28185697oto.0
        for <linux-input@vger.kernel.org>; Tue, 25 May 2021 03:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=NwSRp32vJPaeF1dzfAbeX9E+UtV3iyw9ufl2/TFLgHA=;
        b=G06hrLe159l871lGgJRhBuPdtaX71rciYo6APiDcRlTVbQpoxxluUWHAF0Y+rNfgg0
         SUPbsL8vEq6IFHaGhGWjRvcKy02INslLbcRZw7jwhGi6aaBP6fcc7Jp8kLMR6LXQcOqt
         e1Pr3Hzfmu6GC9D/Rw5SxJ8H6KGk1d88+IWRA+OtM+yDWAJ5tIIGMgmYseYqaXzbpDpd
         5qj4Z0q5qqdQwexRHntbz3b3oqmhSELcMWHqHvIHvo3QPiJ5VnlhrYdzy1LpjbWk6VTC
         gtJeqh6ZY5zm1ZVBNVeqX7DfJa/gEira+gTXWYnCzRrmynoJKcHqIqxksKeTHnQvLNax
         Nk/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=NwSRp32vJPaeF1dzfAbeX9E+UtV3iyw9ufl2/TFLgHA=;
        b=Vb7JBingX6mw89Tl9GLiB6C+uxwncKlHags/GZH9F4H6lghtJuFn3917gAogjfIP/i
         X6GFmUUdO4R+dRvA3AP6wX0wSM49FKNtx8gwBPnvlwis3s/vOqrMiFeJM9FGTx+DlPgU
         zwDF/04Wyi794dXJdtguDwHcEHNyDPVdyZuZOgH1a+pSnNYeZVCiOP/91ffClEWyb2+R
         PAWSaysnjehJ3dkz6AQGqZiz9rzNwdZ9CQwApRqXIxzy9R+hTMj2Kvs4uWzsoq6CgVrB
         y8PV3/vOurpGJmrYBO5xcwfJesabVP514hAMxSrOcwpvtbpCWV3DGO791WPw77/L15hz
         Km1A==
X-Gm-Message-State: AOAM533T7E2b9HM2kC1SNXA0CI2XJ804nM3E/NAS8hxzO3ahGTxmPQ5E
        7QgG1T65qvXhpvRGkLVVIrUdfvYmijLUPhAVYs7NiD63DHCCXw==
X-Google-Smtp-Source: ABdhPJwNPS9iyqoAbcO77K2HRJJqEywp2JjtLeExDU38bfdUWMbDhkEfH3/Mu11d+t84GAkylzXfU4UVxCB55m1exZw=
X-Received: by 2002:a9d:8c2:: with SMTP id 60mr23131160otf.217.1621938603864;
 Tue, 25 May 2021 03:30:03 -0700 (PDT)
MIME-Version: 1.0
From:   Max Witte <maxdwit@googlemail.com>
Date:   Tue, 25 May 2021 12:29:52 +0200
Message-ID: <CADG_wDb34oX=oSWhgT0qq6Nmtajh9F9MaDLmfUU0mCX2zLmaSA@mail.gmail.com>
Subject: I2C-HID Quirk touchpad synopsys designware
To:     linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

I've got the hold on a Fujitsu Ultrabook U7411/U7x11 which has some
glitches/quirks with the touchpad that can be fixed with modprobe
i2c-hid. ( Ubuntu 20.04 / 5.8.0-53-generic )

In dmesg I can see this when I modprobe it:
## dmesg
[   34.531333] i2c_hid i2c-0X53 0X59 0X4E 0X50 0X31 0X46 0X31 0X35
0X00:00: supply vdd not found, using dummy regulator
[   34.531357] i2c_hid i2c-0X53 0X59 0X4E 0X50 0X31 0X46 0X31 0X35
0X00:00: supply vddl not found, using dummy regulator
[   34.707167] input: 0X53 0X59 0X4E 0X50 06CB:CE2B Mouse as
/devices/pci0000:00/0000:00:15.3/i2c_designware.2/i2c-3/i2c-0X53 0X59
0X4E 0X50 0X31 0X46 0X31 0X35
0X00:00/0018:06CB:CE2B.0004/input/input16
[   34.707243] input: 0X53 0X59 0X4E 0X50 06CB:CE2B Touchpad as
/devices/pci0000:00/0000:00:15.3/i2c_designware.2/i2c-3/i2c-0X53 0X59
0X4E 0X50 0X31 0X46 0X31 0X35
0X00:00/0018:06CB:CE2B.0004/input/input17
[   34.707305] hid-generic 0018:06CB:CE2B.0004: input,hidraw3: I2C HID
v1.00 Mouse [0X53 0X59 0X4E 0X50 06CB:CE2B] on i2c-0X53 0X59 0X4E 0X50
0X31 0X46 0X31 0X35 0X00:00
[   34.800992] input: 0X53 0X59 0X4E 0X50 06CB:CE2B Mouse as
/devices/pci0000:00/0000:00:15.3/i2c_designware.2/i2c-3/i2c-0X53 0X59
0X4E 0X50 0X31 0X46 0X31 0X35
0X00:00/0018:06CB:CE2B.0004/input/input19
[   34.801200] input: 0X53 0X59 0X4E 0X50 06CB:CE2B Touchpad as
/devices/pci0000:00/0000:00:15.3/i2c_designware.2/i2c-3/i2c-0X53 0X59
0X4E 0X50 0X31 0X46 0X31 0X35
0X00:00/0018:06CB:CE2B.0004/input/input20
[   34.801250] hid-multitouch 0018:06CB:CE2B.0004: input,hidraw3: I2C
HID v1.00 Mouse [0X53 0X59 0X4E 0X50 06CB:CE2B] on i2c-0X53 0X59 0X4E
0X50 0X31 0X46 0X31 0X35 0X00:00

After this it appears in xinput and works:
## xinput:
 Virtual core pointer                          id=2    [master pointer  (3)]
    Virtual core XTEST pointer                id=4    [slave  pointer  (2)]
    Logitech Optical USB Mouse                id=9    [slave  pointer  (2)]
    Generic USB Audio Consumer Control        id=10   [slave  pointer  (2)]
    0X53 0X59 0X4E 0X50 06CB:CE2B Mouse       id=18   [slave  pointer  (2)]
    0X53 0X59 0X4E 0X50 06CB:CE2B Touchpad    id=19   [slave  pointer  (2)]
## i2c-detect:
i2c-2   i2c             Synopsys DesignWare I2C adapter         I2C adapt

## kernel config designware + i2c hid
CONFIG_I2C_DESIGNWARE_CORE=y
CONFIG_I2C_DESIGNWARE_PLATFORM=y
CONFIG_I2C_DESIGNWARE_BAYTRAIL=y
CONFIG_I2C_DESIGNWARE_PCI=m
CONFIG_SPI_DESIGNWARE=m
CONFIG_SND_DESIGNWARE_I2S=m
CONFIG_SND_DESIGNWARE_PCM=y
CONFIG_I2C_HID=m

I already found that this is the Microsoft HID over I2C protocol and
that this has some issues because of the implementation.

Any clues / suggestions to make this work "out of the box" are appreciated.
