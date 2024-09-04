Return-Path: <linux-input+bounces-6125-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E7D96AFD8
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 06:31:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B8BD1C21084
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 04:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECDA583CD2;
	Wed,  4 Sep 2024 04:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TuhQiexi"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF8A823DE;
	Wed,  4 Sep 2024 04:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725424279; cv=none; b=URWGOm2KGbcuS7/QfKF4Z+tJvTPeG2jXGyvr5drwQ96es3JH/NTimupTJTnl8TgUtrnfxNVpEGjyGHfuVa4x5H2i70cd5QNnEHDTv4tq6yrN9+6YAowoV1kRrzgeEAx1thYxnfiAUOH/gBULzQmGllCGSPz88SERjZULpjc9zrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725424279; c=relaxed/simple;
	bh=CFJVsOPx90AxULBy5akrpax+TBZQuboU2SraioZ4Low=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dWU4/5Jdz7O68E77s/vlX0wgmj0s+ZKMl6m30BGEHn72OK8h+tzYHobZ2knYyaeq3M2k1+sJkPhQydzcAoZGaIrWU6kKHcGXHT0K87G8DbhnClYfxkAA+xumqpq95SyOhQpcfihO6gJbeHaUh79U+6QMr9f/xREATHT3tILBDIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TuhQiexi; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7cd9d408040so4540737a12.0;
        Tue, 03 Sep 2024 21:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725424277; x=1726029077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W6XdSiBXsmBN1finzDUHBvynyjPDNiPKK0O7rO2yo3o=;
        b=TuhQiexi4QMnThZLT74aXwCJVyMcmEWwrVRFzIgQH+ZhUQYMaE72MX5raoI1Qe+GKs
         J49scu6xy7hyDi5BmW/B5u3QdH78xS8mjiuVwjFpo2VMQof1AJ46ha8C35xmPpJrEiL4
         /90jFpYwN7iHBganHvy6tUfd3sxiJ9XxSCzSLr6cHk/XWB/1UB97Nlz2kPFyhSKvub9X
         yvQfmmbedtKOoojvPq/bvy3XqzUE6kwwUv/hj0Gw8VblmzWC+A0zDXTvfikyDLSGqNli
         9b91S1JG37OpVwajWhCiMLVOlBp7feyl7VuHxQs4+CFHAXq52Ve8doXj3V3MMCAPY+mg
         71hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725424277; x=1726029077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W6XdSiBXsmBN1finzDUHBvynyjPDNiPKK0O7rO2yo3o=;
        b=jOlOPHfPJcK/3bR+KSjCHk4M0FTCfzQkveQ5mOzBF05gNfAjj5tS/utL2cchLH4H5E
         +hSk5eqCVPNtXCdqsYbmux0KnnqivdsYeQBm8/8mIWSbzFswY/vf4cchjXdmu4CRLiP3
         zatt9zQRiJpBE3310ZADTHNYYajd2CkkK6e3UpQeBYpHkfeaOxaEUKqT+pkBjEr6nd90
         xYMAi13EX9PufYOCueIcPXo/Je1PjJa+w6Q9nEoKmyS2tmO3RfcV4Hx7D3vQP6uiv8kI
         Jjrg72ps50VdrVfs4c1oyfZsPAGuuF1ptxkon3Do6mnmkplOSiJPMQTgA+RzsSkSBDMQ
         G5mg==
X-Forwarded-Encrypted: i=1; AJvYcCXJSDqSP/i1MQesM8MTF8eoko1eGQdVhLPnEFbymB/7bMMGchGBHdtzR5hNXFh8vkq4GFWEF7utPfbehm8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHQIuTsBtKaoeHiWACCGlXporZ8Hl4uMqVLJqQ/T8l2xmZvcaf
	UsJdQBi2Kcpjo6PgcRpja+LWhwi+4IVmhVd3bT82//ITxls7Y3Bb7g7k/Q==
X-Google-Smtp-Source: AGHT+IGJFu6hewiFTP2KUs5gSTWLveSHSZ+1Qrxh8bE7dgAf5m2RmiKeIeGDwfnSfsPfl4saTTyYFw==
X-Received: by 2002:a05:6a20:b40a:b0:1ce:f77a:67e5 with SMTP id adf61e73a8af0-1cef77a69f1mr6406930637.47.1725424277143;
        Tue, 03 Sep 2024 21:31:17 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:e682:e3dc:908:eef0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206aea392e3sm5503555ad.135.2024.09.03.21.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 21:31:16 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Erick Archer <erick.archer@outlook.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] Input: iforce - use guard notation when acquiring mutex and spinlock
