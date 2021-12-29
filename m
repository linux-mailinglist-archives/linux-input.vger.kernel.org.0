Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 943D3481776
	for <lists+linux-input@lfdr.de>; Thu, 30 Dec 2021 00:11:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232838AbhL2XLv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 29 Dec 2021 18:11:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232503AbhL2XLu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 29 Dec 2021 18:11:50 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 923E5C061574
        for <linux-input@vger.kernel.org>; Wed, 29 Dec 2021 15:11:50 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id 205so19835293pfu.0
        for <linux-input@vger.kernel.org>; Wed, 29 Dec 2021 15:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N54ev01xH0LWpbzHLPnoCuVgibRhcgrefU0ixCvRe0c=;
        b=D9tBVbqS6T312w3IRLQX7tCygv6msBlq9Pt8jx54eG7UbQZ+meaVLynDpXtTNe4ueC
         CU0U3WZqxo/i+RTe5hS1kc7ICJWLEDgyGI7YoPIWGUw6SX2leHboUX3XNxMNWkcxauEn
         B1SkQC9BbSwyYU29ZP/B+l3DqXrrWtuHv/aGlONvi0Snrf+auI0rDoQvlT+Qkwjq8lZu
         FowYpbIWdoy6XPIhi1lbc57IB788kxq7llRWXSuTLlZzrWIY062PtZv5VoO4rmshBFa4
         IJRLZS1Yf4u9Og0mWXPzv6qkQWWv9M6Jz20PASQKQvQ4ZAsLGKMJSU5C7+DNJ3JVCwQO
         3Ogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N54ev01xH0LWpbzHLPnoCuVgibRhcgrefU0ixCvRe0c=;
        b=E01rO5uzrk3m5V80WTspMkkq51Q2l1cLJrzcawWMOJFXx3s4JtZEuyuKs+IxTe7/RH
         0oVoGwJ43f0AQPW+sOwOKeL0x2Uql5WZoMbjm4k/mhXSTNr0rMO6ScdwetpDWiX44wct
         D8CeT7VXk+MGhf46oOyXFSID/eyZtOtQfGrPxEysIQAWAJZJIgRxaTS9pYv4p1kvHKAj
         IghIEwtgqgUuu4WC2H2rXXty4cOuHrK96cpqOmGydzL/96chUOY73Ts0nuAONeRgzESK
         RpoU5UKvVtKsNi1XnWMS3W3XrLaw7W0LFmqYp/7O2FQFbSaytWgoB0o1VG7b9l64a93R
         Bnmw==
X-Gm-Message-State: AOAM5303ek8Xrc5AjPsdChnHUYLBXEozGZVwgJzjBy/y1zDL86MGHw8I
        ZUEM0c/m4bFp85OAQfuy/f4=
X-Google-Smtp-Source: ABdhPJzC7og/7cFgrSJMq2g4S3SS55KSS9XUrp1KdEAf8MwdYNG2RWnhbx32+/R1QPPFc2o2hn7PEw==
X-Received: by 2002:a63:e651:: with SMTP id p17mr25762593pgj.233.1640819510142;
        Wed, 29 Dec 2021 15:11:50 -0800 (PST)
Received: from thelio.corp.microsoft.com ([2001:4898:80e8:36:99f0:adae:413c:2890])
        by smtp.gmail.com with ESMTPSA id k6sm26058042pff.106.2021.12.29.15.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 15:11:49 -0800 (PST)
From:   Dmitry Antipov <daantipov@gmail.com>
X-Google-Original-From: Dmitry Antipov <dmanti@microsoft.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Dmitry Antipov <dmanti@microsoft.com>
Subject: [PATCH v1 4/5] HID: add reset() field to struct hid_ll_driver
Date:   Wed, 29 Dec 2021 15:11:40 -0800
Message-Id: <20211229231141.303919-5-dmanti@microsoft.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211229231141.303919-1-dmanti@microsoft.com>
References: <20211229231141.303919-1-dmanti@microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This new API allows a device driver to reset the device.

Signed-off-by: Dmitry Antipov <dmanti@microsoft.com>
---
 include/linux/hid.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/hid.h b/include/linux/hid.h
index 97041c322a0f..129b542e1adb 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -823,6 +823,7 @@ struct hid_driver {
  * @output_report: send output report to device
  * @idle: send idle request to device
  * @may_wakeup: return if device may act as a wakeup source during system-suspend
+ * @reset: reset the device
  */
 struct hid_ll_driver {
 	int (*start)(struct hid_device *hdev);
@@ -848,6 +849,8 @@ struct hid_ll_driver {
 
 	int (*idle)(struct hid_device *hdev, int report, int idle, int reqtype);
 	bool (*may_wakeup)(struct hid_device *hdev);
+
+	void (*reset)(struct hid_device *hdev);
 };
 
 extern struct hid_ll_driver i2c_hid_ll_driver;
-- 
2.25.1

