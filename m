Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B51C525F2B
	for <lists+linux-input@lfdr.de>; Fri, 13 May 2022 12:07:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379100AbiEMJkB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 May 2022 05:40:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379101AbiEMJjv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 May 2022 05:39:51 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BF2A291CDC
        for <linux-input@vger.kernel.org>; Fri, 13 May 2022 02:39:49 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id v12so10620690wrv.10
        for <linux-input@vger.kernel.org>; Fri, 13 May 2022 02:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=21VAODRnaYGO5mjcXKrja1BvMEwTAYGDEk9j65ebLNw=;
        b=2itsY17oZS2xUiB0FdX4gPMxJne+bt0ypOU0pHctSOE/YaFBaagGVpNLeXG4lmBtyN
         ZrNM3B/gEfwpJ/GgNOhc8AzhHDOF3ktITkFFpC6PM7MHTPakSEO2Y83HKeQMKLtlKbQ+
         WkQ3k2pkgGSQIiqVdSTqPXiGjnxxv+P1eFslNoF6TO0SUo5NJzYjgCQOQ9vUcj859oji
         IeeZtlQTZaVg6z6QTj4L0e4vkV4Kd6vVyOHA8fILLV6HwTC2CJqaBFV7SPym+M18ZpKN
         yLR4+DKywgnMhX8HEqCizTnz6/O/nntpBMc5ITfjU4qabbCiWAE9jwMBc7u42npavrQ1
         3F/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=21VAODRnaYGO5mjcXKrja1BvMEwTAYGDEk9j65ebLNw=;
        b=Axczns+trTulFw8w0ABBsGcbFBrsuxGbhvCSf3EALlKzdjhSJQda2NXHaHMZ0G7Fa3
         9cUNyIOU5DfhJtX9qTUfelaYkLGR/r38Yuj6FPQtjiU5atcmsSVN9qsBgnpADtRnq28G
         LVo4oVNYS7D+0aEAu6fdRPKM94ARKFMWWOhFTQ43qsOE4Wv6+oD0COW4Qy1NYGRcfO6Y
         dn8/B+os/RHxVBgSt3NJYnFmK1QriqJyNg3mdB5qXYisr2jg2Jzz4X8Y7zUZLvz8Ghrs
         lgvbp6+Pl8jGPBL3rac8ktGsQfc/cruNfD5l04BKJu96ffGhTu3WU+K/ndPNxtjCVVMj
         ibAw==
X-Gm-Message-State: AOAM5336/FmAq59atbuE3+yMSeJqjfkn9A+9L+9BtBV1G+fqlNOiezJt
        aFu09fvXhFtltUn1TyigLI1jPk2Yu2c5enzlTpk=
X-Google-Smtp-Source: ABdhPJyv162lIInR0bctTyVM3lMkY4QPwKPionk0xj6wMmosvzUWHDN8VcsEEfbxvl5Au5qGvB3CxA==
X-Received: by 2002:a05:6000:188a:b0:20c:e43e:83f3 with SMTP id a10-20020a056000188a00b0020ce43e83f3mr3262983wri.621.1652434788246;
        Fri, 13 May 2022 02:39:48 -0700 (PDT)
Received: from aczubak.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id l5-20020adfa385000000b0020ce015ed48sm1631404wrb.103.2022.05.13.02.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 02:39:47 -0700 (PDT)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, dmitry.torokhov@gmail.com,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH v3 06/17] Input: add shared effects
Date:   Fri, 13 May 2022 09:39:16 +0000
Message-Id: <20220513093927.1632262-7-acz@semihalf.com>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
In-Reply-To: <20220513093927.1632262-1-acz@semihalf.com>
References: <20220513093927.1632262-1-acz@semihalf.com>
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

If an effect is uploaded with file handle equal UINTPTR_MAX assume this
effect should be shared and so may be modified using different file
handles.

Signed-off-by: Angela Czubak <acz@semihalf.com>
---
 drivers/input/ff-core.c | 40 ++++++++++++++++++++++++++++++++++------
 1 file changed, 34 insertions(+), 6 deletions(-)

diff --git a/drivers/input/ff-core.c b/drivers/input/ff-core.c
index fa8d1a466014..1a9a5401acb5 100644
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
2.36.0.550.gb090851708-goog