Date: Tue,  3 Sep 2024 21:31:00 -0700
Message-ID: <20240904043104.1030257-4-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240904043104.1030257-1-dmitry.torokhov@gmail.com>
References: <20240904043104.1030257-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using guard notation makes the code more compact and error handling
more robust by ensuring that locks are released in all code paths
when control leaves critical section.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/joystick/iforce/iforce-ff.c     | 48 +++++++---------
 .../input/joystick/iforce/iforce-packets.c    | 57 ++++++++-----------
 drivers/input/joystick/iforce/iforce-serio.c  | 36 +++++-------
 drivers/input/joystick/iforce/iforce-usb.c    | 13 ++---
 4 files changed, 68 insertions(+), 86 deletions(-)

diff --git a/drivers/input/joystick/iforce/iforce-ff.c b/drivers/input/joystick/iforce/iforce-ff.c
index 95c0348843e6..8c78cbe553c8 100644
--- a/drivers/input/joystick/iforce/iforce-ff.c
+++ b/drivers/input/joystick/iforce/iforce-ff.c
@@ -21,14 +21,13 @@ static int make_magnitude_modifier(struct iforce* iforce,
 	unsigned char data[3];
 
 	if (!no_alloc) {
-		mutex_lock(&iforce->mem_mutex);
-		if (allocate_resource(&(iforce->device_memory), mod_chunk, 2,
-			iforce->device_memory.start, iforce->device_memory.end, 2L,
-			NULL, NULL)) {
-			mutex_unlock(&iforce->mem_mutex);
+		guard(mutex)(&iforce->mem_mutex);
+
+		if (allocate_resource(&iforce->device_memory, mod_chunk, 2,
+				      iforce->device_memory.start,
+				      iforce->device_memory.end,
+				      2L, NULL, NULL))
 			return -ENOSPC;
-		}
-		mutex_unlock(&iforce->mem_mutex);
 	}
 
 	data[0] = LO(mod_chunk->start);
@@ -54,14 +53,13 @@ static int make_period_modifier(struct iforce* iforce,
 	period = TIME_SCALE(period);
 
 	if (!no_alloc) {
-		mutex_lock(&iforce->mem_mutex);
-		if (allocate_resource(&(iforce->device_memory), mod_chunk, 0x0c,
-			iforce->device_memory.start, iforce->device_memory.end, 2L,
-			NULL, NULL)) {
-			mutex_unlock(&iforce->mem_mutex);
+		guard(mutex)(&iforce->mem_mutex);
+
+		if (allocate_resource(&iforce->device_memory, mod_chunk, 0x0c,
+				      iforce->device_memory.start,
+				      iforce->device_memory.end,
+				      2L, NULL, NULL))
 			return -ENOSPC;
-		}
-		mutex_unlock(&iforce->mem_mutex);
 	}
 
 	data[0] = LO(mod_chunk->start);
@@ -94,14 +92,13 @@ static int make_envelope_modifier(struct iforce* iforce,
 	fade_duration = TIME_SCALE(fade_duration);
 
 	if (!no_alloc) {
-		mutex_lock(&iforce->mem_mutex);
+		guard(mutex)(&iforce->mem_mutex);
+
 		if (allocate_resource(&(iforce->device_memory), mod_chunk, 0x0e,
-			iforce->device_memory.start, iforce->device_memory.end, 2L,
-			NULL, NULL)) {
-			mutex_unlock(&iforce->mem_mutex);
+				      iforce->device_memory.start,
+				      iforce->device_memory.end,
+				      2L, NULL, NULL))
 			return -ENOSPC;
-		}
-		mutex_unlock(&iforce->mem_mutex);
 	}
 
 	data[0] = LO(mod_chunk->start);
@@ -131,14 +128,13 @@ static int make_condition_modifier(struct iforce* iforce,
 	unsigned char data[10];
 
 	if (!no_alloc) {
-		mutex_lock(&iforce->mem_mutex);
+		guard(mutex)(&iforce->mem_mutex);
+
 		if (allocate_resource(&(iforce->device_memory), mod_chunk, 8,
-			iforce->device_memory.start, iforce->device_memory.end, 2L,
-			NULL, NULL)) {
-			mutex_unlock(&iforce->mem_mutex);
+				      iforce->device_memory.start,
+				      iforce->device_memory.end,
+				      2L, NULL, NULL))
 			return -ENOSPC;
-		}
-		mutex_unlock(&iforce->mem_mutex);
 	}
 
 	data[0] = LO(mod_chunk->start);
