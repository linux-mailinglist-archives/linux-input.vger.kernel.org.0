Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E17C8597533
	for <lists+linux-input@lfdr.de>; Wed, 17 Aug 2022 19:43:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238193AbiHQRjo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Aug 2022 13:39:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237097AbiHQRjo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Aug 2022 13:39:44 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C30E55755B
        for <linux-input@vger.kernel.org>; Wed, 17 Aug 2022 10:39:42 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id fy5so25804220ejc.3
        for <linux-input@vger.kernel.org>; Wed, 17 Aug 2022 10:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=yngvason-is.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=hKmRhzvPkxj/iylDqbWJbRrwHNFOVBo+25u4rZQjXMg=;
        b=O8gmDNqY67+531wmNzIKWoE9BQY9LZqnhiD1KayJ9GzDUDksKYYKI2P2bGENbtq9u6
         M0wiOdptQWOdtyqOo27EzAOCX3Q6T4fDhnstYn2ZPuWT9Kuk9XiC896ApqieoSylKSeS
         nl05IPRkuXb8wjXSsJ8E9rKghmmsNUPtGONX0yT+o1UqC77KWYmvDLEtEsBUSLUxjeGF
         XJhC+nkjiPmnsFbAzr6dxWjoe4kHrQXb4fEft3OFhceQFtQj6ZaLwqXWQNP7ef2FjT8i
         oaB1pS9bmru3uoTK1GdXfJEI/OzPIKTCGq3cNvSdFLwpkm3bBMOxnE2P5bu+DmHU9ncU
         acsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=hKmRhzvPkxj/iylDqbWJbRrwHNFOVBo+25u4rZQjXMg=;
        b=ArfrI29xrqx0+XfkKG5evlbXuVaxbDceDi7YGanj1qR4P4J+/qbe0G2d/ge1HJfPYE
         BBoho2mGjLFpIxwPSjKd0b7Bbtrru4tAq/iDaFxTWxDNFrutxia6w4jD4Tny/s5SjbaB
         Tm1a/tFNDRoccNEqPvtX9gmCBHAE3lzNpy71Iylm08/X7+JUlXj37qCMIvdfr/dPumRP
         XmkdZaCpYRdfiusd4aO8ukbcwaLaC00hyjpZMNqZw1PKVxpdzD+AaN6eP1nNsPOE5Kdp
         chcvQa9rEKN5woqm58EIDCVJhHb2HAJJjB0jqZZGgH181xdOyuUfZD6lIMuC7foIdEbS
         X23A==
X-Gm-Message-State: ACgBeo2L7sDb8Q5rKnxKvjQGjxB0H4oxumQI0m/QDvzm3qn3RpqSAyoK
        kJgy1+85TJu1lT94SqA6aza/fQ==
X-Google-Smtp-Source: AA6agR4Yp3JC9R53DFOPRiJB036o3Mv6H1COoyOciEqZ7Ph9SmvnPG4aCfwNvb7SS7qvtcMaHyUu+w==
X-Received: by 2002:a17:906:8a63:b0:730:9e5c:b456 with SMTP id hy3-20020a1709068a6300b007309e5cb456mr16892514ejc.571.1660757981361;
        Wed, 17 Aug 2022 10:39:41 -0700 (PDT)
Received: from andri-workstation.turninn.appdynamic.com ([2a01:8280:aa07:ad:7285:c2ff:fef0:4baf])
        by smtp.gmail.com with ESMTPSA id gv11-20020a170906f10b00b0072af4af2f46sm6977266ejb.74.2022.08.17.10.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 10:39:40 -0700 (PDT)
From:   Andri Yngvason <andri@yngvason.is>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
        Andri Yngvason <andri@yngvason.is>, stable@vger.kernel.org
Subject: [PATCH v2] HID: multitouch: Add memory barriers
Date:   Wed, 17 Aug 2022 17:32:35 +0000
Message-Id: <20220817173234.3564543-1-andri@yngvason.is>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This fixes broken atomic checks which cause a race between the
release-timer and processing of hid input.

I noticed that contacts were sometimes sticking, even with the "sticky
fingers" quirk enabled. This fixes that problem.

Cc: stable@vger.kernel.org
Fixes: 9609827458c37d7b2c37f2a9255631c603a5004c
Signed-off-by: Andri Yngvason <andri@yngvason.is>
---
 V1 -> V2: Clarified where the race is and added Fixes tag as suggested
 	   by Greg KH

 drivers/hid/hid-multitouch.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 2e72922e36f5..91a4d3fc30e0 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -1186,7 +1186,7 @@ static void mt_touch_report(struct hid_device *hid,
 	int contact_count = -1;
 
 	/* sticky fingers release in progress, abort */
-	if (test_and_set_bit(MT_IO_FLAGS_RUNNING, &td->mt_io_flags))
+	if (test_and_set_bit_lock(MT_IO_FLAGS_RUNNING, &td->mt_io_flags))
 		return;
 
 	scantime = *app->scantime;
@@ -1267,7 +1267,7 @@ static void mt_touch_report(struct hid_device *hid,
 			del_timer(&td->release_timer);
 	}
 
-	clear_bit(MT_IO_FLAGS_RUNNING, &td->mt_io_flags);
+	clear_bit_unlock(MT_IO_FLAGS_RUNNING, &td->mt_io_flags);
 }
 
 static int mt_touch_input_configured(struct hid_device *hdev,
@@ -1699,11 +1699,11 @@ static void mt_expired_timeout(struct timer_list *t)
 	 * An input report came in just before we release the sticky fingers,
 	 * it will take care of the sticky fingers.
 	 */
-	if (test_and_set_bit(MT_IO_FLAGS_RUNNING, &td->mt_io_flags))
+	if (test_and_set_bit_lock(MT_IO_FLAGS_RUNNING, &td->mt_io_flags))
 		return;
 	if (test_bit(MT_IO_FLAGS_PENDING_SLOTS, &td->mt_io_flags))
 		mt_release_contacts(hdev);
-	clear_bit(MT_IO_FLAGS_RUNNING, &td->mt_io_flags);
+	clear_bit_unlock(MT_IO_FLAGS_RUNNING, &td->mt_io_flags);
 }
 
 static int mt_probe(struct hid_device *hdev, const struct hid_device_id *id)
-- 
2.37.1

