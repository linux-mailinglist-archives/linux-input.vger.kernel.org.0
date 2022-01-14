Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A41A48EFF0
	for <lists+linux-input@lfdr.de>; Fri, 14 Jan 2022 19:32:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243108AbiANSce (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Jan 2022 13:32:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243105AbiANSca (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Jan 2022 13:32:30 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25110C06173E
        for <linux-input@vger.kernel.org>; Fri, 14 Jan 2022 10:32:30 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id l12-20020a7bc34c000000b003467c58cbdfso8854656wmj.2
        for <linux-input@vger.kernel.org>; Fri, 14 Jan 2022 10:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AHLt3sUb2fMQkhkkdlUxnnWbR3Lx+wdC9flrm9iGQO4=;
        b=7Dkb/qKDO1L36vg4sgekDMMyZEbKiIjHLqOhnAX4i5bJokoxq51rirgz77tYhEspC5
         2WxVFGlfhrCvqC6pIIySX7D3LfAsiE47oF6rPyG+cwqQ2FVt7vG0y3QHdL+dEfsmwDpq
         6t0aw1j5iVuSwnQVaxHO3CdIdoRUwoOmx0/TvxwCjtJT16d9hQ2WBiWqh+f5EZGekoMb
         aYv2B0g+Q8SHO79LhbJmKVWLni643HXPZIqdjGkoF2B+ybiAYLJFeEixMwkFa3Qp1E2w
         18LNwIT/35FAmBXL4w7GjwNWkZVdH2TUquNeYXPhn8rMXh7uE1rf2m+vy0PbLaktskGU
         128A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AHLt3sUb2fMQkhkkdlUxnnWbR3Lx+wdC9flrm9iGQO4=;
        b=56vZrwMCFOR5j7dZPquDbJmlKNXZBAvjSQdZb1ev0+wilpidX/h9XIoQ9n5H28twnU
         vqcCiNj95lmNYhx5EpIP/esqm7PQKMYGAS2k3rRkHSW4u5PU9hjqnPpOU29G/r8AmLez
         lwMEKTF/kxmC6GCa0r9W+cYA33t+0VqO8jB4X3QcyYO1a2+mq6/gvdBbbnY58kfBvapP
         FMW78s9GyKftV0xENizXMFCB4RSDeInmws2rwa+pW50kJV/h0mjxPDgBa0eST2bb3/PF
         FFjwmUxgKKCsWcpUpjvutbK9oALth26Gx3LlTGjXmV+9dZtAHkANTcl/H939NgJTpPnw
         oO2w==
X-Gm-Message-State: AOAM533kkLmyaEm4c7qYKBwJ4Jy64TEvZ/jXDy7Y3/8QyqXd1BaH1QBW
        ugQhNLd7UrL9KNApCpbfntloORdRomz2jXVEBLU=
X-Google-Smtp-Source: ABdhPJzHpNIBoYVgPg0UAQdrRibUhkAc2A9nn2eUjVaOTp7QZB7vi2udrcM8Mx8MFzWV6i47Qo1RFQ==
X-Received: by 2002:a05:600c:1991:: with SMTP id t17mr16558965wmq.21.1642185148766;
        Fri, 14 Jan 2022 10:32:28 -0800 (PST)
Received: from aczubak.c.googlers.com.com (109.36.187.35.bc.googleusercontent.com. [35.187.36.109])
        by smtp.gmail.com with ESMTPSA id az4sm6410984wrb.14.2022.01.14.10.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 10:32:28 -0800 (PST)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, dmitry.torokhov@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH v2 07/16] Input: add shared effects
Date:   Fri, 14 Jan 2022 18:31:43 +0000
Message-Id: <20220114183152.1691659-8-acz@semihalf.com>
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
In-Reply-To: <20220114183152.1691659-1-acz@semihalf.com>
References: <20220114183152.1691659-1-acz@semihalf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
index 1cf5deda06e1..960ae0e29348 100644
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
2.34.1.703.g22d0c6ccf7-goog

