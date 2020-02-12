Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D97F15A390
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2020 09:45:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728638AbgBLIow (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Feb 2020 03:44:52 -0500
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:29711 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728493AbgBLIow (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Feb 2020 03:44:52 -0500
IronPort-SDR: U29lGl+PWnu5JzqN2qMtJnIiEkFwpAMDFm5N6j18A740pSVW9JLbKI0pwJiz0wTfXUyy6lm3nC
 Ud0QaGWboGEnx+O51Z8xrL+6S9P40w1HMc+adCXqP6glzx/YlPnF0edlGA3UrAPBmQRfi1zR+G
 UpnTCZslehcoWbN1UWocHOS2m9MWSMcLlysYIw3NHJXgjpltmruf1EpUpz1iEZIz/urv5bXZGS
 EikMdNjJBE6lksnCPAbCGaGfsbJknMY/hq3B4RoupwMl58FS9OXjW4/1gF570V7pnMzYvS+BLk
 Xjs=
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; 
   d="scan'208";a="47667028"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 12 Feb 2020 00:44:51 -0800
IronPort-SDR: AfCvXqD33tg1qg+gf0WZFokOgbHzA3U+M8HiZLDjUFwCo2HARRKbaMCB3w1LfZwN5EqhxZJ5o4
 kl5aB6Lj5jH3Neip+uU0uhRu3SoQ5I+H+kYVZpwsYsuwy3Vt0KmCW8ce1Fx1QQKfUO094cdVrg
 XGa27JssPnIbdllN6QhBu7h4fPeOY83aRAVjcaeaQgmsAm2n2DGO2eQ3XjQQIwegzIpo3/HQ0V
 I0ELtkXn6VVqgL+ALIGf40vEI+nJJ2GchhJFAltwiLeoPVBGwCcJghGNb/jvzMQIF9Xu08eaje
 lAw=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>, <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v7 18/48] Input: atmel_mxt_ts - add config checksum attribute to sysfs
Date:   Wed, 12 Feb 2020 00:41:48 -0800
Message-ID: <20200212084218.32344-19-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200212084218.32344-1-jiada_wang@mentor.com>
References: <20200212084218.32344-1-jiada_wang@mentor.com>
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
index b0a07d077016..7abaca26dcba 100644
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

