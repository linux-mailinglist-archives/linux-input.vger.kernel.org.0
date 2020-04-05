Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A90C119EEBE
	for <lists+linux-input@lfdr.de>; Mon,  6 Apr 2020 01:57:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727896AbgDEX47 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 5 Apr 2020 19:56:59 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:36283 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727254AbgDEX47 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 5 Apr 2020 19:56:59 -0400
Received: by mail-lj1-f195.google.com with SMTP id b1so12796938ljp.3;
        Sun, 05 Apr 2020 16:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PvyePjmdFsb80vPIxU/EKPsM4FhvVigmHotisyKmhE8=;
        b=PmbDALE4a+kXOQCpCbV8xKwPo2gT0aaN/kgpqWI1qX10JXW454aLV3w4b0bd7fEh5n
         jYmo7JTd3Is80bW0uenH5DpdEvSfR7vC4Z1vhuZnZwVelhZDIQMnvXABWYKr+lD3nbjc
         kca+YEOryJ6k2GQ/JT2sdeVhPR28EAKJ8K5qnoJYHgdPQ48Tz0YR5lhNEsV74nOdM6SN
         SaOEIy663hXvDOu1eFwKX+LWZGIAk9WiZ4ypkamUyqNaSuk2i/DvBYbGWbaKosKJVxRV
         ywxMn/umv2l4/g2pwFHANODsdXzEkTJ9GRhngI46qnyi2n6glv6rHPHCPwS3nzJnu+sW
         VbHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PvyePjmdFsb80vPIxU/EKPsM4FhvVigmHotisyKmhE8=;
        b=AvNq6/7kkAvNVesSchFVIQR8RTPoqvj1mTxZf1AL3d8OnYy3/oj8PJ73XSq1WK6TZ5
         Xk9HrKcBPTR2yD4qTkSfb9SvNVqb/zpMshNAzeYPgg4P2IpY0bB9iKXRsd8SBBL1fy99
         cXoY3fRLn/BlZK4XIV6bHepAvnEB530PK7A6KVr6nN5DFN5gKnZsXFS5RkqeP0hbt5fm
         IqQlDNDbNHOHBHzfyH6/S5JikqygtBEwcy+rVOQU27ABYZFnhuCK5ErwOhhDaX54O8OD
         wVsP236otU4T2WXGV65YBu9S/l4H3r7BiVgg4dsshs0esGuyHJNnrnNwkDwfb7NbM6IM
         ctoA==
X-Gm-Message-State: AGi0Puavc86LzIL8CZm7Sr6zi+gbVH94VRBGBAEg3fRoglvlFuNPecM4
        z9ys0N/v9FySQcuUiYU5Rxo=
X-Google-Smtp-Source: APiQypK/gYtFicmQgWDmZcVip9T3onP5to0atMDXf8sjs+oYS7hhA/ZHRMlV8i0NvKjbg7SdDGP4/w==
X-Received: by 2002:a2e:9c9:: with SMTP id 192mr9713743ljj.77.1586131016155;
        Sun, 05 Apr 2020 16:56:56 -0700 (PDT)
Received: from localhost.localdomain ([5.139.61.144])
        by smtp.googlemail.com with ESMTPSA id d21sm8980841ljc.49.2020.04.05.16.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2020 16:56:55 -0700 (PDT)
From:   Artem Borisov <dedsa2002@gmail.com>
Cc:     jikos@kernel.org, Artem Borisov <dedsa2002@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] HID: alps: Refactor axis resolution logic
Date:   Mon,  6 Apr 2020 03:55:16 +0400
Message-Id: <20200405235517.18203-2-dedsa2002@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200405235517.18203-1-dedsa2002@gmail.com>
References: <20200405235517.18203-1-dedsa2002@gmail.com>
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

