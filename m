Return-Path: <linux-input+bounces-15989-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BC9C4BB1B
	for <lists+linux-input@lfdr.de>; Tue, 11 Nov 2025 07:39:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4E15C34E326
	for <lists+linux-input@lfdr.de>; Tue, 11 Nov 2025 06:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BA042877D4;
	Tue, 11 Nov 2025 06:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pegatron-corp-partner-google-com.20230601.gappssmtp.com header.i=@pegatron-corp-partner-google-com.20230601.gappssmtp.com header.b="R8PlLohW"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1172DE1E0
	for <linux-input@vger.kernel.org>; Tue, 11 Nov 2025 06:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762843157; cv=none; b=IhP4fP8lOO5C5O9c0gJzcDOAz8RuSUpn1XmR9Bvvk7ZI1V6cqMzo/q9Y6BJn/oJKDYLgIpU3kLWEpfom62qwg1sdpHjw0ZrSzbd6Nzprh+hwkG7d33b+Boe7idSzAbFj6VTmTqTbzPp7ui7tcKCvb258btJHSg7AcDVcTC1lzgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762843157; c=relaxed/simple;
	bh=TdjJPkz1hWo2r9tdrjV8C9i3Ye3pn22Wmud56Ap24AY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tNWBxvakoLI/707BvZ3DF0g2l6AaEKiVtqyzGCL+zrr8ZUbIPuP3iQBp+PZQM5tA0WOijD0ttETIY81EdEPPgWHUS4I4PqV+1Eov6kqcq4sORG91D6x5gDDJDQXBq2MFa7ThQFW8l1EAgtoff0rsbt6jayir6/hxFc7aAlMHpBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=pegatron.corp-partner.google.com; spf=pass smtp.mailfrom=pegatron.corp-partner.google.com; dkim=pass (2048-bit key) header.d=pegatron-corp-partner-google-com.20230601.gappssmtp.com header.i=@pegatron-corp-partner-google-com.20230601.gappssmtp.com header.b=R8PlLohW; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=pegatron.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pegatron.corp-partner.google.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7aa9be9f03aso3371252b3a.2
        for <linux-input@vger.kernel.org>; Mon, 10 Nov 2025 22:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pegatron-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1762843154; x=1763447954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=539HVCzYtsPJqOodyacxfczakrCXMmx5hlTcSg4yU4k=;
        b=R8PlLohWxJyJ8CzCuZ+ixb07hR0uJ8l4mNwtyyb58oir68o5p+kek0JrhFJcsodmdV
         Hbq8FeU1z/Zlr8BM0oylMJYaY3FRO7VLI7O3bJhr+if+9TeXHS2CZPygbzOAP60z7Esm
         xS5V97sC0qOOkklZ4chbRqsjj0G+QZlC5/iPO3fbzNKp0Oef+AxB25MKJETn8YVZ+HBa
         JqR6alkDATvkUYfBlKj7PdH+5VrcmlpdJTLaAXrc83agisTNemoZKIeuFlUvKlSb6YDY
         Afp4k3u2k7Z37psFafPzqHYGsviIVO7Yzyx6U9AucShtk7FFGfY8/aio2K5HQYylEkxm
         8GQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762843154; x=1763447954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=539HVCzYtsPJqOodyacxfczakrCXMmx5hlTcSg4yU4k=;
        b=P/x8cee5cfV7v5ySJ+peK7MApn3jfiQ75lQ5CqnOxnBoC+XZc5wNHTgrNiXXRLTta2
         x/MnxVKAl1lRuNhvkND5dqpYZeRtQ6kmwv+01OzjL65DeYcuq1722DjR3qS7FGSn5JnC
         MMfqBTH+fezPrTyHKxKlintfSJQSXiCMH0iVE9KG9C/+x91PZfFE8atYGxJDLqHJBC37
         16BVo8pCQk7U4RyH4ImajFRPqyCp2dhAzdL0XKQ2HhUgPpaGCX3wrJ8VXkvCCH1wb7hP
         Ya0sRshfr513x2BB4LX1No0/HNs1G/OVMtytiF5jSoHQinPtWLXdJEfY9Nin0BqT4IRW
         t+7w==
X-Forwarded-Encrypted: i=1; AJvYcCXH2XOGOi8V/VPjziKApjjrmjIRABsVg1W1lmiK99hzzj2dFxCDtQKDIlFaLZXVmjMeUsmxyN1zc+gnLg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0FV+k3mXre+QEy2hdQJsQRwwtEOwbwtLeP0X425U+svrO3u3k
	XqlvrmCQjosUaU+loKylpnzetAlkT/KxKgGLiJqsVK+tkPK8NvO5bRxVPmmeaNZwsw==
X-Gm-Gg: ASbGncvXvoIr6yfCiLuAHEfjYbzRChtiTQcrjoEmz8YbDibrgLjYVNpqB+bxmQxToSo
	j0Z3qh98Jr0IvQohPctBSrzP/MUIqPJIB2+C8cayiS0J+swtTETab4KP7RK06nOqA3C+qyAGEEB
	whIsawbqRN8wa2HwNgPePbOJg6zEw8FcOvS1DZ70UNh4D4gseAgkCNkcPj9LnR48d2kaNBqJQR4
	1TqTa2DO4mo/JN91QGIdo1+hkf15wqCpLg+mV/qZ+oJbGot1noEZTtT8+NB9NOkvIJBxyger+/S
	vJCUatlW/TW1iExQQIXPjVkExCXCBgobmCePcIxUMJDCKphc2vEUXkNa2F4eCtV8KDsSHE0BMfU
	KEFben9cQybRN7WTZonAAVqPMKg/q5gx124Wg86p7pI3HKlKFvE3vef8Ck42Qlge50BHCrizno/
	cApPxy6hMLIraoU8/Gz8TcfGOa+spRNgvO0lm2TS1HJNbdRvpvyeh/cgEOLblp9cQx+Q+4mDUUG
	wS30X6wkRNhDcdSB0ABGMYcdyDQahncLirpdfzwDGerHi7muCvR0tXKAGMmw0t4dhKy1toM2HPf
	470tNA==
X-Google-Smtp-Source: AGHT+IFnyvDO6og6u0YFAeJesypLmt9qZ8k5II9mY37Op7AflPX2kiUWHuLaWAwwgHYe4YQ6X6SjXQ==
X-Received: by 2002:a05:6a20:9190:b0:34e:e0ba:7bf with SMTP id adf61e73a8af0-353a13a8e4dmr15478583637.1.1762843153952;
        Mon, 10 Nov 2025 22:39:13 -0800 (PST)
Received: from sw-TUF-Gaming-FX505GU-FX505GU.. (2001-b400-e2ac-65d6-f177-1588-49fc-6b55.emome-ip6.hinet.net. [2001:b400:e2ac:65d6:f177:1588:49fc:6b55])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba8f9ed1e73sm15237243a12.12.2025.11.10.22.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 22:39:13 -0800 (PST)
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
Date: Tue, 11 Nov 2025 14:39:00 +0800
Message-Id: <20251111143853.2.Iad6f93df7a4436f6a84ed7b7493fc468c56ab750@changeid>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251111143853.1.I76ee34ac45e1469dbeb11de0d1e47d794af7dc88@changeid>
References: <20251111143853.1.I76ee34ac45e1469dbeb11de0d1e47d794af7dc88@changeid>
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


