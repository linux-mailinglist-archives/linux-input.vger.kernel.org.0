Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B899370FE5
	for <lists+linux-input@lfdr.de>; Mon,  3 May 2021 01:38:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232367AbhEBXjF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 2 May 2021 19:39:05 -0400
Received: from 82-65-109-163.subs.proxad.net ([82.65.109.163]:55110 "EHLO
        luna.linkmauve.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232341AbhEBXjD (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 2 May 2021 19:39:03 -0400
X-Greylist: delayed 550 seconds by postgrey-1.27 at vger.kernel.org; Sun, 02 May 2021 19:39:03 EDT
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
        id 7ECDAF405BD; Mon,  3 May 2021 01:28:55 +0200 (CEST)
From:   Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
To:     linux-input@vger.kernel.org
Cc:     Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
        Ash Logan <ash@heyquark.com>,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] RFC: HID: wiiu-drc: Add a driver for the Wii U gamepad
Date:   Mon,  3 May 2021 01:28:31 +0200
Message-Id: <20210502232836.26134-1-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This driver is for the DRC (wireless gamepad) when plugged to the DRH of
the Wii U, a chip exposing it as a USB device.

I tried to use this driver on master over usbip on my laptop, but usbip
disconnects the device right after the driver created the
/dev/input/event* files, so instead I have only tested this driver on
the 4.19 branch of the linux-wiiu[1] downstream.

Other than that, pretty much all of the HID parts of the gamepad work,
it’s only missing microphone, camera and NFC input now but those are
mostly standard (read require quirks) and pertain to other subsystems,
so I felt like this can be upstreamed already.

I’ve still put the RFC tag on this pull request because of two known
problems in these patches (annotated with TODOs in the code):
- The magnetometer is exposed using non-sensical ABS_* values, it seems
  most (all?) magnetometers are exposed in the iio subsystem instead,
  should I go the same way despite it clearly being part of the same HID
  device?
- The battery number is currently based on a static int being
  incremented every time a new gamepad is “plugged in”, while I’d prefer
  to reuse the interface number for that.

Thanks for your guidance. :)

[1] https://gitlab.com/linux-wiiu/linux-wiiu

Ash Logan (1):
  HID: wiiu-drc: Add a driver for this gamepad

Emmanuel Gil Peyrot (3):
  HID: wiiu-drc: Implement touch reports
  HID: wiiu-drc: Add accelerometer, gyroscope and magnetometer readings
  HID: wiiu-drc: Add battery reporting

 drivers/hid/Kconfig        |   7 +
 drivers/hid/Makefile       |   1 +
 drivers/hid/hid-ids.h      |   1 +
 drivers/hid/hid-quirks.c   |   3 +
 drivers/hid/hid-wiiu-drc.c | 522 +++++++++++++++++++++++++++++++++++++
 5 files changed, 534 insertions(+)
 create mode 100644 drivers/hid/hid-wiiu-drc.c

-- 
2.31.1

