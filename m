Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C7469FEEB
	for <lists+linux-input@lfdr.de>; Wed, 28 Aug 2019 11:54:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726341AbfH1JyQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Aug 2019 05:54:16 -0400
Received: from mail-pg1-f181.google.com ([209.85.215.181]:38982 "EHLO
        mail-pg1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbfH1JyQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Aug 2019 05:54:16 -0400
Received: by mail-pg1-f181.google.com with SMTP id u17so1184078pgi.6
        for <linux-input@vger.kernel.org>; Wed, 28 Aug 2019 02:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=fxcLkCiIJRwl4RWn8+1v7sT5YlgbZRj3mI8Z1w4zYhI=;
        b=hqK4c5Q3A0PHDezIebX6DOlX4gX15ktm5MX+T+C2YV9VJkPGZK14GJTysU9LRnn32J
         ObEv/ZyZEDfKWMwuGKKj89m15Hej6Omua7kLPxzhG7pKulqXE8e8d8VFNZFIwkC0yTCL
         bh0rp65BZFZs9GVTBBkMIWYbCCwhGEJ5aGFAZN1ZBU+p4W91v57HJhCl2fs8GhijBpC/
         yEF8s8CVJC79eJc1HlZ1PdiZ2YSwj12gRWG+wiEHuTxDmQVdZw6rdxvnURqPPAd1JFgH
         7QzJM+zRjZ1KjO0nmutWZDxkLHFsI6o55x3NlMjfNtPhnG49ruf2SrtoTAiE0eI4c0K+
         SNlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=fxcLkCiIJRwl4RWn8+1v7sT5YlgbZRj3mI8Z1w4zYhI=;
        b=AeWoNAHXGdXgT5FtW2Z7BcMxDbsGXPjfAJspD+zHRn6udMMiFwrWYXEdiIFsUfqdJv
         jTLzq66IqZAHClF7bkMM5waVUsS00JOIGxVuJfcK/XU8wdGNXt/2rzXfnedDJKMy+5Zf
         5UIqrcNZDDCz+bnL8ebFhbudXT4c3EoPLcWvKNhaXNfTLKNocqnpRp789jTNRwnJstZh
         VpTY5IvVfyR02ODe/XtP7KyRRpmdmQu0u16UZrgLqmXwdRyE0k/v2nbvdijQpmkOGXZ4
         g2gL/VoGhKF9focGiRuo3wr+7KDzYPI/qktfTRGD81kd06KjT5zpeHggzOlsNpKdV657
         FFmQ==
X-Gm-Message-State: APjAAAXgSlCkHes4c2AGUKhQAhovdBiu+vYRi9pXTFI5K8jTGaLvpGf8
        YwGPC/PvnHKuwE8GokWOIElXJ1KO
X-Google-Smtp-Source: APXvYqxJ6BOBhjIQLeUVMvokuzmxFhEBawroaSrhOzifQf3nsuUfuNwA6QUSFh4GLrFewT1oqhvZRg==
X-Received: by 2002:a63:3148:: with SMTP id x69mr2528088pgx.300.1566986055355;
        Wed, 28 Aug 2019 02:54:15 -0700 (PDT)
Received: from localhost.localdomain ([39.117.32.11])
        by smtp.gmail.com with ESMTPSA id m13sm2101432pgn.57.2019.08.28.02.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2019 02:54:14 -0700 (PDT)
From:   Jongpil Jung <jongpuls@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Jongpil Jung <jongpil19.jung@samsung.corp-partner.google.com>
Subject: [PATCH 4/8] Input: atmel_mxt_ts - add interface to read ts sensor matrix info.
Date:   Wed, 28 Aug 2019 18:53:45 +0900
Message-Id: <20190828095349.30607-4-jongpuls@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828095349.30607-1-jongpuls@gmail.com>
References: <20190828095349.30607-1-jongpuls@gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Jongpil Jung <jongpil19.jung@samsung.corp-partner.google.com>

To get more hardware information, make interface to read sensor matrix
size.

Change-Id: I41a72b4c4031f2041479f183b59162da3281beda
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index cb3a608f60bf..f5eb81ff2fd3 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -2743,6 +2743,16 @@ static ssize_t mxt_info_csum_show(struct device *dev,
 	return scnprintf(buf, PAGE_SIZE, "%06x\n", data->info_crc);
 }
 
+/* Matrix Size is <MatrixSizeX> <MatrixSizeY> */
+static ssize_t mxt_matrix_size_show(struct device *dev,
+				    struct device_attribute *attr, char *buf)
+{
+	struct mxt_data *data = dev_get_drvdata(dev);
+	struct mxt_info *info = data->info;
+	return scnprintf(buf, PAGE_SIZE, "%u %u\n",
+			 info->matrix_xsize, info->matrix_ysize);
+}
+
 static ssize_t mxt_show_instance(char *buf, int count,
 				 struct mxt_object *object, int instance,
 				 const u8 *val)
@@ -2976,6 +2986,7 @@ static DEVICE_ATTR(config_csum, S_IRUGO, mxt_config_csum_show, NULL);
 static DEVICE_ATTR(fw_version, S_IRUGO, mxt_fw_version_show, NULL);
 static DEVICE_ATTR(hw_version, S_IRUGO, mxt_hw_version_show, NULL);
 static DEVICE_ATTR(info_csum, S_IRUGO, mxt_info_csum_show, NULL);
+static DEVICE_ATTR(matrix_size, S_IRUGO, mxt_matrix_size_show, NULL);
 static DEVICE_ATTR(object, S_IRUGO, mxt_object_show, NULL);
 static DEVICE_ATTR(update_fw, S_IWUSR, NULL, mxt_update_fw_store);
 
@@ -2986,6 +2997,7 @@ static struct attribute *mxt_attrs[] = {
 	&dev_attr_fw_version.attr,
 	&dev_attr_hw_version.attr,
 	&dev_attr_info_csum.attr,
+	&dev_attr_matrix_size.attr,
 	&dev_attr_object.attr,
 	&dev_attr_update_fw.attr,
 	NULL
-- 
2.17.1

