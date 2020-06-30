Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29CFB20EA8A
	for <lists+linux-input@lfdr.de>; Tue, 30 Jun 2020 02:58:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726087AbgF3A5S (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 29 Jun 2020 20:57:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725998AbgF3A5S (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 29 Jun 2020 20:57:18 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7FDFC03E979
        for <linux-input@vger.kernel.org>; Mon, 29 Jun 2020 17:57:17 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id h22so8752682pjf.1
        for <linux-input@vger.kernel.org>; Mon, 29 Jun 2020 17:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NeFvl6iJeeHf87XNSUTsRy0UAvKm2bIY45kmfTiQtuI=;
        b=O+qDhqp/9Z2C6la+HAURaKHJPO36NUGeQF/9Hch0nhYEfSMvLO07Qw7klPURSJEeOO
         dYLCsFV4aqtI89Cx6vOLLeGR1WaptX+zc45XrmOsoTaqLQpC8lzqW2NptyvATmcPrFEm
         hrMdn5IaZzALNyVub1B61JYK/T1QAh4ShI2m0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NeFvl6iJeeHf87XNSUTsRy0UAvKm2bIY45kmfTiQtuI=;
        b=Qa8DymIKnxkiAk4hwB/9umm5wegSzjCfkKlsasr7QbWrJXtrJRHbLghE3Xep8CVHJJ
         BMVCqnUKMoMe/bqPeNdjr0Hzc9DY5YWyWgirXTHOhWEQMDrwUfCuJBUhtdq3Wl+E6yBS
         PkVF8xIuDdLJR6h6JXwgYdyW0P6fh6NQqQe9BoXwd6OxTwA2KDngBgavuWLGkFU/ccWx
         ePa4+nFOhk23zQkw2jgQp4xHKG14d/CpR3kmoJ+fpoX3tZmgvtmjGExnY/ZiBSpo0NF3
         CkPF79no+zmixk5vye3nSSVmBGaUqF0pP+UQQpEiP3O2BshVmg0mxHZIpmALs+evZ9Lr
         VZBw==
X-Gm-Message-State: AOAM533XfiJZN+pKxV3k5VQhE20SJ9sP2A0LNQhMmOYxokzQGp7dYleV
        wu8jOgsZiO92EXwQGCl1wbDsMT+Co1o=
X-Google-Smtp-Source: ABdhPJwropla7RJtZU3BGPtU4mxVdm1eWSzK3VwHZ8tH//98aeELhkJ2WuDiBwW1hFKj6t+qsxtHKA==
X-Received: by 2002:a17:902:fe11:: with SMTP id g17mr15242772plj.145.1593478637408;
        Mon, 29 Jun 2020 17:57:17 -0700 (PDT)
Received: from exogeni.mtv.corp.google.com ([2620:15c:202:1:5be8:f2a6:fd7b:7459])
        by smtp.gmail.com with ESMTPSA id x7sm715732pfq.197.2020.06.29.17.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 17:57:16 -0700 (PDT)
From:   Derek Basehore <dbasehore@chromium.org>
Cc:     dmitry.torokhov@gmail.com, dbasehore@chromium.org,
        jiada_wang@mentor.com, jeffrey.l.hugo@gmail.com,
        benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Input: elan_i2c - only increment wakeup count on touch
Date:   Mon, 29 Jun 2020 17:57:07 -0700
Message-Id: <20200630005707.2181126-1-dbasehore@chromium.org>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This moves the wakeup increment for elan devices to the touch report.
This prevents the drivers from incorrectly reporting a wakeup when the
resume callback resets then device, which causes an interrupt to
occur. This also avoids error messages when these interrupts occur,
since this behavior is expected.

Signed-off-by: Derek Basehore <dbasehore@chromium.org>
---
 drivers/input/mouse/elan_i2c_core.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index cdbe6b38c73c1..6ad53a75f9807 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -49,6 +49,7 @@
 
 #define ETP_MAX_FINGERS		5
 #define ETP_FINGER_DATA_LEN	5
+#define ETP_REPORT_LEN_OFFSET	0
 #define ETP_REPORT_ID		0x5D
 #define ETP_TP_REPORT_ID	0x5E
 #define ETP_REPORT_ID_OFFSET	2
@@ -1018,6 +1019,8 @@ static void elan_report_absolute(struct elan_tp_data *data, u8 *packet)
 	u8 hover_info = packet[ETP_HOVER_INFO_OFFSET];
 	bool contact_valid, hover_event;
 
+	pm_wakeup_event(&data->client->dev, 0);
+
 	hover_event = hover_info & 0x40;
 	for (i = 0; i < ETP_MAX_FINGERS; i++) {
 		contact_valid = tp_info & (1U << (3 + i));
@@ -1041,6 +1044,8 @@ static void elan_report_trackpoint(struct elan_tp_data *data, u8 *report)
 	u8 *packet = &report[ETP_REPORT_ID_OFFSET + 1];
 	int x, y;
 
+	pm_wakeup_event(&data->client->dev, 0);
+
 	if (!data->tp_input) {
 		dev_warn_once(&data->client->dev,
 			      "received a trackpoint report while no trackpoint device has been created. Please report upstream.\n");
@@ -1065,7 +1070,6 @@ static void elan_report_trackpoint(struct elan_tp_data *data, u8 *report)
 static irqreturn_t elan_isr(int irq, void *dev_id)
 {
 	struct elan_tp_data *data = dev_id;
-	struct device *dev = &data->client->dev;
 	int error;
 	u8 report[ETP_MAX_REPORT_LEN];
 
@@ -1083,7 +1087,13 @@ static irqreturn_t elan_isr(int irq, void *dev_id)
 	if (error)
 		goto out;
 
-	pm_wakeup_event(dev, 0);
+	/*
+	 * Controllers may send a full length report on power on and reset
+	 * cases. There are only meaningless bytes in these reports except for
+	 * report[ETP_REPORT_LEN_OFFSET], which is 0.
+	 */
+	if (!report[ETP_REPORT_LEN_OFFSET])
+		goto out;
 
 	switch (report[ETP_REPORT_ID_OFFSET]) {
 	case ETP_REPORT_ID:
@@ -1093,7 +1103,7 @@ static irqreturn_t elan_isr(int irq, void *dev_id)
 		elan_report_trackpoint(data, report);
 		break;
 	default:
-		dev_err(dev, "invalid report id data (%x)\n",
+		dev_err(&data->client->dev, "invalid report id data (%x)\n",
 			report[ETP_REPORT_ID_OFFSET]);
 	}
 
-- 
2.27.0.212.ge8ba1cc988-goog

