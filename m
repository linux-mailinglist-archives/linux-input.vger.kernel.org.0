Return-Path: <linux-input+bounces-13795-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C728BB19E96
	for <lists+linux-input@lfdr.de>; Mon,  4 Aug 2025 11:12:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 583C2188B305
	for <lists+linux-input@lfdr.de>; Mon,  4 Aug 2025 09:13:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A23F52451F0;
	Mon,  4 Aug 2025 09:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ANiLN3i5"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F0123B604;
	Mon,  4 Aug 2025 09:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754298756; cv=none; b=eAzCYdLaY2z9/nuchEqkvhVwUBpDECFEoxuFQDie36xINjDiTSZleYGz9zP6HyfVKIWJR/4A2sz1ZltNYIm5HTp3K63QLnjcQoOdWzWylrPFLvR7LalVHoAjOsrBU04jknuwoFozNblZ+369FCJWTqxBwXsQ1AwF/4+rxMQ1RgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754298756; c=relaxed/simple;
	bh=EKIcaSOYit8QZgQSnMZqaI16FR0S4gHROPIX4oymJis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LhmShyeAhtEHDFi4cKabHEEvqsAnv6oaUWfZbnPjwOYI1UaGduAyknDFBgPuN8PfLhZbm5NCeqF8+FvP8tpxrbkarehB0KnytgaCKpVyNMBrnWuQvSzm3rcVQ8uzW2gYW+PQLl6XNVyoSnOXl93x2BIeyKn2fEj69RPdu/VaVag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ANiLN3i5; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b785a69454so1710141f8f.2;
        Mon, 04 Aug 2025 02:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754298749; x=1754903549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cx1iVJUEz7nDyuh1JHKfv6/6H9nDCueq0WBGkygDCnc=;
        b=ANiLN3i54UudwUAWcMuKi97rtAB1p0quStfYzrRgYk7Cwg2Tx9yiZtsHbKrhFhu7sA
         JRNfsVeadphqvn8lVjriJLpPILsDwnM4fHzqi08mAzVscD8/r8UB6e5HSFiawddb3jAj
         oaynuNUGtsq9fSbLgdLwLBjDdpU6wqQD9rmUkCYZe9jmpd/4uVkSe42yviSD3/ng6a/6
         RnoNPx1/f1xfrWJhT/KDnOg+kfTXr+7ea4tCDWL9DTqneOlRblMPlg2pnChaTJKlbxnS
         t1AmWmoIAxr6u1CHpMJBlRGK5A0H5ZavRFZ3puErS+zR3KsURq+OTsVVA8dGaLYqaCqK
         78ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754298749; x=1754903549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cx1iVJUEz7nDyuh1JHKfv6/6H9nDCueq0WBGkygDCnc=;
        b=ikolohY4e26UCfH/N54MjP4YFhCL+24FNnjrvpVKfouFfvvhB9Pz4NDAwvwfjH5vce
         lk6tKT7/BNwENUN1n/2N/NPLF9Lrz4K6AXbAjYfJyHkkvXy0QU5/4HO420NiyHZBa9/a
         viXWDmjvdOWyEW1fyBQhKECnzv1+XVdUCjL5aQt1zi0YWpwjaEvGoDWKfHhEZA854Ga/
         daT+U7Sc4zN75UB8gV9q6KOyzAlPWegsIsDeyIPnFDBu7e9l/ulyR0eDjq/C88LjtHnd
         vSz/foU3L1G6xIVepNIXB+C0WD7IQhNMU8O/rPvJJFBjF9Q57Gv7E9HTL54NYkhc4CW3
         WIrA==
X-Forwarded-Encrypted: i=1; AJvYcCUybAgD1UtxfIRSv3auJ/X5Zw3LRuPp7oOJnqw6gjwvArVQuGRi1jBJ9SNk3UPf5EZwEkWqQ2VjgTFDu1xA@vger.kernel.org, AJvYcCWwBDIGA1BCOlMkNB0WtbMH4OzhkcEwuRv0FOAvrlmbpXGUSOUZJPJe7fx7Id0MYy5HNFYl64tvvAyoXg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3h3vEWs1xb+bp1RBLegxDd61ajH7kHJNAKgScc9R4LrXuZsjg
	1Pdlko5HIZQUltNGQJT9iDziicusiO6+6nCfwU2BOzKbA+oJ92cdLZDC
