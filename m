Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7348199418
	for <lists+linux-input@lfdr.de>; Tue, 31 Mar 2020 12:53:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730543AbgCaKwm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 31 Mar 2020 06:52:42 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:43589 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730410AbgCaKwl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 31 Mar 2020 06:52:41 -0400
IronPort-SDR: WSr5aFtAVBAuO1ZWcPTOFCeH/XzbFvsNUj077Jakg7miE2nWDdGe0fSPZzWPJ6IG7vWk3GEjOC
 r+mqnvv+q/6lcRR+q4Si5wTYDxTCZHpBDTCaUIieJ7VWsvOyHgX1kJbWtLxWyMhD8EetqCzibN
 aiviAJQDioH5BiR4tEIeMXTy9br33pIEigoBzCjTr4UJdgwl3LrMHHpUpdbq8KuswscwcHrzuu
 NbT64ypXEnRZ9WvwqVYLNusiwtGvuWtaGjnPbJGn5oEfpe3t45c13ys89ociWElJJUL5U4DPih
 rgw=
X-IronPort-AV: E=Sophos;i="5.72,327,1580803200"; 
   d="scan'208";a="47330781"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 31 Mar 2020 02:52:27 -0800
IronPort-SDR: xYj3WjZ7xzVpP3B4o0FJ2Bxp3/qRGU9qWd4U/9rbi0ZdfHQshd1hTq+dW7+P6i025nQ5szXVoB
 oTK7CsXGh4SyPDMgBv2yhgDxnxBe9wRBA2XMpTkGcqajiQX3gVeqPNDm9cpsLX+QkFFvBwoKHO
 +1KZfBpq837YmFiyikJzHyJyhtywwJ44/rTow5eJnNegNOQZGO5+IZ6sGqbDefSiPQm4B9F26r
 FzF0dywtIuOD8UBrOsQeEAWzO2pUu3zvZsM154AU8NYLNsJofPxM80GvKLhukznnzDRovaHARY
 E0s=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v10 24/55] Input: atmel_mxt_ts - add config checksum attribute to sysfs
Date:   Tue, 31 Mar 2020 03:50:20 -0700
Message-ID: <20200331105051.58896-25-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200331105051.58896-1-jiada_wang@mentor.com>
References: <20200331105051.58896-1-jiada_wang@mentor.com>
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

