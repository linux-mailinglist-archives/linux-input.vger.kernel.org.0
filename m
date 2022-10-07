Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37F395F7D60
	for <lists+linux-input@lfdr.de>; Fri,  7 Oct 2022 20:30:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbiJGSab (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 7 Oct 2022 14:30:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229768AbiJGSaX (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 7 Oct 2022 14:30:23 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3E1EC696C
        for <linux-input@vger.kernel.org>; Fri,  7 Oct 2022 11:30:20 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id n12so8445111wrp.10
        for <linux-input@vger.kernel.org>; Fri, 07 Oct 2022 11:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y3LRdC6fJaw14nph11Cyflovqm6lPGnWjctYaKLwwRU=;
        b=RzOhzh6/Db9dc2oADlwFzGvNByOciGKFWGFaLHsm5ZHrUfyQRY8tb0XK4LF9Q6ACIh
         nJfW3kFEwcqWpqMHZ6vZ7bBO+DuEJzNW+vTZeUqRFdP/I1RdFhosStn8teuoa8tg25xM
         oSKAX1mirTOeGUjVtEqxVhKu9oTxLhomx22FPZ164hJ0mMaleR8eoyuoniOe0ETXsSDH
         /W5aeHi03Wvl+6ssyuthzpZcYRhkXbvtKExU9EUDgKLs34mtXEtVLknkfp6GyxtE5ZiT
         wkGBEYP1Nmvrp+W4NHeZkwwxRa1pzImndUMGqIxocdJWltoeKzfdoKq25Tj53E3o6fOA
         RLXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y3LRdC6fJaw14nph11Cyflovqm6lPGnWjctYaKLwwRU=;
        b=yetlJ1KnWmClWhx9OH4/GwIvuttPW3YaLmk1qAM3ZxtwbVDNB5NboHpx/jm8Dg/B1A
         TwxovMxsAr0CX3G4I//ZfWXivRvMHjG95ITcfnmfzM2obUovmTMGQrPrDSxGpAAqrGUZ
         J9s0Db8ZE5Kz45ePhlPB+7iGfRo/31OhDmhfL8W5YPwwKQGmR2KaM6MC+JFR35sranQm
         ST54fEnBr6dYL5fXgxdTD+n2T3JteopZxKNkXpOhFvL5ucxpQhmYPClhyvhVFiAebHcg
         JwfRU6O1uNpRQCodsmz46Crq+8cuO7hjkoZm0y6zuO+TT7MvF0DiXLFZuUVdCDavxj6K
         Snyg==
X-Gm-Message-State: ACrzQf3e9WMNWbfAJgwgv5eppv7lAPAx6weveUrsrPQIAMAjBDM+SeBJ
        MgY3PSZ/K0YKbgcv4wrUxrhAzkkY8aowrTBJ
X-Google-Smtp-Source: AMsMyM6xrI5ufkrqFFH1hCFiZed4zf8etsrLW4Z1grlEKn7uK+k8wHPXNvaHj8iiCMu6lmY/SViJ5w==
X-Received: by 2002:adf:edc3:0:b0:22c:dbe9:e3b6 with SMTP id v3-20020adfedc3000000b0022cdbe9e3b6mr4129163wro.282.1665167419173;
        Fri, 07 Oct 2022 11:30:19 -0700 (PDT)
Received: from aczubak.c.googlers.com.com (230.213.79.34.bc.googleusercontent.com. [34.79.213.230])
        by smtp.gmail.com with ESMTPSA id l10-20020a05600012ca00b002258235bda3sm2573627wrx.61.2022.10.07.11.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 11:30:18 -0700 (PDT)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, dmitry.torokhov@gmail.com,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH v4 10/17] Input: MT - add INPUT_MT_MAX_FORCE flags
Date:   Fri,  7 Oct 2022 18:29:38 +0000
Message-Id: <20221007182945.1654046-11-acz@semihalf.com>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
In-Reply-To: <20221007182945.1654046-1-acz@semihalf.com>
References: <20221007182945.1654046-1-acz@semihalf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add a flag to generate ABS_PRESSURE as a maximum of ABS_MT_PRESSURE across
all slots.
This flag should be set if one knows a device reports true force and would
like to report total force to the userspace.

Signed-off-by: Angela Czubak <acz@semihalf.com>
---
 drivers/input/input-mt.c | 16 ++++++++++++----
 include/linux/input/mt.h |  1 +
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/input/input-mt.c b/drivers/input/input-mt.c
index 14b53dac1253b..bc710a8de3e0f 100644
--- a/drivers/input/input-mt.c
+++ b/drivers/input/input-mt.c
@@ -198,6 +198,7 @@ void input_mt_report_pointer_emulation(struct input_dev *dev, bool use_count)
 	struct input_mt *mt = dev->mt;
 	struct input_mt_slot *oldest;
 	int oldid, count, i;
+	int p, reported_p = 0;
 
 	if (!mt)
 		return;
@@ -216,6 +217,15 @@ void input_mt_report_pointer_emulation(struct input_dev *dev, bool use_count)
 			oldest = ps;
 			oldid = id;
 		}
+		if (test_bit(ABS_MT_PRESSURE, dev->absbit)) {
+			p = input_mt_get_value(ps, ABS_MT_PRESSURE);
+			if (mt->flags & INPUT_MT_MAX_FORCE) {
+				if (p > reported_p)
+					reported_p = p;
+			} else if (oldid == id) {
+				reported_p = p;
+			}
+		}
 		count++;
 	}
 
@@ -245,10 +255,8 @@ void input_mt_report_pointer_emulation(struct input_dev *dev, bool use_count)
 		input_event(dev, EV_ABS, ABS_X, x);
 		input_event(dev, EV_ABS, ABS_Y, y);
 
-		if (test_bit(ABS_MT_PRESSURE, dev->absbit)) {
-			int p = input_mt_get_value(oldest, ABS_MT_PRESSURE);
-			input_event(dev, EV_ABS, ABS_PRESSURE, p);
-		}
+		if (test_bit(ABS_MT_PRESSURE, dev->absbit))
+			input_event(dev, EV_ABS, ABS_PRESSURE, reported_p);
 	} else {
 		if (test_bit(ABS_MT_PRESSURE, dev->absbit))
 			input_event(dev, EV_ABS, ABS_PRESSURE, 0);
diff --git a/include/linux/input/mt.h b/include/linux/input/mt.h
index 3b8580bd33c14..b23216cf99230 100644
--- a/include/linux/input/mt.h
+++ b/include/linux/input/mt.h
@@ -17,6 +17,7 @@
 #define INPUT_MT_DROP_UNUSED	0x0004	/* drop contacts not seen in frame */
 #define INPUT_MT_TRACK		0x0008	/* use in-kernel tracking */
 #define INPUT_MT_SEMI_MT	0x0010	/* semi-mt device, finger count handled manually */
+#define INPUT_MT_MAX_FORCE	0x0020	/* choose max force from slots pressure */
 
 /**
  * struct input_mt_slot - represents the state of an input MT slot
-- 
2.38.0.rc1.362.ged0d419d3c-goog

