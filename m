Return-Path: <linux-input+bounces-10738-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C67A5DACC
	for <lists+linux-input@lfdr.de>; Wed, 12 Mar 2025 11:46:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCD1518866CC
	for <lists+linux-input@lfdr.de>; Wed, 12 Mar 2025 10:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABEB42417D9;
	Wed, 12 Mar 2025 10:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lAwCkucf"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CEB2459E5
	for <linux-input@vger.kernel.org>; Wed, 12 Mar 2025 10:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741776256; cv=none; b=eSnMDEzbQpucqutavmQudCgiPQUxq2Crg1Hx5DDYMfsvfi9rV2MoDK9td8RR5VCNdJ7W0QjRuPdR2rPisO3vQRhsf4HgDQJ3k7dQDoSQk68vLOVsbHegdiTeojiOaPXr7Za984qZ7iNlFQ3X3DyTXSmIdqSzInRPPRelSmq9zjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741776256; c=relaxed/simple;
	bh=9hXJ05Bllblc/HNvRr6L30WMFsTUsEOeU51KuFxzBIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GtPyU3DxiA/D6FYFu1Y9m/G45cn2iGDFv7DtGIeQU/1bUy0BUjqhnXMMod32wR5aBbYwDJb/NoJYF09BgFMnO+kc7jfBYiQ7Ngbyzps3Leid0PVFlzfCbIuy46HCLhY0gxLD/pcgzlQsEyvUHAWQt+e++YI8ieLYxBR0YvR5Jcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lAwCkucf; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ff80290e44so11127907a91.0
        for <linux-input@vger.kernel.org>; Wed, 12 Mar 2025 03:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741776254; x=1742381054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=07NeGidiEoFI0vJcWncCuXXVE170Ua3zDu2V1ci+TTk=;
        b=lAwCkucfkAByoO8irfgFun7M00BMvmyymxIxyCUi9NyJCAJNin16elYQyOCm/G5Gw1
         Wj0+XT4ablczSmfsm4lO9yGxf0CQoGt0G9YldIUBCkqa1M3A029sepUS4ahkQwaE/bWV
         YRaslabLellu8hCSz4gYQQouD8/2ksfinqaec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741776254; x=1742381054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=07NeGidiEoFI0vJcWncCuXXVE170Ua3zDu2V1ci+TTk=;
        b=e8oQmqFNxWZIFU724T1Dkb7U8Ht4ea51RfCDDLHuRG6gVzz/tVbceIjzkJ5LmtdOSv
         +TjqcTmbeQEmSzJ4ZqNhlldwGXsS4wcnzKE2RH3fOVHpe1zd/SjsCdi3hLZES4//bnsn
         +LghxLpUbi4ecHjSy4kID1h+z+fAmHTVQxiaUjbQFmM/VymgnLCu3KW2BKuKKh1pH62r
         nzjBERjwd1MgeJpnzxkhiXpK8uIneuoCLZsnrrza82zNjXS9yTbdxgPVoUxwRsFNbax6
         mCDqsDtPTu/Re+YkKTnioW+UNKaepkzs2oVHzXQNjXMN22GQUo13Mu6kJY7Sr5fBGm9f
         Sp5w==
X-Forwarded-Encrypted: i=1; AJvYcCXWDoY74p8iMYAFL5OJKZlL0L7TDaCP+yzVCQjXttwAgkkWQc9e52dhhpmkQonO+VegjGMW/ARn8xWLrw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMcDt94mZzccXgygUbSfdx2rRPBRmOmD+yIjwrAPfJnSS1FcAG
	3wNv0e5cM0nkTB4PAL7Y4RYeRkjfHyAF8zRqqKiDyn4Kr0GpXJ0CVAKjqAi6og==
X-Gm-Gg: ASbGncv+HXzabX3wlUND5ndC1arbXLQm5gaIndTrBA5j8HXhwDEqfC2fM3LrJ/xQbwc
	wSGqlvQ+DDM6QQHkVJ9YHIZAvMveljJYadgG79SIjLOc9QQ9RkPJPgfefm1K+cJvUP+tEp7R5XA
	gb6Q3k++n52Sdj1FiW8Sdgx8WOwlVItEV/fZhXgOiBc4+acDQ5AymINmOZNpf2LF4tL6OYCkb5S
	1qjwj2R4OebpttkBz+FUrV2skk/NTXmKapHRXR7VD90VL89eZHhXj/rqfK7dRZ5qtyK+BF84jgQ
	vOyop+Qk/9j/rk9v3VIzpvjZ9xklC/h/bBVkJUEw4qkehd+9SprS5ck8ak9/7RQ=
X-Google-Smtp-Source: AGHT+IFSE2gHTCSWYPmLv3kDZjxj214O8BELRgRt+BaoekLoQKZE6r3o5wS+pqNMYHoEB24uQ1fVVw==
X-Received: by 2002:a17:90b:388a:b0:2ea:bf1c:1e3a with SMTP id 98e67ed59e1d1-2ff7ce94cccmr37763724a91.12.1741776253695;
        Wed, 12 Mar 2025 03:44:13 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:b5ed:b71c:fb14:a696])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3011926599csm1405675a91.35.2025.03.12.03.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 03:44:13 -0700 (PDT)
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
Subject: [PATCH 7/8] platform/chrome: of_hw_prober: Support trackpad probing on Corsola family
Date: Wed, 12 Mar 2025 18:43:41 +0800
Message-ID: <20250312104344.3084425-8-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
In-Reply-To: <20250312104344.3084425-1-wenst@chromium.org>
References: <20250312104344.3084425-1-wenst@chromium.org>
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
 drivers/platform/chrome/chromeos_of_hw_prober.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/platform/chrome/chromeos_of_hw_prober.c b/drivers/platform/chrome/chromeos_of_hw_prober.c
index c6992f5cdc76..eb01851e1cf5 100644
--- a/drivers/platform/chrome/chromeos_of_hw_prober.c
+++ b/drivers/platform/chrome/chromeos_of_hw_prober.c
@@ -57,6 +57,7 @@ static int chromeos_i2c_component_prober(struct device *dev, const void *_data)
 	}
 
 DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB_BY_TYPE(touchscreen);
+DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB_BY_TYPE(trackpad);
 
 DEFINE_CHROMEOS_I2C_PROBE_CFG_SIMPLE_BY_TYPE(trackpad);
 
@@ -84,6 +85,18 @@ static const struct hw_prober_entry hw_prober_platforms[] = {
 		.compatible = "google,hana",
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
2.49.0.rc0.332.g42c0ae87b1-goog


