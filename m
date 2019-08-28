Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B055B9FEEC
	for <lists+linux-input@lfdr.de>; Wed, 28 Aug 2019 11:54:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726370AbfH1JyT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Aug 2019 05:54:19 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:42047 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726368AbfH1JyT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Aug 2019 05:54:19 -0400
Received: by mail-pg1-f194.google.com with SMTP id p3so1174465pgb.9
        for <linux-input@vger.kernel.org>; Wed, 28 Aug 2019 02:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=37vNt0MkG6rl24DSa2HEQH3ZUDhUE6wULD9x6UvkMLc=;
        b=dtIAzGL+Q5upU5zh7YTyJ/yn7U+n8fmhqS+ubv/Nzt/6pLuwBY71zmRJdTySt85gNm
         i0dYhgRd10LiX6fHdx+if2PU5hT4WO7UJ5TnubsgUXFOieGjZXSoc5bLpS8hlv/wJ95T
         3cWFsgDktbADTDEtHcKGLdJ8UQ8HGWzgFF+AcueKplqlN3V1wSgNUGwIAj5740MpVoc5
         e2yV4lFmHb80RdUe7dh+cs3RfmSqU+RHeiR6SdHVlKwWQWqk57OsAp+XpM37WGSM6M97
         hlnUz+LnR1k1XJFd8y1BJh2yxV8ovoR4j4GlWtRhmXk3HDt+n/rx2ZZJARQ3pVIceuOi
         k81Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=37vNt0MkG6rl24DSa2HEQH3ZUDhUE6wULD9x6UvkMLc=;
        b=pbNCKjvyptvvmL/16+KOFVijOLCWUfwMeEB1bg2X9ifjcSIgdB9Y04JKIDIorIM8lp
         kAU1taxtj5mR99+d0vKDmMZWZnrJTEM4mQQa2HGdgxULpd7r77nJU/nJvc9Em+o/ILPw
         gz5ug/VxjvZ4/RPwH5EvZVRim1E+akNMPod++u3c6zohrZHO91JzPGM/4JCYLVEad6pK
         u/9n/tJ6vd4lhPkNvMeb2QU0QqKYd+iVqheihqbb1bjitDiWIvTph316JsXnx6Ru4o5z
         XgjKkyoB6x42n8I+eXAQq2bpyksH7RVi70LsINtcamFzwTiuDsk18b67WNJdfgm9Znbh
         PjZg==
X-Gm-Message-State: APjAAAWgXbSiBPse7f4NnE933hBzGOIYqOdZ8/onuVLpQcAJLo4ncZPW
        msyS/t2LxvZGp6+7QYPOn7n1jcqt
X-Google-Smtp-Source: APXvYqw/mCVJYMfg6NRXVZSoxY99rgTnFiLFCxLA3FPREZUmGNHDVUB2Ad/UvAbBBNPKCY9NcmN2Ww==
X-Received: by 2002:aa7:93cf:: with SMTP id y15mr3577924pff.251.1566986057905;
        Wed, 28 Aug 2019 02:54:17 -0700 (PDT)
Received: from localhost.localdomain ([39.117.32.11])
        by smtp.gmail.com with ESMTPSA id m13sm2101432pgn.57.2019.08.28.02.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2019 02:54:17 -0700 (PDT)
From:   Jongpil Jung <jongpuls@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Jongpil Jung <jongpil19.jung@samsung.corp-partner.google.com>
Subject: [PATCH 5/8] Input: atmel_mxt_ts - store mxt_info into structure instead of pointer.
Date:   Wed, 28 Aug 2019 18:53:46 +0900
Message-Id: <20190828095349.30607-5-jongpuls@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828095349.30607-1-jongpuls@gmail.com>
References: <20190828095349.30607-1-jongpuls@gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Jongpil Jung <jongpil19.jung@samsung.corp-partner.google.com>

To maintain mxt_info easiler, use structure type mxt_info instead of
pointer.

