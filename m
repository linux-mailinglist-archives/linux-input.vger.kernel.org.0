Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0829F74978
	for <lists+linux-input@lfdr.de>; Thu, 25 Jul 2019 10:58:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390005AbfGYI6B (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Jul 2019 04:58:01 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:44185 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390002AbfGYI6B (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Jul 2019 04:58:01 -0400
Received: by mail-lj1-f195.google.com with SMTP id k18so47217147ljc.11;
        Thu, 25 Jul 2019 01:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=1AIYe6p0nsX+/ehumSUF37CVRdOKp0dyrw5q/zhtK3A=;
        b=Mci4zsMO/6ZmtqDTPZMZJON//WfLt9IWR2h4TJzJ2n7xphxqlvG9fP9f0TOfCpvn5A
         jGEVDwwindwVzrkEVp7F840lnJ2RWKijKOdfbtfS0pGUiURtDI0wgFNfpb+nq+TFhj0y
         gfW27OrlSlcnDl4vNq9xPRggCVYwcYd8BMpImaQsWoCi4PodXJFpyzElBnstUVwFLgWk
         RVRw8VPdG/CUyUawX02i7nBL41jZou1cfBMq9togI4MmbR1Tkb2lk1XFu40nHpY9gep/
         hJjCAG6M/tq1kv4vVLG9o03d549igQmOOLIlvGWUPMftJ0ZKdZa+fB1gQvqQg3io4cu+
         /t3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=1AIYe6p0nsX+/ehumSUF37CVRdOKp0dyrw5q/zhtK3A=;
        b=ZkkPE1Ryhw5liPdi42oGRpAcD53DQRAwM7uH8I62rorvPND44FbXT4k+JT0tHuWtSm
         xjcKcKL13Fju92E1ioxOy1TcChspfYbcYDrGTleRMdLHASVSYEg5dLRdX4CPJyihRGpo
         I0KC4cvI69YJZg06rL6j6jhEV07JTUWCki8gKLZ0DrENPiLTrp14+2rbklEzHlz6tv7g
         MWc8kJejyaibppm9Jl4gkflDsG3Shcfnfrisl320dugGqu3NPb9Gome78D1ogrBQcL8Q
         23lqDCx4CYfiJHRYMEbO+I7S4C8IKZYE749tFlCk3ntYPe7tRn+sjd8+mzFUnvb8Vugm
         IKbQ==
X-Gm-Message-State: APjAAAUNvGt20ZAZ3vzC9FECw1pXySsdtStuJZW5fCBYfoXnglBAGWz9
        CmoMXdQJQ6cLk1H3RwoLopk=
X-Google-Smtp-Source: APXvYqxli5DlWXz6VE0gKltDve2jEnTYK9okZ8zEZfz7q0H2Ctmc2A2DWID2+e8Jshq5qmcCDQvUSg==
X-Received: by 2002:a2e:9950:: with SMTP id r16mr28192969ljj.173.1564045077975;
        Thu, 25 Jul 2019 01:57:57 -0700 (PDT)
Received: from localhost ([188.170.223.67])
        by smtp.gmail.com with ESMTPSA id t23sm8959230ljd.98.2019.07.25.01.57.56
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jul 2019 01:57:57 -0700 (PDT)
Date:   Thu, 25 Jul 2019 11:57:53 +0300
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [RFC PATCH v2 0/4] Input: mpr121-polled: Add polled driver for
 MPR121
Message-ID: <20190725085753.GA26665@penguin>
References: <1558098773-47416-1-git-send-email-michal.vokac@ysoft.com>
 <20190521053705.GI183429@dtor-ws>
 <ef172b24-cd27-5bb0-d8b1-718f835d0647@ysoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ef172b24-cd27-5bb0-d8b1-718f835d0647@ysoft.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Michal,

On Tue, May 21, 2019 at 08:51:17AM +0200, Michal Vokáč wrote:
> On 21. 05. 19 7:37, Dmitry Torokhov wrote:
> > Hi Michal,
> > 
> > On Fri, May 17, 2019 at 03:12:49PM +0200, Michal Vokáč wrote:
> > > Hi,
> > > 
> > > I have to deal with a situation where we have a custom i.MX6 based
> > > platform in production that uses the MPR121 touchkey controller.
> > > Unfortunately the chip is connected using only the I2C interface.
> > > The interrupt line is not used. Back in 2015 (Linux v3.14), my
> > > colleague modded the existing mpr121_touchkey.c driver to use polling
> > > instead of interrupt.
> > > 
> > > For quite some time yet I am in a process of updating the product from
> > > the ancient Freescale v3.14 kernel to the latest mainline and pushing
> > > any needed changes upstream. The DT files for our imx6dl-yapp4 platform
> > > already made it into v5.1-rc.
> > > 
> > > I rebased and updated our mpr121 patch to the latest mainline.
> > > It is created as a separate driver, similarly to gpio_keys_polled.
> > > 
> > > The I2C device is quite susceptible to ESD. An ESD test quite often
> > > causes reset of the chip or some register randomly changes its value.
> > > The [PATCH 3/4] adds a write-through register cache. With the cache
> > > this state can be detected and the device can be re-initialied.
> > > 
> > > The main question is: Is there any chance that such a polled driver
> > > could be accepted? Is it correct to implement it as a separate driver
> > > or should it be done as an option in the existing driver? I can not
> > > really imagine how I would do that though..
> > > 
> > > There are also certain worries that the MPR121 chip may no longer be
> > > available in nonspecifically distant future. In case of EOL I will need
> > > to add a polled driver for an other touchkey chip. May it be already
> > > in mainline or a completely new one.
> > 
> > I think that my addition of input_polled_dev was ultimately a wrong
> > thing to do. I am looking into enabling polling mode for regular input
> > devices as we then can enable polling mode in existing drivers.
> 
> OK, that sounds good. Especially when one needs to switch from one chip
> to another that is already in tree, the need for a whole new polling
> driver is eliminated.

Could you please try the patch below and see if it works for your use
case? Note that I have not tried running it, but it compiles so it must
be good ;)

Thanks!

Input: add support for polling to input devices

From: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Separating "normal" and "polled" input devices was a mistake, as often we want
to allow the very same device work on both interrupt-driven and polled mode,
depending on the board on which the device is used.

This introduces new APIs:

- input_setup_polling
- input_set_poll_interval
- input_set_min_poll_interval
- input_set_max_poll_interval

These new APIs allow switching an input device into polled mode with sysfs
attributes matching drivers using input_polled_dev APIs that will be eventually
removed.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/Makefile       |    2 
 drivers/input/input-poller.c |  207 ++++++++++++++++++++++++++++++++++++++++++
 drivers/input/input.c        |   36 ++++++-
 include/linux/input.h        |   10 ++
 4 files changed, 247 insertions(+), 8 deletions(-)
 create mode 100644 drivers/input/input-poller.c

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
index 000000000000..008d6f362d60
--- /dev/null
+++ b/drivers/input/input-poller.c
@@ -0,0 +1,207 @@
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
diff --git a/drivers/input/input.c b/drivers/input/input.c
index 7f3c5fcb9ed6..6b87c07d5981 100644
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
@@ -2135,6 +2154,9 @@ int input_register_device(struct input_dev *dev)
 	if (!dev->setkeycode)
 		dev->setkeycode = input_default_setkeycode;
 
+	if (dev->poller)
+		input_dev_poller_finalize(dev->poller);
+
 	error = device_add(&dev->dev);
 	if (error)
 		goto err_free_vals;
diff --git a/include/linux/input.h b/include/linux/input.h
index 510e78558c10..956f32be87cc 100644
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
@@ -147,6 +149,8 @@ struct input_dev {
 
 	struct ff_device *ff;
 
+	struct input_dev_poller *poller;
+
 	unsigned int repeat_key;
 	struct timer_list timer;
 
@@ -361,6 +365,12 @@ void input_unregister_device(struct input_dev *);
 
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
Dmitry
