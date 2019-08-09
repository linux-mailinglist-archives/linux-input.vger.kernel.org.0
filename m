Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6664A8815C
	for <lists+linux-input@lfdr.de>; Fri,  9 Aug 2019 19:35:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407188AbfHIRfx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Aug 2019 13:35:53 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:44984 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406967AbfHIRfx (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 9 Aug 2019 13:35:53 -0400
Received: by mail-pg1-f196.google.com with SMTP id i18so46193404pgl.11;
        Fri, 09 Aug 2019 10:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding:user-agent;
        bh=qzYGuZWP3aLdngpqnd3vf+G4H/tLWZqTA1rVf9Nan6g=;
        b=d0j3vxG5n2YA1bw1PUOJZMP5n5WHt3Jt5yAiU1Na9U/Gc3sZrLAwZaZSFsh+xEF9fk
         alwCDlKJ5+9J07MC/31zQSHi8YB4DYkMelixCDscZ8dDgyW0RkDUcIm8j3hYVFdzfJuR
         bjx5BjcYrR0drGFOVj+q+6p1EEt4qIaZVSaMAIv8tN8FMPsaQYZ1DY6hvUWPTDmNE2JC
         +2Pp+4UinrQO75HXkTRvMy6098xo3rK5dnAb6TEVjBeXVANWxsJlB10coAR0LltyK7wW
         uOH7G/Evvi/pehG3z7V6Fab/Vgd2TTN4sGeBcxlTWMpgS1RPCoriFYzq/OcK9hQF88h5
         U0gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding:user-agent;
        bh=qzYGuZWP3aLdngpqnd3vf+G4H/tLWZqTA1rVf9Nan6g=;
        b=RguZIIQ7987e+7Xp4X0cfp2BNa9NCfSdxGeOTE9RoOlGtPPZFk8Qgz9SQulWU7JvR9
         EoMwze4ugqvEfKVUvjE/7ApBBplFABuC37H9ci4qL0jfl4QLKhoQXy7GiiexESY8xtIp
         IrTaw0ZUn+cTYXUbKg7pXn0ayTSn1r0cNyAxsNfXE4NyiFYrJBI+NX7nGJOxilgQcXjK
         rYtwejoXhWNDOwaDrYZK/GKDukxszBLWXFnToQ9U8AV2plObG3DnFoJ0qRzeEy0glp9g
         e02g/vWVK/mgQtL+YNpIhd5+szcb35VEfwYCE2yfp+N01c9R+24yiPLJynqXkeRfPQsL
         tJxA==
X-Gm-Message-State: APjAAAVK5bG9tWK92wCeXBm17n9m7akffSruoRhpC9KaDaW+VVUWGt6r
        wecXK0+MVaL1EpH+CF7FWATxKTfT
X-Google-Smtp-Source: APXvYqxb8YZSdko1/7GpPTsNrbCoHPjzLriSMCXBhQ/R9PTqi8hfuhRiOcJNuJlUV7ybaVGRaR56jQ==
X-Received: by 2002:a62:8343:: with SMTP id h64mr4649688pfe.170.1565372152034;
        Fri, 09 Aug 2019 10:35:52 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id v184sm91395655pgd.34.2019.08.09.10.35.50
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 09 Aug 2019 10:35:51 -0700 (PDT)
Date:   Fri, 9 Aug 2019 10:35:48 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, benjamin.tissoires@redhat.com
Subject: [PATCH] Input: add support for polling to input devices
Message-ID: <20190809173548.GA32693@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Separating "normal" and "polled" input devices was a mistake, as often we
want to allow the very same device work on both interrupt-driven and
polled mode, depending on the board on which the device is used.

This introduces new APIs:

- input_setup_polling
- input_set_poll_interval
- input_set_min_poll_interval
- input_set_max_poll_interval

These new APIs allow switching an input device into polled mode with sysfs
attributes matching drivers using input_polled_dev APIs that will be
eventually removed.

Tested-by: Michal Vokáč <michal.vokac@ysoft.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/Makefile       |   2 +-
 drivers/input/input-poller.c | 208 +++++++++++++++++++++++++++++++++++
 drivers/input/input-poller.h |  18 +++
 drivers/input/input.c        |  36 ++++--
 include/linux/input.h        |  12 ++
 5 files changed, 268 insertions(+), 8 deletions(-)

diff --git a/drivers/input/Makefile b/drivers/input/Makefile
index 40de6a7be641..e35650930371 100644
--- a/drivers/input/Makefile
+++ b/drivers/input/Makefile
@@ -6,7 +6,7 @@
 # Each configuration option enables a list of files.
 
 obj-$(CONFIG_INPUT)		+= input-core.o
-input-core-y := input.o input-compat.o input-mt.o ff-core.o
+input-core-y := input.o input-compat.o input-mt.o input-poller.o ff-core.o
 
 obj-$(CONFIG_INPUT_FF_MEMLESS)	+= ff-memless.o
 obj-$(CONFIG_INPUT_POLLDEV)	+= input-polldev.o
diff --git a/drivers/input/input-poller.c b/drivers/input/input-poller.c
new file mode 100644
index 000000000000..e041adb04f5a
--- /dev/null
+++ b/drivers/input/input-poller.c
@@ -0,0 +1,208 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Support for polling mode for input devices.
+ */
+
+#include <linux/device.h>
+#include <linux/input.h>
+#include <linux/jiffies.h>
+#include <linux/mutex.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+#include <linux/workqueue.h>
+#include "input-poller.h"
+
+struct input_dev_poller {
+	void (*poll)(struct input_dev *dev);
+
+	unsigned int poll_interval; /* msec */
+	unsigned int poll_interval_max; /* msec */
+	unsigned int poll_interval_min; /* msec */
+
+	struct input_dev *input;
+	struct delayed_work work;
+};
+
+static void input_dev_poller_queue_work(struct input_dev_poller *poller)
+{
+	unsigned long delay;
+
+	delay = msecs_to_jiffies(poller->poll_interval);
+	if (delay >= HZ)
+		delay = round_jiffies_relative(delay);
+
+	queue_delayed_work(system_freezable_wq, &poller->work, delay);
+}
+
+static void input_dev_poller_work(struct work_struct *work)
+{
+	struct input_dev_poller *poller =
+		container_of(work, struct input_dev_poller, work.work);
+
+	poller->poll(poller->input);
+	input_dev_poller_queue_work(poller);
+}
+
+void input_dev_poller_finalize(struct input_dev_poller *poller)
+{
+	if (!poller->poll_interval)
+		poller->poll_interval = 500;
+	if (!poller->poll_interval_max)
+		poller->poll_interval_max = poller->poll_interval;
+}
+
+void input_dev_poller_start(struct input_dev_poller *poller)
+{
+	/* Only start polling if polling is enabled */
+	if (poller->poll_interval > 0) {
+		poller->poll(poller->input);
+		input_dev_poller_queue_work(poller);
+	}
+}
+
+void input_dev_poller_stop(struct input_dev_poller *poller)
+{
+	cancel_delayed_work_sync(&poller->work);
+}
+
+int input_setup_polling(struct input_dev *dev,
+			void (*poll_fn)(struct input_dev *dev))
+{
+	struct input_dev_poller *poller;
+
+	poller = kzalloc(sizeof(*poller), GFP_KERNEL);
+	if (!poller) {
+		dev_err(dev->dev.parent ?: &dev->dev,
+			"%s: unable to allocate poller structure\n", __func__);
+		return -ENOMEM;
+	}
+
+	INIT_DELAYED_WORK(&poller->work, input_dev_poller_work);
+	poller->input = dev;
+	poller->poll = poll_fn;
+
+	dev->poller = poller;
+	return 0;
+}
+EXPORT_SYMBOL(input_setup_polling);
+
+static bool input_dev_ensure_poller(struct input_dev *dev)
+{
+	if (!dev->poller) {
+		dev_err(dev->dev.parent ?: &dev->dev,
+			"poller structure has not been set up\n");
+		return false;
+	}
+
+	return true;
+}
+
+void input_set_poll_interval(struct input_dev *dev, unsigned int interval)
+{
+	if (input_dev_ensure_poller(dev))
+		dev->poller->poll_interval = interval;
+}
+EXPORT_SYMBOL(input_set_poll_interval);
+
+void input_set_min_poll_interval(struct input_dev *dev, unsigned int interval)
+{
+	if (input_dev_ensure_poller(dev))
+		dev->poller->poll_interval_min = interval;
+}
+EXPORT_SYMBOL(input_set_min_poll_interval);
+
+void input_set_max_poll_interval(struct input_dev *dev, unsigned int interval)
+{
+	if (input_dev_ensure_poller(dev))
+		dev->poller->poll_interval_max = interval;
+}
+EXPORT_SYMBOL(input_set_max_poll_interval);
+
+/* SYSFS interface */
+
+static ssize_t input_dev_get_poll_interval(struct device *dev,
+					   struct device_attribute *attr,
+					   char *buf)
+{
+	struct input_dev *input = to_input_dev(dev);
+
+	return sprintf(buf, "%d\n", input->poller->poll_interval);
+}
+
+static ssize_t input_dev_set_poll_interval(struct device *dev,
+					   struct device_attribute *attr,
+					   const char *buf, size_t count)
+{
+	struct input_dev *input = to_input_dev(dev);
+	struct input_dev_poller *poller = input->poller;
+	unsigned int interval;
+	int err;
+
+	err = kstrtouint(buf, 0, &interval);
+	if (err)
+		return err;
+
+	if (interval < poller->poll_interval_min)
+		return -EINVAL;
+
+	if (interval > poller->poll_interval_max)
+		return -EINVAL;
+
+	mutex_lock(&input->mutex);
+
+	poller->poll_interval = interval;
+
+	if (input->users) {
+		cancel_delayed_work_sync(&poller->work);
+		if (poller->poll_interval > 0)
+			input_dev_poller_queue_work(poller);
+	}
+
+	mutex_unlock(&input->mutex);
+
+	return count;
+}
+
+static DEVICE_ATTR(poll, S_IRUGO | S_IWUSR,
+		   input_dev_get_poll_interval, input_dev_set_poll_interval);
+
+static ssize_t input_dev_get_poll_max(struct device *dev,
+				      struct device_attribute *attr, char *buf)
+{
+	struct input_dev *input = to_input_dev(dev);
+
+	return sprintf(buf, "%d\n", input->poller->poll_interval_max);
+}
+
+static DEVICE_ATTR(max, S_IRUGO, input_dev_get_poll_max, NULL);
+
+static ssize_t input_dev_get_poll_min(struct device *dev,
+				     struct device_attribute *attr, char *buf)
+{
+	struct input_dev *input = to_input_dev(dev);
+
+	return sprintf(buf, "%d\n", input->poller->poll_interval_min);
+}
+
+static DEVICE_ATTR(min, S_IRUGO, input_dev_get_poll_min, NULL);
+
+static umode_t input_poller_attrs_visible(struct kobject *kobj,
+					  struct attribute *attr, int n)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct input_dev *input = to_input_dev(dev);
+
+	return input->poller ? attr->mode : 0;
+}
+
+static struct attribute *input_poller_attrs[] = {
+	&dev_attr_poll.attr,
+	&dev_attr_max.attr,
+	&dev_attr_min.attr,
+	NULL
+};
+
+struct attribute_group input_poller_attribute_group = {
+	.is_visible	= input_poller_attrs_visible,
+	.attrs		= input_poller_attrs,
+};
diff --git a/drivers/input/input-poller.h b/drivers/input/input-poller.h
new file mode 100644
index 000000000000..e3fca0be1d32
--- /dev/null
+++ b/drivers/input/input-poller.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _INPUT_POLLER_H
+#define _INPUT_POLLER_H
+
+/*
+ * Support for polling mode for input devices.
+ */
+#include <linux/sysfs.h>
+
+struct input_dev_poller;
+
+void input_dev_poller_finalize(struct input_dev_poller *poller);
+void input_dev_poller_start(struct input_dev_poller *poller);
+void input_dev_poller_stop(struct input_dev_poller *poller);
+
+extern struct attribute_group input_poller_attribute_group;
+
+#endif /* _INPUT_POLLER_H */
diff --git a/drivers/input/input.c b/drivers/input/input.c
index 7494a0dede79..c08aa3596144 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -24,6 +24,7 @@
 #include <linux/mutex.h>
 #include <linux/rcupdate.h>
 #include "input-compat.h"
