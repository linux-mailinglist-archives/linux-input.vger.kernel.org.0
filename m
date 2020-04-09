Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 601B51A3CAD
	for <lists+linux-input@lfdr.de>; Fri, 10 Apr 2020 01:01:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726875AbgDIXBP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Apr 2020 19:01:15 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:34086 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726722AbgDIXBP (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Apr 2020 19:01:15 -0400
Received: by mail-lf1-f68.google.com with SMTP id x23so155065lfq.1;
        Thu, 09 Apr 2020 16:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XgDTQTaRBDUklcxuKHaLcBMeTWXjmOCFSHQMoVbCiNk=;
        b=qYjkAKzfXiacUud1aDXy841UDPUZQW8mRD/GqsC7kX9tjO8W7vdcBdG+EL75p8vVN5
         osOu/EnTmu0Dogp57X5jUMkELxjJOkRD+Drh/cprsNi70IUqxiAMXaBzvo2eVOl+akIu
         eAsYGjyAX+PmlsFGeBwFN03ilgDS3CKZzMbvpvqmnG8+za7QYErY7I1Oxuc4SbMpYHcx
         ViK6dfKX+l2OlsyfZwIEm2miNZ/aR9LppaE9Pel8TCgM7Dp6s0iaUvPxmc3NdoH6XIvN
         aj9HqVNq3JlcPjqkNUljA7OjuvA/G5xizVPpzlE+aPynr6bm3/GWpBsm3wGihvKu5FY/
         WABg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XgDTQTaRBDUklcxuKHaLcBMeTWXjmOCFSHQMoVbCiNk=;
        b=VSxpc3dSQMVMyZIohTKGdCJPTY4RQTCyu2ryxTrDKRIU9PCbn897IjsPLjG/y6IYrB
         o/caAjVr7YQ28wnFz0qkwlCM7YeVimvyesos505VxaAgBpcbUOx+9SDq58/YorpJfM4S
         TacHmyKTOcC8frBDxYyDsivCGK2nguOMyFh+gfow3wazCKoxMaZrDRm5fIY5nG2xDDWH
         okPZUx8gC/JGfuId3TmMX8SemPP3C6IsPmnu8qYMfbmzBMVdCHA9iNk41lms88zXgXzK
         JKOCffeB1B+AUC+/szPrCLQMQMp2oC20LyVkz5ZXbEJZDjgnBo4brACbsJbT+MZkXmWm
         GZZg==
X-Gm-Message-State: AGi0PuYNZqWavTGe1Tnst1mzD39TtCrWYkorrcnbjMOGk4kR5veVxZOS
        9jjiuRfOLn4M+vnewZ02yco=
X-Google-Smtp-Source: APiQypJpazaoUZ7uu/Vxt+qSFD5Lays9gPVB6WMgwiDlVNoLOA+5xBQWKJYsEfnTV8W1A1cyz5oBsQ==
X-Received: by 2002:a19:c385:: with SMTP id t127mr877176lff.117.1586473273192;
        Thu, 09 Apr 2020 16:01:13 -0700 (PDT)
Received: from localhost.localdomain ([85.173.88.81])
        by smtp.googlemail.com with ESMTPSA id v18sm325079lfd.0.2020.04.09.16.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 16:01:12 -0700 (PDT)
From:   Artem Borisov <dedsa2002@gmail.com>
Cc:     jikos@kernel.org, masaki.ota@jp.alps.com,
        Artem Borisov <dedsa2002@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] HID: alps: Refactor axis resolution logic
Date:   Fri, 10 Apr 2020 03:00:08 +0400
Message-Id: <20200409230009.22551-1-dedsa2002@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <nycvar.YFH.7.76.2004100019450.19713@cbobk.fhfr.pm>
References: <nycvar.YFH.7.76.2004100019450.19713@cbobk.fhfr.pm>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

AUI1657 doesn't follow the same logic for resolution calculation, since
the resulting values are incorrect. Instead, it reports the actual
resolution values in place of the pitch ones.
While we're at it, also refactor the whole resolution logic to make it more
generic and sensible for multiple device support.

There are two main logical problems with the current code:
1. active_len_mm values are only used for resolution calculation on U1,
yet are exposed globally as part of alps_dev structure.
2. The resolution calculation process happens in alps_input_configured,
while everything else is calculated in u1_init function.

These problems become more apparent when we try to support a device
that doesn't follow the same resolution calculation logic as U1.
Since alps_input_configured is a device-agnostic function, we should
avoid doing any measurements there and handle them in device-specific
init functions like u1/T4_init instead.

To eliminate these problems we add global x_res and y_res values
and populate them on a device-specific basis in the according init
functions.

Signed-off-by: Artem Borisov <dedsa2002@gmail.com>
---
 drivers/hid/hid-alps.c | 41 +++++++++++++++++++++++++----------------
 1 file changed, 25 insertions(+), 16 deletions(-)

