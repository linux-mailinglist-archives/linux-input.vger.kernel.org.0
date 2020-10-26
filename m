Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E4EB298FDD
	for <lists+linux-input@lfdr.de>; Mon, 26 Oct 2020 15:49:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1782040AbgJZOtv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 26 Oct 2020 10:49:51 -0400
Received: from mail1.bemta24.messagelabs.com ([67.219.250.1]:54889 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1782039AbgJZOtu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 26 Oct 2020 10:49:50 -0400
Received: from [100.112.131.142] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-1.bemta.az-a.us-west-2.aws.symcld.net id BC/75-04725-C02E69F5; Mon, 26 Oct 2020 14:49:48 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrFIsWRWlGSWpSXmKPExsWSLveKTZfn0bR
  4g5/b2SwOnTvAbHF40QtGi6/fbrNbvDk+ncnizO2FTBY3P31jtVi95wWzA7vHrIZeNo+ds+6y
  e/zatobFY/nBaUwe7/ddZfP4vEkugC2KNTMvKb8igTVjx4V2loKzihXzfm9namD8INPFyMUhJ
  PCfUWLvwxtMXYwcQM4bRomDzl2MnBxsAtoSW7b8YgMJiwjISHxY6wlSzizwilFix8uvLCA1wg
  IBEnN2TQezWQRUJU6v+s8IYvMK2Eh0v1nNDGJLCMhLPO1dDmZzCthKzL4wG8wWEgiTmLB6GQt
  EvaDEyZlPwGxmoPrmrRA1zAISEgdfvGAGuUFCQEHiwRWokQkSy17eYZ7AKDALSfcsJN2zkHQv
  YGRexWieVJSZnlGSm5iZo2toYKBraGika2hkqWtsrJdYpZuoV1qsW55aXKJrpJdYXqxXXJmbn
  JOil5dasokRGCUpBY2KOxgvvP6gd4hRkoNJSZT32L5p8UJ8SfkplRmJxRnxRaU5qcWHGGU4OJ
  QkeEseAOUEi1LTUyvSMnOAEQuTluDgURLhXQ2S5i0uSMwtzkyHSJ1iVJQS5z0NkhAASWSU5sG
  1wZLEJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvL9ApvBk5pXATQdGGNDNIrxtFVNAFpck
  IqSkGpi4hd+95zsl7vSl5/SjRqHLh+amrbk56c/s+spz55/4c5xhtnylw3uj58hzkx5JH7td5
  fYvq7oPF3vZ1iv3RrvPvLC4fn5A2px1D5gnipU95Vx59JBCqvm55tgzeguv/GJw3jN327+EMC
  OFh59fTc/X5FDOCjb/2vLoa1z+rh159n8ZFfznztG8xlz/Q/+rveTyJ6FPUm6+jmE/ey1V5oL
  MqhkLhOInlSqd0uvMy2hLD/k7pS7q348PU76be75+Zf7K/PexLz90N1u8OPPijFbku3/++ZyB
  Hu90Hrf+Y3j0naEh8dqGPb8MFDp/MD70nNTvVdVnu2e7wsuqqIPvDrDs+DanoGWrm/Tv7ENOq
  uablViKMxINtZiLihMB8QS5ao0DAAA=
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-16.tower-336.messagelabs.com!1603723786!238994!1
X-Originating-IP: [103.30.234.6]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22717 invoked from network); 26 Oct 2020 14:49:47 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.6)
  by server-16.tower-336.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 26 Oct 2020 14:49:47 -0000
Received: from reswpmail04.lenovo.com (unknown [10.62.32.23])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id 1A278C3312EAE9B7A35B;
        Mon, 26 Oct 2020 22:49:43 +0800 (CST)
