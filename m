Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B237917487B
	for <lists+linux-input@lfdr.de>; Sat, 29 Feb 2020 18:43:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727247AbgB2Rnn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 29 Feb 2020 12:43:43 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46783 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727349AbgB2Rnm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 29 Feb 2020 12:43:42 -0500
Received: by mail-wr1-f67.google.com with SMTP id j7so7196791wrp.13;
        Sat, 29 Feb 2020 09:43:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oud1espWU1k0QxHmA7KWJtuh3wfW0r4STkgshmKXRcU=;
        b=jGGXfzQtJ2Msaa9Dfr/IwhwN2pP2xmGyO8UYZiCGSLME/uifhYXQ0r3OeH2fY+T189
         u4HWwGKMSo+w6ZKfwixxZIQXn8GNZapvU0yqHcmjI5ommJnpnku96V86CIT3TntGV11q
         EkMBQPfdJgTuCnZA0QYBZ3TBjFfSZQZpK04O7SDNNQ6q1OFBJJKAVr848H/XhNHkicFB
         Of8HcM7QGQLU5fc6lxKDFB2AYnlHuPgSLqkH4MIxX130FLWM5Pe6XrVakQs8skkChJn8
         FBE51nEqangyGMB42VfaEalNHi7iUd+Hivc3RC4ZD+eH/eEeBsRC3WoNPrJm6h88SH/7
         f/og==
X-Gm-Message-State: APjAAAXXzo1INwwS/lT7cDsTNybNhjWCl9GKDl9/a1mqSelaFX37dLNX
        DLM6u7Nwby0qlyBvhI4hWrU=
X-Google-Smtp-Source: APXvYqznP5MVUZf4Ky5C6/OO2dKa3ZSsGZbf9mTS3IUr+Q/xeKROw7e4lClQNdItCc/HAK+IIskquA==
X-Received: by 2002:adf:ebca:: with SMTP id v10mr11582246wrn.307.1582998220306;
        Sat, 29 Feb 2020 09:43:40 -0800 (PST)
Received: from archtop.lan ([82.7.199.117])
        by smtp.googlemail.com with ESMTPSA id t3sm18132209wrx.38.2020.02.29.09.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Feb 2020 09:43:39 -0800 (PST)
From:   Lucas Tanure <tanure@linux.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Lucas Tanure <tanure@linux.com>
Subject: [PATCH 2/2] HID: appleir: Use devm_kzalloc() instead of kzalloc()
Date:   Sat, 29 Feb 2020 17:43:34 +0000
Message-Id: <2ab20fa788a1a6996fd2c469f7a96ec780c9bf77.1582998175.git.tanure@linux.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <7c4c591bc1aa9e269cbf764a03e64d32dd6e6e96.1582998175.git.tanure@linux.com>
References: <7c4c591bc1aa9e269cbf764a03e64d32dd6e6e96.1582998175.git.tanure@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 drivers/hid/hid-appleir.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-appleir.c b/drivers/hid/hid-appleir.c
index aafc285b538f..8deded185725 100644
--- a/drivers/hid/hid-appleir.c
+++ b/drivers/hid/hid-appleir.c
@@ -283,7 +283,7 @@ static int appleir_probe(struct hid_device *hid, const struct hid_device_id *id)
 	int ret;
 	struct appleir *appleir;
 
-	appleir = kzalloc(sizeof(struct appleir), GFP_KERNEL);
+	appleir = devm_kzalloc(&hid->dev, sizeof(struct appleir), GFP_KERNEL);
 	if (!appleir)
 		return -ENOMEM;
 
@@ -311,7 +311,7 @@ static int appleir_probe(struct hid_device *hid, const struct hid_device_id *id)
 
 	return 0;
 fail:
-	kfree(appleir);
+	devm_kfree(&hid->dev, appleir);
 	return ret;
 }
 
@@ -320,7 +320,6 @@ static void appleir_remove(struct hid_device *hid)
 	struct appleir *appleir = hid_get_drvdata(hid);
 	hid_hw_stop(hid);
 	del_timer_sync(&appleir->key_up_timer);
-	kfree(appleir);
 }
 
 static const struct hid_device_id appleir_devices[] = {
-- 
2.25.1

