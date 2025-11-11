Return-Path: <linux-input+bounces-15983-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DC9C4AEB6
	for <lists+linux-input@lfdr.de>; Tue, 11 Nov 2025 02:48:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2631C4FA815
	for <lists+linux-input@lfdr.de>; Tue, 11 Nov 2025 01:40:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 926C930C63B;
	Tue, 11 Nov 2025 01:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pegatron-corp-partner-google-com.20230601.gappssmtp.com header.i=@pegatron-corp-partner-google-com.20230601.gappssmtp.com header.b="2UDa1KAs"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0311F311C33
	for <linux-input@vger.kernel.org>; Tue, 11 Nov 2025 01:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762824918; cv=none; b=mfTaNwDdrGzbOlVhZpgQJxNRwxkXUqkQ+tI7/tF7bQyTESSQ924BWKs2/yPqwvsmi8BN9+kL9+6TVKiZ4fWpW1sbKDnt+ESiaOpRb3NyzCoKujbbiocyp0oeCCxh/+hqlz1Rq6ultIGTOCDFRBxWXRzqKwbwWTnnUr++W92oETs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762824918; c=relaxed/simple;
	bh=TdjJPkz1hWo2r9tdrjV8C9i3Ye3pn22Wmud56Ap24AY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qQnlxaABckdMRjY1TdsWGul+COxSHivebQ8GacTeZmCgibVsFE3k/qwsz/jCoc8M/Exk7vWNdBAIySAgNHaEwrTNTceJUGZ+5fPYBiS16l8yrMcmkdWv9hxv79NO51L8f0WS2TBpNMdhrgloAIIRd8Y69EQXK15GcbV5pNlxKIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=pegatron.corp-partner.google.com; spf=pass smtp.mailfrom=pegatron.corp-partner.google.com; dkim=pass (2048-bit key) header.d=pegatron-corp-partner-google-com.20230601.gappssmtp.com header.i=@pegatron-corp-partner-google-com.20230601.gappssmtp.com header.b=2UDa1KAs; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=pegatron.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pegatron.corp-partner.google.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b67ae7e76abso2181528a12.3
        for <linux-input@vger.kernel.org>; Mon, 10 Nov 2025 17:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pegatron-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1762824916; x=1763429716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=539HVCzYtsPJqOodyacxfczakrCXMmx5hlTcSg4yU4k=;
        b=2UDa1KAslO/+v8Tz2n/YaXmNb6VEWMbkvgF+i6SDGFCCqFZnNf2DkvQU5bQc1jzfGO
         VtlIvB57aLUqsBG77OzdyvjgfAsAofKTzgBO5WnUejG71L7pa2RcJrViiR072UgnyW24
         2T/kly+iylmgfazBozWEt8gJBij3X3YKvETO+Qtuo5uTJ91QSGv73xfo9D+dMSBhOi0o
         XWWKhXJ2ACp3K7TkYXYS414w+byg8eW8IH3UImpiVQt9Bm9juuSf8NpjFzjFeAQYpEpW
         C5v73lu+/+nLG4/Tn6aa9e3aIhntyzk7qezMbXQgRzYYVClXrc0gb1CNAB0lfEhi755D
         LSkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762824916; x=1763429716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=539HVCzYtsPJqOodyacxfczakrCXMmx5hlTcSg4yU4k=;
        b=n6IkFJo5n81eywcipYOC0e2DI3/bdX2Qvu6ztALcxIc9ZCCVi9xFza8W4GZPNIMpF6
         a2ya54cT+ZP8c69Eqhh3cQwq4bUZEkWAOPSivgiplbykFNy4Q+wEUWna0+UQP114KqJw
         bFAIQRAJ2p2YY/eYyM/rBQcarJa9gC/+OHGw8gf2yfxm50RgfxfQXFktAWg/sdljfnIE
         uzWJrS0vF7qHgUZQ2eSBub3yxoosGKYK/Pza8rXt/3Q3vMW1/lo4ApjtsOC9xN3MJ1wn
         hUt4ErCasajKlcznwOnYaoAS6Qze+eaqhW39KUCSdLWL2TmNWnCfLzye1mjvSnUhZ0qf
         sPKg==
X-Forwarded-Encrypted: i=1; AJvYcCXBp4vnewziYVfWlcRGSz0ZDrmuF2k3Sn27OpvOZhprBtzuFeYvAKMWjY+eH5uEjk2jLmyOmbmieGBZAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKMCbpOsQWcxd/HzrqpDCqSDdAAE2hJlwvlluGGM8oYj0gUaRM
	eV3TnXrOlBV+VJaXHmR31w5/MNquf2xLFpbBWZ6oXIMrCnbwMX38OvXwVtb7o6ITBvdJFXYqgkk
	ebXA=
X-Gm-Gg: ASbGnctW2rGQkUgeN7Vh2dY5vf98bQB/uf7dCNBf4QeK9ttz//fAMMG7WQ8yRcbAFVq
	LZjHwEX8mUO47CXIIgeIEwTeA2YbEK/4TP4Ds+mY6Y0gbGYYA8OZmCpuLJQicfV1zx56PGAeIlO
	q6I9/EfjtBnOPGBXJFYrRxitVTaQv8k4wF0pmVZnki8ln39CIkqkzr7E3UJiA+SvyzhtpwkhEyI
	EfI8QtsAFAtzHLWuhemACMpungz0cefV1yRtSi38uRbdsd/KkrPGC5c7UvWRrnszKdnIs1Qg4J8
	NnfwlUAHXVZF3iwI7J+ghjlsAmJ0eH41TcWxQ86Ahpe/TeM+KhPRrpIY9DFFLE2lutQlgGlzLmr
	iK1f/oGFruj9aR4EyaSdbybbWsMhya8kV9Iq7reGKzXvjA76mzZlKl4G+zKb734nreWKJMhDE22
	bPJh2cFMJApGRftHnvrHULaG4yyoEKo2nSvTpDmaR3PY/z37+ZJV0QTZ5hQKyak2U1Xc0N22V4V
	VJNh65sXQT4o9S7PNYxrKOtJTMy90JZBVM5XINYyrHz1SLJn7ifQha0djpCl6lnkaQn3/lp0VnJ
	ZsPy
X-Google-Smtp-Source: AGHT+IGpuH6Qyu9J8CYe1MY7B7f7EVUnHuAJbViErWuMEnPox4jHlsIC4xiOtb7/TS+fYjCiIB2N6A==
X-Received: by 2002:a17:902:cf42:b0:295:5668:2f26 with SMTP id d9443c01a7336-297e56c9ebfmr147023005ad.46.1762824916295;
        Mon, 10 Nov 2025 17:35:16 -0800 (PST)
Received: from sw-TUF-Gaming-FX505GU-FX505GU.. (2001-b400-e2ac-65d6-0959-d540-843d-31d2.emome-ip6.hinet.net. [2001:b400:e2ac:65d6:959:d540:843d:31d2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c740b5sm163666485ad.70.2025.11.10.17.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 17:35:16 -0800 (PST)
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
Subject: [PATCH 2/2] HID: i2c-hid: Add new FocalTech Touchscreen Chip
Date: Tue, 11 Nov 2025 09:34:58 +0800
Message-Id: <20251111093426.2.I47e028c511ad8fc86a44467ae228ba4fc984f7fe@changeid>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251111093426.1.I76ee34ac45e1469dbeb11de0d1e47d794af7dc88@changeid>
References: <20251111093426.1.I76ee34ac45e1469dbeb11de0d1e47d794af7dc88@changeid>
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


