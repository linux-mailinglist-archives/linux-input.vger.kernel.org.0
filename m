Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0710F25039
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2019 15:28:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728249AbfEUN2F (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 May 2019 09:28:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47276 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728232AbfEUN2F (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 May 2019 09:28:05 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 19C933082B1F;
        Tue, 21 May 2019 13:28:05 +0000 (UTC)
Received: from plouf.redhat.com (ovpn-116-49.ams2.redhat.com [10.36.116.49])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 210A261983;
        Tue, 21 May 2019 13:27:57 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        KT Liao <kt.liao@emc.com.tw>, Rob Herring <robh+dt@kernel.org>,
        Aaron Ma <aaron.ma@canonical.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH v2 08/10] Input: elan_i2c - export true width/height
Date:   Tue, 21 May 2019 15:27:10 +0200
Message-Id: <20190521132712.2818-9-benjamin.tissoires@redhat.com>
In-Reply-To: <20190521132712.2818-1-benjamin.tissoires@redhat.com>
References: <20190521132712.2818-1-benjamin.tissoires@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Tue, 21 May 2019 13:28:05 +0000 (UTC)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The width/height is actually in the same unit than X and Y. So we should
not tamper the data, but just set the proper resolution, so that userspace
can correctly detect which touch is a palm or a finger.

Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

--

new in v2
---
 drivers/input/mouse/elan_i2c_core.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index 7ff044c6cd11..6f4feedb7765 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -45,7 +45,6 @@
 #define DRIVER_NAME		"elan_i2c"
 #define ELAN_VENDOR_ID		0x04f3
 #define ETP_MAX_PRESSURE	255
-#define ETP_FWIDTH_REDUCE	90
 #define ETP_FINGER_WIDTH	15
 #define ETP_RETRY_COUNT		3
 
@@ -915,12 +914,8 @@ static void elan_report_contact(struct elan_tp_data *data,
 			return;
 		}
 
-		/*
-		 * To avoid treating large finger as palm, let's reduce the
-		 * width x and y per trace.
-		 */
-		area_x = mk_x * (data->width_x - ETP_FWIDTH_REDUCE);
-		area_y = mk_y * (data->width_y - ETP_FWIDTH_REDUCE);
+		area_x = mk_x * data->width_x;
+		area_y = mk_y * data->width_y;
 
 		major = max(area_x, area_y);
 		minor = min(area_x, area_y);
@@ -1123,8 +1118,10 @@ static int elan_setup_input_device(struct elan_tp_data *data)
 			     ETP_MAX_PRESSURE, 0, 0);
 	input_set_abs_params(input, ABS_MT_TOUCH_MAJOR, 0,
 			     ETP_FINGER_WIDTH * max_width, 0, 0);
+	input_abs_set_res(input, ABS_MT_TOUCH_MAJOR, data->x_res);
 	input_set_abs_params(input, ABS_MT_TOUCH_MINOR, 0,
 			     ETP_FINGER_WIDTH * min_width, 0, 0);
+	input_abs_set_res(input, ABS_MT_TOUCH_MINOR, data->y_res);
 
 	data->input = input;
 
-- 
2.21.0

