Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D134302A32
	for <lists+linux-input@lfdr.de>; Mon, 25 Jan 2021 19:29:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726179AbhAYS1d (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 Jan 2021 13:27:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726677AbhAYS0e (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Jan 2021 13:26:34 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39645C061788
        for <linux-input@vger.kernel.org>; Mon, 25 Jan 2021 10:25:32 -0800 (PST)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1l46YL-00041I-QM; Mon, 25 Jan 2021 19:25:29 +0100
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-input@vger.kernel.org, kernel@pengutronix.de,
        patchwork-lst@pengutronix.de
Subject: [PATCH v3 4/5] Input: exc3000 - add type sysfs attribute
Date:   Mon, 25 Jan 2021 19:25:26 +0100
Message-Id: <20210125182527.1225245-5-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210125182527.1225245-1-l.stach@pengutronix.de>
References: <20210125182527.1225245-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add a sysfs attribute to query the type of the touchscreen device.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 .../ABI/testing/sysfs-driver-input-exc3000      |  9 +++++++++
 drivers/input/touchscreen/exc3000.c             | 17 +++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-driver-input-exc3000 b/Documentation/ABI/testing/sysfs-driver-input-exc3000
index cd7c578aef2c..704434b277b0 100644
--- a/Documentation/ABI/testing/sysfs-driver-input-exc3000
+++ b/Documentation/ABI/testing/sysfs-driver-input-exc3000
@@ -15,3 +15,12 @@ Description:    Reports the model identification provided by the touchscreen, fo
 		Access: Read
 
 		Valid values: Represented as string
+
+What:		/sys/bus/i2c/devices/xxx/type
+Date:		Jan 2021
+Contact:	linux-input@vger.kernel.org
+Description:	Reports the type identification provided by the touchscreen, for example "PCAP82H80 Series"
+
+		Access: Read
+
+		Valid values: Represented as string
diff --git a/drivers/input/touchscreen/exc3000.c b/drivers/input/touchscreen/exc3000.c
index ae06290a4c45..74ba03dcaaf7 100644
--- a/drivers/input/touchscreen/exc3000.c
+++ b/drivers/input/touchscreen/exc3000.c
@@ -298,9 +298,26 @@ static ssize_t model_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(model);
 
+static ssize_t type_show(struct device *dev,
+			  struct device_attribute *attr, char *buf)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct exc3000_data *data = i2c_get_clientdata(client);
+	u8 response[EXC3000_LEN_FRAME];
+	int ret;
+
+	ret = exc3000_vendor_data_request(data, (u8[]){'F'}, 1, response, 1);
+	if (ret < 0)
+		return ret;
+
+	return sprintf(buf, "%s\n", &response[1]);
+}
+static DEVICE_ATTR_RO(type);
+
 static struct attribute *sysfs_attrs[] = {
 	&dev_attr_fw_version.attr,
 	&dev_attr_model.attr,
+	&dev_attr_type.attr,
 	NULL
 };
 
-- 
2.20.1

