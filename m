Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0FDF38C466
	for <lists+linux-input@lfdr.de>; Fri, 21 May 2021 12:09:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231687AbhEUKLR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 May 2021 06:11:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232281AbhEUKLQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 May 2021 06:11:16 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07A21C061574
        for <linux-input@vger.kernel.org>; Fri, 21 May 2021 03:09:53 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id o127so10809667wmo.4
        for <linux-input@vger.kernel.org>; Fri, 21 May 2021 03:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding:thread-index:content-language;
        bh=S1NXafE3uy10Oi97PDfWbvKj6LJv5EkPDGSbFXUSjko=;
        b=UOrXKjmBBKhmP9gio6Ktp83EIIBUg5k7Vk6/P24zHP6ya7F5b+sWzcP+HBdYJ0fEFc
         odG4t6lvZPnFlhrR7LD57zSWQE0KWwPgI/AGpnqlKRGlyH2Z0FzjOfj2MPJGErRHJKjS
         o+jvguey3M5ky+dxuM1jRlFiWxny26Jwz7ty3HAIAxghj32gB6EUhpZqKhl04uN6dE0w
         Iiur0KzwVjcJvR3NR3lI4unPu3XTkmoUr/GPaHgm6k46NniEhxUvTRrtEveBAKH+hWJs
         HwQrgwnmPZGlWKePgHFHR1NHzdPnxig7lKeZgPvZhoRDbQrL9fgBYi8+jHBiU0HpFTTy
         QP4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding:thread-index:content-language;
        bh=S1NXafE3uy10Oi97PDfWbvKj6LJv5EkPDGSbFXUSjko=;
        b=p9Xsunj8D4crR5i/Tapy/ttRMk7Yp1oOXxHrqE/OGxl1M0MhJwkpkRJVF94PqXMd9P
         LHgpYdiVH38Ki5X1/46MrtKgjRQSVDDw0m8Ye6F0MbFwzzY4QOnduMjhf1yZH28xVYtz
         /47AawJ3qrV9TRkExZoEPYiZvNS/DwZ59z3e3qkjzO7GQAHqCdn6mKuL84lFtdyfFPGS
         o7xnCaQ1H23WjhFqZj9MN5JL7D5jVIok57lMczEy92mARQoO+QZy1LNoEJO3yj1su4sP
         XISrF8O0N7kXqgBnPMcZTL1mKIi6KfBPpaG2ljV4nRorQWboOXG1Zwb4Oixm33GvYjRS
         aArw==
X-Gm-Message-State: AOAM532mmk1huaTsEU5ic20+Zj7pu9iUZogPgxepcwUs5ZkQ5b/42tkz
        FhOEbnuxxA1Ji8Ct8u4oecLpVD1G+zSIgA==
X-Google-Smtp-Source: ABdhPJwl9D8JaAnJ91gxh+X/+yOLfp84qr8wxei88rZPLcVPI1NKxvBaTf6UE+E1dvvCtr1ZP81+Dg==
X-Received: by 2002:a05:600c:19c8:: with SMTP id u8mr8436238wmq.50.1621591791637;
        Fri, 21 May 2021 03:09:51 -0700 (PDT)
Received: from DIABLO (p4ff03a2a.dip0.t-ipconnect.de. [79.240.58.42])
        by smtp.gmail.com with ESMTPSA id a11sm1461173wrx.38.2021.05.21.03.09.51
        for <linux-input@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 03:09:51 -0700 (PDT)
From:   "Max d'Wit" <maxdwit@googlemail.com>
To:     <linux-input@vger.kernel.org>
Subject: I2C-HID Quirk touchpad synopsys designware
Date:   Fri, 21 May 2021 12:09:49 +0200
Message-ID: <001c01d74e29$6f6cdcb0$4e469610$@com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AddOKW7U+fsIC8uSTqGs5Eb+1rSYgw==
Content-Language: de
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

I2C-HID Quirk touchpad synopsys designware
I've got the hold on a Fujitsu Ultrabook U7411/U7x11 which has some =
glitches/quirks with the touchpad that can be fixed with modprobe =
i2c-hid. ( Ubuntu 20.04 / 5.8.0-53-generic )

