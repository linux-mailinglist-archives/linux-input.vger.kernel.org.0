Return-Path: <linux-input+bounces-5555-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 63714950CFE
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2024 21:15:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BCE42869A3
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2024 19:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 725B51A2C15;
	Tue, 13 Aug 2024 19:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gXpa+XTy"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FEE1A4F22;
	Tue, 13 Aug 2024 19:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723576528; cv=none; b=Z989ldB7jAOJ+Ofl9/QDWOevhuebSqP5+v4ieM7Nt33RBHjklRtjVm/SiWmrIlHEwwO6LT4nJC9DvvA63RqRUG25+R/Pt/hXIwWIHM05yytNdZCbmXXCIrDpZlFJ5RPjvZ6MwRBWLIyM1rXXveD2JGaE7MGWVpes8xUzjgSXpsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723576528; c=relaxed/simple;
	bh=A7Zi6MvABEJAQ/OBiQgiDyVfrW2YUnZ3ys+gmY+Hz9I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EL84X8QhppzecdWOv9TuypaJoc+mCSG4tlHPOrLP7WPzHsQLtiBDz4Dm/1EDKSXc49XMTiQpkYZNKt1cSncGKW312rq/y4zUrVYlIfiJshL6Ew16/V92d/uYFitxTGRZ2+H6Kn8MN1iJfaV+Sp6dtbT3Bm9YIFdFKnJRXvQUPdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gXpa+XTy; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-368380828d6so3144380f8f.1;
        Tue, 13 Aug 2024 12:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723576524; x=1724181324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w6VA5UiPMKnjcvGBvMROBhuClYQzBJ8lUxQj8/eS3Gc=;
        b=gXpa+XTyzGVECIwJ5qkUPjvP9R3q9+zWheiOeN6ep9WUzIsCT1BHUDtX6PA7qQedAq
         VUSakZPNczEQH+0FBiHxcwKxZsXleU3T5PpN5FseGG9iLo3TK8PQkmu4vKPelkwrmRR1
         PimV5/J5+l2RQZ0aUmsp9bejeIg0SjWts4teCwlCbVStBEdzPwUVztLlRuqUMtYGosYQ
         LvtP/IKk4QfcInqpXynsBqCkdjDWKv/vIqaoh/nM40xa2MEZ3dyw8sO2J34A3AQlyGh4
         6OFnhV/AflqlGihBfprwpSg8/wLjcOKCx1EOSHN/Cqrf7fXhfWg8aHYmn0rqgBnEP32P
         eBrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723576524; x=1724181324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w6VA5UiPMKnjcvGBvMROBhuClYQzBJ8lUxQj8/eS3Gc=;
        b=LnCiwolgqNNgcdkKkulPJ3GsFCgrnQ2FhoxudfjLEQ+0bbtnXHHiahBHot+pNWWg/d
         xuRd33OFPR25rrYTxfJLpkucuDBf/PKgl4yZ5bFg2zlWR7SsEP6GvcejYi+2FoCkotYk
         LKZVH2TBCp5zmvCPcjGVSql2NPilgLK29KFbdKZaG/lcbXODgOB7xac9mAytvhIGBm2t
         I1mncvrWJWzhYeZQcc2FXg28v2Y8r2RIXbq5yJWlToFY2EeTqcaKlwSO0596E8gJeTq2
         CCD0UcgrWvyp/qYNKQ8oHI1fEZcy+YB9mGGa+elikUK2MWmyykAt6vgHXmwN9XdeCtdJ
         33qg==
X-Forwarded-Encrypted: i=1; AJvYcCWivPXf7kkhogAuofmqevWmHO34BDvI/C2zu1pvWxgdn7vKkds6TX3JklB0AVH00VKccbZgQ3DSOV8DWPRW/q2HLiJ+rNuecCLDACC8
X-Gm-Message-State: AOJu0Yy4t0p37ezir7ZyJYeUzm3MUmrzD5ddCPIVA0oUPpq8LotTwSTr
	SUNiAjFIu8kFycwJj8kWhhLRdRCzf6a+7rJ9cy82MMBWaGFpAmDpCZn0nFQs
X-Google-Smtp-Source: AGHT+IFeeUF8EBW8QnZ++2NSgq58Kku/AR1OUH1LhWDZajluJ0fg3SiYkCV/HoEBo8ZgYbIYiEIM7Q==
X-Received: by 2002:a5d:59a5:0:b0:371:728e:d000 with SMTP id ffacd0b85a97d-3717775c9b2mr398850f8f.1.1723576522865;
        Tue, 13 Aug 2024 12:15:22 -0700 (PDT)
Received: from localhost.localdomain ([188.74.74.117])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36e4e51ea56sm11088903f8f.76.2024.08.13.12.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 12:15:22 -0700 (PDT)
From: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
To: linux-input@vger.kernel.org
Cc: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] HID: corsair-void: Add Corsair Void headset family driver
Date: Tue, 13 Aug 2024 16:38:19 +0100
Message-ID: <20240813153819.840275-3-stuart.a.hayhurst@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a driver for the Corsair Void family of headsets, supporting:
 - Battery reporting (power_supply)
 - Sidetone setting support
 - Physical microphone location reporting
 - Headset and receiver firmware version reporting
 - Built-in alert triggering
 - USB wireless_status

Currently, the sysfs documentation uses the date I implemented each attribute, but if that's
supposed to be the date it was submitted, I can correct that.

