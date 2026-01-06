Return-Path: <linux-input+bounces-16796-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0280CF9042
	for <lists+linux-input@lfdr.de>; Tue, 06 Jan 2026 16:17:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ACAFA3001872
	for <lists+linux-input@lfdr.de>; Tue,  6 Jan 2026 15:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31DFE322C98;
	Tue,  6 Jan 2026 15:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="FAJlCPC/"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1A8322537
	for <linux-input@vger.kernel.org>; Tue,  6 Jan 2026 15:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767712325; cv=none; b=ml/l2oXOFoe/f31hlTA0ZD3v5p5B4f1jg2slxVovc6WwOUumUEDZlx8LvjUu5oWAbkQ7qiSPlKF1wADSQitHt5xQdVr/0aA39tWwHSLPCbGkTMaSxPnOjZF/UfE4aLS44sHPJ7LWZ6H6tEK7NVMMFe/dgVFhOlFRkJHH/U32xiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767712325; c=relaxed/simple;
	bh=lpaMuxGm+nAAUVPV2Xqul6ts+uoXYotpYYO4SyPRPHg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NIoc5Y/76bUD7gZya0nSy7o4e8WT+L7bt6awje8TV7Nk3JOJFEHjNRFaLA0fARi1rIWb0z1nEbdmYxUy4g7bykT4qVlQnYnmkPQEge1SGoyf7bRUF0Eur0T52oZloXZTCTZBOim4PZsgRFPhMCFk5GSc4qKAlkDqyCck9zJb/Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=FAJlCPC/; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DDD683FE57
	for <linux-input@vger.kernel.org>; Tue,  6 Jan 2026 15:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1767712314;
	bh=L9WWH4LffCWROWB3ezrCvqsUzXP0PqhvQzV4sVOG+Lk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=FAJlCPC/8dEokbmoUag0krjkgxFE4rcZ3aNIoU6M6KUuc1iAgsCigFuUfHPCeA5Ud
	 l8C16i47GQHXOR48qVTA2L08gDCf+/AFrjIImMSPs/HOUCN9cbLAhPRqWt/d8fJ1UD
	 5MXnEHxchJGJHh3SqhNlFbaGo1aeqt6hpptfp+2IhJxQSAwOT8ogXTOlcOBSmb1c5l
	 IC/tGKDO2/gATUEoAZuzK8g8uC4in5YKbUtjP/E40wZrhqlKBV8fP1DsdSgxsFwq0h
	 +pzWcrIhu5jNLdEyyol3YOLEvziTrOLRDdk89QteT57KWT9yH6ZaGv/+K1GNFO3eLa
	 NmxeWA1HRiKVWos3p4g0qED1nEDfFpW3UeSVhhFPzM4CcpSuoom3HsfTWWpQDauTY8
	 CIH96o8QoQXgFQcRvqRSphg8taVDxdUZdh31d30fb8EdPTzR8yrneAwJgUKvi0mpZI
	 tWwclTpNLnRpd7AwntGUsKX2cV1ed7ZfsqJovWW0sBKKtUVbZMbjHhpZSuM5y0fsje
	 0B7Wk/N1hUg3ETjhoQ15XaR3QwT38rpLchmeRM85WoJLUbCEK0nnUnu0ZnMf5u3eDO
	 RsvLTfGNyuFEstkx5jmGdRqm7aYMvRSd70JwfG2QBoP2h9XPtlb4rfYvGONYZ0RZXw
	 YHzbsFcoeaOXFoGeijWNpmZk=
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-47a97b719ccso6668945e9.2
        for <linux-input@vger.kernel.org>; Tue, 06 Jan 2026 07:11:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767712314; x=1768317114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L9WWH4LffCWROWB3ezrCvqsUzXP0PqhvQzV4sVOG+Lk=;
        b=g0ASOsn4CloSfFL8GwmmEjQGF+avCBi28N8vQAVvB8pzQiy8l7OB45JpvvYvNrt0Ti
         DRFkKVaV3ymemj5RJUHAcUuIZ7iiPA20ytAR8XLct5i6ySbWyK1tQ+PJGdsochqwp7GO
         PaDqEbnc35Aofyd1Ju9orRNjUbQHVie09dl+M7zZHqa4gEkmaYArCo8A2YxBDVrZ+SeL
         0zefKvTd5dER78enJOUmSFIZirvJuFzHZ6t1BuGDt5cjVhr80lFJEP01H3one5jh3I3q
         uFRZkn2aC9WY9ANGDl7kngJYQ4ErIc8aUAv2m9LkDgbY4cHejog6cAK482zokn5BvX+d
         gtow==
