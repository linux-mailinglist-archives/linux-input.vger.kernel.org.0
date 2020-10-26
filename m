Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CC1B298FDF
	for <lists+linux-input@lfdr.de>; Mon, 26 Oct 2020 15:49:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1782043AbgJZOtx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 26 Oct 2020 10:49:53 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.3]:51819 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1782039AbgJZOtx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 26 Oct 2020 10:49:53 -0400
Received: from [100.112.3.43] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-3.bemta.az-b.us-east-1.aws.symcld.net id ED/98-43594-E02E69F5; Mon, 26 Oct 2020 14:49:50 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrFIsWRWlGSWpSXmKPExsWSLveKTZfv0bR
  4g/adKhaHzh1gtji86AWjxddvt9kt3hyfzmRx5vZCJoubn76xWqze84LZgd1jVkMvm8fOWXfZ
  PX5tW8PisfzgNCaP9/uusnl83iQXwBbFmpmXlF+RwJpxaf5u5oL/MhXdO2cxNjDekOhi5OIQE
  vjPKNH8ZyUThPOGUaKx/SJ7FyMnB5uAtsSWLb/Yuhg5OEQEZCQ+rPUEqWEWeMUosePlVxaQGm
  EBf4lD+3uZQGwWAVWJ4+t/MYLYvAI2EpeWPQabIyEgL/G0dzkziM0pYCsx+8JsMFtIIExiwup
  lLBD1ghInZz4Bs5mB6pu3QtQwC0hIHHzxghnkBgkBBYkHV5ghRiZILHt5h3kCo8AsJN2zkHTP
  QtK9gJF5FaNpUlFmekZJbmJmjq6hgYGuoaGRrpGumaVeYpVukl5psW5qYnGJrqFeYnmxXnFlb
  nJOil5easkmRmCUpBQwue5g/P36g94hRkkOJiVR3mP7psUL8SXlp1RmJBZnxBeV5qQWH2KU4e
  BQkuAteQCUEyxKTU+tSMvMAUYsTFqCg0dJhHc1SJq3uCAxtzgzHSJ1ilFRSpz3NEhCACSRUZo
  H1wZLEpcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfP+ApnCk5lXAjcdGF1AN4vwtlVMAVlc
  koiQkmpgatjuHfrrc9e3oKedrdWijwUdJR5t7vmWfHvr/LiyZZ++mbx407dXeqlxqL9Xg9riz
  91m6scfqUy5rpEuVc7zxPG9UGfCrgr2u4pW/g3ZJ/5efrrV+vL3iKzeLwVHS+Y3eilbf9m2gC
  2o8eApxxwlxm1L9cs37D1StDR+LW/x03zOz1Jc/4x9/+1de+Gp5S7Bd69uhHfM173Qs3wXwxN
  fyVlTVhp+1bl4zcG1MmfH94Bj1d/UjojlLnayEb5SsnLxusbbMyazHFP8slPX2bn12ftkLVlZ
  l1UPk+KDuDNiaxPTeHYwbtL74PeLP2mWmmlE4zOJt4YJhz85TG8x6ZvpskmR0/2M3+yOSN6nd
  +c7KbEUZyQaajEXFScCAKr3KKGNAwAA
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-16.tower-395.messagelabs.com!1603723787!862649!1
X-Originating-IP: [103.30.234.6]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12103 invoked from network); 26 Oct 2020 14:49:50 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.6)
  by server-16.tower-395.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 26 Oct 2020 14:49:50 -0000
Received: from reswpmail04.lenovo.com (unknown [10.62.32.23])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id 01A5D85408E67CAF4860;
        Mon, 26 Oct 2020 22:49:45 +0800 (CST)
Received: from localhost.localdomain.com (10.64.83.193) by
 reswpmail04.lenovo.com (10.62.32.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2044.4; Mon, 26 Oct 2020 07:49:42 -0700
From:   Mark Pearson <markpearson@lenovo.com>
To:     <markpearson@lenovo.com>
CC:     <dmitry.torokhov@gmail.com>, <hdegoede@redhat.com>,
        <platform-driver-x86@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <jeff@labundy.com>,
        <anthony.wong@canonical.com>, <hadess@hadess.net>,
        "Nitin Joshi" <njoshi1@lenovo.com>
Subject: [PATCH v3 3/3] platform/x86: thinkpad_acpi: Add support for lap sensor
Date:   Mon, 26 Oct 2020 10:45:12 -0400
Message-ID: <20201026144512.621479-3-markpearson@lenovo.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201026144512.621479-1-markpearson@lenovo.com>
References: <markpearson@lenovo.com>
 <20201026144512.621479-1-markpearson@lenovo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.64.83.193]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail04.lenovo.com (10.62.32.23)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Use input device event support for notifying userspace of lap mode sensor
