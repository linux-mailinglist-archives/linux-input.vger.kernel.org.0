Return-Path: <linux-input+bounces-16070-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8C5C55E0D
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 07:01:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 127FA3AF8A6
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 06:01:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECFCB30E828;
	Thu, 13 Nov 2025 06:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pegatron-corp-partner-google-com.20230601.gappssmtp.com header.i=@pegatron-corp-partner-google-com.20230601.gappssmtp.com header.b="u97d0xaa"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DB330DD1D
	for <linux-input@vger.kernel.org>; Thu, 13 Nov 2025 06:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763013672; cv=none; b=e8JWS/PXzlBUsFxQv6pLvdVQ0pXS3+PClYIoKtPgLDIysSgvdMt/k/9JiNbetH6K6oHelWolKapa7Apt0UUi4Iz/rREZWB17RNdIL/KQYw/NSJlt5R3hSmhmEA5hQEPGJjLUB2u6i1IvcxiaXVTod3oKzzpgG02nGGtA++fzo44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763013672; c=relaxed/simple;
	bh=dK1xl/b4UAoLoRrQeXXRCzK/3igVQI+rfeqpFOBRBT8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dFDkvyax4ylQZ1WVE259r2EvBDlty+QeZS1TtuYQIKUeuhR5uhFIosd+UallHPAHH0vL/XAXP52FTiN0VcMHrXiY+FVy1HwL7F42buUm5ZlJdZ61c4WOrUIftEAofk/t2Ut/Vl8q9LCM8aB9pPWJ4PI7QAypaYxe9o+eDTXpnl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=pegatron.corp-partner.google.com; spf=pass smtp.mailfrom=pegatron.corp-partner.google.com; dkim=pass (2048-bit key) header.d=pegatron-corp-partner-google-com.20230601.gappssmtp.com header.i=@pegatron-corp-partner-google-com.20230601.gappssmtp.com header.b=u97d0xaa; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=pegatron.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pegatron.corp-partner.google.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-297dd95ffe4so3299385ad.3
        for <linux-input@vger.kernel.org>; Wed, 12 Nov 2025 22:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pegatron-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1763013670; x=1763618470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vtc5CAsvdgOiMhBgxUV1K6Ck9xfWTjWbN3Ak0NXS2tE=;
        b=u97d0xaaRhIcnWt1+zjrZkErsNaUT2GyLXd1/a1/EtJRACAwDBmecqOJYjhNxX9RmO
         34zptihja4xnEK+pCWNs5T2rpkQFpxbbAaFFvDgG2ZZuL3zKr/FFNRlG8azLXpXDs0Nv
         NgDV4suIBc+SWNze5GmCD+iPjkon5iAYnMdIuLj0J9Ju3xtqM6v//3jd3jBwWHMHxQh/
         4TmyiPMWtKjC4DjOpKVNolOPeMIwgo5+0dBiKrOko/Mg3x7E/QHqk6flir+J8+0YTIMU
         VsUAknnUucHvyi1PwueU8NGHU0YyjjKLZ28Do7xwRxPJ4ZIhVJaemKkuDsDnLh/Rguun
         FEIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763013670; x=1763618470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vtc5CAsvdgOiMhBgxUV1K6Ck9xfWTjWbN3Ak0NXS2tE=;
        b=Ti09LZ2Tza80k1zD3SkaR0q+ls5BD8BGDxBgMJyX9KIOT8P7r0AM0uwZpmGLQ4lSDs
         8vPQr9KbeJTO2NMQzAFwwn3BIkxBZioNwBV405vukQ+7PjIwZeLut/wLLqJGmRN7nHDd
         JWDE1P0SRNW+UECLIVZ2RkmQJlZYsPdcwX1QBRKngOYvytZsfOu93e4BCzTEuxzx6cK4
         y3kjxJEqfbWkOuy+az9qOT++qa3yBfcwdu7ef0oA839Gi82PMCIgTk7BVSEN00EU+bWC
         I1Fox7b/BLjUzARFVDvFyePkT1oZKApjPucWyg7VfpdA9hjHydEY2sK99CZj7GVclEbP
         MLZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvIIEtZrow07UDbo9S1PSu86FWgRJt6UBKuE/Aj2kpFn3qJ0dW67lgU9eFKBGf/HgnUewDTS2uZciP3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwV9KPOoY6QVjDqN5pZqgY29t3tYUWytWz+nP+66Ag/m0uwF0t/
	kv1d+cZes/c5Tix7rGL5SpfbOh11yhs3Ae2Eoi/MtXYfORBmMKHuGxgh2tovsvBpBA==
X-Gm-Gg: ASbGncs6n5G2/676qf0bUm1vKkCJIRjMpCWL3b/7TWUREqErOn41eSisHjnlOqyo6bC
	X+HCRPGg5ZNG/3zH+3OYvDnbCQYDq32tuk96s70ceuoMdpfhvn3qdWaruAROHwU9KZ9UwL7nPO6
	iBsxXHihz3blN5u14sFbL9LMhV4/fNR9wI2fBfl4hRn37fgl5f5dFepjOxg1A0LaUd23w2E6JD6
	Pbq+b/uya2SfRvge7M95tJlFb0MLj6ENbZrILeS00DNeGqE9Yx7Lh8T61m951KLQKWDk1LZEXG2
	6jrxoRllTbQK5I2ZY6QR+fSgZxjKNIcSGznI54OAmfVv/Dr6PoKjwvT+J4j0Gkttxdg1jqylT59
	DJwxT2qWOep+ev8bDaoqHpJAEznFzQh6zH7fyo+Ze3mLh6njxwg7xuuH6IKZujiyNZXRsAoJlhj
	DBdTteXx+yT1DF+TORUW6at9sXYmR2bL7UD1qkADdF5mUUD4uU/puL6jhzlaAG5kr2gq6mtGXz0
	xalyHOUqNYK/63rf0XOrMGeeU4qH8xqAXexeNxoqmgCKoAwYmifqd67ulE=
X-Google-Smtp-Source: AGHT+IEOgW4WzLorfiWS9/h3w8M7CE2tcP0SiXwL7rWvnUnBimo+o7EywxXlHxzo6V2dxOtii5Q+gA==
X-Received: by 2002:a17:902:e80f:b0:295:6d30:e25f with SMTP id d9443c01a7336-2984edec6e3mr72860045ad.53.1763013670222;
        Wed, 12 Nov 2025 22:01:10 -0800 (PST)
Received: from sw-TUF-Gaming-FX505GU-FX505GU.. (2001-b400-e2ac-65d6-f289-5b0e-1295-0dbd.emome-ip6.hinet.net. [2001:b400:e2ac:65d6:f289:5b0e:1295:dbd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2bf158sm11387535ad.91.2025.11.12.22.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 22:01:10 -0800 (PST)
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
Subject: [PATCH v4 2/2] HID: i2c-hid: Add FocalTech FT8112
Date: Thu, 13 Nov 2025 14:00:56 +0800
Message-Id: <20251113140004.v4.2.I47e9f0b76399e6009854dec06420c20e68e23116@changeid>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251113140004.v4.1.I894dde5015f4acad94cb5bada61e5811c5142395@changeid>
References: <20251113140004.v4.1.I894dde5015f4acad94cb5bada61e5811c5142395@changeid>
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

Changes in v4:
- Move change log of v3 under "---" correctly as below 1 item.

- Modified the subject to include the ID of the chip as suggestion only.

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


