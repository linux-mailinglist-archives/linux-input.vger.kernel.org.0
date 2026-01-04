Return-Path: <linux-input+bounces-16782-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B1CCF156E
	for <lists+linux-input@lfdr.de>; Sun, 04 Jan 2026 22:33:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65504302BD37
	for <lists+linux-input@lfdr.de>; Sun,  4 Jan 2026 21:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98C252F12DB;
	Sun,  4 Jan 2026 21:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ew8vqAnY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E932F1FFE
	for <linux-input@vger.kernel.org>; Sun,  4 Jan 2026 21:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767562303; cv=none; b=IUseiG6ZRua692rD0QEaUZjboMspJ5PQIyi814PtLaYDtL6gKzaiyQlXqdxWc6FAo2Ay0Pef0spPL6ez30DPwtFpRugakk1J2RahJ+LQH9X9KMgAtoZL2IEU7xgPFUjIircEu0PymdsRhlBcEETeTbt5HaAbwVxBYFzqwGTOug4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767562303; c=relaxed/simple;
	bh=69vt7Qk2+H3T481tbA+iEUit9KnFrIN5kgrxdXzsY24=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iH+o6juImD8w0bBGmn0G8K0km7t942WNUqhyqcIzW09o3vrNMqx3e9EimRQIQuuse1s35M+PMYAJA9tLGv9KdA6Cup8RgsBz0ZlQLUuhF+NwaKX0XfXKW4lfdGdBeWFdSPYUF/OIamrnSt1c5AiWMnYxrX0kqYlMi9jxex9SpvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ew8vqAnY; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-b734a4b788cso206204366b.3
        for <linux-input@vger.kernel.org>; Sun, 04 Jan 2026 13:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767562299; x=1768167099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iyVyOVoDpRkrPdb+Fl/hf7lVJIk2hqFvpZtQyF+zJoE=;
        b=Ew8vqAnY4iju3lYMSEMmcqUQoDSrBfxZebl4bDCMP8UCzS0eow7Xs9aFmRq/jlqFy+
         z6J0aQasWrSV695OnWYJGvScYhYVbWxpq3XFfhkfH2bxZRNtJaK9A+frRMBpUzwPhntk
         BZqR2Pj4tq4Y8WxDsO9jEHy03XCq7BIey8/fQ27dHUUDMmjBj4J/fHe0E7OyMLMBZeO1
         +lgkkGMNJt0IXe8vbvoS04ax1iHchKMq0Eq/OWz8v279wEq5TK885DAGUwVA1vIc120E
         ZzhsvfKonNfxXq7CHR8RhM2y0m3esA5VAmeAWdsNUpo6T/kHp9y4opPt49pP/q+Skb5r
         Uy+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767562299; x=1768167099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iyVyOVoDpRkrPdb+Fl/hf7lVJIk2hqFvpZtQyF+zJoE=;
        b=siD4Lc2z16uj3vdTE3VVX2bh47scfv9j/CGD1YJswTlW9XwWsopDEGV71elCeVUngz
         C/khHF3WCZXnmpsDz4PXxJL+cBxs+7JZbGUheBVmfMeQPWJRdFfXmkAYhz7CdnqjD8we
         era9Faoh6aj6SRCs5JwPtd/OOu94Cckf+owc4h9u0cwNk+o1BdzDCCwa9unY2P/7HvUK
         uWKs4RSz+Yw4gpUgqZReesXgLAcY//s6lPTHOSCeL7zOi58O0J3PzAH+EqvmQtsszgth
         OTCC86uTE9nhNDL98KyU/bUYrMN1JZInH/K7EUGMPS6Jg1AjL0StrEWcQphvzIzPV/YZ
         QxBQ==
X-Gm-Message-State: AOJu0Yw9EvS7xQkiQqwz4FW+83CXuSzrU/rplKSzrFz28vWyah0FtaC1
	tOKXqVZa7SxVS+36IgA3dhxNGtEgWo78LFJhhAJMQuYvqImcKAPJ31RC
