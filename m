Return-Path: <linux-input+bounces-6131-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DB66F96AFEB
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 06:43:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3CE45B2436F
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 04:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A85E781AB1;
	Wed,  4 Sep 2024 04:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IlmgBfr0"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2309181741;
	Wed,  4 Sep 2024 04:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725424983; cv=none; b=XolQXfRBij10eaaN1C+Lfv18Z3Yee7uFscyqfApd+QO1bEDB73kc3ZPDoG04PBjMpsSNiBOFYSxWdD2OkjB0PgYxxBfDBa2YTqSqsK/Zcvbe3ChNXwzYSfJBmK8F+CHdk+CH8sXhLqxoADbK16BlAATzZ8w3QwbpWkg817gqFAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725424983; c=relaxed/simple;
	bh=tcXR5AGz4pSzTcX36c+o18LWMgynX1S7b5Pv+4NspDs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EuQ18HPOZtjY1DfGsdqZDrBP8DgzUAvcpORfDEcKrtSpLBhWsOu30/qLC6sSv6P+iFjbF794uYwNTj06KZXzEDAU4BxPPkOs1ZBVVURfGQP34NR7AAdguFvAfApVrp2nHciQaGIoIkMGfuA0BcHMI0Z1bAeO7TBauyBUxnWz+0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IlmgBfr0; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-70b2421471aso3541989a12.0;
        Tue, 03 Sep 2024 21:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725424981; x=1726029781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t3Pc0eyxDef3P0KBoPUQmWAHpcwzzIPRUi+2W2NqUf4=;
        b=IlmgBfr0i4pjnE9TmuS4sdmvxrV18LbWX/HsQWI9IeYkqPKb0uvGKL45Y10kZFF4TP
         ybT13nXk/Ck9FpfjqZHzGsMg5lv+2xQX6N0Tm5r/JPR1y36cx90g5vhYuRAvC4GmWLDB
         iJkzKNrxYMtwwE2w3K6AcdLnH6pCW0oUKsuiDSqH0sS/9VSONrNsTOkLjMk9Glx7rT/p
         A+kxOzoger2s5D446/loYlDbq1qJ5QFVSYyt9/VacJQJCRNvNLOU49Rn7AV/cSx2UCka
         F/eEURLGkGRr66Cd6LzBDXyKem/1Wxw2FgDU8Ru1wYtobz6Itg/hwJX52G3ej/w5eRpV
         IXjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725424981; x=1726029781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t3Pc0eyxDef3P0KBoPUQmWAHpcwzzIPRUi+2W2NqUf4=;
        b=W/AJ6zO/a80q6p9lJsv8hcVOUR77RgHv8vc77g1+lt+sCICbE5PXz5OFtdEs41q1q+
         iOa3Y/VDCg4AOPQQGmTQVwrsDYBXFkP6SnrvZfSgbTYCxLYBRgXLF37JvkpPGSHhYjIG
         l6wplHuaQyI7c0tNFeh99rnK/tSej9Tsp4cwNR05Z9hzDyce6Br5kmPgXseIgAecM5TM
         h6k0NhQ8i8OO3GfoULhRL5143f9Ls+3diKXPbRdof/F+u422GqHez+E1/8a+16qjprgI
         X8jrOGIT4F/xLgWZRxU+CeyC6cV/zSvez3qKy4JCTnM4rkxccAhQOqTfIQrDCYGStioO
         tqAQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9YGQj/JrAx13vBwvLVQPk1OBnjvHSJlv2HL2RjrQJnx7zY6S2mGYDNGdV0WOYpV4gLPTUWraNjNu4fV4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRmycfnA3mfF7ELiLuO/+pZa/1Tl5GLOr+EU6nRctxAxdgIy8D
	52vhHhgfURjfZjVMkqOlW2U0MYwPEoi0rn64sHAyyW2K/J26WnbNLrtRmg==
X-Google-Smtp-Source: AGHT+IEzcHcvuKJ++miL0w6S6yT5dQk2bZhueChLCLRI1AK2ZIgPdeH0aB9Muw7TtIDLPGL/5F1h5w==
X-Received: by 2002:a05:6a21:918c:b0:1c6:ba9c:5d7b with SMTP id adf61e73a8af0-1ced619532dmr9415520637.23.1725424980869;
        Tue, 03 Sep 2024 21:43:00 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:e682:e3dc:908:eef0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206ae951c13sm5727665ad.103.2024.09.03.21.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 21:42:54 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	Ville Syrjala <syrjala@sci.fi>,
	Support Opensource <support.opensource@diasemi.com>,
	Eddie James <eajames@linux.ibm.com>,
	Andrey Moiseev <o2g.org.ru@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Jeff LaBundy <jeff@labundy.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/22] Input: ati_remote2 - use guard notation when acquiring mutex
Date: Tue,  3 Sep 2024 21:42:22 -0700
Message-ID: <20240904044244.1042174-3-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240904044244.1042174-1-dmitry.torokhov@gmail.com>
References: <20240904044244.1042174-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using guard notation makes the code more compact and error handling
more robust by ensuring that mutexes are released in all code paths
when control leaves critical section.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/misc/ati_remote2.c | 57 +++++++++++---------------------
 1 file changed, 19 insertions(+), 38 deletions(-)

