Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7F82132CD1
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2020 18:17:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728321AbgAGRRn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Jan 2020 12:17:43 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:55501 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728348AbgAGRRn (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Jan 2020 12:17:43 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1iosU9-00057y-EP; Tue, 07 Jan 2020 18:17:41 +0100
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, patchwork-lst@pengutronix.de,
        kernel@pengutronix.de, Chris Healy <cphealy@gmail.com>
Subject: [PATCH 3/4] Input: exc3000: expose type, model and firmware revision as sysfs attributes
Date:   Tue,  7 Jan 2020 18:17:39 +0100
Message-Id: <20200107171741.10856-3-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200107171741.10856-1-l.stach@pengutronix.de>
References: <20200107171741.10856-1-l.stach@pengutronix.de>
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
 drivers/input/touchscreen/exc3000.c | 54 +++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/input/touchscreen/exc3000.c b/drivers/input/touchscreen/exc3000.c
index accee4fd1b97..ce83914d65ff 100644
--- a/drivers/input/touchscreen/exc3000.c
+++ b/drivers/input/touchscreen/exc3000.c
@@ -259,6 +259,47 @@ static int exc3000_populate_device_info(struct exc3000_data *data)
 	return 0;
 }
 
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
+static struct attribute *exc3000_attrs[] = {
+	&dev_attr_type.attr,
+	&dev_attr_model.attr,
+	&dev_attr_fw_rev.attr,
+	NULL
+};
+
+static const struct attribute_group exc3000_attr_group = {
+	.attrs = exc3000_attrs,
+};
+
 static int exc3000_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
@@ -285,6 +326,11 @@ static int exc3000_probe(struct i2c_client *client,
 	if (error)
 		return error;
 
+	dev_set_drvdata(&client->dev, data);
+	error = sysfs_create_group(&client->dev.kobj, &exc3000_attr_group);
+	if (error)
+		return error;
+
 	input = devm_input_allocate_device(&client->dev);
 	if (!input)
 		return -ENOMEM;
@@ -310,6 +356,13 @@ static int exc3000_probe(struct i2c_client *client,
 	return 0;
 }
 
+int exc3000_remove(struct i2c_client *client)
+{
+	sysfs_remove_group(&client->dev.kobj, &exc3000_attr_group);
+
+	return 0;
+}
+
 static const struct i2c_device_id exc3000_id[] = {
 	{ "exc3000", 0 },
 	{ }
@@ -331,6 +384,7 @@ static struct i2c_driver exc3000_driver = {
 	},
 	.id_table	= exc3000_id,
 	.probe		= exc3000_probe,
+	.remove		= exc3000_remove,
 };
 
 module_i2c_driver(exc3000_driver);
-- 
2.20.1

