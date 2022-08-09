Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5EAD58DFE5
	for <lists+linux-input@lfdr.de>; Tue,  9 Aug 2022 21:09:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345459AbiHITHm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 9 Aug 2022 15:07:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348394AbiHITGv (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 9 Aug 2022 15:06:51 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17D2D286EF
        for <linux-input@vger.kernel.org>; Tue,  9 Aug 2022 11:53:09 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id z22so16266959edd.6
        for <linux-input@vger.kernel.org>; Tue, 09 Aug 2022 11:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=yngvason-is.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=bSmwmy0d4ywlzFxYzuJvOnoVLp0jnUKwPWKgJ5yhLF4=;
        b=USW+KTDFOgMxHjyUyP6gvObtoUnYD4uz2HG1RpaR3C1O0Ry2yrhUISxkmDZS02KJ5u
         7KSpUqSyhyr1lnuGRmjoxF+AtV8V3/wPa7eqDlDTeQWBuDApGui7KEnMacujM7hA3WkI
         gcyPaVaYUcLlo7u16e6nuqkQR9dztCZVlNEkuCPIndgYyiA0VD5SP6gB6skdkfjy/KZ3
         STGUXmfzn3SjHI7uIlxttvLC2JMgNzkkeCeDhEltb2pKdpIwUZd8GJFJk7tfKaupS+y0
         tmVVcn20cao+VAq88M6nL0TgBILcdC7uEcSsU5Li6VCqMAfpyvnlnd4UCSxIbh2kdp+U
         9QJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=bSmwmy0d4ywlzFxYzuJvOnoVLp0jnUKwPWKgJ5yhLF4=;
        b=KuCN5dLUXrqlec8S41zR131l2aJ9PF0qHSn9aPRFYQ0vCaca+K0TmYlGL5hRI1pkcC
         i9qtNyKkrI1oPlZZxeVGrchhwfDknhhFJAJqLZ6AZVh+QLubtcCf2l4G1vwajhgSiRm0
         48Bb0xhzsUKAtX+XUHHBcEwjh3B7Eki80eI4wFuwnCgdGFiqOFeaxaJ1cgtl6Js0Tm1z
         ZFZ8NxKp+srJHwGpX6dti3ptHUJzNoYu27OMUO9YTjW+RvJcfXeR7Xmh8+HQgnfgpZmr
         n0OVEmFYlcsSbuP93GvdPQsLsSosDptj8/ASJaDIzlAd66nRH+DWtevbqMKKh/KwuRHc
         7Eiw==
X-Gm-Message-State: ACgBeo3MHxayrzhGrIZZ0j/zwqVQcE/CV15AwvSwL+LDw+pby05jwPFl
        28/Lz/Krz5nOe8yoKaGsBiRp2o16uLBIHsTa
X-Google-Smtp-Source: AA6agR5/8sMdQc7YyszdXqeA08b9F1SsOh5FN88DLMS3vZKz8mJZGzkJ+mi9qlxSPPs28HFCqbeMvg==
X-Received: by 2002:a05:6402:4392:b0:43e:5033:40f8 with SMTP id o18-20020a056402439200b0043e503340f8mr23170800edc.245.1660071187677;
        Tue, 09 Aug 2022 11:53:07 -0700 (PDT)
Received: from andri-workstation.turninn.appdynamic.com ([2a01:8280:aa07:ad:7285:c2ff:fef0:4baf])
        by smtp.gmail.com with ESMTPSA id v12-20020aa7dbcc000000b0042de3d661d2sm6452921edt.1.2022.08.09.11.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 11:53:07 -0700 (PDT)
From:   Andri Yngvason <andri@yngvason.is>
To:     linux-input@vger.kernel.org
Cc:     Andri Yngvason <andri@yngvason.is>
Subject: [PATCH] HID: multitouch: Add memory barriers
Date:   Tue,  9 Aug 2022 18:51:25 +0000
Message-Id: <20220809185124.270636-1-andri@yngvason.is>
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

