Return-Path: <linux-input+bounces-16148-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D2454C6355C
	for <lists+linux-input@lfdr.de>; Mon, 17 Nov 2025 10:49:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 817AB365299
	for <lists+linux-input@lfdr.de>; Mon, 17 Nov 2025 09:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8ED332B9A5;
	Mon, 17 Nov 2025 09:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pegatron-corp-partner-google-com.20230601.gappssmtp.com header.i=@pegatron-corp-partner-google-com.20230601.gappssmtp.com header.b="rGtcHabN"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D42D32ABC6
	for <linux-input@vger.kernel.org>; Mon, 17 Nov 2025 09:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763372455; cv=none; b=fA4FehWovc9me/hovGSlMKYLQNUGeHjJ4XX51Bs+ioUslJzibAmCQFreQA+Ie0WGE23UQvLIotJUyQODLL1xxp5ZeH9UcVl/+s4gB2/O0NKEH/QQl26BL620bUYdMIzUIcOQxjC+Z3a94mEewF/EF6uo9KpZb+VURrOX3UPDO4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763372455; c=relaxed/simple;
	bh=ZuYwHCz+EW0VknvPkB88hPLY2cBfqeTDtgHC1K8W4JY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Cto109cZC7sILQhsQ35TW7XcKtkDhF6Yu0IAXH18AAsaVHBiFQzgqtFiE/SHbB1mMhanr4yGdP09JLncQLAkrXuKpwc3V48e1edFuqF43lQM5qfmVgV0R4iWSzSj6xM2AsQ42nFDGU2U7sLjaBRgj4rCHHavoK5RRnXdcfnuO/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=pegatron.corp-partner.google.com; spf=pass smtp.mailfrom=pegatron.corp-partner.google.com; dkim=pass (2048-bit key) header.d=pegatron-corp-partner-google-com.20230601.gappssmtp.com header.i=@pegatron-corp-partner-google-com.20230601.gappssmtp.com header.b=rGtcHabN; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=pegatron.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pegatron.corp-partner.google.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7bab7c997eeso2671552b3a.0
        for <linux-input@vger.kernel.org>; Mon, 17 Nov 2025 01:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pegatron-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1763372453; x=1763977253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ewjXRzkDDY0bjfheSi5ycu05L+1b9aEmt6+FZZBV3Q4=;
        b=rGtcHabNB4vzFYnFuF/a7tHcv46xmc+v0f6yWOmg6XXPgl0jf3u3dRdvUD2N0O2d4J
         drlAp2w3Z0+e9sV7gF12lBH8SkZPbBxwVPz1chS8nvfPmVDYIVQ+Mw5oHyh5eCWlkK1M
         kH0XT2Aqm64AQMF+xriX5s4WcYpo/adV9Av1f20HxD3Yxxpc7KO+c44n6BXMyd9vXxQy
         Tkix/0YR2hkoX05v+Orcox1rODu21x1782xpFbLHJIx9tdU34GppwIiDFHV7iwGKEpPV
         FOIAhlEveAQFL5B/HpsHSCyOCjRh3EeEKtM/Y+GAdVFxHEibNluS8Da9DSHbdYmmiAgB
         LJlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763372453; x=1763977253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ewjXRzkDDY0bjfheSi5ycu05L+1b9aEmt6+FZZBV3Q4=;
        b=aFZFmy8NQ+D4XVbMS6pywdFlIXvyt06Oxe0KMZsVCx1okCTt/ambhqkvuYWb+HuKSl
         mZ47GXDm84AzPjC3XTZxl08bZBBrcWw5Zgx9WHtlPBWwVjnoguzLIbTPCuzs1qyI+SPr
         Tadv0ZbYPygw6vKObNWni4avJDjQPgKW2MrqSifzO35HP1Ds/GGna9sciDM3hSrJvZPE
         gOBefV2fD7N6qr0seuUTiyalWfNg1mfXgY+WcUaCnEvms755pjnTUiXuOBHJ6VPmo/XP
         husrP7Wx7gIqggdFidlrL9GU1vzV+YD0yy4qR2AKNcdmDqkpuc+D5xVn+IPVoo5761yV
         akNw==
X-Forwarded-Encrypted: i=1; AJvYcCUDFWAIslQS0XZ5zSBOWiSME6ieRVzNrk9Fe8/uQ3IlAB5xeQUbt9OgjcUTe0RoB8/gVoNJ0K2+dGOgZw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+kdmLa1yHn/EUJyU6mLhIUac05B/O490Djl6meMpKHTZgR/zI
	osekZ7wU4h/tmlcxGMxQrHJBztpyIy7zR3lNyF9F4Qm7JzzPtgR4HLfl4EQJXGVUjA==
