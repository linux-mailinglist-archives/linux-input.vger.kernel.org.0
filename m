Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2D13525EED
	for <lists+linux-input@lfdr.de>; Fri, 13 May 2022 12:07:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379108AbiEMJkD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 May 2022 05:40:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379119AbiEMJjy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 May 2022 05:39:54 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47FEC2A76AC
        for <linux-input@vger.kernel.org>; Fri, 13 May 2022 02:39:52 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id q23so10666863wra.1
        for <linux-input@vger.kernel.org>; Fri, 13 May 2022 02:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UF0MhXoHWhEuPSuC1UnVX2vTar7MPY0wNts0gUteJyw=;
        b=jcx6vxrqcutHlNhopZSyo6s7t36h8717vALJXtQKB9YqjGK72rqQSTNw5ozQg+8Src
         9BOV9T1rnFU6qLm1364p0E2DDknBpbNjKs6UZSdDS5iQwf3kuEhNlDCpbSqmIHzx21CX
         oXiHOZZL0ud8r3aEBx+RGWIkrsXjbACcf4YW9yk5VGMQGNHBTQg9Kv0zFqt0w8+s55Sh
         zIK1NCyqcO6tgUWPGAePE3E2ua4XLDXm8jRVINxmedBfFVbodyq3hVSD2xdnbO+i3P44
         SvX0E1u72o7ASBDtYyLM8ulhh/hFdcn86UBBGLT1EcGASc02sjozqKdCWQMxHAIW+irJ
         R4Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UF0MhXoHWhEuPSuC1UnVX2vTar7MPY0wNts0gUteJyw=;
        b=nxibnuYngQuaOcdScb/afBPy3a2e/LrapdInsjSVJs5ZRSDXN2nRPXEjFx8OFgJb1w
         Bq0Z6axdV01LAUb1+cFjzyST+scshkkFXxv37lRvknjGjc2h9Ah1zRM3gmjVeqSA5AwF
         wPOmikPxDHrNNh8/NteKQDKl+nVOu5Xd8Ybol52II1ae61JpXw2wJXqLYOs4b2DFWp2y
         jXxD/CvfsxSAFDEou++OW7QOgPi39Yijb55TzBZIUZLaYcRhNFHbiBncjvnfAKoHHAca
         J81invHXi/gU1TtDZsCgHI7r5o1bn3wjKO1uBG+oQ+kC8vBhWMpTtb9/b5wnDXT5hcTP
         TDsw==
X-Gm-Message-State: AOAM531WsUaLEDiy/Y/h/+KHlw95HcxS6/GfedN75zH0qSJJc19hdtJr
        X2ehWrWtfFb7yBdICLAqIjHHqo5k9m0haT2gVhc=
X-Google-Smtp-Source: ABdhPJzsD6qJsXi0BBA2n7uGdOH9sMwvXYOUfHOneMr2nAUiZBK30/YcgL0AJtlgZ88eEqyz8XEPrw==
X-Received: by 2002:a5d:6d0b:0:b0:20c:4ecb:1113 with SMTP id e11-20020a5d6d0b000000b0020c4ecb1113mr3075828wrq.203.1652434791850;
        Fri, 13 May 2022 02:39:51 -0700 (PDT)
Received: from aczubak.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id l5-20020adfa385000000b0020ce015ed48sm1631404wrb.103.2022.05.13.02.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 02:39:51 -0700 (PDT)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, dmitry.torokhov@gmail.com,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH v3 13/17] Input: introduce EVIOCFF(TAKE|RELEASE)CONTROL
Date:   Fri, 13 May 2022 09:39:23 +0000
Message-Id: <20220513093927.1632262-14-acz@semihalf.com>
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
index 1a9a5401acb5..d6b76a479fc2 100644
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
index 49790c1bd2c4..39091730c2fc 100644
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
2.36.0.550.gb090851708-goog

