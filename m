Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B6AA17822F
	for <lists+linux-input@lfdr.de>; Tue,  3 Mar 2020 20:03:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732284AbgCCSJW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Mar 2020 13:09:22 -0500
Received: from mga18.intel.com ([134.134.136.126]:24363 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732643AbgCCSJV (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 3 Mar 2020 13:09:21 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Mar 2020 10:09:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,511,1574150400"; 
   d="scan'208";a="274315512"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 03 Mar 2020 10:09:19 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id A0C29321; Tue,  3 Mar 2020 20:09:18 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 5/5] Input: edt-ft5x06 - allocate buffer once for debugging
Date:   Tue,  3 Mar 2020 20:09:17 +0200
Message-Id: <20200303180917.12563-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200303180917.12563-1-andriy.shevchenko@linux.intel.com>
References: <20200303180917.12563-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

There is no need to allocate buffer each time we switch modes. First of all,
the code is protected by checking the factory_mode state. The size of the
buffer is static and can't be changed after ->probe() anyway.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/input/touchscreen/edt-ft5x06.c | 23 +++++++----------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index 1023d4134b8d..3895e194006a 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -544,16 +544,6 @@ static int edt_ft5x06_factory_mode(struct edt_ft5x06_ts_data *tsdata)
 
 	disable_irq(client->irq);
 
-	if (!tsdata->raw_buffer) {
-		tsdata->raw_bufsize = tsdata->num_x * tsdata->num_y *
-				      sizeof(u16);
-		tsdata->raw_buffer = kzalloc(tsdata->raw_bufsize, GFP_KERNEL);
-		if (!tsdata->raw_buffer) {
-			error = -ENOMEM;
-			goto err_out;
-		}
-	}
-
 	/* mode register is 0x3c when in the work mode */
 	error = edt_ft5x06_register_write(tsdata, WORK_REGISTER_OPMODE, 0x03);
 	if (error) {
@@ -581,8 +571,6 @@ static int edt_ft5x06_factory_mode(struct edt_ft5x06_ts_data *tsdata)
 	return 0;
 
 err_out:
-	kfree(tsdata->raw_buffer);
-	tsdata->raw_buffer = NULL;
 	tsdata->factory_mode = false;
 	enable_irq(client->irq);
 
@@ -622,9 +610,6 @@ static int edt_ft5x06_work_mode(struct edt_ft5x06_ts_data *tsdata)
 		return -EIO;
 	}
 
-	kfree(tsdata->raw_buffer);
-	tsdata->raw_buffer = NULL;
-
 	/* restore parameters */
 	edt_ft5x06_register_write(tsdata, reg_addr->reg_threshold,
 				  tsdata->threshold);
@@ -697,7 +682,7 @@ static ssize_t edt_ft5x06_debugfs_raw_data_read(struct file *file,
 
 	mutex_lock(&tsdata->mutex);
 
-	if (!tsdata->factory_mode || !tsdata->raw_buffer) {
+	if (!tsdata->factory_mode) {
 		error = -EIO;
 		goto out;
 	}
@@ -774,6 +759,12 @@ edt_ft5x06_ts_prepare_debugfs(struct edt_ft5x06_ts_data *tsdata,
 
 	debugfs_create_file("mode", S_IRUSR | S_IWUSR,
 			    tsdata->debug_dir, tsdata, &debugfs_mode_fops);
+
+	tsdata->raw_bufsize = tsdata->num_x * tsdata->num_y * sizeof(u16);
+	tsdata->raw_buffer = kzalloc(tsdata->raw_bufsize, GFP_KERNEL);
+	if (!tsdata->raw_buffer)
+		return;
+
 	debugfs_create_file("raw_data", S_IRUSR,
 			    tsdata->debug_dir, tsdata, &debugfs_raw_data_fops);
 }
-- 
2.25.1

