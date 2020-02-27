Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDEAB170EE6
	for <lists+linux-input@lfdr.de>; Thu, 27 Feb 2020 04:17:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728253AbgB0DRm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Feb 2020 22:17:42 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:33071 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728222AbgB0DRl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Feb 2020 22:17:41 -0500
Received: by mail-pj1-f66.google.com with SMTP id m7so2743703pjs.0;
        Wed, 26 Feb 2020 19:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=0fvSROfuM3Jh1x9kJRhvveywqU/SEKnk8aOG5nQEzPI=;
        b=c0G9n0f2Pamh/e3kBS9Tw0tKrfjhz0+CqMhExzJXad96Wb87oNBZKtrQ1NNT5Jgdc8
         0I0d/oWlPasw3814y39NGROt+eB4xieGinCv4ThUVczw07OtZ922nlPOM2dvhgeYHR39
         sg3h7NnH4BBBpQ/2YSLAR/az3Dd32XjHvIuBOGXXNN6rviUoSMNnZOWEsgxZgqGc42vQ
         tBBuo5sBfnQZZkt7Cz5cECdj96GTcOFUkE7fsrz5m4NAAwkQ5RY36uDQItRiSjbqgXFa
         BXWwsa8/ZPi+dmOpFOayETZI7x7ZlpJRUIo6/q8OmRYz/0VQSAA293GQs5KNZ3hDcgrf
         SvIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=0fvSROfuM3Jh1x9kJRhvveywqU/SEKnk8aOG5nQEzPI=;
        b=oRpe57EEaq+DRhTOazam+d3/VsiMhoIBJXICbmC3Ug1VWLUg7awqhjlNyupRkNFHK+
         Xz89ypBjy+AdRpjPXlH03oM0Y+izDfwde5P5+6oh68BMmmjT0ubodFBZ1kK8p7TEbS+L
         UO05rD9OCveeSUwhRiR0TuS6drg96WupUw3jA9ey+CUl7Ne0/OCpbbAFqE1NhKiCbKQo
         8PaAPm2BSIHWuiTJ2hkRHgXcMd/Tt+0sXQj3YXn+Wj+/4e7v+FWEpT5fFegnA1i+gPwO
         hm9/SPOWz2xcl0N/lZ4pymVojrGsiyWZdAgt4xdPUG9dw2ycr2lDghovJCtwbUdGsIPP
         sSGg==
X-Gm-Message-State: APjAAAU2UBTaKmqXavexfcLLjfa9iDcyJBqxxZD1TlmZFh4Ne/TbzBOk
        Y18Et/JXKWFmf6gsoh8PUFllA3b1Akc=
X-Google-Smtp-Source: APXvYqw6EgWiKo3U0mjizSU9JsCVG0qZljlvGsq3qqvfkvJyBLLxi+/Y+ymrCAEWSFJJHprNesgYiw==
X-Received: by 2002:a17:902:708c:: with SMTP id z12mr2588611plk.0.1582773457794;
        Wed, 26 Feb 2020 19:17:37 -0800 (PST)
Received: from FWA-T011.advantech.corp (61-219-255-70.HINET-IP.hinet.net. [61.219.255.70])
        by smtp.googlemail.com with ESMTPSA id c2sm463665pjo.28.2020.02.26.19.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 19:17:36 -0800 (PST)
From:   ycho1399@gmail.com
X-Google-Original-From: Andrea.Ho@advantech.com.tw
To:     linux-input@vger.kernel.org
Cc:     voyandrea@gmail.com, andrea.ho@advantech.com.tw,
        oakley.ding@advantech.com.tw,
        "Andrea.Ho" <Andrea.Ho@advantech.com.tw>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Luca Weiss <luca@z3ntu.xyz>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Pavel Machek <pavel@ucw.cz>, linux-kernel@vger.kernel.org
Subject: [V1,1/1] Input/misc: add support for Advantech software defined button
Date:   Thu, 27 Feb 2020 03:15:31 +0000
Message-Id: <20200227031721.17703-1-Andrea.Ho@advantech.com.tw>
X-Mailer: git-send-email 2.17.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: "Andrea.Ho" <Andrea.Ho@advantech.com.tw>

Advantech sw_button is a ACPI event trigger button.

With this driver, we can report KEY_EVENTs on the
Advantech Tabletop Network Appliances products and it has been
tested in FWA1112VC.

Add the software define button support to report KEY_EVENTs by
different acts of pressing button (like double-click, long pressed
and tick) that cloud be get on user interface and trigger the
customized actions.

Signed-off-by: Andrea.Ho <Andrea.Ho@advantech.com.tw>
---
 ...define.patch.EXPERIMENTAL-checkpatch-fixes | 554 ++++++++++++++++++
 MAINTAINERS                                   |   5 +
 drivers/input/misc/Kconfig                    |  11 +
 drivers/input/misc/Makefile                   |   2 +-
 drivers/input/misc/adv_swbutton.c             | 473 +++++++++++++++
 5 files changed, 1044 insertions(+), 1 deletion(-)
 create mode 100644 0001-Input-misc-add-support-for-Advantech-software-define.patch.EXPERIMENTAL-checkpatch-fixes
 create mode 100644 drivers/input/misc/adv_swbutton.c

