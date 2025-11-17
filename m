Return-Path: <linux-input+bounces-16140-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A5AC62362
	for <lists+linux-input@lfdr.de>; Mon, 17 Nov 2025 04:08:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AF2194EDADE
	for <lists+linux-input@lfdr.de>; Mon, 17 Nov 2025 03:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3968526E710;
	Mon, 17 Nov 2025 03:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pegatron-corp-partner-google-com.20230601.gappssmtp.com header.i=@pegatron-corp-partner-google-com.20230601.gappssmtp.com header.b="ny36XuBo"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DCE26CE2D
	for <linux-input@vger.kernel.org>; Mon, 17 Nov 2025 03:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763348547; cv=none; b=Qt+W+C7vsezZoHeOkhJEqK4QvflNkvfHSjW8jSqcsqK4LcsLKEuG5lld/HkANFQUjQ6Nl7DaH5RQ9hyCUrHH9HJMUAINk+QiNQPbyUoS2vLaIzjLwn8H0CWZIUCfZ3klZjC6XiXcdlGudE/1q8gvGiHUjjlLuiZ6NQaqN+qYTe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763348547; c=relaxed/simple;
	bh=8BJpcJ7XJc5GFKEhfxLdDt7atXBGrlHevwFVE4tYl6A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QcYqvjJGu5GNcfXSr7fZz3FKUTKv+VS5treAqBr+31tmEbrFCAHiYe0Y/NjkIFzKZo9lWCCTBIT2/CNkVrhCa/tPrP6Co+foaupFswXMU5E5fuW9oR4OSAIDzA0ukQYVH6InUm0zcEECx2gCICg2t0wl4hM+FH5pGZiDRclt5fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=pegatron.corp-partner.google.com; spf=pass smtp.mailfrom=pegatron.corp-partner.google.com; dkim=pass (2048-bit key) header.d=pegatron-corp-partner-google-com.20230601.gappssmtp.com header.i=@pegatron-corp-partner-google-com.20230601.gappssmtp.com header.b=ny36XuBo; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=pegatron.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pegatron.corp-partner.google.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-343774bd9b4so3517477a91.2
        for <linux-input@vger.kernel.org>; Sun, 16 Nov 2025 19:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pegatron-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1763348545; x=1763953345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3LWk9GziUZOGIJKB+jgJgWZIZsTkwn1zGJb112iEcLs=;
        b=ny36XuBoqK705HvUkDqsqEwkUvWmq7UAwCTOWr+1FjSxQSv5Ftj28Kwtb3/QT/LPq7
         NXbQoVwLrYL5psRAzvia6uC7RdVmR1UAjBiQhRnTImB4X+8VMY6+0joyNzQSanx7GTdf
         z8bgc6ijRItpJGu/69aaE41hh5zA5v2Dh+oLXyIgdQFMrCfIyNifyZWUAp91KEZZCqP8
         eWUuyJBdK7yZLYwAPDFTy9KxUunloa+6NmVUt11DKE/9Af794E1dRultvXKzLHVm3Dal
         kWGek9my3Bt0MuYbWNKcw6Y74LtKDH+5LathRKevMxnQd/voTK53u20FnPtfGOPl76ve
         qlSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763348545; x=1763953345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3LWk9GziUZOGIJKB+jgJgWZIZsTkwn1zGJb112iEcLs=;
        b=C6MiwY/Ybh4ixAfmrNqxW+Ar7K2gViAuUXfN9YPx5H/r89x8+e+hCBMcbgD1UNptiZ
         X+Kj6EZpo+d0RP3JCduqfs5/S3vuFfujTtiS9ctemPhbUShPYqo1WVoJJ+Mfx9mTOk1v
         5wn4k6HatHWrDlKRQ0c1XPDbiUZ4CSug9OqQZqWaTxgw3IJSA8yfte3oEy9hTwtq/Nkn
         1elFWalLtrRmM8nXCn26GYWmm9a2ztAdl6TwkqG/cfE+jsMDRI4eAHloQKLOYNPySQZX
         2XvmkraTbgX9hz98GQ69i7fs2NcJg2LO0xEgKk79dx232498PojQyAouKKUpuDWerLSl
         2z8g==
X-Forwarded-Encrypted: i=1; AJvYcCWHsTFHLSRWbfPxp8LmLjUIwc0OakdhEeQAfMWwrTeCK1fM964GobEg9u2OvsdWgI5t2HVpvqlc7pjprQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVpcAP9yYFvOIboEGNhTM1dokl/t0+B/GDL9q3XmSxAbveZPvc
	UXDwyQym6GtIULpP6iQaVnzhv9hJaNGT4x9T5qMI+SO22740L5gyqW99EkeJvn5yig==
X-Gm-Gg: ASbGnctFZk0G1Mn4aMCl8bcw+AcWf90IyXlcvZ6fpgZ8X9szsGp7JW9VFlzFr6Ijqgs
	ucxVUqn/OxKE3nuAQlaXf5Eibptod9nTAk5BAmoZ4Puik09p4hI2j1CzohCNkcpLPRLuE+dAEqv
	JI4Qlv8fVFX2dtmVdo4ELOH0d7q4/1JOiRUhO/wJqIVwm1WefUIWajF49ggDmYinWMr6yDf6rpY
	o3I/yp7Kr+U+C0nz6oTk/SxZPF7LwB6Tu2ujg6X+RtPJq+4Kzhaf0GsdrB+QhfT63WCLnkmxJrR
	HvhhxyqatdyIU6ByqDJIdnlhxKegf/NeEcCaxyvAMbfHX6mrGrtjjKWWEu+spHUpqqvqWSyoklR
	NfgYxRsZzslt0ABV/WwoIhf1CG4uDVQWePzUjylXWJ1cqAQYSeK3rgyBy7WW3iBfANDgXp0fmEI
	FYpMnfUOYaKEQzRLOgLqnOPHQ8e7w1Tm0ZW/JickszvHRrq2hwYgCjWUz+DLgy//+Yu6UHryF7Y
	XVgIu3o4vePLGuunTO5Q880Bq2uIVTMsaas8w/44EijyV8pKLz9iE6JwPbmEMg+Dh1XbRY=
X-Google-Smtp-Source: AGHT+IH17YUP5WIvKl38NZG1Tu9eKqUjYwvuoDlt8QE8CjNF9UEsVX4O3OWmlFXPts57w3iZ8V/toA==
X-Received: by 2002:a17:90b:58cc:b0:340:f05a:3ec2 with SMTP id 98e67ed59e1d1-343fa52975amr13224468a91.17.1763348544853;
        Sun, 16 Nov 2025 19:02:24 -0800 (PST)
Received: from sw-TUF-Gaming-FX505GU-FX505GU.. (2001-b400-e2ac-65d6-ccc0-37c3-bfbe-95a4.emome-ip6.hinet.net. [2001:b400:e2ac:65d6:ccc0:37c3:bfbe:95a4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343e07ba2a4sm16332114a91.15.2025.11.16.19.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 19:02:24 -0800 (PST)
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
Subject: [PATCH v5 2/2] HID: i2c-hid: Add FocalTech FT8112
Date: Mon, 17 Nov 2025 11:02:11 +0800
Message-Id: <20251117030219.134173-1-Daniel_Peng@pegatron.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251117110148.v5.1.I894dde5015f4acad94cb5bada61e5811c5142395@changeid>
References: <20251117110148.v5.1.I894dde5015f4acad94cb5bada61e5811c5142395@changeid>
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

Changes in v5:
- No changed with the v4 due to relation chain.

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