X-Gm-Message-State: AOJu0Yx/x+U1fmobIAsftWN+eQvQBoA3UY4DrJc5H5/z3Dv7vfN5G8Rh
	en1bEX44f9C6HhAaJ2PwTbQIjA4NWfrziN5yiDQ3NW/qHg3Or0zdPjlXMWdPFKAkw3FZ858L8p1
	RHb90PBBliyfPJ5fJnv5bxR9ZJ/MSAV+HQWovcxwYXmKJ2ejheAbFEWqKnhjRvCO29pTuX1wmsM
	lWn4ID
X-Gm-Gg: AY/fxX7VBd2rZpEt6DYv1GRZO6nJ4s7Z+01E21P/p/aXcoczh2Ju40S6mhEbDSCRcki
	CiMzomr2M7kSiHC3et0QqkiN5/rOareaHxJ/v6Za70uUHlfckVF6964JEZTwhoHJhcvbT545R0Y
	hw7eX0Gawab8lO2a50I4m4WBPXHjp4IIH5bw7PVoWX74mULud+WhQi9Gay3ejCOhHrGxEo8rh1j
	vpEzzhMCi1T8p8B3UI9W8gucc/8FeSLXzSy1g6ZqipY3Bx9I4tZEM0FNGAncsgglpTZLQZ10Jzx
	OcjqpQSlqJDnTc9Fj4Wk2MgCWMjqB9Nvgx9yL29EAFaGdrQGG79HcFtXBFrhq7ZzCuNOOty/EVD
	3mv/FExWURkNPw/mL5IOVxEjxuft80dw0VLsBs6RgEFFzFgn0fLZaKCytQTgEfwoL
X-Received: by 2002:a05:600c:1384:b0:47a:810f:1d06 with SMTP id 5b1f17b1804b1-47d7f0651c9mr34884465e9.4.1767712314423;
        Tue, 06 Jan 2026 07:11:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFdp+2xr9O30bje/W2RUJjlVzn7EHWAbqp6hqYczXuZzaSKEFWWSIbeEIG2XLEUn5vs3XX2zQ==
X-Received: by 2002:a05:600c:1384:b0:47a:810f:1d06 with SMTP id 5b1f17b1804b1-47d7f0651c9mr34884145e9.4.1767712314004;
        Tue, 06 Jan 2026 07:11:54 -0800 (PST)
Received: from localhost.localdomain (211-75-139-218.hinet-ip.hinet.net. [211.75.139.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e199bsm4981983f8f.16.2026.01.06.07.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 07:11:53 -0800 (PST)
From: Chris Chiu <chris.chiu@canonical.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Chiu <chris.chiu@canonical.com>
Subject: [PATCH] HID: quirks: Add another Chicony HP 5MP Cameras to hid_ignore_list
Date: Tue,  6 Jan 2026 23:11:01 +0800
Message-Id: <20260106151101.3775332-1-chris.chiu@canonical.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Another Chicony Electronics HP 5MP Camera with USB ID 04F2:B882
reports a HID sensor interface that is not actually implemented.

Add the device to the HID ignore list so the bogus sensor is never
exposed to userspace. Then the system won't hang when runtime PM
tries to wake the unresponsive device.

Signed-off-by: Chris Chiu <chris.chiu@canonical.com>
---
 drivers/hid/hid-ids.h    | 1 +
 drivers/hid/hid-quirks.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index d31711f1aaecc..e8a1a86313b74 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -317,6 +317,7 @@
 #define USB_DEVICE_ID_CHICONY_ACER_SWITCH12	0x1421
 #define USB_DEVICE_ID_CHICONY_HP_5MP_CAMERA	0xb824
 #define USB_DEVICE_ID_CHICONY_HP_5MP_CAMERA2	0xb82c
+#define USB_DEVICE_ID_CHICONY_HP_5MP_CAMERA3	0xb882
 
 #define USB_VENDOR_ID_CHUNGHWAT		0x2247
 #define USB_DEVICE_ID_CHUNGHWAT_MULTITOUCH	0x0001
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index c89a015686c07..3cf7971d49743 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -769,6 +769,7 @@ static const struct hid_device_id hid_ignore_list[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_BERKSHIRE, USB_DEVICE_ID_BERKSHIRE_PCWD) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_CHICONY_HP_5MP_CAMERA) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_CHICONY_HP_5MP_CAMERA2) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_CHICONY_HP_5MP_CAMERA3) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CIDC, 0x0103) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CYGNAL, USB_DEVICE_ID_CYGNAL_RADIO_SI470X) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CYGNAL, USB_DEVICE_ID_CYGNAL_RADIO_SI4713) },
-- 
2.34.1