X-Gm-Gg: ASbGnctLR5OLQ6CR3wpsvxQF+eW1IPX1ZetZVLeZxJCBfka0ZCwI35Bw4jt3mpJA19r
	khDNIehHGUcv8yIzzgcaabzFkcaPeJfxKgu8hEdT1dGAXQ64hmnk4tmDwH7H9g7UbDzAHlqZTgv
	YD41WpKTWKFTYRUcy6sFSCPrAXMiGlSDYpOJW3yQylKW4CaArkbRYCBWL3Us+Nkrn7trGYyjuuX
	3Y7yQ3FhuRISqBn2f1HNKm/9bOypso1C1SAa49xWWObj0tjoDnUplABlmXHtwkf91sMpZr8L92M
	rngzAgc33gBoXIQyWrQyhPLMDCOXhfQeIC3H8lJ9y0miMV7YYb7yPq+whY1cFgfmKzR+6JhRsLP
	KZIQ+aYgFvUEFG0ZdjTwKgMhq0ODv0LMNA8uKGYuaQK21jqqSkf3mJSLR0wltjlzh7eBMGJbPMt
	8emHAdwVyFGhnOwJDF77x0jXJVQWS0mZhxQUBU8UQz8Sklm6uj5qQU3+pQFmzNhtPoXdos+d03O
	gGomdO+CRF4v7W87g2yXDUvquvNsqZeJrQe8RG1XyxKW4ymbu/8rMLCIrUrH7K3p1xGAw8NY5De
	7mQtTg==
X-Google-Smtp-Source: AGHT+IFxN1I7p4OrmEJyVfPusyM9atuCfiSsrf7q/xVglZ0wWPIW5Rb2H8TBBZHgX6MSeple2U8Gaw==
X-Received: by 2002:a05:6a00:2d8b:b0:7b8:8185:c23b with SMTP id d2e1a72fcca58-7ba3a0be3fdmr13116878b3a.10.1763372453432;
        Mon, 17 Nov 2025 01:40:53 -0800 (PST)
Received: from sw-TUF-Gaming-FX505GU-FX505GU.. (2001-b400-e2ac-65d6-eb05-e285-77fd-2924.emome-ip6.hinet.net. [2001:b400:e2ac:65d6:eb05:e285:77fd:2924])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b92782d390sm12606095b3a.60.2025.11.17.01.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 01:40:53 -0800 (PST)
From: daniel_peng@pegatron.corp-partner.google.com
X-Google-Original-From: Daniel_Peng@pegatron.corp-partner.google.com
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
	Daniel Peng <Daniel_Peng@pegatron.corp-partner.google.com>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Jiri Kosina <jikos@kernel.org>,
	Pin-yen Lin <treapking@chromium.org>
Subject: [PATCH v6 2/2] HID: i2c-hid: Add FocalTech FT8112
Date: Mon, 17 Nov 2025 17:40:41 +0800
Message-Id: <20251117094041.300083-2-Daniel_Peng@pegatron.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251117094041.300083-1-Daniel_Peng@pegatron.corp-partner.google.com>
References: <20251117094041.300083-1-Daniel_Peng@pegatron.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Peng <Daniel_Peng@pegatron.corp-partner.google.com>

Information for touchscreen model HKO/RB116AS01-2 as below:
- HID :FTSC1000
- slave address:0X38
- Interface:HID over I2C
- Touch control lC:FT8112
- I2C ID: PNP0C50

Signed-off-by: Daniel Peng <Daniel_Peng@pegatron.corp-partner.google.com>
---

Changes in v6:
- No changed with the v5 due to relation chain.

 drivers/hid/i2c-hid/i2c-hid-of-elan.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hid/i2c-hid/i2c-hid-of-elan.c b/drivers/hid/i2c-hid/i2c-hid-of-elan.c
index 0215f217f6d8..b81fcc6ff49e 100644
--- a/drivers/hid/i2c-hid/i2c-hid-of-elan.c
+++ b/drivers/hid/i2c-hid/i2c-hid-of-elan.c
@@ -168,6 +168,13 @@ static const struct elan_i2c_hid_chip_data elan_ekth6a12nay_chip_data = {
 	.power_after_backlight = true,
 };
 
+static const struct elan_i2c_hid_chip_data focaltech_ft8112_chip_data = {
+	.post_power_delay_ms = 10,
+	.post_gpio_reset_on_delay_ms = 150,
+	.hid_descriptor_address = 0x0001,
+	.main_supply_name = "vcc33",
+};
+
 static const struct elan_i2c_hid_chip_data ilitek_ili9882t_chip_data = {
 	.post_power_delay_ms = 1,
 	.post_gpio_reset_on_delay_ms = 200,
@@ -191,6 +198,7 @@ static const struct elan_i2c_hid_chip_data ilitek_ili2901_chip_data = {
 static const struct of_device_id elan_i2c_hid_of_match[] = {
 	{ .compatible = "elan,ekth6915", .data = &elan_ekth6915_chip_data },
 	{ .compatible = "elan,ekth6a12nay", .data = &elan_ekth6a12nay_chip_data },
+	{ .compatible = "focaltech,ft8112", .data = &focaltech_ft8112_chip_data },
 	{ .compatible = "ilitek,ili9882t", .data = &ilitek_ili9882t_chip_data },
 	{ .compatible = "ilitek,ili2901", .data = &ilitek_ili2901_chip_data },
 	{ }
-- 
2.34.1


