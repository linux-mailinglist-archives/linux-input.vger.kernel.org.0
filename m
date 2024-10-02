Return-Path: <linux-input+bounces-7010-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1F298D1BB
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 12:52:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EA1C286AF7
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 10:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A79881EC001;
	Wed,  2 Oct 2024 10:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zx4FlTvx"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813E71E7674
	for <linux-input@vger.kernel.org>; Wed,  2 Oct 2024 10:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727866312; cv=none; b=jYmfgYef7xt6yhoQsBfphuRQz8A4ULSKdcWB9NkAch6TcCzReg1XC0EAfyE4/b3LpZpclrurFoC9TgzirlnO6K5azG9JRtQRFvHOi9/UMxhVo+AvKUXQaNqt4rlsUhFW6FaItCzON2xBiPxMihFIYS8HmafZ73PASq7Rs7JdoJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727866312; c=relaxed/simple;
	bh=kU9RMwVK7tK5tGrD9ncs9Bo5tDjNxEdbyC+uGRc5nuU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QED946OFzyRvdmEP29FLi+89VmZNtLkGQCgVsyVJvTwKREYt4ZOFkxcxPcGWHn5tGHXtcuPbaATPif4J4GXb3pj60f3uVRHFAh3+kxinF5j8uOypqpMfiuJrww9r0dK2x+voGwHqUw3FsNf+046mjKgXxEfVqyyNwk6avN+MoBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zx4FlTvx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 41896C4CECF;
	Wed,  2 Oct 2024 10:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727866312;
	bh=kU9RMwVK7tK5tGrD9ncs9Bo5tDjNxEdbyC+uGRc5nuU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Zx4FlTvxbMcH/Dqqj91QOkvHIbH5q65L+BT9R8c5f8yOV0cCMDxk0uNL3LildoAIK
	 tt2rFd8NomeJVMEACkSmXzKWk0uTHnDTADBARlCeK6hF8xdWXhzm+F4qDRGRQv3iw8
	 eFjmtkErFRQNWrOTM4CfGzfeEyNf5KtjBU/HlCD7G1HZXWOGI4Fz6mVzE71ZMbvOqu
	 bYRMnv+TKXcNSzRuUruj0TpHb/uQmEHRQv5lgA74Vw58SYPS+uX7ckJSOIqQifI2n4
	 NDn/7EiDcFf1ZyUdJrtjOgyAI11r+m5ufKnH4rAWt+Gg7nF+eQtfu2R5d2ryUpcvUT
	 lo/peNnhj6xoQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39E57CF31B5;
	Wed,  2 Oct 2024 10:51:52 +0000 (UTC)
From: Nuno Sa via B4 Relay <devnull+nuno.sa.analog.com@kernel.org>
Date: Wed, 02 Oct 2024 12:51:52 +0200
Subject: [PATCH 3/4] Input: adp5588-keys: error out if no IRQ is given
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241002-fix-adp5588-read-refactor-v1-3-28800f1b9773@analog.com>
References: <20241002-fix-adp5588-read-refactor-v1-0-28800f1b9773@analog.com>
In-Reply-To: <20241002-fix-adp5588-read-refactor-v1-0-28800f1b9773@analog.com>
To: Michael Hennerich <michael.hennerich@analog.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727866310; l=956;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=Oyv6w1vVB0WsBBnLrEoR1/r+BQ9oW4zFkMd7v+3aoJg=;
 b=R4ykC6WUXoS2Pr1ZkyEWK/TbVMKvSNrHRAKHmo6YaN1hMhyoNEoNlqWfi02Wig7gGRn5aHsLp
 4fVvMG63iAUAEkHh7R5D2XuyGfokQEw9OBzpMzyrusmHnM9cQoVjipk
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: Nuno Sa <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com

From: Nuno Sa <nuno.sa@analog.com>

If the keypad is configured, it also depends on the presence of an
interrupt. With
commit dc748812fca0 ("Input: adp5588-keys - add support for pure gpio"),
having an interrupt is no longer mandatory so better check for it when
it is indeed mandatory.

Signed-off-by: Nuno Sa <nuno.sa@analog.com>
---
 drivers/input/keyboard/adp5588-keys.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/input/keyboard/adp5588-keys.c b/drivers/input/keyboard/adp5588-keys.c
index 11a70ee18482..0152e4fa088c 100644
--- a/drivers/input/keyboard/adp5588-keys.c
+++ b/drivers/input/keyboard/adp5588-keys.c
@@ -680,6 +680,11 @@ static int adp5588_fw_parse(struct adp5588_kpad *kpad)
 		return 0;
 	}
 
+	if (!client->irq) {
+		dev_err(&client->dev, "Keypad configured but no IRQ present\n");
+		return -EINVAL;
+	}
+
 	ret = matrix_keypad_parse_properties(&client->dev, &kpad->rows,
 					     &kpad->cols);
 	if (ret)

-- 
2.46.1