Received: from localhost.localdomain.com (10.64.83.193) by
 reswpmail04.lenovo.com (10.62.32.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2044.4; Mon, 26 Oct 2020 07:49:39 -0700
From:   Mark Pearson <markpearson@lenovo.com>
To:     <markpearson@lenovo.com>
CC:     <dmitry.torokhov@gmail.com>, <hdegoede@redhat.com>,
        <platform-driver-x86@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <jeff@labundy.com>,
        <anthony.wong@canonical.com>, <hadess@hadess.net>,
        "Nitin Joshi" <njoshi1@lenovo.com>
Subject: [PATCH v3 2/3] platform/x86: thinkpad_acpi: Add support for palm sensor
Date:   Mon, 26 Oct 2020 10:45:11 -0400
Message-ID: <20201026144512.621479-2-markpearson@lenovo.com>
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

Use input device event support for notifying userspace of palm sensor
state changes

Co-developed-by: Nitin Joshi <njoshi1@lenovo.com>
Signed-off-by: Nitin Joshi <njoshi1@lenovo.com>
Signed-off-by: Mark Pearson <markpearson@lenovo.com>
---
Changes in V2:
 - Update commit message to be correct

Changes in V3:
 - remove unnecessary global state variable
 - clean up error handling code
 - set dangling pointer to null

 drivers/platform/x86/thinkpad_acpi.c | 95 +++++++++++++++++++++++++++-
 1 file changed, 93 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index eae3579f106f..3cb07c12a705 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -4013,6 +4013,7 @@ static bool hotkey_notify_usrevent(const u32 hkey,
 }
 
 static void thermal_dump_all_sensors(void);
+static void palmsensor_refresh(void);
 
 static bool hotkey_notify_6xxx(const u32 hkey,
 				 bool *send_acpi_ev,
@@ -4079,8 +4080,8 @@ static bool hotkey_notify_6xxx(const u32 hkey,
 
 	case TP_HKEY_EV_PALM_DETECTED:
 	case TP_HKEY_EV_PALM_UNDETECTED:
-		/* palm detected hovering the keyboard, forward to user-space
-		 * via netlink for consumption */
+		/* palm detected  - pass on to event handler */
+		palmsensor_refresh();
 		return true;
 
 	default:
@@ -9918,6 +9919,92 @@ static struct ibm_struct dytc_driver_data = {
 	.exit = dytc_exit,
 };
 
+/*************************************************************************
+ * Proximity sensor subdriver
+ */
+
+#define PALMSENSOR_PRESENT_BIT 0 /* Determine if psensor present */
+#define PALMSENSOR_ON_BIT      1 /* psensor status */
+
+struct input_dev *tpacpi_sw_dev;
+bool has_palmsensor;
+
+static int palmsensor_get(bool *present, bool *state)
+{
+	acpi_handle psensor_handle;
+	int output;
+
+	if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "GPSS", &psensor_handle)))
+		return -ENODEV;
+	if (!acpi_evalf(psensor_handle, &output, NULL, "d"))
+		return -EIO;
+
+	*present = output & BIT(PALMSENSOR_PRESENT_BIT) ? true : false;
+	*state = output & BIT(PALMSENSOR_ON_BIT) ? true : false;
+	return 0;
+}
+
+static void palmsensor_refresh(void)
+{
+	bool state;
+	int err;
+
+	if (has_palmsensor) {
+		err = palmsensor_get(&has_palmsensor, &state);
+		if (err)
+			return;
+		input_report_switch(tpacpi_sw_dev, SW_PALMREST_PROXIMITY, state);
+		input_sync(tpacpi_sw_dev);
+	}
+}
+
+static int tpacpi_proxsensor_init(struct ibm_init_struct *iibm)
+{
+	int palm_err, err;
+	bool palm_state;
+
+	palm_err = palmsensor_get(&has_palmsensor, &palm_state);
+	/* If support isn't available (ENODEV) then quit, but don't return an error */
+	if (palm_err == -ENODEV)
+		return 1;
+
+	/* Otherwise, if there was an error return it */
+	if (palm_err && (palm_err != ENODEV))
+		return palm_err;
+
+	if (has_palmsensor) {
+		tpacpi_sw_dev = input_allocate_device();
+		if (!tpacpi_sw_dev)
+			return -ENOMEM;
+		tpacpi_sw_dev->name = "Thinkpad proximity switches";
+		tpacpi_sw_dev->phys = TPACPI_DRVR_NAME "/input1";
+		tpacpi_sw_dev->id.bustype = BUS_HOST;
+		tpacpi_sw_dev->id.vendor = thinkpad_id.vendor;
+		tpacpi_sw_dev->id.product = TPACPI_HKEY_INPUT_PRODUCT;
+		tpacpi_sw_dev->id.version = TPACPI_HKEY_INPUT_VERSION;
+		tpacpi_sw_dev->dev.parent = &tpacpi_pdev->dev;
+
+		input_set_capability(tpacpi_sw_dev, EV_SW, SW_PALMREST_PROXIMITY);
+		input_report_switch(tpacpi_sw_dev, SW_PALMREST_PROXIMITY, palm_state);
+		err = input_register_device(tpacpi_sw_dev);
+		if (err) {
+			input_free_device(tpacpi_sw_dev);
+			tpacpi_sw_dev = NULL;
+			return 0;
+		}
+	}
+	return 1;
+}
+
+static void proxsensor_exit(void)
+{
+	input_unregister_device(tpacpi_sw_dev);
+}
+
+static struct ibm_struct proxsensor_driver_data = {
+	.name = "proximity-sensor",
+	.exit = proxsensor_exit,
+};
 /****************************************************************************
  ****************************************************************************
  *
@@ -10411,6 +10498,10 @@ static struct ibm_init_struct ibms_init[] __initdata = {
 		.init = tpacpi_dytc_init,
 		.data = &dytc_driver_data,
 	},
+	{
+		.init = tpacpi_proxsensor_init,
+		.data = &proxsensor_driver_data,
+	},
 };
 
 static int __init set_ibm_param(const char *val, const struct kernel_param *kp)
-- 
2.28.0

