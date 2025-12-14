Return-Path: <linux-input+bounces-16560-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E80E5CBB96B
	for <lists+linux-input@lfdr.de>; Sun, 14 Dec 2025 11:21:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1CDFC30057C1
	for <lists+linux-input@lfdr.de>; Sun, 14 Dec 2025 10:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D17C279DCC;
	Sun, 14 Dec 2025 10:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QlYro2H4"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84712040B6
	for <linux-input@vger.kernel.org>; Sun, 14 Dec 2025 10:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765707683; cv=none; b=LiGxDh+trtQFZotFWyXtYMap/qFA6POgQpIJVo5fj2xc0IJvysb4PsjH1OTI2dN4kjK+S29RPpgxiYiZ8FQR/zOYEjNgKbGPYOE/CqxiQiHJGxPzm0Qdw3zyd0B1UwxUcuNHMjbvt8ZIhkTUnO2Ni7lKjpjyvmrbSCadluu64Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765707683; c=relaxed/simple;
	bh=Wcg28AG2Ifi5O/IakI/f4M72SMb6f+uOhz6wpj8ZmoA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dJSMBNBRfu93CFAENpT3tCKwnXekkh6lxt6KSYTegPWatyo1YKFFc3aR6UnMdZFuOHQ4VaFjlgh0E7c9/VuhT+/N1zfwMxOm0De0OG4yo2GrL25WqO5pT/r3CfipZXJ7d67LC+Oqrq5krUydgTE490o6ZTCQ0RHIEfgPFlRt8Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QlYro2H4; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7c765f41346so1350925a34.3
        for <linux-input@vger.kernel.org>; Sun, 14 Dec 2025 02:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765707681; x=1766312481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fnoKJ/ImikXSwHOFE3yQm3AH4RGryAGqSUDUo6DcOts=;
        b=QlYro2H4Jj7vG3ccfwteiJduzvURA5W9nAF8bsmKSgwT0N3IJIzyzzE3UNSKnoyBCt
         5nYlmZZK/p9Q8Y+warxaX7y4bCzcxGowMaeOtK16ZN47fLCNQ0/zKFAt67poSnrTNcZC
         a3S7kBe4D7vm6VU5DvKPk3vu3ChEdHLdoJR4KQ4F7IoaOKTuIaUq7t5jUo+0K5u4QiXu
         v/IvtXgSWb0YzS6C1M8OnfCCHJVB0BvKeNkKawMg2qqIdKtVAsyzKlNjm/X2GtuoIK1o
         a9LYASUTlPuPmPkPQXJyXraixSIdIkZ5iz6z9vERIGSA+Vo/4VbaLnwmGd8hkmTrsSNQ
         W/0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765707681; x=1766312481;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fnoKJ/ImikXSwHOFE3yQm3AH4RGryAGqSUDUo6DcOts=;
        b=sezjQVe2BMkiLzhD4/vJPtPF/33n0QI10xx3ARKNqWnkUaKYBzrNTVEDTg9nWssasu
         IVHeEA4R0dMPk4xwTV/zWePZu5XgRFv/68RX9lUdZx+8bJ+y6mkXug8Xu9S292OKnjyw
         4angrQid0MnUQj6ja1ySHI+X4lyXSPJZoZ12ww1W8f0ONEnRsLVy0RoJ1iTyWZFT6TFI
         mqfe/cJhmv4wa9QX+Sh8PAfp1DIDTPSHIzPEbyPJv8NR8Sqiqu9+lAFHKWnFDuPQGxNA
         XSX2dLue4y2rG9v/2QbgAVTkhtR79L92yBaTrk+mvxAapxkhgkTgnGFX/kM0zMb/EKx4
         9Nzg==
X-Gm-Message-State: AOJu0YyVsQVQIgSwfu3Yq0nut4YWDhL5/sp3Os78GzOioqnHIjjJ+WXF
	Ta1BSuKrXVymnWF4XlCI4kFBUjHbw/ubxLOQYa3DmtSqM3KFefPoZKJs
