Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C189D5F7D69
	for <lists+linux-input@lfdr.de>; Fri,  7 Oct 2022 20:30:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbiJGSah (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 7 Oct 2022 14:30:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229871AbiJGSa2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 7 Oct 2022 14:30:28 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67262B0B1F
        for <linux-input@vger.kernel.org>; Fri,  7 Oct 2022 11:30:27 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id b7so8462618wrq.9
        for <linux-input@vger.kernel.org>; Fri, 07 Oct 2022 11:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t9IN2ULqB2l+f+6YAJyLJNYvDkMq2mv3Np5c5UD+cq8=;
        b=iqkgyBXsZBnZ6mvaawQO3t6YoY9ocxw7uDp+Ip9U7foeoaAVf3xFJswYkWkNnsU0Fo
         KYcs11gkYGwmM9P7rGjbddcXR9li3/GMarPBIeP23zoT1BK242z6RpJD+ogBIbXYsxle
         HXbXDiVbZ6Vsga0ZO/dkvsnx/iB7WFlBXVjlWRPA5VtbUdcAP4fLdPPxC1nzkAdhzem4
         AX77sg3It076+TJL8VjWZzGBZ4kbtTQLqSKH+TqRTKHboWUi+o41/PShnnNVFvDmY8r3
         oxWzSjSNoafmJFffvuNoiLZkO8+rczsmAA6Jsg4UUTCtufFlDXmpqTurTqr6KNFGNRxB
         Xrag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t9IN2ULqB2l+f+6YAJyLJNYvDkMq2mv3Np5c5UD+cq8=;
        b=x3ZUyhmAezi+Go2fzkg/b959zwa2ILssG2MR0kIjO+ptj20zVaq9mb3ncw0hKt7xTf
         B/t2o9ZWa32PWPy1cUfiIUX7RSvoPpNwquiuG43+NYQenJ1MrYaOwLZ993zzRZNdJYBC
         xM+UHt6+8hkAbPzWHcEW1uDw3P1HYFGkMC+lfMeOb/wbfKoZvOOa6xSm3S9LFWmQ2OSx
         UViaNydGg0XMYyfSZn6RARL94fcn8SHTr/ASZbEd+TdnCT6onq31Dd8Ku13P30GXr67P
         tM6Ln6MtCaqrsm0BK9ThLRMh+8GdPAwyJ+dm7AuwONFDy6IuOjNwIuOE1776/cStzdCA
         dLwA==
X-Gm-Message-State: ACrzQf2H7rHN5XleMuaJPBha3ihnEbgW5KsQyak/+EJDzcsv4eu2MFhn
        jGC+824iLxsvGeqGpp0MV3M9qk/x3IwKb0ED
X-Google-Smtp-Source: AMsMyM7NrImtrWquMj7wiNt8bTSNQuyEZb2wmyF9aoOAE+PB9F0ZUWi8xhfzcWoMFAataautpA9lLA==
X-Received: by 2002:a05:6000:61c:b0:22e:5e08:43e7 with SMTP id bn28-20020a056000061c00b0022e5e0843e7mr4225163wrb.176.1665167416164;
        Fri, 07 Oct 2022 11:30:16 -0700 (PDT)
Received: from aczubak.c.googlers.com.com (230.213.79.34.bc.googleusercontent.com. [34.79.213.230])
        by smtp.gmail.com with ESMTPSA id l10-20020a05600012ca00b002258235bda3sm2573627wrx.61.2022.10.07.11.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 11:30:15 -0700 (PDT)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, dmitry.torokhov@gmail.com,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH v4 06/17] Input: add shared effects
Date:   Fri,  7 Oct 2022 18:29:34 +0000
Message-Id: <20221007182945.1654046-7-acz@semihalf.com>
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

If an effect is uploaded with file handle equal UINTPTR_MAX assume this
effect should be shared and so may be modified using different file
handles.

Signed-off-by: Angela Czubak <acz@semihalf.com>
---
 drivers/input/ff-core.c | 40 ++++++++++++++++++++++++++++++++++------
 1 file changed, 34 insertions(+), 6 deletions(-)

diff --git a/drivers/input/ff-core.c b/drivers/input/ff-core.c
index fa8d1a4660142..1a9a5401acb55 100644
--- a/drivers/input/ff-core.c
+++ b/drivers/input/ff-core.c
@@ -34,6 +34,23 @@ static int check_effect_access(struct ff_device *ff, int effect_id,
 	return 0;
 }
 
+/*
+ * Check that the effect_id is a valid effect and whether the effect
+ * is shared
+ */
+static int check_effect_shared(struct ff_device *ff, int effect_id)
+{
+	if (effect_id < 0 || effect_id >= ff->max_effects ||
+	    !ff->effect_owners[effect_id])
+		return -EINVAL;
+
+	/* Shared effect */
+	if (ff->effect_owners[effect_id] == (struct file *)UINTPTR_MAX)
+		return 0;
+
+	return -EACCES;
+}
+
 /*
  * Checks whether 2 effects can be combined together
  */
@@ -139,8 +156,11 @@ int input_ff_upload(struct input_dev *dev, struct ff_effect *effect,
 		id = effect->id;
 
 		ret = check_effect_access(ff, id, file);
-		if (ret)
-			goto out;
+		if (ret) {
+			ret = check_effect_shared(ff, id);
+			if (ret)
+				goto out;
+		}
 
 		old = &ff->effects[id];
 
@@ -174,21 +194,29 @@ static int erase_effect(struct input_dev *dev, int effect_id,
 {
 	struct ff_device *ff = dev->ff;
 	int error;
+	bool shared = false;
 
 	error = check_effect_access(ff, effect_id, file);
-	if (error)
-		return error;
+	if (error) {
+		error = check_effect_shared(ff, effect_id);
+		if (!error)
+			shared = true;
+		else
+			return error;
+	}
 
 	spin_lock_irq(&dev->event_lock);
 	ff->playback(dev, effect_id, 0);
-	ff->effect_owners[effect_id] = NULL;
+	if (!shared)
+		ff->effect_owners[effect_id] = NULL;
 	spin_unlock_irq(&dev->event_lock);
 
 	if (ff->erase) {
 		error = ff->erase(dev, effect_id);
 		if (error) {
 			spin_lock_irq(&dev->event_lock);
-			ff->effect_owners[effect_id] = file;
+			if (!shared)
+				ff->effect_owners[effect_id] = file;
 			spin_unlock_irq(&dev->event_lock);
 
 			return error;
-- 
2.38.0.rc1.362.ged0d419d3c-goog

