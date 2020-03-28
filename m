Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7739B1968D5
	for <lists+linux-input@lfdr.de>; Sat, 28 Mar 2020 19:59:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727125AbgC1S7a (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 28 Mar 2020 14:59:30 -0400
Received: from mail-yb1-f202.google.com ([209.85.219.202]:36503 "EHLO
        mail-yb1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727131AbgC1S72 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 28 Mar 2020 14:59:28 -0400
Received: by mail-yb1-f202.google.com with SMTP id w185so12535563ybe.3
        for <linux-input@vger.kernel.org>; Sat, 28 Mar 2020 11:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=cb6A4ZievIvvysAvumZN4FIO7dPjsgeMK8Q/oul1Xgs=;
        b=DAQ8XHD8okBVh2XJa2USholx+1RJddSlBF8w3rKul+bEhcpC5OB7CgsmbHySNT5MJU
         H5RfSes0X3kz7itAjJPnhGW4wMPiSdhkWYf5TbYt5tcDeJDy1CysmVteAXTw3wLkp5+S
         uAxj5rvzEzFn4lrDtMMHQOLiRcEhwZnrVWDEUoDI2Iw3aup9M/ylYf/ozgT9Qzu1o2zX
         m3HgF5Bbc9x1zyMdpXaDku2GIEi6EAVYOZbHMvjK8Hy8yfPGIoQxFqW8EaiDNoFTPimU
         ysxEwBS4A/KOyF+PfZ32GBx3fzfxIoUKYx2NiCsCtEIcJinhiawCVDMwPC2Ra9kbTe6Y
         xPQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=cb6A4ZievIvvysAvumZN4FIO7dPjsgeMK8Q/oul1Xgs=;
        b=cjPBTmQ9bxkoUfI9Z1P6FYVMMNhAwLyUgFf/FiWn/woLrybKcW4tyMHqegSE5wGG/B
         nq0DGb7DlWgHUupSeAqN+y/INPG+z0lrtj7MzNVwxVf7vteYAUCYduUyYuix3JD8BhxP
         XVUQXvv6XnbOnuXy52eOC9/L8c3ebm/UIHjEbOt5WLKdQvSY/VvgYxd7hEE2m6Y47lOO
         U3yAdnNFpHYSzpJAAH9iMoy05o904GWsAnN5XzyfFVwv95+MfwoDxjhitIxzC+gSyObQ
         euVJiH2NsD/TimeabFL9n8vgKaVbZ12aceuOnL1Bp1QE0Ey3566qeYUEsxzCb/9kfpF2
         opmg==
X-Gm-Message-State: ANhLgQ2kbPdB2F2aAdek59PAz/+qicpHY6t2xFwvvfS6am3NxuFYrVC+
        ZWRoljFIvxdLd8P49UMzBeIx0pZ8R6/Y
X-Google-Smtp-Source: ADFU+vtux+3y6NC8cdca093ciq5FCliMi9Au9EXmPcbUQ9hQB3QDO5O6FwgnREVqgVeBRyFCZRy1RPr7nH3g
X-Received: by 2002:a25:9d88:: with SMTP id v8mr7013374ybp.433.1585421966999;
 Sat, 28 Mar 2020 11:59:26 -0700 (PDT)
Date:   Sat, 28 Mar 2020 11:59:13 -0700
In-Reply-To: <20200328185916.98423-1-rajatja@google.com>
Message-Id: <20200328185916.98423-2-rajatja@google.com>
Mime-Version: 1.0
References: <20200328185916.98423-1-rajatja@google.com>
X-Mailer: git-send-email 2.26.0.rc2.310.g2932bb562d-goog
Subject: [PATCH v4 2/5] Input: atkbd: Expose function row physical map to userspace
From:   Rajat Jain <rajatja@google.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>, dtor@google.com,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rajat Jain <rajatja@google.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Enrico Weigelt <info@metux.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Allison Randal <allison@lohutok.net>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, furquan@google.com,
        dlaurie@google.com, bleung@google.com, zentaro@google.com,
        dbehr@google.com
Cc:     rajatxjain@gmail.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Certain keyboards have their top-row keys intended
for actions such as "Browser back", "Browser Refresh", "Fullscreen"
etc as their primary mode, thus they will send physical codes for those
actions. Further, they don't have a dedicated "Fn" key so don't have
the capability to generate function key codes (e.g. F1, F2 etc..).
However in this case, if userspace still wants to "synthesize" those
function keys using the top row action keys, it needs to know the
physical position of the top row keys. (Essentially a mapping between
usage codes and a physical location in the top row).

This patch enhances the atkbd driver to receive such a mapping from the
firmware / device tree, and expose it to userspace in the form of
a function-row-physmap attribute. The attribute would be a space
separated ordered list of physical codes, for the keys in the function
row, in left-to-right order.

The attribute will only be present if the kernel knows about such
mapping, otherwise the attribute shall not be visible.

Signed-off-by: Rajat Jain <rajatja@google.com>
---
v4: Same as v3
v3: Change to dev_dbg and remove unecessary error check
v2: Remove the Change-Id from the commit log

 drivers/input/keyboard/atkbd.c | 56 ++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
index 7e3eae54c1926..3b20aba1861cd 100644
--- a/drivers/input/keyboard/atkbd.c
+++ b/drivers/input/keyboard/atkbd.c
@@ -24,6 +24,7 @@
 #include <linux/libps2.h>
 #include <linux/mutex.h>
 #include <linux/dmi.h>
+#include <linux/property.h>
 
 #define DRIVER_DESC	"AT and PS/2 keyboard driver"
 
@@ -63,6 +64,8 @@ static bool atkbd_terminal;
 module_param_named(terminal, atkbd_terminal, bool, 0);
 MODULE_PARM_DESC(terminal, "Enable break codes on an IBM Terminal keyboard connected via AT/PS2");
 
+#define MAX_FUNCTION_ROW_KEYS	24
+
 /*
  * Scancode to keycode tables. These are just the default setting, and
  * are loadable via a userland utility.
@@ -230,6 +233,9 @@ struct atkbd {
 
 	/* Serializes reconnect(), attr->set() and event work */
 	struct mutex mutex;
+
+	u16 function_row_physmap[MAX_FUNCTION_ROW_KEYS];
+	int num_function_row_keys;
 };
 
 /*
@@ -283,6 +289,7 @@ static struct device_attribute atkbd_attr_##_name =				\
 	__ATTR(_name, S_IRUGO, atkbd_do_show_##_name, NULL);
 
 ATKBD_DEFINE_RO_ATTR(err_count);
+ATKBD_DEFINE_RO_ATTR(function_row_physmap);
 
 static struct attribute *atkbd_attributes[] = {
 	&atkbd_attr_extra.attr,
@@ -292,11 +299,42 @@ static struct attribute *atkbd_attributes[] = {
 	&atkbd_attr_softrepeat.attr,
 	&atkbd_attr_softraw.attr,
 	&atkbd_attr_err_count.attr,
+	&atkbd_attr_function_row_physmap.attr,
 	NULL
 };
 
+static ssize_t atkbd_show_function_row_physmap(struct atkbd *atkbd, char *buf)
+{
+	ssize_t size = 0;
+	int i;
+
+	if (!atkbd->num_function_row_keys)
+		return 0;
+
+	for (i = 0; i < atkbd->num_function_row_keys; i++)
+		size += sprintf(buf + size, "%02X ",
+				atkbd->function_row_physmap[i]);
+	size += sprintf(buf + size, "\n");
+	return size;
+}
+
+static umode_t atkbd_attr_is_visible(struct kobject *kobj,
+				struct attribute *attr, int i)
+{
+	struct device *dev = container_of(kobj, struct device, kobj);
+	struct serio *serio = to_serio_port(dev);
+	struct atkbd *atkbd = serio_get_drvdata(serio);
+
+	if (attr == &atkbd_attr_function_row_physmap.attr &&
+	    !atkbd->num_function_row_keys)
+		return 0;
+
+	return attr->mode;
+}
+
 static struct attribute_group atkbd_attribute_group = {
 	.attrs	= atkbd_attributes,
+	.is_visible = atkbd_attr_is_visible,
 };
 
 static const unsigned int xl_table[] = {
@@ -1121,6 +1159,22 @@ static void atkbd_set_device_attrs(struct atkbd *atkbd)
 	}
 }
 
+static void atkbd_parse_fwnode_data(struct serio *serio)
+{
+	struct atkbd *atkbd = serio_get_drvdata(serio);
+	struct device *dev = &serio->dev;
+	int n;
+
+	/* Parse "function-row-physmap" property */
+	n = device_property_count_u16(dev, "function-row-physmap");
+	if (n > 0 && n <= MAX_FUNCTION_ROW_KEYS &&
+	    !device_property_read_u16_array(dev, "function-row-physmap",
+					    atkbd->function_row_physmap, n)) {
+		atkbd->num_function_row_keys = n;
+		dev_dbg(dev, "FW reported %d function-row key locations\n", n);
+	}
+}
+
 /*
  * atkbd_connect() is called when the serio module finds an interface
  * that isn't handled yet by an appropriate device driver. We check if
@@ -1184,6 +1238,8 @@ static int atkbd_connect(struct serio *serio, struct serio_driver *drv)
 		atkbd->id = 0xab00;
 	}
 
+	atkbd_parse_fwnode_data(serio);
+
 	atkbd_set_keycode_table(atkbd);
 	atkbd_set_device_attrs(atkbd);
 
-- 
2.26.0.rc2.310.g2932bb562d-goog

