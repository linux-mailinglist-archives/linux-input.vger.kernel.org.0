Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B30B142F662
	for <lists+linux-input@lfdr.de>; Fri, 15 Oct 2021 16:54:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234957AbhJOO45 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 Oct 2021 10:56:57 -0400
Received: from mx.xn--bimann-cta.de ([185.207.104.210]:26753 "EHLO
        mx.xn--bimann-cta.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231208AbhJOO44 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 Oct 2021 10:56:56 -0400
X-Greylist: delayed 453 seconds by postgrey-1.27 at vger.kernel.org; Fri, 15 Oct 2021 10:56:56 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=dkim; bh=rFw73gDVBopjdRC
        rdmzL3tnW6TmDhLG7yC3ItHuXa88=; h=subject:cc:to:from:date;
        d=xn--bimann-cta.de; b=kHH2UuHhvansvN5QvYeFt0s91VnyjmHgT5DFocr2LHDK4Un
        55VAXAphpp9yCBg6ChtsoDNHW6L5aTiSvLx8TcgqhGWzWLsbDzhgWYHveo2tHxe1cOr2Lb
        vGPefP/afs7GhGMBU2oCyME7El/Taz5LBrsrL+lU4ShuqY8pRk0cqU=
Received: from kallisto.localdomain (p5084cf21.dip0.t-ipconnect.de [80.132.207.33])
        by mx.xn--bimann-cta.de (OpenSMTPD) with ESMTPSA id 73bf7a1d (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO);
        Fri, 15 Oct 2021 16:47:16 +0200 (CEST)
Date:   Fri, 15 Oct 2021 16:47:14 +0200
From:   naib@xn--bimann-cta.de
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: I2C MSFT0001 (04F3:3072) touchpad is not recognized / registered
Message-ID: <20211015144714.lvp7vz7lmeku2jpj@kallisto.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

since I've upgraded my BIOS to a recent version, the touchpad on my laptop isn't recognized anymore. I suspect that Lenovo did change some id or specifier, that causes the touchpad to be thrown in the wrong driver category.

I am using kernel 5.15.0-rc4 on Archlinux. My hardware is Lenovo Ideapad Flex 3 11ADA05. The touchpad is from ELAN/MSFT00001? (04F3:3072). Before the mentioned BIOS upgrade, the touchpad was working with the default Archlinux kernel. Also it is currently functional while running a Windows OS. I have an old log output from dmesg [1]. I tried the following things to troubleshoot this issue:
- Boot without hid_multitouch, hid_elants, i2c_hid, i2c_hid_acpi
- Boot with CONFIG_MOUSE_ELAN_I2C & co.
- Boot with blacklisting init calls and modules (see links below)
- Tinker with i2cdetect (nothing valuable)

The touchscreen is at AMDI0010:00, the touchpad is at AMDI0010:01. While collecting i2c debug messages, I've found out that the client on the adapter does not register. The touchscreen is registering successfully, even when the corresponding multitouch drivers are missing (hid-multitouch, hid-elants). (Bare with me, since I'm just guessing things)
# The touchscreen (ok):
i2c_designware AMDI0010:00: using lookup tables for GPIO lookup
i2c_designware AMDI0010:00: No GPIO consumer scl found
i2c i2c-0: adapter [Synopsys DesignWare I2C adapter] registered
i2c i2c-0: client [ELAN238E:00] registered with bus id i2c-ELAN238E:00
# The touchpad (not ok):
i2c_designware AMDI0010:01: using lookup tables for GPIO lookup
i2c_designware AMDI0010:01: No GPIO consumer scl found
i2c i2c-1: adapter [Synopsys DesignWare I2C adapter] registered

Maybe the wrong driver is selected? Excerpt from hwinfo:
P: /devices/platform/AMDI0010:01
L: 0
E: DEVPATH=/devices/platform/AMDI0010:01
E: SUBSYSTEM=platform
E: DRIVER=i2c_designware
E: MODALIAS=acpi:AMDI0010:
E: USEC_INITIALIZED=10263200
E: ID_VENDOR_FROM_DATABASE=Amdek Corporation
E: ID_PATH=platform-AMDI0010:01
E: ID_PATH_TAG=platform-AMDI0010_01

P: /devices/platform/AMDI0010:01/MSFT0001:00
L: 0
E: DEVPATH=/devices/platform/AMDI0010:01/MSFT0001:00
E: SUBSYSTEM=platform
E: MODALIAS=acpi:MSFT0001:PNP0C50:
E: USEC_INITIALIZED=10266881
E: ID_VENDOR_FROM_DATABASE=M-Systems Flash Disk Pioneers
E: ID_PATH=platform-MSFT0001:00
E: ID_PATH_TAG=platform-MSFT0001_00

P: /devices/platform/AMDI0010:01/i2c-1
L: 0
E: DEVPATH=/devices/platform/AMDI0010:01/i2c-1
E: SUBSYSTEM=i2c

Similiar bugs and resources:
https://bugzilla.kernel.org/show_bug.cgi?id=207759
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1861610/+index
https://patchwork.kernel.org/project/linux-input/patch/20180405132537.3218-7-benjamin.tissoires@redhat.com/
https://lore.kernel.org/linux-input/000201d5a8bd$9fead3f0$dfc07bd0$@emc.com.tw/

I'll also attach my current running config [2], a current dmesg [3], a current hwinfo [4] and also an acpidump [5], since it was wished for at other similiar bugs.

[1] https://op.xn--bimann-cta.de/bug/2021-09-19_journalctl.txt
[2] https://op.xn--bimann-cta.de/bug/running_config.txt
[3] https://op.xn--bimann-cta.de/bug/2021-10-15_dmesg.txt
[4] https://op.xn--bimann-cta.de/bug/hwinfo.txt
[5] https://op.xn--bimann-cta.de/bug/acpidump.lenovo-Ideapad-Flex-3-11ADA05.txt

Best,
Fabian
