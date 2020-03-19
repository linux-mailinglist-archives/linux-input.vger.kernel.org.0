Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 487DC18BA00
	for <lists+linux-input@lfdr.de>; Thu, 19 Mar 2020 16:02:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728009AbgCSPBv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Mar 2020 11:01:51 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:16057 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727587AbgCSPBv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Mar 2020 11:01:51 -0400
IronPort-SDR: TNgvDA/KA46KYzSH5F2jb3EAU33a5W1Q+RTaPW6EdIcB59dPMeuH0sxMeN2Y4GJrrd7peXTKOC
 /g7mZrajPqWNAbMAKJVIEoTA/yBIDTBaC/okhNNXK2Vlr2mO3QeTL5XfgIEOmxmcq2BQqcPDrc
 1NBuP8De3UysYhHURT4XGWkKRt88m2zq5Q6wRjlYvqd6ARaUe4K124FcKl+CuS/CvKE75RKNU/
 n9mqtSrrbiK8Dn1/xWF7SC6gaZfRQPdlhX7EenKrUPUrHgtoMKnow9WaVCfO3fe4G2PP+pxWW2
 0sw=
X-IronPort-AV: E=Sophos;i="5.70,572,1574150400"; 
   d="scan'208";a="48850273"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 19 Mar 2020 07:01:44 -0800
IronPort-SDR: GifHhdW9reHsOWogjSgcwZvkwmP2j3u57IFc+zwcZktN6TY/ZF53GcsTXew8owpgGEh54bcg2x
 pqr6Y1x5eXBTTihMFbUoRJqxJkGVpgJb9upEXMlcq+OKoa9o07Ny8mS5F9oriulCjOzngd75S7
 fqxcrmsNRSjdztUypj1wPMEhu4+zN5azZ271UgFNp0AKEhVWxfJhBkgS48Z4sLQK0hqexQiyZN
 f7XhGGtxz2gS2+krkbFimkyjt+NmkTNRzlYsJTGaEDrt3DjytqZot7IQbm02Akz0oogQJ2SRhS
 +I0=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>, <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v8 21/52] Input: atmel_mxt_ts - add config checksum attribute to sysfs
Date:   Thu, 19 Mar 2020 07:59:45 -0700
Message-ID: <20200319150016.61398-22-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200319150016.61398-1-jiada_wang@mentor.com>
References: <20200319150016.61398-1-jiada_wang@mentor.com>
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
	Change Symbolic permissions 'S_IRUGO' to 0444]
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index c884c254ad2d..7441dc71bbab 100644
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
 static DEVICE_ATTR(update_cfg, 0200, NULL, mxt_update_cfg_store);
+static DEVICE_ATTR(config_crc, 0444, mxt_config_crc_show, NULL);
 
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

