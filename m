Return-Path: <linux-input+bounces-8014-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF309C418F
	for <lists+linux-input@lfdr.de>; Mon, 11 Nov 2024 16:10:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97E0F1F21EE1
	for <lists+linux-input@lfdr.de>; Mon, 11 Nov 2024 15:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0F3445016;
	Mon, 11 Nov 2024 15:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TX3AENUX"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700851BC58;
	Mon, 11 Nov 2024 15:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731337801; cv=none; b=H5Wg815PVGC95yILExiXH6/P7RSo9JzB4U+te8nNYjW3xCK9Y17z9yRZv3QxUhF6tF3Lb+IbbpFVmcKLGMo52LpbD6RO4EuaFrHnPEEJwg53CMUWN8g9VifdNy6x02fGdXuRzIm1M0hvTOlaL1LSPfq1yGVmD+RT+xxuuQP3NKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731337801; c=relaxed/simple;
	bh=zypVVYX6On4iVKE2tfCClgX4Xgvb/PzJEXH3CwpxGcU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=iMfVyxdYj9/L1RQ1+3U6qbHcrZAvfEM1DaPAeZcvpAzg9EMV7Rh5gSpVucNFLp6tXT04Wx5FumqjOpFDpxvCe/UqdkWZ+mHAAtovwEcSva3PM+S94aC9WTDpa77utFOLccfO4iTkLP7ipCx2qQWoIGB9F1E52LlSONqJTx+Rfhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TX3AENUX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB5A6C4CECF;
	Mon, 11 Nov 2024 15:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731337801;
	bh=zypVVYX6On4iVKE2tfCClgX4Xgvb/PzJEXH3CwpxGcU=;
	h=From:Date:Subject:To:Cc:From;
	b=TX3AENUXBLBuOZfHIGLs/TYP+5vvb6SVHR0Knq6DnO4z3PmeFYDxHexVYb4Kd3DVs
	 Wv4JHIBOqYIkZ4QjMucIufNzZ6R91fIhJukCACLaJ9ujZIjjgG9piUH/4pmHhj8Z+4
	 V8gO6s1ro922A/EX+RmKoqfgMY6bAAKnToqT24BYc+YaQLiKu7paLkao7ps6gfv/9r
	 C/ozMfvHbD8Z0MMOVmDkZ26g3szdKrxsqH+h9BodZugTxU9ook7UxmbPk5GAindZlD
	 ttQYhsMehez4PmmUekU4I0m4fum4SufmhDedt8gVq899TgWVJB/r53AQzPXXtQ2w5/
	 XpYqo161gi9GQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 11 Nov 2024 08:09:55 -0700
Subject: [PATCH] Input: ads7846 - Increase xfer array size in 'struct
 ser_req'
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241111-input-ads7846-increase-xfer-array-size-v1-1-06cd92e9f20f@kernel.org>
X-B4-Tracking: v=1; b=H4sIAEIeMmcC/x3NQQ6CQAyF4auQrm0yM+BgvIpx0TAFuhlIqwYl3
 J3Gt/s279/BWIUN7s0Oyh8xWaojXhoYZqoToxQ3pJC66EOp6/uFVKy/ddk1KJMxbiMrkip90eT
 HmHJoKV6phJzAz1blUbZ/6PE8jhPlifUleAAAAA==
X-Change-ID: 20241111-input-ads7846-increase-xfer-array-size-2603a15ad062
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Marek Vasut <marex@denx.de>, linux-input@vger.kernel.org, 
 llvm@lists.linux.dev, patches@lists.linux.dev, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1899; i=nathan@kernel.org;
 h=from:subject:message-id; bh=zypVVYX6On4iVKE2tfCClgX4Xgvb/PzJEXH3CwpxGcU=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDOlGch4/Zucd2NBS6622LP2NsZLkme7fW1fdf76Q4/+lh
 tX1d/ee6ihlYRDjYpAVU2Spfqx63NBwzlnGG6cmwcxhZQIZwsDFKQATqTRg+B/673Dq5n9Rmfu3
 m72/HWjgaFGjppjNY1fv+XDnC2bpjYGMDOe9DZuZLgreOvU06ept5czUT4HueUemcNcv/az7+ba
 BEBcA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

Clang warns (or errors with CONFIG_WERROR=y, trimmed for brevity):

  drivers/input/touchscreen/ads7846.c:412:2: error: array index 6 is past the end of the array (that has type 'struct spi_transfer[6]') [-Werror,-Warray-bounds]
    412 |         req->xfer[6].tx_buf = &req->scratch;
        |         ^         ~
  ...
  drivers/input/touchscreen/ads7846.c:416:2: error: array index 7 is past the end of the array (that has type 'struct spi_transfer[6]') [-Werror,-Warray-bounds]
    416 |         req->xfer[7].rx_buf = &req->scratch;
        |         ^         ~
  drivers/input/touchscreen/ads7846.c:334:2: note: array 'xfer' declared here
    334 |         struct spi_transfer     xfer[6];
        |         ^

Increase the size of xfer in 'struct ser_req' to ensure that there is
enough space for all necessary members and there are no out of bounds
accesses, clearing up the warning.

Fixes: 781a07da9bb9 ("Input: ads7846 - add dummy command register clearing cycle")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/input/touchscreen/ads7846.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/ads7846.c b/drivers/input/touchscreen/ads7846.c
index f7bc0a3e56d86932823b6bc0dcd6bcd8e1b9b5c2..7b3711a3597c86f18c45d040f73bef884ec3c4aa 100644
--- a/drivers/input/touchscreen/ads7846.c
+++ b/drivers/input/touchscreen/ads7846.c
@@ -331,7 +331,7 @@ struct ser_req {
 	u8			ref_off;
 	u16			scratch;
 	struct spi_message	msg;
-	struct spi_transfer	xfer[6];
+	struct spi_transfer	xfer[8];
 	/*
 	 * DMA (thus cache coherency maintenance) requires the
 	 * transfer buffers to live in their own cache lines.

---
base-commit: bed0f75909b21c0cd0285da76fdfcc61a9745b0c
change-id: 20241111-input-ads7846-increase-xfer-array-size-2603a15ad062

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


