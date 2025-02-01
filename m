Return-Path: <linux-input+bounces-9660-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 347D5A248B3
	for <lists+linux-input@lfdr.de>; Sat,  1 Feb 2025 12:40:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A629F165649
	for <lists+linux-input@lfdr.de>; Sat,  1 Feb 2025 11:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F01D91ADC9B;
	Sat,  1 Feb 2025 11:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mYBFVlfE"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FF61ADC93;
	Sat,  1 Feb 2025 11:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738409973; cv=none; b=V1wfFQvqJDnRCeOEH4Wb/wf4n0owZcNy5zb0t2S93roBP8cfYDEMfBSh3Y1/l+VxAF1QLKS5FG1lK4tswq+vdtjAWz10NOaPHAJT7qC+OSf0Cz4MUZ6GVDEOhiogSWx4bNk9JjbQDdtHGbqDzkqTNyBZZVvqxWUAoauRmbRaITI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738409973; c=relaxed/simple;
	bh=0K18IsQZlxgG3h8AjOD4Jxyc/4PKRj2qM0adwClrFU8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DqL+7VVLA/awSes2Mz0G508UNGVF2GCNDe5yLbJogtu/ReOkn86avdVW9rl5SMDMqtz2DXl07kUgdJ/qcg9f2YRAths6jiicNAASZUoO6Yi0anF4e5ZfxL5TXv06pzs4W0rbAe2Rx4o3Qn6fse5tcLlCk+xTNV3aO9v5AwgZlZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mYBFVlfE; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5d3cd821c60so548691a12.3;
        Sat, 01 Feb 2025 03:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738409970; x=1739014770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PaeJPegiVccH3PHrKGcqdcUbiveMoSSJlrgBbQku98Q=;
        b=mYBFVlfELWpO0X35UYElM31IeZws+7tB8I0xJZKwBNFN30TXSW8HZU8XiU3J0+NJmz
         Writ6pBxVeN1px5EErlaZwma1G18QV6Qyb9FF01D1ruf7d8Wzm60S7h5Vl/mhj1L43Gn
         acVK/fSza6dWnnMhYu6FtSKGnhdv3hI2LzcO8V3PjtGBCnqC1G+Y/unLn70Xav33K5wD
         38QEdukHGDW8JzSAC/KaJNz5a5IWi+5vWnM0e/WB8CYtUYxNKeLg/YeUnS1zvS+0Es73
         1Z8J8ePFFQ1k++RUmrz3isbiqf0dnbzqrKRyVjn5VWEEGkz4VPGxz8oYKZ/kD0fX1HQU
         61lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738409970; x=1739014770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PaeJPegiVccH3PHrKGcqdcUbiveMoSSJlrgBbQku98Q=;
        b=dleKSDMtJqfCH+ZPvVQFp7UXOEPH5fwV6ZIdaQQqaghU/WFdMggMigWLHxYVijyhXT
         WxTiWtyH/ZhghT7MrhS/bH/qRpyatI4Xxj7r9QC1pu+80FsTe6Le8vJ62crvZaqxin0l
         v1NtJI+rfsqqrw/4VorEg1covWKv3vmGcVqx0oCSTt8nneJHudJ4cOhubgrw1fpSQM15
         TSnKSWaeTyoLhf8RuWHlfUjXD3xR1EtTLYrRjsBQDNAa13FN9CbMubq88nRr9l7CMuGB
         5KyXEZA7rKYts8ee/4QK/goo+zIneZUQ7pvxvkRnmn+zIgfucFgtOy8CqnPthHRVfF8c
         rEag==
X-Forwarded-Encrypted: i=1; AJvYcCVf0yFRfSqQAMRyatrXzFRzpOIVDG1z9NrOj84DIqKzWdiG8+rBAlHMD3JiuhH5LaudjFo/uVgPlZke2Q==@vger.kernel.org, AJvYcCVp4dC8ZaoiG320VUKGIAAG+8mWUGr6BZNpndKQfb3FVBOOsNx+HlVnRHMCLBP0pXZf5fklLNCuax+H@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0PJm/VJ1HHrqAnj56xycwedndWqnjglpJhV6QbiBFMrv3xAFa
	7MJj3CO+6iFxMRUQ1XzrjE4cjQsG1IxFNRmybAfWWkMWfLlaA7iA
