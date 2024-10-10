Return-Path: <linux-input+bounces-7272-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B2099946A
	for <lists+linux-input@lfdr.de>; Thu, 10 Oct 2024 23:27:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14CAB1C2149F
	for <lists+linux-input@lfdr.de>; Thu, 10 Oct 2024 21:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB1481E906A;
	Thu, 10 Oct 2024 21:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ho1o/gVp"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A4F1E8856;
	Thu, 10 Oct 2024 21:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728595573; cv=none; b=OqPAdxJDg2t+X/Fsex23wZUeTBnphN4sMuShsjS7peEhyvJCa0OxdWlJ+J042YwHeD0Ti5bCyA6ssY9h5Kh9XFRl8Y8LqF+o0IxlKUzJkO7yNjDxCQCWmWywae/eVUok5eEMvTiND0BDFp0YwHQcXIdcptx7MSLjhzIRQlR/Y/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728595573; c=relaxed/simple;
	bh=8XjuIi1Czg4gxADzAUScoPXbznvngqAftxkGhXUC4pg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gybezu8c3SPn1EJZzJk9dSW2FJ5WIX8oF0YTAsE+yXw0HZ5/rheum4XV7CXImrBIzhOipgFhG0fFAr9jm2Paic1QCyzZruqFxqd7Y8r4pCSCo/DSrlZLyqGYb0r9UaVPvrs5Loe+kot30sYBOYZ6HhSwu/Az9bSPKW9WO/+Z5fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ho1o/gVp; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-37d55f0cf85so80167f8f.3;
        Thu, 10 Oct 2024 14:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728595570; x=1729200370; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gv2lnH1bFL+wtFjxRgBI14o1ODjTXUiEC0mw6OfkCr4=;
        b=ho1o/gVpVAVeAmdzSqP/1IgjvUSFM0UosYW6nhG7Yvlau2nZoR2k5KNYh16dT8Up+b
         gRdFAIHGetjcMxFeIDYyDN1aAAR/q2RWXKX3SPy/s4m8oIOm45KO4N0rT3gmpbb3p4Lu
         zW+SZmUf/PrutOCyCjGyMzsGqdHcNsc1lBeGqzpcHnhM9ONQfcTSTBLd6GVVNYL1xgnN
         0brG60PwfzW3dH6UjuEhLGn04lksDhDuBSTTiOkEY06jb+bpKZVIaUbAdnGnBXun5stY
         o2V6Ai9i5nohEKW5zmdEO6mcZx6C0Ow/TcbwM1Hn15bGDzvGMVnRBEYpg7xTSEavoE3V
         orpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728595570; x=1729200370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gv2lnH1bFL+wtFjxRgBI14o1ODjTXUiEC0mw6OfkCr4=;
        b=al4hw+/NpDjYhjp8I3I2VZ58oF4oNfBZl2wYGtUC7rAMjEn6sBeoL3N8JNNM9vVw1K
         2ajJdywrFxqD8PXwCAkSAFC2r4zJ8h13StsjczZj0LV9SOtJsH4i0GyDwI+8reYZJLrk
         4A6KrcieSQImDqHDUFk7N1kDSp+xMpega4oCaSl5bLkCfvegjUQyr6PmfiLo3lHHzkWo
         Aj6AIVjH1Isl6ZpcsgXGDd4t70fV+pLcXxNeOPgic4msU8lci0LTDuLMzJPWIKkIwf+6
         gZ4W5gQweGCn83oIw4R2Oh9/PxBQOvbZQJ4uVtgve9rEm/dHFYsB4j8wlH0sxNsq514W
         XjWQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9Rc8fm3vm8ACF46CDVsBh3eARxrHcrhdrpR9NbswMPzs9PXY9DILtCZXRn7S5vPKJQ8xFvG3iqoY3x7I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGvZuDXrQ47VI8HYt6TNFkH11vyr0lu9ffE2vaxNS+8+X1sKkY
	962C+HwCGuhGo8cmDGaTZXzG2+4JYNpn8AoM4xwuqOCtuMMIN61R
X-Google-Smtp-Source: AGHT+IHrNABpkE9MoIs4OHjPtix9N5xn9oz/4v1rJOCBX1LbPoC+c+XJfnpTq5HfizfEkADdbQPIpw==
X-Received: by 2002:a05:6000:1092:b0:375:c4c7:c7ac with SMTP id ffacd0b85a97d-37d552cb121mr309436f8f.49.1728595570453;
        Thu, 10 Oct 2024 14:26:10 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3d08-841a-0562-b7b5.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3d08:841a:562:b7b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6a8940sm2402083f8f.6.2024.10.10.14.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 14:26:08 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 10 Oct 2024 23:25:55 +0200
Subject: [PATCH 05/10] Input: twl4030-vibra - use cleanup facility for
 device_node
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-input_automate_of_node_put-v1-5-ebc62138fbf8@gmail.com>
References: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
In-Reply-To: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728595555; l=1014;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=8XjuIi1Czg4gxADzAUScoPXbznvngqAftxkGhXUC4pg=;
 b=/4+JFcJpLeL4D0LEVXjbes3plish7dWoFirHhI5dayVbYW4PEtxEp0kTrBT1nHE4UHbh0m0sS
 RPzjoyarLQcDfkWazC5yuILBtuqtMJaAHXEwwvzs+7J+Ee6KQ/9rewD
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Use the '__free(device_node)' macro to simplify the code by
automatically freeing the device node.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/input/misc/twl4030-vibra.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/input/misc/twl4030-vibra.c b/drivers/input/misc/twl4030-vibra.c
index 101548b35ee3..b8ec5c7c5bce 100644
--- a/drivers/input/misc/twl4030-vibra.c
+++ b/drivers/input/misc/twl4030-vibra.c
@@ -165,15 +165,10 @@ static DEFINE_SIMPLE_DEV_PM_OPS(twl4030_vibra_pm_ops,
 
 static bool twl4030_vibra_check_coexist(struct device_node *parent)
 {
-	struct device_node *node;
+	struct device_node *node __free(device_node) =
+		of_get_child_by_name(parent, "codec");
 
-	node = of_get_child_by_name(parent, "codec");
-	if (node) {
-		of_node_put(node);
-		return true;
-	}
-
-	return false;
+	return node ? true : false;
 }
 
 static int twl4030_vibra_probe(struct platform_device *pdev)

-- 
2.43.0


