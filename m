Return-Path: <linux-input+bounces-16725-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F181DCE5D4D
	for <lists+linux-input@lfdr.de>; Mon, 29 Dec 2025 04:19:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 08120301101E
	for <lists+linux-input@lfdr.de>; Mon, 29 Dec 2025 03:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 746DE28751B;
	Mon, 29 Dec 2025 03:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RHQ0GfPF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7008723AB88
	for <linux-input@vger.kernel.org>; Mon, 29 Dec 2025 03:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766978292; cv=none; b=PLreZCzCZrikrEz9ekVbPYSnhPg7xN4wsSc8DedSEyQzsWZH/J9+s6h1lwWNmcfeMbypwW0x8FKW+ArRguw7rxNQCZn6MTuqbbQ8aT/Ww+DJhJuGMh+mfZeXX1bEJfYwu5KPBeQKWCu0PQUqLArLFTYQ7G8zcVR29LuyYQTFM2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766978292; c=relaxed/simple;
	bh=oqKm237OssMghJKlQPmco5wSMzp57040uiDrPySMFAA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lhquY71cFOCArxpmRc057BhnaUInhWGCmoPsCOq8c6sW1idfqc+UIISvLF/uVZEQU7tUlN9hP0OqXhMV1oyxWM27MedmyC1fvYmdvB8fgsAD1A6qhVxwEyqRWe18ISDR6g3FZG2XC1IW4fRmExhpI7l2IOentHeakoMR4AbrLF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RHQ0GfPF; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-bc4b952cc9dso7480009a12.3
        for <linux-input@vger.kernel.org>; Sun, 28 Dec 2025 19:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766978288; x=1767583088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=miGogj6YnndhpvXP0429HX4qoehDUgcQ4H71U57ueIM=;
        b=RHQ0GfPFUX7gQgJ/0yz2r6szOKR9Vv9QZo3LxkDoi3Nh6UGNSfolffzF1mnuwLqc7e
         UpDzCUydWbijSktaICAobi82oPH56MTJOdmWM7drMxb65y8JYWuE6e7zjhHOeuUfZL/p
         4CphOaqh/NSGTG9cjuViFhEEMPJjZt7xurywhfTcfYG9/goVhPuejDjVAD1Dfh1FCQwP
         as3tt050GRPIWX8m0VOpz2f7RBPoyRsATw9MA72eLWdUeJ96IbGSpWHNhPOkXU8IXrWZ
         pQl3GDnfe74ANpvs2+3gZMti/nreVgo3qFcBsNSjJp0iSLCSCWkyixZ/Vc+cwUZ7/0Jj
         K+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766978288; x=1767583088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=miGogj6YnndhpvXP0429HX4qoehDUgcQ4H71U57ueIM=;
        b=vOCvFzmZ9OvI3/7wydcHMxPX27yZ/KpkmM6fen2XUh5MyyVCwxVdtl7nT7qDse8ayk
         k975HXckIhC+KBaDXqn3kGLQvhmgrNXzTPQYWHQHGjCsAYEg8k4HZt1IZcwfcY134SVH
         Yeud9VTtlhEpIkk5HzHfOQb5wA0ZjNxzw1LXAJ2BtN4eW3fFYxLSPhJc725Fa5IOEDpt
         8tgrAOEcnq/llCXnqwWAFpyv8OOtEJave7EGU+c+kGwjRlfENHFaDVP0QZ9AJtO0zOnN
         sfciG5N9YO341Ask/FSZDIMrZlKHURb+cyZ6aQHARJdbnjKqpL96jVleELQrUbvzFqV4
         oqfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVc5IZuvq9aVYv95fX5DgJO+lWcM1/e3occsjMl47vmljEQgr89EUqieuIat8r6juipuFVaUyK4kSWGEw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxim6tRDg+Xp6XOqV60LNJZmfo60TPQzwzq3ThoFfqLGvoHmMj
	D9wwOXtyip9NSRpTQd0jjgtI/sDYYAt5VAX6bIBsFgRdqQsvIcYP4teJ
