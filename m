Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B4881CA333
	for <lists+linux-input@lfdr.de>; Fri,  8 May 2020 07:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727964AbgEHF6j (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 May 2020 01:58:39 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:38715 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726325AbgEHF6h (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 May 2020 01:58:37 -0400
IronPort-SDR: k4w5bE0IfG/9q0oozAj0dg7WD4gOnWpnkfigWXICqFYbIxaUxLAZwRkbIRFGIG1hFU3re9zq2F
 tePF+0Ja51GQ/kthVrxNif6soi66qPSe8QNmQn4CkOim2PsFJ//TUhW2x4xfksoqMKIUSJulyz
 JJQGsS+01X58W6oe/mpidjFm2YRUxTeFNruzvxcpMrTqCgw07OPokIV9T5oDiHyOoc8HoOtmT4
 TlZ2xRxHzDBBodGUMYcMWbj7fABPWn6nxSmusOQduUyLK/ZXVICo7F/qZw3ucwoA8uzXeb4myw
 v3A=
X-IronPort-AV: E=Sophos;i="5.73,366,1583222400"; 
   d="scan'208";a="50670094"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 07 May 2020 21:58:35 -0800
IronPort-SDR: gaOKQOPg0wMl4YVGAFmvieHGkAxL/K4e31nEbZnhxMELlNVcA/PHCoQw3xnAxpVQ33+mOFNxOl
 qwOZFb6PMFRiUo3ZruP/yovJ4lbaJMF5bU3tFPIRE9f+yR3dZ5RWj6r+Nl9uT1ZvOGtxza+sVY
 ebRIZGGoGcszokmqRxuSsVi+qpwsPfK89OkNHpNCsVgLv6tz/FmieTo/WZRcygmcpHJZF2y63K
 7TJdTElbWaoN0gDe0UwZgTpQuTgprnZcO9ZOaEMcxbQlKFMFjPQTgX8ZFDEqcwCxRxhVI9a80X
 A9g=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v11 25/56] Input: atmel_mxt_ts - add config checksum attribute to sysfs
Date:   Thu, 7 May 2020 22:56:25 -0700
Message-ID: <20200508055656.96389-26-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200508055656.96389-1-jiada_wang@mentor.com>
References: <20200508055656.96389-1-jiada_wang@mentor.com>
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
index affd2bf32969..780850343089 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -3124,6 +3124,15 @@ static int mxt_configure_objects(struct mxt_data *data,
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
@@ -3477,12 +3486,14 @@ static DEVICE_ATTR_RO(fw_version);
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