In dmesg I can see this when I modprobe it:
## dmesg
[   34.531333] i2c_hid i2c-0X53 0X59 0X4E 0X50 0X31 0X46 0X31 0X35 =
0X00:00: supply vdd not found, using dummy regulator
[   34.531357] i2c_hid i2c-0X53 0X59 0X4E 0X50 0X31 0X46 0X31 0X35 =
0X00:00: supply vddl not found, using dummy regulator
[   34.707167] input: 0X53 0X59 0X4E 0X50 06CB:CE2B Mouse as =
/devices/pci0000:00/0000:00:15.3/i2c_designware.2/i2c-3/i2c-0X53 0X59 =
0X4E 0X50 0X31 0X46 0X31 0X35 0X00:00/0018:06CB:CE2B.0004/input/input16
[   34.707243] input: 0X53 0X59 0X4E 0X50 06CB:CE2B Touchpad as =
/devices/pci0000:00/0000:00:15.3/i2c_designware.2/i2c-3/i2c-0X53 0X59 =
0X4E 0X50 0X31 0X46 0X31 0X35 0X00:00/0018:06CB:CE2B.0004/input/input17
[   34.707305] hid-generic 0018:06CB:CE2B.0004: input,hidraw3: I2C HID =
v1.00 Mouse [0X53 0X59 0X4E 0X50 06CB:CE2B] on i2c-0X53 0X59 0X4E 0X50 =
0X31 0X46 0X31 0X35 0X00:00
[   34.800992] input: 0X53 0X59 0X4E 0X50 06CB:CE2B Mouse as =
/devices/pci0000:00/0000:00:15.3/i2c_designware.2/i2c-3/i2c-0X53 0X59 =
0X4E 0X50 0X31 0X46 0X31 0X35 0X00:00/0018:06CB:CE2B.0004/input/input19
[   34.801200] input: 0X53 0X59 0X4E 0X50 06CB:CE2B Touchpad as =
/devices/pci0000:00/0000:00:15.3/i2c_designware.2/i2c-3/i2c-0X53 0X59 =
0X4E 0X50 0X31 0X46 0X31 0X35 0X00:00/0018:06CB:CE2B.0004/input/input20
[   34.801250] hid-multitouch 0018:06CB:CE2B.0004: input,hidraw3: I2C =
HID v1.00 Mouse [0X53 0X59 0X4E 0X50 06CB:CE2B] on i2c-0X53 0X59 0X4E =
0X50 0X31 0X46 0X31 0X35 0X00:00

After this it appears in xinput and works:
## xinput:
 Virtual core pointer                          id=3D2    [master pointer =
 (3)]
    Virtual core XTEST pointer                id=3D4    [slave  pointer  =
(2)]
    Logitech Optical USB Mouse                id=3D9    [slave  pointer  =
(2)]
    Generic USB Audio Consumer Control        id=3D10   [slave  pointer  =
(2)]
    0X53 0X59 0X4E 0X50 06CB:CE2B Mouse       id=3D18   [slave  pointer  =
(2)]
    0X53 0X59 0X4E 0X50 06CB:CE2B Touchpad    id=3D19   [slave  pointer  =
(2)]
## i2c-detect:
i2c-2   i2c             Synopsys DesignWare I2C adapter         I2C =
adapt

## kernel config designware + i2c hid
CONFIG_I2C_DESIGNWARE_CORE=3Dy
CONFIG_I2C_DESIGNWARE_PLATFORM=3Dy
CONFIG_I2C_DESIGNWARE_BAYTRAIL=3Dy
CONFIG_I2C_DESIGNWARE_PCI=3Dm
CONFIG_SPI_DESIGNWARE=3Dm
CONFIG_SND_DESIGNWARE_I2S=3Dm
CONFIG_SND_DESIGNWARE_PCM=3Dy
CONFIG_I2C_HID=3Dm

I already found that this is the Microsoft HID over I2C protocol and =
that this has some issues because of the implementation.

Any clues / suggestions to make this work "out of the box" are =
appreciated.

