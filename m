Return-Path: <linux-input+bounces-10739-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A1EA5DACD
	for <lists+linux-input@lfdr.de>; Wed, 12 Mar 2025 11:46:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91A2C17A057
	for <lists+linux-input@lfdr.de>; Wed, 12 Mar 2025 10:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C27724A069;
	Wed, 12 Mar 2025 10:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RgrjMkn9"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8289124A049
	for <linux-input@vger.kernel.org>; Wed, 12 Mar 2025 10:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741776259; cv=none; b=DGMsOJWonDir0ZdPGWJ1L29tZLycF4PeS6ERMv7CA9nkhiP6hKd+94zk1UJdKFcw5l/sUzhW+kAMvQ6L3sU8yTXuleQeQqpvVZ481dxpJks0k65IHG5Xrrv1XPHTH6FalnPkyZEYOEI0ttue4Su+VT3etrXY2rJRIMz7fJkbpmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741776259; c=relaxed/simple;
	bh=kZEgbPTr1PV4HkxJ04HuVryLA+DQhqltwm1xDNvvkdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jmhc6OX1RHLDwJA6JT5r5N2Umz6j3WkuJocrLxMTILEK5kxiyh/aCxtxoslMNHjhnqhRPc7v4HcloD9AbCbjf62YlKi46hqyl8Iqwh8ylJvK7cHTuuAy2onx9UG/kbsAPtQJ0iM2OeEussOHAVZxLv39Z3dJV20rGJ+RnScloUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RgrjMkn9; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ff799d99dcso11214867a91.1
        for <linux-input@vger.kernel.org>; Wed, 12 Mar 2025 03:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741776257; x=1742381057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e67a6xJ2fya7iTHBTm4CMpwBESFmr8ztnJRq0kN0BTU=;
        b=RgrjMkn9UEdQTzLshcOeYSXmC/OhSwUr57mz/GTzeFs2cU6OAMUWJxEPFYR0lWoDnV
         8qJ40qeHkNy6d8ySoWyeRE64p8bZzFrdWjtxhhDiPRG8WJcHuqnUy1H0OBjcES6JJDci
         UUf4wFQWGSnJVP1T5Y7alw+3gO2Gfst0I7jmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741776257; x=1742381057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e67a6xJ2fya7iTHBTm4CMpwBESFmr8ztnJRq0kN0BTU=;
        b=PuukdsScCJN3Aoqox2kq+DGxFp5lz6R9KMDJ1YoMhPczpZK80n+JTFC7FKMSNjkOsv
         Irxe8u0DViCx9DyccvyE385w9in3RM9WOdkKwgfO14pBUgLWO9XF/JPYmpF6W565GpIP
         bgJeqBJppWAd6YFAMuzl5DqTmFm6gtM6wBvVRVKwiJmj4TlCJmxi0S4RGz+sMAIwLyJr
         osAe73BZDotFNDM81kLQg6PimsaW1869ImcVn1dyHfrPyjk5b7OXNwVxN2dX3X9BDIkk
         e854lNdIvbANgSZhyYGQ41eup6ak8iYXsfmGqsMp3TvRnUrSrPtziPhgSuv2KaxWFryv
         9a+g==
X-Forwarded-Encrypted: i=1; AJvYcCUT4GBebpd0wWfwPXgOhs/2nGDt1lDIf30bCLlEtrAfN3smA4L6oPrc48mCXz4wkmTolZMJT0SKcvExQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwejmC3iNJn4v+ZRLrc3DRV1mfv/XA/6POpiUUP5ZRoNBvu1UNB
	lUhB6NUnLwXjx5KvoZRAkzcHIzZyjp6KerFSvcbPoaU9Li50mONw/H7HDylp6Q==
