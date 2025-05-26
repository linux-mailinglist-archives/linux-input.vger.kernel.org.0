Return-Path: <linux-input+bounces-12582-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D991AC3FB4
	for <lists+linux-input@lfdr.de>; Mon, 26 May 2025 14:54:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71DE93B9C63
	for <lists+linux-input@lfdr.de>; Mon, 26 May 2025 12:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C77A213E94;
	Mon, 26 May 2025 12:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="as1FBl7E"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DDF20B803;
	Mon, 26 May 2025 12:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748263925; cv=none; b=ZS8EN0ZqJqW1HKDDBs3/NZPWB0xvfY4moFLBmvZZbW9gSPVX8XxoENw9/ZIGfsJvgnP64gw/9REaWOPYKZuQhAazZWbP+UEwdq7O3QpuYEfYwgkdauXUPFdPBmTx0MFkRWlmB0kVmqmVUZ8qNR1LuNSkXNUbLN6xR/YMRd3rpeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748263925; c=relaxed/simple;
	bh=tBP5oLb8ACuC7GOCZhYJUMu3KBz3kbJIztCUV8vrNM8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V7HAI4lw+J8/prOyro4tva4C4pqGy3EMzvZPnvAwcbNdBkYWUhAbZLIeXgf5jUahRLBpWpZymfsY7KQxBXRs5E+H324ikjmm9d645gmHBLHbs1IcJfcEj9xRY2J3nwyuooxhLNCL/Nqb3FYjSfTlDXoRyNhoqX/oHm9A2Jwe+qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=as1FBl7E; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1748263921;
	bh=tBP5oLb8ACuC7GOCZhYJUMu3KBz3kbJIztCUV8vrNM8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=as1FBl7EVqCmY2+bLxgwRuqfEG1HTD0bbcI641A+tx+BiZihlwzX2g5AASCFMG6H4
	 d7F8PKFvdSI9Rvwv1HiXuQ2uM3DmzPqn5zRMUJG4A6YeniY5Oar6UIxsLN8D8+vV4d
	 IOjiV9P5dID1eXmj3/DRWWCAnfkMDPRxu+aV3MEsZG7ddfICoLWNh5CvZC33dPBsYd
	 gOcLMmQpsmug064TXKLt/QjSNQ2bxJ5UbyDrhu5hfVEAPqyizrs2tWukOtw5BfyuZH
	 lKyWl8Pf5kYOtmTu1wnKv9x8B3Vqu8jIL9vruFBx5hAUUlPVrmoLh1QwRc9mYQ+TFo
	 GQUaf2WYtg7Eg==
Received: from localhost (unknown [82.76.59.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 66BB617E36C2;
	Mon, 26 May 2025 14:52:01 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 26 May 2025 15:51:34 +0300
Subject: [PATCH 11/11] HID: playstation: Support DualSense audio jack event
 reporting
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-dualsense-hid-jack-v1-11-a65fee4a60cc@collabora.com>
References: <20250526-dualsense-hid-jack-v1-0-a65fee4a60cc@collabora.com>
In-Reply-To: <20250526-dualsense-hid-jack-v1-0-a65fee4a60cc@collabora.com>
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

Register a dedicated input device for the audio jack and use it to
report all headphone and headset mic insert events.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/hid/hid-playstation.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index ed8e67c5bf5d3a9e9721da31a6bd84f0b6802b14..1231165098691398cd471e71cb9787651f753023 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -178,6 +178,7 @@ struct dualsense {
 	struct input_dev *gamepad;
 	struct input_dev *sensors;
 	struct input_dev *touchpad;
+	struct input_dev *jack;
 
 	/* Update version is used as a feature/capability version. */
 	u16 update_version;
@@ -958,6 +959,25 @@ static struct input_dev *ps_touchpad_create(struct hid_device *hdev, int width,
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
@@ -1360,8 +1380,15 @@ static void dualsense_output_worker(struct work_struct *work)
 				common->audio_flags2 =
 					FIELD_PREP(DS_OUTPUT_AUDIO_FLAGS2_SP_PREAMP_GAIN, 0x2);
 			}
+
+			input_report_switch(ds->jack, SW_HEADPHONE_INSERT, val);
 		}
 
+		val = ds->plugged_state & DS_STATUS_PLUGGED_MIC;
+		if (val != (ds->prev_plugged_state & DS_STATUS_PLUGGED_MIC))
+			input_report_switch(ds->jack, SW_MICROPHONE_INSERT, val);
+
+		input_sync(ds->jack);
 		ds->prev_plugged_state = ds->plugged_state;
 	}
 
@@ -1775,6 +1802,12 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 		goto err;
 	}
 
+	ds->jack = ps_headset_jack_create(hdev);
+	if (IS_ERR(ds->jack)) {
+		ret = PTR_ERR(ds->jack);
+		goto err;
+	}
+
 	ret = ps_device_register_battery(ps_dev);
 	if (ret)
 		goto err;

-- 
2.49.0


