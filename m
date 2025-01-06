Return-Path: <linux-input+bounces-8978-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E25CA032F3
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 23:55:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EAD2518847FD
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 22:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D75D1D61AA;
	Mon,  6 Jan 2025 22:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hiWQbTX7"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5FC1DE4EB
	for <linux-input@vger.kernel.org>; Mon,  6 Jan 2025 22:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736204102; cv=none; b=hm3LrPUcQqk5fi/GXx3+Wy01ChRivX7T2cy9Efo2LQDVYS6eqHM36mULPXWLt17UG3jh9dm9fR+tTvQTpnf+QQg+Z9Tc6PALbYM+kPF7WEPFlF2rIRzkGTmU/x0vSm7L6d7lIQjSV+Syz24/kya9WHH7N9fAdKAackgU4g/Q8ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736204102; c=relaxed/simple;
	bh=bM54ZyaIQjGoqs0cBihxOZIsdwj2ZkvengKo2A7Ku2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jt7EfSK8NSfD+E7XNupy/MvXlXHDQrqIwpM3nRX6MUeTjqEBDC6eQ5yLEK1nqIB6FO1T6WB5XDK+D3CRM+gpepwvuRextJ0nhI7/hUUk+dZDgfBQc8FPNG42Ug81GzWblfEALqwq746Pi+xVW40Ojp1o3FLILgP8mlAmU1JeW2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hiWQbTX7; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-436341f575fso153935325e9.1
        for <linux-input@vger.kernel.org>; Mon, 06 Jan 2025 14:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736204098; x=1736808898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KEX+NAdBDoaB6TEqF3DaqclGaBaxA+ArpAVDhk3GbyM=;
        b=hiWQbTX7aX2W9XHnldmziqlIXIBO87CMIfmvisLJlFklZHb3QRfXu3WbAJ05oWh24i
         TQtfPadqhi2FVatZVIRxBQ72RWgq+8BPnw3qoEpZhSZHhJFFMLiQ4pz9d9qqwY+GXVzi
         U7aQaieWq06FKHZiA7R0RQ+P/B95K0RoTcRh/6eUHfrVtnNRLy5QTXiw6hoLlN1Zfxzf
         hHp9j24dptLAxgv1xk1PvU/n4YXDGK2IQd9Up3TxfSBhbz0RDcnc1BcHNmnwT2rjt6GW
         YVkqlrzSubvAniX8H2Tu+qtNJS7xi56+K2JdwyrUs9LObGIdaEQlBHo8Jpka/DOH717H
         KPJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736204098; x=1736808898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KEX+NAdBDoaB6TEqF3DaqclGaBaxA+ArpAVDhk3GbyM=;
        b=nlH/PlnV8bCtBwzyFvBt+zzZJ63n0/cD1lR2c/fVQjy681PX/aCG6UIWxdP0jnGRfc
         gpt9d0VUwbwUcZdUDjAS7eoYNLnFZuPGDqOGGmZlYX3D1PSnpG5aa7HrOrZR6wXwZiyN
         iwTW2UugvwocSUfvM2Rind3G9eVZksinjwE8lmzKL5ORVv2ohhvuH7wrUwvjKf+5oiH/
         MEyXRjbR1bIECFZHGfubl2fC+3I589WD5ZP0Ndw2HxYu6MCcWtzMy9p5W/ViIrmvtUGa
         8FvCj9dIDt2hUL+fDNJXhAtwy9rkY5w9Npsmhezy8EhRea4xGVdFd/ejXuLfJJtPAEGS
         hD5A==
X-Gm-Message-State: AOJu0Yxf3ppkG0MhyQAMG8vykMLMwvlkl8RXKVv3iWxRx9F7tMdN4CWx
	fOcU1g79UHRPv+8XwB66u6S5do4qRcGFRWfezqrTWdkRkCraYCQ4ZcAmcC3l+N0s+A==
X-Gm-Gg: ASbGnctxs3sBmtfbQeq4K38XfSiKMml/Z+86E8RQktlRRBI6UtO3Y1RX5iWbwBd8mP4
	cbJja2YoafPsrywKL4jGeag2Q0zlbh0HD4whgi/s+D71HZ1qOnvrgd9c/jlPdPQcXGUv1j9JIPO
	dykmUQIeoeiQ4uNdklK3jacIPMVLTo1ZgFPUaAa9mA3T/UGCtTgGKuSAfqMtKaQf1NTC9Wjt2MU
	9MCfiKNnDnMVPT/4KiXbeHr7CFE+De77eEp/cO/pwcXPBfw+cnMZ3uQT0b3Nr7edEI7
X-Google-Smtp-Source: AGHT+IEmlJK+XqRgOcoMj3H9zsz/nhJIyghyanaJ8XOdv3lE7+b/vMM3xUNh9zQbYGsusRDYI7TIhw==
X-Received: by 2002:a05:600c:5129:b0:434:a852:ba77 with SMTP id 5b1f17b1804b1-43668644082mr563881875e9.15.1736204098325;
        Mon, 06 Jan 2025 14:54:58 -0800 (PST)
Received: from deepwhite.fritz.box ([2001:16b8:b48c:8600:daac:3967:7eaf:8e73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea387sm586000725e9.6.2025.01.06.14.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 14:54:57 -0800 (PST)
From: Pavel Rojtberg <rojtberg@gmail.com>
X-Google-Original-From: Pavel Rojtberg < rojtberg@gmail.com >
To: linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	gregkh@linuxfoundation.org
Cc: Martin Stolpe <martin.stolpe@gmail.com>,
	Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH 05/10] Input: xpad - add USB ID for Nacon Revolution5 Pro
Date: Mon,  6 Jan 2025 23:54:32 +0100
Message-ID: <20250106225437.211312-6-rojtberg@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250106225437.211312-1-rojtberg@gmail.com>
References: <20250106225437.211312-1-rojtberg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Martin Stolpe <martin.stolpe@gmail.com>

Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>
---
 drivers/input/joystick/xpad.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index b2716b49d3b6..1cd946b26451 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -390,6 +390,7 @@ static const struct xpad_device {
 	{ 0x3285, 0x0603, "Nacon Pro Compact controller for Xbox", 0, XTYPE_XBOXONE },
 	{ 0x3285, 0x0607, "Nacon GC-100", 0, XTYPE_XBOX360 },
 	{ 0x3285, 0x0614, "Nacon Pro Compact", 0, XTYPE_XBOXONE },
+	{ 0x3285, 0x0662, "Nacon Revolution5 Pro", 0, XTYPE_XBOX360 },
 	{ 0x3537, 0x1004, "GameSir T4 Kaleid", 0, XTYPE_XBOX360 },
 	{ 0x3767, 0x0101, "Fanatec Speedster 3 Forceshock Wheel", 0, XTYPE_XBOX },
 	{ 0x413d, 0x2104, "Black Shark Green Ghost Gamepad", 0, XTYPE_XBOX360 },
-- 
2.43.0