diff --git a/drivers/hid/hid-alps.c b/drivers/hid/hid-alps.c
index c2a2bd528890..494c08cca645 100644
--- a/drivers/hid/hid-alps.c
+++ b/drivers/hid/hid-alps.c
@@ -83,8 +83,8 @@ enum dev_num {
  * @max_fingers: total number of fingers
  * @has_sp: boolean of sp existense
  * @sp_btn_info: button information
- * @x_active_len_mm: active area length of X (mm)
- * @y_active_len_mm: active area length of Y (mm)
+ * @x_res: resolution of X
+ * @y_res: resolution of Y
  * @x_max: maximum x coordinate value
  * @y_max: maximum y coordinate value
  * @x_min: minimum x coordinate value
@@ -100,9 +100,10 @@ struct alps_dev {
 	enum dev_num dev_type;
 	u8  max_fingers;
 	u8  has_sp;
+	u8  no_pitch;
 	u8	sp_btn_info;
-	u32	x_active_len_mm;
-	u32	y_active_len_mm;
+	u32	x_res;
+	u32	y_res;
 	u32	x_max;
 	u32	y_max;
 	u32	x_min;
@@ -550,10 +551,6 @@ static int u1_init(struct hid_device *hdev, struct alps_dev *pri_data)
 		dev_err(&hdev->dev, "failed U1_RESO_DWN_ABS (%d)\n", ret);
 		goto exit;
 	}
-	pri_data->x_active_len_mm =
-		(pitch_x * (sen_line_num_x - 1)) / 10;
-	pri_data->y_active_len_mm =
-		(pitch_y * (sen_line_num_y - 1)) / 10;
 
 	pri_data->x_max =
 		(resolution << 2) * (sen_line_num_x - 1);
@@ -562,6 +559,18 @@ static int u1_init(struct hid_device *hdev, struct alps_dev *pri_data)
 		(resolution << 2) * (sen_line_num_y - 1);
 	pri_data->y_min = 1;
 
+	if (pri_data->no_pitch) {
+		pri_data->x_res = pitch_x;
+		pri_data->y_res = pitch_y;
+	} else {
+		pri_data->x_res =
+			(pri_data->x_max - 1) /
+			((pitch_x * (sen_line_num_x - 1)) / 10);
+		pri_data->y_res =
+			(pri_data->y_max - 1) /
+			((pitch_y * (sen_line_num_y - 1)) / 10);
+	}
+
 	ret = u1_read_write_register(hdev, ADDRESS_U1_PAD_BTN,
 			&tmp, 0, true);
 	if (ret < 0) {
@@ -622,7 +631,7 @@ static int T4_init(struct hid_device *hdev, struct alps_dev *pri_data)
 	pri_data->x_min = T4_COUNT_PER_ELECTRODE;
 	pri_data->y_max = sen_line_num_y * T4_COUNT_PER_ELECTRODE;
 	pri_data->y_min = T4_COUNT_PER_ELECTRODE;
-	pri_data->x_active_len_mm = pri_data->y_active_len_mm = 0;
+	pri_data->x_res = pri_data->y_res = 0;
 	pri_data->btn_cnt = 1;
 
 	ret = t4_read_write_register(hdev, PRM_SYS_CONFIG_1, &tmp, 0, true);
@@ -675,7 +684,7 @@ static int alps_input_configured(struct hid_device *hdev, struct hid_input *hi)
 	struct alps_dev *data = hid_get_drvdata(hdev);
 	struct input_dev *input = hi->input, *input2;
 	int ret;
-	int res_x, res_y, i;
+	int i;
 
 	data->input = input;
 
@@ -706,12 +715,9 @@ static int alps_input_configured(struct hid_device *hdev, struct hid_input *hi)
 	input_set_abs_params(input, ABS_MT_POSITION_Y,
 						data->y_min, data->y_max, 0, 0);
 
-	if (data->x_active_len_mm && data->y_active_len_mm) {
-		res_x = (data->x_max - 1) / data->x_active_len_mm;
-		res_y = (data->y_max - 1) / data->y_active_len_mm;
-
-		input_abs_set_res(input, ABS_MT_POSITION_X, res_x);
-		input_abs_set_res(input, ABS_MT_POSITION_Y, res_y);
+	if (data->x_res && data->y_res) {
+		input_abs_set_res(input, ABS_MT_POSITION_X, data->x_res);
+		input_abs_set_res(input, ABS_MT_POSITION_Y, data->y_res);
 	}
 
 	input_set_abs_params(input, ABS_MT_PRESSURE, 0, 64, 0, 0);
@@ -802,8 +808,11 @@ static int alps_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		break;
 	case HID_DEVICE_ID_ALPS_U1_DUAL:
 	case HID_DEVICE_ID_ALPS_U1:
+		data->dev_type = U1;
+		break;
 	case HID_DEVICE_ID_ALPS_1657:
 		data->dev_type = U1;
+		data->no_pitch = 1;
 		break;
 	default:
 		data->dev_type = UNKNOWN;
-- 
2.26.0

