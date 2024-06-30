Return-Path: <linux-input+bounces-4733-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC5291D331
	for <lists+linux-input@lfdr.de>; Sun, 30 Jun 2024 20:37:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42A811C2087D
	for <lists+linux-input@lfdr.de>; Sun, 30 Jun 2024 18:37:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E87E2156F2D;
	Sun, 30 Jun 2024 18:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="nINYV3i8"
X-Original-To: linux-input@vger.kernel.org
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F33515574C
	for <linux-input@vger.kernel.org>; Sun, 30 Jun 2024 18:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719772611; cv=none; b=jPmB6oBo6yrnfV0mYCcdPjCY62gY8SKGkr28kInXSEnJ6lcJhyWxLt9XyWA8u441fFD/qI2kRO4Ds35YfscsVifCQnphhWz8Gsndv+Do2/GCVMhDrubNP8HPd2H0d0DA/Gj/3rfmYUkU6AbWr2RN4EBpwUR3LPOA93+8f1+e76s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719772611; c=relaxed/simple;
	bh=df5+d5FCM3DW4hk4Jk8xZ/YvNGiW/iW7120sQtEXdyI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LFsbYuVbqcHmbOT2cSv0a6P5jedMqMVxLS8doc3fohPya6dlk16t2L2ZGVidwLBqh2nkWrnaP588dQWnnzkh9H28Dz86goUr7EUnoVnhe+mAITJRIcoVCb4ZcT03npUwWVHc9fGQjIW6MWLIzgfpRlnrJKbqqH2cFBSFtx0et/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=nINYV3i8; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Envelope-To: robh@kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1719772608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8wDexlyPxHpS/cBCtsKrcB8JC5jDMbHDPqOjd7EkOqE=;
	b=nINYV3i8H2dpGbNc7kcfTfY6/1348jadM/8SVylfLbJuNqkDritBHfi5Uea3AoPV4Dg2db
	vZ7JC34pEQ4GHJg5IsxgyCk1QZ218wErIxNbgIMBo+db08y2SaonByBlaxxcxFIzmNDSmB
	JThTVBVFbSdMeZuZVO1RlX4bkiC2ciHgnxoUQvbh2UScLZYgqD/XA6tp0QBu75cdDqEXBx
	ezpVXw4WmrbvSk4uaeSrQBGbwWNcqNt+0sR5C8RWo82HJWQ24zCf3wYfVKsPo6HmB0Rhg7
	iU8+dPZKwx+1NQ5Zc9AgzAhhjUmDWkYLsnuiT6apf5fKlULMjj9TZ/6yXXM4xw==
