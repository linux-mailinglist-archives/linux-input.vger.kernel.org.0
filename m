Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95FE647C762
	for <lists+linux-input@lfdr.de>; Tue, 21 Dec 2021 20:17:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241760AbhLUTR6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Dec 2021 14:17:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241757AbhLUTR5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Dec 2021 14:17:57 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39200C06173F
        for <linux-input@vger.kernel.org>; Tue, 21 Dec 2021 11:17:57 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id f134-20020a1c1f8c000000b00345c05bc12dso114726wmf.3
        for <linux-input@vger.kernel.org>; Tue, 21 Dec 2021 11:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tW/z0FhqWRFM5dtt1f2rkVB2ZdOrdJGy+6QhQufc+Cg=;
        b=JDgKOGuJvajszeAkp7BD1mpF5JnxPU8Xi0Emfxgqogfqr5lbFd7M90F630G+3wjbnO
         7HCMjdkWLZng1Tpz4k+zTOFam5/REyvOaUsNzyY1wRIMBKirV3mQtsH5deB3G9NfFEiP
         pr8QTNcGrbOLO11DEeZnK0N8sWTHdng9k+3IutHXPGO+dpIsoRZ7dvcZKbC+dWEpXmwT
         KcKlxu4xoVBdlNj7m4PYO3cNVo+vTi1qEzwl0QNIgpEfBNEMPCJ4WOa+ZWSkWht3w2gt
         WPZisRljawH0dCbnSDM3EWG9Q504Jj20bVwgiYdsJCkOZHUssypQFEe/QtSO8yYVTyaA
         mV/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tW/z0FhqWRFM5dtt1f2rkVB2ZdOrdJGy+6QhQufc+Cg=;
        b=QrHDID9f3voyXq4puouKg3rViKvi+fbqwB+bOYUiek1cSaS4374ISgnDlKMZRAZeAt
         xHPn4N9Q+f+umi7jFcQyywZtTh0uz9Y0zqOqaEbiIHWQQiJWBXGJHorynuVBpMCfdi1l
         zlaYS8x+GJgj7019pknLtKbHqyZ5k+ItThTvS+fnrUgCeqareGA0rHBVwxOEQrJALJgT
         yc8aw8Cat4SNEJj+86IN3tC+bCEZSDXHkhoEl5p2xyqUKhrSnUzZRx+epmR7Lo3uyNJm
         MkxEcvdig6YyBySKiWxYIHJbTzqY7e9fz+FYHSpzRIA46BqxlqKZCszvClErRcLZn31Q
         joRQ==
X-Gm-Message-State: AOAM530DUwfeAgMlYrMVrUSv7tdHKN+wrNCM+Z90KemS/4ae9ZG4jyRK
        ENCjbw0w27SoPr6IHkzOeADW1+GHeC6Dctdme0M=
X-Google-Smtp-Source: ABdhPJyLVcZ3kwCys5F3Ep8NxTBWDGU0WYeJoEDAG2IYqboI6lKamczcwarZ7EFUIKIPIcre79Lifg==
X-Received: by 2002:a05:600c:3b2a:: with SMTP id m42mr3837622wms.4.1640114275372;
        Tue, 21 Dec 2021 11:17:55 -0800 (PST)
Received: from aczubak.c.googlers.com.com (109.36.187.35.bc.googleusercontent.com. [35.187.36.109])
        by smtp.gmail.com with ESMTPSA id t8sm3994846wmq.32.2021.12.21.11.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 11:17:55 -0800 (PST)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, dmitry.torokhov@gmail.com,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH 16/18] Input: introduce EVIOCFF(TAKE|RELEASE)CONTROL
Date:   Tue, 21 Dec 2021 19:17:41 +0000
Message-Id: <20211221191743.1893185-17-acz@semihalf.com>
X-Mailer: git-send-email 2.34.1.307.g9b7440fafd-goog
In-Reply-To: <20211221191743.1893185-1-acz@semihalf.com>
References: <20211221191743.1893185-1-acz@semihalf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
index 95f90699d2b1..6d25eb19e28e 100644
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
index 960ae0e29348..7536274141e7 100644
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
index 0354b298d874..cc432ff6a427 100644
--- a/include/linux/input.h
+++ b/include/linux/input.h
@@ -519,6 +519,7 @@ extern struct class input_class;
  * @upload: Called to upload an new effect into device
  * @erase: Called to erase an effect from device
  * @playback: Called to request device to start playing specified effect
+ * @change_control: Called to change control over specified effect
  * @set_gain: Called to set specified gain
  * @set_autocenter: Called to auto-center device
  * @destroy: called by input core when parent input device is being
@@ -547,6 +548,8 @@ struct ff_device {
 	int (*erase)(struct input_dev *dev, int effect_id);
 
 	int (*playback)(struct input_dev *dev, int effect_id, int value);
+	int (*change_control)(struct input_dev *dev, int effect_id,
+			      struct file *file, int take);
 	void (*set_gain)(struct input_dev *dev, u16 gain);
 	void (*set_autocenter)(struct input_dev *dev, u16 magnitude);
 
@@ -570,6 +573,8 @@ int input_ff_event(struct input_dev *dev, unsigned int type, unsigned int code,
 
 int input_ff_upload(struct input_dev *dev, struct ff_effect *effect, struct file *file);
 int input_ff_erase(struct input_dev *dev, int effect_id, struct file *file);
+int input_ff_take_control(struct input_dev *dev, int effect_id, struct file *file);
+int input_ff_release_control(struct input_dev *dev, int effect_id, struct file *file);
 int input_ff_flush(struct input_dev *dev, struct file *file);
 
 int input_ff_create_memless(struct input_dev *dev, void *data,
diff --git a/include/uapi/linux/input.h b/include/uapi/linux/input.h
index 0d4d426cf75a..12acc3bb73d7 100644
--- a/include/uapi/linux/input.h
+++ b/include/uapi/linux/input.h
@@ -178,6 +178,10 @@ struct input_mask {
 
 #define EVIOCSFF		_IOW('E', 0x80, struct ff_effect)	/* send a force effect to a force feedback device */
 #define EVIOCRMFF		_IOW('E', 0x81, int)			/* Erase a force effect */
+/* Take control over a force effect */
+#define EVIOCFFTAKECONTROL	_IOW('E', 0x82, int)
+/* Release control over a force effect */
+#define EVIOCFFRELEASECONTROL	_IOW('E', 0x83, int)
 #define EVIOCGEFFECTS		_IOR('E', 0x84, int)			/* Report number of effects playable at the same time */
 
 #define EVIOCGRAB		_IOW('E', 0x90, int)			/* Grab/Release device */
-- 
2.34.1.307.g9b7440fafd-goog

