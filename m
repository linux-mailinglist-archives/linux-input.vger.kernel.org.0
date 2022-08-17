Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D4A3596DAC
	for <lists+linux-input@lfdr.de>; Wed, 17 Aug 2022 13:41:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231751AbiHQLgi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Aug 2022 07:36:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229749AbiHQLgh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Aug 2022 07:36:37 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B7247823C
        for <linux-input@vger.kernel.org>; Wed, 17 Aug 2022 04:36:36 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id t5so17088251edc.11
        for <linux-input@vger.kernel.org>; Wed, 17 Aug 2022 04:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=yngvason-is.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=gyCEOVo27wLAgzpJn/UaSXEoHE1DuPy7RQEOcX5blIE=;
        b=nn7x/cIq+VkVCFcfZyzJrstcEcSjIV97WfYHTP5kVbXF5dD8ibTaZvULLDBt3wdd6+
         10RQ8VOwKs1Yqwk5SL6gaJwT+pMkTtNYIN/XCaXtu+YZYxYV5HiiykAnJkOkcJeyHcrq
         1aRQqfsZYuMKVnT1IV7A0S4jzwBncL4D7Y0vGxSpu/NRZg2tAljtAO52MsJScz7s1tr2
         c2vtMtRzOCkXlQnUkVPBrB/u9F8oyQ8eGTvjd+siO9mDwbPqwkvusNe/1HDuMdw76rWe
         BBV3Vag3hxlj09PFPXgzfxTvfP5lKyQ5xVe5HaYQPRoZZLhialdn1X0JXEJuDKtVTIo7
         ewwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=gyCEOVo27wLAgzpJn/UaSXEoHE1DuPy7RQEOcX5blIE=;
        b=isWNeuxDVbnSCRvJLo7bIugK00uS8iuo0c1aZPoHEQiW2Yo+4NciDK+QfoJqNGRvur
         LvOU4Whrjm0mk1LoN3v6Xy4dV/gFhG3cqnSQkU+AQ1QBaN0PeNBAr21+UdBRHLeTLSNd
         4YClSCo4Ij5set0z0dTIr9CyojdPwBubBoGk1352mOnH94iaAGC4sjGlagxMW9lpUHky
         u5K7YQiEHs66MgWL96IAOer+XRMpAt+jqgEBw/T5CEA614If+RI9vKaRIh5xuUZV6rhJ
         B+g2lCy8/nUCBd009aKpTAPL+pXovxCdzk1YLXA9McAsP/ptsh0I0zmB+QYDZYk8hCkp
         s/ug==
X-Gm-Message-State: ACgBeo30qeP60YnOflEnDUXDv5TzCY5nfUXqrUPAnE3JSW0G4ST470ts
        BGvmGOYVzs6CE3wPsOaojVuL+g==
X-Google-Smtp-Source: AA6agR46lmxLDl89sLkMTDpz4VMKopvL77Xlq+20zuQfkQ9REJE26TM/e5d9N3EssFxeBTHHGcfL/A==
X-Received: by 2002:a05:6402:f0e:b0:43d:61d6:bff9 with SMTP id i14-20020a0564020f0e00b0043d61d6bff9mr22139057eda.78.1660736194525;
        Wed, 17 Aug 2022 04:36:34 -0700 (PDT)
Received: from andri-workstation.turninn.appdynamic.com ([2a01:8280:aa07:ad:7285:c2ff:fef0:4baf])
        by smtp.gmail.com with ESMTPSA id qn16-20020a170907211000b007330204dccdsm6780318ejb.140.2022.08.17.04.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 04:36:33 -0700 (PDT)
From:   Andri Yngvason <andri@yngvason.is>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Andri Yngvason <andri@yngvason.is>,
        stable@vger.kernel.org
Subject: [PATCH RESEND] HID: multitouch: Add memory barriers
Date:   Wed, 17 Aug 2022 11:32:48 +0000
Message-Id: <20220817113247.3530979-1-andri@yngvason.is>
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

This fixes a race with the release-timer by adding acquire/release
barrier semantics.

I noticed that contacts were sometimes sticking, even with the "sticky
fingers" quirk enabled. This fixes that problem.

Cc: stable@vger.kernel.org
Signed-off-by: Andri Yngvason <andri@yngvason.is>
---
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