X-Envelope-To: conor+dt@kernel.org
X-Envelope-To: neil.armstrong@linaro.org
X-Envelope-To: daniel@ffwll.ch
X-Envelope-To: ~postmarketos/upstreaming@lists.sr.ht
X-Envelope-To: dmitry.torokhov@gmail.com
X-Envelope-To: linux-input@vger.kernel.org
X-Envelope-To: mripard@kernel.org
X-Envelope-To: caleb@postmarketos.org
X-Envelope-To: linux-arm-msm@vger.kernel.org
X-Envelope-To: krzk+dt@kernel.org
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: rydberg@bitmath.org
X-Envelope-To: konrad.dybcio@linaro.org
X-Envelope-To: maarten.lankhorst@linux.intel.com
X-Envelope-To: devicetree@vger.kernel.org
X-Envelope-To: dmitry.baryshkov@linaro.org
X-Envelope-To: tzimmermann@suse.de
X-Envelope-To: airlied@gmail.com
X-Envelope-To: quic_jesszhan@quicinc.com
X-Envelope-To: andersson@kernel.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Caleb Connolly <caleb@postmarketos.org>
Date: Sun, 30 Jun 2024 20:36:28 +0200
Subject: [PATCH v2 5/8] drm/mipi-dsi: add set column/page multi helpers
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240630-oneplus8-v2-5-c4a1f8da74f1@postmarketos.org>
References: <20240630-oneplus8-v2-0-c4a1f8da74f1@postmarketos.org>
In-Reply-To: <20240630-oneplus8-v2-0-c4a1f8da74f1@postmarketos.org>
To: Caleb Connolly <caleb@postmarketos.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Henrik Rydberg <rydberg@bitmath.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht
X-Developer-Signature: v=1; a=openpgp-sha256; l=1575;
 i=caleb@postmarketos.org; h=from:subject:message-id;
 bh=df5+d5FCM3DW4hk4Jk8xZ/YvNGiW/iW7120sQtEXdyI=;
 b=owEBbQKS/ZANAwAIAQWDMSsZX2S2AcsmYgBmgaWz7qufP83llhsqr5WIsFyU1H7wl4p1EoV2k
 ESlriQwULiJAjMEAAEIAB0WIQS2UaFGPGq+0GkMVc0FgzErGV9ktgUCZoGlswAKCRAFgzErGV9k
 tqt8EACX2N3Mhg42qfsNPmD/eRDSN51CXvk/jqV2KKFX6/9HvLUGYVgOvPbDgSQ1uJlFXPoejRq
 vPPLpJouR1ZigzgFTgf0PsI2hGrQcNkj0zuWJGVFvbLtEt+z9znSyFYl1RkdZM1Wa3+qkLVkv7j
 FEhE0UcdZSQvduwRnDFtVSUpCKNF0nDN/7Xiy1QVnGL5DDL5e7XT6K112xBX7g+VewIeSnW03TB
 jCTrkUPtqphSrYxrQ4rw4FVqB7YF5xpKWieU3g6yKnouMvjGZuz7mpjyk5j+zrnUIYlCBx46FVh
 U8BXtWBv85ZKEMH5nbVUgAcyGic7wENGyX8BD9QhU+1vYGDK23LsfNJ8S6mV8e3PK4yrpi896PF
 reL+QIxop4VIMPgAwCj9QsYCfUo1xF28H8pRm6VMCWaznDXC0caJQbEYzRAyRjIxjyaC1UP9bb+
 5j9r9MO+kt2plMLcN99ugd9ZdeBpXsljBAPB7Y1yzZqLbivOPGCIOPWyptnJ8wBWKcUiWV0fIC2
 LrbJ7zQwxuhYdYDCveE92l32uJwDlqBzZYNpSzDmc7AMU7ZJ9PCoLqplfK8R6z+7vhtg37tGWdL
 5uhCiPFzVoMqTV+Z1S7482iIdoSIliyaeFhPOY2ig3xJRMokvHlmmtK3/2MmvqZpF8phMMu8q2x
 ri2ndtI4GF+QP3g==
X-Developer-Key: i=caleb@postmarketos.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
X-Migadu-Flow: FLOW_OUT

Introduce mipi_dsi_dcs_set_column_address_multi() and
mipi_dsi_dcs_set_page_address_multi() helpers.

Signed-off-by: Caleb Connolly <caleb@postmarketos.org>
---
 include/drm/drm_mipi_dsi.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index fb23f4e3b94e..f390bd261be7 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -434,8 +434,24 @@ void mipi_dsi_dcs_set_tear_on_multi(struct mipi_dsi_multi_context *ctx,
 		static const u8 d[] = { cmd, seq };                     \
 		mipi_dsi_dcs_write_buffer_multi(ctx, d, ARRAY_SIZE(d)); \
 	} while (0)
 
+#define mipi_dsi_dcs_set_column_address_multi(ctx, start, end)          \
+	do {                                                            \
+		static const u8 d[] = { MIPI_DCS_SET_COLUMN_ADDRESS,    \
+					(start) >> 8, (start) & 0xff,   \
+					(end) >> 8, (end) & 0xff };     \
+		mipi_dsi_dcs_write_buffer_multi(ctx, d, ARRAY_SIZE(d)); \
+	} while (0)
+
+#define mipi_dsi_dcs_set_page_address_multi(ctx, start, end)            \
+	do {                                                            \
+		static const u8 d[] = { MIPI_DCS_SET_PAGE_ADDRESS,      \
+					(start) >> 8, (start) & 0xff,   \
+					(end) >> 8, (end) & 0xff };     \
+		mipi_dsi_dcs_write_buffer_multi(ctx, d, ARRAY_SIZE(d)); \
+	} while (0)
+
 /**
  * mipi_dsi_dcs_write_long_multi - transmit a DCS long command with payload
  * @ctx: Context for multiple DSI transactions
  * @cmd: Commands

-- 
2.45.0


