Return-Path: <linux-input+bounces-9553-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB48A1C580
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 23:26:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 955E27A3993
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 22:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C25372080F4;
	Sat, 25 Jan 2025 22:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jf+3xXTc"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1094C207A23;
	Sat, 25 Jan 2025 22:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737843956; cv=none; b=HuD/B+iDlYb8wmGgWtMdE0QsjBWtumpJA0cluNvqdmBrUSBrhR3B4LZ2/rqz5EiQUtYVAu6dB6R6eitKK/dQY0WLKWvocuy4Bez0JWYIfFttO2OvtbXY8XqAmwrHbMcweZOucQrS+VJ/F9sxELurzLaGb4/9zDH2yAQA7ZYza8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737843956; c=relaxed/simple;
	bh=JTNbyozYkpU8RaFUopr3EBgmhUc8+MO5AXGhpGgAFWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GJiBadIP16TCtBT2HKfkk1FGVIY1NbQXwKFMIt5/BxCnQca5lHToSo6jVJNh8GyCT3vcxSwiooL1w9Tx6OFrpv7CiGfLl8b6l3a1kJuLN8dZR/eaPcwBFUaE8bgXEcsIhKuPaUFzbpkWxnyAIzGfOn62aSl6O4IVAK/Wv+XuwCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jf+3xXTc; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ab6915fed7bso13028166b.3;
        Sat, 25 Jan 2025 14:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737843953; x=1738448753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nz4kW3+ysmUKWE68LmWWdv531YWnomtX2sQ2+SoiL0Y=;
        b=jf+3xXTcA4/GfghBoerUMly4bQdZ6j32VNKPKWDE5j3uJm04Hi+Tr93Ugc3RvSPY2f
         pOlSyQEfzLjTOYCXHvRd67lsJ67XzogT/N6HiMuKCzgb2l4cigATmUPULkiJXXAPDBV5
         EhTXdUs/7Ryfey2rmUdfKTFX4NX3RfbyzNJZvFlxwvSjw3AMKvqa27wyD7y16RI0DXuM
         bE/qey4krWX6qOl9zbn7NIsxXx4V0Qa8HdidDslf2mGrTV6I9byS3nLhyxiAAtvVBOVO
         h208oRkowJiy3C2yL3UlqetmsfYP92aBmxRFswlkRZjjv0iqBa2gStGuUFp80AiXhTXv
         SE5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737843953; x=1738448753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nz4kW3+ysmUKWE68LmWWdv531YWnomtX2sQ2+SoiL0Y=;
        b=XbbMk240FUUhIFEHeGk+cjhFFoxZLeC7w8+MAokhfLtjWAVhcqgL2FcCqz6/c/2ABd
         Br5IT0tQhfpHz9q3tVw5wi1y4Kdf7Sdorz44y5L/o8tMzNvDyJohoVv+kWuWXFanNnjq
         VFkUV5S49W6+ezM3RtaTdRmDMJLXwutDPfhsVPpCZpYfOD7AKdqOZarCKzZpXepTMrsL
         vzvooVbfOSUJUuoNsLN9EWu0QxNWnpopNwIRk+OU4SUYlj74qP2iFnUpS8jKEp3smtfL
         Ar4nEQoJMCX6mw36WP5zr7hafaOKI5PP3ZhDPpj0/WkCqveC9pcL1ELycbd/xCgdp8hx
         URvA==
X-Forwarded-Encrypted: i=1; AJvYcCVkEh7KUJZA9TCVPsuENyXAIHcJJDy70urrjztFtVBkFMOWsJWxBlbxQMj3EPlaZeNY9izIZvwbKT6v1Q==@vger.kernel.org, AJvYcCWmURWzeyAiDaML/J6NT2DfY5f2L/wPzEFD3kW4DkKXLofxk/A3wQZcjpOOxrdff1Ou5cCMzLxoHL5S@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+MrPB/sZYx72f18W014kVzIFZdyhkTNZbTga1LHc5NTYgPPT+
	lqaDCEfrH5Jhn5Wdkx1fc1JjXy40s0Vr9FL63651GdA2HCYK2qy+
