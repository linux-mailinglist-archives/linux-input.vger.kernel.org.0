Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEA863DD60E
	for <lists+linux-input@lfdr.de>; Mon,  2 Aug 2021 14:54:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233688AbhHBMyd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Aug 2021 08:54:33 -0400
Received: from mta-06-3.privateemail.com ([198.54.127.59]:5833 "EHLO
        MTA-06-3.privateemail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232629AbhHBMyc (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Aug 2021 08:54:32 -0400
Received: from mta-06.privateemail.com (localhost [127.0.0.1])
        by mta-06.privateemail.com (Postfix) with ESMTP id 79C9018000BA;
        Mon,  2 Aug 2021 08:54:22 -0400 (EDT)
Received: from hal-station.. (unknown [10.20.151.212])
        by mta-06.privateemail.com (Postfix) with ESMTPA id 8CA5F18000B5;
        Mon,  2 Aug 2021 08:54:21 -0400 (EDT)
From:   Hamza Mahfooz <someguy@effective-light.com>
To:     linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
        Bastien Nocera <hadess@hadess.net>,
        Hamza Mahfooz <someguy@effective-light.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: [PATCH v4] HID: logitech-hidpp: battery: provide CAPACITY property for newer devices
Date:   Mon,  2 Aug 2021 08:52:32 -0400
Message-Id: <20210802125232.65188-1-someguy@effective-light.com>
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

v2: use ARRAY_SIZE() and set voltages[]'s size to 100

v3: add a check to ensure that exactly 100 elements are in voltages[]

v4: add a note regarding the voltage curve and introduce a bounds check on
    the reported voltage
---
 drivers/hid/hid-logitech-hidpp.c | 44 +++++++++++++++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 61635e629469..c4226883904b 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -1331,6 +1331,43 @@ static int hidpp20_battery_get_battery_voltage(struct hidpp_device *hidpp,
 	return 0;
 }
 
+static int hidpp20_map_battery_capacity(struct hid_device *hid_dev, int voltage)
+{
+	/* NB: This voltage curve doesn't necessarily map perfectly to all
+	 * devices that implement the BATTERY_VOLTAGE feature. This is because
+	 * there are a few devices that use different battery technology.
+	 */
+
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
+		3671, 3666, 3662, 3658, 3654, 3646, 3633, 3612, 3579, 3537
+	};
+
+	int i;
+
+	BUILD_BUG_ON(ARRAY_SIZE(voltages) != 100);
+
+	if (unlikely(voltage < 3500 || voltage >= 5000))
+		hid_warn_once(hid_dev,
+			      "%s: possibly using the wrong voltage curve\n",
+			      __func__);
+
+	for (i = 0; i < ARRAY_SIZE(voltages); i++) {
+		if (voltage >= voltages[i])
+			return ARRAY_SIZE(voltages) - i;
+	}
+
+	return 0;
+}
+
 static int hidpp20_query_battery_voltage_info(struct hidpp_device *hidpp)
 {
 	u8 feature_type;
@@ -1354,6 +1391,8 @@ static int hidpp20_query_battery_voltage_info(struct hidpp_device *hidpp)
 
 	hidpp->battery.status = status;
 	hidpp->battery.voltage = voltage;
+	hidpp->battery.capacity = hidpp20_map_battery_capacity(hidpp->hid_dev,
+							       voltage);
 	hidpp->battery.level = level;
 	hidpp->battery.charge_type = charge_type;
 	hidpp->battery.online = status != POWER_SUPPLY_STATUS_NOT_CHARGING;
@@ -1378,6 +1417,8 @@ static int hidpp20_battery_voltage_event(struct hidpp_device *hidpp,
 
 	if (voltage != hidpp->battery.voltage || status != hidpp->battery.status) {
 		hidpp->battery.voltage = voltage;
+		hidpp->battery.capacity = hidpp20_map_battery_capacity(hidpp->hid_dev,
+								       voltage);
 		hidpp->battery.status = status;
 		hidpp->battery.level = level;
 		hidpp->battery.charge_type = charge_type;
@@ -3717,7 +3758,8 @@ static int hidpp_initialize_battery(struct hidpp_device *hidpp)
 	num_battery_props = ARRAY_SIZE(hidpp_battery_props) - 3;
 
 	if (hidpp->capabilities & HIDPP_CAPABILITY_BATTERY_MILEAGE ||
-	    hidpp->capabilities & HIDPP_CAPABILITY_BATTERY_PERCENTAGE)
+	    hidpp->capabilities & HIDPP_CAPABILITY_BATTERY_PERCENTAGE ||
+	    hidpp->capabilities & HIDPP_CAPABILITY_BATTERY_VOLTAGE)
 		battery_props[num_battery_props++] =
 				POWER_SUPPLY_PROP_CAPACITY;
 
-- 
2.32.0

