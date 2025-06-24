Return-Path: <linux-input+bounces-13027-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 097D0AE71E1
	for <lists+linux-input@lfdr.de>; Tue, 24 Jun 2025 23:59:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9F5E171F81
	for <lists+linux-input@lfdr.de>; Tue, 24 Jun 2025 21:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D510B25D534;
	Tue, 24 Jun 2025 21:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="IgU8CMde"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A0925BEE8;
	Tue, 24 Jun 2025 21:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750802278; cv=none; b=S+zixFZexu7hUMABCmcu9qcVg1hoeKotsCJ14oxctDXlxpduyRrrEd3CvBKlO2bDRHuuxbr+dXXgrdt2+5DL3kPfLmWefJyH4M2jaAJt9ZvI8V6WHrLRFq1q+nGqmaAUwEOStwbCnsNi/uTlzl4DLXcfZ07UA1LwWiK/WT/YSBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750802278; c=relaxed/simple;
	bh=+mZ0zWHZzQGyvP9eEzS8C+fPw03ACi75qiIkdPVo/sg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SDkP6CQDLXIXTbCvP3vlQfi+Gv4575sQYQzQDd18k6nCGooFZtIkNvChveS2wdeiJx3Vj739f9+PY+kdjwxK6qpPvjKm0Wp/QBlsz0Zhj7vXMb9AlIst19qgAb63hXQL1Vgb6CF2kANFKdTTRATd4pCptAG9CdI+XkNLm5zrL5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=IgU8CMde; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750802275;
	bh=+mZ0zWHZzQGyvP9eEzS8C+fPw03ACi75qiIkdPVo/sg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IgU8CMdeAf6OWVH+D6yfdPBGZ+YKbTnvIBdxjmfvQ09s2WhTzPmt3wQTzevtzYxIx
	 B5TVOAmDJ0E+O0uTz+l1VClsshR+KVmWQN9gsQLVGcL9QZwhrAyS8SBBaed5GciT8r
	 aEp8SmoqxUSzxIbmi18J6XYq+78/6BKhHvSbibz/b9twJ8ZTvMobJ/OIXWQn/uGgWX
	 jSUSqX7ESuu4GlyJdKQqLW0SzWfjbDhXUC6o6tlNhXxNquT454cbIIhfNjmZOwgNdr
	 vvICUrUQGAHw1twNFir425nXoAowFgOe6TcFGTM8ipkzSo225QrujlfD4C0So7CfhN
	 PRr9/XiabWA1Q==
Received: from localhost (unknown [212.93.144.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 3B54F17E0E8F;
	Tue, 24 Jun 2025 23:57:55 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 25 Jun 2025 00:56:55 +0300
Subject: [PATCH v2 11/11] HID: playstation: Support DualSense audio jack
 event reporting
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-dualsense-hid-jack-v2-11-596c0db14128@collabora.com>
References: <20250625-dualsense-hid-jack-v2-0-596c0db14128@collabora.com>
In-Reply-To: <20250625-dualsense-hid-jack-v2-0-596c0db14128@collabora.com>
To: Roderick Colenbrander <roderick.colenbrander@sony.com>, 
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Henrik Rydberg <rydberg@bitmath.org>
Cc: kernel@collabora.com, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

The DualSense controller complies with v1.0 of the USB Audio Class spec
(UAC1), hence it cannot advertise any jack detection capability.

However, this feature can be implemented in the generic USB audio driver
via quirks, i.e. by configuring an input handler to receive hotplug
events from the HID driver.

When operating in USB mode, register a dedicated input device for the
audio jack and use it to report all headphone and headset mic insert
events.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/hid/hid-playstation.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 4285260c7e22bc4097bc755f31a968f57ba16db8..d2bee1a314b1b4697378d8472d3f65df5d2cf790 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -176,6 +176,7 @@ struct dualsense {
 	struct input_dev *gamepad;
 	struct input_dev *sensors;
 	struct input_dev *touchpad;
+	struct input_dev *jack;
 
 	/* Update version is used as a feature/capability version. */
 	u16 update_version;
@@ -955,6 +956,25 @@ static struct input_dev *ps_touchpad_create(struct hid_device *hdev, int width,
 	return touchpad;
 }
 
+static struct input_dev *ps_headset_jack_create(struct hid_device *hdev)
+{
+	struct input_dev *jack;
+	int ret;
+
+	jack = ps_allocate_input_dev(hdev, "Headset Jack");
+	if (IS_ERR(jack))
+		return ERR_CAST(jack);
+
+	input_set_capability(jack, EV_SW, SW_HEADPHONE_INSERT);
+	input_set_capability(jack, EV_SW, SW_MICROPHONE_INSERT);
+
+	ret = input_register_device(jack);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return jack;
+}
+
 static ssize_t firmware_version_show(struct device *dev,
 				     struct device_attribute *attr, char *buf)
 {
@@ -1357,8 +1377,15 @@ static void dualsense_output_worker(struct work_struct *work)
 				common->audio_control2 =
 					FIELD_PREP(DS_OUTPUT_AUDIO_FLAGS2_SP_PREAMP_GAIN, 0x2);
 			}
+
+			input_report_switch(ds->jack, SW_HEADPHONE_INSERT, val);
 		}
 
+		val = ds->plugged_state & DS_STATUS1_MIC_DETECT;
+		if (val != (ds->prev_plugged_state & DS_STATUS1_MIC_DETECT))
+			input_report_switch(ds->jack, SW_MICROPHONE_INSERT, val);
+
+		input_sync(ds->jack);
 		ds->prev_plugged_state = ds->plugged_state;
 	}
 
@@ -1778,6 +1805,15 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 		goto err;
 	}
 
+	/* Bluetooth audio is currently not supported. */
+	if (hdev->bus == BUS_USB) {
+		ds->jack = ps_headset_jack_create(hdev);
+		if (IS_ERR(ds->jack)) {
+			ret = PTR_ERR(ds->jack);
+			goto err;
+		}
+	}
+
 	ret = ps_device_register_battery(ps_dev);
 	if (ret)
 		goto err;

-- 
2.49.0


