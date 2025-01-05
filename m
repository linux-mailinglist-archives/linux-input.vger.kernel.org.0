Return-Path: <linux-input+bounces-8897-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A7733A01B83
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 20:36:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FE3B3A3356
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 19:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9C371CF28B;
	Sun,  5 Jan 2025 19:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bKevc8PB"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD671CC8AD;
	Sun,  5 Jan 2025 19:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736105799; cv=none; b=Ydq5llWv2R1ZThTJJuUxgLKaJFXTdDtbjwasBkyFZFBTtxgfE9XhSXyJtf6E38WhVauSkjU+i3fS9T4w/XWN9AtWUNODofNEeLCOwR6wpYet8MptPdpQW7lfGF/50s2tFamcpszAyKFxrGNGbcWtRUKPa2idhAQnmeNT+B+dxQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736105799; c=relaxed/simple;
	bh=eJ/IPvw5UT6F1TJJeyixqWwLsKzSSiRHTTNylaWJIo0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MyWD5WyaT7iWFMhdU2X4GYpero/jhleXF/9o1YPn2kZqbfSgt8UTi2gXftHZKt0snyQo1ZbGDcRHywjCCqm/DtHOSlnmymEtZRaKJxr4/+0h3N4Dutk1NuK0F/WImmVOF0EqvhJz3epf6vuuoPo0MS2I/oTPelIB4wcDsQiEKJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bKevc8PB; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3021ab1f26cso15368601fa.0;
        Sun, 05 Jan 2025 11:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736105796; x=1736710596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ERMQSDSSP4kaB35zxEBbEdMyWN68eRlF2X7GLXmoNs=;
        b=bKevc8PBttJt6cEmXdWom0frtW+q0hBqD9m2rPg1Si5yA0YkqcVjdQT8Zgdwc8MjWf
         LHK+9Tce7MQRtg7kG/qcrLvfpqmSbgGJmCH9PIqGzsk51bunRZLTtsR/vAdxDBOxlabL
         NylkCll7nc+sxmOD2xho9Is2/gMCGhi7Ky9IhAS6bGtnGNlejCsw/VhqqCGtRU/d10RX
         GLcwBJ3QoBbKCFGSGMMwMx08I4EZF0lU6Z4w3ZThRH+Uj1PvwKT6cbigzbbFrVaTOvfk
         1FIPCYzd74EULff8MU17KTxoGzm/e1nJVgRXp7wcb9Sbs8Wk5mvK2jWmjr+o88XFXRoM
         LPOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736105796; x=1736710596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ERMQSDSSP4kaB35zxEBbEdMyWN68eRlF2X7GLXmoNs=;
        b=UVGZOoHbrL0KZTUH6Fr+7k5p/CrnkODV4k302bSfYAb1vYzhHQwlcv+ui+mLLBSWpy
         dBOQoYZ2e2wFeWjFEIJ/qk7HxamYYvtQOr94s8IxlZqYqp2s7CwlFid46vg5gI4NidN6
         pjIO4MPqvZhksTwojmbIfYCoXl2Yxs3SgpGih7YxRAO3g4VJB3PKLsaNnifzdhtxDLoJ
         D4/WQ4Xhlt2CJHeVDjWAesGim5KqiE9qIK7NOUDTW4g3dgwWsnE6vXaZE6Mwses4dBC+
         Rdl++3vPgR983AB1hPNmS7/zpP/Yi3M5jqa4St2PArrjgxHbBrfqHmqnh3huECthZuPy
         aXtg==
X-Forwarded-Encrypted: i=1; AJvYcCVCFtYpqIExaoU46F7mFy3MtPTjV0ULlSS7UoJZLOx7ITZL/DTZxJVnr3kyoAKvrEOj9y9fgplVzGo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq7DXjR7usPHJmLur1V18ZffYs9lyY7whEn5rmZTe09lFRPYSq
	CaOUzsNHRVTwAF2WoGgezXPi1lIuJc3vLlKLSIgz37NZuP5TVu6E1Hy3zPQf
