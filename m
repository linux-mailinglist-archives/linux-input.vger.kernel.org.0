Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2A5A28F415
	for <lists+linux-input@lfdr.de>; Thu, 15 Oct 2020 15:58:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730423AbgJON6D (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 15 Oct 2020 09:58:03 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.2]:51355 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730360AbgJON6C (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 15 Oct 2020 09:58:02 -0400
Received: from [100.112.1.102] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-2.bemta.az-b.us-east-1.aws.symcld.net id 2E/00-19530-865588F5; Thu, 15 Oct 2020 13:58:00 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrNIsWRWlGSWpSXmKPExsWSLveKTTcjtCP
  e4MELHotD5w4wWxxe9ILR4uu32+wWb45PZ7I4c3shk8XNT99YLVbvecHswO4xq6GXzWPnrLvs
  Hr+2rWHxWH5wGpPH+31X2Tw+b5ILYItizcxLyq9IYM34vmQZc0GbYsWLnzOZGxgPynQxcnEIC
  fxnlNjVe5EFwnnNKHGz/xtbFyMnB5uAtsSWLb+AbA4OEQEZiQ9rPUFqmAVuM0o839UAViMsYC
  7x/fc8FhCbRUBV4mjfDkYQm1fARmLFjg/sILaEgLzE097lzCA2p4CtxLuH11lBZgoJhEm83pQ
  OUS4ocXLmE7AxzEDlzVtnM0PYEhIHX7xghhnz98kTVgg7QWLZyzvMExgFZiFpn4WkfRaS9gWM
  zKsYzZKKMtMzSnITM3N0DQ0MdA0NjXQNdI2MjPQSq3ST9EqLdVMTi0t0DfUSy4v1iitzk3NS9
  PJSSzYxAuMkpYDh3g7GP68/6B1ilORgUhLljQ7qiBfiS8pPqcxILM6ILyrNSS0+xCjDwaEkwS
  seDJQTLEpNT61Iy8wBxixMWoKDR0mEtwUkzVtckJhbnJkOkTrFqCglzmsBkhAASWSU5sG1wdL
  EJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvMIgU3gy80rgpr8CWswEtNh+SQvI4pJEhJRU
  A1Odaf6UorNGizcuXsKpViZ7jS+KM21uO1thtN7VZouo3rWX/jrr/uBgnqbIOk2pr3TOR40z1
  31N9rDy137eV3z9iUo1X5Q9P/OxRU17bp15sK2j9vmdCTaaRbM5mzf2lPO6uKlvkbr84/3617
  zX/vhNb/vqZMsRYbzxfHhTlmXzh6hYu7hKJ4OeO8un7StXv5d2quNv9aS1imyiVQaMte8fxam
  v8O+Um+8nzfs4zOlGnbhO4xEZPUXrI7uOND+M9gx1CVf8eYsvOuJFYKiRbpH4ucM33hpUL5T4
  l3DFfPsH20vTe6bUci9jdftnfcZ0P+u9T4E6Ek6zvFu+iyc9OSWza4a1rJOt6Gd73ue/lFiKM
  xINtZiLihMB9pYSPY4DAAA=
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-34.tower-395.messagelabs.com!1602770278!95511!1
X-Originating-IP: [103.30.234.6]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20893 invoked from network); 15 Oct 2020 13:57:59 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.6)
  by server-34.tower-395.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Oct 2020 13:57:59 -0000
Received: from reswpmail04.lenovo.com (unknown [10.62.32.23])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id 2D13296B98AEF6E363C9;
        Thu, 15 Oct 2020 21:57:55 +0800 (CST)
