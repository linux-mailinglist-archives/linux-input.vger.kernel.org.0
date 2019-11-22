Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0D931067D7
	for <lists+linux-input@lfdr.de>; Fri, 22 Nov 2019 09:25:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727362AbfKVIZN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Nov 2019 03:25:13 -0500
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:4430 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727387AbfKVIZM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Nov 2019 03:25:12 -0500
IronPort-SDR: l9k0sPvPyOvlbjB5cvYHUaDGy3l7LS7gwX4eTbxKrx2yg/r7lChIT4OpY9oqEoQUGnIuNu1rK5
 ntkI/E8G1S8edLRt6EaMFReZ1GB8wBL/M85wBpNGHuqK9f1D0X+HKkallT1kPKY/+6RTu3dmhf
 j/z8m4RuiAaAYMn2Glp3uZO6zTiRzKEMgTd5465DJNjtwF7/E9Fr0vv3oZ5no51bVliUkH27Em
 bEiVOyKZbW4zFj1p6sWLAhxT0C5bghcaT3WqT7hL2LG6dfaZsO6I1TkwlPBxZGkU+uioRQuC9J
 7bU=
X-IronPort-AV: E=Sophos;i="5.69,229,1571731200"; 
   d="scan'208";a="43419449"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 22 Nov 2019 00:25:12 -0800
IronPort-SDR: S/AZYVkvuzxGXz2j93hrAXYShck/ZomIlGZZ+HVArxlHZyXMQXepW7+ZUT4Nx3UGYhc3faMZca
 +dSZhzeYHyf6ANS/YMHs2qegGPZDtxBIODb6mt1YYFRYoHfFAf5Uwzk2DlcZd1jhqWXUg6zwCI
 Jk+DroXRhLI4cLgDTEs4+qHEfAdowV4dfURQZwUIXDSqcBKYsFfAYuCLUHwvSz0e5LSMMqKI5u
 zDQ0gSlZt9ovDhszA/yudR14dwPdnOyCrLuQ6PRlmaXIt/EcDVnL7umToLAN19NTON0MC13MF5
 JdE=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v6 18/48] Input: atmel_mxt_ts - add config checksum attribute to sysfs
Date:   Fri, 22 Nov 2019 17:23:32 +0900
Message-ID: <20191122082402.18173-19-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191122082402.18173-1-jiada_wang@mentor.com>
References: <20191122082402.18173-1-jiada_wang@mentor.com>
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