diff --git a/0001-Input-misc-add-support-for-Advantech-software-define.patch.EXPERIMENTAL-checkpatch-fixes b/0001-Input-misc-add-support-for-Advantech-software-define.patch.EXPERIMENTAL-checkpatch-fixes
new file mode 100644
index 000000000000..45e49aee5b47
--- /dev/null
+++ b/0001-Input-misc-add-support-for-Advantech-software-define.patch.EXPERIMENTAL-checkpatch-fixes
@@ -0,0 +1,553 @@
+From b5375ec981bf5b434731ac59fa1471dce79cce26 Mon Sep 17 00:00:00 2001
+From: "Andrea.Ho" <Andrea.Ho@advantech.com.tw>
+Date: Tue, 25 Feb 2020 03:52:38 +0000
+Subject: [V1,1/1] Input/misc: add support for Advantech software defined
+ button
+
+Advantech sw_button is a ACPI event trigger button.
+
+With this driver, we can report KEY_EVENTs on the
+Advantech Tabletop Network Appliances products and it has been
+tested in FWA1112VC.
+
+Add the software define button support to report KEY_EVENTs by
+different acts of pressing button (like double-click, long pressed
+and tick) that cloud be get on user interface and trigger the
+customized actions.
+
+Signed-off-by: Andrea.Ho <Andrea.Ho@advantech.com.tw>
+---
+ MAINTAINERS                       |   5 +
+ drivers/input/misc/Kconfig        |  11 +
+ drivers/input/misc/Makefile       |   2 +-
+ drivers/input/misc/adv_swbutton.c | 473 ++++++++++++++++++++++++++++++
+ 4 files changed, 490 insertions(+), 1 deletion(-)
+ create mode 100644 drivers/input/misc/adv_swbutton.c
+
+diff --git a/MAINTAINERS b/MAINTAINERS
+index 8982c6e013b3..d68db02fa280 100644
+--- a/MAINTAINERS
++++ b/MAINTAINERS
+@@ -543,6 +543,11 @@ S:	Maintained
+ F:	Documentation/scsi/advansys.txt
+ F:	drivers/scsi/advansys.c
+
++ADVANTECH SWBTN DRIVER
++M:	Andrea Ho <Andrea.Ho@advantech.com.tw>
++S:	Maintained
++F:	drivers/input/misc/adv_swbutton.c
++
+ ADXL34X THREE-AXIS DIGITAL ACCELEROMETER DRIVER (ADXL345/ADXL346)
+ M:	Michael Hennerich <michael.hennerich@analog.com>
+ W:	http://wiki.analog.com/ADXL345
+diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
+index 7e2e658d551c..3c9350bdd7ae 100644
+--- a/drivers/input/misc/Kconfig
++++ b/drivers/input/misc/Kconfig
+@@ -879,4 +879,15 @@ config INPUT_STPMIC1_ONKEY
+	  To compile this driver as a module, choose M here: the
+	  module will be called stpmic1_onkey.
+
++config INPUT_ADV_SWBUTTON
++        tristate "Advantech ACPI Software button Driver"
++        depends on X86 && ACPI
++        help
++          Say Y here to enable support for Advantech software defined
++          button feature. More information can be fount at
++          <http://www.advantech.com.tw/products/>
++
++          To compile this driver as a module, choose M here. The module will
++          be called adv_swbutton.
++
+ endif
+diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
+index 8fd187f314bd..a5ceb98f18f6 100644
+--- a/drivers/input/misc/Makefile
++++ b/drivers/input/misc/Makefile
+@@ -85,4 +85,4 @@ obj-$(CONFIG_INPUT_WM831X_ON)		+= wm831x-on.o
+ obj-$(CONFIG_INPUT_XEN_KBDDEV_FRONTEND)	+= xen-kbdfront.o
+ obj-$(CONFIG_INPUT_YEALINK)		+= yealink.o
+ obj-$(CONFIG_INPUT_IDEAPAD_SLIDEBAR)	+= ideapad_slidebar.o
+-
++obj-$(CONFIG_INPUT_ADV_SWBUTTON)    += adv_swbutton.o
+diff --git a/drivers/input/misc/adv_swbutton.c b/drivers/input/misc/adv_swbutton.c
+new file mode 100644
+index 000000000000..7e4db67780dc
+--- /dev/null
++++ b/drivers/input/misc/adv_swbutton.c
+@@ -0,0 +1,473 @@
++// SPDX-License-Identifier: GPL-2.0-or-later
++/*
++ *  adv_swbutton.c - Software Button Interface Driver.
++ *
++ *  (C) Copyright 2020 Advantech Corporation, Inc
++ *
++ *  Based on soc_button_array.c:
++ *
++ *  {C} Copyright 2014 Intel Corporation
++ *
++ *  This program is free software; you can redistribute it and/or modify
++ *  it under the terms of the GNU General Public License as published by
++ *  the Free Software Foundation; either version 2 of the License, or
++ *  (at your option) any later version.
++ *
++ *  This program is distributed in the hope that it will be useful,
++ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
++ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ *  GNU General Public License for more details.
++ *
++ */
++#include <linux/kernel.h>
++#include <linux/module.h>
++#include <linux/init.h>
++#include <linux/version.h>
++#include <linux/types.h>
++#include <linux/proc_fs.h>
++#include <linux/seq_file.h>
++#include <linux/input.h>
++#include <linux/slab.h>
++#include <linux/acpi.h>
++#include <linux/ktime.h>
++#include <linux/moduleparam.h>
++#include <acpi/button.h>
++#include <acpi/acpi_bus.h>
++#include <acpi/acpi_drivers.h>
++
++#define PREFIX "[AHC] ACPI: "
++#define DRIVER_VERSION "v1.0.0"
++
++#define ACPI_BUTTON_CLASS                   "button"
++#define ACPI_BUTTON_FILE_INFO               "info"
++#define ACPI_BUTTON_FILE_STATE              "state"
++#define ACPI_BUTTON_TYPE_UNKNOWN            0x00
++
++#define ACPI_BUTTON_SUBCLASS_SOFTWARE       "software"
++#define ACPI_BUTTON_HID_SWBTN               "AHC0310"
++#define ACPI_BUTTON_DEVICE_NAME_SOFTWARE    "Software Button"
++#define ACPI_BUTTON_TYPE_SOFTWARE           0x07
++
++#define ACPI_BUTTON_NOTIFY_SWBTN_RELEASE    0x86
++#define ACPI_BUTTON_NOTIFY_SWBTN_PRESSED    0x85
++
++#define SWBTN_DOUBLE_TRIGGER_DELAY          130
++#define SWBTN_TRIGGER_DELAY                 350
++#define SWBTN_MAX_PKEYS                     8
++#define SWBTN_DEF_PKEYS                     2
++
++#define _COMPONENT                          ACPI_BUTTON_COMPONENT
++
++ACPI_MODULE_NAME("swbutton");
++
++MODULE_VERSION(DRIVER_VERSION);
++MODULE_AUTHOR("Andrea Ho");
++MODULE_DESCRIPTION("Advantech ACPI SW Button Driver");
++MODULE_LICENSE("GPL");
++
++/* Defined keycodes */
++static short swbtn_keycodes[]  = {
++	BTN_TRIGGER_HAPPY2, /* double click */
++	BTN_TRIGGER_HAPPY,  /* tick */
++	BTN_TRIGGER_HAPPY3, BTN_TRIGGER_HAPPY4, /* long press */
++	BTN_TRIGGER_HAPPY5, BTN_TRIGGER_HAPPY6, BTN_TRIGGER_HAPPY7,
++	BTN_TRIGGER_HAPPY8, BTN_TRIGGER_HAPPY9, BTN_TRIGGER_HAPPY10
++};
++
++struct swbtn_config {
++	bool dclick_enabled;
++	int lkey_number;
++	unsigned int pressed_interval[SWBTN_MAX_PKEYS];
++	unsigned int tolerance;
++	bool open_interval;
++};
++
++static struct swbtn_config swbtn_cfg = {
++	.dclick_enabled = true,
++	.lkey_number = SWBTN_DEF_PKEYS,
++	.pressed_interval = {3000, 8000},
++	.tolerance = 800,
++	.open_interval = true
++};
++
++module_param_array_named(press_interval, swbtn_cfg.pressed_interval, uint,
++			 &swbtn_cfg.lkey_number, 0444);
++MODULE_PARM_DESC(press_interval,
++		 "A list of long press interval in ms. If no need, fill 0.");
++
++module_param_named(tolerance, swbtn_cfg.tolerance, uint, 0444);
++MODULE_PARM_DESC(tolerance,
++		 "The torlerance of press interval in ms. Default is 800ms.");
++
++module_param_named(open_interval, swbtn_cfg.open_interval, bool, 0444);
++MODULE_PARM_DESC(open_interval,
++		 "To let the last interval is the open interval.");
++
++module_param_named(enable_dclick, swbtn_cfg.dclick_enabled, bool, 0444);
++MODULE_PARM_DESC(enable_dclick,
++		 "To enable/disable double click event. Default is enabled.");
++
++static const struct acpi_device_id button_device_ids[] = {
++	{ACPI_BUTTON_HID_SWBTN, 0},
++	{"", 0},
++};
++MODULE_DEVICE_TABLE(acpi, button_device_ids);
++
++static int acpi_button_add(struct acpi_device *device);
++static int acpi_button_remove(struct acpi_device *device);
++static void acpi_button_notify(struct acpi_device *device, u32 event);
++
++static struct acpi_driver acpi_button_driver = {
++	.name = ACPI_BUTTON_DEVICE_NAME_SOFTWARE,
++	.class = ACPI_BUTTON_CLASS,
++	.owner = THIS_MODULE,
++	.ids = button_device_ids,
++	.ops = {
++		.add = acpi_button_add,
++		.remove = acpi_button_remove,
++		.notify = acpi_button_notify,
++	},
++};
++
++struct acpi_button {
++	unsigned int type;
++	struct input_dev *input;
++	char phys[32];                  /* for input device */
++	unsigned long pushed;
++	int last_state;
++	ktime_t last_time;
++	bool doubleclick;
++
++	/* defined timer_list struct */
++	struct timer_list swbtn_trigger_timer;
++};
++
++/*
++ * trigger software button event while timeout
++ *
++ */
++static void swbtn_trigger(struct timer_list *tdata)
++{
++	struct acpi_button *btn = from_timer(btn, tdata, swbtn_trigger_timer);
++
++	struct input_dev *input;
++	int keycode;
++
++	input = btn->input;
++
++	keycode = btn->last_state;
++	input_report_key(input, keycode, 1);
++	input_sync(input);
++
++	input_report_key(input, keycode, 0);
++	input_sync(input);
++}
++
++/*
++ * Switch two elements in array.
++ *
++ * @param xp, yp The array elements need to swap.
++ */
++void array_swap(unsigned int *xp, unsigned int *yp)
++{
++	int temp = *xp;
++	*xp = *yp;
++	*yp = temp;
++}
++
++/*
++ * Sorting an array in ascending order
++ *
++ * @param arr The array for sorting.
++ * @param n The array size
++ */
++void sort_asc(unsigned int arr[], int n)
++{
++	int i, j, min_idx;
++
++	for (i = 0; i < n - 1; i++) {
++		min_idx = i;
++		for (j = i + 1; j < n; j++)
++			if (arr[j] < arr[min_idx])
++				min_idx = j;
++
++		array_swap(&arr[min_idx], &arr[i]);
++	}
++}
++
++/*
++ * initial software button timer to check tick or double click
++ *
++ * @param btn Struct of acpi_button that should be required.
++ */
++static void swbtn_init_timer(struct acpi_button *btn)
++{
++	pr_info(PREFIX "swbtn timer start\n");
++
++	timer_setup(&btn->swbtn_trigger_timer, swbtn_trigger, 0);
++
++	btn->swbtn_trigger_timer.expires =
++		jiffies + SWBTN_DOUBLE_TRIGGER_DELAY;
++	add_timer(&btn->swbtn_trigger_timer);
++}
++
++/*-------------------------------------------------------------------------
++ *                               Driver Interface
++ *--------------------------------------------------------------------------
++ */
++static void acpi_button_notify(struct acpi_device *device, u32 event)
++{
++	struct acpi_button *button = acpi_driver_data(device);
++	struct input_dev *input;
++
++	int i, keycode, BTN_KEYCODE, lkey_number = swbtn_cfg.lkey_number;
++	ktime_t calltime, delta, lasttime, l_time;
++	unsigned long long duration;
++
++	pr_debug(PREFIX "%s, event:0x%x\n", __func__, event);
++
++	switch (event) {
++	case ACPI_BUTTON_NOTIFY_SWBTN_RELEASE:
++		del_timer(&button->swbtn_trigger_timer);
++
++		if (button->last_state != KEY_DOWN)
++			return;
++
++		input = button->input;
++
++		calltime = ktime_get();
++		lasttime = button->last_time;
++		button->last_time = calltime;
++
++		if (ktime_to_ns(lasttime) == 0)
++			lasttime = calltime;
++
++		delta = ktime_sub(calltime, lasttime); //ns
++		duration = (unsigned long long)
++			(ktime_to_ns(delta) >> 10) >> 10; //ms
++		pr_debug(PREFIX "duration time %llu ms\n", duration);
++
++		BTN_KEYCODE = BTN_TRIGGER_HAPPY;
++		if (button->doubleclick && duration < SWBTN_TRIGGER_DELAY) {
++			pr_debug(PREFIX "double click %llu s\n",
++				 duration >> 10);
++
++			BTN_KEYCODE = BTN_TRIGGER_HAPPY2;
++		} else if (duration >= 0 && duration < SWBTN_TRIGGER_DELAY) {
++			pr_debug(PREFIX "click %llu s\n", duration >> 10);
++
++			button->last_state = BTN_TRIGGER_HAPPY;
++			swbtn_init_timer(button);
++		} else {
++			for (i = 0; i < lkey_number; i++) {
++				unsigned int p_intval =
++					swbtn_cfg.pressed_interval[i];
++				unsigned int diff = swbtn_cfg.tolerance;
++				int j = i + 1;
++
++				if (p_intval < diff ||
++				    p_intval < SWBTN_TRIGGER_DELAY)
++					break;
++				if ((j) < lkey_number) {
++					unsigned int n_intval =
++						swbtn_cfg.pressed_interval[j];
++
++					if ((p_intval + diff) >
++					    (n_intval - diff))
++						diff = (n_intval
++							- p_intval) / 2;
++				}
++
++				pr_debug(PREFIX "pressed_interval: %lu ms\n",
++					 p_intval);
++
++				if ((swbtn_cfg.open_interval &&
++				     j == lkey_number &&
++				     duration > (p_intval - diff)) ||
++				    (duration > (p_intval - diff) &&
++				     duration < (p_intval + diff))) {
++					pr_debug(PREFIX "long pressed %llu s\n",
++						 duration >> 10);
++
++					BTN_KEYCODE = swbtn_keycodes[i + 2];
++					break;
++				}
++			}
++		}
++
++		if (!button->doubleclick &&
++		    (duration >= 0 &&
++		     duration < SWBTN_TRIGGER_DELAY))
++			return;
++
++		keycode = test_bit(BTN_KEYCODE, input->keybit) ?
++				BTN_KEYCODE : KEY_UNKNOWN;
++		pr_debug(PREFIX "released keycode: 0x%x", keycode);
++
++		button->last_state = keycode;
++		button->doubleclick = false;
++
++		input_report_key(input, keycode, 1);
++		input_sync(input);
++
++		input_report_key(input, keycode, 0);
++		input_sync(input);
++
++	break;
++	case ACPI_BUTTON_NOTIFY_SWBTN_PRESSED:
++		l_time = ktime_to_ns(button->last_time);
++
++		input = button->input;
++
++		calltime = ktime_get();
++		lasttime = l_time == 0 ? calltime : button->last_time;
++
++		delta = ktime_sub(calltime, lasttime); //ns
++		duration = (unsigned long long)
++			(ktime_to_ns(delta) >> 10) >> 10; //ms
++
++		button->doubleclick = (button->last_state ==
++				       BTN_TRIGGER_HAPPY &&
++				       duration > 0 &&
++				       duration < SWBTN_DOUBLE_TRIGGER_DELAY);
++
++		button->last_time = calltime;
++		button->last_state = KEY_DOWN;
++
++		pr_debug(PREFIX "pressed software button, duration %llu ms",
++			 duration);
++		pr_debug(PREFIX " is double click: %s\n",
++			 (button->doubleclick) ? "true" : "false");
++
++	break;
++	default:
++		ACPI_DEBUG_PRINT((ACPI_DB_INFO,
++				  "Unsupported event [0x%x]\n", event));
++	break;
++	}
++}
++
++static int __init acpi_button_init(void)
++{
++	int result;
++
++	pr_info(PREFIX "acpi button init!");
++
++	result = acpi_bus_register_driver(&acpi_button_driver);
++	if (result < 0) {
++		pr_err(PREFIX "register acpi button driver failed");
++		return -ENODEV;
++	}
++	return 0;
++}
++
++static void __exit acpi_button_exit(void)
++{
++	pr_info(PREFIX "%s\n", __func__);
++	acpi_bus_unregister_driver(&acpi_button_driver);
++}
++
++static int acpi_button_add(struct acpi_device *device)
++{
++	struct acpi_button *button;
++	struct input_dev *input;
++	const char *hid = acpi_device_hid(device);
++	char *name, *class;
++	int error, i;
++
++	pr_info(PREFIX "%s\n",  __func__);
++	button = kzalloc(sizeof(*button), GFP_KERNEL);
++	if (!button) {
++		pr_err(PREFIX "alloc acpi_button failed\n");
++		return -ENOMEM;
++	}
++
++	device->driver_data = button;
++
++	button->input = input_allocate_device();
++	input = button->input;
++	if (!input) {
++		error = -ENOMEM;
++		pr_err(PREFIX "allocat input device failed!\n");
++		goto err_free_button;
++	}
++
++	name = acpi_device_name(device);
++	class = acpi_device_class(device);
++
++	pr_info(PREFIX "device name[%s]\n", name);
++
++	if (!strcmp(hid, ACPI_BUTTON_HID_SWBTN)) {
++		button->type = ACPI_BUTTON_TYPE_SOFTWARE;
++		button->last_time = ktime_set(0, 0);
++		button->last_state = KEY_UNKNOWN;
++		strcpy(name, ACPI_BUTTON_DEVICE_NAME_SOFTWARE);
++		sprintf(class, "%s/%s", ACPI_BUTTON_CLASS,
++			ACPI_BUTTON_SUBCLASS_SOFTWARE);
++	} else {
++		pr_err(PREFIX "Unsupported hid [%s]\n", hid);
++		error = -ENODEV;
++		goto err_free_input;
++	}
++
++	snprintf(button->phys, sizeof(button->phys), "%s/button/input0", hid);
++
++	input->name = name;
++	input->phys = button->phys;
++	input->id.bustype = BUS_HOST;
++	input->id.product = button->type;
++	input->dev.parent = &device->dev;
++
++	pr_info(PREFIX "ACPI_BUTTON_TYPE_SOFTWARE: [0x%x]",
++		ACPI_BUTTON_TYPE_SOFTWARE);
++
++	switch (button->type) {
++	case ACPI_BUTTON_TYPE_SOFTWARE:
++		set_bit(EV_KEY, input->evbit);
++		set_bit(EV_REP, input->evbit);
++
++		if (swbtn_cfg.lkey_number == 1 &&
++		    swbtn_cfg.pressed_interval[0] == 0)
++			swbtn_cfg.lkey_number = 0;
++
++		for (i = (!swbtn_cfg.dclick_enabled);
++		     i < (swbtn_cfg.lkey_number + 2); i++) {
++			pr_info(PREFIX "%d. Enabled keycode[0x%x]\n",
++				i, swbtn_keycodes[i]);
++			input_set_capability(input, EV_KEY, swbtn_keycodes[i]);
++		}
++	break;
++	}
++
++	sort_asc(swbtn_cfg.pressed_interval, swbtn_cfg.lkey_number);
++
++	input_set_drvdata(input, device);
++	error = input_register_device(input);
++	if (error)
++		goto err_free_input;
++
++	device_init_wakeup(&device->dev, true);
++
++	pr_info(PREFIX "%s [%s]\n", name, acpi_device_bid(device));
++	return 0;
++
++err_free_input:
++	input_free_device(input);
++err_free_button:
++	kfree(button);
++	return error;
++}
++
++static int acpi_button_remove(struct acpi_device *device)
++{
++	struct acpi_button *button = acpi_driver_data(device);
++
++	pr_info(PREFIX "acpi_button_remove");
++
++	input_unregister_device(button->input);
++	kfree(button);
++	return 0;
++}
++
++module_init(acpi_button_init);
++module_exit(acpi_button_exit);
+--
+2.17.1
diff --git a/MAINTAINERS b/MAINTAINERS
index 8982c6e013b3..821c5cacf553 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -543,6 +543,11 @@ S:	Maintained
 F:	Documentation/scsi/advansys.txt
 F:	drivers/scsi/advansys.c
 
