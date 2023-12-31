Return-Path: <linux-input+bounces-1062-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 361BB820E1F
	for <lists+linux-input@lfdr.de>; Sun, 31 Dec 2023 21:57:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC19A1F2209A
	for <lists+linux-input@lfdr.de>; Sun, 31 Dec 2023 20:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 629B7BE4D;
	Sun, 31 Dec 2023 20:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z4jPum1f"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012FDBA2E
	for <linux-input@vger.kernel.org>; Sun, 31 Dec 2023 20:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-2053f5e97b2so484081fac.3
        for <linux-input@vger.kernel.org>; Sun, 31 Dec 2023 12:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704056210; x=1704661010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IOZ8rZbenKYNbmmaBMIB+79ZT/meJMpi+b7m7niorzQ=;
        b=Z4jPum1fCmyRSi6EL454ehejZigQYe2HWIj7OvAdWn0p68dtXLfn6Unb/eY6C1m6lC
         fE3RwsLsToNZA22/7vNStVQ+FB4PbKZJX3E8B7jL0TxbY+W0QMg9AWMs24Wex7cyj7dN
         ZZJ/HD0IbgUezI/B+lFtvpDo3O/Z4sYE8qwtlC/Be0T3E8Ria0zcGCl5dS/xBMK8+nG3
         0YZeVCdcQiMGCgXvAT1AX8AobnytL6Qt7lPvDvD3BiFXupE+HoY8Abt4DwBZJI5wJpPf
         kMnZ+wrwNQyuqqUDnt6rIe0qmXQOnkmn1A52nABrbDS4aEFvOfTLi7ojik0fr0Czz4wC
         p01Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704056210; x=1704661010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IOZ8rZbenKYNbmmaBMIB+79ZT/meJMpi+b7m7niorzQ=;
        b=pACSafoMaFEG2emuoaaDxq7behWKhwmMpV1kqzNIVarLUYNMiEx7DxLMfX6Oc6I4Wp
         bI7bvl/4kAxtqAqd1QOneYsWY6UKeuPEFnJx0uZ0E7JLADbYXPUHaAJ1WKst+zEeli3g
         MubTFkSnm+FA4+KFCfddCMs5cSVLIoTq498uTU+nvbDWz6LRaVzIiQJzm0SnxtwMGRtd
         lFVa/fQ16+CKq+MlFsM26/0RTitDGcQ7X63PERA0aMarh+d1WWVlVhKRJXJSV68b6KcT
         14koVkSGCle+r+z5mipGEGT89wXOQbSwdJKdXZdCWwRU/ekM7sJL65gi7I0Sxr4DOhX1
         vjTg==
X-Gm-Message-State: AOJu0YxyEZ/bErQiEKhQiMaN67BtU4yHTzqXxu+v8/R2LKEcBCidSTkn
	G0qkIjZO+ltemL8ORundsf1vz2XAY4Nc7A==
X-Google-Smtp-Source: AGHT+IGHvYe70NxEjhFN5mEhshjW6Y13FXnI/bBF3aK51wBx5gMGpXgg5hYZ1a4WRVX3FgXHNFVG/w==
X-Received: by 2002:a05:6870:224d:b0:1fb:75a:de75 with SMTP id j13-20020a056870224d00b001fb075ade75mr17551631oaf.99.1704056209689;
        Sun, 31 Dec 2023 12:56:49 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id v1-20020a056870954100b00203d8ce415bsm4843404oal.50.2023.12.31.12.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Dec 2023 12:56:49 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-input@vger.kernel.org
Cc: dmitry.torokhov@gmail.com,
	hdegoede@redhat.com,
	paul@crapouillou.net,
	peter.hutterer@who-t.net,
	svv@google.com,
	biswarupp@google.com,
	contact@artur-rojek.eu,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 1/2] Input: add input_invert_abs()
Date: Sun, 31 Dec 2023 14:56:42 -0600
Message-Id: <20231231205643.129435-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231231205643.129435-1-macroalpha82@gmail.com>
References: <20231231205643.129435-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add a helper function to make it easier for a driver to invert abs
values when needed. It is up to the driver itself to track axes that
need to be inverted and normalize the data before it is passed on.

This function assumes that drivers will set the min and max values
so that min < max and then will simply call this function each time
the values need to be inverted.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/input/input.c | 19 +++++++++++++++++++
 include/linux/input.h |  1 +
 2 files changed, 20 insertions(+)

diff --git a/drivers/input/input.c b/drivers/input/input.c
index 8c5fdb0f858a..f135aed165a1 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -552,6 +552,25 @@ void input_copy_abs(struct input_dev *dst, unsigned int dst_axis,
 }
 EXPORT_SYMBOL(input_copy_abs);
 
+/**
+ * input_invert_abs - Invert the abs value for an inverted axis.
+ * @dev: Input device with absolute events
+ * @axis: ABS_* value selecting the destination axis for the event to
+ *	  invert.
+ * @val: Value to be inverted based on min and max values of the axis.
+ *
+ * Return an inverted value for a given ABS axis based on its min and
+ * max values.
+ */
+int input_invert_abs(struct input_dev *dev, unsigned int axis, int val)
+{
+	int min = dev->absinfo[axis].minimum;
+	int max = dev->absinfo[axis].maximum;
+
+	return (max + min) - val;
+}
+EXPORT_SYMBOL(input_invert_abs);
+
 /**
  * input_grab_device - grabs device for exclusive use
  * @handle: input handle that wants to own the device
diff --git a/include/linux/input.h b/include/linux/input.h
index de6503c0edb8..deb5f8bb0ec7 100644
--- a/include/linux/input.h
+++ b/include/linux/input.h
@@ -477,6 +477,7 @@ void input_set_abs_params(struct input_dev *dev, unsigned int axis,
 			  int min, int max, int fuzz, int flat);
 void input_copy_abs(struct input_dev *dst, unsigned int dst_axis,
 		    const struct input_dev *src, unsigned int src_axis);
+int input_invert_abs(struct input_dev *dev, unsigned int axis, int val);
 
 #define INPUT_GENERATE_ABS_ACCESSORS(_suffix, _item)			\
 static inline int input_abs_get_##_suffix(struct input_dev *dev,	\
-- 
2.34.1


