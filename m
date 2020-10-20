Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52AA7293248
	for <lists+linux-input@lfdr.de>; Tue, 20 Oct 2020 02:16:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389316AbgJTAQj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 19 Oct 2020 20:16:39 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.2]:61265 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727220AbgJTAQj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 19 Oct 2020 20:16:39 -0400
Received: from [100.112.1.203] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-2.bemta.az-b.us-east-1.aws.symcld.net id 6B/76-19530-56C2E8F5; Tue, 20 Oct 2020 00:16:37 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrFIsWRWlGSWpSXmKPExsWSLveKTTdFpy/
  eoHGhkcWhcweYLQ4vesFo8fXbbXaLN8enM1mcub2QyeLmp2+sFqv3vGB2YPeY1dDL5rFz1l12
  j1/b1rB4LD84jcnj/b6rbB6fN8kFsEWxZuYl5VcksGb8XtfBVNCpWrHlglYD4yz5LkYuDiGB/
  4wSCyddYIFw3jBKvFw8l62LkZODTUBbYsuWX0A2B4eIgIzEh7WeIDXMArcZJZ7vagCrERYIkz
  iwZzcziM0ioCpxufEhI4jNK2Ajse3CJiYQW0JAXuJp73JmkDmcArYSHxZ7g4SFgFqPH7nPDlE
  uKHFy5hMWEJsZqLx562xmCFtC4uCLF8wQYxQk3s69zwZhJ0gse3mHeQKjwCwk7bOQtM9C0r6A
  kXkVo1lSUWZ6RkluYmaOrqGBga6hoZGuka6hsaleYpVukl5psW5qYnGJrqFeYnmxXnFlbnJOi
  l5easkmRmCUpBQwte9gbH3zQe8QoyQHk5Io7xb1vnghvqT8lMqMxOKM+KLSnNTiQ4wyHBxKEr
  zS2kA5waLU9NSKtMwcYMTCpCU4eJREeHO0gNK8xQWJucWZ6RCpU4yKUuK8LzWBEgIgiYzSPLg
  2WJK4xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmY9zjIeJ7MvBK46a+AFjMBLbbt7wFZXJKI
  kJJqYPJJyO/5euZ1puQkVcaZps3X1GZ/aXAWZDz3VMZv70/brfvONKwRUZfu320cyt9Qf+zi1
  hpBBRV/xtmThBxm/9D/HeGun2sSsO75v+v6/75OLFz84n0bf42h8c3kLonZ6xeXXrsx8ff5XP
  an/LwtuyU+2u/KMFpfluD5Wjd9xuQMy235HCZhCkr2okLnvffUVgXmbi7uqOrNeyeur5uYvWW
  DQWPYpduXaizPl5yYek3mVEhEgWa4hZ3E08tfPsmIOrl//Di1Jivpj87Wz6fSNl0xu1K87LVg
  7Evt1J+KNp+r+37t3LlbiFljl5VNSVbnnyZZTuf/KtviLyfz6pp2b/trZL2IsVnrgJNR8smpS
  izFGYmGWsxFxYkAIPzOFI0DAAA=
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-29.tower-386.messagelabs.com!1603152994!280886!1
X-Originating-IP: [103.30.234.6]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8827 invoked from network); 20 Oct 2020 00:16:36 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.6)
  by server-29.tower-386.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Oct 2020 00:16:36 -0000
Received: from reswpmail04.lenovo.com (unknown [10.62.32.23])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id E3913BDF76B17A0CCB25;
        Tue, 20 Oct 2020 08:16:32 +0800 (CST)
Received: from localhost.localdomain.com (10.64.93.219) by
 reswpmail04.lenovo.com (10.62.32.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2044.4; Mon, 19 Oct 2020 17:16:28 -0700
From:   Mark Pearson <markpearson@lenovo.com>
To:     <markpearson@lenovo.com>
CC:     <njoshi1@lenovo.com>, <hdegoede@redhat.com>,
        <dmitry.torokhov@gmail.com>, <platform-driver-x86@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <jeff@labundy.com>,
        <anthony.wong@canonical.com>, <hadess@hadess.net>
Subject: [PATCH v2 3/3] platform/x86: thinkpad_acpi: Add support for Lenovo lap sensor
Date:   Mon, 19 Oct 2020 20:15:56 -0400
Message-ID: <20201020001556.388099-3-markpearson@lenovo.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201020001556.388099-1-markpearson@lenovo.com>
References: <markpearson@lenovo.com>
 <20201020001556.388099-1-markpearson@lenovo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.64.93.219]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail04.lenovo.com (10.62.32.23)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Use input device event support for notifying userspace of lap mode sensor
state changes.

Signed-off-by: Mark Pearson <markpearson@lenovo.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 75 ++++++++++++++++++++++------
 1 file changed, 59 insertions(+), 16 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 5ddf2775fb06..c20b9902270b 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -4013,7 +4013,7 @@ static bool hotkey_notify_usrevent(const u32 hkey,
 }
 
 static void thermal_dump_all_sensors(void);
