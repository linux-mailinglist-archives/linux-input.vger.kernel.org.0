Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C92FB4AD1
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 11:39:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728493AbfIQJjG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Sep 2019 05:39:06 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:59351 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728479AbfIQJjF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Sep 2019 05:39:05 -0400
IronPort-SDR: /+XDldrwZK1RVt2U20CTYZLEM+oVy8eAq/caijhHeq5DTlBoawQRxl/Ozc24Hb0l5mmKiblJdR
 4KFctO07X1dIQ79YrLMlS7F0aMAf4OqHagYOx+7LAN7wtwR7AwX8xyrgBEp0hPOf768zDKUV2U
 aGHgM9EW/Zvd1RVYRXsM6CaoFgeBRXQ0YrSlk1ADMj1iQ+4VJTPjwz38Cxlllnj4LAozR6lvoV
 NgnFie+6eKfS7JfgIfjwdYBDBvcAmMsfiYdcyI8KCbc2Mi4QkCw2ug/VFRuJpZREQRzmJY79ZE
 RHs=
X-IronPort-AV: E=Sophos;i="5.64,515,1559548800"; 
   d="scan'208";a="43223077"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 17 Sep 2019 01:39:04 -0800
IronPort-SDR: 4fzFS0XbHp5G00Lmy9BfjSjOiGQ9SpFgsLYHI17m6lEWNM65EDZfni4NpyQGisu3AwFYlr2qIL
 rTJLwoaHpBfvLkGSverp3B179NGHJgt11A3z0yKwe9lVNgT5QCHc564ykXmq1bG5rpLeYtO9eK
 3d0OdD0U9dqh1VBn7aw6x2Sut9dr+Ebc5sx9JTpVVMY59bRLWjRYDyQ/ePj8zchZ2Ph1dPXDfe
 8VNT6Rq0X5fGK9BcX3SpErp8eCJSrTc2zAMCVZyxNHADWfPe0gWylWYnQDuFlcxK7BzoVVWDp0
 Wr4=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>
Subject: [PATCH v3 19/49] Input: atmel_mxt_ts - add config checksum attribute to sysfs
Date:   Tue, 17 Sep 2019 18:37:36 +0900
Message-ID: <20190917093806.18538-5-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190917093806.18538-1-jiada_wang@mentor.com>
References: <20190917093806.18538-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: svr-orw-mbx-08.mgc.mentorg.com (147.34.90.208) To
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
index f0522f4416dc..69e34294688c 100644
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