X-Gm-Gg: ASbGncvXorDQeGpsm45wYbFIlPRJhSt7CGP6y6zQv+YvqjLeLkvDlhZRHzX9wzuCpLI
	OFyzo7WYlxe+1wsdOVWmvXnXM0KaHBQh74mN4Kx1ZVHjHH3xeaT7qBaUlNp228NGYOcThZ/5spR
	0AtWakStuM3TCUWHQw5pvHSkOACLIRo00Jx6cXhXmwV7/0nvAHepM1NnGRrumiA5ZAJ7IYMK0rW
	P1YH6he2QMQd8uRE6Eb79OVOJnAx9yUI3V4sWc4Ps7kxlSgp1MhxE00fYq6lCJFl71lH1K3C1O2
	OEfZBY6gxwuz6JiXca8TK/Rhyqu/mywS0bC69ooBj43q3KntthP3UrGR1KPvSahHvDCoWILBE32
	yYLp7HvY/jX6F/OPguP0=
X-Google-Smtp-Source: AGHT+IHqZUILKJPb9xy5ToTF/OkeH7eK7dTXvVwzSf1AJQYLL4S/C51QF3eON69ZWTuhQPBtK5TuFg==
X-Received: by 2002:a05:6000:402a:b0:3a5:39e9:928d with SMTP id ffacd0b85a97d-3b8d94066f1mr5795019f8f.0.1754298749329;
        Mon, 04 Aug 2025 02:12:29 -0700 (PDT)
Received: from fedora ([94.73.32.0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c453328sm15480607f8f.46.2025.08.04.02.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 02:12:28 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: jikos@kernel.org
Cc: bentiss@kernel.org,
	luguohong@xiaomi.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 2/2] HID: input: report battery status changes immediately
Date: Mon,  4 Aug 2025 11:11:52 +0200
Message-ID: <20250804091215.6637-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250804091215.6637-1-jose.exposito89@gmail.com>
References: <20250804091215.6637-1-jose.exposito89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When the battery status changes, report the change immediately to user
space.

Fixes: a608dc1c0639 ("HID: input: map battery system charging")
Reported-by: 卢国宏 <luguohong@xiaomi.com>
Closes: https://lore.kernel.org/linux-input/aI49Im0sGb6fpgc8@fedora/T/
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/hid/hid-input.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 262787e6eb20..277538a17b57 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -609,13 +609,19 @@ static bool hidinput_update_battery_charge_status(struct hid_device *dev,
 	return false;
 }
 
-static void hidinput_update_battery(struct hid_device *dev, int value)
+static void hidinput_update_battery(struct hid_device *dev, unsigned int usage,
+				    int value)
 {
 	int capacity;
 
 	if (!dev->battery)
 		return;
 
+	if (hidinput_update_battery_charge_status(dev, usage, value)) {
+		power_supply_changed(dev->battery);
+		return;
+	}
+
 	if (value == 0 || value < dev->battery_min || value > dev->battery_max)
 		return;
 
@@ -648,7 +654,8 @@ static bool hidinput_update_battery_charge_status(struct hid_device *dev,
 	return false;
 }
 
-static void hidinput_update_battery(struct hid_device *dev, int value)
+static void hidinput_update_battery(struct hid_device *dev, unsigned int usage,
+				    int value)
 {
 }
 #endif	/* CONFIG_HID_BATTERY_STRENGTH */
@@ -1515,11 +1522,7 @@ void hidinput_hid_event(struct hid_device *hid, struct hid_field *field, struct
 		return;
 
 	if (usage->type == EV_PWR) {
-		bool handled = hidinput_update_battery_charge_status(hid, usage->hid, value);
-
-		if (!handled)
-			hidinput_update_battery(hid, value);
-
+		hidinput_update_battery(hid, usage->hid, value);
 		return;
 	}
 
-- 
2.50.1