diff --git a/drivers/input/misc/ati_remote2.c b/drivers/input/misc/ati_remote2.c
index 795f69edb4b2..e84649af801d 100644
--- a/drivers/input/misc/ati_remote2.c
+++ b/drivers/input/misc/ati_remote2.c
@@ -244,29 +244,21 @@ static int ati_remote2_open(struct input_dev *idev)
 	if (r) {
 		dev_err(&ar2->intf[0]->dev,
 			"%s(): usb_autopm_get_interface() = %d\n", __func__, r);
-		goto fail1;
+		return r;
 	}
 
-	mutex_lock(&ati_remote2_mutex);
+	scoped_guard(mutex, &ati_remote2_mutex) {
+		if (!(ar2->flags & ATI_REMOTE2_SUSPENDED)) {
+			r = ati_remote2_submit_urbs(ar2);
+			if (r)
+				break;
+		}
 
-	if (!(ar2->flags & ATI_REMOTE2_SUSPENDED)) {
-		r = ati_remote2_submit_urbs(ar2);
-		if (r)
-			goto fail2;
+		ar2->flags |= ATI_REMOTE2_OPENED;
 	}
 
-	ar2->flags |= ATI_REMOTE2_OPENED;
-
-	mutex_unlock(&ati_remote2_mutex);
-
 	usb_autopm_put_interface(ar2->intf[0]);
 
-	return 0;
-
- fail2:
-	mutex_unlock(&ati_remote2_mutex);
-	usb_autopm_put_interface(ar2->intf[0]);
- fail1:
 	return r;
 }
 
@@ -276,14 +268,12 @@ static void ati_remote2_close(struct input_dev *idev)
 
 	dev_dbg(&ar2->intf[0]->dev, "%s()\n", __func__);
 
-	mutex_lock(&ati_remote2_mutex);
+	guard(mutex)(&ati_remote2_mutex);
 
 	if (!(ar2->flags & ATI_REMOTE2_SUSPENDED))
 		ati_remote2_kill_urbs(ar2);
 
 	ar2->flags &= ~ATI_REMOTE2_OPENED;
-
-	mutex_unlock(&ati_remote2_mutex);
 }
 
 static void ati_remote2_input_mouse(struct ati_remote2 *ar2)
@@ -713,16 +703,14 @@ static ssize_t ati_remote2_store_channel_mask(struct device *dev,
 		return r;
 	}
 
-	mutex_lock(&ati_remote2_mutex);
-
-	if (mask != ar2->channel_mask) {
-		r = ati_remote2_setup(ar2, mask);
-		if (!r)
-			ar2->channel_mask = mask;
+	scoped_guard(mutex, &ati_remote2_mutex) {
+		if (mask != ar2->channel_mask) {
+			r = ati_remote2_setup(ar2, mask);
+			if (!r)
+				ar2->channel_mask = mask;
+		}
 	}
 
-	mutex_unlock(&ati_remote2_mutex);
-
 	usb_autopm_put_interface(ar2->intf[0]);
 
 	return r ? r : count;
@@ -892,15 +880,13 @@ static int ati_remote2_suspend(struct usb_interface *interface,
 
 	dev_dbg(&ar2->intf[0]->dev, "%s()\n", __func__);
 
-	mutex_lock(&ati_remote2_mutex);
+	guard(mutex)(&ati_remote2_mutex);
 
 	if (ar2->flags & ATI_REMOTE2_OPENED)
 		ati_remote2_kill_urbs(ar2);
 
 	ar2->flags |= ATI_REMOTE2_SUSPENDED;
 
-	mutex_unlock(&ati_remote2_mutex);
-
 	return 0;
 }
 
@@ -917,7 +903,7 @@ static int ati_remote2_resume(struct usb_interface *interface)
 
 	dev_dbg(&ar2->intf[0]->dev, "%s()\n", __func__);
 
-	mutex_lock(&ati_remote2_mutex);
+	guard(mutex)(&ati_remote2_mutex);
 
 	if (ar2->flags & ATI_REMOTE2_OPENED)
 		r = ati_remote2_submit_urbs(ar2);
@@ -925,8 +911,6 @@ static int ati_remote2_resume(struct usb_interface *interface)
 	if (!r)
 		ar2->flags &= ~ATI_REMOTE2_SUSPENDED;
 
-	mutex_unlock(&ati_remote2_mutex);
-
 	return r;
 }
 
@@ -943,11 +927,11 @@ static int ati_remote2_reset_resume(struct usb_interface *interface)
 
 	dev_dbg(&ar2->intf[0]->dev, "%s()\n", __func__);
 
-	mutex_lock(&ati_remote2_mutex);
+	guard(mutex)(&ati_remote2_mutex);
 
 	r = ati_remote2_setup(ar2, ar2->channel_mask);
 	if (r)
-		goto out;
+		return r;
 
 	if (ar2->flags & ATI_REMOTE2_OPENED)
 		r = ati_remote2_submit_urbs(ar2);
@@ -955,9 +939,6 @@ static int ati_remote2_reset_resume(struct usb_interface *interface)
 	if (!r)
 		ar2->flags &= ~ATI_REMOTE2_SUSPENDED;
 
- out:
-	mutex_unlock(&ati_remote2_mutex);
-
 	return r;
 }
 
-- 
2.46.0.469.g59c65b2a67-goog


