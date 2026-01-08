Return-Path: <linux-input+bounces-16863-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0176DD01416
	for <lists+linux-input@lfdr.de>; Thu, 08 Jan 2026 07:36:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9EDEA3043F58
	for <lists+linux-input@lfdr.de>; Thu,  8 Jan 2026 06:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F1B133B940;
	Thu,  8 Jan 2026 06:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="U8fhXp/P"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621DE33AD95
	for <linux-input@vger.kernel.org>; Thu,  8 Jan 2026 06:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767854141; cv=none; b=p0Ls9UUd1L+zbB9QAlFMwDgkyslwYaqE+PpXssEVrWzXB3uPEm+Pc8Pp1Cz58luox0iXKu+7RKJwVCKiHdSBl04RrupYUASK6tf0uTSfdaEzaTVm/S3X/tRm5CVlGbIFVhX8MZyBKJmk+XI9vo80ktufjLQ6eIxngqOSIcu/FWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767854141; c=relaxed/simple;
	bh=7eIBMYuPULsXRIE8uJPvolkz9VSkZKyrgJYAAANz20M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YQ7492zY24o8YdjlMW9N4IhnMTiBPG/CICWI8Vi99zunt2BylBkqlCxnKoZ8lOeGZ0JqiaVzT/kgrt760WbtZ/raZ8/PaCN3boNPKF1Dlk7eF11/6xMr/QamkCi6Eud7VgOfXrA9i6OJoAmUfeUgImdYbWfkWSm/17lo9luq5c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com; dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b=U8fhXp/P; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-34c2f52585fso1945436a91.1
        for <linux-input@vger.kernel.org>; Wed, 07 Jan 2026 22:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1767854136; x=1768458936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gq89G3tOrOHNmszKr3q4hJ/s1N2xw+oE/TFVsExceXk=;
        b=U8fhXp/PnBParMaVNRLdadFYBWAW0u76dtP4MeuOA+PYyrV2RD66WVPHPI2iDwzW0C
         bW67SuuOQnlMfLaUoiKVGH1Lwf7pAssNATRBTZ2A8qf1Z/D1IXquv2G7+BjiqXC4qKGp
         sr/2afA2s4TzWq/mB0xVR3kHZCrd7CNbR3s3vlXvYgqbU8A04jk2ZCYj4+iShy7oTvaG
         vrujDvRIO7CSg/p3HKc1OWxTQJNYz3B2ZH5MwWo+bwpF5OQmspavYu1u8DCkthG+ro6u
         Saqqzmx9QAcXmpacY0GszJB4TbqdGbytMKawN7wdzZXE0tv2uiwKrHXf7RBfSY3g9DNx
         5vGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767854136; x=1768458936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gq89G3tOrOHNmszKr3q4hJ/s1N2xw+oE/TFVsExceXk=;
        b=RsH2RCG9tf+HgsdgZVCzToD8QSKiN8vbdPAik1cFZAizRR99Vg5K2P3gl2vj1aGzlr
         aM2Sbsqh+ldMXS1YeHnoNYDpCLrCaaVqp5dKjGJjAuqQgHeRAtpjq3bI496jTglPJgem
         qC/hK2X1RqWZRfWxZmM+OkyoOIVJ6FKQIkS4W/9GtU3V0SWxtwRuBNjZr84Wg2f4+wNO
         y0csixE4dlnqG8TS/sCzHMBAokSUSLGT8mDX1eU5EvbgMWd3v0qrVlJD1JTNlM5ue7ar
         xR/aAeWlzYJEXq6ga4bWKCDPJbFArtkTkXj3iDm8tc5sGzCtMax8ty0TKj+JwsY73njK
         HTQQ==
X-Forwarded-Encrypted: i=1; AJvYcCX664vDuZb86X/pzr8/QRFsQou3zF6Y1NpmtN7gcAbv+pFMFpEK/b9wPPMue5jeXOg1BPYzXkk5GaqfVg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1yqYckRle/VFAoc2RSm6FVoKmWQ53m4+7CVBaC6j1AaZeGcdM
	n0h2yYh0OxCzxvCAJib03ZeKgNgg4TT7huOUqvmrthAZz16Fp0Ia1W+vzGSYxh1UyC4=
