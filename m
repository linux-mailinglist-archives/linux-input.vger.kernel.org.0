Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1C268FE52
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2019 10:41:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727253AbfHPIkF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Aug 2019 04:40:05 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:27764 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727575AbfHPIkE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Aug 2019 04:40:04 -0400
IronPort-SDR: xz5G3kzr1PpqPVF9DnBt+iw4OVQV3xO5LzTg96klTkPb5WcmDU2VoE7Oaz+p35tR7rKSZKYrkg
 lCG7jr96sI+A4sG7iKvXWtQN70iwKTSebOUs0YRcAm0/9AIbfrCd2fJ8IU/uv37PPu5CURUDwP
 cLhp5QI/vRy3xXP1FKXt6Zbuf2GKhmYFdneVbjpNitp7K4Yz7MiypWynpJlnJ3X4NEfQKr6AEG
 aYspZO3OeiOV4WNwroh42FxHdJOXZOUNGZhLrBaKHvECxJ7GJKRqLUo9MDBeFRVIbY94JKly4O
 0/Q=
X-IronPort-AV: E=Sophos;i="5.64,391,1559548800"; 
   d="scan'208";a="40484246"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 16 Aug 2019 00:32:58 -0800
IronPort-SDR: cOWxn1GS6OhR2EzAAfq+GSQu+yyU3QackfO41LJpuJKuxZIl0FudhhWraYJD3ilxNzDqs9MLaR
 6FutsMkbuQWD2Ae0KMOKKRzjX9w2o4dI0rYJmpW5TA3wNpxrSIe4EhjUDZKAsJ4NPNv2gsNnEC
 7mtXWufrN3yJ0aeuwI0Ujr/M0q086eSX/qpqa7ENNCNqaDMX1wcrcpJFI4HRvNCPNAOU3RMeH2
 yxLuLcxfqQFbS8LH/VQDMrZdSGd3CjThyUepjjGex8yJr/d7S6MoF1KDUQcs0t/ANJGCjxWXmm
 zUQ=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v1 18/63] Input: atmel_mxt_ts - add config checksum attribute to sysfs
Date:   Fri, 16 Aug 2019 17:32:12 +0900
Message-ID: <20190816083257.18546-4-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190816083257.18546-1-jiada_wang@mentor.com>
References: <20190816083257.18546-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: svr-orw-mbx-02.mgc.mentorg.com (147.34.90.202) To
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
index 4f335c3da994..a4f8364ecca9 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -3122,6 +3122,15 @@ static int mxt_configure_objects(struct mxt_data *data,
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
@@ -3475,12 +3484,14 @@ static DEVICE_ATTR(fw_version, S_IRUGO, mxt_fw_version_show, NULL);
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

