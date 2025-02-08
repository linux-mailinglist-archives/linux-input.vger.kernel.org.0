Return-Path: <linux-input+bounces-9857-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1ABA2D7C5
	for <lists+linux-input@lfdr.de>; Sat,  8 Feb 2025 18:36:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B942B18889F2
	for <lists+linux-input@lfdr.de>; Sat,  8 Feb 2025 17:36:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7BA11F3B9D;
	Sat,  8 Feb 2025 17:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WXhj7X5g"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC354241CBE;
	Sat,  8 Feb 2025 17:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739036198; cv=none; b=f9opkqZzj8R1OVleBuCEUE0jWtAWdDZQEqGeSgh8xsm5BWOKIccCHIcllNHEUkkhFzF2uO0MHUaKB3NdXOZfVr22GScInUSLXpZ5JcaXKR8MvfMxikkrpKai13d6Sl65RO/Q5fv/XC+XFqE+MjJP3u763CVJv482Ys6iMZVKMKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739036198; c=relaxed/simple;
	bh=EFm9B1zuoNpYKwHlryPcFLvgSwAGhPb/usi94fz0fss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EIGxeUh2LHZm+ccLNR7rz01wntQkhOhFkC0HFEqsHPQfKPa+eGGdB3Cbj4WjobHpyq6ZjXBSs2C2tKvg96RRLVlGuSug0XfoC/fcSKyqGkCAQz7sJE2v0/XXVH5d1MRJL7J2rNQUkD6bOZxRi77f414g7VulzXAAEiFlY5e2XKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WXhj7X5g; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5450268e513so144646e87.3;
        Sat, 08 Feb 2025 09:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739036194; x=1739640994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BsCCG2+d6Itgr8qq0djxtF9xLECC7cWts2B/KnnI0xo=;
        b=WXhj7X5gRmW1w7Cj4VRxP/LN7w5Qlkcz1NgTC4jOKAsLWysQnfpHZBBX+NLb5tEVEI
         6eWDMUADqBoiXOUhnx4RCuqIRAFJsMIywMYyPHJ3D5DXaKxBeG9hehE19Goc7mDXWewP
         5xipFWLZFNkHe4cma+KIVVWFC0TPbeyqUtCGRMAhTCT69R1Lr4Sp+5kp/ZRAtThwLa/n
         3gMUq7GCyvmPJMgn4ZglFZzRj1fv/Hwe9EWK5B2Epnnu7+zjA4R0nTZSrXmtmYTL431W
         CgLDDWbRyoaKkHJYhV+pRLNMr3ckhB/uVGIO+XOlAAwwjczRuxDjGY+oJUVVgbuRltfP
         lT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739036194; x=1739640994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BsCCG2+d6Itgr8qq0djxtF9xLECC7cWts2B/KnnI0xo=;
        b=FPAtLdXLeOSNZB8TPVoYf+v8MMgI5Xhs5oFubQS1D2PaZBw7f1dIuNY3fNc60OKDKx
         gcC8+nuY+1myIeOg7Dta4C/latD8pxlAk2WRQHXSraG/ZxtqQGX6yB96ClpeeTWJJAAT
         3EOwaAYXpTfAV7S71KGsyKho97FY+w3KFTuKRKXVP4UrXlx7IhoJNMy47MZVglZYR1N2
         I0ZPuh8NQ86XiomVWwRDP6d18CYmKSqESrCrh/kzhGMpiveAvXr4/v4xLk4ZOgvEFj1Q
         o34MbxXhfuED1mvyybVv/3pBS0iHcja+J3lMhGWjKLBgDOZRdp9EY3kiO/OMXAALtbOd
         XU7A==
X-Forwarded-Encrypted: i=1; AJvYcCUQwln6SQX0fRQtSjMiqUm4UMrJgwK8IiIDMOwWrN+tXeD5qE7bVJ2loaC8OSIPgYRP76uN4WK7biCThw==@vger.kernel.org, AJvYcCWWgMnNgW12sTm3WVPjHKnz5LWr26HmnHSuF21upL91zT6zJC6obAjtCoBZMcInJy5cmLdWYcvkRquX@vger.kernel.org
X-Gm-Message-State: AOJu0YwTbGI5yXVxVP/Pj8aHpkWhnPWcMsr0AeaSaaBHKmHwJgZZH0PY
	Ye55Wh87qQp6HfnjNJqwqZg7Ovy9vI1n9h+RD27diI0iVY7/MqQO
