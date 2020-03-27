Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53C6D194E83
	for <lists+linux-input@lfdr.de>; Fri, 27 Mar 2020 02:33:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727854AbgC0BdH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 26 Mar 2020 21:33:07 -0400
Received: from mail-pj1-f74.google.com ([209.85.216.74]:41869 "EHLO
        mail-pj1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727729AbgC0Bcw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 26 Mar 2020 21:32:52 -0400
Received: by mail-pj1-f74.google.com with SMTP id k3so5825384pjo.6
        for <linux-input@vger.kernel.org>; Thu, 26 Mar 2020 18:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=m+LBqNPjIzI/i9s16PMcLCo7oQ00z3NG9NsKpsashP4=;
        b=IniSd5FS/y8perrcfoLk0jYuwuXa9iiB7J6jReuu7Drq4aE2/mX2ZLrg+PF7EfI7Ef
         IOxyACbnWFgAg2bxNIqHCTatF8ZMi7A6axNsKDsvZsYXVIU/Omw/HGlcxztyvOzbFLUO
         Wd1OVOZBLhY6HdtSlhIalBcn1PLJVVGEm993t/nHozzxGk9zQnv02VcBHCp4j2Ds/nYO
         GYq7IBe3GUcxmGQbGgCWsLwSy9mfW3cheiajnPpylz51hEAlIPtP7zM4nAaipZRdJHjL
         It73mvnfAcAJiVsW9ttG3lv8f8pncVOYOdRk1qYFMoq3EQprr/CFW3mDmxjTVkZ8fqX/
         /v+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=m+LBqNPjIzI/i9s16PMcLCo7oQ00z3NG9NsKpsashP4=;
        b=Hjk1ct0rO5XIMNwo6pdugAgPRc6fI0tN7eLbuQPA98rwIA89iR7M/K5FFcbz8JZVrq
         SHNmRMJHCaR92hvTk2lAr8ZAJhd5ztDvPcnHmbFcZ3mtBupDznGkGCwXvzrtpizcez3i
         81PFG0IrhyzQ6Hr5nmhvNkVovInDbWgeyn1F4LxGMN4euA7ij2Blr2EDCoBt+IpTKLRp
         C8+zJirSrsVMG5nOl+z4Zw4Y9dGiDKJGvlnXZpC+ll07R4nvL7JAOC78r/jeqRQb5TtB
         CkOze8qScXHkLr5uG3WlCL7lDbrMg7MskyDJglcT8Dlnx8jx/cdAUDN90Mfv8t1+RfED
         bcZQ==
X-Gm-Message-State: ANhLgQ0/horZa0fI6LtZMZY/BckJhojDn+vMBTpa6h/GvCEVu5ANNmfg
        gdeX7e7NyxkfF0ZBm++GE310DVUEYI7/
X-Google-Smtp-Source: ADFU+vuSZmpS1Lv5Y2YlOQwUVUT3i8v0Ev/ptDuGm8Q5/RE+iHg6qHDAHM4fAvW84XN9kAm7BD4iuXv8/SKz
X-Received: by 2002:a17:90a:d349:: with SMTP id i9mr2965528pjx.180.1585272770919;
 Thu, 26 Mar 2020 18:32:50 -0700 (PDT)
Date:   Thu, 26 Mar 2020 18:32:36 -0700
In-Reply-To: <20200327013239.238182-1-rajatja@google.com>
Message-Id: <20200327013239.238182-2-rajatja@google.com>
Mime-Version: 1.0
References: <20200327013239.238182-1-rajatja@google.com>
X-Mailer: git-send-email 2.25.1.696.g5e7596f4ac-goog
Subject: [PATCH v3 2/5] Input: atkbd: Expose function row physical map to userspace
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
2.25.1.696.g5e7596f4ac-goog

