Return-Path: <linux-input+bounces-7572-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE889A55D3
	for <lists+linux-input@lfdr.de>; Sun, 20 Oct 2024 20:27:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ACCBFB21172
	for <lists+linux-input@lfdr.de>; Sun, 20 Oct 2024 18:27:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C722194C61;
	Sun, 20 Oct 2024 18:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nlUuEk/E"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5A982877;
	Sun, 20 Oct 2024 18:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729448841; cv=none; b=s1zO95Pdg/I3QjFX/cwNhp1ObJbp63hoA93VBrdnfOVFDQhbJhx2BGfRcCwqDqPgogVk8DNyfLAOg8wcWU68MySk5EHzZvFlE2wMHjJjySlRD1XP9neE/50e2URCd5bzL8K3+awEyZXZwu8uk7PJYZ7PP2H37nXGGe9ODj5rYLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729448841; c=relaxed/simple;
	bh=Ww13dvSbpLS1CRSU7TPVVRBFuyPAJT0QbJBdP+1IZ8s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GI08/75RnWCRFI0VWMhwoQV6UQxPJmxv/ClTAcvYkQtsgJtDO3vn7oay/nM6uaEAeHyHiMLRoZm4TDcosOCfJLGbInaXxO6GLXPLEj8TjwHzbjQdl7XI6ot1Imfij7/vn0JiqZ6eho0QvuWcb/2RPWxf6Xt59+lOIi8VUVU3mao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nlUuEk/E; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43155afca99so26689135e9.1;
        Sun, 20 Oct 2024 11:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729448837; x=1730053637; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oC94XqAfObW7gsifgeU8sWbkg+sAsaXMzC798gctVto=;
        b=nlUuEk/E2BZpWIweYVTE6zKPeXpDSzX+jrx9ZK2CdKkQ/fsBhfQaoSHExtsbv0RLv4
         GLoH/GuDFPDAkY1/OOU6eZfrh0vwrw0d6OkX75eWR+PRjm9yVYeJR739HGT1EP7hGrWK
         KuZQJNqOaF1h690M94howEKVhgX2tJLnFBiVvuRRLEKeHz3/wRPBReySNyNSzA9MqcjX
         CUcEq2XouBTMQXHpauLtkpZGoDaQ63vXJZQp8xZAQA4K8tDj58W84H34LvEmDWyQ/5Jq
         uo1jWrx7wcDYuBWeu4+us9Z+MtGeyAMu0Ephx/QeFXpvKD+378WMwE6zXeYmhSlQH5I+
         5fBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729448837; x=1730053637;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oC94XqAfObW7gsifgeU8sWbkg+sAsaXMzC798gctVto=;
        b=oZFfy306b06GrAd29DExVlxbt5P5niTvmCgvxSBGzqNTgagTCCp3z8kCyM8SsM9XHn
         KrWWiM3mFPQr55czxjBaESY7nBwe5A70uGzRed1UOxUkaAZBc7J0gTfCPHF//eTC0c3p
         NJAVTawl9F/qkgYu/gUzfZhgC6eOZoLRA8jy1JkVh0dSBbJi9KqVQ0PBFlSFJvBhkOcj
         BQZ+uOXkaU/Vl0JrjuUsDCY9LZsfLt9ArpYVX3kejw5GglsKl2K5WBor0O0fWocbY8gd
         WS9onFDMsbzZ162yJUR4cVAFz1qbPYKet3VLyj8GnXHs4jErAOxglwuSqTUwZhV592y9
         U32g==
X-Forwarded-Encrypted: i=1; AJvYcCX7iX53G2yMa1kEEzz0//Bk+e3wRzGTVT0s1Y6n+9yGTfzPsl2TaRodAoHg0ZfT3j0rg4VqybABlBqX7uA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaYQ4QR8RFUEEX++UJhT/rhqeQPOpLNT8dkRztfc8b3M6GTg6V
	DzMN6kwjoCYoEUvOLyGtS/kkUFTvVHVj9HWOjiS2RNDu379AlHkN
