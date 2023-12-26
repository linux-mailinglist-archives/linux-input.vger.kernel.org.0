Return-Path: <linux-input+bounces-1014-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AC88E81E49B
	for <lists+linux-input@lfdr.de>; Tue, 26 Dec 2023 03:38:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D11DD1C21B9F
	for <lists+linux-input@lfdr.de>; Tue, 26 Dec 2023 02:38:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 740064C60;
	Tue, 26 Dec 2023 02:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="vvGU7WOM"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA93E1860
	for <linux-input@vger.kernel.org>; Tue, 26 Dec 2023 02:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3bb82a52002so3753132b6e.2
        for <linux-input@vger.kernel.org>; Mon, 25 Dec 2023 18:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1703558276; x=1704163076; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rJRavJQd/R4FAxoUrS2zZEwoVbqLgFXWyrD1r6G8+C0=;
        b=vvGU7WOMNazfcy7UVP9yR3JZLXZmmriIAaz8wvoVDm1QM/RdZFgMKlgTEIGElAWn1k
         XrIXhwHAiuW2QPmSZRhVxdfc8dLI79luRI6t3jOXZbh0zLyrofz/XQ624tkpr8t/AlzW
         8fB9s6cTPJ60TokO2BrIOyJBJa5d7N+TQAxoO9JPSH4j6wUz8A8dlSK3tkWdh9fEBA9D
         BcpRWuq9/Od6TawMwK0M5seWKD6oXPicDzUTtUbZvTbNPfBl1BddEe23dyREfUmHQs2M
         vDxZaWDBDEQtFZAoo9z6ab//SFOU2WT+/GWl/n1rAQCWMSWvyMYt/zm+RsCzD0W4wnE3
         O8Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703558276; x=1704163076;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rJRavJQd/R4FAxoUrS2zZEwoVbqLgFXWyrD1r6G8+C0=;
        b=q36xFSOKoDEwVp7ZrTQXK9BhSj8/kgijEFgVlcc1bGdLrTdHiGDjME4kDHhPT2SXFx
         6qSmUbrPKRXRpmFN+BfiSk20MQsPNeyNOI6RK1QjrN0oJ/H5iW7rVJb8cVLmeySgGOTr
         amCZSBezGO29e2VnFkGbFyqFRv1yWTtwfai0e+UHxl9qBWt0qs6/B5PgvheMhcB4VMdP
         8V23uFQutQ0IGFkvw2jefL5KoCDfRsHE6689zbHXDUrN5/s+1SqkFaEdkYLwrSs0aC5S
         TOvcXzbN5z8SfWht78140FEBZ7amuXPrMq2OZl3FpUDwaUuTL0K4+z3Z+R+MCBgNRfvC
         AmjQ==
X-Gm-Message-State: AOJu0YxSEbPHAuStZn+tG+eKqqWLzoU+H4FfwjW3zEyC6q2XieUYa+Tk
	tZzERBjGJji/TncrIKB5xW1AkhE9OOeBV6Xo989NvBtSagk=
X-Google-Smtp-Source: AGHT+IGm2pxlhyYkOod9Tx6M+PMbYfnwMyTrGfF0FZg26RcstOF4WMJmZ1P2dwPM1ijwFyU5sTj8dw==
X-Received: by 2002:a05:6808:d4b:b0:3b8:b063:adf5 with SMTP id w11-20020a0568080d4b00b003b8b063adf5mr9148436oik.82.1703558275695;
        Mon, 25 Dec 2023 18:37:55 -0800 (PST)
Received: from ubuntu.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id b11-20020a17090a8c8b00b0028c2de909e4sm5083190pjo.50.2023.12.25.18.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Dec 2023 18:37:55 -0800 (PST)
From: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
To: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: dmitry.torokhov@gmail.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com,
	dianders@chromium.org,
	xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [v2 2/2] HID: i2c-hid: elan: Add ili2901 timing
Date: Tue, 26 Dec 2023 10:37:37 +0800
Message-Id: <20231226023737.25618-3-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231226023737.25618-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: <20231226023737.25618-1-xiazhengqiao@huaqin.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

ILI2901 requires reset to pull down time greater than 10ms,
so the configuration post_power_delay_ms is 10, and the chipset
initial time is required to be greater than 100ms,
so the post_gpio_reset_on_delay_ms is set to 100.

Signed-off-by: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
---
 drivers/hid/i2c-hid/i2c-hid-of-elan.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hid/i2c-hid/i2c-hid-of-elan.c b/drivers/hid/i2c-hid/i2c-hid-of-elan.c
index 31abab57ad44..5b91fb106cfc 100644
--- a/drivers/hid/i2c-hid/i2c-hid-of-elan.c
+++ b/drivers/hid/i2c-hid/i2c-hid-of-elan.c
@@ -130,9 +130,17 @@ static const struct elan_i2c_hid_chip_data ilitek_ili9882t_chip_data = {
 	.main_supply_name = NULL,
 };
 
+static const struct elan_i2c_hid_chip_data ilitek_ili2901_chip_data = {
+	.post_power_delay_ms = 10,
+	.post_gpio_reset_on_delay_ms = 100,
+	.hid_descriptor_address = 0x0001,
+	.main_supply_name = "vcc33",
+};
+
 static const struct of_device_id elan_i2c_hid_of_match[] = {
 	{ .compatible = "elan,ekth6915", .data = &elan_ekth6915_chip_data },
 	{ .compatible = "ilitek,ili9882t", .data = &ilitek_ili9882t_chip_data },
+	{ .compatible = "ilitek,ili2901", .data = &ilitek_ili2901_chip_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, elan_i2c_hid_of_match);
-- 
2.17.1


