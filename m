Return-Path: <linux-input+bounces-16723-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B644CE5D7F
	for <lists+linux-input@lfdr.de>; Mon, 29 Dec 2025 04:20:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DAE3A302F803
	for <lists+linux-input@lfdr.de>; Mon, 29 Dec 2025 03:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 434B6274B53;
	Mon, 29 Dec 2025 03:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iacaLUk3"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE702272E7C
	for <linux-input@vger.kernel.org>; Mon, 29 Dec 2025 03:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766978291; cv=none; b=HuEatQ72NgzURAK34KzNmImycvz6+NFe0ltHe/veTMX5P/GsO/Apv+SDK1sbZkcrk4v7THCEltXqBScY4eB5TbCj/PXneMZzAtdGJ1owZqtbh3T8u1H1zjplFQBPLOFxkUU82BumrIdvXX9vSkY45fYeg1x7d8XNm55SCjnZZGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766978291; c=relaxed/simple;
	bh=X263MocZ1Dz5lSyiIa/ApKNLtn8LzJpAs2PJ0aYdw1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gRqPPlynqur1yDig++5t34bIGECqVUvAHQcGgnmGZJ3d3523O1vkyaJsFxr638T29OA8iFR7ulFcOl2pnjBDzV84LklcgQd7pp6R71xIzUHFQwGdXMjAcdWdU1WJzftIedz66AL3WEYl/o+Z4et11BCGYE/oYulTR52yFoOKt3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iacaLUk3; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a0d06ffa2aso107736175ad.3
        for <linux-input@vger.kernel.org>; Sun, 28 Dec 2025 19:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766978286; x=1767583086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MrGC9JWDCaxJgv6rvmu39tdxxA/sQpLqKQTMa9mrb4s=;
        b=iacaLUk3nMfNHEybQMMsLwlCv2tL/ICNvpWzHsIAAFohD/w1Pm7wt42SFubR/SWenb
         u5JgG2ss622uIMUyDCe+couOewqlI2xXKrZ73j8n4xehVS6Xzr+RaD1l/aO+AmGEkP/+
         w+yGCSKsXXX+9lmp2z48lIqVZiMHCx7RmxONjl7Q5RAFLD3kY3G98V8vO9QPGYA4Gnwt
         WmAx3T+9xL4Ljt597TJpwuQRbhtBcPan5S7oE1aboGM+g/Wy+soE8d3FA7c19hjlJiHy
         lA47rnjBGieXC2zNbHr+kpGtfdtMcp1aKRihOQWbu9bJt8QJ2BTIaQtQ2jRqwO9KUx7j
         z60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766978286; x=1767583086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MrGC9JWDCaxJgv6rvmu39tdxxA/sQpLqKQTMa9mrb4s=;
        b=iQ3u0HMXcXzwYpeTl6ttSvt9FWkuitKe4r+OYHbmt+/yMdydYgpLPItrwknY4QxvaC
         6ehQ0bmRyFwPaiREdEYXAdamyKhqFkylU9rXk/0tvPKCSlHC3nEEuyGFSCjuhrNBPmKd
         4LSUUSpa5L993g65JIygqKA/IFFGsz/Y/pFNcaVH9fwqwsLM/WERMuYV6aahH/+QhpXJ
         xPbauEHZEvzYX9Mrln5uzwVw1wmkGSQiJxyuQGwKua/Z0S5ewh8iTSpsOQDE1D/4kYBX
         lQgy/SFa0WpXRcRVZuny3WB7/n2RfVw/EQqz8Rghzdc/XxEgxq+uL/Gq9uGDMDNGa8zO
         Khdg==
X-Forwarded-Encrypted: i=1; AJvYcCXZWH/xItGH2TCh62bSNBte3U8PLPN+BxUIoUG6DMbFM5FhwwecBXwSitD4fFRfN6+r3E88zBxAC8yYsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ0pm1LvfBYTss381aHgsjHlwgJYR8UhjinXyeIC0GTaHND+Z8
	GVxt4/pP3ZGCQuvtqOY5C9efkZAlbHfN78+SFHTMH+xn6pXXXcuV+6wz
X-Gm-Gg: AY/fxX6FzZWQylJ+2BdIYaEOAJp/R4Au5Pr0N9ZwTffHDPVPy2NzxpBwZ12CV1Iq71z
	eMyPvOkbow+xk7VS1banG7SAy057Z1gLJXHWHOO4ZR3exrkguN2R7W2GXy1Rp5RFB8Uylcwj2Rf
	oPvIycqWignovR8VG0Xc8yFtdKJlaRsNYRknCsI6y8c09drBx64pBAfN806Q4fUhoWkmew1SSab
	g4QXITDQ8a8pV7dv9jFk25cJ77a+gk7fbLQO6yVxfLiklTosfyLvzafSM4pPbzB+/Fi71zmwtvE
	YB+lwlm80IvDGKr4tD9SXRhDuUkKAi1BN7W1CbrC9IABCSSsOUfQvf4KtUSl5QZE4dCMmpTlP8r
	1I5rsDJTHznD424buRGJcAedxraem3mriRA2UCK8lmBewIKQPeE2P470X/InEJLfepkuiOOApAD
	Q8+lU0UHhqRYxSDMz5TY2L7HhEM9ea+iugE0cyR4sFnJVMlgNRouKPZnMSqS0dcWyRwWs1Z9Ybn
	A==
