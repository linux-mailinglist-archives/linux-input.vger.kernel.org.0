Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDFE44780BA
	for <lists+linux-input@lfdr.de>; Fri, 17 Dec 2021 00:37:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbhLPXhX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Dec 2021 18:37:23 -0500
Received: from finn.gateworks.com ([108.161.129.64]:36210 "EHLO
        finn.localdomain" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S229755AbhLPXhW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Dec 2021 18:37:22 -0500
Received: from 068-189-091-139.biz.spectrum.com ([68.189.91.139] helo=tharvey.pdc.gateworks.com)
        by finn.localdomain with esmtp (Exim 4.93)
        (envelope-from <tharvey@gateworks.com>)
        id 1my0D0-0093am-5y; Thu, 16 Dec 2021 23:30:46 +0000
From:   Tim Harvey <tharvey@gateworks.com>
To:     linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Tim Harvey <tharvey@gateworks.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [RFC PATCH 4/4] input: edt-ft5x06 - Handle unreliable TOUCH_UP events
Date:   Thu, 16 Dec 2021 15:30:41 -0800
Message-Id: <20211216233041.1220-5-tharvey@gateworks.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211216233041.1220-1-tharvey@gateworks.com>
References: <20211216233041.1220-1-tharvey@gateworks.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The ft5x06 is unreliable in sending touch up events, so some
touch IDs can become stuck in the detected state.

Ensure that IDs that are unreported by the controller are
released.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Tim Harvey <tharvey@gateworks.com>
---
 drivers/input/touchscreen/edt-ft5x06.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index a3622d6e8e65..53906fcbaa51 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -126,6 +126,7 @@ struct edt_ft5x06_ts_data {
 	int offset_y;
 	int report_rate;
 	int max_support_points;
+	unsigned int known_ids;
 
 	char name[EDT_NAME_LEN];
 
@@ -198,6 +199,8 @@ static void edt_ft5x06_process(struct edt_ft5x06_ts_data *tsdata)
 	int offset, tplen, datalen, crclen;
 	int error;
 	int num_points;
+	unsigned int active_ids = 0, known_ids = tsdata->known_ids;
+	long released_ids;
 
 	switch (tsdata->version) {
 	case EDT_M06:
@@ -297,10 +300,21 @@ static void edt_ft5x06_process(struct edt_ft5x06_ts_data *tsdata)
 
 		input_mt_slot(tsdata->input, id);
 		if (input_mt_report_slot_state(tsdata->input, MT_TOOL_FINGER,
-					       type != TOUCH_EVENT_UP))
+					       type != TOUCH_EVENT_UP)) {
 			touchscreen_report_pos(tsdata->input, &tsdata->prop,
 					       x, y, true);
+			active_ids |= BIT(id);
+		} else {
+			known_ids &= ~BIT(id);
+		}
+	}
+
+	released_ids = known_ids & ~active_ids;
+	for_each_set_bit_from(i, &released_ids, tsdata->max_support_points) {
+		input_mt_slot(tsdata->input, i);
+		input_mt_report_slot_inactive(tsdata->input);
 	}
+	tsdata->known_ids = active_ids;
 
 	input_mt_report_pointer_emulation(tsdata->input, true);
 	input_sync(tsdata->input);
-- 
2.17.1

