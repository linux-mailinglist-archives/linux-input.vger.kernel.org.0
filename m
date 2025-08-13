Return-Path: <linux-input+bounces-13978-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D99BB24F72
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 18:22:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 375E63AD1FB
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 16:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 669A128980F;
	Wed, 13 Aug 2025 16:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="WQVtUdGx"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C42288CB1
	for <linux-input@vger.kernel.org>; Wed, 13 Aug 2025 16:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755101787; cv=none; b=TAXyn7txxgathl/R1KpJtrSsrBFB+lPMtwBjX9LifWDiqryVQrb3DVec/HCwQt5s9znmUCI9qXA1ufxHuy5wvbGgq/jiajJxP3yulXgtY8vbsxyyy5DH2xEasTC/rYVyn3/3rrwbeg+Y1sbGM0N2uwP//+yPKG5gzF2GWRqwGX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755101787; c=relaxed/simple;
	bh=OpFNPy/949OuVqU44Jddzy5tJlLPxR5bhWcL7QVUaW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dvoxfbrxeQ18bKsdJNqdnQ5Mj9pN7fYqmgbDtw4FmP0WtX3wZ6SUNYnRyg41gCWvJQzoJqd/u1mQCkZJLas9fEPTTHE2K6wEyXUK40ApNRbuhQOs9ESlUj9qKS1O4DmmphA8d0B9Y+WetCjOjp4jtX1o/AxUt9X6eIdFwdbG1lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=WQVtUdGx; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=pYjTRnaAL734uawtRz8rlkHtipNlC8V1eUrqVt8032Q=; b=WQVtUd
	Gx1tsYEcBl7STSCHoQpxHTAnS+wujtevjz8pWK5JqONna7QgJmZu4i5FZcJNz3ET
	+VL4XRV16QVokeImdllrOmYh79tKvXFmp9G0a6qElUM1RCPL6libLcr5t7+pVcqS
	b8WkYq35GH3hm980j14G+XjEn3gC8Khic8mOOykPHmS8eBFpSx8DYlsIs1wGDSHF
	Y8qHjsDS2Qu89yiTlIMckZ3JPtYMLGxys05f3+4OdR4jNJRkn4jEHS7VRkuuNcou
	G5wESZSlsM8Nw61MpcISdRls3/UMp6Ul1xUuaNlRjXC5hV7IA5ArObGqULkLmlIV
	M14Lcjpn810aDfog==
Received: (qmail 694780 invoked from network); 13 Aug 2025 18:16:08 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Aug 2025 18:16:08 +0200
X-UD-Smtp-Session: l3s3148p1@305neUE8PJVtKLKq
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-input@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 06/21] Input: remove unneeded 'fast_io' parameter in regmap_config
Date: Wed, 13 Aug 2025 18:14:52 +0200
Message-ID: <20250813161517.4746-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When using MMIO with regmap, fast_io is implied. No need to set it
again.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
No dependencies, can be applied directly to the subsystem tree. Buildbot is
happy, too.

 drivers/input/touchscreen/fsl-imx25-tcq.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/input/touchscreen/fsl-imx25-tcq.c b/drivers/input/touchscreen/fsl-imx25-tcq.c
index a32708652d10..ff270b3b8572 100644
--- a/drivers/input/touchscreen/fsl-imx25-tcq.c
+++ b/drivers/input/touchscreen/fsl-imx25-tcq.c
@@ -39,7 +39,6 @@ struct mx25_tcq_priv {
 };
 
 static const struct regmap_config mx25_tcq_regconfig = {
-	.fast_io = true,
 	.max_register = 0x5c,
 	.reg_bits = 32,
 	.val_bits = 32,
-- 
2.47.2


