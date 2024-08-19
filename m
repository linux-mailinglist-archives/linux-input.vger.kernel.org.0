Return-Path: <linux-input+bounces-5641-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EADA09562D1
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 06:59:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A833B2823E9
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 04:59:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D44C156879;
	Mon, 19 Aug 2024 04:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="In1vhGaO"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A334015575D;
	Mon, 19 Aug 2024 04:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724043515; cv=none; b=LQ1OPuG5e9KWHDwbU8mOCoQMB/8yKUpxUY6XfVDaCZNBGQWCNydGi5041Me2CNPibnntCtjAHKEbQT1//y9imxJOI1qryaTJcuddv1SWWaTJzHQqEteO9PhkmohTqs2RZfX+R7UIz/5qQxLMOEJUkTotStiCWW7gM+GsodDA3IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724043515; c=relaxed/simple;
	bh=Q8bepAspR0s9AbncRo7u8oBg2ug+vm1o8Jm67t5RHsg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jpqrKy6vswWMRAfQWYtGdZvzhGw9fb8iAYrP4jgXejo1xtHbBvsFeOeWIChkkcP+tBt2cmiHG3xsgWU6nubM/085Wjx6iCeUi1gc9O3AMauXkUcvnJhrmq872qX8TXU22vyRfC58pZTybaouZygV/q4iU5ljtmkH22ncfikaotk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=In1vhGaO; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-201fbd0d7c2so22032605ad.0;
        Sun, 18 Aug 2024 21:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724043512; x=1724648312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lNWm/LHzPulP7AbD+r4Ifgq3N7WHw34TpzWbrByhISE=;
        b=In1vhGaO3u43x5jesqUDHdU73MxnslmaeQnBaGUGjFcYYeAL7p8RgTUcNnnolbjhJx
         MTdIXhMnXmO1xuc+dKhD2vDa4PcGAWgS42RWoBv0zwF5HXU4Q5VdwKVNfmyOFP2ab8lu
         9hXijPq/Ad/JZvjhM8nw4Nl3PFL8SmbCxsw+i/nJSJ0V+wT5j+3juWB42xlpA8zGf5kZ
         2I9yx52FymicoMTkz/DY6cgztXX7bXw+/09LlWDjb4g8A+bDsMdbB25hiEMkFHImTeZY
         yZomV8liYv9H6zFyKwtvN7gtcAkiDzTidzLEHqyRIcQOLI6UeGacwns2PvbEfd7H5TN7
         Kcww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724043512; x=1724648312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lNWm/LHzPulP7AbD+r4Ifgq3N7WHw34TpzWbrByhISE=;
        b=X/PO+9VQwx5DDKHwbIY5U0Ght69M20opIbrdhnMk0yTQDSRN7feGLnF0GQ1QqjUujG
         MjSH1bj+eZ1rn5GpG//6GKTpHcveVQyUK0bD3pl7NJ1ubr0/saWqVhSQ9wmO7Pw4wdN1
         q3fCqpee2SrITBkrRlEaHb+e6WO8Rzmp+e2VFKFixliALW9jPOMBWZm4+UDkvvpmGgho
         8lEY3ru8xemsNrUM5+Hf+egoqY3baK0WAb/mmbHYFBIxgahNJEwXQc2tZVMdckmP+7Aw
         PLh176kSEZxMPyx1NwBYHpPe/hOrWUB0xJQBbhHhJ9F+rZK4E2ze0OECayMzjVonUhrh
         aEsA==
X-Forwarded-Encrypted: i=1; AJvYcCU/6nut8v1GKv9Kyf0emjBr783jCd9ENKs6cCIXHJe8YL4UP5oCqMCGHl5+520/lymRN8lBowJzBTU06trCp8E3DOsRKT13iG+hz3TeKN71rHcStY/ZmLPafS8EC0v1a+icBPjFZadEDrKs8QH9UIaleivTJnRm0GYe139b2mkzc1gK9JV7dvTwrSD2
X-Gm-Message-State: AOJu0Yxf2WsFnUO7RQarnQkUea5Vde4a8Co5R2oA/ftc0V8E3t4uraQZ
	GDSEj8xDq4cry0v+5LwvwfbpQkikhsvud2sAbkym6IH5LjdQbXHF