+ADVANTECH SWBTN DRIVER
+M:	Andrea Ho <Andrea.Ho@advantech.com.tw>
+S:	Maintained
+F:	drivers/input/misc/adv_swbutton.c
+
 ADXL34X THREE-AXIS DIGITAL ACCELEROMETER DRIVER (ADXL345/ADXL346)
 M:	Michael Hennerich <michael.hennerich@analog.com>
 W:	http://wiki.analog.com/ADXL345
diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index 7e2e658d551c..3c9350bdd7ae 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -879,4 +879,15 @@ config INPUT_STPMIC1_ONKEY
 	  To compile this driver as a module, choose M here: the
 	  module will be called stpmic1_onkey.
 
+config INPUT_ADV_SWBUTTON
+        tristate "Advantech ACPI Software button Driver"
+        depends on X86 && ACPI
+        help
+          Say Y here to enable support for Advantech software defined
+          button feature. More information can be fount at
+          <http://www.advantech.com.tw/products/>
+
+          To compile this driver as a module, choose M here. The module will
+          be called adv_swbutton.
+
 endif
diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
index 8fd187f314bd..a5ceb98f18f6 100644
--- a/drivers/input/misc/Makefile
+++ b/drivers/input/misc/Makefile
@@ -85,4 +85,4 @@ obj-$(CONFIG_INPUT_WM831X_ON)		+= wm831x-on.o
 obj-$(CONFIG_INPUT_XEN_KBDDEV_FRONTEND)	+= xen-kbdfront.o
 obj-$(CONFIG_INPUT_YEALINK)		+= yealink.o
 obj-$(CONFIG_INPUT_IDEAPAD_SLIDEBAR)	+= ideapad_slidebar.o