X-Gm-Gg: AY/fxX4XgewEA6hU+hoobfybBmDyCTBMXd2oUpAF/zakzAP2fncyp4Y8hDkOm5wmnhj
	OZzgAt/UGJbeExh6zR27A5ZF82GOjBJHw3+60+lZFw5B0z7IOxmxXmnwCNF7bQjucz4ol9Oe8ld
	mzwpK+s87DNA/2ziGVTNtoOsVGKhlDgpOK6Yfk4/N2icD9DKapHJhCE75Bs+0AUyjsS3dlRIoZy
	47zJLZzmLlL40LcVauZbsaySFfJAtFi1Tf/Cvsq5ckHuPe6y0GzKMBM+e34Suxbhx+vsXiFgaiq
	XUEidzSLQiBGo/7qbq398+poiv0OxU04UeHXL7sIre9HBR/GyaFBNQscL18/NVjbl2noiHn4OC3
	lgfuQdwebAkvS3lzAubzvmuu7OcS4FoTGcES2O+s8KahDa72879zpfSDl5E6sSKMMbNj80rCvOr
	9uF3iQbtN01tbYx2PfDs+fzhtkBaGC3hGuq2svfdiN0CLQNSH5VZP7X9GtAv74GIg=
X-Google-Smtp-Source: AGHT+IHjwK9SUF/qOruDxO9wu7yjpn2zEeJHGppohIix6cKExalnAY9LGjRftJ0II/rrFdgWUa8T1w==
X-Received: by 2002:a05:7022:2217:b0:11b:9386:a3c2 with SMTP id a92af1059eb24-121722ff9fbmr29439286c88.45.1766978287954;
        Sun, 28 Dec 2025 19:18:07 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724dd7f5sm112992785c88.5.2025.12.28.19.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 19:18:07 -0800 (PST)
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
Subject: [PATCH v2 13/16] HID: hid-lenovo-go-s: Add Touchpad Mode Attributes
Date: Mon, 29 Dec 2025 03:17:50 +0000
Message-ID: <20251229031753.581664-14-derekjohn.clark@gmail.com>
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

Adds attributes for managing the touchpad operating modes.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/hid/hid-lenovo-go-s.c | 142 ++++++++++++++++++++++++++++++++++
 1 file changed, 142 insertions(+)

