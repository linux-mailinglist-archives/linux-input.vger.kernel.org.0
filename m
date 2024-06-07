Return-Path: <linux-input+bounces-4203-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9639007E8
	for <lists+linux-input@lfdr.de>; Fri,  7 Jun 2024 17:00:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70DEF28A19D
	for <lists+linux-input@lfdr.de>; Fri,  7 Jun 2024 15:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EE0D19753E;
	Fri,  7 Jun 2024 14:53:49 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC52F195999
	for <linux-input@vger.kernel.org>; Fri,  7 Jun 2024 14:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717772029; cv=none; b=o5qnLiLY5Rkyiw0x1ISx89jFy3pd6Rh6OtTtf1sFxzIg55nBzx7eAenFyc/doOaGVIMxKhveRhEFS93p/IumbqJJpzeohP3HZz+cei/Hw29jeIsroiuB8b6r7Bir19dk4kYGZizn9ocEztWIn7oQ6wq4KZPCkGmXG2N4so6gvdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717772029; c=relaxed/simple;
	bh=iyoIZ7KnMYOd00pxhXraZNjisXleG2IHYlCLcDYTpcc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kcItabPeCaxnaVR3Kj50DfRYEFQsM37L/aY4E1T38uSKPch6xAvv12t4vfn98mpti6aAO1WAR/CZ5i1KarnkAATboAYNwMNdt7+xThVcsLAxngQeAveMkkKuFeyZd8NpDP/VFRn8OQBI1MIEhJ12Hj4QWV3uvtr0cqRsVee7GmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ontake.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ontake.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-354f14bd80cso1617959f8f.1
        for <linux-input@vger.kernel.org>; Fri, 07 Jun 2024 07:53:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717772025; x=1718376825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IAQZYO5yy3RKKGwu902FoqEhG0Ub4QtHOANvReZm2CQ=;
        b=mw+BtS25bAuEFFVLnfONsD5b1cEhUb1fSb72u6M/9jX0aa5eJ122Y4SJSr2R3VtR1l
         JujsbZyke3upEkpVzx0Bq0cC/F3m5qPhcl02jbGiV4dNR/VUGSHwTXkzgpkTEXkVxTyQ
         iqdI8q+ARz2i7Xc9NPPlbJDY04up1I6zeAMPfUz9SPaDtZcTmXXP9rwDRMgtMM2UU4+v
         E7mfquqlaxSX7epzb6fd1b+bdOe9d5YEsfg+lwPMMx8+6AjTYqKcjqw4csATL0qkaQyb
         5rorpmmI34vNEWCApB22JB6f1Umhd4ziBPFYk3SgZlq/mF3NpXkYM0E2/cgueu3/CYUM
         dPYQ==
X-Gm-Message-State: AOJu0YwHxtjnFGRV4hzJbOa5jZ8V3v9glx5OCllJsIdK/dyDoKUndjDR
	c3epZOwiuJKCgK5tcjMGYlaNzbtj0rR99uavVgE3xtQf3Z8ymJo76fjjh7AbYRw=
X-Google-Smtp-Source: AGHT+IGR2xLim8tJ2n6iNW8aC/hpWLFSQ/aKtBE54SKaa0TQ9HKAmGU1YZ2fpQqrdqP5grvqI9tjEg==
X-Received: by 2002:a5d:6d85:0:b0:35b:9ab1:ea77 with SMTP id ffacd0b85a97d-35efee0368amr2727471f8f.53.1717772024478;
        Fri, 07 Jun 2024 07:53:44 -0700 (PDT)
Received: from yuki-p.localnet (2a01cb080b6cd900a25451af8350d755.ipv6.abo.wanadoo.fr. [2a01:cb08:b6c:d900:a254:51af:8350:d755])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35ef5d4729asm4150649f8f.25.2024.06.07.07.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 07:53:44 -0700 (PDT)
From: Louis Dalibard <ontake@ontake.dev>
To: linux-input@vger.kernel.org
Cc: jikos@kernel.org, bentiss@kernel.org
Subject:
 [PATCH] HID: Ignore battery for ELAN touchscreens 2F2C and  4116 on ASUS
 Zenbook 14 (2023) and ASUS Zenbook 14 Pro (2023)
Date: Fri, 07 Jun 2024 16:53:43 +0200
Message-ID: <12450414.O9o76ZdvQC@yuki-p>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

The touchscreen reports a battery status of 0% and jumps to 1% when a 
stylus is used.
The device ID was added and the battery ignore quirk was enabled for it.

Signed-off-by: Louis Dalibard <ontake@ontake.dev>
---
 drivers/hid/hid-ids.h   | 2 ++
 drivers/hid/hid-input.c | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 61d2a21affa2..72d56ee7ce1b 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -423,6 +423,8 @@
 #define I2C_DEVICE_ID_HP_SPECTRE_X360_13_AW0020NG  0x29DF
 #define I2C_DEVICE_ID_ASUS_TP420IA_TOUCHSCREEN 0x2BC8
 #define I2C_DEVICE_ID_ASUS_GV301RA_TOUCHSCREEN 0x2C82
+#define I2C_DEVICE_ID_ASUS_UX3402_TOUCHSCREEN 0x2F2C
+#define I2C_DEVICE_ID_ASUS_UX6404_TOUCHSCREEN 0x4116
 #define USB_DEVICE_ID_ASUS_UX550VE_TOUCHSCREEN	0x2544
 #define USB_DEVICE_ID_ASUS_UX550_TOUCHSCREEN	0x2706
 #define I2C_DEVICE_ID_SURFACE_GO_TOUCHSCREEN	0x261A
diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index e03d300d2bac..0d21590e2d2c 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -377,6 +377,10 @@ static const struct hid_device_id hid_battery_quirks[] = {
 	  HID_BATTERY_QUIRK_IGNORE },
 	{ HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, I2C_DEVICE_ID_ASUS_GV301RA_TOUCHSCREEN),
 	  HID_BATTERY_QUIRK_IGNORE },
+	{ HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, I2C_DEVICE_ID_ASUS_UX3402_TOUCHSCREEN),
+	  HID_BATTERY_QUIRK_IGNORE },
+	{ HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, I2C_DEVICE_ID_ASUS_UX6404_TOUCHSCREEN),
+	  HID_BATTERY_QUIRK_IGNORE },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELAN, USB_DEVICE_ID_ASUS_UX550_TOUCHSCREEN),
 	  HID_BATTERY_QUIRK_IGNORE },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELAN, USB_DEVICE_ID_ASUS_UX550VE_TOUCHSCREEN),
-- 
2.45.2



