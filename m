Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BDC84A496C
	for <lists+linux-input@lfdr.de>; Mon, 31 Jan 2022 15:35:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237045AbiAaOf5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 31 Jan 2022 09:35:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21404 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237185AbiAaOf5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 31 Jan 2022 09:35:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643639756;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZrOPbfheWkNBX1SvXTkYbq9LsIXt4iOVqpKlJV0f9dw=;
        b=TWOdHHVmT/5z6E3aOI+lxGjZNs8OIt4KVz1cX3yWf+oPMpCAZRoPxtaazETheYSzV8oUF2
        9K5Wujey0lNZo9auqSHltQuxNpMASe/OQMktR5xqIUIE/l/jBFJOScifbPyUHdH2iBBsGw
        XhoRU/kb7JdHT4MW/GsYyHOnjQSFV1M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-364-I8fUYB3hNdCQlYRTyvuwmw-1; Mon, 31 Jan 2022 09:35:54 -0500
X-MC-Unique: I8fUYB3hNdCQlYRTyvuwmw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBC5481F019;
        Mon, 31 Jan 2022 14:35:53 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.59])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 94FD22C2C4;
        Mon, 31 Jan 2022 14:35:52 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
Subject: [PATCH v2 2/5] Input: Add input_copy_abs() function
Date:   Mon, 31 Jan 2022 15:35:36 +0100
Message-Id: <20220131143539.109142-2-hdegoede@redhat.com>
In-Reply-To: <20220131143539.109142-1-hdegoede@redhat.com>
References: <20220131143539.109142-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Changes in v2:
- Check src has EV_ABS and src_axis bits set (and WARN when not)
- Use input_set_capability()
---
 drivers/input/input.c | 36 ++++++++++++++++++++++++++++++++++++
 include/linux/input.h |  2 ++
 2 files changed, 38 insertions(+)

diff --git a/drivers/input/input.c b/drivers/input/input.c
index 3a5156012fb8..4456e82d370b 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -526,6 +526,42 @@ void input_set_abs_params(struct input_dev *dev, unsigned int axis,
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
+	/* src must have EV_ABS and src_axis set */
+	if (WARN_ON(!(test_bit(EV_ABS, src->evbit) &&
+		      test_bit(src_axis, src->absbit))))
+		return;
+
+	/*
+	 * input_alloc_absinfo() may have failed for the source. Our caller is
+	 * expected to catch this when registering the input devices, which may
+	 * happen after the input_copy_abs() call.
+	 */
+	if (!src->absinfo)
+		return;
+
+	input_set_capability(dst, EV_ABS, dst_axis);
+	if (!dst->absinfo)
+		return;
+
+	dst->absinfo[dst_axis] = src->absinfo[src_axis];
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