X-Gm-Gg: ASbGncsohfy3Z6h6QiELHvBnWK5ZPqST3tZa8XF9LGvWs8xUdZnWGFzijfItQ9eiAhg
	cHRL0/pow5IrBQIbNs0oSCc8LkSGy7KnTE7SmXh0RUEuyjXF2nulPP4xuwJ3ztkzj8xn7m/1/Rl
	EeZPOD8bJrhD6MuzecrK+jKLdftLGknSFpeV+RIDW12qVjkVv3wdLbM6WcueJPdnWN3PEhMAlhS
	KiJJOKb72opEC8l3icvqN/rSaieT2L4PFSfSm9sNPNuAT8eVAAb6L9R3YSdhYfvPz29JaLUm8tv
	8SRn+bhozhEK/J+xVqpsx9CEXwPC+yaFn8LKp2fQ+faM8eqDJ2U=
X-Google-Smtp-Source: AGHT+IHRLykiGTDbib10tG2EJCzaSkx30k9VH7+qqxp1YzvqWRd30yvUc7C3/BfPKK6wRjARcjInVw==
X-Received: by 2002:a17:906:3454:b0:ab3:17d:bbd5 with SMTP id a640c23a62f3a-ab38b4c6b25mr990660166b.11.1737843953224;
        Sat, 25 Jan 2025 14:25:53 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab68f1ef7besm136540166b.62.2025.01.25.14.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 14:25:52 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v7 17/17] HID: pidff: Improve ff gain handling
Date: Sat, 25 Jan 2025 23:25:30 +0100
Message-ID: <20250125222530.45944-18-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125222530.45944-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250125222530.45944-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Makes it easier to set gain from inside hid-pidff.c

Changes in v7:
- Check if device gain field exists before setting device gain

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index c8a60034d477..436b8e9b37af 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -525,6 +525,19 @@ static int pidff_needs_set_ramp(struct ff_effect *effect, struct ff_effect *old)
 	       effect->u.ramp.end_level != old->u.ramp.end_level;
 }
 
+/*
+ * Set device gain
+ */
+static void pidff_set_gain_report(struct pidff_device *pidff, u16 gain)
+{
+	if (!pidff->device_gain[PID_DEVICE_GAIN_FIELD].field)
+		return;
+
+	pidff_set(&pidff->device_gain[PID_DEVICE_GAIN_FIELD], gain);
+	hid_hw_request(pidff->hid, pidff->reports[PID_DEVICE_GAIN],
+			HID_REQ_SET_REPORT);
+}
+
 /*
  * Clear device control report
  */
@@ -852,11 +865,7 @@ static int pidff_upload_effect(struct input_dev *dev, struct ff_effect *effect,
  */
 static void pidff_set_gain(struct input_dev *dev, u16 gain)
 {
-	struct pidff_device *pidff = dev->ff->private;
-
-	pidff_set(&pidff->device_gain[PID_DEVICE_GAIN_FIELD], gain);
-	hid_hw_request(pidff->hid, pidff->reports[PID_DEVICE_GAIN],
-			HID_REQ_SET_REPORT);
+	pidff_set_gain_report(dev->ff->private, gain);
 }
 
 static void pidff_autocenter(struct pidff_device *pidff, u16 magnitude)
@@ -1391,12 +1400,7 @@ int hid_pidff_init_with_quirks(struct hid_device *hid, __u32 initial_quirks)
 	if (error)
 		goto fail;
 
-	if (test_bit(FF_GAIN, dev->ffbit)) {
-		pidff_set(&pidff->device_gain[PID_DEVICE_GAIN_FIELD], 0xffff);
-		hid_hw_request(hid, pidff->reports[PID_DEVICE_GAIN],
-				     HID_REQ_SET_REPORT);
-	}
-
+	pidff_set_gain_report(pidff, 0xffff);
 	error = pidff_check_autocenter(pidff, dev);
 	if (error)
 		goto fail;
-- 
2.48.1


