Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 851085F7D63
	for <lists+linux-input@lfdr.de>; Fri,  7 Oct 2022 20:30:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbiJGSad (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 7 Oct 2022 14:30:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229682AbiJGSa0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 7 Oct 2022 14:30:26 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A621CAE69
        for <linux-input@vger.kernel.org>; Fri,  7 Oct 2022 11:30:22 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id n40-20020a05600c3ba800b003b49aefc35fso3054713wms.5
        for <linux-input@vger.kernel.org>; Fri, 07 Oct 2022 11:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=35lu5QN2zWAPxQjzdgnWOj0Wl1hHDV3zTu2YrzXNYfw=;
        b=D5P7RuT3imORZ/p/OwbgUpaMu8ucdmni72W8l5mDMyJYyYJxiE1zdxK+mAcBUpnyVE
         QqkPrEr/nEHN3AZDCOXU7JuCg26neAtfOtB80icljFmMKyYWtu+ea8OqNWdWNlyfoQp3
         6SOAXxObG3/fPdiV8BDea01OlTZASHSd0RJgigTMy0vIBEc1DWbxW6xLmrgxD5rsexZG
         K/Dq9ug0iVmhayIo6K4/d+yrZ5hfRZd03Y527N+VGUCH1qYEV6gT1QYsvBZm0bjGQfIG
         7cHOJDL1uaSnTYx0nJ8VoSqaN36EF33JZGt/ffgJNP4BVsWo6HA/I5LXvXLb1cTPsUAk
         Ur1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=35lu5QN2zWAPxQjzdgnWOj0Wl1hHDV3zTu2YrzXNYfw=;
        b=Uac5dnDch9QR6xP+LFS+SMlGPTXxYJnkmk91KaQY3kSQ9vKEGuA4m4aDEMUQlR+nRj
         JY2RA4tg3zTHJ9K9jsBqfHuOHWkslrx8tcINvb88yj0Po1e10y+AmiBjl8JNIEc6yBO3
         kWdAnvp9vC1daZNuPJAP3OuiNN24qWN2N6EWo3kNup77Jixm5DH/ohIC34SJKVew71O3
         rxnvDaLAsTFHhJLQ0eSzu4ki+HHFNmV/HFL5trVdz6fNpd7GA/z2ODhMG3xvw9AkGWra
         KyInUWWNsFeCltOwoPX2z4EEgiAab7eG+jyxqcFfjKcgLhHP9PCSI7qsn+49uAsYtHd4
         OMyw==
X-Gm-Message-State: ACrzQf05mwozNr26H73qayaWF/6KrgvHGJ2S+ZxfyowW2V8mVI4lXVdZ
        WO9qnK59qAi/RFo9GDUSLKkz5eApQf1xbnX6
X-Google-Smtp-Source: AMsMyM7QqZhEfs/RUcCcVdJoHOp5BkSwi2P0A8Q2QpeXl+2hBa8P3QFyj9Rk3w2iKkTSs5MgDCEytA==
X-Received: by 2002:a05:600c:19d2:b0:3b4:a4cb:2416 with SMTP id u18-20020a05600c19d200b003b4a4cb2416mr4294246wmq.6.1665167421470;
        Fri, 07 Oct 2022 11:30:21 -0700 (PDT)
Received: from aczubak.c.googlers.com.com (230.213.79.34.bc.googleusercontent.com. [34.79.213.230])
        by smtp.gmail.com with ESMTPSA id l10-20020a05600012ca00b002258235bda3sm2573627wrx.61.2022.10.07.11.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 11:30:20 -0700 (PDT)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, dmitry.torokhov@gmail.com,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH v4 13/17] Input: introduce EVIOCFF(TAKE|RELEASE)CONTROL
Date:   Fri,  7 Oct 2022 18:29:41 +0000
Message-Id: <20221007182945.1654046-14-acz@semihalf.com>
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

