Return-Path: <linux-input+bounces-16033-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 36705C5231B
	for <lists+linux-input@lfdr.de>; Wed, 12 Nov 2025 13:11:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E077F4FE4F0
	for <lists+linux-input@lfdr.de>; Wed, 12 Nov 2025 12:01:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BA54316182;
	Wed, 12 Nov 2025 11:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pegatron-corp-partner-google-com.20230601.gappssmtp.com header.i=@pegatron-corp-partner-google-com.20230601.gappssmtp.com header.b="WHHr2x7s"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E57315D58
	for <linux-input@vger.kernel.org>; Wed, 12 Nov 2025 11:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762948761; cv=none; b=Duq4urctB4gYB+LC64z8hdA2AjZS5XhsDdMm8nmBRWz5BF4+OerTWBi4YGL2tGOMqP4H9meyV9Mn75/2eoAdgHHB4YGLVV3oscH8kfQku0DqQvXbvdmF149bImEEiaPzcTZjPPueXEso0ZAR/EYCjiSn7OdmMGoKcHhBmqNHw9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762948761; c=relaxed/simple;
	bh=6GlgB1rT+FlncACmdH++HfYnLRqCO6n3Y9XoBOKkvk4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JjQa7yIKlq9wG9HvdXNJBnYiUvF6q/5LB6o2CntQj55GdUYLzV10FpXU2EA9bNm5SUSdSu84U70uaj95+eCAuv4qQ0TEfe8GV6GGYi6znOLaqIV7ZDSSTGSMg8xpP4bNpYl+h/Y/rJ2sfRsnPbiCawR0QIlhffel/rNbBRHqFKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=pegatron.corp-partner.google.com; spf=pass smtp.mailfrom=pegatron.corp-partner.google.com; dkim=pass (2048-bit key) header.d=pegatron-corp-partner-google-com.20230601.gappssmtp.com header.i=@pegatron-corp-partner-google-com.20230601.gappssmtp.com header.b=WHHr2x7s; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=pegatron.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pegatron.corp-partner.google.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7afc154e411so472692b3a.1
        for <linux-input@vger.kernel.org>; Wed, 12 Nov 2025 03:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pegatron-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1762948759; x=1763553559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V8XgLJwaQ5HvJefrgxQNE5WjrBzwyM84xyEyfeQWOzw=;
        b=WHHr2x7sUGhnea3e2vjNEiMwPAIFBxQLNtG/6LW+W5ShbZdlvdYz/mbz9pzYacZqoU
         C9rRVFifJt1L29QFsEH6objIYRQ4cMtPgpEwop6a5h27eXDX8QhgpM7uVxdYyxF2lrCJ
         7wX82OvCgBncJdUBlxLgXpVGYyKDDM0peW4K2dfgUGtjo5kcO3MGev0icNkKoDRSeOnk
         twpbqT2q99NYcRDtwuOYSao8fQF9jlPcBhttXUtP8/kgtZfvBMf80Lovwoivh8aOCq6P
         Zpvrc4BpY/3d0SsD5LMZxZolNU6iMXuIQOCkbJ2VniQqugph6ZM6VoaWFKAXN9dsPZ4Q
         JxIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762948759; x=1763553559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V8XgLJwaQ5HvJefrgxQNE5WjrBzwyM84xyEyfeQWOzw=;
        b=wPGZUNq+uxQZbxgYaY+GZ9dgHoKOSX6a2JC+p94zEX83eSpkq2gKu7xqGCb6OzDh4r
         hKMmKHA99sJNr9GZmzuWEAauRufRdv31ET/eMqdE5y4TKh886upNV96iHQO8yQROx/8G
         OLxpXUob+WCUsUkh/jGyYjFnlRcYuB+kxwMSaDTfLX9uYBcikHQ8IVw3ZVKNoBPsYTq6
         IAoBZLXXcciJ6iwLKHcvO+uwWi1qZmwK9sevtF0+ENyhlink4mjs0gMzT8vpNungRt0l
         A4A41VcYfzc1l0a9E+osbN5riQYGWZgguxnk3fOiwjGWw4N7bs4N/RtqFG5OJK7eHhQ/
         Lq3w==
X-Forwarded-Encrypted: i=1; AJvYcCUNsH4i3CHA5jEYWbDAuH+/9xcByXNAsrX4cgCJBCz4/NrGhKB+aLpB0G8yt0vngeA9j/LyGjRgCtVXJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTV/zkKh2oSuczk/wrqkOy279Nxe9UqMn8ZLoP7rI7DMVYkwZX
	T+bExB45pA9feQNiZIa3K8vCuFAxUSgJ8IWll279Dk8Dx0FMgK3pFh2IXnDPzzIMvw==
X-Gm-Gg: ASbGncvwk58D4v6yi9em/6hRCh5qmQNT+f/vzE1QJa3PeH/DAeBuULjjVKNJBfs1HOx
	mQxcagskqEyzVsff7IaHl+p/ikoYxeHVfIhlCcBu9cZn6MKQQJgvNnEPWeYSDHyxSiM21h2MH79
	lwzJuSaNy+/DSsdi+6A1BFEEEWLpjv0joe53g+0WNAz9zA10JyvKbLeKGzD5J6sNqdRcqv9m1hx
	3Fcg+U2vQHkck2TaHohLKRNeKRM+zfjBgUtVhpJPfwox2/Ws6n8/9iz/V60eiujyot+SauSWAWm
	9ImAr6lI6G9hDIPkQTq0nVztRPOXRNTn5jsYJkC3rwZ0YKb86gpAECqt4YFTMdLRz6LJTyaAoF1
	dosTsTNxQO3mru8bNFWJ1wAO2l5AEmvYwwwBdnQznwvbO1ZLyQdQAPLbNbZn1XK5ynivailaGVg
	0WIoLhUx5XvXKkhgy7aH7JrFvXINRhojZIzqTO0RSGTKzndTOAozokUmg9upK8ZWFJ7vPc1Ygxc
	bsODVGnzpd7UlNYhslJ8mMXq/P+lDKzqAcF/RpcvdU3YOyXbvTMhlwEwvI=
X-Google-Smtp-Source: AGHT+IEXnqzqJU2/xSKNSNb5/bUNtAFElTLMyvo5uXdKTcAl/HefKl0i4M7zof74OyKG22fyZ0IfKQ==
X-Received: by 2002:a05:6a00:80b:b0:7a9:f4e1:51fd with SMTP id d2e1a72fcca58-7b7a4afac13mr3390566b3a.17.1762948759071;
        Wed, 12 Nov 2025 03:59:19 -0800 (PST)
Received: from sw-TUF-Gaming-FX505GU-FX505GU.. (2001-b400-e2ac-65d6-840d-05d3-e7aa-72e2.emome-ip6.hinet.net. [2001:b400:e2ac:65d6:840d:5d3:e7aa:72e2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b2c83906e5sm14278922b3a.71.2025.11.12.03.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 03:59:18 -0800 (PST)
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
Subject: [PATCH v3 2/2] HID: i2c-hid: Add FocalTech FT8112
Date: Wed, 12 Nov 2025 19:59:05 +0800
Message-Id: <20251112115913.236498-1-Daniel_Peng@pegatron.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251112195751.v3.1.I894dde5015f4acad94cb5bada61e5811c5142395@changeid>
References: <20251112195751.v3.1.I894dde5015f4acad94cb5bada61e5811c5142395@changeid>
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

- Modified the subject to include the ID of the chip as suggestion only.

---

(no changes since v1)

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


