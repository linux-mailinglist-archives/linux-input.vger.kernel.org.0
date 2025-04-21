Return-Path: <linux-input+bounces-11874-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 39615A94F4D
	for <lists+linux-input@lfdr.de>; Mon, 21 Apr 2025 12:15:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2967A3A90B5
	for <lists+linux-input@lfdr.de>; Mon, 21 Apr 2025 10:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 425662641E9;
	Mon, 21 Apr 2025 10:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Uq0J0tNU"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731AC2641D8
	for <linux-input@vger.kernel.org>; Mon, 21 Apr 2025 10:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745230413; cv=none; b=AimCZlUloNyhIaU7wVIe2zeduOV4XgGtflEKWkTH9OV7sgXQeGWGCuGt85GugmMAuqzYjICcYnJGwY/tFDh91rn7t4++D1oTn1bmgAckscXt8cEDe1sReQMf61zd0A8V/pIQhk82iKnjYQ9z/B7ylWkNLee5UZVQV48xGgpyaX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745230413; c=relaxed/simple;
	bh=Pz2EbCAhTSbi3s1n0uikdRPmeNKPOIEQOu+qX+8XfSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rvLbqMVSaAsOtrX3CrM5Ahi9PPl3Q/RxLF7HgRm7Gw9m+4s8vQhna6zm43FwM0guhQx5+fXXBFROn6dapmsjyOXJb9nitERgZRsMB7ZHYZcsljM2MUQio3cw9gyJrLtBFIhVzlJ+2SdDrOagyOFhjgGRJxwjvTf1Q01m5b3m0Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Uq0J0tNU; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2241053582dso53737165ad.1
        for <linux-input@vger.kernel.org>; Mon, 21 Apr 2025 03:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745230411; x=1745835211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JlRUONHPgdRG0yBjPS5/nMKjk95rCFAaXubE+yQQ9K0=;
        b=Uq0J0tNUMXMRSwnV4897lUxgzT3P0xngZoRg/eWiM6OnZ0DGA0zliAwCai/oDgOAIe
         T6j8+aLgluv1ZTjs5xLZRez6n26sss2fjxgy3zjrIGBZvhFjwODQGlnVWJTSYttyPXeu
         CMTwETZAL9HW4AO7MBzI00Ohf/8Z43r4yqC2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745230411; x=1745835211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JlRUONHPgdRG0yBjPS5/nMKjk95rCFAaXubE+yQQ9K0=;
        b=inPnR7MCF+6t+NmgUTtCT8atgoh8xXEWfsaFUK6MsyJsV9opKHpNpR3jEmOf76OdHH
         epHGnLghvXUy7jNQqvURMBB3v0jgsqRYH/C9O+SRwMoRKRY4uon8+KHybhbhTryfWuX0
         hvvqGGAdqPO1hibXLlOf2YDZpi+pHmTRm2CjJOb5FRkQvlvvOL3DdzmTCl7jtUH8bOj0
         sS9hgDGSRny+b1S9Z6Zo2LBNFVzRFvWOajC8b4wLjurk6L3ArQNqGTzytSjLvCMDKrNl
         ZUztcIxMTV1FjYZksHY/NnBlY2njfqV9E1ARE/m3z6OXotR7a7ikt1pZqKcutZ0MjzhR
         ZMWg==
X-Forwarded-Encrypted: i=1; AJvYcCVqWjvCEQ8sujrAsA694Z4q7mhHvjUnTQSYboDDizG/lGjuNDd4SrPNoiOwWE69SQjpw+l/BDrV8FYo/A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm/4Qqd9wDccH/8lQYS0KuUIn+V/IFRpyf2RuoSg6XQTFaO5Li
	goGiDzqjH9PG9qSnESdaKTWWcpnWTuB39j+mpoG5mfeYVEoY6EFn0R5HKuhKEQ==
X-Gm-Gg: ASbGncvF0KT95WBvpENwYxVtXUCS2kyqmx5HLA5DNyGJuJDlnBgeo4/siLlIUJoP+mR
	HjRqSiN/FiM6Cyz/YPnXogM3VyfJvlp0mk56ZoiRuvlPSJG08KyYSz2voYE/zE2uzhKfmo/+k6n
	tLSHQyF+RDgUpSaJG3Cq4kaFfvogr4MYYoMG0+M/7DZebLQMh2gDR2B/COdKkNlCdhlMbSYSWRE
	c7iuyIBlle1t46Ni6wnu09fp0wg8HO+7ZPx7bjy+fv7owvciRuqnNYu3H87ve3ehYKKPE6KmaGi
	I7nMdM4RMquamzcgMuJDdAsvb6ieevjufZAgc1Us8Fl991CXR1GYyUZKybU=
X-Google-Smtp-Source: AGHT+IGaSj2NjUkLJYtvrXbaniU4ZUkVXBRJQywqY5KHy1I4U9ywfY/tOoiirvNsMeMMe1Zel8Bsug==
X-Received: by 2002:a17:902:ce86:b0:220:c143:90a0 with SMTP id d9443c01a7336-22c535a7254mr159468475ad.24.1745230410702;
        Mon, 21 Apr 2025 03:13:30 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:7633:f42a:d31d:3f9c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22d78db8b04sm38985205ad.238.2025.04.21.03.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 03:13:30 -0700 (PDT)
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
Subject: [PATCH v2 8/8] platform/chrome: of_hw_prober: Support touchscreen probing on Squirtle
Date: Mon, 21 Apr 2025 18:12:46 +0800
Message-ID: <20250421101248.426929-9-wenst@chromium.org>
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

The MT8186 Squirtle Chromebook is built with one of two possible
touchscreens. Let the prober probe for them.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/platform/chrome/chromeos_of_hw_prober.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/platform/chrome/chromeos_of_hw_prober.c b/drivers/platform/chrome/chromeos_of_hw_prober.c
index 10dbaede0541..f3cd612e5584 100644
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
@@ -93,6 +105,10 @@ static const struct hw_prober_entry hw_prober_platforms[] = {
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
2.49.0.805.g082f7c87e0-goog


