Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26B361D7886
	for <lists+linux-input@lfdr.de>; Mon, 18 May 2020 14:24:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726828AbgERMYx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 May 2020 08:24:53 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:59111 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726739AbgERMYx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 May 2020 08:24:53 -0400
Received: from 61-220-137-37.hinet-ip.hinet.net ([61.220.137.37] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1jaep4-00038N-AL; Mon, 18 May 2020 12:24:47 +0000
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Daniel Playfair Cal <daniel.playfair.cal@gmail.com>,
        HungNien Chen <hn.chen@weidahitech.com>,
        You-Sheng Yang <vicamo.yang@canonical.com>,
        Pavel Balan <admin@kryma.net>,
        linux-input@vger.kernel.org (open list:HID CORE LAYER),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] HID: i2c-hid: Enable touchpad wakeup from Suspend-to-Idle
Date:   Mon, 18 May 2020 20:24:40 +0800
Message-Id: <20200518122442.1939-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Many laptops have the ability to be woken up from Suspend-to-Idle by
touchpad. This is also the default behavior on other OSes.

So let's enable the wakeup support if the system defaults to use
Suspend-to-Idle.

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
v2:
 - Fix compile error when ACPI is not enabled.

 drivers/hid/i2c-hid/i2c-hid-core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 294c84e136d7..e6caef006cd3 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -931,6 +931,14 @@ static void i2c_hid_acpi_fix_up_power(struct device *dev)
 		acpi_device_fix_up_power(adev);
 }
 
+static void i2c_hid_acpi_enable_wakeup(struct device *dev)
+{
+	if (acpi_gbl_FADT.flags & ACPI_FADT_LOW_POWER_S0) {
+		device_set_wakeup_capable(dev, true);
+		device_wakeup_enable(dev);
+	}
+}
+
 static const struct acpi_device_id i2c_hid_acpi_match[] = {
 	{"ACPI0C50", 0 },
 	{"PNP0C50", 0 },
@@ -945,6 +953,8 @@ static inline int i2c_hid_acpi_pdata(struct i2c_client *client,
 }
 
 static inline void i2c_hid_acpi_fix_up_power(struct device *dev) {}
+
+static inline void i2c_hid_acpi_enable_wakeup(struct device *dev) {}
 #endif
 
 #ifdef CONFIG_OF
@@ -1072,6 +1082,8 @@ static int i2c_hid_probe(struct i2c_client *client,
 
 	i2c_hid_acpi_fix_up_power(&client->dev);
 
+	i2c_hid_acpi_enable_wakeup(&client->dev);
+
 	device_enable_async_suspend(&client->dev);
 
 	/* Make sure there is something at this address */
-- 
2.17.1

