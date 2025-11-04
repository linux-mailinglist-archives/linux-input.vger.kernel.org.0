Return-Path: <linux-input+bounces-15877-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DEAC2F8C2
	for <lists+linux-input@lfdr.de>; Tue, 04 Nov 2025 08:03:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 51C354E24EE
	for <lists+linux-input@lfdr.de>; Tue,  4 Nov 2025 07:03:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62C8D30103F;
	Tue,  4 Nov 2025 07:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gqn7weQH"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B118238D52;
	Tue,  4 Nov 2025 07:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762239833; cv=none; b=HWckd/4rXiwV5RClx1jm0EPtz+NYLMRbWZyrzTQKV32zarsljYM0QsQUFDcfBGt03NqfcDQr5xhiA0IRv/Tw/cHMUOwLd7wC4pjOsmrEjjZC0diqjGe8nGD0hK0e8EDaVYRiXLisyATJnub6UkoPQQdxfmNTfdIrZ1usIqXD83U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762239833; c=relaxed/simple;
	bh=U2Ze7dbOECGG8ZUDhfgEP74JxlBF3apn58KgJwBVxI0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pRe9Wj1WZV6DpbzvU6O2TB1LwGbJaZOhgUpKe0l1Fw9jyC0p0Wpqkn5glm9PFMCZvuUzavowgGAFqPsne9trf1BfxY9WlqW/xspy4HRuOqn5E+hcnrPjZMNZeQUvj0pImW/YBhXQo0AgMMi+l968keYHSFimd1Ju06IdSAunxzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gqn7weQH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB9B8C4CEF7;
	Tue,  4 Nov 2025 07:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762239830;
	bh=U2Ze7dbOECGG8ZUDhfgEP74JxlBF3apn58KgJwBVxI0=;
	h=From:To:Cc:Subject:Date:From;
	b=gqn7weQH5qBRZUEPjGoI7w8NZUF1ru2quggwIdrBmLr8S020JwTJ89gwv13pyM8jQ
	 KsvL29MG3SsIXCTazazXeTMqwrzwv2fHKqC5Cp9Y0XoR3pK8LrKDefeQZ6BblcXo6Q
	 N25mG3hI1+0TvH9NqlhDzYWTXCohqI3nUjul16GfqaEUeh431IF0X7XjudCwd9QbcN
	 MooxyM1m/0+E/rMwyFjrR9hSUV2lukOAcCPvRWYWsJsYrMJCwbHN+jjoo7wNgOoHMN
	 ekE+Z4nt8HolmN8oTRm7RvV7MlGoaUwuHP0WcYAZqiGGRLXXihCsWPSKCG/oz420h8
	 vdF/qE51coIdw==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Benson Leung <bleung@chromium.org>,
	linux-input@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	tzungbi@kernel.org
Subject: [PATCH v2] Input: cros_ec_keyb - Fix an invalid memory access
Date: Tue,  4 Nov 2025 07:03:10 +0000
Message-ID: <20251104070310.3212712-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.51.2.997.g839fc31de9-goog
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If cros_ec_keyb_register_matrix() isn't called (due to
`buttons_switches_only`) in cros_ec_keyb_probe(), `ckdev->idev` remains
NULL.  An invalid memory access is observed in cros_ec_keyb_process()
when receiving an EC_MKBP_EVENT_KEY_MATRIX event in cros_ec_keyb_work()
in such case.

  Unable to handle kernel read from unreadable memory at virtual address 0000000000000028
  ...
  x3 : 0000000000000000 x2 : 0000000000000000
  x1 : 0000000000000000 x0 : 0000000000000000
  Call trace:
  input_event
  cros_ec_keyb_work
  blocking_notifier_call_chain
  ec_irq_thread

It's still unknown about why the kernel receives such malformed event,
in any cases, the kernel shouldn't access `ckdev->idev` and friends if
the driver doesn't intend to initialize them.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
v2:
- dev_info() -> dev_warn_once().

v1: https://lore.kernel.org/chrome-platform/20251104064353.3072727-1-tzungbi@kernel.org

 drivers/input/keyboard/cros_ec_keyb.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
index f7209c8ebbcc..324c98b1cb52 100644
--- a/drivers/input/keyboard/cros_ec_keyb.c
+++ b/drivers/input/keyboard/cros_ec_keyb.c
@@ -261,6 +261,11 @@ static int cros_ec_keyb_work(struct notifier_block *nb,
 	case EC_MKBP_EVENT_KEY_MATRIX:
 		pm_wakeup_event(ckdev->dev, 0);
 
+		if (!ckdev->idev) {
+			dev_warn_once(ckdev->dev, "No key matrix\n");
+			return NOTIFY_OK;
+		}
+
 		if (ckdev->ec->event_size != ckdev->cols) {
 			dev_err(ckdev->dev,
 				"Discarded incomplete key matrix event.\n");
-- 
2.51.2.997.g839fc31de9-goog