state changes.

Reviewed-by: Nitin Joshi <njoshi1@lenovo.com>
Signed-off-by: Mark Pearson <markpearson@lenovo.com>
---
Changes in V2:
 - Update commit message to be correct

Changes in V3:
 - Update lap sensor code with same fixes applied to palm sensor code.
 - Correct error handling in init so returns an error if one
   encountered.

 drivers/platform/x86/thinkpad_acpi.c | 61 ++++++++++++++++++++++++----
 1 file changed, 52 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 3cb07c12a705..fe438a5e1dbe 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -9928,6 +9928,22 @@ static struct ibm_struct dytc_driver_data = {
 
 struct input_dev *tpacpi_sw_dev;
 bool has_palmsensor;
+bool has_lapsensor;
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
@@ -9958,21 +9974,40 @@ static void palmsensor_refresh(void)
 	}
 }
 
+static void lapsensor_refresh(void)
+{
+	bool state;
+	int err;
+
+	if (has_lapsensor) {
+		err = lapsensor_get(&has_lapsensor, &state);
+		if (err)
+			return;
+		input_report_switch(tpacpi_sw_dev, SW_LAP_PROXIMITY, state);
+		input_sync(tpacpi_sw_dev);
+	}
+}
+
 static int tpacpi_proxsensor_init(struct ibm_init_struct *iibm)
 {
-	int palm_err, err;
-	bool palm_state;
+	int palm_err, lap_err, err;
+	bool palm_state, lap_state;
 
 	palm_err = palmsensor_get(&has_palmsensor, &palm_state);
-	/* If support isn't available (ENODEV) then quit, but don't return an error */
-	if (palm_err == -ENODEV)
+	lap_err = lapsensor_get(&has_lapsensor, &lap_state);
+	/*
+	 * If support isn't available (ENODEV) for both devices then quit, but
+	 * don't return an error.
+	 */
+	if ((palm_err == -ENODEV) && (lap_err == -ENODEV))
 		return 1;
-
 	/* Otherwise, if there was an error return it */
 	if (palm_err && (palm_err != ENODEV))
 		return palm_err;
+	if (lap_err && (lap_err != ENODEV))
+		return lap_err;
 
-	if (has_palmsensor) {
+	if (has_palmsensor || has_lapsensor) {
 		tpacpi_sw_dev = input_allocate_device();
 		if (!tpacpi_sw_dev)
 			return -ENOMEM;
@@ -9984,8 +10019,14 @@ static int tpacpi_proxsensor_init(struct ibm_init_struct *iibm)
 		tpacpi_sw_dev->id.version = TPACPI_HKEY_INPUT_VERSION;
 		tpacpi_sw_dev->dev.parent = &tpacpi_pdev->dev;
 
-		input_set_capability(tpacpi_sw_dev, EV_SW, SW_PALMREST_PROXIMITY);
-		input_report_switch(tpacpi_sw_dev, SW_PALMREST_PROXIMITY, palm_state);
+		if (has_palmsensor) {
+			input_set_capability(tpacpi_sw_dev, EV_SW, SW_PALMREST_PROXIMITY);
+			input_report_switch(tpacpi_sw_dev, SW_PALMREST_PROXIMITY, palm_state);
+		}
+		if (has_lapsensor) {
+			input_set_capability(tpacpi_sw_dev, EV_SW, SW_LAP_PROXIMITY);
+			input_report_switch(tpacpi_sw_dev, SW_LAP_PROXIMITY, lap_state);
+		}
 		err = input_register_device(tpacpi_sw_dev);
 		if (err) {
 			input_free_device(tpacpi_sw_dev);
@@ -10053,8 +10094,10 @@ static void tpacpi_driver_event(const unsigned int hkey_event)
 		mutex_unlock(&kbdlight_mutex);
 	}
 
-	if (hkey_event == TP_HKEY_EV_THM_CSM_COMPLETED)
+	if (hkey_event == TP_HKEY_EV_THM_CSM_COMPLETED) {
 		dytc_lapmode_refresh();
+		lapsensor_refresh();
+	}
 
 }
 
-- 
2.28.0

