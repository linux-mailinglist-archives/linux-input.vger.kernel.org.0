Return-Path: <linux-input+bounces-8125-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF459D01F4
	for <lists+linux-input@lfdr.de>; Sun, 17 Nov 2024 04:35:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A0D31F2137C
	for <lists+linux-input@lfdr.de>; Sun, 17 Nov 2024 03:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F4135DF49;
	Sun, 17 Nov 2024 03:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZBg+Hny2"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC64D6FB0;
	Sun, 17 Nov 2024 03:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731814497; cv=none; b=EEi4DIkJFD4XOD7OCSjG10tJOv7p2j7JFjsK3J/sfpvgxdpQpnFjwzZWxuQZH4noC+IJQ4D3rOLseYwj1YLtFtw7+qnwH6tCF9oeGjyaRzGisuqnxkbKX2yH+EoFUyJnIVEvUVOA4gCUri8EB+5ZCvLv9eqkmkIoqVvJs4kS2Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731814497; c=relaxed/simple;
	bh=Eku9wIx8SnL1CGEny2QkDwzzkpnkr/vdiw6LJHjH5X8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=faWB7m/p4UZfKqHZ8iMiVzyC3PSQ28TVK6FfUTjX3tLtXhPCwk3uFCTaMt2IuaUNnJI4EcNOwL257pQj8U7IFLAh4ZKWZSGUFhx5entKQ0HXHuMBxG7w832+huDfL5ZT5dVmfBz/rnxkA29yM9SF29jOHI5qxYDQlvIPliH6BWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZBg+Hny2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3000FC4CECD;
	Sun, 17 Nov 2024 03:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731814497;
	bh=Eku9wIx8SnL1CGEny2QkDwzzkpnkr/vdiw6LJHjH5X8=;
	h=From:To:Cc:Subject:Date:From;
	b=ZBg+Hny2nGRD1sDLANX8Qql7LTzA1MxCWuKgM4tR4bOk+OUdaflBHmrkHkWU911f/
	 1gBZvmYoBbfz0+UhW0QQxdKx/ZsDraqZxafCVdSHZHUBLOV/63+ChOSMJAezZ3/aIX
	 SovKGoGqcaHJeRxBDuUai1nnpdhzE5Apn5A3kLmQOLRiUnv1PPzg6Gxoouqa7SddDW
	 flOzSNVrDpF0EXoPbdWgBtrrsdMuN9HOL4/X0bzW6oaVTylHntclkRxlgLOMtIX4De
	 /N5RD9pTpLOi406raLn9fl0LZSYHtnCTXkDVu7IkXgRM5LFnfWs8K7TKnF2UfrS/8f
	 hvj50WR0SDRtA==
From: Kees Cook <kees@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Kees Cook <kees@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Luca Ellero <l.ellero@asem.it>,
	linux-input@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] Input: ads7846 - Expand xfer array to match usage
Date: Sat, 16 Nov 2024 19:34:50 -0800
Message-Id: <20241117033445.work.274-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1718; i=kees@kernel.org; h=from:subject:message-id; bh=Eku9wIx8SnL1CGEny2QkDwzzkpnkr/vdiw6LJHjH5X8=; b=owGbwMvMwCVmps19z/KJym7G02pJDOmWKZF7LT4Zv2YW2e6kW+7X/eHx4s2vpioISRat6Z9z4 /vTg8afOkpZGMS4GGTFFFmC7NzjXDzetoe7z1WEmcPKBDKEgYtTACaSr83wP6DkrYFFnl/8w4se lnb824WXzNRom289pWZp89K42edmH2L4K7T6suKKB1bJ8/mnBi3a4SUU2buiIIbN+var8Dnpr+b s4QQA
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Commit 781a07da9bb9 ("Input: ads7846 - add dummy command register
clearing cycle") added commands to struct ser_req::xfer without
expanding it to hold them. Expand the array to the correct size.

../drivers/input/touchscreen/ads7846.c: In function 'ads7846_read12_ser':
../drivers/input/touchscreen/ads7846.c:416:18: error: array subscript 7 is above array bounds of 'struct spi_transfer[6]' [-Werror=array-bounds=]
  416 |         req->xfer[7].rx_buf = &req->scratch;
      |         ~~~~~~~~~^~~
../drivers/input/touchscreen/ads7846.c:334:33: note: while referencing 'xfer'
  334 |         struct spi_transfer     xfer[6];
      |                                 ^~~~

Fixes: 781a07da9bb9 ("Input: ads7846 - add dummy command register clearing cycle")
Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Marek Vasut <marex@denx.de>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Luca Ellero <l.ellero@asem.it>
Cc: linux-input@vger.kernel.org
---
 drivers/input/touchscreen/ads7846.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/ads7846.c b/drivers/input/touchscreen/ads7846.c
index 75e5b2e4368d..066dc04003fa 100644
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
-- 
2.34.1