Add new ioctls which can be used for simple haptic force feedback effects.
Once the control is taken over the effect the kernel does not generate it
on its own (EVIOCFFTAKECONTROL).
To revert this action use EVIOCFFRELEASECONTROL.

Signed-off-by: Angela Czubak <acz@semihalf.com>
---
 drivers/input/evdev.c      |  6 +++
 drivers/input/ff-core.c    | 89 +++++++++++++++++++++++++++++++++++++-
 include/linux/input.h      |  5 +++
 include/uapi/linux/input.h |  4 ++
 4 files changed, 103 insertions(+), 1 deletion(-)

diff --git a/drivers/input/evdev.c b/drivers/input/evdev.c
index 95f90699d2b17..6d25eb19e28ec 100644
--- a/drivers/input/evdev.c
+++ b/drivers/input/evdev.c
@@ -1076,6 +1076,12 @@ static long evdev_do_ioctl(struct file *file, unsigned int cmd,
 	case EVIOCRMFF:
 		return input_ff_erase(dev, (int)(unsigned long) p, file);
 
+	case EVIOCFFTAKECONTROL:
+		return input_ff_take_control(dev, (int)(unsigned long) p, file);
+
+	case EVIOCFFRELEASECONTROL:
+		return input_ff_release_control(dev, (int)(unsigned long) p, file);
+
 	case EVIOCGEFFECTS:
 		i = test_bit(EV_FF, dev->evbit) ?
 				dev->ff->max_effects : 0;
diff --git a/drivers/input/ff-core.c b/drivers/input/ff-core.c
index 1a9a5401acb55..d6b76a479fc21 100644
--- a/drivers/input/ff-core.c
+++ b/drivers/input/ff-core.c
@@ -252,6 +252,91 @@ int input_ff_erase(struct input_dev *dev, int effect_id, struct file *file)
 }
 EXPORT_SYMBOL_GPL(input_ff_erase);
 
