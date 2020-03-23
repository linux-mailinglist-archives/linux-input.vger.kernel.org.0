Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D449819022C
	for <lists+linux-input@lfdr.de>; Tue, 24 Mar 2020 00:46:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727270AbgCWXpS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 23 Mar 2020 19:45:18 -0400
Received: from mail-pl1-f202.google.com ([209.85.214.202]:36991 "EHLO
        mail-pl1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727281AbgCWXpQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 23 Mar 2020 19:45:16 -0400
Received: by mail-pl1-f202.google.com with SMTP id t12so10728561plo.4
        for <linux-input@vger.kernel.org>; Mon, 23 Mar 2020 16:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=/QBjDN0nv6YWKV4K8B7ojsyFGdc9mVww0s2ISlcMwfs=;
        b=mNBqjMPEu4CjE6fb+ojog2lWCsrLpRQ0vatIYB0KwQAI2pVbf21VRF+BczKOgYUYuN
         mHZc3TEB32+pUXcjw3pvM6gq/ReNHITJZzaabtsY+g0Q0krBpUoB/FF4FbiP9M35fIZt
         tDRIB106g7MZ4ogmRX3knxaRBZGss2hLUpBU+o+AXTmEzkMziOHd+raCxyImHypVzNJI
         Zl8xAyuskQz0WUyQ9h31o/pg9ygdz2Muvw8+/xNBK426DhB21dgAb+asfgcxTMd+5OWX
         aS3jtMsWrxgQHR7qiXxFZMxIrAhQyeyc9D87ZyDAAdjNH5c2a1mDDE8UEK6rLsD0r8P4
         JYrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=/QBjDN0nv6YWKV4K8B7ojsyFGdc9mVww0s2ISlcMwfs=;
        b=dq2KxiTIGO73/e9fEzVuuo42Wo0ctp9vUvvQ5isqJ5Gla/D/asGEyxnvfKPeleL6kF
         cxKCarazn+nxzhRllFiXsZQ5n7KkEYqTM0oEMoFg+HLs/J6R9Wuj0iLgT9qTbygFuyf0
         2veFKcCyEs+zplNOFGLiZMBBEMAQUOv1in+38l+wNrkHJ9ziyhm7f3xj/5cWydRwaUOp
         M9HFxipuue8SkaKBGF6Zs8V29me9rom+NuXQ/EkOz+FtNOfZqjnuaYhsw8h/vLE+jzv5
         RPg4CLyhWgIe/xsFRJfv59WnV3aPjVVTM3y9VR6EoZoijJcDr7MlxxDUvK8JBJdbutE+
         YbXQ==
X-Gm-Message-State: ANhLgQ0fvpFItvtpgfvHvDEZy5EwxmCKdaJb9Ecs+se8SynJYdJtLns9
        NvzQzrY7KC1QyUOenTwWNxCezb90Q3X+
X-Google-Smtp-Source: ADFU+vssdXVIa3r7hv9GAMgK277VoxTDFir+NdBaE08HaPDMmkI2Fk563mHWM1pX8kNQyoB/+uhI3V6SmW01
X-Received: by 2002:a63:56:: with SMTP id 83mr24405892pga.249.1585007113269;
 Mon, 23 Mar 2020 16:45:13 -0700 (PDT)
Date:   Mon, 23 Mar 2020 16:45:02 -0700
In-Reply-To: <20200323234505.226919-1-rajatja@google.com>
Message-Id: <20200323234505.226919-2-rajatja@google.com>
Mime-Version: 1.0
References: <20200323234505.226919-1-rajatja@google.com>
X-Mailer: git-send-email 2.25.1.696.g5e7596f4ac-goog
Subject: [PATCH RESEND 2/5] Input: atkbd: Expose function row physical map to userspace
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

Certain keyboards (e.g. Chromeos) have their top-row keys intended
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
Change-Id: I75311c844a2576e6169eae5184b8ef54b363554c
---
 drivers/input/keyboard/atkbd.c | 59 ++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
index 7e3eae54c1926..7623eebef2593 100644
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
@@ -1121,6 +1159,25 @@ static void atkbd_set_device_attrs(struct atkbd *atkbd)
 	}
 }
 
+static void atkbd_parse_fwnode_data(struct serio *serio)
+{
+	struct atkbd *atkbd = serio_get_drvdata(serio);
+	struct device *dev = &serio->dev;
+	int n;
+
+	if (!dev_fwnode(dev))
+		return;
+
+	/* Parse "function-row-physmap" property */
+	n = device_property_count_u16(dev, "function-row-physmap");
+	if (n > 0 && n <= MAX_FUNCTION_ROW_KEYS &&
+	    !device_property_read_u16_array(dev, "function-row-physmap",
+					    atkbd->function_row_physmap, n)) {
+		atkbd->num_function_row_keys = n;
+		dev_info(dev, "FW reported %d function-row key locations\n", n);
+	}
+}
+
 /*
  * atkbd_connect() is called when the serio module finds an interface
  * that isn't handled yet by an appropriate device driver. We check if
@@ -1184,6 +1241,8 @@ static int atkbd_connect(struct serio *serio, struct serio_driver *drv)
 		atkbd->id = 0xab00;
 	}
 
+	atkbd_parse_fwnode_data(serio);
+
 	atkbd_set_keycode_table(atkbd);
 	atkbd_set_device_attrs(atkbd);
 
-- 
2.25.1.696.g5e7596f4ac-goog