X-Gm-Gg: AY/fxX4B+5J/g+x3iuuBv1rVJc+IrMI7HijWOmOGxYgR2l3yoJdr8jX26y9NyC+4wKR
	HDrWjehkj0+m2oZrMf2a0HiWWXygdKKD5McCAn1za8/BzyAKDEF3IUpwWK5pbrenVsVgy+fOHMW
	GZ9pD7s5fiizQ3TYJ+s2F+Rj5isoHp1RENaoxUtsvC8MsAuQXenNDVFXCIzEucayUWnPHUH+1j3
	U6yLg/iSoO0dIZ2lkiovH+Px+ByzZvVHQ6YHXW2x6rxpJ8d9W8JGTG/4TInK+cbh4mO/YU5R1KV
	vR2eDY08xhA9wU1qJ9phb6jCIIRmdQTZzftRZFatSRcVEHmaWuzty4hHirbwMW0r5n02aXk4hb+
	PsFxLLSahb0ouo/24UCL42MEihd5MTRXuwyzExuAveS4gsIaK0AC5lU1cEvBclAFIEJ+WDJL4Uu
	8cacCElhv8KqezQihhE62F/9cel13V5rd4orgbM1+XIDxsi15yTG5QZdKi1KLMrJ8X5w==
X-Google-Smtp-Source: AGHT+IEwatOPUZxCeMqezLXjmGH8ijmApVNnqSphdvSRR47Ix3IEELjlpx8nHxVpt4hKhvhUKeNyFA==
X-Received: by 2002:a05:6830:2e13:b0:7c7:8280:9207 with SMTP id 46e09a7af769-7cae83ab4eamr5374700a34.37.1765707680991;
        Sun, 14 Dec 2025 02:21:20 -0800 (PST)
Received: from localhost.localdomain (c-24-9-224-2.hsd1.co.comcast.net. [24.9.224.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cadb3246a8sm7240475a34.22.2025.12.14.02.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 02:21:20 -0800 (PST)
From: harindhu007 <harikrs0905@gmail.com>
To: dmitry.torokhov@gmail.com,
	support.opensource@diasemi.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-input@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	harikrs0905@gmail.com
Subject: [PATCH] input: sound: Fix comment typos in apbps2 and codecs
Date: Sun, 14 Dec 2025 03:20:08 -0700
Message-ID: <20251214102008.10582-1-harikrs0905@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling mistakes and minor wording in comments in apbps2, da732x, and spdif_receiver drivers.

Signed-off-by: harindhu007 <harikrs0905@gmail.com>
---
 drivers/input/serio/apbps2.c      | 2 +-
 sound/soc/codecs/da732x.c         | 2 +-
 sound/soc/codecs/spdif_receiver.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/input/serio/apbps2.c b/drivers/input/serio/apbps2.c
index b815337be2f4..6bb65f93e052 100644
--- a/drivers/input/serio/apbps2.c
+++ b/drivers/input/serio/apbps2.c
@@ -112,7 +112,7 @@ static int apbps2_open(struct serio *io)
 	while ((ioread32be(&priv->regs->status) & APBPS2_STATUS_DR) && --limit)
 		ioread32be(&priv->regs->data);
 
-	/* Enable reciever and it's interrupt */
+	/* Enable receiver and it's interrupt */
 	iowrite32be(APBPS2_CTRL_RE | APBPS2_CTRL_RI, &priv->regs->ctrl);
 
 	return 0;
diff --git a/sound/soc/codecs/da732x.c b/sound/soc/codecs/da732x.c
index 140e449d3ef4..e8b3ba878d78 100644
--- a/sound/soc/codecs/da732x.c
+++ b/sound/soc/codecs/da732x.c
@@ -569,7 +569,7 @@ static const struct snd_kcontrol_new da732x_snd_controls[] = {
 		       DA732X_EQ_BAND5_SHIFT, DA732X_EQ_VOL_VAL_MAX,
 		       DA732X_INVERT, eq_band_pga_tlv),
 
-	/* Lineout 2 Reciever*/
+	/* Lineout 2 Receiver*/
 	SOC_SINGLE("Lineout 2 Switch", DA732X_REG_LIN2, DA732X_LOUT_MUTE_SHIFT,
 		   DA732X_SWITCH_MAX, DA732X_INVERT),
 	SOC_SINGLE_TLV("Lineout 2 Volume", DA732X_REG_LIN2,
diff --git a/sound/soc/codecs/spdif_receiver.c b/sound/soc/codecs/spdif_receiver.c
index c9766979b1d7..7b4748fc488e 100644
--- a/sound/soc/codecs/spdif_receiver.c
+++ b/sound/soc/codecs/spdif_receiver.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * ALSA SoC SPDIF DIR (Digital Interface Reciever) driver
+ * ALSA SoC SPDIF DIR (Digital Interface Receiver) driver
  *
  * Based on ALSA SoC SPDIF DIT driver
  *
-- 
2.43.0