X-Google-Smtp-Source: AGHT+IEM02CMJY2VQsw38v3sA96MHZUfuoCRegT+hQCz1o5/LKIzBteu28U364+Nmkl6le9V8oo7Jg==
X-Received: by 2002:a05:7022:150d:b0:11b:9386:7ecd with SMTP id a92af1059eb24-121722fa7c2mr27864612c88.42.1766978286401;
        Sun, 28 Dec 2025 19:18:06 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724dd7f5sm112992785c88.5.2025.12.28.19.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 19:18:06 -0800 (PST)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Zhixin Zhang <zhangzx36@lenovo.com>,
	Mia Shao <shaohz1@lenovo.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/16] HID: hid-lenovo-go-s: Add MCU ID Attribute
Date: Mon, 29 Dec 2025 03:17:48 +0000
Message-ID: <20251229031753.581664-12-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251229031753.581664-1-derekjohn.clark@gmail.com>
References: <20251229031753.581664-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds command to probe for the MCU ID of the Lenovo Legion Go S
Controller and assign it to a device attribute.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/hid/hid-lenovo-go-s.c | 56 +++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/hid/hid-lenovo-go-s.c b/drivers/hid/hid-lenovo-go-s.c
index 3e9041e746df..36cee6c3d4cc 100644
--- a/drivers/hid/hid-lenovo-go-s.c
+++ b/drivers/hid/hid-lenovo-go-s.c
@@ -17,6 +17,7 @@
 #include <linux/mutex.h>
 #include <linux/printk.h>
 #include <linux/string.h>
+#include <linux/sysfs.h>
 #include <linux/types.h>
 #include <linux/unaligned.h>
 #include <linux/usb.h>
@@ -34,8 +35,13 @@ struct hid_gos_cfg {
 	struct completion send_cmd_complete;
 	struct hid_device *hdev;
 	struct mutex cfg_mutex; /*ensure single synchronous output report*/
+	u8 mcu_id[12];
 } drvdata;
 
+struct gos_cfg_attr {
+	u8 index;
+};
+
 struct command_report {
 	u8 cmd;
 	u8 sub_cmd;
@@ -70,6 +76,14 @@ static int hid_gos_version_event(u8 *data)
 	return 0;
 }
 
+static int hid_gos_mcu_id_event(struct command_report *cmd_rep)
+{
+	drvdata.mcu_id[0] = cmd_rep->sub_cmd;
+	memcpy(&drvdata.mcu_id[1], cmd_rep->data, 11);
+
+	return 0;
+}
+
 static u8 get_endpoint_address(struct hid_device *hdev)
 {
 	struct usb_interface *intf = to_usb_interface(hdev->dev.parent);
@@ -103,6 +117,9 @@ static int hid_gos_raw_event(struct hid_device *hdev, struct hid_report *report,
 	case GET_VERSION:
 		ret = hid_gos_version_event(data);
 		break;
+	case GET_MCU_ID:
+		ret = hid_gos_mcu_id_event(cmd_rep);
+		break;
 	default:
 		ret = -EINVAL;
 		break;
@@ -160,10 +177,41 @@ static int mcu_property_out(struct hid_device *hdev, u8 command, u8 index,
 	return ret;
 }
 
+static ssize_t mcu_id_show(struct device *dev, struct device_attribute *attr,
+			   char *buf)
+{
+	return sysfs_emit(buf, "%*phN\n", 12, &drvdata.mcu_id);
+}
+
+/* MCU */
+static DEVICE_ATTR_RO(mcu_id);
+
+static struct attribute *legos_mcu_attrs[] = {
+	&dev_attr_mcu_id.attr,
+	NULL,
+};
+
+static const struct attribute_group mcu_attr_group = {
+	.attrs = legos_mcu_attrs,
+};
+
+static const struct attribute_group *top_level_attr_groups[] = {
+	&mcu_attr_group,
+	NULL,
+};
+
 static void cfg_setup(struct work_struct *work)
 {
 	int ret;
 
+	/* MCU */
+	ret = mcu_property_out(drvdata.hdev, GET_MCU_ID, FEATURE_NONE, 0, 0);
+	if (ret) {
+		dev_err(&drvdata.hdev->dev, "Failed to retrieve MCU ID: %i\n",
+			ret);
+		return;
+	}
+
 	ret = mcu_property_out(drvdata.hdev, GET_VERSION, FEATURE_NONE, 0, 0);
 	if (ret) {
 		dev_err(&drvdata.hdev->dev,
@@ -187,6 +235,13 @@ static int hid_gos_cfg_probe(struct hid_device *hdev,
 	drvdata.hdev = hdev;
 	mutex_init(&drvdata.cfg_mutex);
 
+	ret = sysfs_create_groups(&hdev->dev.kobj, top_level_attr_groups);
+	if (ret) {
+		dev_err_probe(&hdev->dev, ret,
+			      "Failed to create gamepad configuration attributes\n");
+		return ret;
+	}
+
 	init_completion(&drvdata.send_cmd_complete);
 
 	/* Executing calls prior to returning from probe will lock the MCU. Schedule
@@ -207,6 +262,7 @@ static void hid_gos_cfg_remove(struct hid_device *hdev)
 {
 	guard(mutex)(&drvdata.cfg_mutex);
 	cancel_delayed_work_sync(&drvdata.gos_cfg_setup);
+	sysfs_remove_groups(&hdev->dev.kobj, top_level_attr_groups);
 	hid_hw_close(hdev);
 	hid_hw_stop(hdev);
 	hid_set_drvdata(hdev, NULL);
-- 
2.51.2


