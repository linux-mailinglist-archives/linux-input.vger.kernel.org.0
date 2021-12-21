Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F38947C75B
	for <lists+linux-input@lfdr.de>; Tue, 21 Dec 2021 20:17:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241747AbhLUTRy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Dec 2021 14:17:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241746AbhLUTRy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Dec 2021 14:17:54 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF2F9C06173F
        for <linux-input@vger.kernel.org>; Tue, 21 Dec 2021 11:17:53 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id 203-20020a1c01d4000000b00345bf98da86so1161824wmb.3
        for <linux-input@vger.kernel.org>; Tue, 21 Dec 2021 11:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GdaWpy//TX5tfDTh/jiXY1Aj27hl0tvdjm01dm25ifs=;
        b=XVVArxziePNps6R3J26WCHcOcKZJQnAWH5bNbHHUjDNlM0gRNT9Q74hEr2mosRhi84
         uJKD126MaeLEolivnzYD5QimXNiAtn7AyfuPaaJpgMB/zvz0I4EcakAEgaTbXLh4YlZA
         wMvyhM4ATiX8BgCA/RKh7w1A5I3xdQLkl82YuzO7PWXQdcASymFSQCndwfv+IuDIHm3U
         4g2+yhaLHbS7M+eocLhTevuvjJV5zfWTOv9RZuijwUtr+SyW9q3y0M1HS573L/FI5k8K
         FCH9lLdlvhQxLY/D5qfnmmzrsWGlhE9ho7TETlRZ/QqQBPow6Sn2MfDz6s7/iOQu3ULA
         fF7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GdaWpy//TX5tfDTh/jiXY1Aj27hl0tvdjm01dm25ifs=;
        b=2X4cD73/w+W3oPBztWRUVtbE2Er0ptqexL+NGhBVtZY0UJqhH1eh8RgcRzrbVbKayi
         KtnK8LZt1Hvy8Tn9wqUGwsz1INmYjWgSmgcPpgzU0WbBT5iuIitmoZUdvZ8IntLqhx3m
         Pg210d8sRAl+JjUL6eoN1EBwe/v0qNJhWEqZ3R/wp3/3X+MGmyNJ8ZTX7hQSxWwjyTTa
         BIHhLEbp6rg7EDbjjKju4BDznaQuJuUgLd6fudU98OUgDD7cZjk0kxQ55ZP+PvOZX0Qy
         3TkGewz58eyJ8+C/4aUqyau2tmnEASU7Yp07PTO7mfeo+uXLwsdo5r3hBMTDgdjeoYno
         J3sA==
X-Gm-Message-State: AOAM530vY5Pl9trd+SWpJQrPvNRPVS24sr9jQqDdzt2+MWJVgcOiS5nV
        x1Tsi8OrtxeEU4UNkGq6I7L9j0lrqDXuQD64W68=
X-Google-Smtp-Source: ABdhPJw0iP9OXM0sT7Zlj3dfG1T/AeZsazBQmXXNWy9N4psZBPZlLC2jAH7CkYhPGcXzSvl1F7bolQ==
X-Received: by 2002:a7b:c745:: with SMTP id w5mr3849880wmk.167.1640114272282;
        Tue, 21 Dec 2021 11:17:52 -0800 (PST)
Received: from aczubak.c.googlers.com.com (109.36.187.35.bc.googleusercontent.com. [35.187.36.109])
        by smtp.gmail.com with ESMTPSA id t8sm3994846wmq.32.2021.12.21.11.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 11:17:52 -0800 (PST)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, dmitry.torokhov@gmail.com,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH 09/18] Input: add shared effects
Date:   Tue, 21 Dec 2021 19:17:34 +0000
Message-Id: <20211221191743.1893185-10-acz@semihalf.com>
X-Mailer: git-send-email 2.34.1.307.g9b7440fafd-goog
In-Reply-To: <20211221191743.1893185-1-acz@semihalf.com>
References: <20211221191743.1893185-1-acz@semihalf.com>
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
2.34.1.307.g9b7440fafd-goog