X-Google-Smtp-Source: AGHT+IEM3cXnu7Szl4hCwHLN8wVFsmNZ4NIEh7q1lVGN/TNryiPhzRMZ+nRPrTxss73+eZIvE3gk5w==
X-Received: by 2002:a05:600c:1d27:b0:431:44aa:ee2c with SMTP id 5b1f17b1804b1-4316163bb0bmr55994265e9.9.1729448837337;
        Sun, 20 Oct 2024 11:27:17 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-6b9f-98af-2a5c-6ed2.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:6b9f:98af:2a5c:6ed2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f58af90sm31023845e9.21.2024.10.20.11.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 11:27:16 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Sun, 20 Oct 2024 20:27:13 +0200
Subject: [PATCH v2] Input: sparcspkr - use cleanup facility for device_node
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241020-input_automate_of_node_put-v2-1-ddec58b4b99e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIBLFWcC/33NSw6DIBSF4a2YOy4N0Ee0o+6jMQTxojepYABNG
 8PeS03HHf5n8J0NIgbCCLdqg4ArRfKuhDxUYEbtBmTUlwbJ5Vlw3jBy85KUXpKfdELlrXK+R1V
 GJjqNjb0YLvsGCjAHtPTa8UdbeqSYfHjvX6v4rj9W8H/sKhhn2JmrFKfadra+D5Om59H4Cdqc8
 wc8IiUWxAAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729448835; l=1854;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=Ww13dvSbpLS1CRSU7TPVVRBFuyPAJT0QbJBdP+1IZ8s=;
 b=4JJ/8rNbRS5CDLSsjceGOzrXN95Je/MHjDmrnycsm3LBmxcv6W1rD4Kud8D3RuxIWD1xGrIml
 i4ByO0r4793Bt9BGAEzqktKDKifH7g0va6oGud7Buk3Csn5Wl2gpBxs
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Use the 'free(device_node)' macro to simplify the code by automatically
freeing the device node, which removes the need for explicit calls to
'of_node_put()'.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Changes in v2:
- rebase onto input/next, drop applied patches.
- sparcspkr: drop goto before node declaration and return -ENOMEM.
- Link to v1: https://lore.kernel.org/r/20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com
---
 drivers/input/misc/sparcspkr.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/input/misc/sparcspkr.c b/drivers/input/misc/sparcspkr.c
index ff7b6291894a..66ddea9a203a 100644
--- a/drivers/input/misc/sparcspkr.c
+++ b/drivers/input/misc/sparcspkr.c
@@ -182,25 +182,23 @@ static int bbc_beep_probe(struct platform_device *op)
 {
 	struct sparcspkr_state *state;
 	struct bbc_beep_info *info;
-	struct device_node *dp;
-	int err = -ENOMEM;
+	int err;
 
 	state = kzalloc(sizeof(*state), GFP_KERNEL);
 	if (!state)
-		goto out_err;
+		return -ENOMEM;
 
 	state->name = "Sparc BBC Speaker";
 	state->event = bbc_spkr_event;
 	spin_lock_init(&state->lock);
 
-	dp = of_find_node_by_path("/");
 	err = -ENODEV;
+	struct device_node *dp __free(device_node) = of_find_node_by_path("/");
 	if (!dp)
 		goto out_free;
 
 	info = &state->u.bbc;
 	info->clock_freq = of_getintprop_default(dp, "clock-frequency", 0);
-	of_node_put(dp);
 	if (!info->clock_freq)
 		goto out_free;
 
@@ -221,7 +219,6 @@ static int bbc_beep_probe(struct platform_device *op)
 
 out_free:
 	kfree(state);
-out_err:
 	return err;
 }
 

---
base-commit: 00850d7b542aa4a8240cf977d43dc6d2158e48d7
change-id: 20241009-input_automate_of_node_put-1bae9f5c02d9

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>