X-Gm-Gg: ASbGncsPYI6UjLHpAEznL/bUCCHHhNE/GFddbDXo6zrWUu09aMjSC8AgpW7iIVjRLI1
	B0ggvBii3QCa6itBRk+u8S11MEC5Yo+ntzIkiYEcH8GTHDAbY31dOOCjUyXfbrv1e3PAehWRYpj
	Prj/IxbM/SkKxIg/iF3TsfENwSxmUrRXCqnIRg7XuauD2JE4i7wG5Fwq+71ONehr34+nYGRrn1r
	EzlC+pNDVsdol5v8Bu+5HLWzX1l4U2EZmf5viut1Figxs+32Vm53fU8iWUIi6cZl3wYtyj6caHf
	k5hglpBz9PXEDNgTNrhK1au7CUo=
X-Google-Smtp-Source: AGHT+IFtjRclYDq8z07Hyfke0rgGhtfbF7FZRnVOBIEMHUVzEn2RvwkcWatqOogr64zfjbfAxd0gvg==
X-Received: by 2002:a2e:a551:0:b0:300:38ff:f8ce with SMTP id 38308e7fff4ca-304685080c6mr71315581fa.2.1736105795757;
        Sun, 05 Jan 2025 11:36:35 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad6c586sm53297321fa.11.2025.01.05.11.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 11:36:34 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 03/10] HID: pidff: Clamp PERIODIC effect period to device's logical range
Date: Sun,  5 Jan 2025 20:36:21 +0100
Message-ID: <20250105193628.296350-4-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250105193628.296350-1-tomasz.pakula.oficjalny@gmail.com>
References: <20241231154731.1719919-1-tomasz.pakula.oficjalny@gmail.com>
 <20250105193628.296350-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This ensures the effect can actually be played on the connected force
feedback device. Adds clamping functions used instead of rescaling, as we
don't want to change the characteristics of the periodic effects.

Fixes edge cases found on Moza Racing and some other hardware where
the effects would not play if the period is outside the defined
logical range.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 36 +++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index cf8163d92ea4..7af7744e3cf2 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -205,6 +205,36 @@ static int pidff_rescale_signed(int i, struct hid_field *field)
 	    field->logical_minimum / -0x8000;
 }
 
+/*
+ * Clamp minimum value for the given field
+ */
+static int pidff_clamp_min(int i, struct hid_field *field)
+{
+	int ret =  i < field->logical_minimum ? field->logical_minimum : i;
+	pr_debug("clamped min value from %d to %d\n", i, ret);
+	return ret;
+}
+
+/*
+ * Clamp maximum value for the given field
+ */
+static int pidff_clamp_max(int i, struct hid_field *field)
+{
+	int ret = i > field->logical_maximum ? field->logical_maximum : i;
+	pr_debug("clamped max value from %d to %d\n", i, ret);
+	return ret;
+}
+
+/*
+ * Clamp value for the given field
+ */
+static int pidff_clamp(int i, struct hid_field *field)
+{
+	i = pidff_clamp_min(i, field);
+	i = pidff_clamp_max(i, field);
+	return i;
+}
+
 static void pidff_set(struct pidff_usage *usage, u16 value)
 {
 	usage->value[0] = pidff_rescale(value, 0xffff, usage->field);
@@ -357,7 +387,11 @@ static void pidff_set_periodic_report(struct pidff_device *pidff,
 	pidff_set_signed(&pidff->set_periodic[PID_OFFSET],
 			 effect->u.periodic.offset);
 	pidff_set(&pidff->set_periodic[PID_PHASE], effect->u.periodic.phase);
-	pidff->set_periodic[PID_PERIOD].value[0] = effect->u.periodic.period;
+
+	// Clamp period to ensure the device can play the effect
+	pidff->set_periodic[PID_PERIOD].value[0] =
+		pidff_clamp(effect->u.periodic.period,
+			pidff->set_periodic[PID_PERIOD].field);
 
 	hid_hw_request(pidff->hid, pidff->reports[PID_SET_PERIODIC],
 			HID_REQ_SET_REPORT);
-- 
2.47.1


