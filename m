Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B46E41BAFE4
	for <lists+linux-input@lfdr.de>; Mon, 27 Apr 2020 23:03:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726817AbgD0VDI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 Apr 2020 17:03:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726285AbgD0VDH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 Apr 2020 17:03:07 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD1CBC03C1A8
        for <linux-input@vger.kernel.org>; Mon, 27 Apr 2020 14:03:07 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id b6so22083814ybo.8
        for <linux-input@vger.kernel.org>; Mon, 27 Apr 2020 14:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=UenMHbf1Eki3ulS1NlD3HIa7ITU5SNKYGq9xAbGt/6U=;
        b=bcE5NBfZAVrzbnAddyWS7c0iVSPd/JwzpbP4QwnsjnVArK/uRRruUd2axsbq+0TnN0
         U/Azd5ePJ6WeL8AV44CNCYAkr+v9j1WOgH47+xiMyqeiUQ4LfauJL+KAPLNh/BqF3OaS
         bhyMRXx1R5FpRY4ZmYwCxumUcHTiLg1KnsCm5CIgy+XQa3EmE94baxY70dFJkBGiUFae
         V50w7uWX4DEXY33wE7/R2BnFuDb33r/JXiGhqmBpvXfW8QZ5vzxvleX0LBkcTquS4mBU
         JrlPZO4YLbGLrLkBsk3WtdldLEvqZGfftlIfubPN1vR8ENtZqs2YV+kzcv4kKtGJJl75
         MVBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=UenMHbf1Eki3ulS1NlD3HIa7ITU5SNKYGq9xAbGt/6U=;
        b=A7GEgqak76+2E3FX8G2G4b8NeG29cR4UiqRg6OpvFG0xIb9yVgONchJaswgxf7b/T1
         M8iL0GS6heDF0vuk0TK/vXEDUd16jpYsTLzFDD2KGtqZfiE9ieEF45JPZpJW22u2//a+
         zaWWEtjJ92fwjRSwEtUjo/m2y4AfqusQf3wvPEpeJTfIXPGklJQad7kCain7FkGz3KO7
         ujG3KvTASTCdbwPUvgKD2kzewop3jFA83m4atEFia95VGgPQ75XrVAQKAfDtKWLdKxtf
         XagR0f6QfwsJ3fIZM+bNuncfX27Gs8yP6zTlNolS2FF0juIyGrQ/FXeQyAq2VtuXnPA8
         oKDA==
X-Gm-Message-State: AGi0PuYdDxTyL37aSRMyhC5jND0Wh2g9qeIdlVzzRE8652mZ0ktCedLz
        mwRWPqwWgnh8hanOJUys1Z/hNwRZBAls
X-Google-Smtp-Source: APiQypLClia/FVip1IDfKvS3pnMgAelhu03KQxqvNpZqioUA8EOBX0jl45LmV2zoIB9uLpQlOd63SxmQVWHi
X-Received: by 2002:a25:77d8:: with SMTP id s207mr37260773ybc.47.1588021386893;
 Mon, 27 Apr 2020 14:03:06 -0700 (PDT)
Date:   Mon, 27 Apr 2020 14:02:59 -0700
In-Reply-To: <20200427210259.91330-1-rajatja@google.com>
Message-Id: <20200427210259.91330-3-rajatja@google.com>
Mime-Version: 1.0
References: <20200427210259.91330-1-rajatja@google.com>
X-Mailer: git-send-email 2.26.2.303.gf8c07b1a785-goog
Subject: [PATCH v5 3/3] Input: atkbd: Receive and use physcode->keycode
 mapping from FW
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

Allow the firmware to specify the mapping between the physical
code and the linux keycode. This takes the form of a "linux,keymap"
property which is an array of u32 values, each value specifying
mapping for a key.

Signed-off-by: Rajat Jain <rajatja@google.com>
---
v5: Same as v4
v4: Property name "keymap" -> "linux,keymap"
v3: Don't save the FW mapping in atkbd device.
v2: Remove the Change-Id from the commit log

 drivers/input/keyboard/atkbd.c | 41 +++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
index 358e91f8888ff..9d7594dcc4a47 100644
--- a/drivers/input/keyboard/atkbd.c
+++ b/drivers/input/keyboard/atkbd.c
@@ -66,6 +66,9 @@ MODULE_PARM_DESC(terminal, "Enable break codes on an IBM Terminal keyboard conne
 
 #define MAX_FUNCTION_ROW_KEYS	24
 
+#define PHYSCODE(keymap)	((keymap >> 16) & 0xFFFF)
+#define KEYCODE(keymap)		(keymap & 0xFFFF)
+
 /*
  * Scancode to keycode tables. These are just the default setting, and
  * are loadable via a userland utility.
@@ -1032,6 +1035,38 @@ static unsigned int atkbd_oqo_01plus_scancode_fixup(struct atkbd *atkbd,
 	return code;
 }
 
+static int atkbd_get_keymap_from_fwnode(struct atkbd *atkbd)
+{
+	struct device *dev = &atkbd->ps2dev.serio->dev;
+	int i, n;
+	u32 *ptr;
+	u16 physcode, keycode;
+
+	/* Parse "linux,keymap" property */
+	n = device_property_count_u32(dev, "linux,keymap");
+	if (n <= 0 || n > ATKBD_KEYMAP_SIZE)
+		return -ENXIO;
+
+	ptr = kcalloc(n, sizeof(u32), GFP_KERNEL);
+	if (!ptr)
+		return -ENOMEM;
+
+	if (device_property_read_u32_array(dev, "linux,keymap", ptr, n)) {
+		dev_err(dev, "problem parsing FW keymap property\n");
+		kfree(ptr);
+		return -EINVAL;
+	}
+
+	memset(atkbd->keycode, 0, sizeof(atkbd->keycode));
+	for (i = 0; i < n; i++) {
+		physcode = PHYSCODE(ptr[i]);
+		keycode = KEYCODE(ptr[i]);
+		atkbd->keycode[physcode] = keycode;
+	}
+	kfree(ptr);
+	return 0;
+}
+
 /*
  * atkbd_set_keycode_table() initializes keyboard's keycode table
  * according to the selected scancode set
@@ -1039,13 +1074,16 @@ static unsigned int atkbd_oqo_01plus_scancode_fixup(struct atkbd *atkbd,
 
 static void atkbd_set_keycode_table(struct atkbd *atkbd)
 {
+	struct device *dev = &atkbd->ps2dev.serio->dev;
 	unsigned int scancode;
 	int i, j;
 
 	memset(atkbd->keycode, 0, sizeof(atkbd->keycode));
 	bitmap_zero(atkbd->force_release_mask, ATKBD_KEYMAP_SIZE);
 
-	if (atkbd->translated) {
+	if (!atkbd_get_keymap_from_fwnode(atkbd)) {
+		dev_dbg(dev, "Using FW keymap\n");
+	} else if (atkbd->translated) {
 		for (i = 0; i < 128; i++) {
 			scancode = atkbd_unxlate_table[i];
 			atkbd->keycode[i] = atkbd_set2_keycode[scancode];
@@ -1173,6 +1211,7 @@ static void atkbd_parse_fwnode_data(struct serio *serio)
 		atkbd->num_function_row_keys = n;
 		dev_dbg(dev, "FW reported %d function-row key locations\n", n);
 	}
+
 }
 
 /*
-- 
2.26.2.303.gf8c07b1a785-goog

