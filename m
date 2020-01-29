Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9A7C14C67B
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2020 07:27:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726091AbgA2G1m (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 29 Jan 2020 01:27:42 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:41826 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725966AbgA2G1l (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 29 Jan 2020 01:27:41 -0500
Received: by mail-pg1-f195.google.com with SMTP id x8so8294396pgk.8
        for <linux-input@vger.kernel.org>; Tue, 28 Jan 2020 22:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oxplot.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q6UFif4QYuYoVHHF8C0fUM38tDzpkMkldis3l9HA1rE=;
        b=T0PTfwvcBHdhJQunyXRO7sXkGNa3wLUE4IkhKGHmwUc+KLBFE94b5wOgrbq+4MttL5
         q72wf4JpiCBtmsSUV4OmP9vCXWGwYHELqlxl3g2HhrCWhz3tfKpSfOzV2ZGwEApVepqd
         C5z2cFJXTAgWFVtozND7MZJGLVlM9N7Y6IqfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q6UFif4QYuYoVHHF8C0fUM38tDzpkMkldis3l9HA1rE=;
        b=MxTcnFFalDfwtRH7aiHQtFAnybc3jQWs6Br+gzfix47QwZwRSngHiegZ3B/wsy9rqV
         OquMjJd0UgOfT7TtWkAr4f0GUNcureUZCMv3nlt9aRcSnQXuTV1xazNSS5/WvdxJ7589
         EKEqGBCSNm64Y1hxQEPEcpjHiosuaAQp7r15b7mQ9cxaRG2oZPNITtiFaYjoC6IAJziQ
         c9uZpivTyVXqAEq4yV9xTmfc7IQu7VhLvDpWoHbBN/Ittp2Pe+/7X6ziPwDqvSeuFCVY
         1evMpxv3OrVLgk5dmRnE813DMNhAKsLoSaA45txKBJYa49HQKgD45SzrDE77RaMK7T8Y
         CMkQ==
X-Gm-Message-State: APjAAAWtwZ4+y4VFBACdUhbY02mqr8VAlUmGTSPFlAJ12SLEuHb+pc9e
        7tDPEDX22tH6PmuXfbYH46QJckIAu6Nt
X-Google-Smtp-Source: APXvYqxirriyZDHUUb67XKllGd4slvU4+TLQOBA3G0ePKugX+3aj8cC+8K0lLIQ8gZZIAOhbHpGvZQ==
X-Received: by 2002:a63:cb48:: with SMTP id m8mr29851187pgi.128.1580279261163;
        Tue, 28 Jan 2020 22:27:41 -0800 (PST)
Received: from localhost.localdomain (110-174-242-179.static.tpgi.com.au. [110.174.242.179])
        by smtp.googlemail.com with ESMTPSA id n2sm1145244pfq.50.2020.01.28.22.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2020 22:27:40 -0800 (PST)
From:   Mansour Behabadi <mansour@oxplot.com>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Mansour Behabadi <mansour@oxplot.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] HID: apple: Add support for recent firmware
Date:   Wed, 29 Jan 2020 17:26:31 +1100
Message-Id: <20200129062631.22694-1-mansour@oxplot.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Magic Keyboards with more recent firmware (0x0100) report
Fn key differently. Without this patch, Fn key may not
behave as expected and may not be configurable via hid_apple
fnmode module parameter.

Signed-off-by: Mansour Behabadi <mansour@oxplot.com>
---
 drivers/hid/hid-apple.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index 6ac8becc2372..d732d1d10caf 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -340,7 +340,8 @@ static int apple_input_mapping(struct hid_device *hdev, struct hid_input *hi,
 		unsigned long **bit, int *max)
 {
 	if (usage->hid == (HID_UP_CUSTOM | 0x0003) ||
-			usage->hid == (HID_UP_MSVENDOR | 0x0003)) {
+			usage->hid == (HID_UP_MSVENDOR | 0x0003) ||
+			usage->hid == (HID_UP_HPVENDOR2 | 0x0003)) {
 		/* The fn key on Apple USB keyboards */
 		set_bit(EV_REP, hi->input->evbit);
 		hid_map_usage_clear(hi, usage, bit, max, EV_KEY, KEY_FN);
-- 
2.25.0

