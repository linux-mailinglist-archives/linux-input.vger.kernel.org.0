Return-Path: <linux-input+bounces-8223-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D4A9D781B
	for <lists+linux-input@lfdr.de>; Sun, 24 Nov 2024 21:34:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 44712B2228A
	for <lists+linux-input@lfdr.de>; Sun, 24 Nov 2024 20:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72BB814F9F7;
	Sun, 24 Nov 2024 20:34:00 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from cosmicgizmosystems.com (cosmicgizmosystems.com [63.249.102.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9D41474DA;
	Sun, 24 Nov 2024 20:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.249.102.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732480440; cv=none; b=eeLVyN5hD+oDhV5IxLbT1p28dwZ9ul13GvxApeMilEH7H1aiWXrWBUq2H8XUNSRwfSDsov6GZq9tVo8wLxO2fU0ChPYq2DIF7TFcfyb4XuejwdqDwCxabIJQMXUB09SwQhJrzz2LHUa+KpGFtgbuO17A7QboHN1Hdyde6lrDKC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732480440; c=relaxed/simple;
	bh=zNj7qzHoZXvG+D8WKWLOt5U+jeC5fC53GgflVJxSmEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E32IJS4ZDTcRNGwowmMmce87ycuzDIPKvI5BVB6xY7wTLsbQOxEF/JhiJmETP4pQ5SAWBeqVnIbiN0COvQ28mTvxORrPXC83ZaAGaImfvl0ujT8lNSY5/MhTYkN1wYzXgJbRDb0usfSISPVWl0WcZszYdYe8+UIKuthMAVn8o5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com; spf=pass smtp.mailfrom=cosmicgizmosystems.com; arc=none smtp.client-ip=63.249.102.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cosmicgizmosystems.com
Received: from terrys-Precision-M4600.hsd1.wa.comcast.net (c-73-190-111-195.hsd1.wa.comcast.net [73.190.111.195])
	by host11.cruzio.com (Postfix) with ESMTPSA id BEE4524246F4;
	Sun, 24 Nov 2024 12:33:57 -0800 (PST)
From: Terry Junge <linuxhid@cosmicgizmosystems.com>
To: Jiri Kosina <jikos@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Wade Wang <wade.wang@hp.com>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Terry Junge <linuxhid@cosmicgizmosystems.com>,
	linux-input@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 2/2] ALSA: usb-audio: Add quirk for Plantronics headsets to fix control names
Date: Sun, 24 Nov 2024 12:32:41 -0800
Message-ID: <20241124203252.28701-3-linuxhid@cosmicgizmosystems.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124203252.28701-1-linuxhid@cosmicgizmosystems.com>
References: <20241124203252.28701-1-linuxhid@cosmicgizmosystems.com>
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
---
 sound/usb/mixer_quirks.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 8bbf070b3676..20d63efd5498 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -4215,6 +4215,37 @@ static void snd_dragonfly_quirk_db_scale(struct usb_mixer_interface *mixer,
 	}
 }
 
+static void snd_fix_plt_control_name(struct snd_kcontrol *kctl)
+{
+	static const char * const names_to_remove[] = {
+		"Earphone",
+		"Microphone",
+		"Receive",
+		"Transmit",
+		NULL
+	};
+	const char * const *n2r;
+	char *dst, *src;
+	size_t len;
+
+	for (n2r = names_to_remove; *n2r; ++n2r) {
+		dst = strstr(kctl->id.name, *n2r);
+		if (dst) {
+			src = dst + strlen(*n2r);
+			len = strlen(src) + 1;
+			if ((char *)kctl->id.name != dst && *(dst - 1) == ' ')
+				--dst;
+			memmove(dst, src, len);
+		}
+	}
+	if (kctl->id.name[0] == ' ') {
+		char rcat[sizeof(kctl->id.name)] = { "Headset" };
+
+		strlcat(rcat, kctl->id.name, sizeof(rcat));
+		strscpy(kctl->id.name, rcat, sizeof(kctl->id.name));
+	}
+}
+
 void snd_usb_mixer_fu_apply_quirk(struct usb_mixer_interface *mixer,
 				  struct usb_mixer_elem_info *cval, int unitid,
 				  struct snd_kcontrol *kctl)
@@ -4232,5 +4263,9 @@ void snd_usb_mixer_fu_apply_quirk(struct usb_mixer_interface *mixer,
 			cval->min_mute = 1;
 		break;
 	}
+
+	/* ALSA-ify some Plantronics headset control names */
+	if (USB_ID_VENDOR(mixer->chip->usb_id) == 0x047f)
+		snd_fix_plt_control_name(kctl);
 }
 
-- 
2.43.0


