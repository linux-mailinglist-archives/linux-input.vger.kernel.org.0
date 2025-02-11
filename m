Return-Path: <linux-input+bounces-9958-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5D9A30E69
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2025 15:35:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE895188A3B5
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2025 14:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 473D02505DC;
	Tue, 11 Feb 2025 14:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c2eR1oic"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586552505DE;
	Tue, 11 Feb 2025 14:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739284524; cv=none; b=PdiE9AQBUpRHTyi6IUB2+tv2K7aB7I32uITXDrItPYhb0+8hs9ZxGtpUBjksKht9Gvy5ogYh0WKMi9NWOp50p62KQUXL2QJ+eq3/NjoIH95R/hUHcZ18xWnD9BREeD9epXwoSC+x259cYJf5SO5DjSepVbcTNjtvkhyn2TQUI8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739284524; c=relaxed/simple;
	bh=eUbxUt5xpTtxEzNiYKqCsSF7kyQ0xB70W44K9/NfqI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Eg0WyoT73izvniUdlnx6iEGldDnAdXbZzTwDmAXmYKWpZmRW+nBMa0hZ9vTMkusgEQLz7+fCtfnkTiiycKYIwhIpW8rXjgwcmyVXYzvfAyzyTqpb0PGrRNpkU6nmvDcl5X29ZeWkM40SmbqimQzYE/QMkvk+zxsE/wsKu0XiKqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c2eR1oic; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-308f29cca65so1484491fa.2;
        Tue, 11 Feb 2025 06:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739284520; x=1739889320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KSNQINkXkN6zTTIn4J3zlyOnrY9qbrfu5RjfBEk7Udo=;
        b=c2eR1oic98G2ANtjzhRlaG9aVtV8wK3+ivYAoMWq/XA24VF/IrWw/Y7eUcCTWDxs6K
         4m0ikRpFZ9LL4h4lZFhddVe9RkFobIcu+ttaelym6fb2bD1MUptkXe5F/TEL8IHJZtjM
         ZtXq7FFTxXxMDa6GcVe8A+L4fjjZdSdxdXoj1UsxnKHJ4Zk8CJankLC5yxif+296cdnb
         lQG2EuYmwoAhwk+cvN3JKtDmDD9u808uAg7FUhsWXXBgWNgWudtL7CFjI6IEK3SngANL
         aNJLSa55Xb63UWDTmuMmWpjnMk3esndG6KDwmkwJctYUVniw5DcaN5D9kswQE2pSpszv
         4h3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739284520; x=1739889320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KSNQINkXkN6zTTIn4J3zlyOnrY9qbrfu5RjfBEk7Udo=;
        b=ozNbk3XcRKWwUYzr05aKJY9bflFl0fE5IJ8iK6FI8taKciJ5AASvA6w8NASQ6utH5P
         ccEZCKt9pbgiHd/NWbHa9WHWTNgrf+TGkd6RIJH0mXlrAjJ4mrC0qFTKefa7MfT8iuHi
         VbfbI+kVvf/4UQJpWepCadeAbIHL1rUlrmCi4wYz1bV3BBbq88KVVnERR59K4XBTCOIT
         tsuOFi6cODlBuvodQj7/r6Q7mMUGH8OJ2mJ8F+wxYx30pGJPtLicTes2DHckQ9vqyYWD
         Bjx8ZJIUtK2wOfA1VT944Pa6G4R6yck+MfDAt9l6nDmIkmfEqddtodbZGJg4R22YODhO
         ovJA==
X-Forwarded-Encrypted: i=1; AJvYcCWZi1qxODvhgvPy0qn3DOHW8fg/SD/LNIamB0J8Mpk08kIp51AB4aMBFske+qmM4G2vT6SaXEJ92GRDEw==@vger.kernel.org, AJvYcCXe6dovT7MczxOUOIfSWasC9x6QDsAA0wcAXoVNgNl/WXOofcUkmwbgX6IFTNUc5v7PGIP8ec5kKYv1@vger.kernel.org
X-Gm-Message-State: AOJu0YxiqoHw1zYnE+G7p+ausM9Wf+jcsAjGRnlgRJd+ht5heglhe3TE
	NVG0D6kqZR1IuMRA3y+XeqYomWJpRlFp6BtO7NC/ZCBzSFcx+sNCMbN1CftY
X-Gm-Gg: ASbGnctXWv1mi1qwPc+Kn9aaMdI6Wfxq81VQjy2Ss3NL/nLjxgoL3uFIylGWpJbeG7+
	h4+gz/9rRoTGeDzOF3P3i5cjpVhAfwZlrCSFKGyM2G5gXyupv/nCy06Hg62iSbPi/WVmhpdV44b
	RlYbA61s5CPtRZZfpwXDgNUXFwgZu3LrmcFV0n27MZ4+SLcKwinxseKF07q9/uaB5PTMj9og2nG
	YvTjNJYORuLnKzlzxuTD/n8EboM4PoM1JFt/6KO1WLQL4vohyqKuvgDrnqAHk8JiZ88l4tUnp1/
	BU2DjoEi8iEtma7oBW1P2ZfQAHRUUjTM3liuP3T0zF8dEJiytfta5dWMNOmzKg==
X-Google-Smtp-Source: AGHT+IHbxSnhzn1tWsqu6FOSdXVq+lRf+ogN4EO+v55qwd7onSxqzzqK4W2LtiKSN/k7p+6f/trcMQ==
X-Received: by 2002:a2e:be86:0:b0:308:f79d:f0d4 with SMTP id 38308e7fff4ca-308fbe2be0dmr2914341fa.3.1739284520092;
        Tue, 11 Feb 2025 06:35:20 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-308ee4173edsm6132191fa.0.2025.02.11.06.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 06:35:19 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v4 2/6] HID: pidff: Make sure to fetch pool before checking SIMULTANEOUS_MAX
Date: Tue, 11 Feb 2025 15:35:08 +0100
Message-ID: <20250211143512.720818-3-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211143512.720818-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250211143512.720818-1-tomasz.pakula.oficjalny@gmail.com>
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


