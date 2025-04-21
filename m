Return-Path: <linux-input+bounces-11873-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E79EA94F49
	for <lists+linux-input@lfdr.de>; Mon, 21 Apr 2025 12:14:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C73E1892ED3
	for <lists+linux-input@lfdr.de>; Mon, 21 Apr 2025 10:14:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C59242641C0;
	Mon, 21 Apr 2025 10:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GsxUWMiF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D378263F22
	for <linux-input@vger.kernel.org>; Mon, 21 Apr 2025 10:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745230409; cv=none; b=ihdJpdww0OhkBLDVUyotfPrZmVMsLYtWp4Rv66DrS8UT/zQWfBfA9ZKYchHfOwPLWKZIUZUtD9wDVGuzyGXdcKItH5owkL/bLxAbBIKbBVPKCsQkdSrMvAkEjOOD6M7Lh1md/4OUs4CNMcbMKsQzB5EoD2uC3Vg35ftY1vDo2GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745230409; c=relaxed/simple;
	bh=qF7jWnTilMBS2qcmpMwmTaRPTIW0Gr0c/UFCDNrCywY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GWcfEMvYZ7i1aeH6awjFM/sSfVu/n5g9yAzmDb2/HuuegBpjGu/L42MFOfiVvB4FQYW1FErAv1cfg7fS0qlfroqSGaog24weD8xLw2daF2JzejZmNgmWYc9wg4GnXDToXq97jTcr3vh3tyFy5S6CzTp0pTQ8jBwiPEq7VKFUbTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GsxUWMiF; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-227a8cdd241so44163895ad.3
        for <linux-input@vger.kernel.org>; Mon, 21 Apr 2025 03:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745230407; x=1745835207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RcjHyP3cBWKaEk01AYLfxR/iTiJMn9iHLwLqY1LLLpk=;
        b=GsxUWMiFK0oWYAKsRY0F5+gFDuXQv06/pFo9Cdam+ZNfTR2Cq6J2m+YtHsFvqVBJtP
         QBA5FCVFI7PaXPzbST3fzJ1n5s3mbscuTQsYkhurNXrS6AAfij6h5H2uZSO6gygWcAR+
         brHiEX5yebvHgBhNlHtnMs3BAo0aYQoLycePU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745230407; x=1745835207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RcjHyP3cBWKaEk01AYLfxR/iTiJMn9iHLwLqY1LLLpk=;
        b=HccDOx6Hd4k8gXqywmFpm4GrpnkD0tXESks+wMX+DbyMBLdtb/EjALlo3HwOnfZJDT
         exF5TFS69bN7lFOozyl+q1rKUbPrXa7ec7wKt9jrRRQPEDIiNQum4v3YVRhmtBEgqzCo
         0ucPC6p6+6FbMHgYF5+TjP/JJj0HusjEc4/wkc1usMEWgrSLvg1s8//8TkJqH/BZt8NU
         m9OTP64PHo3DPc+hEgFTKlsPboGctmlPyjo+SKpoEWKVoxCajRif8vbGLpubDnlInsk6
         WO9KUisvNr1wrBgsf/7vc6HOMD9/4wDzJVlQfb3IgF9iSdxLQ5qnlnb4UP/mlQ2CdUKR
         pgKw==
X-Forwarded-Encrypted: i=1; AJvYcCULBProBDIL/F9GqsNV1x1Oe4+khrbyYkLFGn0hFk7ln+VeEoJGmzNvdryT10xuFxwdeaf6qPpeZyQ8/g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7a7wg3490poSeMNAtEq2u3vEdKStn/Y5KxdiXjee9x6vd/M3l
	Rs7Cu61CuGMZhyxBpT20NBcc0C/jfYijCeSqm1uLaqo5EZOoc2+LNEywvyJVdg==
X-Gm-Gg: ASbGncsPIau7/Qv93jSnzU57wpAeHzCwKNgQu6w2j0nMt5YXTb/dDjyWJNr6qpWc/Ke
	cIF7hDNUlwkqjYFMnyTM1uZ6rQMvpUxHmsshHWiOu4QSMW/ZmZ+WUGYPU/BsP25qaPi7kHfmCo7
	oNmRA1SXOKJYba2eCaTE9eg5fQHFR2g7iPeA2lGyV9QmvcjEEDBkMbueAmZzElhR07Jv8o1Ug4+
	0mSYz0T19421xL6NiOaolU7dLz+ewVFVySBdyugDOGilLVzhkpZnO0PXxM8JRnFT9NOf2tyLfZX
	2MpM1MhaVIBIv2oB8yZjD5XPOUL51D5g5e9xG7XhdEQMAfdUFsZR5DEgR7FbBGNMiRBHpw==
X-Google-Smtp-Source: AGHT+IHuFSunYBioxk4Fk/97b/EXhuCRKPWNocxu/A5uMoJPd3zI4mtSEWbcD0F9jrilaVzVx5rPjA==
X-Received: by 2002:a17:903:41c7:b0:220:faa2:c911 with SMTP id d9443c01a7336-22c535a4b39mr151608295ad.14.1745230407602;
        Mon, 21 Apr 2025 03:13:27 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:7633:f42a:d31d:3f9c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22d78db8b04sm38985205ad.238.2025.04.21.03.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 03:13:26 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 7/8] platform/chrome: of_hw_prober: Support trackpad probing on Corsola family
Date: Mon, 21 Apr 2025 18:12:45 +0800
Message-ID: <20250421101248.426929-8-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250421101248.426929-1-wenst@chromium.org>
References: <20250421101248.426929-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Various MT8186 Corsola Chromebooks (squirtle, steelix and voltorb
families) have second source trackpads that need to be probed.
The power supply for these are always on and their reset/enable
lines are not exposed.

Add them to the probing list.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Rebased and resolved conflicts with "spherion" trackpad prober
---
 drivers/platform/chrome/chromeos_of_hw_prober.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/platform/chrome/chromeos_of_hw_prober.c b/drivers/platform/chrome/chromeos_of_hw_prober.c
index 019578bc7ad0..10dbaede0541 100644
--- a/drivers/platform/chrome/chromeos_of_hw_prober.c
+++ b/drivers/platform/chrome/chromeos_of_hw_prober.c
@@ -57,6 +57,7 @@ static int chromeos_i2c_component_prober(struct device *dev, const void *_data)
 	}
 
 DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB_BY_TYPE(touchscreen);
+DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB_BY_TYPE(trackpad);
 
 DEFINE_CHROMEOS_I2C_PROBE_CFG_SIMPLE_BY_TYPE(trackpad);
 
@@ -88,6 +89,18 @@ static const struct hw_prober_entry hw_prober_platforms[] = {
 		.compatible = "google,spherion",
 		.prober = chromeos_i2c_component_prober,
 		.data = &chromeos_i2c_probe_hana_trackpad,
+	}, {
+		.compatible = "google,squirtle",
+		.prober = chromeos_i2c_component_prober,
+		.data = &chromeos_i2c_probe_dumb_trackpad,
+	}, {
+		.compatible = "google,steelix",
+		.prober = chromeos_i2c_component_prober,
+		.data = &chromeos_i2c_probe_dumb_trackpad,
+	}, {
+		.compatible = "google,voltorb",
+		.prober = chromeos_i2c_component_prober,
+		.data = &chromeos_i2c_probe_dumb_trackpad,
 	},
 };
 
-- 
2.49.0.805.g082f7c87e0-goog


