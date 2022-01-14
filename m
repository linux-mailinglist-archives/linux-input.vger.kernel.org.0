Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF44C48EFF8
	for <lists+linux-input@lfdr.de>; Fri, 14 Jan 2022 19:32:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243123AbiANScp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Jan 2022 13:32:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243050AbiANSch (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Jan 2022 13:32:37 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52619C06173F
        for <linux-input@vger.kernel.org>; Fri, 14 Jan 2022 10:32:37 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id l4so7657402wmq.3
        for <linux-input@vger.kernel.org>; Fri, 14 Jan 2022 10:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=76JfNjVFSUsVS8oWMOx2DCBRy/YQ+e0AT9T0ErYf4Kc=;
        b=dsccLJPiAHFgpSQ7rbkaDWEVbAhP0uBfDlvIKVPpAWVfPAHYRS6N43mCh8L0nj0MmE
         iBrw5MKTIdSyx6FCVd1gghLfeBnCK2Z4i0DmVLchRHEjLUgfshGOZOx4oqmKmNvE+CoE
         y6BLe29JRE5bKMcpANRXa3AXJR677KSCSb8QCjMSz7gt3ryVihVDuYP7Lu23hsUbHgMc
         BxJ/Z1KVEb8DIv0MBRD87HCIDxqm5Zol3uwPW5Tn15LVc4b/SF/XpNXwkiUpK+AciAES
         upZ3LHodC6paSCWrzZhcBXBJVU0mA9VbO68TwrQi4zU0/SQZ+CdTcJDPuLDZY4K0hjdI
         KyeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=76JfNjVFSUsVS8oWMOx2DCBRy/YQ+e0AT9T0ErYf4Kc=;
        b=XE869Boxc+tbHDr+OE9kAyuldsfJymgYwcZEN5/5sJaW/Il1ITBRuoMdt4b/vnfkRp
         8ez9ZM4QCHS93z9UqerWIOiZt753siwl/d2g+kPQF3MW6ecOurRqutXwOdSUEXGTk9GO
         rIGictJn+AgLIgrEvPJJuLZHfHFG1MzZxd+fYwsLfL0atljeXROgjWEIgwvkMU9o4jhj
         M00KeBsdH/BuHq86zbnBZxpJ1tllXr4aiwLlCh3pJfJANe0O1NoNiWqOdEV7Vhd7H15g
         JE+1Unfj/fM65op/m5MOOPCCRxQ9T7kF2/3PicxuREIsL7Zcaf8HxFwfYS8OlKXdcfVC
         lPkQ==
X-Gm-Message-State: AOAM531jFhh9PUXykIG+tVvhR1YZpnRbSpX2ynL+55C6aAc+A/HHtuYT
        D6TTnruvuFa0WuQpB+qwVX3X/xwA66CTvnW8CU8=
X-Google-Smtp-Source: ABdhPJzMDovZr3wd1DuxsR6OlMLA/T6IiYrrcIJ4h9wjNNYMbDaGFyBKVHAaDyBFszSk3DAN2bozoA==
X-Received: by 2002:a5d:584f:: with SMTP id i15mr9298235wrf.361.1642185155879;
        Fri, 14 Jan 2022 10:32:35 -0800 (PST)
Received: from aczubak.c.googlers.com.com (109.36.187.35.bc.googleusercontent.com. [35.187.36.109])
        by smtp.gmail.com with ESMTPSA id az4sm6410984wrb.14.2022.01.14.10.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 10:32:35 -0800 (PST)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, dmitry.torokhov@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH v2 14/16] Input: introduce EVIOCFF(TAKE|RELEASE)CONTROL
Date:   Fri, 14 Jan 2022 18:31:50 +0000
Message-Id: <20220114183152.1691659-15-acz@semihalf.com>
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
In-Reply-To: <20220114183152.1691659-1-acz@semihalf.com>
References: <20220114183152.1691659-1-acz@semihalf.com>
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
index ccf43a21d43d..cce37336ab38 100644
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
2.34.1.703.g22d0c6ccf7-goog

