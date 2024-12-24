Return-Path: <linux-input+bounces-8754-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3FC9FBA15
	for <lists+linux-input@lfdr.de>; Tue, 24 Dec 2024 08:08:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0BDB1188469B
	for <lists+linux-input@lfdr.de>; Tue, 24 Dec 2024 07:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0729D187FE0;
	Tue, 24 Dec 2024 07:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hp.com header.i=@hp.com header.b="P8pslRpL"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-162.mimecast.com (us-smtp-delivery-162.mimecast.com [170.10.133.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25950170A26
	for <linux-input@vger.kernel.org>; Tue, 24 Dec 2024 07:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735024123; cv=none; b=rnn7jGpsMLLxvKTpoIznDaITRwAcGq8Yrz+ELU9YnE70KMr/SncluB3Zcjc9AoUflb/DFXL+9g+TJ16Ew5XSuMqyLE96ik9VDngcWBfMK1xywfkp6fpSePYAMuYx2dBOPH6XHa7jBYJM2F3oBmZNUubRheGoG5rpymThmCYHA/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735024123; c=relaxed/simple;
	bh=qUkkLHrQ4WXcKVnQImhnpoTl7P/786aruC+18Jg/tz0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:content-type; b=cqzVUgAEtAeYyBAZ2HOwRuFdK5hLKO2yln6UtzQbg6pGXgWFqdWBMIStReE1uPnmI7EUnf0j3Yq78hpNudwN1UhrK5K5Da9qaI/c6uI+iN6dnP05gcxKGnl6iXqB1+3KEz/K/ytHefPYWVXjj+bCLUeBXONGAaGXFoytm0CxfRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hp.com; spf=pass smtp.mailfrom=hp.com; dkim=pass (1024-bit key) header.d=hp.com header.i=@hp.com header.b=P8pslRpL; arc=none smtp.client-ip=170.10.133.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hp.com; s=mimecast20180716;
	t=1735024121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=daS+cNBbyPVNBsY+IGPoUbU95r5o0SLP4Vy1d8J8nRg=;
	b=P8pslRpLDtmMXY9JS0lugyPANWgH1W+uORumSvblmEGIVfzL9iNcsO5K6lmXuxXiawyCgd
	fVz3sCNIMOinK0xOJl7nAMj8aGUMNS+CzhRS7B7Xj+NYNeJCEDPCGpiF1I8v1MLXB473yd
	C90yNll5QLEpXXEoPhFJQtWoegMHU5g=
Received: from g7t16451g.inc.hp.com (hpifallback.mail.core.hp.com
 [15.73.128.137]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-490-c3ScVXkbNW2jDuDdSlMTHA-1; Tue, 24 Dec 2024 02:08:39 -0500
X-MC-Unique: c3ScVXkbNW2jDuDdSlMTHA-1
X-Mimecast-MFC-AGG-ID: c3ScVXkbNW2jDuDdSlMTHA
Received: from g7t16459g.inc.hpicorp.net (g7t16459g.inc.hpicorp.net [15.63.18.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by g7t16451g.inc.hp.com (Postfix) with ESMTPS id AC6B86001741;
	Tue, 24 Dec 2024 07:08:38 +0000 (UTC)
Received: from mail.hp.com (unknown [15.32.134.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by g7t16459g.inc.hpicorp.net (Postfix) with ESMTPS id 0D2186000096;
	Tue, 24 Dec 2024 07:08:36 +0000 (UTC)
Received: from cdc-linux-buildsrv17.. (localhost [127.0.0.1])
	by mail.hp.com (Postfix) with ESMTP id 3AC2AA42C03;
	Tue, 24 Dec 2024 14:56:39 +0800 (CST)
From: Wade Wang <wade.wang@hp.com>
To: jikos@kernel.org,
	tiwai@suse.com,
	bentiss@kernel.org,
	perex@perex.cz,
	linuxhid@cosmicgizmosystems.com
Cc: wade.wang@hp.com,
	linux-input@vger.kernel.org,
	linux-sound@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 2/2] ALSA: usb-audio: Add quirk for Plantronics headsets to fix control names
Date: Tue, 24 Dec 2024 14:56:36 +0800
Message-Id: <20241224065636.1870713-2-wade.wang@hp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241224065636.1870713-1-wade.wang@hp.com>
References: <20241224065636.1870713-1-wade.wang@hp.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EdOh2hPJVWOmQIj_s7-oYTKM_AEZUElMZQ7-NxwRuAc_1735024118
X-Mimecast-Originator: hp.com
Content-Transfer-Encoding: quoted-printable
content-type: text/plain; charset=WINDOWS-1252; x-default=true

From: Terry Junge <linuxhid@cosmicgizmosystems.com>

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
Signed-off-by: Wade Wang <wade.wang@hp.com>
Cc: stable@vger.kernel.org
---
V1 -> V2: Add comments, usb_audio_dbg() calls, fix leading space case

 sound/usb/mixer_quirks.c | 66 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 23fcd680167d..5728c03dc49f 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -4216,6 +4216,67 @@ static void snd_dragonfly_quirk_db_scale(struct usb_=
mixer_interface *mixer,
 =09}
 }
=20
+/*
+ * Some Plantronics headsets have control names that don't meet ALSA namin=
g
+ * standards. This function removes nonstandard source names. By the time
+ * this function is called the control name will look like one of these:
+ * "source names Playback Volume"
+ * "source names Playback Switch"
+ * "source names Capture Volume"
+ * "source names Capture Switch"
+ * First it scans through the list and removes any found name(s) by moving=
 the
+ * remaining string and its null terminator over the found name and its le=
ading
+ * space, if it has one.
+ * Second, if all source names were removed, it puts back "Headset"
+ * otherwise removes a leading space, if there is one.
+ */
+static void snd_fix_plt_control_name(struct usb_mixer_interface *mixer,
+=09=09=09=09     struct snd_kcontrol *kctl)
+{
+=09/* no variant of "Sidetone" should be added to this list */
+=09static const char * const names_to_remove[] =3D {
+=09=09"Earphone",
+=09=09"Microphone",
+=09=09"Receive",
+=09=09"Transmit",
+=09=09NULL
+=09};
+=09const char * const *n2r;
+=09char *dst, *src, *last =3D NULL;
+=09size_t len =3D 0;
+
+=09for (n2r =3D names_to_remove; *n2r; ++n2r) {
+=09=09dst =3D strstr(kctl->id.name, *n2r);
+=09=09if (dst) {
+=09=09=09usb_audio_dbg(mixer->chip, "found %s in %s\n",
+=09=09=09=09=09*n2r, kctl->id.name);
+=09=09=09src =3D dst + strlen(*n2r);
+=09=09=09len =3D strlen(src) + 1;
+=09=09=09if ((char *)kctl->id.name !=3D dst && *(dst - 1) =3D=3D ' ')
+=09=09=09=09--dst;
+=09=09=09last =3D memmove(dst, src, len);
+=09=09=09usb_audio_dbg(mixer->chip, "now %s\n", kctl->id.name);
+=09=09}
+=09}
+=09if (!len) {
+=09=09usb_audio_dbg(mixer->chip, "no change in %s\n", kctl->id.name);
+=09=09return;
+=09}
+=09if (len <=3D sizeof " Playback Volume" && (char *)kctl->id.name =3D=3D =
last) {
+=09=09char rcat[sizeof(kctl->id.name)] =3D { "Headset" };
+
+=09=09strlcat(rcat, kctl->id.name, sizeof(rcat));
+=09=09strscpy(kctl->id.name, rcat, sizeof(kctl->id.name));
+=09=09usb_audio_dbg(mixer->chip, "now %s\n", kctl->id.name);
+=09} else if (kctl->id.name[0] =3D=3D ' ') {
+=09=09dst =3D kctl->id.name;
+=09=09src =3D dst + 1;
+=09=09len =3D strlen(src) + 1;
+=09=09memmove(dst, src, len);
+=09=09usb_audio_dbg(mixer->chip, "now %s\n", kctl->id.name);
+=09}
+}
+
 void snd_usb_mixer_fu_apply_quirk(struct usb_mixer_interface *mixer,
 =09=09=09=09  struct usb_mixer_elem_info *cval, int unitid,
 =09=09=09=09  struct snd_kcontrol *kctl)
@@ -4233,5 +4294,10 @@ void snd_usb_mixer_fu_apply_quirk(struct usb_mixer_i=
nterface *mixer,
 =09=09=09cval->min_mute =3D 1;
 =09=09break;
 =09}
+
+=09/* ALSA-ify some Plantronics headset control names */
+=09if (USB_ID_VENDOR(mixer->chip->usb_id) =3D=3D 0x047f &&
+=09    (cval->control =3D=3D UAC_FU_MUTE || cval->control =3D=3D UAC_FU_VO=
LUME))
+=09=09snd_fix_plt_control_name(mixer, kctl);
 }
=20
--=20
2.43.0


