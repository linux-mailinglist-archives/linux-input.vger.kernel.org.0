Return-Path: <linux-input+bounces-12553-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD6CAC30CC
	for <lists+linux-input@lfdr.de>; Sat, 24 May 2025 19:48:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1E063BBBFF
	for <lists+linux-input@lfdr.de>; Sat, 24 May 2025 17:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89DCF1F2388;
	Sat, 24 May 2025 17:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TT2qAwIK"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CC11F1531;
	Sat, 24 May 2025 17:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748108857; cv=none; b=Hi87tHWVd/R3FYPQ898mn+osXJsuSKC1kbGKUaeAPC3iaKMhQLyHN66EeBwUo2lr+SSdWMND3D7XxsP5yv9AU2D2gzqlkXt89YJDiUk6D5elDgC9COf6aYn8u7fT1cydWA4o4pGpC2GbBYzgkHDSLa8+iyB54zk45C+eRRFktec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748108857; c=relaxed/simple;
	bh=XA00716b3IbQMmrio7+7hhHn996r7yrSNjAqtof0Ahk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HPmMD/971fKlNpYJ5JAxsk1hR1rzocAWQz4okTswZIDBVcBfF4Ta5Yi74rNlkw1wD++aq05KpNtIFpm0/KIehme6IHqERn1onbKMgofY7CT83g6xqxVEsMFZUZhih89VcWFg/ooduEsyV7Vshz401wgopu7IK9XFSi1rU18xN0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TT2qAwIK; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-602b5b4c125so145295a12.3;
        Sat, 24 May 2025 10:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748108854; x=1748713654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38NbTUvn/7tUQHvy0B+5g5JMRHCXE64KvfN7AsXyy6E=;
        b=TT2qAwIKNY5laV5JHDTDORMDMKAePQ0Y5vvev62FsEkWBaS1AqKww8yl38GX1QXW+A
         s6igDMvTijhisl5AaC+baT0COh06ARiX6bk/Ng7IRg3IJ06KCwFO9NqNrLrX5TGeKhu0
         9+fYl72u/l3LGHs7DNZbn884YVMQVDNNcCJB7EdwoDITRW/ZR2mENKYKRBo9yhVZK9by
         xNiodQrqgoRMvsSEY4xwHbLFY0FRqOZwL441gx0q0E7Lf+GNobVRB1pZ8e4fiYHSPxh9
         a1aIFOLoJkRAi4QEXTYREdQoeq/g0FLeDu3tzToESVA1wuV09N+6NJrosPaqFpwTeM3J
         0f6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748108854; x=1748713654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=38NbTUvn/7tUQHvy0B+5g5JMRHCXE64KvfN7AsXyy6E=;
        b=O0D0AI7GCpKk/fPkKm7d7pijMBvSi9yZ3YvKs6Bna8b4nFBDYhArgMtskn/x947UOl
         Uc5FTMw5Vc6gsHmlXV05PabYuIIgo+vMrc4mFlI0datCjE+Pg7Hk7Hr/jua+uPsWLpYG
         MdcW2tDAQO9n+ZUeExyC33cYlyXjB8WTGH6E8uMfq12VjaNw3zOt3vauwPHn0BU6N6Um
         HNm2LcBflTjCKmSuCnYgAR8Kq4OLrZ/z2CH7AoeONg9rjK+P/8snmAKJ4bn2rHbPPXoX
         BgG1G6ZrWymEjU/3q5q5yLhOoBzDG6o2T9EKxt0wMTkiJ3usNFx15AsCIWM8sgsCAhXo
         632A==
X-Forwarded-Encrypted: i=1; AJvYcCW4WCCcrw5Se09sRu9CLL/CUOXQ62gD/cfRRIUCla+4vItZ8NDCevNLX34n9v48D4b0TmbFgK0uDk4MUQ==@vger.kernel.org, AJvYcCXp0cNg05sm0SALlAy2UN6/RDPFyaIpDfVtjPC2M3pP4VY2UbCuiDhKnZlZ2wYo6XVr/3YsHDYIM0op@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh5clWBpV29GP4H23p6m0pMdOajVB+sfUpgCiE7oZaX9YeTr6J
	EZZSwlWEfX8X7sljHJcL9WeIQ441uZKOdnmiAqS4KlhTm81pPm7DKVJE
X-Gm-Gg: ASbGncuLhU/IdKrDvoURubiMBAeIw1ChGx3S0yjUbrFKVL0UZgr5d+ue1YcGBAG5IcW
	9YjewzpGWVgJKReMrQ6XQu4xyIiswu9w2OP42Zb/clC6CIddnrx6zW/IbcbXEXtA88Y1k1U/arb
	ssysoOkYg+iMfCb/EXt8YcyUjDQFVZ9yT7XEQr7XPSCsGfOCg8IfWkN7P+uX+pQ5YdNmgkf6xIG
	hNGEtu5DciSFBuV8+kLC94aAtkRz1+EJ1M+w/GMwLM9i59SMrtKbTQYKZGIokIpwSP1AAJglzl/
	v6XkvxzLtJc7soTrV9pSUDqp5fIyql9vtfpMRqLuDFBXO56dhvN0cFKDmhlnxu4N3Q==
X-Google-Smtp-Source: AGHT+IE+Thktzfk7klZt7hbeaYhyzW8cBFMRxZTuTM6H2Ki+Hnon+VOIuikj9iGA0S0PRECHDnQg/g==
X-Received: by 2002:a05:6402:26c6:b0:601:f87b:b6d3 with SMTP id 4fb4d7f45d1cf-602da2fb1afmr1060946a12.6.1748108853872;
        Sat, 24 May 2025 10:47:33 -0700 (PDT)
Received: from laptok.lan ([89.64.31.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-602f11a0e0fsm1138789a12.13.2025.05.24.10.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 10:47:33 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 07/11] HID: pidff: Use __func__ in debugs
Date: Sat, 24 May 2025 19:47:20 +0200
Message-ID: <20250524174724.1379440-8-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250524174724.1379440-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250524174724.1379440-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes checkpatch.pl warnings

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 743b76c8d3b2..88eb832265a4 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -940,7 +940,7 @@ static int pidff_find_fields(struct pidff_usage *usage, const u8 *table,
 			     struct hid_report *report, int count, int strict)
 {
 	if (!report) {
-		pr_debug("pidff_find_fields, null report\n");
+		pr_debug("%s, null report\n", __func__);
 		return -1;
 	}
 
@@ -1069,7 +1069,7 @@ static struct hid_field *pidff_find_special_field(struct hid_report *report,
 						  int usage, int enforce_min)
 {
 	if (!report) {
-		pr_debug("pidff_find_special_field, null report\n");
+		pr_debug("%s, null report\n", __func__);
 		return NULL;
 	}
 
-- 
2.49.0


