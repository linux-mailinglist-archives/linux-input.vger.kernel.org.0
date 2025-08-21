Return-Path: <linux-input+bounces-14220-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5D2B2EBCA
	for <lists+linux-input@lfdr.de>; Thu, 21 Aug 2025 05:15:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45250A23D5A
	for <lists+linux-input@lfdr.de>; Thu, 21 Aug 2025 03:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC9FD2E0410;
	Thu, 21 Aug 2025 03:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="SMsryahD"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9771E8333
	for <linux-input@vger.kernel.org>; Thu, 21 Aug 2025 03:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755746134; cv=none; b=PTiDEGMbi876H5G2R2E14KhGJLr2JnHnRqajdwOddzZttwarLQO2vEPzltvqpYX2Ubp+C3FQUvo6CSHSdSM01qfenM1h/8eLFkFkC8U/EYw82KJjV44uUC9OXc5WjRCg6dAMRYIeKBruVgnB7i2fLxjNLLidn2dWskrykHoHTMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755746134; c=relaxed/simple;
	bh=Fh4EhH5K3IA+nkQNoY5kz1/6FPqqY0VdHyu1rqkGuNk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NR1VV2ZlGBtRP8r9QGLb95gWLxlxgRGHh6qrmMGM0EuV6pe/wwEidRl6c+Pgw/TJQkPUy1PGr0dJnPqGqlnzTSSaKzgVBd4tt6iNnuTLIkygHjicvd0fC8wak/8h0MtTSwaCuUNLC6fQsBCnupgI8yGf17mL4emWBbno8+Ctw/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com; dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b=SMsryahD; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b476fedd9dcso337071a12.3
        for <linux-input@vger.kernel.org>; Wed, 20 Aug 2025 20:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1755746132; x=1756350932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eSHyll5PrwKz3fPakcS2KGvBNYcZa1MqracAfKSOTyk=;
        b=SMsryahDxpFf9Q+yDNr8dS/SizGiggiFNIqp7dr4U4xCW6T51+mm/Rz/woBXATV9pp
         f/EVRW2Fa15t2nCjVjcWF8uWx+NxE8t3L/4pHO2RcdFmraXW2uHsDU6wUXLlxAIy0P86
         QThZUOhZJojUMr1dIgtQg/NYuQN+R75Mb3JfxTG46TzEnEmc7GBQSM+/oq8SKNvwgedS
         b5Yr2kw+nZ3kbXUqbZsfC8ngyvcCQYIaLXiPibG8lrV+Tkrzs47fyalT57w1ZU/+LN5r
         MzagytTdYllxjJHuhDvXiRxIiBQzYBEZqQdo/FWkHz8dm2mHIxnuOb6zhWFKozLG045h
         HhGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755746132; x=1756350932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eSHyll5PrwKz3fPakcS2KGvBNYcZa1MqracAfKSOTyk=;
        b=kmpa0+Lmvluwtl4LhfNJ4P2O2rtCJbv0eOWLqIe2fSFBJLLyxasqvLVzdzEehs1R06
         hwRSScQVF52DuROyJNloYvWr0h/BRd40W/FaDRKDvQh4qCvQpOnFl3fv+TGOrd7C8hVL
         9FBnA60gpLBd+j0g+0GhbS92ylm9ggGtmLJzJdvWp+rcKq+YvZYOxAfZnk2c1hvss3iY
         zOjW8I8TCkwYO4JnBTzkB1rVX8/HkBUB5n1zb1+5QEX7bd8iL2gpc2dX6Rsv8WMiDiHM
         59dHeTkeGx0aGeVTmniH0xkKs88xEQ+Ao1XxF4GHw8bc7uVW9n9DaUr8lEM3vkkWRFvS
         ijmA==
X-Forwarded-Encrypted: i=1; AJvYcCVFxID0Ovlt1Kvn8+VzpaXj4FKLMoB5AcFnTzhY6pqFngXUt5CQsG9hYdpisEIFmEEu881EJWjvRfuFNw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp/G3uAaRYIqV9jDYgfgNolO3tP0KzGyvSPaL9f+y0d8KCap5h
	EuhfPc0BcEK1oeugSjRiB03esfaJLXr8D+4VixxvOCIIo9h7jRvnZnw3lMqdoUXwkM0=
X-Gm-Gg: ASbGnct/lYcFQBY6K/IpUTSqnrurzoHDQPdWne4kf9YKlkKKcV0wvSsfkGi606T1jQg
	y99V5YEx6br35j1PDl+HnaLxRiuraUh4VPak2ZUHl6yY2cr0iBe5QpaDwPz55F3Ho4yTUWH8K+V
	fLfe9B9/ul0afNAFSjdgltXbWWCZesBYJ//83fa2lNVr/t1/efm9sKCQehlsHSL6YmVQ+0+dHAZ
	stixDVrFAOL7g1syGTFmU2Q6ubpJxKWnG+4NoWX4B7X6r327eAIe0o1/3ZbfkpR5B4T6KAmdiqu
	2xVMZz0zUfa4ADOQUNMtHHYudKgd54PE1kcOMykLBH5rttM9mgewyWL2ZS9ydsuvibRue1jrmDi
	M0s7pUbla2sEK0B6DcuIQvvKCd5c=
X-Google-Smtp-Source: AGHT+IEo8cDwJAbum46Jcb+xwtIAyNiOV7V2ejdlSk9LCqmPbAAdVFRIMJbz2dFzn8EFH7Sb3q3xwg==
X-Received: by 2002:a17:903:2442:b0:23f:cd4d:a91a with SMTP id d9443c01a7336-245fedcc76fmr12413985ad.30.1755746130195;
        Wed, 20 Aug 2025 20:15:30 -0700 (PDT)
Received: from dgp100339560-01.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed51b3d3sm40285415ad.147.2025.08.20.20.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 20:15:29 -0700 (PDT)
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
Date: Thu, 21 Aug 2025 11:15:14 +0800
Message-Id: <20250821031514.49497-3-yelangyan@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250821031514.49497-1-yelangyan@huaqin.corp-partner.google.com>
References: <20250821031514.49497-1-yelangyan@huaqin.corp-partner.google.com>
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
index 3fcff6daa0d3..875f5e214c7b 100644
--- a/drivers/hid/i2c-hid/i2c-hid-of-elan.c
+++ b/drivers/hid/i2c-hid/i2c-hid-of-elan.c
@@ -179,11 +179,19 @@ static const struct elan_i2c_hid_chip_data ilitek_ili2901_chip_data = {
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


