Return-Path: <linux-input+bounces-16718-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1ECCE5D43
	for <lists+linux-input@lfdr.de>; Mon, 29 Dec 2025 04:18:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E080301A1AC
	for <lists+linux-input@lfdr.de>; Mon, 29 Dec 2025 03:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE74727603A;
	Mon, 29 Dec 2025 03:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d5pCa1VH"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DF525785E
	for <linux-input@vger.kernel.org>; Mon, 29 Dec 2025 03:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766978285; cv=none; b=SqYCrR0EvCXaYpwLuksCwFmuTgQYs9yqHZSRiwjIMta0yxDZJ31bZcQoIZflPyZbl9YEfhXOATc5nToWqIv3j3HhR03pEVxJwycsQby2YUTxzvaik48PFW9hV5MksKAi2fyY86ujjWDF5NBDPpYRzWvcTTo/m5EOF//W7XEfZbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766978285; c=relaxed/simple;
	bh=jyYAuYoqThQ9IaQhCI0DxLxP8eJMA3q2OZLB0+BZ01U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S2x7jKuFRs/KwP4GgXDjDkIVINfaXHTP4+8zhl+ywtPfvLt0lcooEDTG3Z54DskwXP6sxeR7OzxL9S3JUiK05lVsAmeQRNo/LOAg4+dA3E3UC4fo58oCODEFd6mpe/cr6gg9GTodAERzdNAuqwvCJRnd0ceAhJ9aiJOnm57E39k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d5pCa1VH; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c0c24d0f4ceso5081172a12.1
        for <linux-input@vger.kernel.org>; Sun, 28 Dec 2025 19:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766978282; x=1767583082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MKgim0dSrRrM4iK8owH+2zFzPvmukRMS6uSeUVSPKuE=;
        b=d5pCa1VHFZz62R22BxR0NlOKtSWIA7w9ZQLirVUgg6ITzSz2E0gubI0aOGg5wTu891
         3x5BpTLiZvMB7B0G+vlOFq7kRnYDeXaLEnri7vST9Aj8FJagwhrqtllZnulmX5SCMmZL
         tBfTbppNLkgW8hk6yLaDz0V1Ygy6nopgA2VEFOPwYN3vUU18WxVF6iP541XZyWIaNFr5
         W4DPoMYt2r+cmGyuhbFTBa8XT4ahv9N+eJjaG8b1yfORwn2gNPWVJ8aAnsZQ/yXp191g
         pUmhGu7Y7f7NRftJvB9jK2U/4Aeh04kKFtB4rDAQFHlM172UPUFhZSYrZ4+F7SvbCxa2
         gJTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766978282; x=1767583082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MKgim0dSrRrM4iK8owH+2zFzPvmukRMS6uSeUVSPKuE=;
        b=lAxGAEi6QtsfsJJ48Ed7t31czVUYFDwfKXkcduR0ShyifX8XiRVT6Sb/4MAVYFt6Em
         UaxMIbayAgo8uSk1DfpqssnBYMKmKMcE9/q094vQkmgxhBQ8Pw3Lufxw3WL7meLKd+UR
         JvAYZ0G5qM+B0BRXpu0CU8jCHjFB6VncQFgNDhXMjRcgCm7Uk8Vq9TdEyBokbLMqd4f4
         tFWXnlDHUfBReodiDluUAy7chBJa4l/IqhLUJ3UT0XvgqiW7XNy40fu5P9cOa4ChJZVu
         RSuvFCr4M3lz0LeQaUjTn/cjE/eJ/BqTqxeRzEoN1D5qbcoalV6wclhIt0qBL6BczPXI
         FLrA==
X-Forwarded-Encrypted: i=1; AJvYcCVuYPBL/tnEpJH7HiUD9kvlKN2KmyreTLIGyxajq+dIkX4MPEjG542n28MwhaOvLnrpc0dSWczz2qDOhw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaEVX5xuXu1xh1+tLQKZ4+T3lJs6dHfZac+JJUZINweIl+OA3H
	B1k0dqryU+6XOcjUqZpWtuxuYkp7l1JbX8qIfVH4h0R/ZrenSOf6igm3
X-Gm-Gg: AY/fxX50bSXSLRp+MOzqVlHeU6vzmvd3VDeP6T7MGkqcYm86v4EJQFDmOAMIm8Y17YD
	Cvt+QmRHfnE1SfWKUqlk6LzGGWhh5seKKt2uhxKVKKo+WoC19gZht8hvwyG6wiULoZLYWKUntjk
	OHcGutBkEzbtGZu3JUxs0Pkj5EPzcxTZTlUv+QBJarBIj1zf7EyVcDvBm0AqvmX8wmMoCtaTH32
	RYMpac4yOZ20JSurVTYVKGtzTCqWbUhdzMU4yzbKrCmRZ70KpupIWNj2Ec7qIHKktA3zF+qfKgh
	5Lcab0weJ3wi0vMn+WjI+FGiQLmANmexuK3c9ib2/bz6cL0Zic4MHCMICOLhRO1BQu++iNH2Mt2
	UlSX5nlaCBXyuMkW3bFNRZhs/fe5CjtdwIB6GiHCkAO3/69sXyh381vuggZyrzBWNp9ge+RD7XZ
	ea/mkYGdP4AiQ+zmwrYOdvmt1QjTBBWRnkAv2Cg2g06Q/JC61Lq/HR9jtBD8fxPHo=
