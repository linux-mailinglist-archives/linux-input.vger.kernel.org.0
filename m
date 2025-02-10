Return-Path: <linux-input+bounces-9905-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B070A2F146
	for <lists+linux-input@lfdr.de>; Mon, 10 Feb 2025 16:18:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 562E3166DEF
	for <lists+linux-input@lfdr.de>; Mon, 10 Feb 2025 15:18:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D07D02397B9;
	Mon, 10 Feb 2025 15:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KSn2AkTR"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07BC2528EB;
	Mon, 10 Feb 2025 15:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739200684; cv=none; b=Ck31HfkiNeecTZN5WpddUsducpRKaj+XIt+32MrAWc4bD1awbKr8hTmLnFfKPUABKPo3jOvqd/i/49MDMjdabXEqFnyIlQBHGUHTaWOuO5ViYlkFQoyALui5FGJArbe3aaSo14qqND5+HXBKa7ZAtjfcwc1nf9ieIeaclACMP30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739200684; c=relaxed/simple;
	bh=eUbxUt5xpTtxEzNiYKqCsSF7kyQ0xB70W44K9/NfqI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k6EIMKcnlFY6K45sWJtds1jPqQxL1EpNa6R0JH1r6753Nlqn12d/j6hUrJaRuB9SGNuOEfUR0uDjotcG8UD84Uluv2xHshHNa+Tf4gVTekh6kMeHZgKlc2ROsamGnLj69YgXsW0G9HXhZDxmc+gSfl/kuqIatDjADrYUWk/wpRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KSn2AkTR; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-308d9b7a888so2392891fa.1;
        Mon, 10 Feb 2025 07:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739200681; x=1739805481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KSNQINkXkN6zTTIn4J3zlyOnrY9qbrfu5RjfBEk7Udo=;
        b=KSn2AkTRzFW3+/iXuT7/i6dZoNyvSs2BerOljgs26WRzGHtAdVxkO0SC/nXo6HxLnY
         V2Y06c15eEXa0etF+2TWgKpq4mFTlLKKrDfoIzZIIqLZK/Sojawn8CO37vBKhfYce0ih
         th8bABAYoZrLnGHknwO1SU7TsOpGkV/W29sj9iObJcx3p3ikiibtpV8imDeG7Rulz8Ah
         FPwV6lvMg0q+kB1x1Xz8TWWTxRAQBdvJMuVvJtJdOExMqsh5I3CvDcWvgdIRgV2MYvqt
         w+9adtQkAekMIrmCYx6xGc6+UlcbQhjfA4Qs26NKLGTsGooJkkKkYVRrNxnftytQ8EUD
         jgCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739200681; x=1739805481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KSNQINkXkN6zTTIn4J3zlyOnrY9qbrfu5RjfBEk7Udo=;
        b=gn9iILxoc25vLGvMwziVUa1j/4PS6WClO0k39OdDDiq9STYAExoepCMgWhMFqAVH3K
         ZsWK+NTMbU4NtuhGiGOIbripuLEuewjxwR2sTbH/fvh3XyLrrOXdO9pfvXKAKQ5/0evZ
         hsWfPCO7V/fKQ3Lb3qGwDKVsWVUa1iJo1FXa3gZis9tOdT0U48TvPrSOde/ur59xY0N3
         yH+Lz6nBktyo4QbMOU1Y9pENdv1HkYSxlvsZSdHEFx8BWZhVXJs9BLHIh0f8iCojByRy
         30FfH595CRNtwtOmk2DAi1Hta1jR4CAYSAZD09sGq9WPTLMe6G1q2JjI2HqP+0pKZHD9
         xfuw==
X-Forwarded-Encrypted: i=1; AJvYcCUN7oTNiR62TF0Tl5wDNyItKE6Q6IxnAgSGW4hchrIJdrZ7m63fcm238NjuwQnj61+Bl0ZSxQUTzpRI@vger.kernel.org, AJvYcCXtd2HMqpdp18v6IbUD3MsNuWbum3wEk75KCmDHAVjpwoHgPYkJtXhwcdH3NWKwPsSfsUH8NcvVT7XytQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiZX2J6u8Ua/+PsoM19UY9nndsfEPg9C4rtvagmG0DxBa/EQt+
	RXE161bLR+MHkV1S2Wne93U5rqbMZnGLoH23R4sta4YwIIP5u7bb
X-Gm-Gg: ASbGncsRgXyYL8eAg/zqe0/acHXHpYEG2EfPEAe3UiZpAXTK7im5k2wcgAmjoAAPYTJ
	G3TC7kX49owZK79jvehORp+EaDFcxOZcy9M025wHZG04yKzDCFVajPko/xWoFA3pkK4eZtGIS/9
	8ZvdCWhR/oIvURBNhNjqnkH4hWFWevqT296N29PyKcM5rsotpu4vCd4jpi+sAqp1UEdN2NckaAb
	tjlXLpttcT3FRdoqmaCADV744fVUySGh74Yi7Fh1nplStiV8XpCI6XjvR3sOjIUHE4jBySiuaDe
	3YkWsCwqH+Hw+Bq9/NMZNFROe21rEc4QelD+iGVmB+iuQH3Fn1MqFbITpDoFUQ==
X-Google-Smtp-Source: AGHT+IEA2Mu156xWr0A57Ha9a7hXCVlLPkCy8Jduz79q9IapbfTcnHwDRtTH7d+l+DOn7vYshEun1g==
X-Received: by 2002:a2e:be89:0:b0:307:2aea:559a with SMTP id 38308e7fff4ca-307e5b8d945mr15470521fa.9.1739200680601;
        Mon, 10 Feb 2025 07:18:00 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de178201sm12090561fa.16.2025.02.10.07.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 07:18:00 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 2/6] HID: pidff: Make sure to fetch pool before checking SIMULTANEOUS_MAX
Date: Mon, 10 Feb 2025 16:17:50 +0100
Message-ID: <20250210151754.368530-3-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210151754.368530-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250210151754.368530-1-tomasz.pakula.oficjalny@gmail.com>
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
 drivers/hid/usbhid/hid-pidff.c | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index f23381b6e344..503f643b59ca 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -604,28 +604,25 @@ static void pidff_reset(struct pidff_device *pidff)
 }
 
 /*
- * Refetch pool report
+ * Fetch pool report
  */
 static void pidff_fetch_pool(struct pidff_device *pidff)
 {
-	if (!pidff->pool[PID_SIMULTANEOUS_MAX].value)
-		return;
+	int i;
+	struct hid_device *hid = pidff->hid;
 
-	int i = 0;
-	while (pidff->pool[PID_SIMULTANEOUS_MAX].value[0] < 2) {
-		hid_dbg(pidff->hid, "pid_pool requested again\n");
-		hid_hw_request(pidff->hid, pidff->reports[PID_POOL],
-				HID_REQ_GET_REPORT);
-		hid_hw_wait(pidff->hid);
+	/* Repeat if PID_SIMULTANEOUS_MAX < 2 to make sure it's correct */
+	for(i = 0; i < 20; i++) {
+		hid_hw_request(hid, pidff->reports[PID_POOL], HID_REQ_GET_REPORT);
+		hid_hw_wait(hid);
 
-		/* break after 20 tries with SIMULTANEOUS_MAX < 2 */
-		if (i++ > 20) {
-			hid_warn(pidff->hid,
-				 "device reports %d simultaneous effects\n",
-				 pidff->pool[PID_SIMULTANEOUS_MAX].value[0]);
-			break;
-		}
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


