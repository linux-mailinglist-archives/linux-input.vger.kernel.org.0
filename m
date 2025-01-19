Return-Path: <linux-input+bounces-9385-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2952A161F1
	for <lists+linux-input@lfdr.de>; Sun, 19 Jan 2025 14:14:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D0767A2992
	for <lists+linux-input@lfdr.de>; Sun, 19 Jan 2025 13:14:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E69261DF252;
	Sun, 19 Jan 2025 13:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XG3aJcHE"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243181DEFF1;
	Sun, 19 Jan 2025 13:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737292447; cv=none; b=GCJT253nsWwqp6bNgsFFhGZlu33JMbh6+XuQWKIft/5FWCm4lHPHKLojd7yNAeZorZ5ItVrgPhourYfq9WlMtohgQBWC65sRrq+HnL1AWMQ0QceKif9YdxY1VQdlYVmhhn71OnPzWHQ4plS2oSMRE49Xs5itvNu4QuY+WPCjo5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737292447; c=relaxed/simple;
	bh=tX0xwiqubMUtVTEE13a3DRP9BEnROsOPIqV3yaPQzR0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n9WC+ljavdCSRQi2zDeGJDDvmKxP0YeMzuku78C024ktIvlYOJ0PGi+TxDo3m1OB2SOkfRdSP4b+cP4t+0WG455B75uSvXkovNtIjUW3TAzme7sCCtoXbMtX465To502VD+cfoUJcZV/clDUwE2SgQrDO6B8MkYBdA7YlZE2XXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XG3aJcHE; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5d3ce64e7e5so555986a12.0;
        Sun, 19 Jan 2025 05:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737292445; x=1737897245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R4vjqbs4sDqi11WPqww56N1NIcuf8IdhEvhhCCLSYJE=;
        b=XG3aJcHEJAxk4D5ukA4kbARwNIngvzpMCjdix4kFIg8B55yWGTLnnCANpQxKo80Vfu
         pPQ+KX95AbI1J9SKsgfShLwWYo3SGx2XcXWPbZZq9KM+Z/2LHwrvYAjccGhJFeaaFZNU
         Sl6vgJznjr+3wD5OlXIIFH3vwRxU8OXnFLJCtDJzr24H3o9t0FfiNLMyKlonnPxUUMYM
         SiygY5vHjwrupZMILxgRgEeTNk+aJ0AOX0uqRXJycEfuScBgElI9Z8IxnG7JWktHMXy/
         QLoXXfFmoUp1heFdlF6aXeZ/CWoIpUC//mScKB0dsk0dXt/+VEZsYBY4OB1Uev/d8aEN
         v27A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737292445; x=1737897245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R4vjqbs4sDqi11WPqww56N1NIcuf8IdhEvhhCCLSYJE=;
        b=nxauGJewLJplCfwH1fCtx5uV+cEbMb1H5uMEKB1Wm1MAHNIGuTyPp/2PZnL9Mb3tGx
         gowTfneir51/lphezB/plFzIE5bscMXDzcdwAV3eirrds7gVieWCQEczS2gkcVWOxjZ/
         GKIyRbrPUJ3hnCNq9/1qsl+eGi/X5Gp0hxKUWAjIwEKNdcCrSiJawPtJGiphof/JRqQ0
         xoLwUugE+ZX3BpPzxhHXovvPbj+RV3LFm85lef0lb22UKvZvMakBkBiya92SNzn9iRTT
         VQz0uEWIVCarzVEMx17/hx2J/kQwBxzewLEcgBiCgjXXKNWqKZkxreC1yZyzs2EBPqFT
         MONQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCjDCHC+dusXJx9bqpWjcj7pclwQJPFxMAORCpQxgFPu0uByPzvRs73yNK13yeRt/L8e1eDnLDSC48CA==@vger.kernel.org, AJvYcCVJsG+Mv8kCgbQ2iEidH7tPVqvjJnkFboGarvlmEudVob92xmiIwhZHJKEQ1GqmOn0Qd7zAcajTezDS@vger.kernel.org
X-Gm-Message-State: AOJu0Yz70O+QumKWAGsKmcqi5mzDEDNrPljRCnDR4sUyqzTx41Gz9ZHF
	a7ULxjJ6w4pT3QYssRsy0KBPaYhTMaz3rLq64zFJYzrqdpP9CrbF
X-Gm-Gg: ASbGncsb8dxig4pXyS0ssAc1u+P0UupYyVxHRrhnz0dfY9GdL62vZqauo/CO29Jmnxi
	I2upL6dW2tt2938scyNaO83TipcFnv49kgpUuUHzp/1wT4WHQ0DZfHUBHiolYuQQcxu4YCQc5mp
	pbi7TmIsi0aTR3AqK4K8EvD8lqIkodz5vNcpfOoRfUifvxS/j/gve88xiAAN4z7xFSJgQv5kfYn
	hP7SkzasGk0dbW51Qw/UeJev24XirJaMh1+4gMvqXSK564GTJYqQFCjCUrrxlSZQNH2vbrKjntV
	vxS67XSAKlYEm2FQKCQVX0P9Rw9ezsT1LRwWPHcU
X-Google-Smtp-Source: AGHT+IFkf7rxHfLv5+x0gNuq2of2jQjChcIKQ4fV7D6hBjClOYmJeq3kqwY4++XYs7zibxLtx0p02Q==
X-Received: by 2002:a17:907:7f0a:b0:aa6:ab00:7b9d with SMTP id a640c23a62f3a-ab38b26f478mr264631466b.4.1737292444349;
        Sun, 19 Jan 2025 05:14:04 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384d27117sm481155966b.75.2025.01.19.05.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 05:14:03 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v5 03/12] HID: pidff: Clamp PERIODIC effect period to device's logical range
Date: Sun, 19 Jan 2025 14:12:54 +0100
Message-ID: <20250119131356.1006582-4-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250119131356.1006582-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250119131356.1006582-1-tomasz.pakula.oficjalny@gmail.com>
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
2.48.1


