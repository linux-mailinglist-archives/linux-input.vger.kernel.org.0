Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B454D9DDD7
	for <lists+linux-input@lfdr.de>; Tue, 27 Aug 2019 08:28:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729056AbfH0G2k (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Aug 2019 02:28:40 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:48162 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728222AbfH0G2k (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Aug 2019 02:28:40 -0400
IronPort-SDR: ioR+ZrJCfe0zbw+l/u/05zOjEbXdJ3aJe25sKtM4UuJIX+pXt2SREEvtcXorvP0Xe9HX65MpgN
 roIjOOSkAy2o9kgHdnluzZoWPjHPZFq9kQ3bauwwO2WHeNFIy8zKkm2wsAGhz8isHq2eaQt7hc
 sZUNqhNpnwGNHJpziSs1Xt7+xy8ZXutCL23taO4GXYLEidCOqs2bCnt0OtJP8GXE/PA7arTUz3
 wdjRgfWKVq60JkoKlgAsnQjIqPT7Tje8ySh/FA7XPewuDSVmdTEc6oeUD9R2bdzgIycBSZRDSp
 eJc=
X-IronPort-AV: E=Sophos;i="5.64,436,1559548800"; 
   d="scan'208";a="40784498"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 26 Aug 2019 22:28:39 -0800
IronPort-SDR: deRt5p8R+EhP9FcgwUknmCS13pQ4lQUr/3axRNuD/7FtvPh0ScQFKf+Qv1jo5U6PI67OygTIup
 KSF6JGzRcNKYMSMRjoqzKVixnd2HLCLdZ8lBxM5ui+726RXknJ6QSuXL/2pJZi1g69lqdGvktl
 XtYX5xqgDaT+P5NTK9MPn5qLqKIwvab8tiPjesOOKRuBGtY8Z4FlWE9Yuz/MLHbi4LMovBoFgF
 nfM7QWWRRl2z4q7CfWaBTWIeeWolXRuCDHQwpIRWP95i4qXlTyg7lwY+aDKIOcJLgovrM/suTZ
 hKo=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v2 19/49] Input: atmel_mxt_ts - add config checksum attribute to sysfs
Date:   Tue, 27 Aug 2019 15:28:04 +0900
Message-ID: <20190827062834.20494-5-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190827062834.20494-1-jiada_wang@mentor.com>
References: <20190827062834.20494-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: svr-orw-mbx-04.mgc.mentorg.com (147.34.90.204) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
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
index 923ceb5118c5..77a1f8209cee 100644
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
2.19.2

