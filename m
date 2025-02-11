Return-Path: <linux-input+bounces-9951-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F7AA30D97
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2025 15:03:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F1B23A33C1
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2025 14:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66EE124C69E;
	Tue, 11 Feb 2025 14:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="delR3+b1"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF2224C698;
	Tue, 11 Feb 2025 14:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739282586; cv=none; b=kVRyx5Y2xs5y2bz8YUUIlCsvyDZfi0i4MmTD2wdSHTzEErA50QARHofbbd2zzBWi+XhJjHGXSux1i04kEd2CXZfZkPwhXocOWanKX/T0Jz4jmnNIjmyIEDHLTTjrrpaubyD0Tu8ne04g7DxeYhnO4cbsqKQSK0Usbj3dqptT27U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739282586; c=relaxed/simple;
	bh=eUbxUt5xpTtxEzNiYKqCsSF7kyQ0xB70W44K9/NfqI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WGwEN4X4Bj/xb+7aP+0m6cVOajCM1Fwd4Mud0UD5wbpSUDULVPKhGLdRswZfmGVOmUeltr7sKzm/3jZhjNEuLfFMFRP888SLb53LSWTW2ZmPDduxZ5A0sIAy/Z2OSWy7vsOadp0Gp/sikY/fQwP3hBLc9AH/8Fa6azGvphFOq7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=delR3+b1; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5450e09b65fso250285e87.3;
        Tue, 11 Feb 2025 06:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739282583; x=1739887383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KSNQINkXkN6zTTIn4J3zlyOnrY9qbrfu5RjfBEk7Udo=;
        b=delR3+b1DVqb5vs2ByU5cxrYZ11LsaB+uZNFfl5rbPNOiMDlz55CFOPXNaQVSmL37R
         j/ZZpza0RERYOzuJM/QGEa8z7c9BhBqWE+50uP6cBlKb600Rq1KhqSSdd+kQNPgOdUd/
         zOsRoEtLvRQ+0w1/Slg9iaH0TFM0g5Kq5wrjbTP8M6FHQxcS939VM2bbacDQars3ReoA
         0wmbo7b+Vkdwf2pCt8S7P4QpL97P4/7f/MwdU5Xl82lvUMt6Ez/oWRGrDKtJ2GP7AyXC
         P9e0JHjeZ8dHJDwGdYbbRh9Et9b7AeLdfUkt1yKwE8DASqtisq0euqRAnu9cgcg9dAF2
         yL/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739282583; x=1739887383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KSNQINkXkN6zTTIn4J3zlyOnrY9qbrfu5RjfBEk7Udo=;
        b=k0rG6J/r+/781yW6Rdp1Alvj1Py5SXuL44XLw3jP1C9ymKIqkGoqRxDgv7nroMcRBr
         65kGer3mhtpbpLh6C88p0rSfvTMQvXG5zixpPSALgJ5RoOJcfb4r1dbKA7Qj5YqzwqUW
         HXyYyBP4j5BbI1J1UsXVfjoyiCtiBe0H5O7ZincYJP5blyCH/Oi6/E3euE9Kfsv8pniT
         OKwzCeqEteeb+eYB3tDAc5sdQJS+3gBWBqKo3PwlhYis7S9X2DPBi6xR5rq4muVzLebv
         XP/xIS9mUY6HBmBnFpp5glsFqeuMeH7XnZn0kgwCaxqbmYnpr6rFUWdes5NQYOfvElGT
         oftQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPPyG47pWKFuBst8cAX93ZkIHXismQuxDm828yH93EV8h84PGnvPzXWkJJ2St8+eemyNulIFWeFp67@vger.kernel.org, AJvYcCXpX5X2QzDkr4eF/tNwpRlvgJL0pWWN1MIZ5eOzT+a4Q8cOkWU41smgHDh+pv6Yph8kYjdfCLA5H+NxiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnOgLwhtBVL9HeYmFiY+14g9HBQiuStHDNUKWqfZGVxN/mcpQG
	RIaJe+mg2Ofe1cCzwsnfMaAhsGafjyZZPRH68dYeq/5fvTF6+Dh9
X-Gm-Gg: ASbGncu94RJy51uzUyih0PbbACc0eFvITlga91FPGxrmlSPL8pRcOh4XlBb+sMZbbHq
	hVBGoO4GwxqGhadyI6EiTif4buRAxOcza9Pg2RnEPEV/O09d/CigqkRdHzjhT7PVJ1Wp/+m4XLb
	new9SFKLiMfY5D9+H6Z5+RmwxJBjNt+ij3lxeTcJ6kzGu98nKhIahnDX6J+nw7L/LyH6EiT6bF9
	S+2CguhAuzUATymZ1wIb3/2fAgtKCI/Fo2GukmQ/65DfvGrY5+poxCHCcrwJhCI7CZVEI226lai
	oFvT5i439sHZxCeyRnZ49KkAaA8jZkiT2cUc8fOH16j/7/jGSZ9D4TOHP8WA6w==
X-Google-Smtp-Source: AGHT+IFMwKZtZNvbeY1OPx+TfviYiHqhlkhU9e99ji237Ci+JASpfPOndVu+FqBJhHKDkXMuYqbdaw==
X-Received: by 2002:ac2:57c2:0:b0:545:fa6:3590 with SMTP id 2adb3069b0e04-54513ad2d75mr237245e87.1.1739282581958;
        Tue, 11 Feb 2025 06:03:01 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-545014af0d0sm1118721e87.184.2025.02.11.06.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 06:03:00 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v3 2/6] HID: pidff: Make sure to fetch pool before checking SIMULTANEOUS_MAX
Date: Tue, 11 Feb 2025 15:02:48 +0100
Message-ID: <20250211140252.702104-3-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211140252.702104-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250211140252.702104-1-tomasz.pakula.oficjalny@gmail.com>
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