X-Gm-Gg: ASbGnctN9x4Djk0SWuoJfmbByl49ujvqvb0E51FOI2I1/FYd+rSLeEcVX+ue0yt0av1
	FQ0M6qrK5qlXqcXVmr990aVlVi0ik83XyhnvVUcf/F865nDxu5NpeQnR7L7Wr579Av/A29BpKt8
	UHmU6QBJOiu/MNQzNMqyhC/VgIa6+smHEAEnQiezl/ZkKjaRWJiiXXcoCJDgfAA8dxlXj2mX5Eb
	nwFzvAFoiSyZ6+4sRsxpjQmAvS8FiMSOe39eaT4yg8QMTmZgW9Ja378yp1P1ZgPxYYMHqb7soeS
	7M+3EtD5wN8I2s7DsKcMxh+oWv/T0EdAIYddnnbu8hul5dWuPE55u0US+m9q1Q==
X-Google-Smtp-Source: AGHT+IEin5PlZvEQFdTqrAfr4J9DGDlPxxUeLtLpImKQgRWR3sjJAggYMKoqCcAffXbw6enBPC3X2g==
X-Received: by 2002:a05:6402:42ca:b0:5dc:5a51:cc04 with SMTP id 4fb4d7f45d1cf-5dc5f03140dmr6227061a12.10.1738409970313;
        Sat, 01 Feb 2025 03:39:30 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc723e9fa7sm4304577a12.20.2025.02.01.03.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 03:39:30 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v9 18/22] HID: pidff: Fix null pointer dereference in pidff_find_fields
Date: Sat,  1 Feb 2025 12:39:02 +0100
Message-ID: <20250201113906.769162-19-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250201113906.769162-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250201113906.769162-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Tomasz Pakuła <forest10pl@gmail.com>

This function triggered a null pointer dereference if used to search for
a report that isn't implemented on the device. This happened both for
optional and required reports alike.

The same logic was applied to pidff_find_special_field and although
pidff_init_fields should return an error earlier if one of the required
reports is missing, future modifications could change this logic and
resurface this possible null pointer dereference again.

LKML bug report:
https://lore.kernel.org/all/CAL-gK7f5=R0nrrQdPtaZZr1fd-cdAMbDMuZ_NLA8vM0SX+nGSw@mail.gmail.com

Reported-by: Nolan Nicholson <nolananicholson@gmail.com>
Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Reviewed-by: Michał Kopeć <michal@nozomi.space>
Reviewed-by: Paul Dino Jones <paul@spacefreak18.xyz>
Tested-by: Paul Dino Jones <paul@spacefreak18.xyz>
Tested-by: Cristóferson Bueno <cbueno81@gmail.com>
Tested-by: Pablo Cisneros <patchkez@protonmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index a7d9f9b19668..ac6f940abd90 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -926,6 +926,11 @@ static void pidff_set_autocenter(struct input_dev *dev, u16 magnitude)
 static int pidff_find_fields(struct pidff_usage *usage, const u8 *table,
 			     struct hid_report *report, int count, int strict)
 {
+	if (!report) {
+		pr_debug("pidff_find_fields, null report\n");
+		return -1;
+	}
+
 	int i, j, k, found;
 	int return_value = 0;
 
@@ -1050,6 +1055,11 @@ static int pidff_reports_ok(struct pidff_device *pidff)
 static struct hid_field *pidff_find_special_field(struct hid_report *report,
 						  int usage, int enforce_min)
 {
+	if (!report) {
+		pr_debug("pidff_find_special_field, null report\n");
+		return NULL;
+	}
+
 	int i;
 
 	for (i = 0; i < report->maxfield; i++) {
-- 
2.48.1


