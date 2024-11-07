Return-Path: <linux-input+bounces-7943-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA0B9BFEE4
	for <lists+linux-input@lfdr.de>; Thu,  7 Nov 2024 08:17:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D99032832AF
	for <lists+linux-input@lfdr.de>; Thu,  7 Nov 2024 07:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78E3B1D95B0;
	Thu,  7 Nov 2024 07:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LN+euxAR"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA3A1D7985;
	Thu,  7 Nov 2024 07:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730963756; cv=none; b=ern0RhietmcxTuhdpPOB7Q5GWQJ8ZQbl2ynCURaUJNtvCKqV4qTp25K/QqHlhncFzl6INbqtB84PRL8WRmq11zs0WnYsjSNzF4p0kjyir/HUJg9IYMMo4akmwedyG8yJ9c4Gpm52tIJqz8nLkTYkS4oN+jLOE5YP/HJDNU33fFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730963756; c=relaxed/simple;
	bh=oo2cU78lvM/dSXVwa6N8vfF04jRbKQLqkGmyWl+lqnU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P7sEEYwSN/hneLvIHdwcrMRxeMzF5D/Mps0cA4qzCX0z51XB1eOnzpa+Yy/N9/yDd/8mQAKPPbskWVbs6IRgdEt4+BSsstgIhaiF0PGjAkYo+ViVqnYqPK7g1EsWprlyrIz9E2Bba3ZnNYfK6FzKiD3KKzRFkdYVvPWCsA7d7MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LN+euxAR; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7f3f1849849so512015a12.1;
        Wed, 06 Nov 2024 23:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730963754; x=1731568554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F7OUSy9uYp7qD1AAKZu58DukLp8nWw6fpBK5gLOx6XI=;
        b=LN+euxARFqPGehDvwsVmh9vj6yogz4LojC3jadSYmDZhO258HGO3fAPc+FDmNbFmjM
         cnyjEBxJgtwUpJEUIo8DiHjcD+UnInwzOEKBxU9+56rBa77k/AnWq6Xgw7elv1Pqe7az
         aHawAhLEkGVCL9yrkRtdTY539ubSsYmU6izEBMzUdXux5MPbxZw+M/XOfiWNQxDudm3O
         WRFLumw4npNOCCawSKWaXTLxwwwfmrPUUME9DHSDPWAKeJ3jWoX1C34FGeaO6BeJaNb+
         qDy3oUw6Cd2rrq2kNFjveDDBHIZ5O9F85eGltKqYBDoTE2xQ70fSpo7RQLucRDpunWL9
         LnbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730963754; x=1731568554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F7OUSy9uYp7qD1AAKZu58DukLp8nWw6fpBK5gLOx6XI=;
        b=rmi/84SGhyHg/y3gW64wMFRqI/oZ+XhkEDOizCkeZvuW6cOe2OlUI1aahKeiTVDB3C
         CT6RDSuaPdBFC92AC/7Bh9Ef6RfP8K6mer37w0a419yQIVKFYTiA/HC1spSHl3EykL6R
         LxOb0IZsb73IF3jns/Kkh+1t4T1nnozZcWv88ug2shFpGQTRqu8w+R5zVxQ/vt4L4Uh3
         L6nRC8KXTztlG7fOzmOOC2tA3yodXtDATvNgV+ioenrgB2LQ0mk6oBesWTooPE0nt4GA
         45UN8EJymRzIJv4f4dnBKUO8lUsWt234lvvF6OMfOWj9GiVk8Y5AHXKDN+ADAAnQUHOR
         gVdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrEllwMrxTBKeqm3vasMkCN5NzR84QeAsXqZaSIc9VSCDd4l79HszsIoMyGIe3OhAfhAmd3Xpz8SC8zPE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVZ37TVM7uWwv8HdJJV2BzQUn06+SMKxb7IR4MYBa4cTx1j1C0
	mJJtZLTXBy0dJz1FbOO3a7V8m1vWgYYWHS/sQC9LKhP0SBf1bx9I
X-Google-Smtp-Source: AGHT+IHyLhW2rIJPbcTIf9ImWTwUM6iq5Za9KbxHUOUrPqjpxRvFE8xWd3W+IQfvCyIVpy5YuzG9jQ==
X-Received: by 2002:a05:6a21:6d85:b0:1d9:fbc:457c with SMTP id adf61e73a8af0-1dc17b2a8cdmr229791637.36.1730963754241;
        Wed, 06 Nov 2024 23:15:54 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:e838:5f55:2b1d:de33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e58399sm5703905ad.196.2024.11.06.23.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 23:15:53 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/8] Input: mt - make use of __free() cleanup facility
Date: Wed,  6 Nov 2024 23:15:33 -0800
Message-ID: <20241107071538.195340-7-dmitry.torokhov@gmail.com>
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
 drivers/input/input-mt.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/input/input-mt.c b/drivers/input/input-mt.c
index 45e41fc9059c..337006dd9dcf 100644
--- a/drivers/input/input-mt.c
+++ b/drivers/input/input-mt.c
@@ -39,20 +39,20 @@ static void copy_abs(struct input_dev *dev, unsigned int dst, unsigned int src)
 int input_mt_init_slots(struct input_dev *dev, unsigned int num_slots,
 			unsigned int flags)
 {
-	struct input_mt *mt = dev->mt;
-	int i;
-
 	if (!num_slots)
 		return 0;
-	if (mt)
-		return mt->num_slots != num_slots ? -EINVAL : 0;
+
+	if (dev->mt)
+		return dev->mt->num_slots != num_slots ? -EINVAL : 0;
+
 	/* Arbitrary limit for avoiding too large memory allocation. */
 	if (num_slots > 1024)
 		return -EINVAL;
 
-	mt = kzalloc(struct_size(mt, slots, num_slots), GFP_KERNEL);
+	struct input_mt *mt __free(kfree) =
+			kzalloc(struct_size(mt, slots, num_slots), GFP_KERNEL);
 	if (!mt)
-		goto err_mem;
+		return -ENOMEM;
 
 	mt->num_slots = num_slots;
 	mt->flags = flags;
@@ -86,21 +86,18 @@ int input_mt_init_slots(struct input_dev *dev, unsigned int num_slots,
 		unsigned int n2 = num_slots * num_slots;
 		mt->red = kcalloc(n2, sizeof(*mt->red), GFP_KERNEL);
 		if (!mt->red)
-			goto err_mem;
+			return -ENOMEM;
 	}
 
 	/* Mark slots as 'inactive' */
-	for (i = 0; i < num_slots; i++)
+	for (unsigned int i = 0; i < num_slots; i++)
 		input_mt_set_value(&mt->slots[i], ABS_MT_TRACKING_ID, -1);
 
 	/* Mark slots as 'unused' */
 	mt->frame = 1;
 
-	dev->mt = mt;
+	dev->mt = no_free_ptr(mt);
 	return 0;
-err_mem:
-	kfree(mt);
-	return -ENOMEM;
 }
 EXPORT_SYMBOL(input_mt_init_slots);
 
-- 
2.47.0.277.g8800431eea-goog


