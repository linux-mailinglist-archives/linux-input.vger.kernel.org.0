Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6981F47B63B
	for <lists+linux-input@lfdr.de>; Tue, 21 Dec 2021 00:43:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232738AbhLTXny (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 Dec 2021 18:43:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbhLTXny (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 Dec 2021 18:43:54 -0500
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D21FCC061574
        for <linux-input@vger.kernel.org>; Mon, 20 Dec 2021 15:43:53 -0800 (PST)
Received: by mail-il1-x12c.google.com with SMTP id b1so2973332ilj.2
        for <linux-input@vger.kernel.org>; Mon, 20 Dec 2021 15:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fuk981h/JwwEukQqDrCN6TplRzzxHwXHU9q0PW9TWTk=;
        b=dWk7p4U08pJPiiQP0oNJbOkWyEyHAxtUf5F4QJpOfJ5PfPeYq6GiCWyD5Ms2VfG+Hy
         ggCUx95jYjNxqTP1+wXlwgZU0GZ/eXhMn5r623ebWGkGFDVU6i1Z754ZZK8fLw+KvsQ6
         w2/taL96V+Zte8O2jlUvUslpet7EzrMlDrkDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fuk981h/JwwEukQqDrCN6TplRzzxHwXHU9q0PW9TWTk=;
        b=u/gZDncbM6wZUwmYgfb0bA+OcVrDW4lM9UhbA1iJAyeuCs/w0kuSDKqNhTjntCd1Pa
         /NgGsk7LnB0mNJfWRf6cOW9jiEUirrR/fpo5qa3ZBgyED5l2QWRX1h/aH7C4fdu5HoFK
         d2dD5wUEDpG8xQFmwI2pPsXp46rWrSQJK0Xp7tRFYyQ0FC9t/mqX+Lx+Drx1Z0jBdMC7
         4FBiwnKUToLWSjLWjZrNBk6BbKT+lUwT51cDxZYPG1sZFgxqxrU32t/ATlsE1I2smV6B
         dCHhjSwQnt4Z96Qo5GnW4UnHbJQzSltOjpseedVqtR1lN8CgyyNILd7dI5hJcIREis6Q
         gGug==
X-Gm-Message-State: AOAM530hc+iYkl57PTsPAk9j5gbklFs/LSFQ73SC3mA1t4/4jarx4qu/
        JF7Ypl4Mg8Eddold1M5BoscJwA==
X-Google-Smtp-Source: ABdhPJwIAhanF5Z6e4QFvcKdv/Wjg/7UG9n/TCqU4Ce+9fWTbvdl1BF1NCFN7wij20S22nHqJ8leMg==
X-Received: by 2002:a05:6e02:1529:: with SMTP id i9mr220230ilu.6.1640043832892;
        Mon, 20 Dec 2021 15:43:52 -0800 (PST)
Received: from rrangel920.bld.corp.google.com (h24-56-189-219.arvdco.broadband.dynamic.tds.net. [24.56.189.219])
        by smtp.gmail.com with ESMTPSA id k19sm4077521ilr.34.2021.12.20.15.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 15:43:52 -0800 (PST)
From:   Raul E Rangel <rrangel@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     mario.limonciello@amd.com, linux-input@vger.kernel.org,
        dianders@chromium.org, Raul E Rangel <rrangel@chromium.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Benson Leung <bleung@chromium.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Gwendal Grignou <gwendal@chromium.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        Prashant Malani <pmalani@chromium.org>,
        "jingle.wu" <jingle.wu@emc.com.tw>
Subject: [PATCH 0/3] Fix spurious wakes on ACPI platforms
Date:   Mon, 20 Dec 2021 16:43:43 -0700
Message-Id: <20211220234346.2798027-1-rrangel@chromium.org>
X-Mailer: git-send-email 2.34.1.307.g9b7440fafd-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

d62bd5ce12d7 ("pinctrl: amd: Implement irq_set_wake") gave the kernel
the ability to control the GPIO wake bit on AMD platforms. This
uncovered various drivers that were manually managing their wake
capabilities. This is problematic on ACPI systems because the ACPI
subsystem is responsible for managing the wake capabilities for the
device. ACPI devices need to define the `_PRW` property that defines the
GPE or GPIO that will be used to wake the system, and also the power
resources that must be enabled for the device to issue a wake.

The following real world example shows the problem:
* We have an ACPI HID device that has a power resource defined in `_PR0`
  and `_PR3`. It doesn't have `_PRW` so that means the device can't wake
  the system.
* The IRQ line is active level low for this device and is pulled up by the
  power resource defined in `_PR0`/`_PR3`.

The i2c-hid driver manually sets the device as wake capable, and the wake
flag gets set on the IRQ GPIO when entering suspend. As part of suspend,
ACPI will turn off the devices power resources since the device isn't a
wake source. This immediately triggers a wake because the IRQ line is
now low.

For devices that are marked as being wake capable (via `_PRW`), they
might use GPEs for wakes, while others might use the GPIO controller
(via _AEI). We need to respect the firmware configuration so we don't
have both the GPE and GPIO triggering a wake.

So when using ACPI, the correct thing to do is remove the driver from
managing the wake configuration. The ACPI subsystem has more knowledge of
the platform topology than the driver does.

This patch series fixes a few drivers that I noticed were incorrectly
setting the GPIO wake bit on my Guybrush Chromebook. I'm sure there will
be more.

I will be OOO until the New Year, so my responses will be delayed.


Raul E Rangel (3):
  HID: i2c-hid-acpi: Remove explicit device_set_wakeup_capable
  Input: elan_i2c - Use PM subsystem to manage wake irq
  platform/chrome: cros_ec: Don't enable wake pin if ACPI managed

 drivers/hid/i2c-hid/i2c-hid-acpi.c          |  5 -----
 drivers/input/mouse/elan_i2c_core.c         | 21 +++++++--------------
 drivers/platform/chrome/cros_ec.c           |  8 ++++++--
 include/linux/platform_data/cros_ec_proto.h |  1 -
 4 files changed, 13 insertions(+), 22 deletions(-)

-- 
2.34.1.307.g9b7440fafd-goog