+/*
+ * Take control over the effect if the requester is also the effect owner.
+ * The mutex should already be locked before calling this function.
+ */
+static int control_effect(struct input_dev *dev, int effect_id,
+			  struct file *file, int take)
+{
+	struct ff_device *ff = dev->ff;
+	int error;
+
+	error = check_effect_access(ff, effect_id, file);
+	if (error) {
+		error = check_effect_shared(ff, effect_id);
+		if (error)
+			return error;
+	}
+
+	if (ff->change_control) {
+		error = ff->change_control(dev, effect_id, file, take);
+		if (error)
+			return error;
+	}
+
+	return 0;
+}
+/**
+ * input_ff_take_control - take control over a force-feedback effect from kernel
+ * @dev: input device to take control over effect from
+ * @effect_id: id of the effect to take control over
+ * @file: purported owner of the request
+ *
+ * This function switches user-controlled mode on for the given force-feedback
+ * effect. The user-mode will persist unitl the last caller releases control.
+ * The effect will only be taken control of if it was uploaded through the same
+ * file handle that is requesting taking control or for simple haptic effects
+ * 0 and 1.
+ * Valid only for simple haptic effects (ff_hid_effect).
+ */
+int input_ff_take_control(struct input_dev *dev, int effect_id,
+			  struct file *file)
+{
+	struct ff_device *ff = dev->ff;
+	int ret;
+
+	if (!test_bit(EV_FF, dev->evbit))
+		return -EINVAL;
+
+	mutex_lock(&ff->mutex);
+	ret = control_effect(dev, effect_id, file, 1);
+	mutex_unlock(&ff->mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(input_ff_take_control);
+
+/**
+ * input_ff_release_control - release control over a force-feedback effect
+ * @dev: input device to release control over effect to
+ * @effect_id: id of the effect to release control
+ * @file: purported owner of the request
+ *
+ * This function switches user-controlled mode off for the given force-feedback
+ * effect. The user-mode will persist unitl the last caller releases control.
+ * The control will be released of if it was uploaded through the same
+ * file handle that is requesting taking control or for simple haptic effects
+ * 0 and 1.
+ * Valid only for simple haptic effects (ff_hid_effect).
+ */
+int input_ff_release_control(struct input_dev *dev, int effect_id,
+			     struct file *file)
+{
+	struct ff_device *ff = dev->ff;
+	int ret;
+
+	if (!test_bit(EV_FF, dev->evbit))
+		return -EINVAL;
+
+	mutex_lock(&ff->mutex);
+	ret = control_effect(dev, effect_id, file, 0);
+	mutex_unlock(&ff->mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(input_ff_release_control);
+
 /*
  * input_ff_flush - erase all effects owned by a file handle
  * @dev: input device to erase effect from
@@ -270,8 +355,10 @@ int input_ff_flush(struct input_dev *dev, struct file *file)
 
 	mutex_lock(&ff->mutex);
 
-	for (i = 0; i < ff->max_effects; i++)
+	for (i = 0; i < ff->max_effects; i++) {
+		control_effect(dev, i, file, 0);
 		erase_effect(dev, i, file);
+	}
 
 	mutex_unlock(&ff->mutex);
 
diff --git a/include/linux/input.h b/include/linux/input.h
index 49790c1bd2c43..39091730c2fca 100644
--- a/include/linux/input.h
+++ b/include/linux/input.h
@@ -521,6 +521,7 @@ extern struct class input_class;
  * @upload: Called to upload an new effect into device
  * @erase: Called to erase an effect from device
  * @playback: Called to request device to start playing specified effect
+ * @change_control: Called to change control over specified effect
  * @set_gain: Called to set specified gain
  * @set_autocenter: Called to auto-center device
  * @destroy: called by input core when parent input device is being
@@ -549,6 +550,8 @@ struct ff_device {
 	int (*erase)(struct input_dev *dev, int effect_id);
 
 	int (*playback)(struct input_dev *dev, int effect_id, int value);
+	int (*change_control)(struct input_dev *dev, int effect_id,
+			      struct file *file, int take);
 	void (*set_gain)(struct input_dev *dev, u16 gain);
 	void (*set_autocenter)(struct input_dev *dev, u16 magnitude);
 
@@ -572,6 +575,8 @@ int input_ff_event(struct input_dev *dev, unsigned int type, unsigned int code,
 
 int input_ff_upload(struct input_dev *dev, struct ff_effect *effect, struct file *file);
 int input_ff_erase(struct input_dev *dev, int effect_id, struct file *file);
+int input_ff_take_control(struct input_dev *dev, int effect_id, struct file *file);
+int input_ff_release_control(struct input_dev *dev, int effect_id, struct file *file);
 int input_ff_flush(struct input_dev *dev, struct file *file);
 
 int input_ff_create_memless(struct input_dev *dev, void *data,
diff --git a/include/uapi/linux/input.h b/include/uapi/linux/input.h
index 3ea7c826c6fb2..a332e7fb2686f 100644
--- a/include/uapi/linux/input.h
+++ b/include/uapi/linux/input.h
@@ -181,6 +181,10 @@ struct input_mask {
 
 #define EVIOCSFF		_IOW('E', 0x80, struct ff_effect)	/* send a force effect to a force feedback device */
 #define EVIOCRMFF		_IOW('E', 0x81, int)			/* Erase a force effect */
+/* Take control over a force effect */
+#define EVIOCFFTAKECONTROL	_IOW('E', 0x82, int)
+/* Release control over a force effect */
+#define EVIOCFFRELEASECONTROL	_IOW('E', 0x83, int)
 #define EVIOCGEFFECTS		_IOR('E', 0x84, int)			/* Report number of effects playable at the same time */
 
 #define EVIOCGRAB		_IOW('E', 0x90, int)			/* Grab/Release device */
-- 
2.38.0.rc1.362.ged0d419d3c-goog

