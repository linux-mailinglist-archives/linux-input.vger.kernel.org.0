Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20A2C3CF00E
	for <lists+linux-input@lfdr.de>; Tue, 20 Jul 2021 01:38:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349995AbhGSW5R (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 19 Jul 2021 18:57:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344228AbhGSUPR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 19 Jul 2021 16:15:17 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30DA0C061767
        for <linux-input@vger.kernel.org>; Mon, 19 Jul 2021 13:54:20 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id bt15so12328506pjb.2
        for <linux-input@vger.kernel.org>; Mon, 19 Jul 2021 13:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LlFQQvD8aZgpaVpFvO8lQNzn5mt/bIYYE36oNLpqeq4=;
        b=OgypN5jJLsqNFUdY2UnHHta0Mb9q3rZ2Ei35gd91VxrgcjWQsOnyIoJRmvyc2IksqT
         MiTR+cOijxAPMXKWthqnfGS+m4gG2QWeZK1BCfrDjYGcpLKXGvcWc4BQoJE8IXPXHWg0
         189viG7pdoCrwjEIHa0hzAeRNMvotsdArjN1iSDlWhoirvWQVuUhxQ6QMqcjDG4MUqPQ
         vjsg0Wqf9Zw2A3zBtgPhpVWPHrKWqarnRjsXygyrsfO+H0bibRMjnuG5nbV7PDwtQPIZ
         KTtTGdphtLM5oHFi/Fmy1boLtdxlETz5faTfJjVtg938KnxLcMtdA5IOMEeCFSgE4BIP
         8beg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LlFQQvD8aZgpaVpFvO8lQNzn5mt/bIYYE36oNLpqeq4=;
        b=MQxcdTys2gQh0QqNboNp1AJrzS1mZEzQ2d51+Up+fD9Ul29aJL2b8UZps/O4Ftx7qd
         Z0Sla6AhEGfmoYF5Z5JOtQDMgqarIBo94sEkmter2XG9sOkAXavQ5oXFUw3mKKnHN82C
         /a3mZnNZnNJAw89dtXtc5s+xGY8NZOFpK1cxWuTzmXttSw2A+osG8RVv8X5g3NEhG6dr
         yxAO/aDEbCNORnUMLz3wxGOBLWQwVr/M8Lv4uUKsbQoJEFmWoJVHKf6Uc4yQ9bq2T9lR
         HEYiL3siKeapkDFh6PR7Dm9HpUv8rBDr60pJ6oozc0A4Vw1UnaQxbK4AzAvtSisTY+ZD
         wWvA==
X-Gm-Message-State: AOAM532pmg60C8iJ2v/flei1U2rlz7aoRNX2+k6rt1IUtrg0v4VIDrja
        GT9YSufS7WCp85YAzqeP+d8D+EtyDP15rg==
X-Google-Smtp-Source: ABdhPJx2GDf8xvIy2yBm7Slbp1BC8a4NkcUBk9ufllrIUPuSS2HoJsKXZbNAMLSgG6Mx+4MK/14/EQ==
X-Received: by 2002:a17:902:b717:b029:11a:fae3:ba7c with SMTP id d23-20020a170902b717b029011afae3ba7cmr20296937pls.28.1626728145185;
        Mon, 19 Jul 2021 13:55:45 -0700 (PDT)
Received: from horus.lan (71-34-86-28.ptld.qwest.net. [71.34.86.28])
        by smtp.gmail.com with ESMTPSA id y82sm21451233pfb.121.2021.07.19.13.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 13:55:44 -0700 (PDT)
From:   Jason Gerecke <killertofu@gmail.com>
X-Google-Original-From: Jason Gerecke <jason.gerecke@wacom.com>
To:     linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Ping Cheng <pinglinux@gmail.com>,
        Jason Gerecke <jason.gerecke@wacom.com>,
        Ping Cheng <ping.cheng@wacom.com>
Subject: [PATCH 3/6] HID: wacom: Short-circuit processing of touch when it is disabled
Date:   Mon, 19 Jul 2021 13:55:30 -0700
Message-Id: <20210719205533.2189804-3-jason.gerecke@wacom.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210719205533.2189804-1-jason.gerecke@wacom.com>
References: <20210719205533.2189804-1-jason.gerecke@wacom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Avoid doing unnecessary work when touch is disabled by detecting this
condition and returning early. Note that the probe process sends GET
FEATURE requests to discover e.g. HID_DG_CONTACTMAX, so we can't start
ignoring touch reports until probe finishes.

Signed-off-by: Ping Cheng <ping.cheng@wacom.com>
Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
---
 drivers/hid/wacom_sys.c |  1 +
 drivers/hid/wacom_wac.c | 12 ++++++++++++
 drivers/hid/wacom_wac.h |  1 +
 3 files changed, 14 insertions(+)

diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
index 713a2504092f..93f49b766376 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -2797,6 +2797,7 @@ static int wacom_probe(struct hid_device *hdev,
 				 error);
 	}
 
+	wacom_wac->probe_complete = true;
 	return 0;
 }
 
diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index b87fbd2a81a6..27587070a192 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -2581,6 +2581,12 @@ static void wacom_wac_finger_event(struct hid_device *hdev,
 	unsigned equivalent_usage = wacom_equivalent_usage(usage->hid);
 	struct wacom_features *features = &wacom->wacom_wac.features;
 
+	/* don't process touch events when touch is off */
+	if (wacom_wac->probe_complete &&
+	    !wacom_wac->shared->is_touch_on &&
+	    !wacom_wac->shared->touch_down)
+		return;
+
 	if (wacom_wac->is_invalid_bt_frame)
 		return;
 
@@ -2630,6 +2636,12 @@ static void wacom_wac_finger_pre_report(struct hid_device *hdev,
 	struct hid_data* hid_data = &wacom_wac->hid_data;
 	int i;
 
+	/* don't process touch events when touch is off */
+	if (wacom_wac->probe_complete &&
+	    !wacom_wac->shared->is_touch_on &&
+	    !wacom_wac->shared->touch_down)
+		return;
+
 	wacom_wac->is_invalid_bt_frame = false;
 
 	for (i = 0; i < report->maxfield; i++) {
diff --git a/drivers/hid/wacom_wac.h b/drivers/hid/wacom_wac.h
index 4e9eb0c1eff6..8b2d4e5b2303 100644
--- a/drivers/hid/wacom_wac.h
+++ b/drivers/hid/wacom_wac.h
@@ -337,6 +337,7 @@ struct wacom_wac {
 	int tool[2];
 	int id[2];
 	__u64 serial[2];
+	bool probe_complete;
 	bool reporting_data;
 	struct wacom_features features;
 	struct wacom_shared *shared;
-- 
2.32.0

