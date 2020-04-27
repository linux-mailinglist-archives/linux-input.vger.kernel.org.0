Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B4F61BAFE8
	for <lists+linux-input@lfdr.de>; Mon, 27 Apr 2020 23:03:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726853AbgD0VDT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 Apr 2020 17:03:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726773AbgD0VDG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 Apr 2020 17:03:06 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADCEDC03C1A7
        for <linux-input@vger.kernel.org>; Mon, 27 Apr 2020 14:03:05 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id m138so15674054ybf.12
        for <linux-input@vger.kernel.org>; Mon, 27 Apr 2020 14:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=gCJ1P7w/B8waJVaF76DkEsZIBFFS53UPC6uYguZ6xnc=;
        b=AUB+XdBRKt+WboOX/CooIo/ZRHu1AEqIf5unABoym8B0e9Hvj+RoBiXu1dlmygQWS9
         LJ2Wjr5zDiif8HnvMUmDVxtvcq/FqDnBBBbvGOP+8taxykMRRZ4pKSNsywLGXWCw431n
         u8N+rRGE3MURzUKz8Kl2xskf1nsbFz8Nu4Lt7Qi6+wCA0KJHs66v73u4W89shDiDX6kJ
         Gkb9m6cub+Ocu9cYv7tWPIPMN3HBvNJGt2GnjJpxXyKQq6svDGTA6gU+z/r8fFVUhk4E
         p4C6zhv6ElvMiCn/KQ2xszTlnK9H/SItb1uMH82b2Pj0Lf56svlS5WEtUCxMfiAJM3gi
         YpIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=gCJ1P7w/B8waJVaF76DkEsZIBFFS53UPC6uYguZ6xnc=;
        b=WXUTul6ZNgEqz6zuVbUt0G2KUBzP8HmT9zsViebchzYWUMxax0HRwCXHoJbcdA1brL
         GzNxt2Z9TaJ1Nrk70uvDwZIehOhaYd799dTM9IdCJe78IaUbgPQ8fx/TL+KxIGjdpIxJ
         fJhR9A+C/OSx721hwX4L+g4qbqjWHua4fjWcV71aTwkpQJ0Q5GTrm84YqTPLBDKVSgah
         W/R5As37M4UX0jtjnMZRfKvsYqMruZoQiyya3H3G7iH0fQxoPMKecEz+4Cl5X9UQz+RC
         K5leF4SNTpc8Gw6E+ogqL/r+B+GnCiV6I69ciYQna02pk09GVZhm7tlrq0odNps+mq8E
         x10A==
X-Gm-Message-State: AGi0PuZH5c+dv1ymWd1669I/3RTzNi7t5/sQxg0oEqlAZCEg4/kMuUPM
        grGQntRDKxQLynOEZpMcglm3tjnZLbRU
X-Google-Smtp-Source: APiQypKIn13ROW7cWiMXEvyHycbRrpSGTVkj7EHJxI+D6rDUeiOeqvcPRXkeo8wT3rr53l5hESezBaYdVCI0
X-Received: by 2002:a25:bd6:: with SMTP id 205mr42019760ybl.93.1588021384843;
 Mon, 27 Apr 2020 14:03:04 -0700 (PDT)
Date:   Mon, 27 Apr 2020 14:02:58 -0700
In-Reply-To: <20200427210259.91330-1-rajatja@google.com>
Message-Id: <20200427210259.91330-2-rajatja@google.com>
Mime-Version: 1.0
References: <20200427210259.91330-1-rajatja@google.com>
X-Mailer: git-send-email 2.26.2.303.gf8c07b1a785-goog
Subject: [PATCH v5 2/3] Input: atkbd: Expose function row physical map to userspace
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
v5: Change the size of each array element from u16 to u32
v4: Same as v3
v3: Change to dev_dbg and remove unecessary error check
v2: Remove the Change-Id from the commit log

 drivers/input/keyboard/atkbd.c | 56 ++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
index 7e3eae54c1926..358e91f8888ff 100644
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
+	u32 function_row_physmap[MAX_FUNCTION_ROW_KEYS];
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
+		size += scnprintf(buf + size, PAGE_SIZE - size, "%02X ",
+				  atkbd->function_row_physmap[i]);
+	size += scnprintf(buf + size, PAGE_SIZE - size, "\n");
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
+	n = device_property_count_u32(dev, "function-row-physmap");
+	if (n > 0 && n <= MAX_FUNCTION_ROW_KEYS &&
+	    !device_property_read_u32_array(dev, "function-row-physmap",
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
2.26.2.303.gf8c07b1a785-goog