X-Google-Smtp-Source: AGHT+IHVhOYhQDnqD/Ev9sZ5WdVWs7wFjrnerdhiVF/Dq4HNgfa6258s0mR5YjktP8ulmxxOSTmzLA==
X-Received: by 2002:a05:7022:924:b0:11b:923d:7753 with SMTP id a92af1059eb24-121721aab49mr35160631c88.3.1766978281939;
        Sun, 28 Dec 2025 19:18:01 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724dd7f5sm112992785c88.5.2025.12.28.19.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 19:18:01 -0800 (PST)
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
Subject: [PATCH v2 05/16] HID: hid-lenovo-go: Add FPS Mode DPI settings
Date: Mon, 29 Dec 2025 03:17:42 +0000
Message-ID: <20251229031753.581664-6-derekjohn.clark@gmail.com>
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

Adds attribute that enables selection of the DPI of the optical sensor
when the right handle toggle is set to FPS mode.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/hid/hid-lenovo-go.c | 68 +++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/drivers/hid/hid-lenovo-go.c b/drivers/hid/hid-lenovo-go.c
index 7d8bd1dba7ce..96f16ba5526c 100644
--- a/drivers/hid/hid-lenovo-go.c
+++ b/drivers/hid/hid-lenovo-go.c
@@ -64,6 +64,7 @@ struct hid_go_cfg {
 	u32 mcu_version_hardware;
 	u32 mcu_version_product;
 	u32 mcu_version_protocol;
+	u32 mouse_dpi;
 	u8 rgb_en;
 	u8 tp_en;
 	u8 tp_vibration_en;
@@ -217,6 +218,8 @@ static const char *const rumble_mode_text[] = {
 	[RUMBLE_MODE_RPG] = "rpg",
 };
 
+#define FPS_MODE_DPI           0x02
+
 static int hid_go_version_event(struct command_report *cmd_rep)
 {
 	switch (cmd_rep->sub_cmd) {
@@ -424,6 +427,16 @@ static int hid_go_motor_event(struct command_report *cmd_rep)
 	return -EINVAL;
 }
 
+static int hid_go_fps_dpi_event(struct command_report *cmd_rep)
+{
+	if (cmd_rep->sub_cmd != FPS_MODE_DPI)
+		return -EINVAL;
+
+	drvdata.mouse_dpi = get_unaligned_le32(cmd_rep->data);
+
+	return 0;
+}
+
 static int hid_go_set_event_return(struct command_report *cmd_rep)
 {
 	if (cmd_rep->data[0] != 0)
@@ -474,8 +487,12 @@ static int hid_go_raw_event(struct hid_device *hdev, struct hid_report *report,
 		case GET_MOTOR_CFG:
 			ret = hid_go_motor_event(cmd_rep);
 			break;
+		case GET_DPI_CFG:
+			ret = hid_go_fps_dpi_event(cmd_rep);
+			break;
 		case SET_FEATURE_STATUS:
 		case SET_MOTOR_CFG:
+		case SET_DPI_CFG:
 			ret = hid_go_set_event_return(cmd_rep);
 			break;
 		default:
@@ -1014,6 +1031,52 @@ static ssize_t motor_config_options(struct device *dev,
 	return count;
 }
 
+static ssize_t fps_mode_dpi_store(struct device *dev,
+				  struct device_attribute *attr,
+				  const char *buf, size_t count)
+
+{
+	size_t size = 4;
+	u32 value;
+	u8 val[4];
+	int ret;
+
+	ret = kstrtou32(buf, 10, &value);
+	if (ret)
+		return ret;
+
+	if (value != 500 && value != 800 && value != 1200 && value != 1800)
+		return -EINVAL;
+
+	put_unaligned_le32(value, val);
+
+	ret = mcu_property_out(drvdata.hdev, MCU_CONFIG_DATA, SET_DPI_CFG,
+			       FPS_MODE_DPI, UNSPECIFIED, val, size);
+	if (ret < 0)
+		return ret;
+
+	return count;
+}
+
+static ssize_t fps_mode_dpi_show(struct device *dev,
+				 struct device_attribute *attr, char *buf)
+{
+	int ret;
+
+	ret = mcu_property_out(drvdata.hdev, MCU_CONFIG_DATA, GET_DPI_CFG,
+			       FPS_MODE_DPI, UNSPECIFIED, 0, 0);
+	if (ret < 0)
+		return ret;
+
+	return sysfs_emit(buf, "%u\n", drvdata.mouse_dpi);
+}
+
+static ssize_t fps_mode_dpi_index_show(struct device *dev,
+				       struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "500 800 1200 1800\n");
+}
+
 #define LEGO_DEVICE_ATTR_RW(_name, _attrname, _dtype, _rtype, _group)         \
 	static ssize_t _name##_store(struct device *dev,                      \
 				     struct device_attribute *attr,           \
@@ -1085,7 +1148,12 @@ LEGO_DEVICE_ATTR_RW(gamepad_rumble_intensity, "rumble_intensity", UNSPECIFIED,
 static DEVICE_ATTR_RO_NAMED(gamepad_rumble_intensity_index,
 			    "rumble_intensity_index");
 
+static DEVICE_ATTR_RW(fps_mode_dpi);
+static DEVICE_ATTR_RO(fps_mode_dpi_index);
+
 static struct attribute *mcu_attrs[] = {
+	&dev_attr_fps_mode_dpi.attr,
+	&dev_attr_fps_mode_dpi_index.attr,
 	&dev_attr_fps_switch_status.attr,
 	&dev_attr_gamepad_mode.attr,
 	&dev_attr_gamepad_mode_index.attr,
-- 
2.51.2