diff --git a/drivers/input/joystick/iforce/iforce-packets.c b/drivers/input/joystick/iforce/iforce-packets.c
index 763642c8cee9..8c2531e2977c 100644
--- a/drivers/input/joystick/iforce/iforce-packets.c
+++ b/drivers/input/joystick/iforce/iforce-packets.c
@@ -31,49 +31,42 @@ int iforce_send_packet(struct iforce *iforce, u16 cmd, unsigned char* data)
 	int c;
 	int empty;
 	int head, tail;
-	unsigned long flags;
 
 /*
  * Update head and tail of xmit buffer
  */
-	spin_lock_irqsave(&iforce->xmit_lock, flags);
-
-	head = iforce->xmit.head;
-	tail = iforce->xmit.tail;
-
-
-	if (CIRC_SPACE(head, tail, XMIT_SIZE) < n+2) {
-		dev_warn(&iforce->dev->dev,
-			 "not enough space in xmit buffer to send new packet\n");
-		spin_unlock_irqrestore(&iforce->xmit_lock, flags);
-		return -1;
-	}
+	scoped_guard(spinlock_irqsave, &iforce->xmit_lock) {
+		head = iforce->xmit.head;
+		tail = iforce->xmit.tail;
+
+		if (CIRC_SPACE(head, tail, XMIT_SIZE) < n + 2) {
+			dev_warn(&iforce->dev->dev,
+				 "not enough space in xmit buffer to send new packet\n");
+			return -1;
+		}
 
-	empty = head == tail;
-	XMIT_INC(iforce->xmit.head, n+2);
+		empty = head == tail;
+		XMIT_INC(iforce->xmit.head, n + 2);
 
 /*
  * Store packet in xmit buffer
  */
-	iforce->xmit.buf[head] = HI(cmd);
-	XMIT_INC(head, 1);
-	iforce->xmit.buf[head] = LO(cmd);
-	XMIT_INC(head, 1);
-
-	c = CIRC_SPACE_TO_END(head, tail, XMIT_SIZE);
-	if (n < c) c=n;
-
-	memcpy(&iforce->xmit.buf[head],
-	       data,
-	       c);
-	if (n != c) {
-		memcpy(&iforce->xmit.buf[0],
-		       data + c,
-		       n - c);
+		iforce->xmit.buf[head] = HI(cmd);
+		XMIT_INC(head, 1);
+		iforce->xmit.buf[head] = LO(cmd);
+		XMIT_INC(head, 1);
+
+		c = CIRC_SPACE_TO_END(head, tail, XMIT_SIZE);
+		if (n < c)
+			c = n;
+
+		memcpy(&iforce->xmit.buf[head], data, c);
+		if (n != c)
+			memcpy(&iforce->xmit.buf[0], data + c, n - c);
+
+		XMIT_INC(head, n);
 	}
-	XMIT_INC(head, n);
 
-	spin_unlock_irqrestore(&iforce->xmit_lock, flags);
 /*
  * If necessary, start the transmission
  */
diff --git a/drivers/input/joystick/iforce/iforce-serio.c b/drivers/input/joystick/iforce/iforce-serio.c
index 2380546d7978..75b85c46dfa4 100644
--- a/drivers/input/joystick/iforce/iforce-serio.c
+++ b/drivers/input/joystick/iforce/iforce-serio.c
@@ -28,45 +28,39 @@ static void iforce_serio_xmit(struct iforce *iforce)
 							 iforce);
 	unsigned char cs;
 	int i;
-	unsigned long flags;
 
 	if (test_and_set_bit(IFORCE_XMIT_RUNNING, iforce->xmit_flags)) {
 		set_bit(IFORCE_XMIT_AGAIN, iforce->xmit_flags);
 		return;
 	}
 
-	spin_lock_irqsave(&iforce->xmit_lock, flags);
+	guard(spinlock_irqsave)(&iforce->xmit_lock);
 
