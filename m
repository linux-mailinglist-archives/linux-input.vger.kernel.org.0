Return-Path: <linux-input+bounces-5639-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA24E9562CA
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 06:59:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8117B28231A
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 04:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7AE814F124;
	Mon, 19 Aug 2024 04:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WaY0uZS3"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF3D14B08A;
	Mon, 19 Aug 2024 04:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724043511; cv=none; b=LBBeajHYWruTlfyEN8bthB3wPaUCBXtIH3KLLVGRVvqrhcSACP0lrAuFXaW7xYGJd7BaLYI37TmayBnBrMcVlc1J4UpTjhLMpIMVHQrLlRDvw+DZ8QeB6sSOYyISRG+0QAEkh1qWmXors811DTDGt03/SXPiXqsgpJXJjVHOIJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724043511; c=relaxed/simple;
	bh=+TLEQTgetAdHxl33mVkuP0tW9BMEzG2hFbgedVvu2YM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BUpPxwyw0+Wd+QonhBQ8OkdwRyJzLfOlQwCrTeb1TWsF74fYBA/TZDIXo/hwFb2BWSSN4y6R1wAvBwzf3VPIZtyc0eFeHNgXqv0j1Wv9MyESQcN6kWYQJxUjkXTKl57h08QLGpCXWHqRZpywQcx3xVjhvizgTPdV4Y8SXMb5d4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WaY0uZS3; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2020ac89cabso18180385ad.1;
        Sun, 18 Aug 2024 21:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724043510; x=1724648310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LOtLgRKGQX67ieoH/CsjydrcIz7BO5T8N0kmB5YnlVI=;
        b=WaY0uZS3S0chqfRup3yTX6MTYNsuJkAzjnQ+zpNPfk+TQ5h56K+hV0elH04RilPDYC
         ADadAMElFkuv/pdnXfeLcLlTjWwrnfWS1eC5v1742Lxv5ShlPHRQmp+VaULZ4dbymDuN
         R2HnJIORiiwfz5CJZPrXeeZI30/w0fvLO5lEoacbKNQd8aPXK4/CKgLznFV5yJQxVp+Y
         pVoWHm8yqbyr6SLFekTdc/KZVMjsv9wQVu5lVDpugt7o1RJm38QVLIk+/6IgKRWPsCez
         4m9hIhEGrGqdnrmFjn16O0MPgAL3Rm3odlr0MCasof8worqN4lGKLOyZ7UK6LyBuInEh
         Fy4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724043510; x=1724648310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LOtLgRKGQX67ieoH/CsjydrcIz7BO5T8N0kmB5YnlVI=;
        b=vy8rDEdUgpNRnIGLdE3UgcTrh834WsI6QKb3A6arJtE8dC0sxDcIpGwAmHBipriaLL
         LH6A8Xup10LPDZ/GNAXDzisyFAuIVWWpQ3Eu6b+kfDvwQqueuk1gQgp1tUZNgEkGCjGJ
         kDMw4ENmftQtRY+zUGEc8QF5lKG82JcqNBfIVf1P9Hx8+Tc4fh1svfzGOO8vEDumYBcc
         z3x6ersz7SfwXVU67Ue6yczH6E6EgzG8jOy3TeTaGdaLgmlVhmEocuV4eExlbg40RhK5
         SCDaVSrbK6s9LTxMgZ1Dw7p8fA/eRGOzQTkzZQrVwhy9vQZdlLyFPytYekLZlZRlkWfM
         HJ6A==
X-Forwarded-Encrypted: i=1; AJvYcCV7Yfh1+sUt6TMkN1cKMf0uWikm0pmEd+F9k+EH/O6L7USZZ9wXmF7Woa6XL981OJ2nWcq9n+K3zYds2/C7PG/96begzFPIV1aPOPGVxse7f1D8SpIDr4R55QixTdWVltzWXAFy6RtvcEjCuYadAsl1YF+lG49MTbV/xuZgzzYRNT/OOUELB8EE26WC
X-Gm-Message-State: AOJu0YxMYij1E/ONtx8GqV6Sz2aFcGzwtJhRvDMCe5kvuLpNaa4jEHrc
	sTFy5RfT/sWQxNraLqsuKGD7LkbJr1xNH3gnXaYDSlDB4TtcGpWi
X-Google-Smtp-Source: AGHT+IG7z/IgqBi5/Yx/2Hbbxy5OTXuTpDW4aR1o4zjIypuyxKSQLBYOYO5MbFoTrw1EKbtLekzQNw==
X-Received: by 2002:a17:902:c408:b0:1fa:fbe1:284e with SMTP id d9443c01a7336-20203c084f2mr85137675ad.0.1724043509348;
        Sun, 18 Aug 2024 21:58:29 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:4eb5:4500:6efc:6c24])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-202068497b4sm43483445ad.269.2024.08.18.21.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 21:58:28 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: [PATCH 03/14] Input: samsung-keypad - do not combine memory allocation checks
Date: Sun, 18 Aug 2024 21:58:00 -0700
Message-ID: <20240819045813.2154642-4-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
In-Reply-To: <20240819045813.2154642-1-dmitry.torokhov@gmail.com>
References: <20240819045813.2154642-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver uses devm API to allocate resources so there's no reason
to do allocations first and then check and release everything at once.

Check results immediately after doing allocation of each resource.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/samsung-keypad.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/samsung-keypad.c b/drivers/input/keyboard/samsung-keypad.c
index 46c0d0c900f6..2be3bfa87ce1 100644
--- a/drivers/input/keyboard/samsung-keypad.c
+++ b/drivers/input/keyboard/samsung-keypad.c
@@ -349,8 +349,11 @@ static int samsung_keypad_probe(struct platform_device *pdev)
 
 	keypad = devm_kzalloc(&pdev->dev, sizeof(*keypad) + keymap_size,
 			      GFP_KERNEL);
+	if (!keypad)
+		return -ENOMEM;
+
 	input_dev = devm_input_allocate_device(&pdev->dev);
-	if (!keypad || !input_dev)
+	if (!input_dev)
 		return -ENOMEM;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-- 
2.46.0.184.g6999bdac58-goog


