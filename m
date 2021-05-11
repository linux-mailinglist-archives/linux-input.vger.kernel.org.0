Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56A9437B001
	for <lists+linux-input@lfdr.de>; Tue, 11 May 2021 22:16:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229932AbhEKURV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 May 2021 16:17:21 -0400
Received: from 82-65-109-163.subs.proxad.net ([82.65.109.163]:37924 "EHLO
        luna.linkmauve.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbhEKURU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 May 2021 16:17:20 -0400
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
        id BBD33F40638; Tue, 11 May 2021 22:16:08 +0200 (CEST)
From:   Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
To:     linux-input@vger.kernel.org
Cc:     Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
        Ash Logan <ash@heyquark.com>,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] HID: wiiu-drc: Add a driver for the Wii U gamepad
Date:   Tue, 11 May 2021 22:16:00 +0200
Message-Id: <20210511201604.23204-1-linkmauve@linkmauve.fr>
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

[1] https://gitlab.com/linux-wiiu/linux-wiiu

Changes since v1:
- Rename interfaces to be less redundant.
- Add comments for potentially unclear things.
- Reword some commits to include more needed information.
- Include all needed includes.
- Use helpful helper functions instead of (badly) reimplementing them
  myself.
- Always return the correct type for each function, to avoid some
  bool/int confusion, or returning 0 to mean error.
- Use myself as the module author, even though Ash did most of the
  initial work, I’m the one who will be maintaining this module from now
  on.
- Use input_set_capability() instead of set_bit(…, keybit) to also set
  BIT(EV_KEY) on evbit[0].
- Call hid_hw_start() before input_register_device() but after the setup
  functions, so that hid_hw_open() is never called before it.
- Add missing spin_lock_init() for the battery lock.
- Use a static atomic for the drc_num, and remove the comment about
  using the interface number.
- Interpret battery report as the voltage coming from an ADC, instead of
  the completely wrong ENERGY_NOW it was before.

So basically addressing Jonathan’s and Barnabás’ comments. :)

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
 drivers/hid/hid-wiiu-drc.c | 551 +++++++++++++++++++++++++++++++++++++
 5 files changed, 563 insertions(+)
 create mode 100644 drivers/hid/hid-wiiu-drc.c

-- 
2.31.1

