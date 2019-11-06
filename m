Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86887F0FC7
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2019 08:05:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731485AbfKFHDF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 Nov 2019 02:03:05 -0500
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:8700 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731206AbfKFHDE (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 6 Nov 2019 02:03:04 -0500
IronPort-SDR: DDhwJtM3xSkmT6tmAb/i40q5s63juIUOCpcMwldNjYBb9+zLNDXfbPUcF+AH+G0J8X2552REXF
 DvV0m4paRogZcPtpgNj+r/K+Q9G6ufKUKWQiRlN00kOAd8M8MJZglCB29N4rmVcy5hhsfwjsUw
 CbHmPKpK7k+NS77notzTkS25X2P5CSu2Yfbp52fVt9rigo/ZZwCo+rUE7zvVJlSvV7e4B3/PLp
 Bk2bODCIJ2jMzo+ju0QpN6/YD9qJ8cqaymKDpbpiZJEK2WfbGh+x7eX1692s/yzRgy0qDlwDwX
 geU=
X-IronPort-AV: E=Sophos;i="5.68,272,1569312000"; 
   d="scan'208";a="42908599"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 05 Nov 2019 23:03:03 -0800
IronPort-SDR: tfjYrSIDa38NDYQYihStK/Oc62hg9wCP705xm+kA7QyjwUGSYbjxJinueRwLerRdTrah8wqenn
 a3+wNUMIGnLw+meBtSL4MNWzSnNl8CJJBzqMgIWWeQq84obPa/UU2qbcuJs1LnmZLQPJ+KXfyU
 0jXZoZfM3u8WC+nra+p2wuaxlbjswB2HUt/aThF1ignya09Iy3p9Kpl5jTp5Ew8IomBGEi5XF6
 rRlrWNJjrwjD1ODuBBB0+SpizmlE6oOUfMhrX0GXHAlQc7mAhYn+P30o7ekpIrxG9cXgYPB3JD
 6MQ=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <erosca@de.adit-jv.com>,
        <Andrew_Gabbasov@mentor.com>
Subject: [PATCH v5 18/48] Input: atmel_mxt_ts - add config checksum attribute to sysfs
Date:   Wed, 6 Nov 2019 16:01:16 +0900
Message-ID: <20191106070146.18759-19-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191106070146.18759-1-jiada_wang@mentor.com>
References: <20191106070146.18759-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: karl tsou <karl.funlab@gmail.com>

Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
(cherry picked from ndyer/linux/for-upstream commit 03477477ddbe5dcad42853ab3f84166a8f807acf)
[gdavis: Forward port and fix conflicts.]
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 9ee3b6d40c8c..81e3a71849c0 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -3128,6 +3128,15 @@ static int mxt_configure_objects(struct mxt_data *data,
 	return error;
 }
 
+/* Configuration crc check sum is returned as hex xxxxxx */
+static ssize_t mxt_config_crc_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct mxt_data *data = dev_get_drvdata(dev);
+
+	return scnprintf(buf, PAGE_SIZE, "%06x\n", data->config_crc);
+}
+
 /* Firmware Version is returned as Major.Minor.Build */
 static ssize_t mxt_fw_version_show(struct device *dev,
 				   struct device_attribute *attr, char *buf)
@@ -3481,12 +3490,14 @@ static DEVICE_ATTR(fw_version, S_IRUGO, mxt_fw_version_show, NULL);
 static DEVICE_ATTR(hw_version, S_IRUGO, mxt_hw_version_show, NULL);
 static DEVICE_ATTR(object, S_IRUGO, mxt_object_show, NULL);
 static DEVICE_ATTR(update_cfg, S_IWUSR, NULL, mxt_update_cfg_store);
+static DEVICE_ATTR(config_crc, S_IRUGO, mxt_config_crc_show, NULL);
 
 static struct attribute *mxt_attrs[] = {
 	&dev_attr_fw_version.attr,
 	&dev_attr_hw_version.attr,
 	&dev_attr_object.attr,
 	&dev_attr_update_cfg.attr,
+	&dev_attr_config_crc.attr,
 	NULL
 };
 
-- 
2.17.1