X-Gm-Gg: ASbGncugyxT2yjMwPLSLSMiQxz+MWNRmQXGDlJU6FgZX44ExrTodHiHDIHlO0dOQpj6
	oT2EoWIF6uRNrbr3G6U9EfUArfK0iI1pvClg6tCW+CuHKjhxXhnEkUB90cKrdLD6NhDjkmsLe0O
	2XF+NK1pPSN5IXGSB0s79FhiYUS3fZ5UgtMo9UNYXli05gUECPnxvEzen19L2BYraySFRQgpLz5
	1JTr3oZk1Ctpc6HtZh1DrVeA1oHQ7F7KfZn4brEeoDDRhqulQpAU70up1+NMx2Fz78Oa0oD57K/
	Ful18vrHLbUzh2z15lE8SPPqEZsW8uLndSZ+uwy/4QHF7gT/rsqgR1aLDIib9A==
X-Google-Smtp-Source: AGHT+IEosY/otBc8OnVLqT6CbyGxzQPuSJHIEfGq1ufU7y/h67MwkRcHD3g9TobATdWNerO95qERzQ==
X-Received: by 2002:a05:6512:31d0:b0:542:19ef:9888 with SMTP id 2adb3069b0e04-54414ab6965mr1010400e87.4.1739036193694;
        Sat, 08 Feb 2025 09:36:33 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5441053ed99sm774808e87.3.2025.02.08.09.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 09:36:33 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 2/3] HID: pidff: Make sure to fetch pool before checking SIMULTANEOUS_MAX
Date: Sat,  8 Feb 2025 18:36:27 +0100
Message-ID: <20250208173628.5734-3-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250208173628.5734-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250208173628.5734-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As noted by Anssi some 20 years ago, pool report is sometimes messed up.
This worked fine on many devices but casued oops on VRS DirectForce PRO.

Here, we're making sure pool report is refetched before trying to access
any of it's fields. While loop was replaced with a for loop + exit
conditions were moved aroud to decrease the possibility of creating an
infinite loop scenario.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 34 ++++++++++++++++------------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index f23381b6e344..acdcc0af86ba 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -604,28 +604,26 @@ static void pidff_reset(struct pidff_device *pidff)
 }
 
 /*
- * Refetch pool report
+ * Fetch pool report
  */
 static void pidff_fetch_pool(struct pidff_device *pidff)
 {
-	if (!pidff->pool[PID_SIMULTANEOUS_MAX].value)
-		return;
-
-	int i = 0;
-	while (pidff->pool[PID_SIMULTANEOUS_MAX].value[0] < 2) {
-		hid_dbg(pidff->hid, "pid_pool requested again\n");
-		hid_hw_request(pidff->hid, pidff->reports[PID_POOL],
-				HID_REQ_GET_REPORT);
-		hid_hw_wait(pidff->hid);
-
-		/* break after 20 tries with SIMULTANEOUS_MAX < 2 */
-		if (i++ > 20) {
-			hid_warn(pidff->hid,
-				 "device reports %d simultaneous effects\n",
-				 pidff->pool[PID_SIMULTANEOUS_MAX].value[0]);
-			break;
-		}
+	int i;
+	struct hid_device *hid = pidff->hid;
+
+	/* Try 20 times if PID_SIMULTANEOUS_MAX < 2.
+	   We must make sure this isn't just an error */
+	for(i = 0; i < 20; i++) {
+		hid_hw_request(hid, pidff->reports[PID_POOL], HID_REQ_GET_REPORT);
+		hid_hw_wait(hid);
+
+		if (!pidff->pool[PID_SIMULTANEOUS_MAX].value)
+			return;
+		if (pidff->pool[PID_SIMULTANEOUS_MAX].value[0] >= 2)
+			return;
 	}
+	hid_warn(hid, "device reports %d simultaneous effects\n",
+		 pidff->pool[PID_SIMULTANEOUS_MAX].value[0]);
 }
 
 /*
-- 
2.48.1