-
+obj-$(CONFIG_INPUT_ADV_SWBUTTON)    += adv_swbutton.o
diff --git a/drivers/input/misc/adv_swbutton.c b/drivers/input/misc/adv_swbutton.c
new file mode 100644
index 000000000000..7e4db67780dc
--- /dev/null
+++ b/drivers/input/misc/adv_swbutton.c
@@ -0,0 +1,473 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *  adv_swbutton.c - Software Button Interface Driver.
+ *
+ *  (C) Copyright 2020 Advantech Corporation, Inc
+ *
+ *  Based on soc_button_array.c:
+ *
+ *  {C} Copyright 2014 Intel Corporation
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ */
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/version.h>
+#include <linux/types.h>
+#include <linux/proc_fs.h>
+#include <linux/seq_file.h>
+#include <linux/input.h>
+#include <linux/slab.h>
+#include <linux/acpi.h>
+#include <linux/ktime.h>
+#include <linux/moduleparam.h>
+#include <acpi/button.h>
+#include <acpi/acpi_bus.h>
+#include <acpi/acpi_drivers.h>
+
+#define PREFIX "[AHC] ACPI: "
+#define DRIVER_VERSION "v1.0.0"
+
+#define ACPI_BUTTON_CLASS                   "button"
+#define ACPI_BUTTON_FILE_INFO               "info"
+#define ACPI_BUTTON_FILE_STATE              "state"
+#define ACPI_BUTTON_TYPE_UNKNOWN            0x00
+
+#define ACPI_BUTTON_SUBCLASS_SOFTWARE       "software"
+#define ACPI_BUTTON_HID_SWBTN               "AHC0310"
+#define ACPI_BUTTON_DEVICE_NAME_SOFTWARE    "Software Button"
+#define ACPI_BUTTON_TYPE_SOFTWARE           0x07
+
+#define ACPI_BUTTON_NOTIFY_SWBTN_RELEASE    0x86
+#define ACPI_BUTTON_NOTIFY_SWBTN_PRESSED    0x85
+
+#define SWBTN_DOUBLE_TRIGGER_DELAY          130
+#define SWBTN_TRIGGER_DELAY                 350
+#define SWBTN_MAX_PKEYS                     8
+#define SWBTN_DEF_PKEYS                     2
+
+#define _COMPONENT                          ACPI_BUTTON_COMPONENT
+
+ACPI_MODULE_NAME("swbutton");
+
+MODULE_VERSION(DRIVER_VERSION);
+MODULE_AUTHOR("Andrea Ho");
+MODULE_DESCRIPTION("Advantech ACPI SW Button Driver");
+MODULE_LICENSE("GPL");
+
+/* Defined keycodes */
+static short swbtn_keycodes[]  = {
+	BTN_TRIGGER_HAPPY2, /* double click */
+	BTN_TRIGGER_HAPPY,  /* tick */
+	BTN_TRIGGER_HAPPY3, BTN_TRIGGER_HAPPY4, /* long press */
+	BTN_TRIGGER_HAPPY5, BTN_TRIGGER_HAPPY6, BTN_TRIGGER_HAPPY7,
+	BTN_TRIGGER_HAPPY8, BTN_TRIGGER_HAPPY9, BTN_TRIGGER_HAPPY10
+};
+
+struct swbtn_config {
+	bool dclick_enabled;
+	int lkey_number;
+	unsigned int pressed_interval[SWBTN_MAX_PKEYS];
+	unsigned int tolerance;
+	bool open_interval;
+};
+
+static struct swbtn_config swbtn_cfg = {
+	.dclick_enabled = true,
+	.lkey_number = SWBTN_DEF_PKEYS,
+	.pressed_interval = {3000, 8000},
+	.tolerance = 800,
+	.open_interval = true
+};
+
+module_param_array_named(press_interval, swbtn_cfg.pressed_interval, uint,
+			 &swbtn_cfg.lkey_number, 0444);
+MODULE_PARM_DESC(press_interval,
+		 "A list of long press interval in ms. If no need, fill 0.");
+
+module_param_named(tolerance, swbtn_cfg.tolerance, uint, 0444);
+MODULE_PARM_DESC(tolerance,
+		 "The torlerance of press interval in ms. Default is 800ms.");
+
+module_param_named(open_interval, swbtn_cfg.open_interval, bool, 0444);
+MODULE_PARM_DESC(open_interval,
+		 "To let the last interval is the open interval.");
+
+module_param_named(enable_dclick, swbtn_cfg.dclick_enabled, bool, 0444);
+MODULE_PARM_DESC(enable_dclick,
+		 "To enable/disable double click event. Default is enabled.");
+
+static const struct acpi_device_id button_device_ids[] = {
+	{ACPI_BUTTON_HID_SWBTN, 0},
+	{"", 0},
+};
+MODULE_DEVICE_TABLE(acpi, button_device_ids);
+
+static int acpi_button_add(struct acpi_device *device);
+static int acpi_button_remove(struct acpi_device *device);
+static void acpi_button_notify(struct acpi_device *device, u32 event);
+
+static struct acpi_driver acpi_button_driver = {
+	.name = ACPI_BUTTON_DEVICE_NAME_SOFTWARE,
+	.class = ACPI_BUTTON_CLASS,
+	.owner = THIS_MODULE,
+	.ids = button_device_ids,
+	.ops = {
+		.add = acpi_button_add,
+		.remove = acpi_button_remove,
+		.notify = acpi_button_notify,
+	},
+};
+
+struct acpi_button {
+	unsigned int type;
+	struct input_dev *input;
+	char phys[32];                  /* for input device */
+	unsigned long pushed;
+	int last_state;
+	ktime_t last_time;
+	bool doubleclick;
+
+	/* defined timer_list struct */
+	struct timer_list swbtn_trigger_timer;
+};
+
+/*
+ * trigger software button event while timeout
+ *
+ */
+static void swbtn_trigger(struct timer_list *tdata)
+{
+	struct acpi_button *btn = from_timer(btn, tdata, swbtn_trigger_timer);
+
+	struct input_dev *input;
+	int keycode;
+
+	input = btn->input;
+
+	keycode = btn->last_state;
+	input_report_key(input, keycode, 1);
+	input_sync(input);
+
+	input_report_key(input, keycode, 0);
+	input_sync(input);
+}
+
+/*
+ * Switch two elements in array.
+ *
+ * @param xp, yp The array elements need to swap.
+ */
+void array_swap(unsigned int *xp, unsigned int *yp)
+{
+	int temp = *xp;
+	*xp = *yp;
+	*yp = temp;
+}
+
+/*
+ * Sorting an array in ascending order
+ *
+ * @param arr The array for sorting.
+ * @param n The array size
+ */
+void sort_asc(unsigned int arr[], int n)
+{
+	int i, j, min_idx;
+
+	for (i = 0; i < n - 1; i++) {
+		min_idx = i;
+		for (j = i + 1; j < n; j++)
+			if (arr[j] < arr[min_idx])
+				min_idx = j;
+
+		array_swap(&arr[min_idx], &arr[i]);
+	}
+}
+
+/*
+ * initial software button timer to check tick or double click
+ *
+ * @param btn Struct of acpi_button that should be required.
+ */
+static void swbtn_init_timer(struct acpi_button *btn)
+{
+	pr_info(PREFIX "swbtn timer start\n");
+
+	timer_setup(&btn->swbtn_trigger_timer, swbtn_trigger, 0);
+
+	btn->swbtn_trigger_timer.expires =
+		jiffies + SWBTN_DOUBLE_TRIGGER_DELAY;
+	add_timer(&btn->swbtn_trigger_timer);
+}
+
+/*-------------------------------------------------------------------------
+ *                               Driver Interface
+ *--------------------------------------------------------------------------
+ */
+static void acpi_button_notify(struct acpi_device *device, u32 event)
+{
+	struct acpi_button *button = acpi_driver_data(device);
+	struct input_dev *input;
+
+	int i, keycode, BTN_KEYCODE, lkey_number = swbtn_cfg.lkey_number;
+	ktime_t calltime, delta, lasttime, l_time;
+	unsigned long long duration;
+
+	pr_debug(PREFIX "%s, event:0x%x\n", __func__, event);
+
+	switch (event) {
+	case ACPI_BUTTON_NOTIFY_SWBTN_RELEASE:
+		del_timer(&button->swbtn_trigger_timer);
+
+		if (button->last_state != KEY_DOWN)
+			return;
+
+		input = button->input;
+
+		calltime = ktime_get();
+		lasttime = button->last_time;
+		button->last_time = calltime;
+
+		if (ktime_to_ns(lasttime) == 0)
+			lasttime = calltime;
+
+		delta = ktime_sub(calltime, lasttime); //ns
+		duration = (unsigned long long)
+			(ktime_to_ns(delta) >> 10) >> 10; //ms
+		pr_debug(PREFIX "duration time %llu ms\n", duration);
+
+		BTN_KEYCODE = BTN_TRIGGER_HAPPY;
+		if (button->doubleclick && duration < SWBTN_TRIGGER_DELAY) {
+			pr_debug(PREFIX "double click %llu s\n",
+				 duration >> 10);
+
+			BTN_KEYCODE = BTN_TRIGGER_HAPPY2;
+		} else if (duration >= 0 && duration < SWBTN_TRIGGER_DELAY) {
+			pr_debug(PREFIX "click %llu s\n", duration >> 10);
+
+			button->last_state = BTN_TRIGGER_HAPPY;
+			swbtn_init_timer(button);
+		} else {
+			for (i = 0; i < lkey_number; i++) {
+				unsigned int p_intval =
+					swbtn_cfg.pressed_interval[i];
+				unsigned int diff = swbtn_cfg.tolerance;
+				int j = i + 1;
+
+				if (p_intval < diff ||
+				    p_intval < SWBTN_TRIGGER_DELAY)
+					break;
+				if ((j) < lkey_number) {
+					unsigned int n_intval =
+						swbtn_cfg.pressed_interval[j];
+
+					if ((p_intval + diff) >
+					    (n_intval - diff))
+						diff = (n_intval
+							- p_intval) / 2;
+				}
+
+				pr_debug(PREFIX "pressed_interval: %lu ms\n",
+					 p_intval);
+
+				if ((swbtn_cfg.open_interval &&
+				     j == lkey_number &&
+				     duration > (p_intval - diff)) ||
+				    (duration > (p_intval - diff) &&
+				     duration < (p_intval + diff))) {
+					pr_debug(PREFIX "long pressed %llu s\n",
+						 duration >> 10);
+
+					BTN_KEYCODE = swbtn_keycodes[i + 2];
+					break;
+				}
+			}
+		}
+
+		if (!button->doubleclick &&
+		    (duration >= 0 &&
+		     duration < SWBTN_TRIGGER_DELAY))
+			return;
+
+		keycode = test_bit(BTN_KEYCODE, input->keybit) ?
+				BTN_KEYCODE : KEY_UNKNOWN;
+		pr_debug(PREFIX "released keycode: 0x%x", keycode);
+
+		button->last_state = keycode;
+		button->doubleclick = false;
+
+		input_report_key(input, keycode, 1);
+		input_sync(input);
+
+		input_report_key(input, keycode, 0);
+		input_sync(input);
+
+	break;
+	case ACPI_BUTTON_NOTIFY_SWBTN_PRESSED:
+		l_time = ktime_to_ns(button->last_time);
+
+		input = button->input;
+
+		calltime = ktime_get();
+		lasttime = l_time == 0 ? calltime : button->last_time;
+
+		delta = ktime_sub(calltime, lasttime); //ns
+		duration = (unsigned long long)
+			(ktime_to_ns(delta) >> 10) >> 10; //ms
+
+		button->doubleclick = (button->last_state ==
+				       BTN_TRIGGER_HAPPY &&
+				       duration > 0 &&
+				       duration < SWBTN_DOUBLE_TRIGGER_DELAY);
+
+		button->last_time = calltime;
+		button->last_state = KEY_DOWN;
+
+		pr_debug(PREFIX "pressed software button, duration %llu ms",
+			 duration);
+		pr_debug(PREFIX " is double click: %s\n",
+			 (button->doubleclick) ? "true" : "false");
+
+	break;
+	default:
+		ACPI_DEBUG_PRINT((ACPI_DB_INFO,
+				  "Unsupported event [0x%x]\n", event));
+	break;
+	}
+}
+
+static int __init acpi_button_init(void)
+{
+	int result;
+
+	pr_info(PREFIX "acpi button init!");
+
+	result = acpi_bus_register_driver(&acpi_button_driver);
+	if (result < 0) {
+		pr_err(PREFIX "register acpi button driver failed");
+		return -ENODEV;
+	}
+	return 0;
+}
+
+static void __exit acpi_button_exit(void)
+{
+	pr_info(PREFIX "%s\n", __func__);
+	acpi_bus_unregister_driver(&acpi_button_driver);
+}
+
+static int acpi_button_add(struct acpi_device *device)
+{
+	struct acpi_button *button;
+	struct input_dev *input;
+	const char *hid = acpi_device_hid(device);
+	char *name, *class;
+	int error, i;
+
+	pr_info(PREFIX "%s\n",  __func__);
+	button = kzalloc(sizeof(*button), GFP_KERNEL);
+	if (!button) {
+		pr_err(PREFIX "alloc acpi_button failed\n");
+		return -ENOMEM;
+	}
+
+	device->driver_data = button;
+
+	button->input = input_allocate_device();
+	input = button->input;
+	if (!input) {
+		error = -ENOMEM;
+		pr_err(PREFIX "allocat input device failed!\n");
+		goto err_free_button;
+	}
+
+	name = acpi_device_name(device);
+	class = acpi_device_class(device);
+
+	pr_info(PREFIX "device name[%s]\n", name);
+
+	if (!strcmp(hid, ACPI_BUTTON_HID_SWBTN)) {
+		button->type = ACPI_BUTTON_TYPE_SOFTWARE;
+		button->last_time = ktime_set(0, 0);
+		button->last_state = KEY_UNKNOWN;
+		strcpy(name, ACPI_BUTTON_DEVICE_NAME_SOFTWARE);
+		sprintf(class, "%s/%s", ACPI_BUTTON_CLASS,
+			ACPI_BUTTON_SUBCLASS_SOFTWARE);
+	} else {
+		pr_err(PREFIX "Unsupported hid [%s]\n", hid);
+		error = -ENODEV;
+		goto err_free_input;
+	}
+
+	snprintf(button->phys, sizeof(button->phys), "%s/button/input0", hid);
+
+	input->name = name;
+	input->phys = button->phys;
+	input->id.bustype = BUS_HOST;
+	input->id.product = button->type;
+	input->dev.parent = &device->dev;
+
+	pr_info(PREFIX "ACPI_BUTTON_TYPE_SOFTWARE: [0x%x]",
+		ACPI_BUTTON_TYPE_SOFTWARE);
+
+	switch (button->type) {
+	case ACPI_BUTTON_TYPE_SOFTWARE:
+		set_bit(EV_KEY, input->evbit);
+		set_bit(EV_REP, input->evbit);
+
+		if (swbtn_cfg.lkey_number == 1 &&
+		    swbtn_cfg.pressed_interval[0] == 0)
+			swbtn_cfg.lkey_number = 0;
+
+		for (i = (!swbtn_cfg.dclick_enabled);
+		     i < (swbtn_cfg.lkey_number + 2); i++) {
+			pr_info(PREFIX "%d. Enabled keycode[0x%x]\n",
+				i, swbtn_keycodes[i]);
+			input_set_capability(input, EV_KEY, swbtn_keycodes[i]);
+		}
+	break;
+	}
+
+	sort_asc(swbtn_cfg.pressed_interval, swbtn_cfg.lkey_number);
+
+	input_set_drvdata(input, device);
+	error = input_register_device(input);
+	if (error)
+		goto err_free_input;
+
+	device_init_wakeup(&device->dev, true);
+
+	pr_info(PREFIX "%s [%s]\n", name, acpi_device_bid(device));
+	return 0;
+
+err_free_input:
+	input_free_device(input);
+err_free_button:
+	kfree(button);
+	return error;
+}
+
+static int acpi_button_remove(struct acpi_device *device)
+{
+	struct acpi_button *button = acpi_driver_data(device);
+
+	pr_info(PREFIX "acpi_button_remove");
+
+	input_unregister_device(button->input);
+	kfree(button);
+	return 0;
+}
+
+module_init(acpi_button_init);
+module_exit(acpi_button_exit);
-- 
2.17.1