Also, the sysfs attributes currently report -ENODEV in some cases if the headset is wired,
or if the wireless headset is disconnected (such as send_alert).
Should I leave it like this, or deregister the attributes, so those cases are never triggered?

I'm also not sure about the block of comments at the start describing the (guessed) format of the
packets, let me know if this should go somewhere else.

Apologies if I've messed anything up, I've only sent fairly small patches until now :)

Signed-off-by: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
---
 .../ABI/testing/sysfs-driver-hid-corsair-void |  38 +
 drivers/hid/Kconfig                           |  10 +
 drivers/hid/Makefile                          |   1 +
 drivers/hid/hid-corsair-void.c                | 851 ++++++++++++++++++
 4 files changed, 900 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-hid-corsair-void
 create mode 100644 drivers/hid/hid-corsair-void.c

diff --git a/Documentation/ABI/testing/sysfs-driver-hid-corsair-void b/Documentation/ABI/testing/sysfs-driver-hid-corsair-void
new file mode 100644
index 000000000000..fc93806aa382
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-hid-corsair-void
@@ -0,0 +1,38 @@
+What:		/sys/bus/hid/drivers/hid-corsair-void/<dev>/fw_version_headset
+Date:		January 2024
+KernelVersion:	6.12
+Contact:	Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
+Description:	(R) The firmware version of the headset
+			* Returns -ENODATA if no version was reported
+
+What:		/sys/bus/hid/drivers/hid-corsair-void/<dev>/fw_version_receiver
+Date:		January 2024
+KernelVersion:	6.12
+Contact:	Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
+Description:	(R) The firmware version of the receiver
+
+What:		/sys/bus/hid/drivers/hid-corsair-void/<dev>/microphone_up
+Date:		July 2023
+KernelVersion:	6.12
+Contact:	Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
+Description:	(R) Get the physical position of the microphone
+			* 1 -> Microphone up
+			* 0 -> Microphone down
+
+What:		/sys/bus/hid/drivers/hid-corsair-void/<dev>/send_alert
+Date:		July 2023
+KernelVersion:	6.12
+Contact:	Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
+Description:	(W) Play a built-in notification from the headset (0 / 1)
+
+What:		/sys/bus/hid/drivers/hid-corsair-void/<dev>/set_sidetone
+Date:		December 2023
+KernelVersion:	6.12
+Contact:	Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
+Description:	(W) Set the sidetone volume (0 - sidetone_max)
+
+What:		/sys/bus/hid/drivers/hid-corsair-void/<dev>/sidetone_max
+Date:		July 2024
+KernelVersion:	6.12
+Contact:	Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
+Description:	(R) Report the maximum sidetone volume
diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 08446c89eff6..7dcf911f3367 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -221,6 +221,16 @@ config HID_CORSAIR
 	- Vengeance K90
 	- Scimitar PRO RGB
 
+config HID_CORSAIR_VOID
+	tristate "Corsair Void headsets"
+	depends on USB_HID
+	select POWER_SUPPLY
+	help
+	Support for Corsair Void headsets.
+
+	Supported devices:
+	- Corsair Void headsets
+
 config HID_COUGAR
 	tristate "Cougar devices"
 	help
diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index e40f1ddebbb7..037d7e3b6c3e 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -39,6 +39,7 @@ obj-$(CONFIG_HID_CHERRY)	+= hid-cherry.o
 obj-$(CONFIG_HID_CHICONY)	+= hid-chicony.o
 obj-$(CONFIG_HID_CMEDIA)	+= hid-cmedia.o
 obj-$(CONFIG_HID_CORSAIR)	+= hid-corsair.o
+obj-$(CONFIG_HID_CORSAIR_VOID)	+= hid-corsair-void.o
 obj-$(CONFIG_HID_COUGAR)	+= hid-cougar.o
 obj-$(CONFIG_HID_CP2112)	+= hid-cp2112.o
 obj-$(CONFIG_HID_CYPRESS)	+= hid-cypress.o
