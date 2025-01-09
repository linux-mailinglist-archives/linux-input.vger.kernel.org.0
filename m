Return-Path: <linux-input+bounces-9120-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D36A08249
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 22:38:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37E77164AD0
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 21:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC472204C2C;
	Thu,  9 Jan 2025 21:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b/tvoE6C"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F6B2040B7;
	Thu,  9 Jan 2025 21:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736458702; cv=none; b=Uu2QzGaR2EHh/01Rf9oxYPWawDlfPWQiQg+o/WWMPCxTm8nhjZ/zUQZJnscLXAUz7Rvs90E6N9U6Oj4R0+rv8t7BpHM6AGpTDS8yNWL6FGhOJN3cw75PfjtbCY5ROCOg/HsRInY3kLFViEdgJrL2ZEb8UBHaPKeWf9u8xV+ls34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736458702; c=relaxed/simple;
	bh=NZcUKbvo6X78JweBQNXSLX547iIPcwHhlfbV9w+ONuY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YHPx/2V6J0ox/Oyp5CjFkp7kUfCpKOIFc8t0bmkyynWojkYAOSsNSd4BrKO6jcn/JR83BgEPfwbrw1kS55IU/nzytQ1EueHzzfnMCGtz5FHrI00fbXSH4DEfaXEnmHN6VHVpN2c0lBggc63EBP747IgfdrVrXvBBYhSmAr2tEYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b/tvoE6C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 34539C4CEDF;
	Thu,  9 Jan 2025 21:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736458702;
	bh=NZcUKbvo6X78JweBQNXSLX547iIPcwHhlfbV9w+ONuY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=b/tvoE6CAvu7uzoq46ssH66huxVYva9bHg5Hc+620e//pNwO18/uYisZxi+lmvh4e
	 MULDYXaaVJ0J/ULRFuwTuPrZrxUDXv7o7yfaHGRfQ34FEy7Wa89UIN/E+PlTncyLqF
	 NzR2TaPPpCrkSAkSlYBiF1Z2i4Cezge44f9LUP/a5OxbwqVc3Lq2fInqQH15zGeh5+
	 sXq2+4v1+SDjOwt0ih74e5K1syVSN/ajZeULpb2mhTebRAc8ICAJyO+SDcEueiXupy
	 yIR6AVajkBYGswkr2VYZZNJuI/FFIvpf8PirlHy1f9o3OukVrOTfCVbtObZFq1EFwU
	 nv59U2qLI1giw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23CEDE7719A;
	Thu,  9 Jan 2025 21:38:22 +0000 (UTC)
From: Vasiliy Doylov via B4 Relay <devnull+nekodevelopper.gmail.com@kernel.org>
Date: Fri, 10 Jan 2025 00:37:47 +0300
Subject: [PATCH v3 1/4] input: cyttsp5: improve error handling
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-nekocwd-upstreaming-cyttsp5-v3-1-b33659c8effc@gmail.com>
References: <20250110-nekocwd-upstreaming-cyttsp5-v3-0-b33659c8effc@gmail.com>
In-Reply-To: <20250110-nekocwd-upstreaming-cyttsp5-v3-0-b33659c8effc@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 "Vasiliy Doylov (NekoCWD)" <nekodevelopper@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1450;
 i=nekodevelopper@gmail.com; h=from:subject:message-id;
 bh=9Z6oGtzENjF2jSzhfi6RSWXqg4Z8w0BD0egfwtWSBQA=;
 b=owGbwMvMwCW2fZ/SFZeSpU2Mp9WSGNIbHM88XHJFR22DgUL64aV7lrwXUfHZmbJP2WtprfCzG
 ucpjxf/6yhlYRDjYpAVU2Sx2egxWyw/XHLStKcKMHNYmUCGMHBxCsBEWnYzMnxvzQiQe7ZV9rh+
 RfBeh5CSuW9tLiT//73viaDDdKvY7QWMDF9ubD38/XJF22M117bLGycLCTtF3pnKFGPpHmW43Jn
 5DRcA
X-Developer-Key: i=nekodevelopper@gmail.com; a=openpgp;
 fpr=3CB1489B166F57199296E520B7BE22D44474A582
X-Endpoint-Received: by B4 Relay for nekodevelopper@gmail.com/default with
 auth_id=314
X-Original-From: "Vasiliy Doylov (NekoCWD)" <nekodevelopper@gmail.com>
Reply-To: nekodevelopper@gmail.com

From: "Vasiliy Doylov (NekoCWD)" <nekodevelopper@gmail.com>

Improved error messages: added command name to timeout reports

Co-developed-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Vasiliy Doylov (NekoCWD) <nekodevelopper@gmail.com>
---
 drivers/input/touchscreen/cyttsp5.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/cyttsp5.c b/drivers/input/touchscreen/cyttsp5.c
index eafe5a9b89648475ff7435566eb38c094d66a473..ef74b4f190351b99c0722b38ae5fa491a4087ffe 100644
--- a/drivers/input/touchscreen/cyttsp5.c
+++ b/drivers/input/touchscreen/cyttsp5.c
@@ -559,7 +559,7 @@ static int cyttsp5_hid_output_get_sysinfo(struct cyttsp5 *ts)
 	rc = wait_for_completion_interruptible_timeout(&ts->cmd_done,
 						msecs_to_jiffies(CY_HID_OUTPUT_GET_SYSINFO_TIMEOUT_MS));
 	if (rc <= 0) {
-		dev_err(ts->dev, "HID output cmd execution timed out\n");
+		dev_err(ts->dev, "HID output get sysinfo cmd execution timed out\n");
 		rc = -ETIMEDOUT;
 		return rc;
 	}
@@ -633,7 +633,7 @@ static int cyttsp5_hid_output_bl_launch_app(struct cyttsp5 *ts)
 	rc = wait_for_completion_interruptible_timeout(&ts->cmd_done,
 				msecs_to_jiffies(CY_HID_OUTPUT_TIMEOUT_MS));
 	if (rc <= 0) {
-		dev_err(ts->dev, "HID output cmd execution timed out\n");
+		dev_err(ts->dev, "HID output bl launch app cmd execution timed out\n");
 		rc = -ETIMEDOUT;
 		return rc;
 	}

-- 
2.47.1



