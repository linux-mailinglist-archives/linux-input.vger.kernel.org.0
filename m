Return-Path: <linux-input+bounces-7939-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD059BFEDB
	for <lists+linux-input@lfdr.de>; Thu,  7 Nov 2024 08:16:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A12961C23507
	for <lists+linux-input@lfdr.de>; Thu,  7 Nov 2024 07:16:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 004311991A4;
	Thu,  7 Nov 2024 07:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="daGOAn6G"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA0D195FE3;
	Thu,  7 Nov 2024 07:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730963751; cv=none; b=bRa03JqZ71+/YJ3TXPyV4B2U4wCm6SJXOTc96QGHpCFS8pYDSsjyMYJAEKDxRH6S7NfMHOT43VKNTV2e3Suu2bG/c6IkIGAKxm7talRZIHQ9Ds6z9cfi7ufkcaXgscrvPMAVcJrf50vl+6D++iSHeP/+RtqcHaU+vP5/Kjan4oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730963751; c=relaxed/simple;
	bh=l73tBA6aq4wsRQHcuXI7BN7G/9crJqrrWDyE69fEVUY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eeRsdRiP8OOjhbqZqxG7/yB06kDDyAcknLJn1i2wHkowbmM7D9hhoc08ehNgeLDHwCtuRmYJ3pb+yTTt94EBA0Zahzy0aFyQIEtPjbb3BlH6ptBEqeKUVkblCn6VKMB9khrYPD36lk3DdJlkbURSLdYrE254VyvO3tNuUdO7Mls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=daGOAn6G; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20c9978a221so6830565ad.1;
        Wed, 06 Nov 2024 23:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730963750; x=1731568550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xo1+qs54rcJ3x+LX7xxfutqmwY8MMuXaKzLR6USPR4I=;
        b=daGOAn6Gr/pP5LZ01o5/PLaB7F/C9PpDmiRuGNfHHRXlFv0ysNP4SQ5XDFbezntNqh
         rcV77LPin0nzwDTf1aPBTi6VnfHgclFd+Uxnxb7V4Kia4Eu+F1FRuCcbJmo0u/ejzNwP
         mzMw87gHaljTEnyc1VtW3xYOww5qtrU9GvVRNfeM7gJ78BdbWZGQGHY8gjooMltWzsFJ
         SCSrgNCfQsVFx8W6tNMLYbG8IM/oqpSkU2FMhtuTLCDmvjwfLtZka+O8kLbkxUyXiG3m
         xmkv88Tyxn2cZg+6cKU1IS5e/zeEQoYVA7N0GalRRjlXvhkr3hs6Q3M7+C79TSw88lzd
         QQpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730963750; x=1731568550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xo1+qs54rcJ3x+LX7xxfutqmwY8MMuXaKzLR6USPR4I=;
        b=xT46c5QXGMI9SA3dd+5ChbTblXDjdXvu16gAP41ANKXDum0BaLKi91nqjE/LW+FCuN
         KwrtSaisxA3XpCaFBYl/6YVS0dvwRnB9wjIUfdWYIRessFA8/Ey2PgakPoNpE/nN03t4
         gpN23B8bZr++kjo2OrM+VZaJqAoGNWQ5eNAM/UPoAfGYNPrDymuw0BrGftGcvwCPIclv
         knORmC+4iuTMlnJ6VVytoCtfHQyIwRJuuUty8DDHOuo53YMX1kNoH8bWrKztb6L/slTZ
         ZIR9FTQNEftcs3qSxsiWGQWXYxZp6WsJQ/Ph68lgUuw7UMIKf7YFWZup7sTJnZGDsgMD
         X9yg==
X-Forwarded-Encrypted: i=1; AJvYcCX7uUYWALAqH2zCrfyJOYtFd/Gc06dHvpI6yKNbojvxYVxiZZHGAV9yZNLHRDWl1kH06TzwbEJOiN2HoMM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0urtD0S/c6BNqcVvAVrfEW/HATyCqmDFVQrdOwXmmJTFsZDCB
	SZXb7pKgRlE11gbX/Gh8FlfaIeybS20mtT88GNE5kR7Pwp0wjVgrenCe6w==
X-Google-Smtp-Source: AGHT+IHi5cBBZki/PDrFlW/m+UKjANbVaYMwMbvVQbe/WHz/eJmds+pSVm4Zva12pu2CFbrA8R9ArQ==
X-Received: by 2002:a17:902:d4c3:b0:20b:b0ab:4fc3 with SMTP id d9443c01a7336-210c6c934c1mr615273735ad.49.1730963749638;
        Wed, 06 Nov 2024 23:15:49 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:e838:5f55:2b1d:de33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e58399sm5703905ad.196.2024.11.06.23.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 23:15:49 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/8] Input: ff-core - make use of __free() cleanup facility
Date: Wed,  6 Nov 2024 23:15:29 -0800
Message-ID: <20241107071538.195340-3-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
In-Reply-To: <20241107071538.195340-1-dmitry.torokhov@gmail.com>
References: <20241107071538.195340-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Annotate allocated memory with __free(kfree) to simplify the code and
make sure memory is released appropriately.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/ff-core.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/input/ff-core.c b/drivers/input/ff-core.c
index eb01bcb69d00..a235d2eb6b31 100644
--- a/drivers/input/ff-core.c
+++ b/drivers/input/ff-core.c
@@ -290,8 +290,6 @@ EXPORT_SYMBOL_GPL(input_ff_event);
  */
 int input_ff_create(struct input_dev *dev, unsigned int max_effects)
 {
-	struct ff_device *ff;
-	size_t ff_dev_size;
 	int i;
 
 	if (!max_effects) {
@@ -304,25 +302,20 @@ int input_ff_create(struct input_dev *dev, unsigned int max_effects)
 		return -EINVAL;
 	}
 
-	ff_dev_size = struct_size(ff, effect_owners, max_effects);
-	if (ff_dev_size == SIZE_MAX) /* overflow */
-		return -EINVAL;
-
-	ff = kzalloc(ff_dev_size, GFP_KERNEL);
+	struct ff_device *ff __free(kfree) =
+		kzalloc(struct_size(ff, effect_owners, max_effects),
+			GFP_KERNEL);
 	if (!ff)
 		return -ENOMEM;
 
-	ff->effects = kcalloc(max_effects, sizeof(struct ff_effect),
-			      GFP_KERNEL);
-	if (!ff->effects) {
-		kfree(ff);
+	ff->effects = kcalloc(max_effects, sizeof(*ff->effects), GFP_KERNEL);
+	if (!ff->effects)
 		return -ENOMEM;
-	}
 
 	ff->max_effects = max_effects;
 	mutex_init(&ff->mutex);
 
-	dev->ff = ff;
+	dev->ff = no_free_ptr(ff);
 	dev->flush = input_ff_flush;
 	dev->event = input_ff_event;
 	__set_bit(EV_FF, dev->evbit);
-- 
2.47.0.277.g8800431eea-goog


