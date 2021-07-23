Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DE923D34BC
	for <lists+linux-input@lfdr.de>; Fri, 23 Jul 2021 08:35:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233947AbhGWFyh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Jul 2021 01:54:37 -0400
Received: from h2.fbrelay.privateemail.com ([131.153.2.43]:40822 "EHLO
        h2.fbrelay.privateemail.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229839AbhGWFyh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Jul 2021 01:54:37 -0400
X-Greylist: delayed 633 seconds by postgrey-1.27 at vger.kernel.org; Fri, 23 Jul 2021 01:54:37 EDT
Received: from MTA-15-3.privateemail.com (MTA-15-1.privateemail.com [198.54.118.208])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by h1.fbrelay.privateemail.com (Postfix) with ESMTPS id 160B28081A;
        Fri, 23 Jul 2021 02:24:37 -0400 (EDT)
Received: from mta-15.privateemail.com (localhost [127.0.0.1])
        by mta-15.privateemail.com (Postfix) with ESMTP id D6BB4180009F;
        Fri, 23 Jul 2021 02:24:35 -0400 (EDT)
Received: from hal-station.. (unknown [10.20.151.214])
        by mta-15.privateemail.com (Postfix) with ESMTPA id 105CB18000A3;
        Fri, 23 Jul 2021 02:24:34 -0400 (EDT)
From:   Hamza Mahfooz <someguy@effective-light.com>
To:     linux-kernel@vger.kernel.org
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, Bastien Nocera <hadess@hadess.net>,
        =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
        Hamza Mahfooz <someguy@effective-light.com>
Subject: [PATCH] HID: logitech-hidpp: battery: provide CAPACITY property for newer devices
Date:   Fri, 23 Jul 2021 02:23:46 -0400
Message-Id: <20210723062346.86259-1-someguy@effective-light.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

For devices that only support the BATTERY_VOLTAGE (0x1001) feature, UPower
requires the additional information provided by this patch, to set them up.

Signed-off-by: Hamza Mahfooz <someguy@effective-light.com>
---
 drivers/hid/hid-logitech-hidpp.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 61635e629469..662c335e9c17 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -1331,6 +1331,32 @@ static int hidpp20_battery_get_battery_voltage(struct hidpp_device *hidpp,
 	return 0;
 }
 
+static int hidpp20_map_battery_capacity(int voltage)
+{
+	static const int voltages[] = {
+		4186, 4156, 4143, 4133, 4122, 4113, 4103, 4094, 4086, 4075,
+		4067, 4059, 4051, 4043, 4035, 4027, 4019, 4011, 4003, 3997,
+		3989, 3983, 3976, 3969, 3961, 3955, 3949, 3942, 3935, 3929,
+		3922, 3916, 3909, 3902, 3896, 3890, 3883, 3877, 3870, 3865,
+		3859, 3853, 3848, 3842, 3837, 3833, 3828, 3824, 3819, 3815,
+		3811, 3808, 3804, 3800, 3797, 3793, 3790, 3787, 3784, 3781,
+		3778, 3775, 3772, 3770, 3767, 3764, 3762, 3759, 3757, 3754,
+		3751, 3748, 3744, 3741, 3737, 3734, 3730, 3726, 3724, 3720,
+		3717, 3714, 3710, 3706, 3702, 3697, 3693, 3688, 3683, 3677,
+		3671, 3666, 3662, 3658, 3654, 3646, 3633, 3612, 3579, 3537,
+		3500
+	};
+
+	int i;
+
+	for (i = 0; i < (sizeof(voltages) / sizeof(int)); i++) {
+		if (voltage >= voltages[i])
+			return 100 - i;
+	}
+
+	return 0;
+}
+
 static int hidpp20_query_battery_voltage_info(struct hidpp_device *hidpp)
 {
 	u8 feature_type;
@@ -1354,6 +1380,7 @@ static int hidpp20_query_battery_voltage_info(struct hidpp_device *hidpp)
 
 	hidpp->battery.status = status;
 	hidpp->battery.voltage = voltage;
+	hidpp->battery.capacity = hidpp20_map_battery_capacity(voltage);
 	hidpp->battery.level = level;
 	hidpp->battery.charge_type = charge_type;
 	hidpp->battery.online = status != POWER_SUPPLY_STATUS_NOT_CHARGING;
@@ -1378,6 +1405,7 @@ static int hidpp20_battery_voltage_event(struct hidpp_device *hidpp,
 
 	if (voltage != hidpp->battery.voltage || status != hidpp->battery.status) {
 		hidpp->battery.voltage = voltage;
+		hidpp->battery.capacity = hidpp20_map_battery_capacity(voltage);
 		hidpp->battery.status = status;
 		hidpp->battery.level = level;
 		hidpp->battery.charge_type = charge_type;
@@ -3717,7 +3745,8 @@ static int hidpp_initialize_battery(struct hidpp_device *hidpp)
 	num_battery_props = ARRAY_SIZE(hidpp_battery_props) - 3;
 
 	if (hidpp->capabilities & HIDPP_CAPABILITY_BATTERY_MILEAGE ||
-	    hidpp->capabilities & HIDPP_CAPABILITY_BATTERY_PERCENTAGE)
+	    hidpp->capabilities & HIDPP_CAPABILITY_BATTERY_PERCENTAGE ||
+	    hidpp->capabilities & HIDPP_CAPABILITY_BATTERY_VOLTAGE)
 		battery_props[num_battery_props++] =
 				POWER_SUPPLY_PROP_CAPACITY;
 
-- 
2.32.0

