Return-Path: <linux-input+bounces-10344-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1535FA443B7
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 15:59:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 073753B26A9
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 14:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1496921ABC6;
	Tue, 25 Feb 2025 14:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gvWWTaLq"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFC321ABC3;
	Tue, 25 Feb 2025 14:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740495218; cv=none; b=FxowS1pPuWzLhWjhzUbuPDzUW8RW9mR0sFQHPBj13kyjx6FBboPVoX6Qa0NlW2y2nvSIu6uCBXAg9lgf3f4Dofi7RzeNxiOikje0FNHODLxDEOjzqL+9iyZzT139eEkH9zvUQ4aP+DS4ppEEE0RpAFZY8nEHKa0/Zypg3L4IRME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740495218; c=relaxed/simple;
	bh=iY14Gvj82e3dtVYvilbYGIx6TuQ4PB6uf5B9BB0r2UU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fEQBlyZgfdHxaN7ri8TSlXkI5IFCmipgcQRYu9sv3yOHgJL+AC/ZA/sfYtHDDiQcIZzQcylFlDlMwY8N3Pg6GcIoU4Ne4w7lYCzZ9ZCPokXlRre2nsvonKxbrK0XVElRwVXz4PGOtqulpA4NpAQbKm8GsfHZ2oqoHVV2QPonKeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gvWWTaLq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19583C4CEDD;
	Tue, 25 Feb 2025 14:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740495217;
	bh=iY14Gvj82e3dtVYvilbYGIx6TuQ4PB6uf5B9BB0r2UU=;
	h=From:To:Cc:Subject:Date:From;
	b=gvWWTaLq4syM5rd2Fd9ml817TZ5fEzFxKxwviVS7t34QYF0+QWhOUsLkxVBqB5Kyi
	 nHftrZSghKEPoJoHq/RKqz7w2kIrT2zR7yMhM7V2y6ZkT86jNHQhXLWazJabfVJGQg
	 XILF4edBXbWOTJd7753kD//cE72XaSAZ7ku6PZpu6BcGl9XzBKfwOALxMWXscVvhYw
	 RP6G1Ts0GV4Ip/7b7t6zz79iwzBan5/4EEwJB/TAphIIuuRjLY2sY4hYidRk/eVjp6
	 gn0Vn9KJDgb65qytfjoeg1P+UuCqIrFI4zINl5ZLVdM5xZ+MdlLLz/hUIqiqGcH6Rf
	 KRYjOnHoveFew==
From: Arnd Bergmann <arnd@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Yu Jiaoliang <yujiaoliang@vivo.com>,
	Oliver Graute <oliver.graute@kococonnector.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	linux-input@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] [v2] Input: stmpe-ts - mark OF related data as maybe unused
Date: Tue, 25 Feb 2025 15:53:26 +0100
Message-Id: <20250225145332.1116557-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

When compile tested with W=1 on x86_64 with driver as built-in:

  stmpe-ts.c:371:34: error: unused variable 'stmpe_ts_ids' [-Werror,-Wunused-const-variable]

Ideally this would be referenced from the platform_driver, but since
the compatible string is already matched by the mfd driver for its
parent device, that would break probing.

In this case, the of_device_id table just serves as a module alias
for loading the driver, while the device itself is probed using
the platform device name.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Link: https://lore.kernel.org/lkml/20240403080702.3509288-8-arnd@kernel.org/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/input/touchscreen/stmpe-ts.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/stmpe-ts.c b/drivers/input/touchscreen/stmpe-ts.c
index a94a1997f96b..3900aa2e3a90 100644
--- a/drivers/input/touchscreen/stmpe-ts.c
+++ b/drivers/input/touchscreen/stmpe-ts.c
@@ -366,7 +366,7 @@ static struct platform_driver stmpe_ts_driver = {
 };
 module_platform_driver(stmpe_ts_driver);
 
-static const struct of_device_id stmpe_ts_ids[] = {
+static const struct of_device_id stmpe_ts_ids[] __maybe_unused = {
 	{ .compatible = "st,stmpe-ts", },
 	{ },
 };
-- 
2.39.5


