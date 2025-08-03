Return-Path: <linux-input+bounces-13775-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B7BB194BC
	for <lists+linux-input@lfdr.de>; Sun,  3 Aug 2025 20:14:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7BF73B5643
	for <lists+linux-input@lfdr.de>; Sun,  3 Aug 2025 18:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98D8D1D5CEA;
	Sun,  3 Aug 2025 18:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YS5TbEU/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DDE1E5B6F
	for <linux-input@vger.kernel.org>; Sun,  3 Aug 2025 18:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754244844; cv=none; b=KF5W7uQK3p2DC1l4XqzkdLAexZwM/+8bmrrRPx8I2fny/2PSBTektzkQcCpK8GMr/+oraEm0e2IRsdE5CuZ8B/EtNhVIV5wJc15faHKaXP0dG1R3eiMF0l2J1wzlfCTY1U9+++G2QpuBPdPelYQK+oljyM4MWGnGQckm0mg6+sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754244844; c=relaxed/simple;
	bh=lmQCYuiB8cJ0sD5nWDFYrirOcxGYW3wfx0CpyN/ivf4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n0e9xb59mgPdnr1kWBldevUEfCA0MA98+PDm25Hqtx5qHK9SDQQAhzFMmOdq4b+N5vUobaxA7Vaug73l0uC3HDIYvZzygGA6c98Qj1EVX72ByMWKmJ8f7iZaeDp+OekGlonXTgreD/4Pk2e/QP81uew/xFJAodUV6/F5m9kD5hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YS5TbEU/; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-af92d6c7d15so48138366b.2
        for <linux-input@vger.kernel.org>; Sun, 03 Aug 2025 11:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754244841; x=1754849641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gkxXoPM2b/9stxw3ZvcHoJGbm8nE7V0HStNjmgO+bBE=;
        b=YS5TbEU/oXNWXeuaeg0uuMhGaDSGUSWJbPQVJAQvklzc9eJuOmKbcU92CGDEfFL8Mk
         PKVhIAxvKk/NzAxMnge99qoB094hKDyv8DEUPhfpvlfazAz18Ufjb1HjEjkx0QIL7Lpa
         tWckM9A6+OU833xNH83u+bJt2+tIb9oQWwdAhpBXfvO6yJuomgzW6pLziegaWF8jjMZD
         Aa7qhA0FudFaOVdGYhtzI2qttoXrETDTSRynykOAH1whnoHtmKaclxU/oA9jYgdwYpRw
         QtSU/qjRp8somqzFaHPiV/3ImREzMqBHQ31rcL3JRKFkzlMnxZ5ZBTkEf5QXmhm07gvk
         LVQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754244841; x=1754849641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gkxXoPM2b/9stxw3ZvcHoJGbm8nE7V0HStNjmgO+bBE=;
        b=mhNl9F5popQbFSalZTI39z+Imb4elUTGhmh2ngX28LLTVt3T7e93nKSwhq2ZpucMRL
         RyhoR0rlEN7PmTHWSdg/vatrqBNBLDCupD0qgmg3WHTh8PTdCg0Q9unJ0hq2DeMBMg0K
         TNTcvJfbJUVxDPeSOSRPo4hxM6YucGhs3lQ7RpYhHCayW8MJSy0pBQvK0AdY4i3U2q48
         gjb6HkuXDlLsnRI26/xvAr9o6PcikWIf1n2pMfzZzgvlc+1xRHb3NGnqNXNuox+KoK9r
         +61/pzeV4Qe28VtrRKK+Q73Suu6+Mx2Sn6rjebmSmiBbD26z4Hf86vdghzIFYVeuxUfW
         HEHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJbYOMfcqQvG3UXvaf5lZtlNNBvsqQyCd7PY2226iI2IImF56LJgjVIULymFVTSN0Q+HzeIGR5UzUuRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxtJQ9nRMM0qsXsKSaEa6ZbAtSLRJhak8CcSoFv0jmmhv38CEA
	VfZ3CIGdKQC9O9iuzLd43FaTrna47TcTGEIwveMitdZyDccba/PCiKZ+
X-Gm-Gg: ASbGncv32qvQew91nywvphgIbBgNLTqEnVWCfxR4+3ECKWH8RotoGwGb01YJkZ/PQr6
	4DKpPsrYZf9HkYH6BtGAI45dlAI9KiDFbs3R5BW0GdhNiz6yKYMZ2/vzHYyYqcHChVbBSDQ2H/P
	Gv8+8kb6FVSqddzG3O/hI0IZoZ/FmLOqwfFM95JPjtnHFEKw5G2MXsuAzSThGNufElRLPF36ar1
	/d6q/KmaeJumm8tE9MHZb/78/UZTbhDIuRnRBkHXF14pf++Tko3OCPlU7F5z2AFmqTXlS3pKQ5D
	rghGWZ+8IYc0B2pRc2JC1eWJX0YpUUmjcfn1aAWFVEaqCmAibDzt1dbHnNs34TEO/E4MfAAnEvU
	cgc8GBjJ9yd055CnV/9DQEDnbbzapaUsYhiWT5hDZT1YOxKyLCQVnh9fbzmVzxTZUj72GBQ/4um
	w=
X-Google-Smtp-Source: AGHT+IFSPmgMTSVKtdP0pueIRHLZxyMB+s8LZtTwgndQHuyPiUA6gxttOkTA4oMVGXTDrvQnkUWDKA==
X-Received: by 2002:a17:907:7fa3:b0:adb:5985:5b58 with SMTP id a640c23a62f3a-af93ffd731amr295854666b.1.1754244841317;
        Sun, 03 Aug 2025 11:14:01 -0700 (PDT)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a750253sm614570366b.86.2025.08.03.11.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 11:14:00 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org
Subject: [PATCH 05/17] HID: pidff: Treat PID_REQUIRED_REPORTS as count, not max
Date: Sun,  3 Aug 2025 20:13:42 +0200
Message-ID: <20250803181354.60034-6-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803181354.60034-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250803181354.60034-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It's naming suggests it's a count of the records required by the USB PID
standard and this driver.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Reviewed-by: Oleg Makarenko <oleg@makarenk.ooo>
---
 drivers/hid/usbhid/hid-pidff.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 2f9fbe4c52d7..cff79e76c211 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -33,7 +33,7 @@
 #define PID_DEVICE_CONTROL	6
 #define PID_CREATE_NEW_EFFECT	7
 
-#define PID_REQUIRED_REPORTS	7
+#define PID_REQUIRED_REPORTS	8
 
 #define PID_SET_ENVELOPE	8
 #define PID_SET_CONDITION	9
@@ -1056,7 +1056,7 @@ static int pidff_reports_ok(struct pidff_device *pidff)
 {
 	int i;
 
-	for (i = 0; i <= PID_REQUIRED_REPORTS; i++) {
+	for (i = 0; i < PID_REQUIRED_REPORTS; i++) {
 		if (!pidff->reports[i]) {
 			hid_dbg(pidff->hid, "%d missing\n", i);
 			return 0;
-- 
2.50.1


