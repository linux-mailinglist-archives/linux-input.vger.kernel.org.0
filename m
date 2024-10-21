Return-Path: <linux-input+bounces-7599-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F749A912E
	for <lists+linux-input@lfdr.de>; Mon, 21 Oct 2024 22:28:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12B0B1C22024
	for <lists+linux-input@lfdr.de>; Mon, 21 Oct 2024 20:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E6781FCF41;
	Mon, 21 Oct 2024 20:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A56Bvk6G"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8311FDFA8;
	Mon, 21 Oct 2024 20:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729542514; cv=none; b=SemAzkg0t5kDXE7epv2jY3TexQCNlK4i9Gl8iKVdKWRFzlBWhKDHI8O1u03fqs+i+OQ8e7Bh1MVh8oST4+UNsdChpO3INbDoK806ulxd68k2ZDMJQC5OBLnNC38kk/G55JlXKQI5gn6HdZ/gal63/Arp6fZa44uzt+XIoUx2W/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729542514; c=relaxed/simple;
	bh=F8YQ3HQYY2w+VhZkKOD4BkQV8/JYW/XDhWfSKzi9Psg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J159L3EGMiA24qdsEsc8/Y7GELVCNTH0wDpQToe2wv4FdChsGFxunO82VYQ9itPcPH4+ABLgcQmueBNlcX7goRNvLkd3L8tQfS8IFlZ0TlAR6ctXNZln0gOJ+hH74Bxeiko7X7+wqvm3ooXTei+CqU0Ism2i93GFFyVuKXgXkdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A56Bvk6G; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-37d41894a32so3178928f8f.1;
        Mon, 21 Oct 2024 13:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729542511; x=1730147311; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EXOGORusAheGbXjY9YsHgDJ6EQdczoB5sORBvnGhFxE=;
        b=A56Bvk6Giisap3eAmNQ8TZuPG+hFRvXAM7f0oCwzeFVNAvYBkL5o/nWLWyYTupOwy1
         74R4sM+oHZQvcVIYpge6dUbi5ZCRuJhXvPTKVfrfnvFWW5WVBdOCmGKe/3oX3JVt1b8/
         T6MRSwDsrwflky94VcJ7VYFnPbVVSi73qaH+mPEfn0KVmLxsyiGZ7V7ZWgg0qw4e4SjP
         XCYX7HoBcbwFwZuReMRofmjejMR2ThH4IgSrgOXRp13UAdCPkoTti7MrzRz0sgqPXb9z
         i+yUMVk6Mm9wsq1s9+4PU2HL+f9quf1VkjiwgdbDkoF1AH2C5VoH7KEsb5cwKBlA8ix4
         g36Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729542511; x=1730147311;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EXOGORusAheGbXjY9YsHgDJ6EQdczoB5sORBvnGhFxE=;
        b=QGmp7Js/u1OL2xRNWwN++Bxh73KBBq7aDDkEy8Rjfr+N1ush9/M7jiJKWar2fRjDMl
         u4z4vp6N2osIoJeFk7PDueEqQrilsD3bOtjJQfdYGeP65PXIsvpKSqYrPUm5vcQ0FiA1
         EcGNen/m5Kqe9aF45/MjRqBRGrnqmjdkjyNKdzVg/IK1pzzse3zNVxr8ui3PAqz0tzqC
         HYkzphoejfeWoB4Sy95zEAptgjC4QY3gS3cIuJzInCKAOZoO8eeaWlmIlsjYzL8wN+ht
         qJQEwL1JSjgAkjioc2lj2J1cRIp0Qvcp6gvRHpK0R5QDfyuqA4cfr62sjurEXslWYWNX
         ISXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhUgYvTOHb86Mh8HJrZLRJt6T2wU7ORuJttvvV0jErpcdfn8fhwQFJsFxh/zk4zxe9v+mqChS1rs6fs6g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzeILSbxpXGkh7soGfdKnSiEB6jJJ/oDZ7Axbo6jhzpphY9jwn
	ijGeOCN8+gJhf5IFAXGUshaCK75AB5i3MxVgYVK9b6TsX3etK83a
X-Google-Smtp-Source: AGHT+IFeBUJWb0/ZbDfeWjDseKy/gwO7cFLphK1AYxGeWiXouKa5IzBBH4eytV8fsrQlZUdSg1h2BQ==
X-Received: by 2002:adf:e00c:0:b0:37c:cc7c:761c with SMTP id ffacd0b85a97d-37ef12628famr494947f8f.3.1729542511079;
        Mon, 21 Oct 2024 13:28:31 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-023d-d91a-ee8e-da73.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:23d:d91a:ee8e:da73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a5b98asm5093263f8f.61.2024.10.21.13.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 13:28:29 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Mon, 21 Oct 2024 22:28:24 +0200
Subject: [PATCH v3 2/2] Input: sparcspkr - use cleanup facility for
 device_node
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241021-input_automate_of_node_put-v3-2-cc73f636e1bc@gmail.com>
References: <20241021-input_automate_of_node_put-v3-0-cc73f636e1bc@gmail.com>
In-Reply-To: <20241021-input_automate_of_node_put-v3-0-cc73f636e1bc@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729542504; l=1243;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=F8YQ3HQYY2w+VhZkKOD4BkQV8/JYW/XDhWfSKzi9Psg=;
 b=M3sNpqf8PQCbKNRdH+2y4CtcxjbUY0Y4O+QhTzB0pxtLymehiwDv34D4DGZCIPoFG4+SgMjxG
 o6LPTXFYrTVCCVm12J/rHqr8htvu+Jf/gW7E3cYP+i57YZdxSIDbWpb
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Use the 'free(device_node)' macro to simplify the code by automatically
freeing the device node, which removes the need for explicit calls to
'of_node_put()'.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/input/misc/sparcspkr.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/input/misc/sparcspkr.c b/drivers/input/misc/sparcspkr.c
index e484d79b5597..8d7303fc13bc 100644
--- a/drivers/input/misc/sparcspkr.c
+++ b/drivers/input/misc/sparcspkr.c
@@ -182,7 +182,6 @@ static int bbc_beep_probe(struct platform_device *op)
 {
 	struct sparcspkr_state *state;
 	struct bbc_beep_info *info;
-	struct device_node *dp;
 	int err;
 
 	state = devm_kzalloc(&op->dev, sizeof(*state), GFP_KERNEL);
@@ -193,13 +192,12 @@ static int bbc_beep_probe(struct platform_device *op)
 	state->event = bbc_spkr_event;
 	spin_lock_init(&state->lock);
 
-	dp = of_find_node_by_path("/");
+	struct device_node *dp __free(device_node) = of_find_node_by_path("/");
 	if (!dp)
 		return -ENODEV;
 
 	info = &state->u.bbc;
 	info->clock_freq = of_getintprop_default(dp, "clock-frequency", 0);
-	of_node_put(dp);
 	if (!info->clock_freq)
 		return -ENODEV;
 

-- 
2.43.0


