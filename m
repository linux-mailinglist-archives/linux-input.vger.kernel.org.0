Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F4692C4ADD
	for <lists+linux-input@lfdr.de>; Wed, 25 Nov 2020 23:40:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726802AbgKYWkI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Nov 2020 17:40:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbgKYWkI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Nov 2020 17:40:08 -0500
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A61BC0613D4
        for <linux-input@vger.kernel.org>; Wed, 25 Nov 2020 14:39:50 -0800 (PST)
Received: by mail-pl1-x644.google.com with SMTP id s2so122578plr.9
        for <linux-input@vger.kernel.org>; Wed, 25 Nov 2020 14:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fourwalledcubicle-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IW0lJQ7bFIC6blTN8rxreqjzLbzcm4ylipUCl3e68EY=;
        b=ZBdyOg8qOIu/DHEq9f5yh38NvQGZQZo/0OC7/COfsjQqNfxZnXtSim7O1ST9xdFHkE
         WqCUMUXW+MHNGw4SWoN0r8uCr/CnOvpAaE3KwsHY27+9ryjBsZTsdAsuAsBFr2tUR5EQ
         kf+c5QF5Q4j5nHSQBIVH2WhGuRVJfWjJIpvjBDaAsI8k1knwJ3vXDrQwD2/yQgMrOrGp
         d9xRXNRAZPpZZ4iVdQ4CkKm6VOHOE20nE2L1H9QnMuTHkwxo/DSIt7ydnRVBaLR+2EUm
         bpYpV4SuYZ3ey8FdYQz14egow/x+TsZ5LYWwZKcQXZRtPw1NOumNCTKoFb0AUHGPPgqx
         Ltcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IW0lJQ7bFIC6blTN8rxreqjzLbzcm4ylipUCl3e68EY=;
        b=o1FndC2xPmEA7DaAtJimaQUNfFi96JiBlUv8Js9vJqLKb7sh1sbSWPpWJncriCDexu
         up6Sg7+Zx7ALiu6iBeiy9Z82cLckJXX57Tf9ycRjXgaNno6Y5NOaWDq9gJVoTvCrvfZD
         zPynKq2RIHe8ajhi1YZNA53Q3+y//oy8I6yZdqXKUDdrpsH78nGFNOmee55sg/6G5VXZ
         6OadLulN3VX1PoOf55195puxl0KGGEj4FzfTfsSrKtC2fqRyC16VJRvo45IYK7aSXvkw
         GG6kyf1+6V3QFV2umAQpvgkZdJguZG1TuUR1YJ2w4DP1njOXlpSc9Jy4DsxJcUxm9nJN
         oOTQ==
X-Gm-Message-State: AOAM531I4WieGNg7TOgwImf1bOe3ktvb9qplHxDrRarzEPY2FMAEeb7a
        EtEGHXbnDeLSq6KcnLb3QtTi8NKeigoyO0DG
X-Google-Smtp-Source: ABdhPJyVBVwv6y7/pi3iWiPUuLzkhF18UkqnnB9EpNoxbtZYEsT2Isp+oyAk1G+8VZGpt/lpxn4FTg==
X-Received: by 2002:a17:902:bd41:b029:d8:f07f:4815 with SMTP id b1-20020a170902bd41b02900d8f07f4815mr37374plx.70.1606343989294;
        Wed, 25 Nov 2020 14:39:49 -0800 (PST)
Received: from localhost.localdomain (203-123-108-233.ip4.superloop.com. [203.123.108.233])
        by smtp.googlemail.com with ESMTPSA id j10sm2987474pgc.85.2020.11.25.14.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 14:39:48 -0800 (PST)
From:   Dean Camera <dean@fourwalledcubicle.com>
To:     linux-input@vger.kernel.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com
Cc:     Dean Camera <dean@fourwalledcubicle.com>
Subject: [V3, PATCH] Increase HID maximum packet size to 16KB.
Date:   Thu, 26 Nov 2020 09:39:34 +1100
Message-Id: <20201125223934.5861-1-dean@fourwalledcubicle.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Currently the maximum HID report size which can be buffered by the
kernel is 8KB. This is sufficient for the vast majority of HID
devices on the market, as most HID reports are fairly small.

However, some unusual devices such as the Elgate Stream Deck exist
which use a report size slightly over 8KB for the image data that
is sent to the device. Reports these large cannot be buffered by
the regular HID subsystem currently, thus the only way to use such
device is to bypass the HID subsystem entirely.

This increases the maximum HID report size to 16KB, which should
cover all sanely designed HID devices.

Signed-off-by: Dean Camera <dean@fourwalledcubicle.com>
---
 include/linux/hid.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/hid.h b/include/linux/hid.h
index 58684657960b..2faa7aba67ed 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -494,7 +494,7 @@ struct hid_report_enum {
 };
 
 #define HID_MIN_BUFFER_SIZE	64		/* make sure there is at least a packet size of space */
-#define HID_MAX_BUFFER_SIZE	8192		/* 8kb */
+#define HID_MAX_BUFFER_SIZE	16384		/* 16kb */
 #define HID_CONTROL_FIFO_SIZE	256		/* to init devices with >100 reports */
 #define HID_OUTPUT_FIFO_SIZE	64
 
-- 
2.25.1

