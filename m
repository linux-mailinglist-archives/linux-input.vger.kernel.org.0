Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CB8E471A21
	for <lists+linux-input@lfdr.de>; Sun, 12 Dec 2021 13:42:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230445AbhLLMmt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 12 Dec 2021 07:42:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33532 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230388AbhLLMms (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 12 Dec 2021 07:42:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1639312968;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hJskEQ8tSbhmtat/Or5smFTXXJX/T4AF0NtUryyaGH4=;
        b=hkYDlcGYbnrGZo0nPJVbr5xq97v0Wqzn2iB9rfEwfICbb8R13xCI0VrOL1oh8AEVJZQBPw
        KZibeOclS7KpJBwwgU2WkURzlrHyUo9hhkUJim/oaxReDltPrXenp0ZAdquA0gEeh6fc9Y
        4vQPylgzUYYaaTVxi2lOEhqK7oOuLog=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-372-MKnCUjR7PiiHv4mpWzqXNA-1; Sun, 12 Dec 2021 07:42:46 -0500
X-MC-Unique: MKnCUjR7PiiHv4mpWzqXNA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1D4280402F;
        Sun, 12 Dec 2021 12:42:45 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.192.36])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B567F5D6D7;
        Sun, 12 Dec 2021 12:42:44 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
Subject: [PATCH 1/5] Input: Add input_copy_abs() function
Date:   Sun, 12 Dec 2021 13:42:38 +0100
Message-Id: <20211212124242.81019-2-hdegoede@redhat.com>
In-Reply-To: <20211212124242.81019-1-hdegoede@redhat.com>
References: <20211212124242.81019-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add a new helper function to copy absinfo from one input_dev to
another input_dev.

This is useful to e.g. setup a pen/stylus input-device for combined
touchscreen/pen hardware where the pen uses the same coordinates as
the touchscreen.

Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/input.c | 34 ++++++++++++++++++++++++++++++++++
 include/linux/input.h |  2 ++
 2 files changed, 36 insertions(+)

diff --git a/drivers/input/input.c b/drivers/input/input.c
index ccaeb2426385..60f3eb38906f 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -526,6 +526,40 @@ void input_set_abs_params(struct input_dev *dev, unsigned int axis,
 }
 EXPORT_SYMBOL(input_set_abs_params);
 
+/**
+ * input_copy_abs - Copy absinfo from one input_dev to another
+ * @dst: Destination input device to copy the abs settings to
+ * @dst_axis: ABS_* value selecting the destination axis
+ * @src: Source input device to copy the abs settings from
+ * @src_axis: ABS_* value selecting the source axis
+ *
+ * Set absinfo for the selected destination axis by copying it from
+ * the specified source input device's source axis.
+ * This is useful to e.g. setup a pen/stylus input-device for combined
+ * touchscreen/pen hardware where the pen uses the same coordinates as
+ * the touchscreen.
+ */
+void input_copy_abs(struct input_dev *dst, unsigned int dst_axis,
+		    const struct input_dev *src, unsigned int src_axis)
+{
+	/*
+	 * input_alloc_absinfo() may have failed for the source. Our caller is
+	 * expected to catch this when registering the input devices, which may
+	 * happen after the input_copy_abs() call.
+	 */
+	if (!src->absinfo)
+		return;
+
+	input_alloc_absinfo(dst);
+	if (!dst->absinfo)
+		return;
+
+	dst->absinfo[dst_axis] = src->absinfo[src_axis];
+
+	__set_bit(EV_ABS, dst->evbit);
+	__set_bit(dst_axis, dst->absbit);
+}
+EXPORT_SYMBOL(input_copy_abs);
 
 /**
  * input_grab_device - grabs device for exclusive use
diff --git a/include/linux/input.h b/include/linux/input.h
index 0354b298d874..49790c1bd2c4 100644
--- a/include/linux/input.h
+++ b/include/linux/input.h
@@ -475,6 +475,8 @@ static inline void input_set_events_per_packet(struct input_dev *dev, int n_even
 void input_alloc_absinfo(struct input_dev *dev);
 void input_set_abs_params(struct input_dev *dev, unsigned int axis,
 			  int min, int max, int fuzz, int flat);
+void input_copy_abs(struct input_dev *dst, unsigned int dst_axis,
+		    const struct input_dev *src, unsigned int src_axis);
 
 #define INPUT_GENERATE_ABS_ACCESSORS(_suffix, _item)			\
 static inline int input_abs_get_##_suffix(struct input_dev *dev,	\
-- 
2.33.1

