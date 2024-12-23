Return-Path: <linux-input+bounces-8735-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 386639FB0C6
	for <lists+linux-input@lfdr.de>; Mon, 23 Dec 2024 16:38:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E02A188345F
	for <lists+linux-input@lfdr.de>; Mon, 23 Dec 2024 15:38:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD0042561D;
	Mon, 23 Dec 2024 15:38:07 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B24D182BC
	for <linux-input@vger.kernel.org>; Mon, 23 Dec 2024 15:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734968287; cv=none; b=lTzi3rXaxhH7//BfYg6lNRFoE7AnJsian8pxo2Urzo0FVdPyxg2AKdLrgU7CZBuPo1K9IQc/Ma3s9NOBEwEBcAV5W5UuNfkvY13oRTc7NKs7bpoXD5cLIRTMydq2y3WLVNucLL3qRQwe74sb27XrCcHvHnL7wXHjO4vuMfAvCLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734968287; c=relaxed/simple;
	bh=1WimSthChkAwXwVh5HkaoTufIA8BM5E44BMXOxJIG/o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u5JJas/jHSR5x/qF8BrPML3dw9yFsjjZBT0y+HFexyUpGlLcWw8GGcfAKNIZMBpVTvGECAKSbCwLQzUb+BBw2FPP7VKQpP5kvw10Iid2u+dlJA4ekwb1Sg32cnejbkInPt6b3lexYRIS0fZWiB97fLKVNVsbWhMu9WnDYu2+Ho4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=notsyncing.net; spf=pass smtp.mailfrom=notsyncing.net; arc=none smtp.client-ip=212.227.126.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=notsyncing.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=notsyncing.net
Received: from kronii.fritz.box ([88.130.217.11]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MHmuE-1tN3Le3GT8-001cGn; Mon, 23 Dec 2024 16:37:56 +0100
From: Markus Koch <markus@notsyncing.net>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Marek Vasut <marex@denx.de>,
	linux-input@vger.kernel.org,
	Markus Koch <markus@notsyncing.net>
Subject: [PATCH 1/1] input: touchscreen: ads7846: Use managed variant to get pendown GPIO
Date: Mon, 23 Dec 2024 16:34:47 +0100
Message-ID: <20241223153453.12924-3-markus@notsyncing.net>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Dt7E7oyHMkcNsmmlntSx5+fMvDmge3SZmkYMwZ679fYXXsEUOP3
 jSnxxpW/7FyqyInGeXmd/Z4ctAFqMGZ8mBRx98OZlzhRam+oW/AIgkV292pFFhS0Lot/GS2
 0RTqBKNjJ5N0DDIyukAn5gIFPT0HuKZA5iiMTKt0HNnQAIkqVyesMhqoogesSNjNoNlBr5t
 Qz2ikN66FPwDPVxLhN68w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:iPo6ubeu+aI=;BmobqUymYLexJAkUoxX3y93HhQW
 u2hk3qCW7afQPp2lPi3nm1qVyhzXv4UICnPxBnVjHddFeThRCFdmRnSpVSjf4wxv3QY8YZXBI
 AyAs/d5jpZ1nH+uKV/BvSqtIfDFIiYkqwIweo3C9B65QkJPC4TPDAlCdf8cpYjkcfEFJ0W5Sc
 +zMeWFlt4KKC8kP7DPcGcdoky3CqIezC/0glF6SFaKWGjIKijYk6fqB/HNDP5+fKiDcBoiV6q
 y8Eak3XhRKVRGpaOrtvEmZHgPpQfaKwyUvygpUiUZ3hH/e7zVNrEi1mo3apFUl/uLW297QVHe
 RHr5+k+n4iMWvW9GUKeEXa94ChMnE2OXGmoFR0x6fWfYsCzKn3pmjb4ybMJOnCNsMuQtHrpsE
 jKVNszVD5xytc2z6zUk/lYtMV/pEusLxQdW+swTrItWi9nSXIqQxNONCzmVWOnFtJNjrMWA8M
 dab4FzNyliikKxycJ+n1LFj0Ndvho/BlrzdfKwmyE3ACcM9u6xI8LHYS9G2wG7BiaKlcNiafQ
 xqWkUf0RJMf8bp5pC1VUzv2vywM+3hyUuxss5uquHxJSMbGCgpII9dA8jYqqUoRwKhLwn9aZ8
 1vIYgkzPDUXTCK3uvUuCpJoFWmi6mWWr/8PyyDlkTvvYeyZQdKJ9RL26JcRZQGJEGPp4V9yFR
 t4NZUmA33JDv8nEFYaiKc1M6+Jsg4uGRfHYY+U7zCroL1MBbbntl+DnqESaZQ/FbkN+sYeWoN
 jBwtRF2x7kO2TMAF0g9+S21Xvd7UyGDPa8fpOJct3ewtopHQ8FidqKXamxuLwlTPU/fEveCFv
 oGTbFjJrQ2AkTVUHlL5HgoTprRKewm9paFo7p/mrrjD6muBTo9W+ESOwGbP50NNMzc58vc3LZ
 ppfzl7wc1ryzgehFGS5WO5VIs2Djn+yd0UqXDIg9tR/m/0azzmZRwGhmjWvDg09ibpqh94Fzg
 U6JQ0V5D5yn6AHKApC/o+fImgLa0ttHNr75LgYoL6l5IkYVo1xRMpwQBfMs6nZNygH97UQMtB
 UKVrFqYJMLNCb2jTmlq1nBBJOek+kZJM0eAGaOA

Removing and re-probing the driver failed with an error to request the
pendown GPIO because it is never released in the remove function.

This patch replaces the original gpiod_get function call with the
managed devm_gpiod_get variant, which automatically releases the GPIO
when the module is unloaded.

Signed-off-by: Markus Koch <markus@notsyncing.net>
---
Tested on an IMX53-based platform.
---
 drivers/input/touchscreen/ads7846.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/ads7846.c b/drivers/input/touchscreen/ads7846.c
index 607f18af7010..212dafa0bba2 100644
--- a/drivers/input/touchscreen/ads7846.c
+++ b/drivers/input/touchscreen/ads7846.c
@@ -1011,7 +1011,7 @@ static int ads7846_setup_pendown(struct spi_device *spi,
 	if (pdata->get_pendown_state) {
 		ts->get_pendown_state = pdata->get_pendown_state;
 	} else {
-		ts->gpio_pendown = gpiod_get(&spi->dev, "pendown", GPIOD_IN);
+		ts->gpio_pendown = devm_gpiod_get(&spi->dev, "pendown", GPIOD_IN);
 		if (IS_ERR(ts->gpio_pendown)) {
 			dev_err(&spi->dev, "failed to request pendown GPIO\n");
 			return PTR_ERR(ts->gpio_pendown);
-- 
2.47.1