X-Gm-Gg: ASbGncuPbIdylmcDV6Y3EslXapfFTFrWrdIj1Gl45MoFEIAvQfcgv8N8nAPm0qf1aJQ
	BzNiUrtC4uHIxRVXk3YLK/hvMPMl9/maUctgoBGXwUbDELqgIQLViD6N5EQoxofRF5PkdI1jxKw
	ToctIFaP/4ICDlFqAvWtAP77+Rh4g81KusiwU1+TzVkcdv5mY6H3qJkT+JQYpIESPcswJii/V30
	JKGbJaIjDvC3oFb30zGKxQaxl4zBmTF8Ime8xAlmsMGx8ylgM6wiqsyKMc1dtCNlNHe6a+R0iXN
	HEDB30ha7fitBr9jHJsHcACt/3uNTPjHwSPunuA1WkNMo6o2XK+q5Q/+l90AnfE=
X-Google-Smtp-Source: AGHT+IHnJ9RN+rcEBHk26VixrUf4szFNagmQDG8odQqs+oPATVUlo/6Tywg9lfAQyAwSqd1m1Il2tg==
X-Received: by 2002:a17:90b:1a86:b0:2ee:53b3:3f1c with SMTP id 98e67ed59e1d1-2ff7ce59755mr29857671a91.5.1741776256738;
        Wed, 12 Mar 2025 03:44:16 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:b5ed:b71c:fb14:a696])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3011926599csm1405675a91.35.2025.03.12.03.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 03:44:16 -0700 (PDT)
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
Subject: [PATCH 8/8] platform/chrome: of_hw_prober: Support touchscreen probing on Squirtle
Date: Wed, 12 Mar 2025 18:43:42 +0800
Message-ID: <20250312104344.3084425-9-wenst@chromium.org>
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

The MT8186 Squirtle Chromebook is built with one of two possible
touchscreens. Let the prober probe for them.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/platform/chrome/chromeos_of_hw_prober.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/platform/chrome/chromeos_of_hw_prober.c b/drivers/platform/chrome/chromeos_of_hw_prober.c
index eb01851e1cf5..a3ec583f316c 100644
--- a/drivers/platform/chrome/chromeos_of_hw_prober.c
+++ b/drivers/platform/chrome/chromeos_of_hw_prober.c
@@ -59,6 +59,7 @@ static int chromeos_i2c_component_prober(struct device *dev, const void *_data)
 DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB_BY_TYPE(touchscreen);
 DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB_BY_TYPE(trackpad);
 
+DEFINE_CHROMEOS_I2C_PROBE_CFG_SIMPLE_BY_TYPE(touchscreen);
 DEFINE_CHROMEOS_I2C_PROBE_CFG_SIMPLE_BY_TYPE(trackpad);
 
 static const struct chromeos_i2c_probe_data chromeos_i2c_probe_hana_trackpad = {
@@ -76,6 +77,17 @@ static const struct chromeos_i2c_probe_data chromeos_i2c_probe_hana_trackpad = {
 	},
 };
 
+static const struct chromeos_i2c_probe_data chromeos_i2c_probe_squirtle_touchscreen = {
+	.cfg = &chromeos_i2c_probe_simple_touchscreen_cfg,
+	.opts = &(const struct i2c_of_probe_simple_opts) {
+		.res_node_compatible = "elan,ekth6a12nay",
+		.supply_name = "vcc33",
+		.gpio_name = "reset",
+		.post_power_on_delay_ms = 10,
+		.post_gpio_config_delay_ms = 300,
+	},
+};
+
 static const struct hw_prober_entry hw_prober_platforms[] = {
 	{
 		.compatible = "google,hana",
@@ -89,6 +101,10 @@ static const struct hw_prober_entry hw_prober_platforms[] = {
 		.compatible = "google,squirtle",
 		.prober = chromeos_i2c_component_prober,
 		.data = &chromeos_i2c_probe_dumb_trackpad,
+	}, {
+		.compatible = "google,squirtle",
+		.prober = chromeos_i2c_component_prober,
+		.data = &chromeos_i2c_probe_squirtle_touchscreen,
 	}, {
 		.compatible = "google,steelix",
 		.prober = chromeos_i2c_component_prober,
-- 
2.49.0.rc0.332.g42c0ae87b1-goog


