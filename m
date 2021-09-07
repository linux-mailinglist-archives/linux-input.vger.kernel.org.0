Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B603402F6D
	for <lists+linux-input@lfdr.de>; Tue,  7 Sep 2021 22:13:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345488AbhIGUO3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Sep 2021 16:14:29 -0400
Received: from mail.bugwerft.de ([46.23.86.59]:37114 "EHLO mail.bugwerft.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1346356AbhIGUOX (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 7 Sep 2021 16:14:23 -0400
Received: from hq-00021.Speedport_W_724V_01011603_07_006 (p200300d83f0164a4ac70ae0545232a4f.dip0.t-ipconnect.de [IPv6:2003:d8:3f01:64a4:ac70:ae05:4523:2a4f])
        by mail.bugwerft.de (Postfix) with ESMTPSA id 02F3F32E70A;
        Tue,  7 Sep 2021 20:07:33 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     linux-input@vger.kernel.org
Cc:     dmitry.torokhov@gmail.com, m.felsch@pengutronix.de,
        Daniel Mack <daniel@zonque.org>
Subject: [PATCH v5 2/3] Input: ads7846: Remove custom filter handling functions from pdata
Date:   Tue,  7 Sep 2021 22:07:25 +0200
Message-Id: <20210907200726.2034962-3-daniel@zonque.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210907200726.2034962-1-daniel@zonque.org>
References: <20210907200726.2034962-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The functions in the platform data struct to initialize, cleanup and
apply custom filters are not in use by any mainline board.

Remove support for them to pave the road for more cleanups to come.

The enum was moved as it has no users outside of the driver code
itself.

Signed-off-by: Daniel Mack <daniel@zonque.org>
Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/input/touchscreen/ads7846.c | 25 ++++++++-----------------
 include/linux/spi/ads7846.h         | 15 ---------------
 2 files changed, 8 insertions(+), 32 deletions(-)

diff --git a/drivers/input/touchscreen/ads7846.c b/drivers/input/touchscreen/ads7846.c
index ce2e14816af5..b9c8496155b7 100644
--- a/drivers/input/touchscreen/ads7846.c
+++ b/drivers/input/touchscreen/ads7846.c
@@ -142,13 +142,18 @@ struct ads7846 {
 
 	int			(*filter)(void *data, int data_idx, int *val);
 	void			*filter_data;
-	void			(*filter_cleanup)(void *data);
 	int			(*get_pendown_state)(void);
 	int			gpio_pendown;
 
 	void			(*wait_for_sync)(void);
 };
 
+enum ads7846_filter {
+	ADS7846_FILTER_OK,
+	ADS7846_FILTER_REPEAT,
+	ADS7846_FILTER_IGNORE,
+};
+
 /* leave chip selected when we're done, for quicker re-select? */
 #if	0
 #define	CS_CHANGE(xfer)	((xfer).cs_change = 1)
@@ -1277,15 +1282,7 @@ static int ads7846_probe(struct spi_device *spi)
 	ts->x_plate_ohms = pdata->x_plate_ohms ? : 400;
 	ts->vref_mv = pdata->vref_mv;
 
-	if (pdata->filter != NULL) {
-		if (pdata->filter_init != NULL) {
-			err = pdata->filter_init(pdata, &ts->filter_data);
-			if (err < 0)
-				goto err_free_mem;
-		}
-		ts->filter = pdata->filter;
-		ts->filter_cleanup = pdata->filter_cleanup;
-	} else if (pdata->debounce_max) {
+	if (pdata->debounce_max) {
 		ts->debounce_max = pdata->debounce_max;
 		if (ts->debounce_max < 2)
 			ts->debounce_max = 2;
@@ -1299,7 +1296,7 @@ static int ads7846_probe(struct spi_device *spi)
 
 	err = ads7846_setup_pendown(spi, ts, pdata);
 	if (err)
-		goto err_cleanup_filter;
+		goto err_free_mem;
 
 	if (pdata->penirq_recheck_delay_usecs)
 		ts->penirq_recheck_delay_usecs =
@@ -1425,9 +1422,6 @@ static int ads7846_probe(struct spi_device *spi)
  err_free_gpio:
 	if (!ts->get_pendown_state)
 		gpio_free(ts->gpio_pendown);
- err_cleanup_filter:
-	if (ts->filter_cleanup)
-		ts->filter_cleanup(ts->filter_data);
  err_free_mem:
 	input_free_device(input_dev);
 	kfree(packet);
@@ -1458,9 +1452,6 @@ static int ads7846_remove(struct spi_device *spi)
 		gpio_free(ts->gpio_pendown);
 	}
 
-	if (ts->filter_cleanup)
-		ts->filter_cleanup(ts->filter_data);
-
 	kfree(ts->packet);
 	kfree(ts);
 
diff --git a/include/linux/spi/ads7846.h b/include/linux/spi/ads7846.h
index 1a5eaef3b7f2..d424c1aadf38 100644
--- a/include/linux/spi/ads7846.h
+++ b/include/linux/spi/ads7846.h
@@ -1,17 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /* linux/spi/ads7846.h */
 
-/* Touchscreen characteristics vary between boards and models.  The
- * platform_data for the device's "struct device" holds this information.
- *
- * It's OK if the min/max values are zero.
- */
-enum ads7846_filter {
-	ADS7846_FILTER_OK,
-	ADS7846_FILTER_REPEAT,
-	ADS7846_FILTER_IGNORE,
-};
-
 struct ads7846_platform_data {
 	u16	model;			/* 7843, 7845, 7846, 7873. */
 	u16	vref_delay_usecs;	/* 0 for external vref; etc */
@@ -51,10 +40,6 @@ struct ads7846_platform_data {
 	int	gpio_pendown_debounce;	/* platform specific debounce time for
 					 * the gpio_pendown */
 	int	(*get_pendown_state)(void);
-	int	(*filter_init)	(const struct ads7846_platform_data *pdata,
-				 void **filter_data);
-	int	(*filter)	(void *filter_data, int data_idx, int *val);
-	void	(*filter_cleanup)(void *filter_data);
 	void	(*wait_for_sync)(void);
 	bool	wakeup;
 	unsigned long irq_flags;
-- 
2.31.1

