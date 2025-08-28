Return-Path: <linux-input+bounces-14371-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5514EB3971E
	for <lists+linux-input@lfdr.de>; Thu, 28 Aug 2025 10:36:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 107603BAC74
	for <lists+linux-input@lfdr.de>; Thu, 28 Aug 2025 08:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3B512E0921;
	Thu, 28 Aug 2025 08:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ET72S58o"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1D11E47C5;
	Thu, 28 Aug 2025 08:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756370187; cv=none; b=ujaojhZu93ttkc2QPTL2JeYv4qjVF5Y8GlxfozJulqqgaulaXCLlw5LgLS5JAmo9cxwoogcJAdShPR9tb6dWWQ+3dpnvzOgUO8/1Cy7Vjrk5Ga8SDd8SDL+beSY1U2U/o63ccJU4ypBKoCiInZwPRoIMBzXDDiukj0u61GohY0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756370187; c=relaxed/simple;
	bh=Jav49pTBKRm9kNwk7AnmtNfsDUg9eeDWjkalk8hov9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lARB1u2CmuE8LlxclxmsPH96qnMWWV7G7PTelj780X/f6IeOiw01n8MQjA9SnrGzNHHLErpRnqWFMstMhdMucZU3CHbQd/70vjjhzE673ZvSbd5Cuas4KnP1JAVsHbKg4J+EH7lWi6KZ2eG5PIphuhGbJ4PTZBTgciixCJvUKwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ET72S58o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A0D7C4CEF6;
	Thu, 28 Aug 2025 08:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756370187;
	bh=Jav49pTBKRm9kNwk7AnmtNfsDUg9eeDWjkalk8hov9U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ET72S58ozNBRS5XQqNLtSR3/cpuPfAg8han2gzMLbeY+1gWyvrwdP5nML+oHryhTq
	 gv/Se2q04nvPcYrgcyifuwvKWzz9Pbc2s51wv/nMuF1rvMqO559oUhXpGlFrW50cNg
	 9dht7jrAWBbRVwLjeQ1df/0N3xKAgxjaNlP2EbgqUhwetaWFRMo2KG8RHw0NRa3DFF
	 t8eK2xQwXucvD2EsFzJ+SYwL4PwG4rB2RoGorUGZNgEQvxCQkpy81nap0fmVB86mgY
	 KJ2HgGIJs44c7imvD5wD/s49oOcRgwLEqtfI49aaniUlAhiQZ4dwcj56VEVtFDYSmQ
	 I0k24gUAN9LEw==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Benson Leung <bleung@chromium.org>
Cc: tzungbi@kernel.org,
	linux-input@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH 5/5] Input: cros_ec_keyb - Defer probe until parent EC device is registered
Date: Thu, 28 Aug 2025 08:36:01 +0000
Message-ID: <20250828083601.856083-6-tzungbi@kernel.org>
X-Mailer: git-send-email 2.51.0.268.g9569e192d0-goog
In-Reply-To: <20250828083601.856083-1-tzungbi@kernel.org>
References: <20250828083601.856083-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `cros_ec_keyb` driver can be probed before the cros_ec_device has
completed the registration.  This creates a race condition where
`cros_ec_keyb` might access uninitialized data.

Fix this by calling `cros_ec_device_registered()` to check the parent's
status.  If the device is not yet ready, return -EPROBE_DEFER to ensure
the probe is retried later.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/input/keyboard/cros_ec_keyb.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
index c1e53d87c8a7..f7209c8ebbcc 100644
--- a/drivers/input/keyboard/cros_ec_keyb.c
+++ b/drivers/input/keyboard/cros_ec_keyb.c
@@ -705,6 +705,12 @@ static int cros_ec_keyb_probe(struct platform_device *pdev)
 	ec = dev_get_drvdata(pdev->dev.parent);
 	if (!ec)
 		return -EPROBE_DEFER;
+	/*
+	 * Even if the cros_ec_device pointer is available, still need to check
+	 * if the device is fully registered before using it.
+	 */
+	if (!cros_ec_device_registered(ec))
+		return -EPROBE_DEFER;
 
 	ckdev = devm_kzalloc(dev, sizeof(*ckdev), GFP_KERNEL);
 	if (!ckdev)
-- 
2.51.0.268.g9569e192d0-goog


