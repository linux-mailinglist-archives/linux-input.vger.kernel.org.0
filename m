Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C937B6A806C
	for <lists+linux-input@lfdr.de>; Thu,  2 Mar 2023 11:56:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbjCBK4E (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 2 Mar 2023 05:56:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbjCBK4D (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 2 Mar 2023 05:56:03 -0500
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18AD3231FA;
        Thu,  2 Mar 2023 02:56:00 -0800 (PST)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id 3D0A260006;
        Thu,  2 Mar 2023 10:55:58 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-usb@vger.kernel.org, linux-input@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>
Subject: [PATCH v3 2/6] HID: logitech-hidpp: Add support for ADC measurement feature
Date:   Thu,  2 Mar 2023 11:55:51 +0100
Message-Id: <20230302105555.51417-2-hadess@hadess.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302105555.51417-1-hadess@hadess.net>
References: <20230302105555.51417-1-hadess@hadess.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_PDS_OTHER_BAD_TLD autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This is used in a number of Logitech headsets to report the voltage
of the battery.

Tested on a Logitech G935.

Signed-off-by: Bastien Nocera <hadess@hadess.net>
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=216483
---
Fixed array length checking in v2.
No changes in v3

 drivers/hid/hid-logitech-hidpp.c | 172 ++++++++++++++++++++++++++++++-
 1 file changed, 170 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index f55b2233dbea..5a95f01a6129 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -94,6 +94,7 @@ MODULE_PARM_DESC(disable_tap_to_click,
 #define HIDPP_CAPABILITY_HIDPP20_HI_RES_WHEEL	BIT(7)
 #define HIDPP_CAPABILITY_HIDPP20_HI_RES_SCROLL	BIT(8)
 #define HIDPP_CAPABILITY_HIDPP10_FAST_SCROLL	BIT(9)
+#define HIDPP_CAPABILITY_ADC_MEASUREMENT	BIT(10)
 
 #define lg_map_key_clear(c)  hid_map_usage_clear(hi, usage, bit, max, EV_KEY, (c))
 
@@ -145,6 +146,7 @@ struct hidpp_battery {
 	u8 feature_index;
 	u8 solar_feature_index;
 	u8 voltage_feature_index;
+	u8 adc_measurement_feature_index;
 	struct power_supply_desc desc;
 	struct power_supply *ps;
 	char name[64];
@@ -1742,6 +1744,162 @@ static int hidpp_set_wireless_feature_index(struct hidpp_device *hidpp)
 	return ret;
 }
 
+/* -------------------------------------------------------------------------- */
+/* 0x1f20: ADC measurement                                                    */
+/* -------------------------------------------------------------------------- */
+
+#define HIDPP_PAGE_ADC_MEASUREMENT 0x1f20
+
+#define CMD_ADC_MEASUREMENT_GET_ADC_MEASUREMENT 0x00
+
+#define EVENT_ADC_MEASUREMENT_STATUS_BROADCAST 0x00
+
+static int hidpp20_map_adc_measurement_1f20_capacity(struct hid_device *hid_dev, int voltage)
+{
+	/* NB: This voltage curve doesn't necessarily map perfectly to all
+	 * devices that implement the ADC_MEASUREMENT feature. This is because
+	 * there are a few devices that use different battery technology.
+	 *
+	 * Adapted from:
+	 * https://github.com/Sapd/HeadsetControl/blob/acd972be0468e039b93aae81221f20a54d2d60f7/src/devices/logitech_g633_g933_935.c#L44-L52
+	 */
+	static const int voltages[100] = {
+		4030, 4024, 4018, 4011, 4003, 3994, 3985, 3975, 3963, 3951,
+		3937, 3922, 3907, 3893, 3880, 3868, 3857, 3846, 3837, 3828,
+		3820, 3812, 3805, 3798, 3791, 3785, 3779, 3773, 3768, 3762,
+		3757, 3752, 3747, 3742, 3738, 3733, 3729, 3724, 3720, 3716,
+		3712, 3708, 3704, 3700, 3696, 3692, 3688, 3685, 3681, 3677,
+		3674, 3670, 3667, 3663, 3660, 3657, 3653, 3650, 3646, 3643,
+		3640, 3637, 3633, 3630, 3627, 3624, 3620, 3617, 3614, 3611,
+		3608, 3604, 3601, 3598, 3595, 3592, 3589, 3585, 3582, 3579,
+		3576, 3573, 3569, 3566, 3563, 3560, 3556, 3553, 3550, 3546,
+		3543, 3539, 3536, 3532, 3529, 3525, 3499, 3466, 3433, 3399,
+	};
+
+	int i;
+
+	if (voltage == 0)
+		return 0;
+
+	if (unlikely(voltage < 3400 || voltage >= 5000))
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
+static int hidpp20_map_adc_measurement_1f20(u8 data[3], int *voltage)
+{
+	int status;
+	u8 flags;
+
+	flags = data[2];
+
+	switch (flags) {
+	case 0x01:
+		status = POWER_SUPPLY_STATUS_DISCHARGING;
+		break;
+	case 0x03:
+		status = POWER_SUPPLY_STATUS_CHARGING;
+		break;
+	case 0x07:
+		status = POWER_SUPPLY_STATUS_FULL;
+		break;
+	case 0x0F:
+	default:
+		status = POWER_SUPPLY_STATUS_UNKNOWN;
+		break;
+	}
+
+	*voltage = get_unaligned_be16(data);
+
+	dbg_hid("Parsed 1f20 data as flag 0x%02x voltage %dmV\n",
+		flags, *voltage);
+
+	return status;
+}
+
+/* Return value is whether the device is online */
+static bool hidpp20_get_adc_measurement_1f20(struct hidpp_device *hidpp,
+						 u8 feature_index,
+						 int *status, int *voltage)
+{
+	struct hidpp_report response;
+	int ret;
+	u8 *params = (u8 *)response.fap.params;
+
+	*status = POWER_SUPPLY_STATUS_UNKNOWN;
+	*voltage = 0;
+	ret = hidpp_send_fap_command_sync(hidpp, feature_index,
+					  CMD_ADC_MEASUREMENT_GET_ADC_MEASUREMENT,
+					  NULL, 0, &response);
+
+	if (ret > 0) {
+		hid_dbg(hidpp->hid_dev, "%s: received protocol error 0x%02x\n",
+			__func__, ret);
+		return false;
+	}
+
+	*status = hidpp20_map_adc_measurement_1f20(params, voltage);
+	return true;
+}
+
+static int hidpp20_query_adc_measurement_info_1f20(struct hidpp_device *hidpp)
+{
+	u8 feature_type;
+
+	if (hidpp->battery.adc_measurement_feature_index == 0xff) {
+		int ret;
+
+		ret = hidpp_root_get_feature(hidpp, HIDPP_PAGE_ADC_MEASUREMENT,
+					     &hidpp->battery.adc_measurement_feature_index,
+					     &feature_type);
+		if (ret)
+			return ret;
+
+		hidpp->capabilities |= HIDPP_CAPABILITY_ADC_MEASUREMENT;
+	}
+
+	hidpp->battery.online = hidpp20_get_adc_measurement_1f20(hidpp,
+								 hidpp->battery.adc_measurement_feature_index,
+								 &hidpp->battery.status,
+								 &hidpp->battery.voltage);
+	hidpp->battery.capacity = hidpp20_map_adc_measurement_1f20_capacity(hidpp->hid_dev,
+									    hidpp->battery.voltage);
+
+	return 0;
+}
+
+static int hidpp20_adc_measurement_event_1f20(struct hidpp_device *hidpp,
+					    u8 *data, int size)
+{
+	struct hidpp_report *report = (struct hidpp_report *)data;
+	int status, voltage;
+
+	if (report->fap.feature_index != hidpp->battery.adc_measurement_feature_index ||
+		report->fap.funcindex_clientid != EVENT_ADC_MEASUREMENT_STATUS_BROADCAST)
+		return 0;
+
+	status = hidpp20_map_adc_measurement_1f20(report->fap.params, &voltage);
+
+	hidpp->battery.online = status != POWER_SUPPLY_STATUS_UNKNOWN;
+
+	if (voltage != hidpp->battery.voltage || status != hidpp->battery.status) {
+		hidpp->battery.status = status;
+		hidpp->battery.voltage = voltage;
+		hidpp->battery.capacity = hidpp20_map_adc_measurement_1f20_capacity(hidpp->hid_dev, voltage);
+		if (hidpp->battery.ps)
+			power_supply_changed(hidpp->battery.ps);
+	}
+	return 0;
+}
+
 /* -------------------------------------------------------------------------- */
 /* 0x2120: Hi-resolution scrolling                                            */
 /* -------------------------------------------------------------------------- */
@@ -3660,6 +3818,9 @@ static int hidpp_raw_hidpp_event(struct hidpp_device *hidpp, u8 *data,
 		ret = hidpp20_battery_voltage_event(hidpp, data, size);
 		if (ret != 0)
 			return ret;
+		ret = hidpp20_adc_measurement_event_1f20(hidpp, data, size);
+		if (ret != 0)
+			return ret;
 	}
 
 	if (hidpp->capabilities & HIDPP_CAPABILITY_HIDPP10_BATTERY) {
@@ -3783,6 +3944,7 @@ static int hidpp_initialize_battery(struct hidpp_device *hidpp)
 	hidpp->battery.feature_index = 0xff;
 	hidpp->battery.solar_feature_index = 0xff;
 	hidpp->battery.voltage_feature_index = 0xff;
+	hidpp->battery.adc_measurement_feature_index = 0xff;
 
 	if (hidpp->protocol_major >= 2) {
 		if (hidpp->quirks & HIDPP_QUIRK_CLASS_K750)
@@ -3796,6 +3958,8 @@ static int hidpp_initialize_battery(struct hidpp_device *hidpp)
 				ret = hidpp20_query_battery_info_1004(hidpp);
 			if (ret)
 				ret = hidpp20_query_battery_voltage_info(hidpp);
+			if (ret)
+				ret = hidpp20_query_adc_measurement_info_1f20(hidpp);
 		}
 
 		if (ret)
@@ -3825,7 +3989,8 @@ static int hidpp_initialize_battery(struct hidpp_device *hidpp)
 
 	if (hidpp->capabilities & HIDPP_CAPABILITY_BATTERY_MILEAGE ||
 	    hidpp->capabilities & HIDPP_CAPABILITY_BATTERY_PERCENTAGE ||
-	    hidpp->capabilities & HIDPP_CAPABILITY_BATTERY_VOLTAGE)
+	    hidpp->capabilities & HIDPP_CAPABILITY_BATTERY_VOLTAGE ||
+	    hidpp->capabilities & HIDPP_CAPABILITY_ADC_MEASUREMENT)
 		battery_props[num_battery_props++] =
 				POWER_SUPPLY_PROP_CAPACITY;
 
@@ -3833,7 +3998,8 @@ static int hidpp_initialize_battery(struct hidpp_device *hidpp)
 		battery_props[num_battery_props++] =
 				POWER_SUPPLY_PROP_CAPACITY_LEVEL;
 
-	if (hidpp->capabilities & HIDPP_CAPABILITY_BATTERY_VOLTAGE)
+	if (hidpp->capabilities & HIDPP_CAPABILITY_BATTERY_VOLTAGE ||
+	    hidpp->capabilities & HIDPP_CAPABILITY_ADC_MEASUREMENT)
 		battery_props[num_battery_props++] =
 			POWER_SUPPLY_PROP_VOLTAGE_NOW;
 
@@ -4006,6 +4172,8 @@ static void hidpp_connect_event(struct hidpp_device *hidpp)
 			hidpp20_query_battery_voltage_info(hidpp);
 		else if (hidpp->capabilities & HIDPP_CAPABILITY_UNIFIED_BATTERY)
 			hidpp20_query_battery_info_1004(hidpp);
+		else if (hidpp->capabilities & HIDPP_CAPABILITY_ADC_MEASUREMENT)
+			hidpp20_query_adc_measurement_info_1f20(hidpp);
 		else
 			hidpp20_query_battery_info_1000(hidpp);
 	}
-- 
2.39.2