Received: from localhost.localdomain.com (10.64.83.59) by
 reswpmail04.lenovo.com (10.62.32.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2044.4; Thu, 15 Oct 2020 06:57:53 -0700
From:   Mark Pearson <markpearson@lenovo.com>
To:     <markpearson@lenovo.com>
CC:     <njoshi1@lenovo.com>, <hdegoede@redhat.com>,
        <dmitry.torokhov@gmail.com>, <platform-driver-x86@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <jeff@labundy.com>,
        <anthony.wong@canonical.com>, <hadess@hadess.net>
Subject: [PATCH 2/3] Add support for Lenovo palm sensor
Date:   Thu, 15 Oct 2020 09:57:16 -0400
Message-ID: <20201015135717.384610-3-markpearson@lenovo.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201015135717.384610-1-markpearson@lenovo.com>
References: <markpearson@lenovo.com>
 <20201015135717.384610-1-markpearson@lenovo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.64.83.59]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail04.lenovo.com (10.62.32.23)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Use input device event support for palm sensor state changes.

Co-developed-by: Nitin Joshi <njoshi1@lenovo.com>
Signed-off-by: Nitin Joshi <njoshi1@lenovo.com>
Signed-off-by: Mark Pearson <markpearson@lenovo.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 99 +++++++++++++++++++++++++++-
 1 file changed, 97 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index eae3579f106f..5ddf2775fb06 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -4013,6 +4013,7 @@ static bool hotkey_notify_usrevent(const u32 hkey,
 }
 
 static void thermal_dump_all_sensors(void);
+static void proxsensor_refresh(void);
 
 static bool hotkey_notify_6xxx(const u32 hkey,
 				 bool *send_acpi_ev,
@@ -4079,8 +4080,8 @@ static bool hotkey_notify_6xxx(const u32 hkey,
 
 	case TP_HKEY_EV_PALM_DETECTED:
 	case TP_HKEY_EV_PALM_UNDETECTED:
-		/* palm detected hovering the keyboard, forward to user-space
-		 * via netlink for consumption */
+		/* palm detected  - pass on to event handler */
+		proxsensor_refresh();
 		return true;
 
 	default:
@@ -9918,6 +9919,96 @@ static struct ibm_struct dytc_driver_data = {
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
+bool palmsensor_state;
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
+static void proxsensor_refresh(void)
+{
+	bool new_state;
+	int err;
+
+	if (has_palmsensor) {
+		err = palmsensor_get(&has_palmsensor, &new_state);
+		if (err)
+			return;
+		if (new_state != palmsensor_state) {
+			input_report_switch(tpacpi_sw_dev, SW_PALMREST_PROXIMITY, new_state);
+			input_sync(tpacpi_sw_dev);
+			palmsensor_state = new_state;
+		}
+	}
+}
+
+static int tpacpi_proxsensor_init(struct ibm_init_struct *iibm)
+{
+	int palm_err;
+
+	palm_err = palmsensor_get(&has_palmsensor, &palmsensor_state);
+	/* If support isn't available (ENODEV) then don't return an error */
+	if (palm_err == -ENODEV)
+		return 0;
+	/* For all other errors we can flag the failure */
+	if (palm_err)
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
+		if (has_palmsensor) {
+			input_set_capability(tpacpi_sw_dev, EV_SW, SW_PALMREST_PROXIMITY);
+			input_report_switch(tpacpi_sw_dev, SW_PALMREST_PROXIMITY, palmsensor_state);
+		}
+		palm_err = input_register_device(tpacpi_sw_dev);
+		if (palm_err) {
+			input_free_device(tpacpi_sw_dev);
+			return palm_err;
+		}
+	}
+	return 0;
+}
+
+static void proxsensor_exit(void)
+{
+	input_unregister_device(tpacpi_sw_dev);
+	input_free_device(tpacpi_sw_dev);
+}
+
+static struct ibm_struct proxsensor_driver_data = {
+	.name = "proximity-sensor",
+	.exit = proxsensor_exit,
+};
 /****************************************************************************
  ****************************************************************************
  *
@@ -10411,6 +10502,10 @@ static struct ibm_init_struct ibms_init[] __initdata = {
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

