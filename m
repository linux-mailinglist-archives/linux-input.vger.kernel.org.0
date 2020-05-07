Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ED791C8266
	for <lists+linux-input@lfdr.de>; Thu,  7 May 2020 08:20:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725953AbgEGGU3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 May 2020 02:20:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726134AbgEGGU2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 7 May 2020 02:20:28 -0400
Received: from mail.bugwerft.de (mail.bugwerft.de [IPv6:2a03:6000:1011::59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 795C0C061A41
        for <linux-input@vger.kernel.org>; Wed,  6 May 2020 23:20:28 -0700 (PDT)
Received: from zenbar.fritz.box (pD95EF2E9.dip0.t-ipconnect.de [217.94.242.233])
        by mail.bugwerft.de (Postfix) with ESMTPSA id 908DB40554D;
        Thu,  7 May 2020 06:17:45 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     linux-input@vger.kernel.org
Cc:     dmitry.torokhov@gmail.com, m.felsch@pengutronix.de,
        Daniel Mack <daniel@zonque.org>
Subject: [PATCH v3 2/3] Input: ads7846: Remove custom filter handling functions from pdata
Date:   Thu,  7 May 2020 08:20:13 +0200
Message-Id: <20200507062014.1780360-4-daniel@zonque.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200507062014.1780360-1-daniel@zonque.org>
References: <20200507062014.1780360-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The functions in the platform data struct to initialize, cleanup and
apply custom filters are not in use by any mainline board.

Remove support for them to pave the road for more cleanups to come.

The enum was moved as it has no users outside of the driver code
itself.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 drivers/input/touchscreen/ads7846.c | 25 ++++++++-----------------
 include/linux/spi/ads7846.h         | 15 ---------------
 2 files changed, 8 insertions(+), 32 deletions(-)

diff --git a/drivers/input/touchscreen/ads7846.c b/drivers/input/touchscreen/ads7846.c
index 0fd0037ef226..4635e8867d10 100644
--- a/drivers/input/touchscreen/ads7846.c
+++ b/drivers/input/touchscreen/ads7846.c
@@ -139,13 +139,18 @@ struct ads7846 {
 
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
@@ -1325,15 +1330,7 @@ static int ads7846_probe(struct spi_device *spi)
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
@@ -1347,7 +1344,7 @@ static int ads7846_probe(struct spi_device *spi)
 
 	err = ads7846_setup_pendown(spi, ts, pdata);
 	if (err)
-		goto err_cleanup_filter;
+		goto err_free_mem;
 
 	if (pdata->penirq_recheck_delay_usecs)
 		ts->penirq_recheck_delay_usecs =
@@ -1473,9 +1470,6 @@ static int ads7846_probe(struct spi_device *spi)
  err_free_gpio:
 	if (!ts->get_pendown_state)
 		gpio_free(ts->gpio_pendown);
- err_cleanup_filter:
-	if (ts->filter_cleanup)
-		ts->filter_cleanup(ts->filter_data);
  err_free_mem:
 	input_free_device(input_dev);
 	kfree(packet);
@@ -1506,9 +1500,6 @@ static int ads7846_remove(struct spi_device *spi)
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
2.26.2