-static void proxsensor_refresh(void);
+static void proxsensor_refresh(bool palm, bool lap);
 
 static bool hotkey_notify_6xxx(const u32 hkey,
 				 bool *send_acpi_ev,
@@ -4081,7 +4081,7 @@ static bool hotkey_notify_6xxx(const u32 hkey,
 	case TP_HKEY_EV_PALM_DETECTED:
 	case TP_HKEY_EV_PALM_UNDETECTED:
 		/* palm detected  - pass on to event handler */
-		proxsensor_refresh();
+		proxsensor_refresh(true /* palm */, false /* lap */);
 		return true;
 
 	default:
@@ -9929,6 +9929,23 @@ static struct ibm_struct dytc_driver_data = {
 struct input_dev *tpacpi_sw_dev;
 bool has_palmsensor;
 bool palmsensor_state;
+bool has_lapsensor;
+bool lapsensor_state;
+
+static int lapsensor_get(bool *present, bool *state)
+{
+	acpi_handle dytc_handle;
+	int output;
+
+	*present = false;
+	if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "DYTC", &dytc_handle)))
+		return -ENODEV;
+	if (!acpi_evalf(dytc_handle, &output, NULL, "dd", DYTC_CMD_GET))
+		return -EIO;
+	*present = true; /*If we get his far, we have lapmode support*/
+	*state = output & BIT(DYTC_GET_LAPMODE_BIT) ? true : false;
+	return 0;
+}
 
 static int palmsensor_get(bool *present, bool *state)
 {
@@ -9945,36 +9962,56 @@ static int palmsensor_get(bool *present, bool *state)
 	return 0;
 }
 
-static void proxsensor_refresh(void)
+static void proxsensor_refresh(bool palm, bool lap)
 {
 	bool new_state;
 	int err;
 
-	if (has_palmsensor) {
+	if (palm && has_palmsensor) {
 		err = palmsensor_get(&has_palmsensor, &new_state);
-		if (err)
-			return;
-		if (new_state != palmsensor_state) {
+		if (!err && (new_state != palmsensor_state)) {
 			input_report_switch(tpacpi_sw_dev, SW_PALMREST_PROXIMITY, new_state);
 			input_sync(tpacpi_sw_dev);
 			palmsensor_state = new_state;
 		}
 	}
+
+	if (lap && has_lapsensor) {
+		err = lapsensor_get(&has_lapsensor, &new_state);
+		if (!err && (new_state != lapsensor_state)) {
+			input_report_switch(tpacpi_sw_dev, SW_LAP_PROXIMITY, new_state);
+			input_sync(tpacpi_sw_dev);
+			lapsensor_state = new_state;
+		}
+	}
 }
 
 static int tpacpi_proxsensor_init(struct ibm_init_struct *iibm)
 {
-	int palm_err;
+	int palm_err, lap_err, err;
 
+	/* Make sure globals are set to a sensible initial value */
+	has_palmsensor = false;
+	has_lapsensor = false;
 	palm_err = palmsensor_get(&has_palmsensor, &palmsensor_state);
+	lap_err = lapsensor_get(&has_lapsensor, &lapsensor_state);
+
 	/* If support isn't available (ENODEV) then don't return an error */
-	if (palm_err == -ENODEV)
+	if ((palm_err == -ENODEV) && (lap_err == -ENODEV))
 		return 0;
-	/* For all other errors we can flag the failure */
+	/* If both sensors error out - return an error */
+	if (palm_err && lap_err)
+		return palm_err ? palm_err : lap_err;
+	/*
+	 * If just one sensor not available, we still want the input device,
+	 * so just flag it and carry on
+	 */
 	if (palm_err)
-		return palm_err;
+		pr_info("Palm sensor returned error %d", palm_err);
+	if (lap_err)
+		pr_info("Lap sensor returned error %d", lap_err);
 
-	if (has_palmsensor) {
+	if (has_palmsensor || has_lapsensor) {
 		tpacpi_sw_dev = input_allocate_device();
 		if (!tpacpi_sw_dev)
 			return -ENOMEM;
@@ -9990,10 +10027,14 @@ static int tpacpi_proxsensor_init(struct ibm_init_struct *iibm)
 			input_set_capability(tpacpi_sw_dev, EV_SW, SW_PALMREST_PROXIMITY);
 			input_report_switch(tpacpi_sw_dev, SW_PALMREST_PROXIMITY, palmsensor_state);
 		}
-		palm_err = input_register_device(tpacpi_sw_dev);
-		if (palm_err) {
+		if (has_lapsensor) {
+			input_set_capability(tpacpi_sw_dev, EV_SW, SW_LAP_PROXIMITY);
+			input_report_switch(tpacpi_sw_dev, SW_LAP_PROXIMITY, lapsensor_state);
+		}
+		err = input_register_device(tpacpi_sw_dev);
+		if (err) {
 			input_free_device(tpacpi_sw_dev);
-			return palm_err;
+			return err;
 		}
 	}
 	return 0;
@@ -10057,8 +10098,10 @@ static void tpacpi_driver_event(const unsigned int hkey_event)
 		mutex_unlock(&kbdlight_mutex);
 	}
 
-	if (hkey_event == TP_HKEY_EV_THM_CSM_COMPLETED)
+	if (hkey_event == TP_HKEY_EV_THM_CSM_COMPLETED) {
 		dytc_lapmode_refresh();
+		proxsensor_refresh(false /* palm */, true /* lap */);
+	}
 
 }
 
-- 
2.28.0

