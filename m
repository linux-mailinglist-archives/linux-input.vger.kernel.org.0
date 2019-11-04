Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65E97EDDD8
	for <lists+linux-input@lfdr.de>; Mon,  4 Nov 2019 12:44:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726441AbfKDLoz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 Nov 2019 06:44:55 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:41617 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728502AbfKDLoz (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 4 Nov 2019 06:44:55 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1iRan0-0006tb-78; Mon, 04 Nov 2019 12:44:54 +0100
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, patchwork-lst@pengutronix.de,
        kernel@pengutronix.de
Subject: [PATCH resend 3/3] Input: synaptics-rmi4 - simplify data read in rmi_f54_work
Date:   Mon,  4 Nov 2019 12:44:54 +0100
Message-Id: <20191104114454.10500-3-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191104114454.10500-1-l.stach@pengutronix.de>
References: <20191104114454.10500-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The body of the for loop is only ever run once as the second standard_report
element is never changed from its initial zero init, so the loop condition is
never satisfies after the first run. Equally the start member of the first
element is never changed from 0, so the index offset is always a constant 0.

Remove this needless obfuscation of the code and write it in a straight
forward manner.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/input/rmi4/rmi_f54.c | 48 ++++++++++++------------------------
 1 file changed, 16 insertions(+), 32 deletions(-)

diff --git a/drivers/input/rmi4/rmi_f54.c b/drivers/input/rmi4/rmi_f54.c
index 22390e89c680..5b1799bdfb62 100644
--- a/drivers/input/rmi4/rmi_f54.c
+++ b/drivers/input/rmi4/rmi_f54.c
@@ -81,11 +81,6 @@ static const char * const rmi_f54_report_type_names[] = {
 					= "Full Raw Capacitance RX Offset Removed",
 };
 
-struct rmi_f54_reports {
-	int start;
-	int size;
-};
-
 struct f54_data {
 	struct rmi_function *fn;
 
@@ -98,7 +93,6 @@ struct f54_data {
 	enum rmi_f54_report_type report_type;
 	u8 *report_data;
 	int report_size;
-	struct rmi_f54_reports standard_report[2];
 
 	bool is_busy;
 	struct mutex status_mutex;
@@ -516,13 +510,10 @@ static void rmi_f54_work(struct work_struct *work)
 	struct f54_data *f54 = container_of(work, struct f54_data, work.work);
 	struct rmi_function *fn = f54->fn;
 	u8 fifo[2];
-	struct rmi_f54_reports *report;
 	int report_size;
 	u8 command;
-	u8 *data;
 	int error;
 
-	data = f54->report_data;
 	report_size = rmi_f54_get_report_size(f54);
 	if (report_size == 0) {
 		dev_err(&fn->dev, "Bad report size, report type=%d\n",
@@ -530,8 +521,6 @@ static void rmi_f54_work(struct work_struct *work)
 		error = -EINVAL;
 		goto error;     /* retry won't help */
 	}
-	f54->standard_report[0].size = report_size;
-	report = f54->standard_report;
 
 	mutex_lock(&f54->data_mutex);
 
@@ -556,28 +545,23 @@ static void rmi_f54_work(struct work_struct *work)
 
 	rmi_dbg(RMI_DEBUG_FN, &fn->dev, "Get report command completed, reading data\n");
 
-	report_size = 0;
-	for (; report->size; report++) {
-		fifo[0] = report->start & 0xff;
-		fifo[1] = (report->start >> 8) & 0xff;
-		error = rmi_write_block(fn->rmi_dev,
-					fn->fd.data_base_addr + F54_FIFO_OFFSET,
-					fifo, sizeof(fifo));
-		if (error) {
-			dev_err(&fn->dev, "Failed to set fifo start offset\n");
-			goto abort;
-		}
+	fifo[0] = 0;
+	fifo[1] = 0;
+	error = rmi_write_block(fn->rmi_dev,
+				fn->fd.data_base_addr + F54_FIFO_OFFSET,
+				fifo, sizeof(fifo));
+	if (error) {
+		dev_err(&fn->dev, "Failed to set fifo start offset\n");
+		goto abort;
+	}
 
-		error = rmi_read_block(fn->rmi_dev, fn->fd.data_base_addr +
-				       F54_REPORT_DATA_OFFSET, data,
-				       report->size);
-		if (error) {
-			dev_err(&fn->dev, "%s: read [%d bytes] returned %d\n",
-				__func__, report->size, error);
-			goto abort;
-		}
-		data += report->size;
-		report_size += report->size;
+	error = rmi_read_block(fn->rmi_dev, fn->fd.data_base_addr +
+			       F54_REPORT_DATA_OFFSET, f54->report_data,
+			       report_size);
+	if (error) {
+		dev_err(&fn->dev, "%s: read [%d bytes] returned %d\n",
+			__func__, report_size, error);
+		goto abort;
 	}
 
 abort:
-- 
2.20.1

