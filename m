Return-Path: <linux-input+bounces-15875-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9041EC2F7A9
	for <lists+linux-input@lfdr.de>; Tue, 04 Nov 2025 07:45:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3BA6534D142
	for <lists+linux-input@lfdr.de>; Tue,  4 Nov 2025 06:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36F1235971;
	Tue,  4 Nov 2025 06:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n2gN4hQE"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6F8DDD2;
	Tue,  4 Nov 2025 06:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762238734; cv=none; b=fHwoAubm8FdqedTdylcIeRxATPu1wRXD6Y7wDsDYOcaalRrjosXeIyJ7zAMraYCNOQfiRn27xg7nEKxHxxslPomscQZkfsqCmYwPQGSc8JbmV36DRmCKyHWMcI8etSFmUOAD8mTMXkiWu626LMavfYkpgxyYujdetmGVMy9NrrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762238734; c=relaxed/simple;
	bh=23jkfKaU3qcqMnuvLWvNwPkPnW7lK+VuL1y/stoqTig=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rBvXC2vPWYRdjPZoZhiEjoPXry5TvLNIVerrRBulhzsO42qHVdehjyyKeA/4frZgu1LjULBU/IW8IZ94sIJF1x8ufNFz3NGo3Awn3w5xEA1PVB6LFdbKSexk+y1YWTJRpMAbpg7ZEuao4JhimDVKrcnfx4TYdGuHrfPegCi/gHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n2gN4hQE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B84E9C4CEF7;
	Tue,  4 Nov 2025 06:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762238731;
	bh=23jkfKaU3qcqMnuvLWvNwPkPnW7lK+VuL1y/stoqTig=;
	h=From:To:Cc:Subject:Date:From;
	b=n2gN4hQEDZe+YHGvUw7Z9vr/ez8q3WvSmUgE7Gz89gB0UZuYwUTn0HNNPEjvIGjqv
	 hXqe592IaU13eMdTw4M/EP4NOdE432PVEEd1988f7nnq9qqXWKLzxjX82x58hc4SWD
	 UYuBS8QEs5/qjHUThEe3v6/Hh/RzCW+JrDBbOHa0sJNgbEX/QRaox5HOq6MBdZFRdY
	 2/9nc4dughdtADNy98ttbX12fuWGbZ1dQgHR2Qez8OIGFWC1QxiqkuX2C9bv1RE9XO
	 csS/CPOZacbpumczubqBmmtshvpuz2JFCfTxDV1b1mKwnP7aQKodGul32E4/vyue6v
	 o614XsXUzja/Q==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Benson Leung <bleung@chromium.org>,
	linux-input@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	tzungbi@kernel.org
Subject: [PATCH] Input: cros_ec_keyb - Fix an invalid memory access
Date: Tue,  4 Nov 2025 06:43:53 +0000
Message-ID: <20251104064353.3072727-1-tzungbi@kernel.org>
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
 drivers/input/keyboard/cros_ec_keyb.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
index f7209c8ebbcc..635ee99fe0bd 100644
--- a/drivers/input/keyboard/cros_ec_keyb.c
+++ b/drivers/input/keyboard/cros_ec_keyb.c
@@ -261,6 +261,11 @@ static int cros_ec_keyb_work(struct notifier_block *nb,
 	case EC_MKBP_EVENT_KEY_MATRIX:
 		pm_wakeup_event(ckdev->dev, 0);
 
+		if (!ckdev->idev) {
+			dev_info(ckdev->dev, "No key matrix\n");
+			return NOTIFY_OK;
+		}
+
 		if (ckdev->ec->event_size != ckdev->cols) {
 			dev_err(ckdev->dev,
 				"Discarded incomplete key matrix event.\n");
-- 
2.51.2.997.g839fc31de9-goog


