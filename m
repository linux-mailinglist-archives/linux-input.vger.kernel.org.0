Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6790347F84
	for <lists+linux-input@lfdr.de>; Wed, 24 Mar 2021 18:35:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237321AbhCXReo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 24 Mar 2021 13:34:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237263AbhCXRe1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 24 Mar 2021 13:34:27 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6B3BC0613EE
        for <linux-input@vger.kernel.org>; Wed, 24 Mar 2021 10:34:24 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id u5so34252480ejn.8
        for <linux-input@vger.kernel.org>; Wed, 24 Mar 2021 10:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NvG+DHxLWGqXLwCLHTxA35O2VaR78VX0X5hX1fU7v18=;
        b=HPyYRRGgq42DngHKdoEos7QCdzcGobUlfGRsMEkLTPONOCuw/ToZVKKZSNVGuLSZBw
         UgaPnE453P1VMWH5/ETJmqYKWGTzod2qRqHdZkBdVHgD7b9lwBPZZRSQYHBhU6wnOwLz
         IyydOsrIyUBajSfhvj2uBZjZLEXJIRdM8ahqu6d1wwebZDoint8OZdHq02nSa5lEMMp5
         grv1EFyPVxsDcZuTFvxI5UEvsInVDJeayNsFiaGo+Kqpy9nqcYNrTpHG8Vz8JIkg7vkQ
         1NJpCEXpUoeYOjdQs5fmiMuWy2h1StCCBesKCRw+2ZiQEk8FLaYgfZ/7+jUT8iNd6p4B
         eWbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NvG+DHxLWGqXLwCLHTxA35O2VaR78VX0X5hX1fU7v18=;
        b=pFQa4anZbYUVckroT3zVz9x2sepKar1cgQELnE7cFv+Ykr9HnHBbOzd2qt5EnFxtRL
         fiFEhU7qFQKlRJSyDY+ZFPViNy9g1XKfPdzCR2GQ3TH6oofwHQTRakaeYhN9zZ+i6TYe
         pvsH0+0pSHZu5PxUoNIRxrr6JilwONOwMY02tUqy1JeDK8Mv+U9s6jBl0yeWF8UgigTf
         Ai7LsRGCXk9jKPWoItwBcElkNwCuzZF97+11UR6pXPhXmrm7aPY8X4X0x/C5le9wBD9u
         ImF0d3paZmTKcEgp7zuleJ91qk4x0NnD8gNewX7pr6RkJQQ8zuncobnAFA5I9c2HycfM
         kdSQ==
X-Gm-Message-State: AOAM533tP+Ca5sAxyRZIHmLh8KHI9R+cVkkNRHQSGc0XeP1NpzG5ob50
        NetbpxWpJgtFSwCZG5mQB6vcyQ==
X-Google-Smtp-Source: ABdhPJyBA3HSTenTt2vSJARLv+6C0hFj5J3+3BZROY0ANdguJmjmq6NCR/oQwpAwRRLMiiPru0sUWw==
X-Received: by 2002:a17:906:f0d0:: with SMTP id dk16mr5031350ejb.48.1616607263384;
        Wed, 24 Mar 2021 10:34:23 -0700 (PDT)
Received: from dell.default ([91.110.221.180])
        by smtp.gmail.com with ESMTPSA id p19sm1466367edr.57.2021.03.24.10.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 10:34:22 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        =?UTF-8?q?Bruno=20Pr=C3=A9mont?= <bonbons@linux-vserver.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "L. Vinyard, Jr" <rvinyard@cs.nmsu.edu>,
        linux-input@vger.kernel.org
Subject: [PATCH 15/25] HID: hid-picolcd_core: Remove unused variable 'ret'
Date:   Wed, 24 Mar 2021 17:33:54 +0000
Message-Id: <20210324173404.66340-16-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210324173404.66340-1-lee.jones@linaro.org>
References: <20210324173404.66340-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/hid/hid-picolcd_core.c: In function ‘picolcd_raw_event’:
 drivers/hid/hid-picolcd_core.c:332:6: warning: variable ‘ret’ set but not used [-Wunused-but-set-variable]

Cc: "Bruno Prémont" <bonbons@linux-vserver.org>
Cc: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: "L. Vinyard, Jr" <rvinyard@cs.nmsu.edu>
Cc: linux-input@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/hid/hid-picolcd_core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-picolcd_core.c b/drivers/hid/hid-picolcd_core.c
index 1b5c63241af05..bbda231a7ce30 100644
--- a/drivers/hid/hid-picolcd_core.c
+++ b/drivers/hid/hid-picolcd_core.c
@@ -329,7 +329,6 @@ static int picolcd_raw_event(struct hid_device *hdev,
 {
 	struct picolcd_data *data = hid_get_drvdata(hdev);
 	unsigned long flags;
-	int ret = 0;
 
 	if (!data)
 		return 1;
@@ -342,9 +341,9 @@ static int picolcd_raw_event(struct hid_device *hdev,
 
 	if (report->id == REPORT_KEY_STATE) {
 		if (data->input_keys)
-			ret = picolcd_raw_keypad(data, report, raw_data+1, size-1);
+			picolcd_raw_keypad(data, report, raw_data+1, size-1);
 	} else if (report->id == REPORT_IR_DATA) {
-		ret = picolcd_raw_cir(data, report, raw_data+1, size-1);
+		picolcd_raw_cir(data, report, raw_data+1, size-1);
 	} else {
 		spin_lock_irqsave(&data->lock, flags);
 		/*
-- 
2.27.0

