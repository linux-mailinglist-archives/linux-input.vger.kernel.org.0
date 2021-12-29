Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6275481775
	for <lists+linux-input@lfdr.de>; Thu, 30 Dec 2021 00:11:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232834AbhL2XLu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 29 Dec 2021 18:11:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232503AbhL2XLt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 29 Dec 2021 18:11:49 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF434C061574
        for <linux-input@vger.kernel.org>; Wed, 29 Dec 2021 15:11:49 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id c2so19782044pfc.1
        for <linux-input@vger.kernel.org>; Wed, 29 Dec 2021 15:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RFp2MDYzW2/VigGy5tzYr/UX0VyoGb2WGJDLoT34mrc=;
        b=WqogX1xyu263v6Jr3TYuXmVFOgKbtJCWvaEbzB/f9BMRoz8/SH7ZVi7+MkTvvKihT/
         Ktx6vZGcbenSWLX9d9gKxfHfZpOVN6mbo6hYPE7gPKmEy6sGziE2dT22oIQjEcRa8QWA
         llF3Zr5VdY/bqjiamx/ZpEvxi8Q0dlyJ+kyZNT8cFhonQjspf0JBjVF3nTWzHUjYirMO
         vrVgsh5FAUPuL4c5k3qn/rtGw7wvWGNti5xKoekSjUjLykxeYQJL4a3lvKj8b50a+0mQ
         t76FWwzWOOUTUZKQuPyrCQ9i50JrIt9DxnbTeToVA+1UULcftRKe0Kvf6E2BGSqa9mbb
         GLOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RFp2MDYzW2/VigGy5tzYr/UX0VyoGb2WGJDLoT34mrc=;
        b=3AKhPbD5OjSv9BsFGCgACFjew/fFn4ydJPi0Qn2qkeWgwoaQztZc/QbKntR8dpwc58
         O0fJIrH91ypVkP+8kqab07avy/dwAXwudXASEYiejYYOUZ4+zX0DprRwMjKX0+rBVDcm
         Ljv1o7JBOB+nlRO4pbgfYiS12K6WwRilroBAILXHZRcYchP2OkuuKzAD6XK/gzJ1VvgQ
         7CvZewujWqf0Oi8eb4hJYoLpXA51gvpglb5L9XNmTegTOEqWwOVLuprZKDYpa83NXLg9
         OLvR3TQsPC3QqurAQIgImlQi/uxTxUiNIyj6g0SnR1eiW1afqS+3Nawv1IPR1IEVuM9D
         ygnw==
X-Gm-Message-State: AOAM53054/rmPgSdVOk/x4I41x1mh04GLwZ7tf4n16Wjyz3a+ivw56k2
        K5/Hb5Fsvk5cAAu4boVafvb65eL2I2Q=
X-Google-Smtp-Source: ABdhPJxIOoEtLNfk8HKEJsVZyD4Iqpoma1yVaABMIsnpj8pQnGv6V1zgz7oGRepB1w6Go6WNVgv7Kw==
X-Received: by 2002:a63:8441:: with SMTP id k62mr25352564pgd.152.1640819509224;
        Wed, 29 Dec 2021 15:11:49 -0800 (PST)
Received: from thelio.corp.microsoft.com ([2001:4898:80e8:36:99f0:adae:413c:2890])
        by smtp.gmail.com with ESMTPSA id k6sm26058042pff.106.2021.12.29.15.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 15:11:49 -0800 (PST)
From:   Dmitry Antipov <daantipov@gmail.com>
X-Google-Original-From: Dmitry Antipov <dmanti@microsoft.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Dmitry Antipov <dmanti@microsoft.com>
Subject: [PATCH v1 3/5] HID: add on_transport_error() field to struct hid_driver
Date:   Wed, 29 Dec 2021 15:11:39 -0800
Message-Id: <20211229231141.303919-4-dmanti@microsoft.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211229231141.303919-1-dmanti@microsoft.com>
References: <20211229231141.303919-1-dmanti@microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This new API allows a transport driver to notify the HID device driver
about a transport layer error.

Signed-off-by: Dmitry Antipov <dmanti@microsoft.com>
---
 include/linux/hid.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/include/linux/hid.h b/include/linux/hid.h
index 1f134c8f8972..97041c322a0f 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -703,6 +703,20 @@ struct hid_usage_id {
 	__u32 usage_code;
 };
 
+enum hid_transport_error_type {
+	HID_TRANSPORT_ERROR_TYPE_BUS_INPUT_TRANSFER_START = 0,
+	HID_TRANSPORT_ERROR_TYPE_BUS_INPUT_TRANSFER_BODY,
+	HID_TRANSPORT_ERROR_TYPE_BUS_INPUT_TRANSFER_HEADER,
+	HID_TRANSPORT_ERROR_TYPE_BUS_OUTPUT_TRANSFER,
+	HID_TRANSPORT_ERROR_TYPE_DEVICE_INITIATED_RESET,
+	HID_TRANSPORT_ERROR_TYPE_HEADER_DATA,
+	HID_TRANSPORT_ERROR_TYPE_INPUT_REPORT_DATA,
+	HID_TRANSPORT_ERROR_TYPE_REPORT_TYPE,
+	HID_TRANSPORT_ERROR_TYPE_GET_FEATURE_RESPONSE,
+	HID_TRANSPORT_ERROR_TYPE_REGULATOR_ENABLE,
+	HID_TRANSPORT_ERROR_TYPE_REGULATOR_DISABLE
+};
+
 /**
  * struct hid_driver
  * @name: driver name (e.g. "Footech_bar-wheel")
@@ -726,6 +740,7 @@ struct hid_usage_id {
  * @suspend: invoked on suspend (NULL means nop)
  * @resume: invoked on resume if device was not reset (NULL means nop)
  * @reset_resume: invoked on resume if device was reset (NULL means nop)
+ * @on_transport_error: invoked on error hit by transport driver
  *
  * probe should return -errno on error, or 0 on success. During probe,
  * input will not be passed to raw_event unless hid_device_io_start is
@@ -777,6 +792,10 @@ struct hid_driver {
 	void (*feature_mapping)(struct hid_device *hdev,
 			struct hid_field *field,
 			struct hid_usage *usage);
+	void (*on_transport_error)(struct hid_device *hdev,
+			int err_type,
+			int err_code,
+			bool handled);
 #ifdef CONFIG_PM
 	int (*suspend)(struct hid_device *hdev, pm_message_t message);
 	int (*resume)(struct hid_device *hdev);
-- 
2.25.1

