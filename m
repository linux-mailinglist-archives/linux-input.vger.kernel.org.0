Return-Path: <linux-input+bounces-14175-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 680BBB2DC5D
	for <lists+linux-input@lfdr.de>; Wed, 20 Aug 2025 14:26:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC887A03B3B
	for <lists+linux-input@lfdr.de>; Wed, 20 Aug 2025 12:26:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C3D82F1FC6;
	Wed, 20 Aug 2025 12:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="Qyvl3gK8"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F882D24BD
	for <linux-input@vger.kernel.org>; Wed, 20 Aug 2025 12:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755692739; cv=none; b=aNulxGSmPFMwHMDc0lbZLUmGFRcIX//O6AN7+qrJDqeJ65Vl4M1dtQs89Wdi7YW77A8yKKqwgvWevnkh5bi20/bmoJ/Bpu1j4P15UuilFfYcOX9GxBh/XsGyvM57EhlxJhjaHPoFH5ntly8CJyVKuR1MZKRVawP0HWBlu56BwlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755692739; c=relaxed/simple;
	bh=CeotG1Hu/ciNhCFkEO+QnBJCoR9/jtz4I4MM+NxZd5U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZmN+ruqxgoUJ97u0TAResD8dKtLGN+9BNSuU9VvX0ujmaFhx9AGPbVohcDnbujvs6awJkWpwFCrb3SIwIY3wG0yENJu1wd9NBuhtdpXlcdo6a3aev0rIzz7HjPhiVOPywdYHpWTKS0Q7C49JYvI7OoVJYUXwGMKcCt7c4fe4DdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com; dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b=Qyvl3gK8; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b47174aec0eso4279107a12.2
        for <linux-input@vger.kernel.org>; Wed, 20 Aug 2025 05:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1755692736; x=1756297536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmdG5DlYugS6q7DtukrVNJuzOFU57fMjmsXm7FON0so=;
        b=Qyvl3gK8Pz8d64dYAskAbLAAbR4Nr/S0inYIJfdp1QQU2Z7uwsK8+sPiwj+qut0DOM
         2IYn3KF8swri2MQW/1FEvBM/ZXRvPO63OMVVzQknxngiZQ2SBY6TMMseGv9S6Jz75DhB
         z49QQ32XJJ/ddQ9ueSJ0BEdaErBut27OeESVgsjso6VWEnH+G7XKE+zPhZP+rkq7nV/Y
         aKnvMqzPCrADCGhPcCCVuuV1qPiYD8jLv8FMUFt6n+Dz1q9/ECrTe3603gGvF2SfZp4B
         qrMKjwoNS+8vBzLoOA2ckDlNGnOPsQylPMbPOXQ1/X+xEI6grFucxJmHm3xfPfbExBzu
         npIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755692736; x=1756297536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RmdG5DlYugS6q7DtukrVNJuzOFU57fMjmsXm7FON0so=;
        b=q7pZKN9Pf7UwEIqgstibwsLRoy+m+89BkHBQ3tTtDS88pROPIH6TT52oFBkoLPArrg
         jtStqZaSVmDuJXpLcTbnyNXvWI6PHeeR6m40aqLDjXOChzTSdEZU3WqLVC6pKM4UdlGw
         3w7HiGFfgMsxmwvnxzMEw0P4hKWh2TqkLpZfdqkzYv71C6bK8Ll65gXSub6H4rcO/0ob
         KOgAzOIC37lVUOSC7UTYtN2J7jQL5gAis+m/pLjZdkzc2HFdxGy1NEcSK3N0U1y55Wzk
         4k0KS0fDkX2VKw+uR69E316y1zRb151YNOop19GmlCkkaC2XeM/Lmfq0FCoEUQ6N6MRi
         nhBA==
X-Forwarded-Encrypted: i=1; AJvYcCUg1Tq5tsxQ8QHi4Q1CBGaEr6mgmtBPOmnN6zenXtQCboim2hepgxHjD7lBPnca6CEoTO9xb/ZP1YsS6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyXuKbgYbksyRqPurAsqwt0LQuzOullF6OEQIfycF2cPGQ0UP9
	4hqYG0ZMNt/W8L5Rp/0Ef1ic7noeS/8y/IaBYXchHQLl106H5AesushsScwHEbBJFag=
X-Gm-Gg: ASbGncspbM6XuUNuus28UmZwCeaI1DOCLz60Y7BHnupJSW7Vmtd5pD4qZe8hAf4a4R6
	jq9eKSeRZgbptsymP20x7jQV/iVTgqOUFnj3VrPbbdQM9rNADKUgOMzXCO8F71lF8HftJdg8g7F
	e6c1U7idBnHeOIA1ULj7/PKLQdJ2zAf1HiQAgG80woCGoA09Sgae/i3FZSghmW0GEYkPbE8Spaq
	jFnmSgFYq3/MDgoF51qbgElzY5x3VDh2wryUXQwBiFTaNyHiiWTePP1nAoRwhKUGu475aoncrTl
	JcLjXuuQbXs6NcHrKQWbmWdseB1yE5wb/XP39e37HUf4K1IeOxBEmCLKSISAwjGXcw8cr5Cg8EL
	Q0WUh+BmOFe/OoFkXksWN5aKBX/iWgqTgB+Yiks6Az5qOSv1UwBb6vbD2ue80QWHhWDphrQ==
X-Google-Smtp-Source: AGHT+IFWXveBplzBI373wJkuOopt7z07DoZZliYZMmzDqvSeXkhutFQFlIGjWN/Z38FuhMPcgQY3Nw==
X-Received: by 2002:a17:903:19cc:b0:242:fba2:b8e4 with SMTP id d9443c01a7336-245ef27bad7mr39608355ad.56.1755692735800;
        Wed, 20 Aug 2025 05:25:35 -0700 (PDT)
Received: from dgp100339560-01.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed4c745dsm25450135ad.73.2025.08.20.05.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 05:25:35 -0700 (PDT)
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
Subject: [PATCH v2 2/2] HID: i2c-hid: elan: Add parade-tc3408 timing
Date: Wed, 20 Aug 2025 20:25:20 +0800
Message-Id: <20250820122520.3356738-3-yelangyan@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250820122520.3356738-1-yelangyan@huaqin.corp-partner.google.com>
References: <20250820122520.3356738-1-yelangyan@huaqin.corp-partner.google.com>
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
---
 drivers/hid/i2c-hid/i2c-hid-of-elan.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hid/i2c-hid/i2c-hid-of-elan.c b/drivers/hid/i2c-hid/i2c-hid-of-elan.c
index 3fcff6daa0d3..23826cb808b7 100644
--- a/drivers/hid/i2c-hid/i2c-hid-of-elan.c
+++ b/drivers/hid/i2c-hid/i2c-hid-of-elan.c
@@ -179,11 +179,19 @@ static const struct elan_i2c_hid_chip_data ilitek_ili2901_chip_data = {
 	.main_supply_name = "vcc33",
 };
 
+static const struct elan_i2c_hid_chip_data parade_tc3408_chip_data = {
+	.post_power_delay_ms = 10,
+	.post_gpio_reset_on_delay_ms = 100,
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