X-Gm-Gg: AY/fxX4pXWpiW0stkFHjbx5K4JflNTYJZeg94suNpYTPUtp7koHWZU/XinDqMgKhyz+
	q4ZtTBHt90ZQP9NQHapyIuPZsN1XOpHeUYxzM6AU+7ezXu+QBXda7kmBoD65bdSHWTP0cbVhFGA
	K3MYuRQ3HKxYCTIFz98JpOrZmv6QGyMPpTCPSqLliaXpOdd8BSpoZre0kK1ML668oAhZC956LBL
	sy9pYp3NnW+jU9qHlCDiZYyt4x7Mi3nroKNOsSzwtsUvvxl0zBV7wnxFBUFiUT3c4lmdqJEc9g1
	Xp+pGuytT85zKeAsEZ7keVoDrzqN1ryPIANubMY8h1axo7EG9bvYyw88z5OGVDOBUat4IxAvmx8
	eXfeYnOlmxSDC/zeQD17vJFLEeC2UPGqFQuP0cN6n6oJU20aeKJ09QRZc47ubeM1nYXXez7/uzR
	g0geVg2kwApgxEdn2ECELFjM2t9fPzpWkyxuIfbmvuCa2fMKvODzY7AfTyfmR0PrO5
X-Google-Smtp-Source: AGHT+IGakCoIAtkpX3G7Cb43Lp8uN8RojeqEyKuH05NK9zjgxJjMdsIxbnKIPtDxZRa3xmkxyc0Rog==
X-Received: by 2002:a05:6402:268a:b0:640:abd5:8646 with SMTP id 4fb4d7f45d1cf-64b8edbd77bmr24808991a12.4.1767562298790;
        Sun, 04 Jan 2026 13:31:38 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9105a9c4sm51947772a12.12.2026.01.04.13.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 13:31:38 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: dmitry.torokhov@gmail.com,
	corbet@lwn.net,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	vi@endrift.com,
	linux-kernel@altimeter.info,
	peter.hutterer@who-t.net
Subject: [RFC PATCH 5/6] Input: Realign rest of the HID_UP_BUTTON cases
Date: Sun,  4 Jan 2026 22:31:31 +0100
Message-ID: <20260104213132.163904-6-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260104213132.163904-1-tomasz.pakula.oficjalny@gmail.com>
References: <20260104213132.163904-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The switch statement here had too much indentation.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/hid-input.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 1c11077b1577..9542829de234 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -770,22 +770,22 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
 				code = KEY_RESERVED;
 			break;
 		case HID_GD_GAMEPAD:
-				if (code <= 0xf)
-					code += BTN_GAMEPAD;
-				else
-					code += BTN_TRIGGER_HAPPY - 0x10;
-				break;
+			if (code <= 0xf)
+				code += BTN_GAMEPAD;
+			else
+				code += BTN_TRIGGER_HAPPY - 0x10;
+			break;
 		case HID_CP_CONSUMER_CONTROL:
-				if (hidinput_field_in_collection(device, field,
-								 HID_COLLECTION_NAMED_ARRAY,
-								 HID_CP_PROGRAMMABLEBUTTONS)) {
-					if (code <= 0x1d)
-						code += KEY_MACRO1;
-					else
-						code += BTN_TRIGGER_HAPPY - 0x1e;
-					break;
-				}
-				fallthrough;
+			if (hidinput_field_in_collection(device, field,
+							 HID_COLLECTION_NAMED_ARRAY,
+							 HID_CP_PROGRAMMABLEBUTTONS)) {
+				if (code <= 0x1d)
+					code += KEY_MACRO1;
+				else
+					code += BTN_TRIGGER_HAPPY - 0x1e;
+				break;
+			}
+			fallthrough;
 		default:
 			switch (field->physical) {
 			case HID_GD_MOUSE:
-- 
2.52.0


