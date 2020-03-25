Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 656771929ED
	for <lists+linux-input@lfdr.de>; Wed, 25 Mar 2020 14:35:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727842AbgCYNfR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Mar 2020 09:35:17 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:53177 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727841AbgCYNfR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Mar 2020 09:35:17 -0400
IronPort-SDR: hmVZ95EUR1bd4jFG43LVrAfX2UQzURZqy2WiPoNykKrKdo4x4yYpQZAMT/IMv5DyQiEyUGOlxz
 oCqCSlnZ1QQa0E7pf3SzLi2UtIaCyUemn+kV9GKzJ6TGGmT19i3TkUyyT9ri93emMru9LA2n2L
 9RNbDfG/oPojkO0sfFN2Nf/EF1P27NqWafpqnr4GDIpBmY5dSlH9n6AVDfJRNE36DlS19O7OKX
 FzsYcyVp3YhfpfyPZTec/b0icsJrZRV4IunDpi1DHPNc71DTu37eUxn1QtKkzwWJOX+A686y/X
 09A=
X-IronPort-AV: E=Sophos;i="5.72,304,1580803200"; 
   d="scan'208";a="47099711"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 25 Mar 2020 05:35:16 -0800
IronPort-SDR: PfbfrQHd7zN653eNLd+FsAiuGKJm4OzT24pz3mGUSahLNk66jEH3JBPLtKYmk55FB1VyFZHvEK
 6KScSgdy9t5oTAiQprEDfQe+qLLI4X/Q9nzK+uTELTy3ThYKZlfrzm5H7Gklm8f7MKI09gzP6U
 Ygoz0DqyVK0xjdwGHWi34pxmvmKTMvrWi3fVMOOSlAfg7+tr68kWHueAB7cCWxE4QLRGdWI+iW
 7PrAGCMalX3HCkT0qMMmysOnyRKRLMjEoP29HZAy2rqt7XGfJNcaCf+GIWfhIftKIqc4pW7cII
 GjM=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>, <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v9 24/55] Input: atmel_mxt_ts - add config checksum attribute to sysfs
Date:   Wed, 25 Mar 2020 06:33:03 -0700
Message-ID: <20200325133334.19346-25-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200325133334.19346-1-jiada_wang@mentor.com>
References: <20200325133334.19346-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: karl tsou <karl.funlab@gmail.com>

Add config checksum attribute to sysfs

Signed-off-by: karl tsou <karl.funlab@gmail.com>
Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
(cherry picked from ndyer/linux/for-upstream commit 03477477ddbe5dcad42853ab3f84166a8f807acf)
[gdavis: Forward port and fix conflicts.]
Signed-off-by: George G. Davis <george_davis@mentor.com>
[jiada: Add commit description
	Rename mxt_config_crc_show to config_crc_show
	Replace DEVICE_ATTR with DEVICE_ATTR_RO]
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index dfc20c0ca0a5..67931cf64629 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -3128,6 +3128,15 @@ static int mxt_configure_objects(struct mxt_data *data,
 	return error;
 }
 
+/* Configuration crc check sum is returned as hex xxxxxx */
+static ssize_t config_crc_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	struct mxt_data *data = dev_get_drvdata(dev);
+
+	return scnprintf(buf, PAGE_SIZE, "%06x\n", data->config_crc);
+}
+
 /* Firmware Version is returned as Major.Minor.Build */
 static ssize_t fw_version_show(struct device *dev,
 			       struct device_attribute *attr, char *buf)
@@ -3481,12 +3490,14 @@ static DEVICE_ATTR_RO(fw_version);
 static DEVICE_ATTR_RO(hw_version);
 static DEVICE_ATTR(object, S_IRUGO, mxt_object_show, NULL);
 static DEVICE_ATTR_WO(update_cfg);
+static DEVICE_ATTR_RO(config_crc);
 
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

