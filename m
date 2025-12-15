Return-Path: <linux-input+bounces-16585-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E03CBEB7B
	for <lists+linux-input@lfdr.de>; Mon, 15 Dec 2025 16:44:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C7A33087938
	for <lists+linux-input@lfdr.de>; Mon, 15 Dec 2025 15:36:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31C5D348445;
	Mon, 15 Dec 2025 14:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WdduVxGz"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0926F347FF8;
	Mon, 15 Dec 2025 14:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765809006; cv=none; b=ETc8nHtn9FZHBe1e1A9FWbte9fEZHbr4ghsFZG9jtvnCglnZSSt4c+7yWX0BzFtfWv7VZB7iM1V1OO/OchM1ZYvol6stIeaHx0SR0oslXSZkU7OdgbpIyDCZVrjvYym0gaulv97FrbuFB+KjO0GLWE3fA0Rq5LvhRZ/Bg8233m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765809006; c=relaxed/simple;
	bh=YVvjG+ad6pHMfUraBILNT039YVFkeM0faHWTaRTnmfo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OUGE/LLmZw7kKSEyHnIS0puYefzrFP8LFR/SSaizZ4nE8bi6poGEXayYFsg9FUWnpRkFINAwHx3WgUn4vqNAAQevS+IlZ1dyppM09etvK9q4lh5RU7WAizPbD3+pbtrrffs6ojPKlBYK04hqy6w6z6qLCdzWY4qDlW0NX0udB3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WdduVxGz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id ADDB7C4CEF5;
	Mon, 15 Dec 2025 14:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765809005;
	bh=YVvjG+ad6pHMfUraBILNT039YVFkeM0faHWTaRTnmfo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WdduVxGzhJQVjN6khiLe4OSbXFN3OPJbly6stOErcrXSJZPW+OtXAPfvpqxXNx4Lr
	 R/wfbGNMZn8gTeyQoC65rLrrBCoJCFx0i/ugKopUL5aHaJzlntwPR6sNbXyN0lRdXF
	 5aAW1J/l/oApl/cuNJSgi5Eq4iSGMCGSVXz4O+4dD0LSlHkp8M1O2Wqd/qN9+aaEXA
	 L83Ej0lJZ2hmO6TsaYbX/zAnYPaSL38S0/76nLlf9k9NSBqGZXG2yTOtiTeCnNKnTF
	 M5vXwT0D5D9ZPyk7+QN3pV55GWVyulhgae9wvgBJlSmrQHfgrYkWXFyeDbLxx8BavQ
	 uX54pneNFylrg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C3C0D5B16C;
	Mon, 15 Dec 2025 14:30:05 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 15 Dec 2025 15:30:01 +0100
Subject: [PATCH 1/4] Input: stmfts - correct wording for the warning
 message
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-fts-fixes-v1-1-8c1e3a63ebf1@ixit.cz>
References: <20251215-fts-fixes-v1-0-8c1e3a63ebf1@ixit.cz>
In-Reply-To: <20251215-fts-fixes-v1-0-8c1e3a63ebf1@ixit.cz>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Petr Hodina <petr.hodina@protonmail.com>, 
 Javier Martinez Canillas <javier@osg.samsung.com>, 
 Rob Herring <robh@kernel.org>, Andi Shyti <andi@etezian.org>
Cc: linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=901; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=zOdQuMRtwbT9fTBVbDJbgo/FBNojnDOTgGlU+/RFodc=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpQBtrMN45yASJj+00VAkGd5xdIZEokXHQ2coVt
 zB6A4cgLICJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaUAbawAKCRBgAj/E00kg
 cmt/D/0WqN7Qnefn04HGZtDjWqh6Xd3bFVndWwMvuHkGWgqXin0Zz/PSV9ITNRECWqPY/ijIjzb
 QRs1FjZjoX0fwPn1I32WGLypaGIwk64KWTIY1vegL/Ocrl++34Y2YIBphH6P6uw+n5yzGRK0/Xh
 hAsOWgiN2FwBd1Q3qn98deFk9PJVrPq7YIDeAp7/58aBIUxvdd9kWq/B8bRv2LzufshyTkxNjq0
 LExaY/z3xkYjEwuI2D9mXagWS3doWS4womk7GYxbfcWhTfW9JuLP5X6YxDhXX0efbf34/xet2Yk
 x4t9PEtwiYR53Y0LbJS18egxymFMXJlJezYbUTIxN8OoK+Kcaqceg3CioSQwrOyzxaeRQNizSo2
 hd2sfwAREdCgTfKy9KX7CrGoMvSSxynuHrYP+0785QiwU9+dXb/kV53HQK9hDGqWJ2xTw24zpKF
 hjeGgxU5qQJsr60EzcT8fFnuh3sn7v5EQP3zO3dyCqG3f7RIX4uT5VQnbEO+IEaTq9g+0EdbfbH
 xdtPtlgZ7i9KmKXBNZRGHnKn3HJB9qLBa/K1OgKsLkos6GHp5qLew9HGDlUhouQns6M4qxBT/d7
 cdUy5LSPRkuW+cBEq54O20NMWj/GwWVs7Vfq5x8lGiYfjX3F51KFq90B91xqliZXDkgphc9wqAC
 GPMM7leEGyjXGuQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

We're trying to enable regulator, not disable it.

Fixes: 78bcac7b2ae1 ("Input: add support for the STMicroelectronics FingerTip touchscreen")
Suggested-by: Petr Hodina <petr.hodina@protonmail.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/input/touchscreen/stmfts.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index 119cd26851cf6..9f5609524fef6 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -120,7 +120,7 @@ static int stmfts_brightness_set(struct led_classdev *led_cdev,
 			err = regulator_enable(sdata->ledvdd);
 			if (err) {
 				dev_warn(&sdata->client->dev,
-					 "failed to disable ledvdd regulator: %d\n",
+					 "failed to enable ledvdd regulator: %d\n",
 					 err);
 				return err;
 			}

-- 
2.51.0



