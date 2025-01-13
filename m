Return-Path: <linux-input+bounces-9183-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 117E3A0B765
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 13:49:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 101E93A42B1
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 12:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9BC922F167;
	Mon, 13 Jan 2025 12:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EbojYvtd"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A5822A4CB;
	Mon, 13 Jan 2025 12:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736772570; cv=none; b=cjWeZuO445o12b0bE8LF3uYC8017NWLEfPk4YX7Zwjh2B1B2JYjEBjdtUvn2yrT6yj10d3WRhECpvGmrKveHtYIFEcRUYVYIcrWxqy3YdK4HKE8zif77t98mO4M91KXLNtbXz8QyKZDwerfkX8Ty467eoqX1dsS3gGOR9z7m5aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736772570; c=relaxed/simple;
	bh=jDcU44t+RpJaW8DPohsIrrmW08J61xcy+LYp4sKM5TA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RKvuIsXNvtmR2D9tU/6p7+t/mTv5FVvUR4oxWPNjgaXaA+ksVVt+OLRnjvuqexV3ssaSZwe4I3TOSByNYtF3Y8YT7GEMOTBmtoxYNi7bYpXxHFx3AwZRGNU3Bi5nDT8kuUV8Io/Hz6+hxX8/0W7Xe8yr9v5KurtNfFrFZIuaUEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EbojYvtd; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30241e6b540so2731081fa.3;
        Mon, 13 Jan 2025 04:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736772567; x=1737377367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aNNAyMRmshrubPz9yPwpc08vZXKHWV883jBnZhjOG0g=;
        b=EbojYvtdC67BUsaNYrOL+9Wvyzh8lmDZ95mWd70oL8IfNy5niAsgwTHkrFg6LZG3Xw
         gygnpfKrSQiqpNjn1zbLwCFUd8+4nfwbK/EXzj7cjMyhrcrYru/O2FhZI3TaSBVeRNcb
         Ugvxy/ehXaTO5HOkztUdy0SjzjBZ1zn4RpIgshm4lzX7apXoKRo5hAz0X9XiIMSqZFWb
         vLoSihWsZ3cKZHiaH3ivnNmyDTJApQr8WK9JtQBOOQ8KwTdYlkrf5XNVR0jteNi6iXpQ
         sHyUmFSgX3m2/dG6bKlof24a7TKbGjltAKDi9UdzQGNwQtNRKc8GIFOU+jQmg29ahue2
         1/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736772567; x=1737377367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aNNAyMRmshrubPz9yPwpc08vZXKHWV883jBnZhjOG0g=;
        b=ezOZ3BjmNdXIUKRrH/bfO1EEe+s7gb2wzdyvYQxvMhi1psLtma1IRbJwI/MIwA9TI5
         dUkQvJ3Hw/iHnhKBAw2QOxe+oVcgJLZgK07OvcnChctvvL7ayQNYFeDmtPByJMEf55Fe
         /Yz4exDJWw7bugnqJslYZrf5MZddvgwKcBWNiG1jrIN5CDIYcIvnlYWMKhcbgbTcjWlv
         5wJ1rSiylu8AauArMClHW9be8z2slL4bfAicNziHCkodT6+Xqfgy+2MPYUxkRP1J54JA
         hGy0K5o68455JseyvfZVuMKA3RCtwqv79ykpnv49eixdofhJOUfaKnTynkw0ggHtt6FY
         Bz3g==
X-Forwarded-Encrypted: i=1; AJvYcCU4gcUiInKN+C9ZAuVwIACu6WeP6btXI0W8oZbxtblW6SRmUQR0FIBIfMLRaKDTFgNXekhanh2YblBlOA==@vger.kernel.org, AJvYcCU6XFn4OPHy5jDWhQ9mH8RTi9tURoCbZsU4IcKe3MRt3n/kLWwLntDC9yrUiTFXCTL276EwciT+o6S2@vger.kernel.org
X-Gm-Message-State: AOJu0YyWlxG0vyFmlsGuaWj0+SDwSF/nYLPrsYwNVOcd+zhBnbewW1Qn
	trctSGehRnUyTwH4pSvOaWnJngyUZHApSd0QRZx292Ic/v9kj/R0p5vy8PfD
X-Gm-Gg: ASbGncs7TEwJkZkMU6/h+ucsxEpJA4gUgNcyCaSd7OKIlqCngsmwjk3/ArQTUXzGyGN
	wsqWYaE8HdAHtiSoeTR+11/+xyPaHBynsVIYd4Cs44X6oFCDpjepKbQkC7V6edE3AQF574+B43E
	fvW7vKTWH1fWLl70jgVVWjEPOaxCl7eAM+P+eDAnvuj+Anje0RTi67HyZ+kyVL+P05n+DoscG0B
	Icy+HsGMbe6Yb7gTm3D9TTUWmvXIlvSuaNp8hKuS/iGlscb1Teu8mAVWxjgyLcZlZshrhzOxgos
	uodg1NxY9p8z3Y7IUIObmkCnSlY=
X-Google-Smtp-Source: AGHT+IFCqHtRA8LzLykfDnW2G1hxZdh9U6PjruFMBcdicLPTnrhSKu/hLYDMDOa3EJr2nwzIVuM2pw==
X-Received: by 2002:a05:651c:1991:b0:302:40ee:4c34 with SMTP id 38308e7fff4ca-305f456c8camr23719601fa.4.1736772566770;
        Mon, 13 Jan 2025 04:49:26 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-305ff1ec162sm14256181fa.101.2025.01.13.04.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 04:49:26 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v4 01/11] HID: pidff: Convert infinite length from Linux API to PID standard
Date: Mon, 13 Jan 2025 13:49:13 +0100
Message-ID: <20250113124923.234060-2-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250113124923.234060-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250113124923.234060-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Linux defines 0 length as infinite in its force feedback API
while USB PID defines NULL (0xffff). Most PID devices do not expect a
0-length effect and can't interpret it as infinite. This change fixes
Force Feedback for most PID compliant devices.

As most games depend on updating the values of already playing infinite
effects, this is crucial to ensure they will actually work.

Previously, users had to rely on third-party software to do this conversion
and make their PID devices usable.

Co-developed-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 3b4ee21cd811..3899d72a0b02 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -301,7 +301,12 @@ static void pidff_set_effect_report(struct pidff_device *pidff,
 		pidff->block_load[PID_EFFECT_BLOCK_INDEX].value[0];
 	pidff->set_effect_type->value[0] =
 		pidff->create_new_effect_type->value[0];
-	pidff->set_effect[PID_DURATION].value[0] = effect->replay.length;
+
+	// Convert infinite length from Linux API (0)
+	// to PID standard (NULL) if needed
+	pidff->set_effect[PID_DURATION].value[0] =
+		effect->replay.length == 0 ? 0xffff : effect->replay.length;
+
 	pidff->set_effect[PID_TRIGGER_BUTTON].value[0] = effect->trigger.button;
 	pidff->set_effect[PID_TRIGGER_REPEAT_INT].value[0] =
 		effect->trigger.interval;
-- 
2.48.0