X-Gm-Gg: AY/fxX4IzNwRvaR+/Rsxdue2iNm2pPleEEyrKHLUp/+MtDWXVwkmjCjn70weBtg3Ejw
	ZXSrbUjg0f3QIfSsrJ3GjTGlYTrCv0Ye/K+5Pti9BTWYlENMlT+J9F06BEWGDRW9+gs6ZCryIaF
	PSi0RGDywiIn7BCs0ge2ojGXFCPO8InCIrz3wI4pp19tBL+IjBlKuZLSS1VFbWa8QSJw9DFU+AW
	xy3PZ1B8PNOAQYVDeX2oSOS1We2UROy/0IOvhUXShxvGTy6844/3GdvIM8DkTg5t0PNrgigQYBY
	QMlkWn3pa2P4y4wkbJJ7eTnbJnq8e8+D2IIS/40BvlSk63tTNd91n6kksGnr64V8RkDruw2qtIW
	tf7l6OjbRBxoTyVrfudGaNjDt/YdXZvDB+pCOYi3dt6aFZmws5TRFRY3m5bkd0evGm5kbwoT6jt
	npVmpaa2j+YnIE1CazgMcAzfcFr9ubWk0W3n/ywfy7BXErQYRir8TUqVaLJQ==
X-Google-Smtp-Source: AGHT+IHeaz5+O4p3iSfBbY4NUJEHhv7nMLACepGidjYvey52y26UaHJ9zeS93CMxI9QdYJzfL83WSA==
X-Received: by 2002:a17:90b:5445:b0:32d:d5f1:fe7f with SMTP id 98e67ed59e1d1-34f68c2050cmr5000895a91.15.1767854136400;
        Wed, 07 Jan 2026 22:35:36 -0800 (PST)
Received: from dgp100339560-01.huaqin.com ([103.117.77.121])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5fa93ee7sm6712750a91.7.2026.01.07.22.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 22:35:36 -0800 (PST)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: dmitry.torokhov@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: dianders@chromium.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH V3 RESEND 2/2] HID: i2c-hid: elan: Add parade-tc3408 timing
Date: Thu,  8 Jan 2026 14:35:24 +0800
Message-Id: <20260108063524.742464-3-yelangyan@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108063524.742464-1-yelangyan@huaqin.corp-partner.google.com>
References: <20260108063524.742464-1-yelangyan@huaqin.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Parade-tc3408 requires reset to pull down time greater than 10ms,
so the configuration post_power_delay_ms is 10, and the chipset
initial time is required to be greater than 300ms,
so the post_gpio_reset_on_delay_ms is set to 300.

Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 drivers/hid/i2c-hid/i2c-hid-of-elan.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hid/i2c-hid/i2c-hid-of-elan.c b/drivers/hid/i2c-hid/i2c-hid-of-elan.c
index 0215f217f6d8..2a6548fd234a 100644
--- a/drivers/hid/i2c-hid/i2c-hid-of-elan.c
+++ b/drivers/hid/i2c-hid/i2c-hid-of-elan.c
@@ -188,11 +188,19 @@ static const struct elan_i2c_hid_chip_data ilitek_ili2901_chip_data = {
 	.main_supply_name = "vcc33",
 };
 
+static const struct elan_i2c_hid_chip_data parade_tc3408_chip_data = {
+	.post_power_delay_ms = 10,
+	.post_gpio_reset_on_delay_ms = 300,
+	.hid_descriptor_address = 0x0001,
+	.main_supply_name = "vcc33",
+};
+
 static const struct of_device_id elan_i2c_hid_of_match[] = {
 	{ .compatible = "elan,ekth6915", .data = &elan_ekth6915_chip_data },
 	{ .compatible = "elan,ekth6a12nay", .data = &elan_ekth6a12nay_chip_data },
 	{ .compatible = "ilitek,ili9882t", .data = &ilitek_ili9882t_chip_data },
 	{ .compatible = "ilitek,ili2901", .data = &ilitek_ili2901_chip_data },
+	{ .compatible = "parade,tc3408", .data = &parade_tc3408_chip_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, elan_i2c_hid_of_match);
-- 
2.34.1