Change-Id: I89f19a45b395a071d2ea01efa1d80f15fc3ed461
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 35 ++++++++++++------------
 1 file changed, 17 insertions(+), 18 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index f5eb81ff2fd3..723ff75e798a 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -281,7 +281,7 @@ struct mxt_data {
 	struct input_dev *input_dev;
 	char phys[64];		/* device physical location */
 	struct mxt_object *object_table;
-	struct mxt_info *info;
+	struct mxt_info info;
 	void *raw_info_block;
 	unsigned int irq;
 	unsigned int max_x;
@@ -464,7 +464,7 @@ static int mxt_lookup_bootloader_address(struct mxt_data *data, bool retry)
 {
 	u8 appmode = data->client->addr;
 	u8 bootloader;
-	u8 family_id = data->info ? data->info->family_id : 0;
+	u8 family_id = data->info.family_id;
 
 	switch (appmode) {
 	case 0x4a:
@@ -697,7 +697,7 @@ mxt_get_object(struct mxt_data *data, u8 type)
 	struct mxt_object *object;
 	int i;
 
-	for (i = 0; i < data->info->object_num; i++) {
+	for (i = 0; i < data->info.object_num; i++) {
 		object = data->object_table + i;
 		if (object->type == type)
 			return object;
@@ -1486,13 +1486,13 @@ static int mxt_update_cfg(struct mxt_data *data, const struct firmware *fw)
 		cfg.raw_pos += offset;
 	}
 
-	if (cfg.info.family_id != data->info->family_id) {
+	if (cfg.info.family_id != data->info.family_id) {
 		dev_err(dev, "Family ID mismatch!\n");
 		ret = -EINVAL;
 		goto release_raw;
 	}
 
-	if (cfg.info.variant_id != data->info->variant_id) {
+	if (cfg.info.variant_id != data->info.variant_id) {
 		dev_err(dev, "Variant ID mismatch!\n");
 		ret = -EINVAL;
 		goto release_raw;
@@ -1541,7 +1541,7 @@ static int mxt_update_cfg(struct mxt_data *data, const struct firmware *fw)
 
 	/* Malloc memory to store configuration */
 	cfg.start_ofs = MXT_OBJECT_START +
-			data->info->object_num * sizeof(struct mxt_object) +
+			data->info.object_num * sizeof(struct mxt_object) +
 			MXT_INFO_CHECKSUM_SIZE;
 	cfg.mem_size = data->mem_size - cfg.start_ofs;
 	cfg.mem = kzalloc(cfg.mem_size, GFP_KERNEL);
@@ -1609,7 +1609,6 @@ static void mxt_free_object_table(struct mxt_data *data)
 	v4l2_device_unregister(&data->dbg.v4l2);
 #endif
 	data->object_table = NULL;
-	data->info = NULL;
 	kfree(data->raw_info_block);
 	data->raw_info_block = NULL;
 	kfree(data->msg_buf);
@@ -1639,7 +1638,7 @@ static int mxt_parse_object_table(struct mxt_data *data,
 	/* Valid Report IDs start counting from 1 */
 	reportid = 1;
 	data->mem_size = 0;
-	for (i = 0; i < data->info->object_num; i++) {
+	for (i = 0; i < data->info.object_num; i++) {
 		struct mxt_object *object = object_table + i;
 		u8 min_id, max_id;
 
@@ -1663,8 +1662,8 @@ static int mxt_parse_object_table(struct mxt_data *data,
 
 		switch (object->type) {
 		case MXT_GEN_MESSAGE_T5:
-			if (data->info->family_id == 0x80 &&
-			    data->info->version < 0x20) {
+			if (data->info.family_id == 0x80 &&
+			    data->info.version < 0x20) {
 				/*
 				 * On mXT224 firmware versions prior to V2.0
 				 * read and discard unused CRC byte otherwise
@@ -1797,13 +1796,13 @@ static int mxt_read_info_block(struct mxt_data *data)
 	}
 
 	data->raw_info_block = id_buf;
-	data->info = (struct mxt_info *)id_buf;
+	memcpy(&data->info, id_buf, sizeof(struct mxt_info));
 
 	dev_info(&client->dev,
 		 "Family: %u Variant: %u Firmware V%u.%u.%02X Objects: %u\n",
-		 data->info->family_id, data->info->variant_id,
-		 data->info->version >> 4, data->info->version & 0xf,
-		 data->info->build, data->info->object_num);
+		 data->info.family_id, data->info.variant_id,
+		 data->info.version >> 4, data->info.version & 0xf,
+		 data->info.build, data->info.object_num);
 
 	/* Parse object table information */
 	error = mxt_parse_object_table(data, id_buf + MXT_OBJECT_START);
@@ -2721,7 +2720,7 @@ static ssize_t mxt_fw_version_show(struct device *dev,
 				   struct device_attribute *attr, char *buf)
 {
 	struct mxt_data *data = dev_get_drvdata(dev);
-	struct mxt_info *info = data->info;
+	struct mxt_info *info = &data->info;
 	return scnprintf(buf, PAGE_SIZE, "%u.%u.%02X\n",
 			 info->version >> 4, info->version & 0xf, info->build);
 }
@@ -2731,7 +2730,7 @@ static ssize_t mxt_hw_version_show(struct device *dev,
 				   struct device_attribute *attr, char *buf)
 {
 	struct mxt_data *data = dev_get_drvdata(dev);
-	struct mxt_info *info = data->info;
+	struct mxt_info *info = &data->info;
 	return scnprintf(buf, PAGE_SIZE, "%u.%u\n",
 			 info->family_id, info->variant_id);
 }
@@ -2748,7 +2747,7 @@ static ssize_t mxt_matrix_size_show(struct device *dev,
 				    struct device_attribute *attr, char *buf)
 {
 	struct mxt_data *data = dev_get_drvdata(dev);
-	struct mxt_info *info = data->info;
+	struct mxt_info *info = &data->info;
 	return scnprintf(buf, PAGE_SIZE, "%u %u\n",
 			 info->matrix_xsize, info->matrix_ysize);
 }
@@ -2787,7 +2786,7 @@ static ssize_t mxt_object_show(struct device *dev,
 		return -ENOMEM;
 
 	error = 0;
-	for (i = 0; i < data->info->object_num; i++) {
+	for (i = 0; i < data->info.object_num; i++) {
 		object = data->object_table + i;
 
 		if (!mxt_object_readable(object->type))
-- 
2.17.1