diff --git a/drivers/hid/hid-corsair-void.c b/drivers/hid/hid-corsair-void.c
new file mode 100644
index 000000000000..5628c0ce54d7
--- /dev/null
+++ b/drivers/hid/hid-corsair-void.c
@@ -0,0 +1,851 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *  HID driver for Corsair Void headsets
+ *
+ *  Copyright (C) 2023-2024 Stuart Hayhurst
+ */
+
+/* -------------------------------------------------------------------------- */
+/* Receiver report information: (ID 100)                                      */
+/* -------------------------------------------------------------------------- */
+/*
+ * When queried, the receiver reponds with 5 bytes to describe the battery
+ *   The power button, mute button and moving the mic also trigger this report
+ * This includes power button + mic + connection + battery status and capacity
+ * The information below may not be perfect, it's been gathered through guesses
+ *
+ * 0: REPORT ID
+ *  100 for the battery packet
+ *
+ * 1: POWER BUTTON + (?)
+ *  Largest bit is 1 when power button pressed
+ *
+ * 2: BATTERY CAPACITY + MIC STATUS
+ *  Battery capacity:
+ *    Seems to report ~54 higher than reality when charging
+ *    Capped at 100, charging or not
+ *  Microphone status:
+ *    Largest bit is set to 1 when the mic is physically up
+ *    No bits change when the mic is muted, only when physically moved
+ *    This report is sent every time the mic is moved, no polling required
+ *
+ * 3: CONNECTION STATUS
+ *  16: Wired headset
+ *  38: Initialising
+ *  49: Lost connection
+ *  51: Disconnected, searching
+ *  52: Disconnected, not searching
+ *  177: Normal
+ *
+ * 4: BATTERY STATUS
+ *  0: Disconnected
+ *  1: Normal
+ *  2: Low
+ *  3: Critical - sent during shutdown
+ *  4: Fully charged
+ *  5: Charging
+ */
+/* -------------------------------------------------------------------------- */
+
+/* -------------------------------------------------------------------------- */
+/* Receiver report information: (ID 102)                                      */
+/* -------------------------------------------------------------------------- */
+/*
+ * When queried, the recevier responds with 4 bytes to describe the firmware
+ * The first 2 bytes are for the receiver, the second 2 are the headset
+ * The headset firmware version will be 0 if no headset is connected
+ *
+ * 0: Recevier firmware major version
+ *  Major version of the receiver's firmware
+ *
+ * 1: Recevier firmware minor version
+ *  Minor version of the receiver's firmware
+ *
+ * 2: Headset firmware major version
+ *  Major version of the headset's firmware
+ *
+ * 3: Headset firmware minor version
+ *  Minor version of the headset's firmware
+ */
+/* -------------------------------------------------------------------------- */
+
+#include <linux/bitfield.h>
+#include <linux/bitops.h>
+#include <linux/cleanup.h>
+#include <linux/hid.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/power_supply.h>
+#include <linux/usb.h>
+#include <linux/workqueue.h>
+#include <asm/byteorder.h>
+
+#include "hid-ids.h"
+
+#define CORSAIR_VOID_DEVICE(id, type)		{ HID_USB_DEVICE(USB_VENDOR_ID_CORSAIR, (id)), \
+						.driver_data = (type) }
+#define CORSAIR_VOID_WIRELESS_DEVICE(id)	CORSAIR_VOID_DEVICE((id), CORSAIR_VOID_WIRELESS)
+#define CORSAIR_VOID_WIRED_DEVICE(id)		CORSAIR_VOID_DEVICE((id), CORSAIR_VOID_WIRED)
+
+#define CORSAIR_VOID_STATUS_REQUEST_ID		0xC9
+#define CORSAIR_VOID_NOTIF_REQUEST_ID		0xCA
+#define CORSAIR_VOID_SIDETONE_REQUEST_ID	0xFF
+#define CORSAIR_VOID_STATUS_REPORT_ID		0x64
+#define CORSAIR_VOID_FIRMWARE_REPORT_ID		0x66
+
+#define CORSAIR_VOID_USB_SIDETONE_REQUEST	0x1
+#define CORSAIR_VOID_USB_SIDETONE_REQUEST_TYPE	0x21
+#define CORSAIR_VOID_USB_SIDETONE_VALUE		0x200
+#define CORSAIR_VOID_USB_SIDETONE_INDEX		0xB00
+
+#define CORSAIR_VOID_MIC_MASK			GENMASK(7, 7)
+#define CORSAIR_VOID_CAPACITY_MASK		GENMASK(6, 0)
+
+#define CORSAIR_VOID_WIRELESS_CONNECTED		177
+
+#define CORSAIR_VOID_SIDETONE_MAX_WIRELESS	55
+#define CORSAIR_VOID_SIDETONE_MAX_WIRED		4096
+
+enum {
+	CORSAIR_VOID_WIRELESS,
+	CORSAIR_VOID_WIRED,
+};
+
+static enum power_supply_property corsair_void_battery_props[] = {
+	POWER_SUPPLY_PROP_STATUS,
+	POWER_SUPPLY_PROP_PRESENT,
+	POWER_SUPPLY_PROP_CAPACITY,
+	POWER_SUPPLY_PROP_CAPACITY_LEVEL,
+	POWER_SUPPLY_PROP_SCOPE,
+	POWER_SUPPLY_PROP_MODEL_NAME,
+	POWER_SUPPLY_PROP_MANUFACTURER,
+};
+
+struct corsair_void_battery_data {
+	int status;
+	bool present;
+	int capacity;
+	int capacity_level;
+};
+
+struct corsair_void_drvdata {
+	struct hid_device *hid_dev;
+	struct device *dev;
+
+	char *name;
+	bool is_wired;
+	unsigned int sidetone_max;
+
+	struct corsair_void_battery_data battery_data;
+	bool mic_up;
+	bool connected;
+	int fw_receiver_major;
+	int fw_receiver_minor;
+	int fw_headset_major;
+	int fw_headset_minor;
+
+	struct power_supply *battery;
+	struct power_supply_desc battery_desc;
+	struct mutex battery_mutex;
+
+	struct delayed_work delayed_status_work;
+	struct delayed_work delayed_firmware_work;
+	struct work_struct battery_remove_work;
+	struct work_struct battery_add_work;
+};
+
+/*
+ * Functions to process receiver data
+*/
+
+static void corsair_void_set_wireless_status(struct corsair_void_drvdata *drvdata)
+{
+	struct usb_interface *usb_if = to_usb_interface(drvdata->dev->parent);
+
+	if (drvdata->is_wired)
+		return;
+
+	usb_set_wireless_status(usb_if, drvdata->connected ?
+					USB_WIRELESS_STATUS_CONNECTED :
+					USB_WIRELESS_STATUS_DISCONNECTED);
+}
+
+static void corsair_void_set_unknown_batt(struct corsair_void_drvdata *drvdata)
+{
+	struct corsair_void_battery_data *battery_data = &drvdata->battery_data;
+
+	battery_data->status = POWER_SUPPLY_STATUS_UNKNOWN;
+	battery_data->present = false;
+	battery_data->capacity = 0;
+	battery_data->capacity_level = POWER_SUPPLY_CAPACITY_LEVEL_UNKNOWN;
+}
+
+/* Reset data that may change between wireless connections */
+static void corsair_void_set_unknown_wireless_data(struct corsair_void_drvdata *drvdata)
+{
+	/* Only 0 out headset, receiver is always known if relevant */
+	drvdata->fw_headset_major = 0;
+	drvdata->fw_headset_minor = 0;
+
+	drvdata->connected = false;
+	drvdata->mic_up = false;
+
+	corsair_void_set_wireless_status(drvdata);
+}
+
+static void corsair_void_process_receiver(struct corsair_void_drvdata *drvdata,
+					  int raw_battery_capacity,
+					  int raw_connection_status,
+					  int raw_battery_status)
+{
+	struct corsair_void_battery_data *battery_data = &drvdata->battery_data;
+	struct corsair_void_battery_data orig_battery_data;
+	int battery_struct_size = sizeof(struct corsair_void_battery_data);
+
+	/* Save initial battery data, to compare later */
+	orig_battery_data = *battery_data;
+
+	/* Headset not connected, or it's wired */
+	if (raw_connection_status != CORSAIR_VOID_WIRELESS_CONNECTED)
+		goto unknown_battery;
+
+	/* Battery information unavailable */
+	if (raw_battery_status == 0)
+		goto unknown_battery;
+
+	/* Battery must be connected then */
+	battery_data->present = true;
+	battery_data->capacity_level = POWER_SUPPLY_CAPACITY_LEVEL_NORMAL;
+
+	/* Set battery status */
+	switch (raw_battery_status) {
+	case 1:
+	case 2:
+	case 3: /* Battery normal / low / critical */
+		battery_data->status = POWER_SUPPLY_STATUS_DISCHARGING;
+		if (raw_battery_status == 2)
+			battery_data->capacity_level = POWER_SUPPLY_CAPACITY_LEVEL_LOW;
+		else if (raw_battery_status == 3)
+			battery_data->capacity_level = POWER_SUPPLY_CAPACITY_LEVEL_CRITICAL;
+
+		break;
+	case 4: /* Battery fully charged */
+		battery_data->status = POWER_SUPPLY_STATUS_FULL;
+		break;
+	case 5: /* Battery charging */
+		battery_data->status = POWER_SUPPLY_STATUS_CHARGING;
+		break;
+	default:
+		hid_warn(drvdata->hid_dev, "unknown battery status '%d'",
+			 raw_battery_status);
+		goto unknown_battery;
+		break;
+	}
+
+	battery_data->capacity = raw_battery_capacity;
+	corsair_void_set_wireless_status(drvdata);
+
+	goto success;
+unknown_battery:
+	corsair_void_set_unknown_batt(drvdata);
+success:
+
+	/* Inform power supply if battery values changed */
+	if (memcmp(&orig_battery_data, battery_data, battery_struct_size)) {
+		scoped_guard(mutex, &drvdata->battery_mutex) {
+			if (drvdata->battery) {
+				power_supply_changed(drvdata->battery);
+			}
+		}
+	}
+}
+
+/*
+ * Functions to report stored data
+*/
+
+static int corsair_void_battery_get_property(struct power_supply *psy,
+					     enum power_supply_property prop,
+					     union power_supply_propval *val)
+{
+	struct corsair_void_drvdata *drvdata = power_supply_get_drvdata(psy);
+
+	switch (prop) {
+		case POWER_SUPPLY_PROP_SCOPE:
+			val->intval = POWER_SUPPLY_SCOPE_DEVICE;
+			break;
+		case POWER_SUPPLY_PROP_MODEL_NAME:
+			if (!strncmp(drvdata->hid_dev->name, "Corsair ", 8))
+				val->strval = drvdata->hid_dev->name + 8;
+			else
+				val->strval = drvdata->hid_dev->name;
+			break;
+		case POWER_SUPPLY_PROP_MANUFACTURER:
+			val->strval = "Corsair";
+			break;
+		case POWER_SUPPLY_PROP_STATUS:
+			val->intval = drvdata->battery_data.status;
+			break;
+		case POWER_SUPPLY_PROP_PRESENT:
+			val->intval = drvdata->battery_data.present;
+			break;
+		case POWER_SUPPLY_PROP_CAPACITY:
+			val->intval = drvdata->battery_data.capacity;
+			break;
+		case POWER_SUPPLY_PROP_CAPACITY_LEVEL:
+			val->intval = drvdata->battery_data.capacity_level;
+			break;
+		default:
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
+static ssize_t corsair_void_report_mic_up(struct device *dev,
+					  struct device_attribute *attr,
+					  char *buf)
+{
+	struct corsair_void_drvdata *drvdata = dev_get_drvdata(dev);
+
+	if (!drvdata->connected)
+		return -ENODEV;
+
+	return sysfs_emit(buf, "%d\n", drvdata->mic_up);
+}
+
+static ssize_t corsair_void_report_firmware(struct device *dev,
+					    struct device_attribute *attr,
+					    char *buf)
+{
+	struct corsair_void_drvdata *drvdata = dev_get_drvdata(dev);
+	int major, minor;
+
+	if (!strcmp(attr->attr.name, "fw_version_receiver")) {
+		major = drvdata->fw_receiver_major;
+		minor = drvdata->fw_receiver_minor;
+	} else {
+		major = drvdata->fw_headset_major;
+		minor = drvdata->fw_headset_minor;
+	}
+
+	if (major == 0 && minor == 0)
+		return -ENODATA;
+
+	return sysfs_emit(buf, "%d.%02d\n", major, minor);
+}
+
+static ssize_t corsair_void_report_sidetone_max(struct device *dev,
+						struct device_attribute *attr,
+						char *buf)
+{
+	struct corsair_void_drvdata *drvdata = dev_get_drvdata(dev);
+	return sysfs_emit(buf, "%d\n", drvdata->sidetone_max);
+}
+
+/*
+ * Functions to send data to headset
+*/
+
+static ssize_t corsair_void_send_alert(struct device *dev,
+				       struct device_attribute *attr,
+				       const char *buf, size_t count)
+{
+	struct corsair_void_drvdata *drvdata = dev_get_drvdata(dev);
+	struct hid_device *hid_dev = drvdata->hid_dev;
+	unsigned char alert_id;
+	unsigned char *send_buf;
+	int ret;
+
+	if (!drvdata->connected)
+		return -ENODEV;
+
+	if (drvdata->is_wired)
+		return -ENODEV;
+
+	if (kstrtou8(buf, 10, &alert_id))
+		return -EINVAL;
+
+	/* Only accept 0 or 1 for alert ID */
+	if (alert_id >= 2)
+		return -EINVAL;
+
+	send_buf = kzalloc(3, GFP_KERNEL);
+	if (!send_buf)
+		return -ENOMEM;
+
+	/* Packet format to send alert with ID alert_id */
+	send_buf[0] = CORSAIR_VOID_NOTIF_REQUEST_ID;
+	send_buf[1] = 0x02;
+	send_buf[2] = alert_id;
+
+	ret = hid_hw_raw_request(hid_dev, CORSAIR_VOID_NOTIF_REQUEST_ID,
+				 send_buf, 3, HID_OUTPUT_REPORT,
+				 HID_REQ_SET_REPORT);
+	if (ret < 0) {
+		hid_warn(hid_dev, "failed to send alert request (reason: %d)",
+			 ret);
+	} else {
+		ret = count;
+	}
+
+	kfree(send_buf);
+	return ret;
+}
+
+static int corsair_void_send_sidetone_wired(struct device *dev, const char *buf,
+					    unsigned int sidetone)
+{
+	struct usb_interface *usb_if = to_usb_interface(dev->parent);
+	struct usb_device *usb_dev = interface_to_usbdev(usb_if);
+	u16 send_sidetone;
+	int ret = 0;
+
+	/* Packet format to set sidetone for wired headsets */
+	send_sidetone = cpu_to_le16(sidetone);
+	ret = usb_control_msg_send(usb_dev, 0,
+				   CORSAIR_VOID_USB_SIDETONE_REQUEST,
+				   CORSAIR_VOID_USB_SIDETONE_REQUEST_TYPE,
+				   CORSAIR_VOID_USB_SIDETONE_VALUE,
+				   CORSAIR_VOID_USB_SIDETONE_INDEX,
+				   &send_sidetone, 2, USB_CTRL_SET_TIMEOUT,
+				   GFP_KERNEL);
+
+	return ret;
+}
+
+static int corsair_void_send_sidetone_wireless(struct device *dev, const char *buf,
+					       unsigned char sidetone)
+{
+	struct corsair_void_drvdata *drvdata = dev_get_drvdata(dev);
+	struct hid_device *hid_dev = drvdata->hid_dev;
+	unsigned char *send_buf;
+	int ret = 0;
+
+	send_buf = kzalloc(12, GFP_KERNEL);
+	if (!send_buf)
+		return -ENOMEM;
+
+	/* Packet format to set sidetone for wireless headsets */
+	send_buf[0] = CORSAIR_VOID_SIDETONE_REQUEST_ID;
+	send_buf[1] = 0x0B;
+	send_buf[2] = 0x00;
+	send_buf[3] = 0xFF;
+	send_buf[4] = 0x04;
+	send_buf[5] = 0x0E;
+	send_buf[6] = 0xFF;
+	send_buf[7] = 0x05;
+	send_buf[8] = 0x01;
+	send_buf[9] = 0x04;
+	send_buf[10] = 0x00;
+	send_buf[11] = sidetone + 200;
+
+	ret = hid_hw_raw_request(hid_dev, CORSAIR_VOID_SIDETONE_REQUEST_ID,
+				 send_buf, 12, HID_FEATURE_REPORT,
+				 HID_REQ_SET_REPORT);
+
+	kfree(send_buf);
+	return ret;
+}
+
+static ssize_t corsair_void_send_sidetone(struct device *dev,
+					  struct device_attribute *attr,
+					  const char *buf, size_t count)
+{
+	struct corsair_void_drvdata *drvdata = dev_get_drvdata(dev);
+	struct hid_device *hid_dev = drvdata->hid_dev;
+	unsigned int sidetone;
+	int ret;
+
+	if (!drvdata->connected)
+		return -ENODEV;
+
+	if (kstrtouint(buf, 10, &sidetone))
+		return -EINVAL;
+
+	/* sidetone must be between 0 and drvdata->sidetone_max inclusive */
+	if (sidetone > drvdata->sidetone_max)
+		return -EINVAL;
+
+	if (drvdata->is_wired)
+		ret = corsair_void_send_sidetone_wired(dev, buf, sidetone);
+	else
+		ret = corsair_void_send_sidetone_wireless(dev, buf, sidetone);
+
+	if (ret < 0)
+		hid_warn(hid_dev, "failed to send sidetone (reason: %d)", ret);
+	else
+		ret = count;
+
+	return ret;
+}
+
+static int corsair_void_request_status(struct hid_device *hid_dev, int id)
+{
+	unsigned char *send_buf;
+	int ret;
+
+	send_buf = kzalloc(12, GFP_KERNEL);
+	if (!send_buf)
+		return -ENOMEM;
+
+	/* Packet format to request data item (status / firmware) refresh */
+	send_buf[0] = CORSAIR_VOID_STATUS_REQUEST_ID;
+	send_buf[1] = id;
+
+	/* Send request for data refresh */
+	ret = hid_hw_raw_request(hid_dev, CORSAIR_VOID_STATUS_REQUEST_ID,
+			  send_buf, 2, HID_OUTPUT_REPORT, HID_REQ_SET_REPORT);
+	if (ret < 0) {
+		switch (id) {
+		case CORSAIR_VOID_STATUS_REPORT_ID:
+			hid_warn(hid_dev, "failed to request battery (reason: %d)",
+				 ret);
+			break;
+		case CORSAIR_VOID_FIRMWARE_REPORT_ID:
+			hid_warn(hid_dev, "failed to request firmware (reason: %d)",
+				 ret);
+			break;
+		default:
+			hid_warn(hid_dev, "failed to send report %d (reason: %d)",
+				 id, ret);
+			break;
+		}
+	} else {
+		ret = 0;
+	}
+
+	kfree(send_buf);
+	return ret;
+}
+
+/*
+ * Headset connect / disconnect handlers and work handlers
+*/
+
+static void corsair_void_status_work_handler(struct work_struct *work)
+{
+	struct corsair_void_drvdata *drvdata;
+	struct delayed_work *delayed_work;
+
+	delayed_work = container_of(work, struct delayed_work, work);
+	drvdata = container_of(delayed_work, struct corsair_void_drvdata,
+			       delayed_status_work);
+
+	corsair_void_request_status(drvdata->hid_dev,
+				    CORSAIR_VOID_STATUS_REPORT_ID);
+}
+
+static void corsair_void_firmware_work_handler(struct work_struct *work)
+{
+	struct corsair_void_drvdata *drvdata;
+	struct delayed_work *delayed_work;
+
+	delayed_work = container_of(work, struct delayed_work, work);
+	drvdata = container_of(delayed_work, struct corsair_void_drvdata,
+			       delayed_firmware_work);
+
+	corsair_void_request_status(drvdata->hid_dev,
+				    CORSAIR_VOID_FIRMWARE_REPORT_ID);
+}
+
+static void corsair_void_battery_remove_work_handler(struct work_struct *work)
+{
+	struct corsair_void_drvdata *drvdata;
+
+	drvdata = container_of(work, struct corsair_void_drvdata,
+			       battery_remove_work);
+	scoped_guard(mutex, &drvdata->battery_mutex) {
+		if (drvdata->battery) {
+			power_supply_unregister(drvdata->battery);
+			drvdata->battery = NULL;
+		}
+	}
+}
+
+static void corsair_void_battery_add_work_handler(struct work_struct *work)
+{
+	struct corsair_void_drvdata *drvdata;
+	struct power_supply_config psy_cfg;
+
+	drvdata = container_of(work, struct corsair_void_drvdata,
+			       battery_add_work);
+	guard(mutex)(&drvdata->battery_mutex);
+	if (drvdata->battery)
+		return;
+
+	psy_cfg.drv_data = drvdata;
+	drvdata->battery = power_supply_register(drvdata->dev,
+						 &drvdata->battery_desc,
+						 &psy_cfg);
+
+	if (IS_ERR(drvdata->battery)) {
+		hid_err(drvdata->hid_dev,
+			"failed to register battery '%s' (reason: %ld)\n",
+			drvdata->battery_desc.name,
+			PTR_ERR(drvdata->battery));
+		drvdata->battery = NULL;
+		return;
+	}
+
+	if (power_supply_powers(drvdata->battery, drvdata->dev)) {
+		power_supply_unregister(drvdata->battery);
+		drvdata->battery = NULL;
+		return;
+	}
+}
+
+static void corsair_void_headset_connected(struct corsair_void_drvdata *drvdata)
+{
+	schedule_work(&drvdata->battery_add_work);
+	schedule_delayed_work(&drvdata->delayed_firmware_work,
+			      msecs_to_jiffies(100));
+}
+
+static void corsair_void_headset_disconnected(struct corsair_void_drvdata *drvdata)
+{
+	schedule_work(&drvdata->battery_remove_work);
+
+	corsair_void_set_unknown_wireless_data(drvdata);
+	corsair_void_set_unknown_batt(drvdata);
+}
+
+/*
+ * Driver setup, probing and HID event handling
+*/
+
+static DEVICE_ATTR(fw_version_receiver, 0444, corsair_void_report_firmware, NULL);
+static DEVICE_ATTR(fw_version_headset, 0444, corsair_void_report_firmware, NULL);
+static DEVICE_ATTR(microphone_up, 0444, corsair_void_report_mic_up, NULL);
+static DEVICE_ATTR(sidetone_max, 0444, corsair_void_report_sidetone_max, NULL);
+
+/* Write-only alert, as it only plays a sound (nothing to report back) */
+static DEVICE_ATTR(send_alert, 0200, NULL, corsair_void_send_alert);
+/* Write-only alert, as sidetone volume can't be queried */
+static DEVICE_ATTR(set_sidetone, 0200, NULL, corsair_void_send_sidetone);
+
+static struct attribute *corsair_void_attrs[] = {
+	&dev_attr_fw_version_receiver.attr,
+	&dev_attr_fw_version_headset.attr,
+	&dev_attr_microphone_up.attr,
+	&dev_attr_send_alert.attr,
+	&dev_attr_set_sidetone.attr,
+	&dev_attr_sidetone_max.attr,
+	NULL,
+};
+
+static const struct attribute_group corsair_void_attr_group = {
+	.attrs = corsair_void_attrs,
+};
+
+static int corsair_void_probe(struct hid_device *hid_dev,
+			      const struct hid_device_id *hid_id)
+{
+	int ret = 0;
+	struct corsair_void_drvdata *drvdata;
+	struct power_supply_config psy_cfg;
+	char *name;
+	int name_length;
+
+	if (!hid_is_usb(hid_dev))
+		return -EINVAL;
+
+	drvdata = devm_kzalloc(&hid_dev->dev, sizeof(struct corsair_void_drvdata),
+			       GFP_KERNEL);
+	if (!drvdata)
+		return -ENOMEM;
+
+	hid_set_drvdata(hid_dev, drvdata);
+	psy_cfg.drv_data = drvdata;
+	dev_set_drvdata(&hid_dev->dev, drvdata);
+
+	drvdata->dev = &hid_dev->dev;
+	drvdata->hid_dev = hid_dev;
+	drvdata->is_wired = hid_id->driver_data == CORSAIR_VOID_WIRED;
+
+	drvdata->sidetone_max = CORSAIR_VOID_SIDETONE_MAX_WIRELESS;
+	if (drvdata->is_wired)
+		drvdata->sidetone_max = CORSAIR_VOID_SIDETONE_MAX_WIRED;
+
+	/* Set initial values for no wireless headset attached */
+	/* If a headset is attached, it'll be prompted later */
+	corsair_void_set_unknown_wireless_data(drvdata);
+	corsair_void_set_unknown_batt(drvdata);
+
+	/* Receiver version won't be reset after init */
+	/* Headset version already set via set_unknown_wireless_data */
+	drvdata->fw_receiver_major = 0;
+	drvdata->fw_receiver_minor = 0;
+
+	ret = hid_parse(hid_dev);
+	if (ret) {
+		hid_err(hid_dev, "parse failed (reason: %d)\n", ret);
+		return ret;
+	}
+
+	name_length = snprintf(NULL, 0, "corsair-void-%d-battery", hid_dev->id);
+	name = devm_kzalloc(drvdata->dev, name_length + 1, GFP_KERNEL);
+	if (!name)
+		return -ENOMEM;
+	snprintf(name, name_length + 1, "corsair-void-%d-battery", hid_dev->id);
+
+	drvdata->battery_desc.name = name;
+	drvdata->battery_desc.type = POWER_SUPPLY_TYPE_BATTERY;
+	drvdata->battery_desc.properties = corsair_void_battery_props;
+	drvdata->battery_desc.num_properties = ARRAY_SIZE(corsair_void_battery_props);
+	drvdata->battery_desc.get_property = corsair_void_battery_get_property;
+
+	drvdata->battery = NULL;
+	INIT_WORK(&drvdata->battery_remove_work,
+		  corsair_void_battery_remove_work_handler);
+	INIT_WORK(&drvdata->battery_add_work,
+		  corsair_void_battery_add_work_handler);
+	ret = devm_mutex_init(drvdata->dev, &drvdata->battery_mutex);
+	if (ret)
+		return ret;
+
+	ret = sysfs_create_group(&hid_dev->dev.kobj, &corsair_void_attr_group);
+	if (ret)
+		return ret;
+
+	ret = hid_hw_start(hid_dev, HID_CONNECT_DEFAULT);
+	if (ret) {
+		hid_err(hid_dev, "hid_hw_start failed (reason: %d)\n", ret);
+		goto failed_after_sysfs;
+	}
+
+	/* Any failures after here should go to failed_after_hid_start */
+
+	/* Refresh battery data, in case wireless headset is already connected */
+	INIT_DELAYED_WORK(&drvdata->delayed_status_work,
+			  corsair_void_status_work_handler);
+	schedule_delayed_work(&drvdata->delayed_status_work,
+			      msecs_to_jiffies(100));
+
+	/* Refresh firmware versions */
+	INIT_DELAYED_WORK(&drvdata->delayed_firmware_work,
+			  corsair_void_firmware_work_handler);
+	schedule_delayed_work(&drvdata->delayed_firmware_work,
+			      msecs_to_jiffies(100));
+
+	goto success;
+
+/*failed_after_hid_start:
+	hid_hw_stop(hid_dev);*/
+failed_after_sysfs:
+	sysfs_remove_group(&hid_dev->dev.kobj, &corsair_void_attr_group);
+success:
+	return ret;
+}
+
+static void corsair_void_remove(struct hid_device *hid_dev)
+{
+	struct corsair_void_drvdata *drvdata = hid_get_drvdata(hid_dev);
+
+	hid_hw_stop(hid_dev);
+	cancel_work_sync(&drvdata->battery_remove_work);
+	cancel_work_sync(&drvdata->battery_add_work);
+	if (drvdata->battery)
+		power_supply_unregister(drvdata->battery);
+
+	cancel_delayed_work_sync(&drvdata->delayed_firmware_work);
+	sysfs_remove_group(&hid_dev->dev.kobj, &corsair_void_attr_group);
+}
+
+static int corsair_void_raw_event(struct hid_device *hid_dev,
+				  struct hid_report *hid_report,
+				  u8 *data, int size)
+{
+	struct corsair_void_drvdata *drvdata = hid_get_drvdata(hid_dev);
+	bool was_connected = drvdata->connected;
+
+	/* Description of packets are documented at the top of this file */
+	if (hid_report->id == CORSAIR_VOID_STATUS_REPORT_ID) {
+		drvdata->mic_up = FIELD_GET(CORSAIR_VOID_MIC_MASK, data[2]);
+		drvdata->connected = (data[3] == CORSAIR_VOID_WIRELESS_CONNECTED) ||
+				     drvdata->is_wired;
+
+		corsair_void_process_receiver(drvdata,
+					      FIELD_GET(CORSAIR_VOID_CAPACITY_MASK, data[2]),
+					      data[3], data[4]);
+	} else if (hid_report->id == CORSAIR_VOID_FIRMWARE_REPORT_ID) {
+		drvdata->fw_receiver_major = data[1];
+		drvdata->fw_receiver_minor = data[2];
+		drvdata->fw_headset_major = data[3];
+		drvdata->fw_headset_minor = data[4];
+	}
+
+	/* Handle wireless headset connect / disconnect */
+	if ((was_connected != drvdata->connected) && !drvdata->is_wired) {
+		if (drvdata->connected)
+			corsair_void_headset_connected(drvdata);
+		else
+			corsair_void_headset_disconnected(drvdata);
+	}
+
+	return 0;
+}
+
+static const struct hid_device_id corsair_void_devices[] = {
+	/* Corsair Void Wireless */
+	CORSAIR_VOID_WIRELESS_DEVICE(0x0a0c),
+	CORSAIR_VOID_WIRELESS_DEVICE(0x0a2b),
+	CORSAIR_VOID_WIRELESS_DEVICE(0x1b23),
+	CORSAIR_VOID_WIRELESS_DEVICE(0x1b25),
+	CORSAIR_VOID_WIRELESS_DEVICE(0x1b27),
+
+	/* Corsair Void USB */
+	CORSAIR_VOID_WIRED_DEVICE(0x0a0f),
+	CORSAIR_VOID_WIRED_DEVICE(0x1b1c),
+	CORSAIR_VOID_WIRED_DEVICE(0x1b29),
+	CORSAIR_VOID_WIRED_DEVICE(0x1b2a),
+
+	/* Corsair Void Surround */
+	CORSAIR_VOID_WIRED_DEVICE(0x0a30),
+	CORSAIR_VOID_WIRED_DEVICE(0x0a31),
+
+	/* Corsair Void Pro Wireless */
+	CORSAIR_VOID_WIRELESS_DEVICE(0x0a14),
+	CORSAIR_VOID_WIRELESS_DEVICE(0x0a16),
+	CORSAIR_VOID_WIRELESS_DEVICE(0x0a1a),
+
+	/* Corsair Void Pro USB */
+	CORSAIR_VOID_WIRED_DEVICE(0x0a17),
+	CORSAIR_VOID_WIRED_DEVICE(0x0a1d),
+
+	/* Corsair Void Pro Surround */
+	CORSAIR_VOID_WIRED_DEVICE(0x0a18),
+	CORSAIR_VOID_WIRED_DEVICE(0x0a1e),
+	CORSAIR_VOID_WIRED_DEVICE(0x0a1f),
+
+	/* Corsair Void Elite Wireless */
+	CORSAIR_VOID_WIRELESS_DEVICE(0x0a51),
+	CORSAIR_VOID_WIRELESS_DEVICE(0x0a55),
+	CORSAIR_VOID_WIRELESS_DEVICE(0x0a75),
+
+	/* Corsair Void Elite USB */
+	CORSAIR_VOID_WIRED_DEVICE(0x0a52),
+	CORSAIR_VOID_WIRED_DEVICE(0x0a56),
+
+	/* Corsair Void Elite Surround */
+	CORSAIR_VOID_WIRED_DEVICE(0x0a53),
+	CORSAIR_VOID_WIRED_DEVICE(0x0a57),
+
+	{}
+};
+
+MODULE_DEVICE_TABLE(hid, corsair_void_devices);
+
+static struct hid_driver corsair_void_driver = {
+	.name = "hid-corsair-void",
+	.id_table = corsair_void_devices,
+	.probe = corsair_void_probe,
+	.remove = corsair_void_remove,
+	.raw_event = corsair_void_raw_event,
+};
+
+module_hid_driver(corsair_void_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Stuart Hayhurst");
+MODULE_DESCRIPTION("HID driver for Corsair Void headsets");
-- 
2.45.2