+#include "input-poller.h"
 
 MODULE_AUTHOR("Vojtech Pavlik <vojtech@suse.cz>");
 MODULE_DESCRIPTION("Input core");
@@ -603,20 +604,31 @@ int input_open_device(struct input_handle *handle)
 
 	handle->open++;
 
-	if (!dev->users++ && dev->open)
-		retval = dev->open(dev);
+	if (dev->users++) {
+		/*
+		 * Device is already opened, so we can exit immediately and
+		 * report success.
+		 */
+		goto out;
+	}
 
-	if (retval) {
-		dev->users--;
-		if (!--handle->open) {
+	if (dev->open) {
+		retval = dev->open(dev);
+		if (retval) {
+			dev->users--;
+			handle->open--;
 			/*
 			 * Make sure we are not delivering any more events
 			 * through this handle
 			 */
 			synchronize_rcu();
+			goto out;
 		}
 	}
 
+	if (dev->poller)
+		input_dev_poller_start(dev->poller);
+
  out:
 	mutex_unlock(&dev->mutex);
 	return retval;
@@ -655,8 +667,13 @@ void input_close_device(struct input_handle *handle)
 
 	__input_release_device(handle);
 
-	if (!--dev->users && dev->close)
-		dev->close(dev);
+	if (!--dev->users) {
+		if (dev->poller)
+			input_dev_poller_stop(dev->poller);
+
+		if (dev->close)
+			dev->close(dev);
+	}
 
 	if (!--handle->open) {
 		/*
@@ -1502,6 +1519,7 @@ static const struct attribute_group *input_dev_attr_groups[] = {
 	&input_dev_attr_group,
 	&input_dev_id_attr_group,
 	&input_dev_caps_attr_group,
+	&input_poller_attribute_group,
 	NULL
 };
 
@@ -1511,6 +1529,7 @@ static void input_dev_release(struct device *device)
 
 	input_ff_destroy(dev);
 	input_mt_destroy_slots(dev);
+	kfree(dev->poller);
 	kfree(dev->absinfo);
 	kfree(dev->vals);
 	kfree(dev);
@@ -2175,6 +2194,9 @@ int input_register_device(struct input_dev *dev)
 	if (!dev->setkeycode)
 		dev->setkeycode = input_default_setkeycode;
 
+	if (dev->poller)
+		input_dev_poller_finalize(dev->poller);
+
 	error = device_add(&dev->dev);
 	if (error)
 		goto err_free_vals;
diff --git a/include/linux/input.h b/include/linux/input.h
index e95a439d8bd5..94f277cd806a 100644
--- a/include/linux/input.h
+++ b/include/linux/input.h
@@ -21,6 +21,8 @@
 #include <linux/timer.h>
 #include <linux/mod_devicetable.h>
 
+struct input_dev_poller;
+
 /**
  * struct input_value - input value representation
  * @type: type of value (EV_KEY, EV_ABS, etc)
@@ -71,6 +73,8 @@ enum input_clock_type {
  *	not sleep
  * @ff: force feedback structure associated with the device if device
  *	supports force feedback effects
+ * @poller: poller structure associated with the device if device is
+ *	set up to use polling mode
  * @repeat_key: stores key code of the last key pressed; used to implement
  *	software autorepeat
  * @timer: timer for software autorepeat
@@ -156,6 +160,8 @@ struct input_dev {
 
 	struct ff_device *ff;
 
+	struct input_dev_poller *poller;
+
 	unsigned int repeat_key;
 	struct timer_list timer;
 
@@ -372,6 +378,12 @@ void input_unregister_device(struct input_dev *);
 
 void input_reset_device(struct input_dev *);
 
+int input_setup_polling(struct input_dev *dev,
+			void (*poll_fn)(struct input_dev *dev));
+void input_set_poll_interval(struct input_dev *dev, unsigned int interval);
+void input_set_min_poll_interval(struct input_dev *dev, unsigned int interval);
+void input_set_max_poll_interval(struct input_dev *dev, unsigned int interval);
+
 int __must_check input_register_handler(struct input_handler *);
 void input_unregister_handler(struct input_handler *);
 
-- 
2.23.0.rc1.153.gdeed80330f-goog


-- 
Dmitry
