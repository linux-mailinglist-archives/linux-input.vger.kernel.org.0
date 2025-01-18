Return-Path: <linux-input+bounces-9364-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 449BDA15ABD
	for <lists+linux-input@lfdr.de>; Sat, 18 Jan 2025 01:59:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B7983A1129
	for <lists+linux-input@lfdr.de>; Sat, 18 Jan 2025 00:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C0F438DE9;
	Sat, 18 Jan 2025 00:59:01 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from cosmicgizmosystems.com (cosmicgizmosystems.com [63.249.102.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE11C8C7;
	Sat, 18 Jan 2025 00:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.249.102.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737161941; cv=none; b=NzHkKV0iPqnuQiQmaRDCCib82iKDZlco2pidy4wyGI9hlsWBg+COLt475lI/TFP2Gvy3/r8CcM2dq+46yO7EciolC+eYmm7mtypusm8kOcDp+Cs/YeodzRfkFDdWPDFKDab3RrkEhODPdPtUBMSZ2JnhSxIUIu4+sXiBcP6Dlh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737161941; c=relaxed/simple;
	bh=CWChI6G9iJX7Fa0kerrTU7/TdZrLuYn25bF2tQjWdE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mIJOoN/Ei5e8VXxhXMWwV8Y0dbNO/XmEOE8j7AWQABLg1wTrxnTrfQQj/d8NotEopxaXnaoD/oG1aXhh2vy6PYpUDuIGbiehwDzxT49Y5QmIrmT6N4YMEGCEbwxJm4tyDHWSEdZOxl+e+tY2yVXLgTJN0s40OnV9UorZxxtnozA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com; spf=pass smtp.mailfrom=cosmicgizmosystems.com; arc=none smtp.client-ip=63.249.102.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cosmicgizmosystems.com
Received: from terrys-Precision-M4600.hsd1.wa.comcast.net (c-73-190-111-195.hsd1.wa.comcast.net [73.190.111.195])
	by host11.cruzio.com (Postfix) with ESMTPSA id 6350C2336F2D;
	Fri, 17 Jan 2025 16:58:52 -0800 (PST)
From: Terry Junge <linuxhid@cosmicgizmosystems.com>
To: Jiri Kosina <jikos@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Wade Wang <wade.wang@hp.com>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Terry Junge <linuxhid@cosmicgizmosystems.com>,
	linux-input@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] ALSA: usb-audio: Add quirk for Plantronics headsets to fix control names
Date: Fri, 17 Jan 2025 16:58:39 -0800
Message-ID: <20250118005841.6618-3-linuxhid@cosmicgizmosystems.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250118005841.6618-1-linuxhid@cosmicgizmosystems.com>
References: <20250113235212.78127-1-linuxhid@cosmicgizmosystems.com>
 <20250118005841.6618-1-linuxhid@cosmicgizmosystems.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Many Poly/Plantronics headset families name the feature, input,
and/or output units in a such a way to produce control names
that are not recognized by user space. As such, the volume and
mute events do not get routed to the headset's audio controls.

As an example from a product family:

The microphone mute control is named
Headset Microphone Capture Switch
and the headset volume control is named
Headset Earphone Playback Volume

The quirk fixes these to become
Headset Capture Switch
Headset Playback Volume

Signed-off-by: Terry Junge <linuxhid@cosmicgizmosystems.com>
Cc: stable@vger.kernel.org
---
V1 -> V2: Add comments, usb_audio_dbg() calls, fix leading space case
V2 -> V3: Recode as per Takashi's suggestions, equivalent functionality
V3 -> V4: Change passed parameter to struct snd_ctl_elem_id *id

 sound/usb/mixer_quirks.c | 51 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 23fcd680167d..9b0bf626cd02 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -4216,6 +4216,52 @@ static void snd_dragonfly_quirk_db_scale(struct usb_mixer_interface *mixer,
 	}
 }
 
+/*
+ * Some Plantronics headsets have control names that don't meet ALSA naming
+ * standards. This function fixes nonstandard source names. By the time
+ * this function is called the control name should look like one of these:
+ * "source names Playback Volume"
+ * "source names Playback Switch"
+ * "source names Capture Volume"
+ * "source names Capture Switch"
+ * If any of the trigger words are found in the name then the name will
+ * be changed to:
+ * "Headset Playback Volume"
+ * "Headset Playback Switch"
+ * "Headset Capture Volume"
+ * "Headset Capture Switch"
+ * depending on the current suffix.
+ */
+static void snd_fix_plt_name(struct snd_usb_audio *chip,
+			     struct snd_ctl_elem_id *id)
+{
+	/* no variant of "Sidetone" should be added to this list */
+	static const char * const trigger[] = {
+		"Earphone", "Microphone", "Receive", "Transmit"
+	};
+	static const char * const suffix[] = {
+		" Playback Volume", " Playback Switch",
+		" Capture Volume", " Capture Switch"
+	};
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(trigger); i++)
+		if (strstr(id->name, trigger[i]))
+			goto triggered;
+	usb_audio_dbg(chip, "no change in %s\n", id->name);
+	return;
+
+triggered:
+	for (i = 0; i < ARRAY_SIZE(suffix); i++)
+		if (strstr(id->name, suffix[i])) {
+			usb_audio_dbg(chip, "fixing kctl name %s\n", id->name);
+			snprintf(id->name, sizeof(id->name), "Headset%s",
+				 suffix[i]);
+			return;
+		}
+	usb_audio_dbg(chip, "something wrong in kctl name %s\n", id->name);
+}
+
 void snd_usb_mixer_fu_apply_quirk(struct usb_mixer_interface *mixer,
 				  struct usb_mixer_elem_info *cval, int unitid,
 				  struct snd_kcontrol *kctl)
@@ -4233,5 +4279,10 @@ void snd_usb_mixer_fu_apply_quirk(struct usb_mixer_interface *mixer,
 			cval->min_mute = 1;
 		break;
 	}
+
+	/* ALSA-ify some Plantronics headset control names */
+	if (USB_ID_VENDOR(mixer->chip->usb_id) == 0x047f &&
+	    (cval->control == UAC_FU_MUTE || cval->control == UAC_FU_VOLUME))
+		snd_fix_plt_name(mixer->chip, &kctl->id);
 }
 
-- 
2.43.0


