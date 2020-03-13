Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C692B18496D
	for <lists+linux-input@lfdr.de>; Fri, 13 Mar 2020 15:33:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726715AbgCMOds (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 Mar 2020 10:33:48 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:42025 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726754AbgCMOdr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 Mar 2020 10:33:47 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1jClNh-0007u2-PS; Fri, 13 Mar 2020 15:33:45 +0100
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, kernel@pengutronix.de,
        patchwork-lst@pengutronix.de
Subject: [PATCH v2 3/4] Input: exc3000: expose type, model and firmware revision as sysfs attributes
Date:   Fri, 13 Mar 2020 15:33:44 +0100
Message-Id: <20200313143345.28565-3-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200313143345.28565-1-l.stach@pengutronix.de>
References: <20200313143345.28565-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This can be used by userspace to determine if a firmware update should be
started.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
v2:
- use devm_device_add_group
---
 drivers/input/touchscreen/exc3000.c | 47 +++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/input/touchscreen/exc3000.c b/drivers/input/touchscreen/exc3000.c
index 8d170bac182d..28621389917c 100644
--- a/drivers/input/touchscreen/exc3000.c
+++ b/drivers/input/touchscreen/exc3000.c
@@ -209,6 +209,48 @@ static int exc3000_vendor_data_request(struct exc3000_data *data, u8 *request,
 
 	return ret;
 }
+
+static ssize_t exc3000_sysfs_type_show(struct device *dev,
+				       struct device_attribute *dattr,
+				       char *buf)
+{
+	struct exc3000_data *data = dev_get_drvdata(dev);
+
+	return scnprintf(buf, PAGE_SIZE, "%s\n", data->type);
+}
+static DEVICE_ATTR(type, 0444, exc3000_sysfs_type_show, NULL);
+
+static ssize_t exc3000_sysfs_model_show(struct device *dev,
+					struct device_attribute *dattr,
+					char *buf)
+{
+	struct exc3000_data *data = dev_get_drvdata(dev);
+
+	return scnprintf(buf, PAGE_SIZE, "%s\n", data->model);
+}
+static DEVICE_ATTR(model, 0444, exc3000_sysfs_model_show, NULL);
+
+static ssize_t exc3000_sysfs_fw_rev_show(struct device *dev,
+					 struct device_attribute *dattr,
+					 char *buf)
+{
+	struct exc3000_data *data = dev_get_drvdata(dev);
+
+	return scnprintf(buf, PAGE_SIZE, "%s\n", data->fw_rev);
+}
+static DEVICE_ATTR(fw_rev, 0444, exc3000_sysfs_fw_rev_show, NULL);
+
+static struct attribute *exc3000_fw_info_attrs[] = {
+	&dev_attr_type.attr,
+	&dev_attr_model.attr,
+	&dev_attr_fw_rev.attr,
+	NULL
+};
+
+static const struct attribute_group exc3000_fw_info_attr_group = {
+	.attrs = exc3000_fw_info_attrs,
+};
+
 static int exc3000_populate_device_info(struct exc3000_data *data)
 {
 	struct device *dev = &data->client->dev;
@@ -263,6 +305,10 @@ static int exc3000_populate_device_info(struct exc3000_data *data)
 	if (!data->fw_rev)
 		return -ENOMEM;
 
+	ret = devm_device_add_group(dev, &exc3000_fw_info_attr_group);
+	if (ret)
+		return ret;
+
 	dev_info(&data->client->dev,
 		 "found type %s, model %s, firmware revision %s",
 		 data->type, data->model, data->fw_rev);
@@ -314,6 +360,7 @@ static int exc3000_probe(struct i2c_client *client,
 	if (error)
 		return error;
 
+	dev_set_drvdata(&client->dev, data);
 	error = exc3000_populate_device_info(data);
 	if (error)
 		return error;
-- 
2.20.1

