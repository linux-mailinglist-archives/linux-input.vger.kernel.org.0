Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7712F206E7D
	for <lists+linux-input@lfdr.de>; Wed, 24 Jun 2020 10:00:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390208AbgFXIAE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 24 Jun 2020 04:00:04 -0400
Received: from ms-10.1blu.de ([178.254.4.101]:36194 "EHLO ms-10.1blu.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390251AbgFXIAE (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 24 Jun 2020 04:00:04 -0400
X-Greylist: delayed 2236 seconds by postgrey-1.27 at vger.kernel.org; Wed, 24 Jun 2020 04:00:03 EDT
Received: from [78.43.71.214] (helo=marius.fritz.box)
        by ms-10.1blu.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <mail@mariuszachmann.de>)
        id 1jnzjw-0000VK-Jk; Wed, 24 Jun 2020 09:22:36 +0200
From:   Marius Zachmann <mail@mariuszachmann.de>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Marius Zachmann <mail@mariuszachmann.de>,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [PATCH v4 0/3] hwmon: Add Corsair Commander Pro driver
Date:   Wed, 24 Jun 2020 09:21:51 +0200
Message-Id: <20200624072154.22486-1-mail@mariuszachmann.de>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Con-Id: 241080
X-Con-U: 0-mail
X-Originating-IP: 78.43.71.214
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This is v4 of a driver for the Corsair Commander Pro.
It provides sysfs attributes for:
- Reading fan speed
- Reading temp sensors
- Reading voltage values
- Writing pwm and reading last written pwm
- Reading fan and temp connection status

It is an usb driver, so it needs to be ignored by usbhid. (patch 3/3)
This is based on the staging/hwmon tree.

Signed-off-by: Marius Zachmann <mail@mariuszachmann.de>
---

Changes from v3
- add device ids to hid_ignore_list in hid-quirks.h
- removed unused update_interval
- ccp_disconnect is static

Changes from v2
- add corsair-cpro to Documentation/hwmon/index.rst
- add SPDX license identifier to corsair-cpro.rst
- remove fanX_enable from Documentation and driver
- changed comment style
- clarified protocol in comments
- add get_temp_cnct for reading temperature sensor
  connection status
- added temp_cnct and temp_label in ccp_device
- added tempX_label, showing connection status
- renamed get_fan_mode_label to get_fan_cnct
- get_temp_cnct and get_fan_cnct only called in probe
- send_usb_cmd checks errors in the device response
- send_usb_cmd clears the buffer and sets the
  command
- inlined get_fan_rpm and get_voltage and removed
  functions
- more reverse christmas tree


Marius Zachmann (3):
  input: add to hid_ignore_list
  add Documentation
  add driver

 Documentation/hwmon/corsair-cpro.rst |  40 +++
 Documentation/hwmon/index.rst        |   1 +
 MAINTAINERS                          |   6 +
 drivers/hid/hid-quirks.c             |   2 +
 drivers/hwmon/Kconfig                |  10 +
 drivers/hwmon/Makefile               |   1 +
 drivers/hwmon/corsair-cpro.c         | 489 +++++++++++++++++++++++++++
 7 files changed, 549 insertions(+)
 create mode 100644 Documentation/hwmon/corsair-cpro.rst
 create mode 100644 drivers/hwmon/corsair-cpro.c

--
2.27.0