X-Google-Smtp-Source: AGHT+IF+5xTqa6T/wiF74i1cJmY0LmEvr8qfMTP1VOfYfjLyAhlqt4pH3GHhaxtukOfpWaiyJZ9e4A==
X-Received: by 2002:a17:903:946:b0:202:232b:2dd8 with SMTP id d9443c01a7336-202232b3046mr32707215ad.55.1724043511647;
        Sun, 18 Aug 2024 21:58:31 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:4eb5:4500:6efc:6c24])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-202068497b4sm43483445ad.269.2024.08.18.21.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 21:58:31 -0700 (PDT)
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
Subject: [PATCH 05/14] Input: samsung-keypad - use devm to disable runtime PM
Date: Sun, 18 Aug 2024 21:58:02 -0700
Message-ID: <20240819045813.2154642-6-dmitry.torokhov@gmail.com>
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

To make sure that runtime PM is disabled at the right time relative
to all other devm-managed resources use devm_add_action_or_reset()
to register a handler that will disable it.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/samsung-keypad.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/input/keyboard/samsung-keypad.c b/drivers/input/keyboard/samsung-keypad.c
index 7adcd2657bca..924327de4d8f 100644
--- a/drivers/input/keyboard/samsung-keypad.c
+++ b/drivers/input/keyboard/samsung-keypad.c
@@ -310,6 +310,13 @@ samsung_keypad_parse_dt(struct device *dev)
 }
 #endif
 
+static void samsung_disable_runtime_pm(void *data)
+{
+	struct samsung_keypad *keypad = data;
+
+	pm_runtime_disable(&keypad->pdev->dev);
+}
+
 static int samsung_keypad_probe(struct platform_device *pdev)
 {
 	const struct samsung_keypad_platdata *pdata;
@@ -420,11 +427,16 @@ static int samsung_keypad_probe(struct platform_device *pdev)
 
 	device_init_wakeup(&pdev->dev, pdata->wakeup);
 	platform_set_drvdata(pdev, keypad);
+
 	pm_runtime_enable(&pdev->dev);
+	error = devm_add_action_or_reset(&pdev->dev, samsung_disable_runtime_pm,
+					 keypad);
+	if (error)
+		return error;
 
 	error = input_register_device(keypad->input_dev);
 	if (error)
-		goto err_disable_runtime_pm;
+		return error;
 
 	if (pdev->dev.of_node) {
 		devm_kfree(&pdev->dev, (void *)pdata->keymap_data->keymap);
@@ -432,15 +444,6 @@ static int samsung_keypad_probe(struct platform_device *pdev)
 		devm_kfree(&pdev->dev, (void *)pdata);
 	}
 	return 0;
-
-err_disable_runtime_pm:
-	pm_runtime_disable(&pdev->dev);
-	return error;
-}
-
-static void samsung_keypad_remove(struct platform_device *pdev)
-{
-	pm_runtime_disable(&pdev->dev);
 }
 
 static int samsung_keypad_runtime_suspend(struct device *dev)
@@ -575,7 +578,6 @@ MODULE_DEVICE_TABLE(platform, samsung_keypad_driver_ids);
 
 static struct platform_driver samsung_keypad_driver = {
 	.probe		= samsung_keypad_probe,
-	.remove_new	= samsung_keypad_remove,
 	.driver		= {
 		.name	= "samsung-keypad",
 		.of_match_table = of_match_ptr(samsung_keypad_dt_match),
-- 
2.46.0.184.g6999bdac58-goog


