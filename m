Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDF4043C75E
	for <lists+linux-input@lfdr.de>; Wed, 27 Oct 2021 12:10:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239498AbhJ0KNU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Oct 2021 06:13:20 -0400
Received: from 82-65-109-163.subs.proxad.net ([82.65.109.163]:50188 "EHLO
        luna.linkmauve.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241014AbhJ0KNP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Oct 2021 06:13:15 -0400
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
        id F3118F40C9C; Wed, 27 Oct 2021 12:10:45 +0200 (CEST)
From:   Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
        linux-input@vger.kernel.org, Ash Logan <ash@heyquark.com>,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org,
        "Daniel J . Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v5 0/5] HID: nintendo: Add support for the Wii U gamepad
Date:   Wed, 27 Oct 2021 12:10:38 +0200
Message-Id: <20211027101043.31609-1-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211019110418.26874-1-linkmauve@linkmauve.fr>
References: <20211019110418.26874-1-linkmauve@linkmauve.fr>
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

Changes since v2:
- Guard against the possibility of CONFIG_HID_BATTERY_STRENGTH not
  having been selected.
- Include forgotten linux/fixp-arith.h header.
- Fix a warning in clamp() due to comparing a s16 with a #define.

Changes since v3:
- Rebased on top of hid.git#for-5.16/nintendo.
- Merged into hid-nintendo.
- Make hid-nintendo mostly a stub, with sub-drivers implementing the
  actual controllers.
- Introduced CONFIG_HID_NINTENDO_WIIU to enable support for this device
  now.

Changes since v4:
- Fix warnings when no sub-driver has been selected (thanks Intel CI!).
- Default Switch sub-driver to y and Wii U sub-driver to n, as the
  latter is mostly only useful on an actual console and that won’t be
  the common case when using hid-nintendo.

Ash Logan (1):
  HID: nintendo: drc: add support for the Wii U gamepad

Emmanuel Gil Peyrot (4):
  HID: nintendo: split switch support into its own file
  HID: nintendo: drc: implement touch reports
  HID: nintendo: drc: add accelerometer, gyroscope and magnetometer
    readings
  HID: nintendo: drc: add battery reporting

 drivers/hid/Kconfig                           |   33 +-
 drivers/hid/Makefile                          |    2 +
 drivers/hid/hid-ids.h                         |    1 +
 .../{hid-nintendo.c => hid-nintendo-switch.c} |   43 +-
 drivers/hid/hid-nintendo-wiiu.c               |  550 ++++
 drivers/hid/hid-nintendo.c                    | 2304 +----------------
 drivers/hid/hid-nintendo.h                    |   22 +
 drivers/hid/hid-quirks.c                      |    3 +
 8 files changed, 650 insertions(+), 2308 deletions(-)
 copy drivers/hid/{hid-nintendo.c => hid-nintendo-switch.c} (98%)
 create mode 100644 drivers/hid/hid-nintendo-wiiu.c
 create mode 100644 drivers/hid/hid-nintendo.h

-- 
2.33.1