-again:
-	if (iforce->xmit.head == iforce->xmit.tail) {
-		iforce_clear_xmit_and_wake(iforce);
-		spin_unlock_irqrestore(&iforce->xmit_lock, flags);
-		return;
-	}
+	do {
+		if (iforce->xmit.head == iforce->xmit.tail)
+			break;
 
-	cs = 0x2b;
+		cs = 0x2b;
 
-	serio_write(iforce_serio->serio, 0x2b);
+		serio_write(iforce_serio->serio, 0x2b);
 
-	serio_write(iforce_serio->serio, iforce->xmit.buf[iforce->xmit.tail]);
-	cs ^= iforce->xmit.buf[iforce->xmit.tail];
-	XMIT_INC(iforce->xmit.tail, 1);
-
-	for (i=iforce->xmit.buf[iforce->xmit.tail]; i >= 0; --i) {
 		serio_write(iforce_serio->serio,
 			    iforce->xmit.buf[iforce->xmit.tail]);
 		cs ^= iforce->xmit.buf[iforce->xmit.tail];
 		XMIT_INC(iforce->xmit.tail, 1);
-	}
 
-	serio_write(iforce_serio->serio, cs);
+		for (i = iforce->xmit.buf[iforce->xmit.tail]; i >= 0; --i) {
+			serio_write(iforce_serio->serio,
+				    iforce->xmit.buf[iforce->xmit.tail]);
+			cs ^= iforce->xmit.buf[iforce->xmit.tail];
+			XMIT_INC(iforce->xmit.tail, 1);
+		}
 
-	if (test_and_clear_bit(IFORCE_XMIT_AGAIN, iforce->xmit_flags))
-		goto again;
+		serio_write(iforce_serio->serio, cs);
 
-	iforce_clear_xmit_and_wake(iforce);
+	} while (test_and_clear_bit(IFORCE_XMIT_AGAIN, iforce->xmit_flags));
 
-	spin_unlock_irqrestore(&iforce->xmit_lock, flags);
+	iforce_clear_xmit_and_wake(iforce);
 }
 
 static int iforce_serio_get_id(struct iforce *iforce, u8 id,
diff --git a/drivers/input/joystick/iforce/iforce-usb.c b/drivers/input/joystick/iforce/iforce-usb.c
index cba92bd590a8..1f00f76b0174 100644
--- a/drivers/input/joystick/iforce/iforce-usb.c
+++ b/drivers/input/joystick/iforce/iforce-usb.c
@@ -25,13 +25,11 @@ static void __iforce_usb_xmit(struct iforce *iforce)
 	struct iforce_usb *iforce_usb = container_of(iforce, struct iforce_usb,
 						     iforce);
 	int n, c;
-	unsigned long flags;
 
-	spin_lock_irqsave(&iforce->xmit_lock, flags);
+	guard(spinlock_irqsave)(&iforce->xmit_lock);
 
 	if (iforce->xmit.head == iforce->xmit.tail) {
 		iforce_clear_xmit_and_wake(iforce);
-		spin_unlock_irqrestore(&iforce->xmit_lock, flags);
 		return;
 	}
 
@@ -45,7 +43,8 @@ static void __iforce_usb_xmit(struct iforce *iforce)
 
 	/* Copy rest of data then */
 	c = CIRC_CNT_TO_END(iforce->xmit.head, iforce->xmit.tail, XMIT_SIZE);
-	if (n < c) c=n;
+	if (n < c)
+		c = n;
 
 	memcpy(iforce_usb->out->transfer_buffer + 1,
 	       &iforce->xmit.buf[iforce->xmit.tail],
@@ -53,11 +52,12 @@ static void __iforce_usb_xmit(struct iforce *iforce)
 	if (n != c) {
 		memcpy(iforce_usb->out->transfer_buffer + 1 + c,
 		       &iforce->xmit.buf[0],
-		       n-c);
+		       n - c);
 	}
 	XMIT_INC(iforce->xmit.tail, n);
 
-	if ( (n=usb_submit_urb(iforce_usb->out, GFP_ATOMIC)) ) {
+	n=usb_submit_urb(iforce_usb->out, GFP_ATOMIC);
+	if (n) {
 		dev_warn(&iforce_usb->intf->dev,
 			 "usb_submit_urb failed %d\n", n);
 		iforce_clear_xmit_and_wake(iforce);
@@ -66,7 +66,6 @@ static void __iforce_usb_xmit(struct iforce *iforce)
 	/* The IFORCE_XMIT_RUNNING bit is not cleared here. That's intended.
 	 * As long as the urb completion handler is not called, the transmiting
 	 * is considered to be running */
-	spin_unlock_irqrestore(&iforce->xmit_lock, flags);
 }
 
 static void iforce_usb_xmit(struct iforce *iforce)
-- 
2.46.0.469.g59c65b2a67-goog


