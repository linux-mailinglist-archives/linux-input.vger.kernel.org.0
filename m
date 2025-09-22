Return-Path: <linux-input+bounces-14994-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 52170B935FB
	for <lists+linux-input@lfdr.de>; Mon, 22 Sep 2025 23:31:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B975170BAB
	for <lists+linux-input@lfdr.de>; Mon, 22 Sep 2025 21:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09D572F546E;
	Mon, 22 Sep 2025 21:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="MTwIUsl7"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F59260575;
	Mon, 22 Sep 2025 21:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758576661; cv=none; b=B0BYkZ+ewpG5wVZirUegN8StZy/26sCOEI9S0EiSgj54hqPfeA4saDmprG7zy+t/ELaeTHqzArstlZLUNVxZinD9I993C80nixKdja8+VmUjS0806qY9xeeDYKD4S04gqWOzflIwZS1oDA2ZTGPJwogVUhNaTAv9lvx66Xx15jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758576661; c=relaxed/simple;
	bh=PNvJrOTdJfeVmDWRL8Cv7MvmoQ3mbxUgxxgcOdoaGtg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m7Fe7uUVc8CxBTggZFv6SbAaVJBlmJNDid0hmEftrrFwWcr3SZ0n13jBoNfwGAPQdnQgwkNQhXrqcJayY2wEvGdn/gNdhRCuKrUfokPYcknXuhYkm+l8s7g5jp5jL/yOzRyZpdMPiTTpl9bUT+uH/3W/smNTpOnxb3lckSgJGdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=MTwIUsl7; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758576658;
	bh=PNvJrOTdJfeVmDWRL8Cv7MvmoQ3mbxUgxxgcOdoaGtg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MTwIUsl7gfPHx9cXRUNKEoiafhsq754HYDFS1oKmPQTHz/+dm18fq+JsS7qAHl4ZU
	 Ytqsqa3cXgCftahNBaUxUOdE2AK3h0dassvmRPPDeH/up4KKxCBcodgtyd82/HfG00
	 kLQnI3WsTl0kC0JWbo6sjheX7bLj1cvr8jao6i1bKR3t14QRSoFZc6RrVGtGtzljAG
	 6McqrYnpzOcNOu9Ud0y0Aku/bJ3wdJHHwgk26JWdQMSOUxlPMpbZK9I2HIbaSv5uxn
	 rdI7stR7z9BEeSkl6XMlwFL7oD7soV3XCJ97jQKRE5B9qYsgYQvKHkX2Wlr7cXZ25d
	 KNyxHj98gPsLA==
Received: from localhost (unknown [82.79.138.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 0D0D917E10B7;
	Mon, 22 Sep 2025 23:30:58 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 23 Sep 2025 00:29:40 +0300
Subject: [PATCH 1/3] HID: playstation: Update SP preamp gain comment line
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-ps5-hid-fixes-v1-1-4b994c54e512@collabora.com>
References: <20250923-ps5-hid-fixes-v1-0-4b994c54e512@collabora.com>
In-Reply-To: <20250923-ps5-hid-fixes-v1-0-4b994c54e512@collabora.com>
To: Roderick Colenbrander <roderick.colenbrander@sony.com>, 
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: kernel@collabora.com, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

Adjusting speaker pre-amp gain to 0x2 indicates +6dB, hence update the
related comment line accordingly.

Suggested-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/hid/hid-playstation.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index d2bee1a314b1b4697378d8472d3f65df5d2cf790..e03ab8a92bca9416787caceb4682be253efe54a2 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -1372,7 +1372,7 @@ static void dualsense_output_worker(struct work_struct *work)
 				 */
 				common->valid_flag0 |= DS_OUTPUT_VALID_FLAG0_SPEAKER_VOLUME_ENABLE;
 				common->speaker_volume = 0x64;
-				/* Set SP preamp gain to ~30% */
+				/* Set SP preamp gain to +6dB */
 				common->valid_flag1 = DS_OUTPUT_VALID_FLAG1_AUDIO_CONTROL2_ENABLE;
 				common->audio_control2 =
 					FIELD_PREP(DS_OUTPUT_AUDIO_FLAGS2_SP_PREAMP_GAIN, 0x2);

-- 
2.51.0