diff --git a/drivers/hid/hid-lenovo-go-s.c b/drivers/hid/hid-lenovo-go-s.c
index 076afdaa9628..38425e3d6cb2 100644
--- a/drivers/hid/hid-lenovo-go-s.c
+++ b/drivers/hid/hid-lenovo-go-s.c
@@ -47,6 +47,8 @@ struct hid_gos_cfg {
 	u8 os_mode;
 	u8 rgb_en;
 	u8 tp_en;
+	u8 tp_linux_mode;
+	u8 tp_windows_mode;
 } drvdata;
 
 struct gos_cfg_attr {
@@ -145,6 +147,22 @@ static const char *const dpad_mode_text[] = {
 	[DIR4] = "4-way",
 };
 
+enum touchpad_mode_index {
+	TP_REL,
+	TP_ABS,
+};
+
+static const char *const touchpad_mode_text[] = {
+	[TP_REL] = "relative",
+	[TP_ABS] = "absolute",
+};
+
+enum touchpad_config_index {
+	CFG_WINDOWS_MODE = 0x03,
+	CFG_LINUX_MODE,
+
+};
+
 static int hid_gos_version_event(u8 *data)
 {
 	struct version_report *ver_rep = (struct version_report *)data;
@@ -204,6 +222,25 @@ static int hid_gos_gamepad_cfg_event(struct command_report *cmd_rep)
 	return ret;
 }
 
+static int hid_gos_touchpad_event(struct command_report *cmd_rep)
+{
+	int ret = 0;
+
+	switch (cmd_rep->sub_cmd) {
+	case CFG_LINUX_MODE:
+		drvdata.tp_linux_mode = cmd_rep->data[0];
+		break;
+	case CFG_WINDOWS_MODE:
+		drvdata.tp_windows_mode = cmd_rep->data[0];
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
 static int hid_gos_set_event_return(struct command_report *cmd_rep)
 {
 	if (cmd_rep->data[0] != 0)
@@ -251,7 +288,11 @@ static int hid_gos_raw_event(struct hid_device *hdev, struct hid_report *report,
 	case GET_GAMEPAD_CFG:
 		ret = hid_gos_gamepad_cfg_event(cmd_rep);
 		break;
+	case GET_TP_PARAM:
+		ret = hid_gos_touchpad_event(cmd_rep);
+		break;
 	case SET_GAMEPAD_CFG:
+	case SET_TP_PARAM:
 		ret = hid_gos_set_event_return(cmd_rep);
 		break;
 	default:
@@ -537,6 +578,95 @@ static ssize_t gamepad_property_options(struct device *dev,
 	return count;
 }
 
+static ssize_t touchpad_property_store(struct device *dev,
+				       struct device_attribute *attr,
+				       const char *buf, size_t count,
+				       enum touchpad_config_index index)
+{
+	size_t size = 1;
+	u8 val = 0;
+	int ret;
+
+	switch (index) {
+	case CFG_WINDOWS_MODE:
+		ret = sysfs_match_string(touchpad_mode_text, buf);
+		if (ret < 0)
+			return ret;
+		val = ret;
+		break;
+	case CFG_LINUX_MODE:
+		ret = sysfs_match_string(touchpad_mode_text, buf);
+		if (ret < 0)
+			return ret;
+		val = ret;
+		break;
+	default:
+		return -EINVAL;
+	}
+	if (!val)
+		size = 0;
+
+	ret = mcu_property_out(drvdata.hdev, SET_TP_PARAM, index, &val, size);
+	if (ret < 0)
+		return ret;
+
+	return count;
+}
+
+static ssize_t touchpad_property_show(struct device *dev,
+				      struct device_attribute *attr, char *buf,
+				      enum touchpad_config_index index)
+{
+	int ret = 0;
+	u8 i;
+
+	ret = mcu_property_out(drvdata.hdev, GET_TP_PARAM, index, 0, 0);
+	if (ret < 0)
+		return ret;
+
+	switch (index) {
+	case CFG_WINDOWS_MODE:
+		i = drvdata.tp_windows_mode;
+		break;
+	case CFG_LINUX_MODE:
+		i = drvdata.tp_linux_mode;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (i >= ARRAY_SIZE(touchpad_mode_text))
+		return -EINVAL;
+
+	return sysfs_emit(buf, "%s\n", touchpad_mode_text[i]);
+}
+
+static ssize_t touchpad_property_options(struct device *dev,
+					 struct device_attribute *attr,
+					 char *buf,
+					 enum touchpad_config_index index)
+{
+	size_t count = 0;
+	unsigned int i;
+
+	switch (index) {
+	case CFG_WINDOWS_MODE:
+	case CFG_LINUX_MODE:
+		for (i = 0; i < ARRAY_SIZE(touchpad_mode_text); i++) {
+			count += sysfs_emit_at(buf, count, "%s ",
+					       touchpad_mode_text[i]);
+		}
+		break;
+	default:
+		return count;
+	}
+
+	if (count)
+		buf[count - 1] = '\n';
+
+	return count;
+}
+
 static ssize_t mcu_id_show(struct device *dev, struct device_attribute *attr,
 			   char *buf)
 {
@@ -666,9 +796,21 @@ struct gos_cfg_attr touchpad_enabled = { FEATURE_TOUCHPAD_ENABLE };
 LEGOS_DEVICE_ATTR_RW(touchpad_enabled, "enabled", index, gamepad);
 static DEVICE_ATTR_RO_NAMED(touchpad_enabled_index, "enabled_index");
 
+struct gos_cfg_attr touchpad_linux_mode = { CFG_LINUX_MODE };
+LEGOS_DEVICE_ATTR_RW(touchpad_linux_mode, "linux_mode", index, touchpad);
+static DEVICE_ATTR_RO_NAMED(touchpad_linux_mode_index, "linux_mode_index");
+
+struct gos_cfg_attr touchpad_windows_mode = { CFG_WINDOWS_MODE };
+LEGOS_DEVICE_ATTR_RW(touchpad_windows_mode, "windows_mode", index, touchpad);
+static DEVICE_ATTR_RO_NAMED(touchpad_windows_mode_index, "windows_mode_index");
+
 static struct attribute *legos_touchpad_attrs[] = {
 	&dev_attr_touchpad_enabled.attr,
 	&dev_attr_touchpad_enabled_index.attr,
+	&dev_attr_touchpad_linux_mode.attr,
+	&dev_attr_touchpad_linux_mode_index.attr,
+	&dev_attr_touchpad_windows_mode.attr,
+	&dev_attr_touchpad_windows_mode_index.attr,
 	NULL,
 };
 
-- 
2.51.2


