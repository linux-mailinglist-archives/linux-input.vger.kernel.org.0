Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5AFD1968CD
	for <lists+linux-input@lfdr.de>; Sat, 28 Mar 2020 19:59:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727191AbgC1S7d (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 28 Mar 2020 14:59:33 -0400
Received: from mail-pl1-f201.google.com ([209.85.214.201]:39731 "EHLO
        mail-pl1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727406AbgC1S7d (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 28 Mar 2020 14:59:33 -0400
Received: by mail-pl1-f201.google.com with SMTP id d11so9697341pll.6
        for <linux-input@vger.kernel.org>; Sat, 28 Mar 2020 11:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=OGNXs3NwKjk0dDeSHSXg81YijfbEbudE8mDeHpkOVOE=;
        b=Sj3kS01eYr5WT4Fc1GvJ9Y3z7uu2N1FDeotd7kk6k8/7QydjsRgg7y84YBxLjH/5px
         Ja3168nhkht1ak+6owEmdvZ08ApoeSJby75xk4dDbRLESLOVZEpdwlNibYYRZQQVR8UD
         AailkVpZN+syYaACa2t7ZUmwNSo67n4iSXI6fsCP6dF7GaFSttHKThBML1fByuRpO8cX
         nuzAJhnN2SdaZDERJ9Hgi8AUVbkgX0onXkY2nklQcYdw4djr2Ql11NDBNULzqIisWuOg
         SPsyx5uT6uX9ed7pM+D7tbmKQjvbQICjbFQ8LwFFQF3x+vA/VV3VuIV5vBMFqV7vdPs/
         edyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=OGNXs3NwKjk0dDeSHSXg81YijfbEbudE8mDeHpkOVOE=;
        b=UdneL2GAHAA397QaU5wDUkh/7FKpe1S3Vv78umwoSX9JywLxNgYSYWj3RJEbVGNy6m
         MoHaMSbaFo2SlOVNnpdRmv3t4VQPnbrO5+VPZYG+BxrrXmCuci5JWPOgcd+HPkvvHpkQ
         kSBhNMbTSly/dlESkHpBmwtFaI0y9KVKx4Q1VHywyN9o2p2NoCmxVBLTSUkSkrptFpkp
         iY3lFN2tRryT+bzH56gAe06Dl2mj3PhSwTDlg86nMHsRA3OSLvnWUFdxuuoPAnBk7ohZ
         TUWJ8lbEXGJzhRbOI+7qrSO45pcNwFfwA9C8SGTW9xzeLPB7eahbRwFaAJDHsNPnIg64
         HNTg==
X-Gm-Message-State: ANhLgQ0KXzKQvmpdwPbuYW/XsGp6DFwd/tywfnQ0SxFqLG4eX2EiFZ6r
        YDLXMsTo5nKrVQKYEvwbDt+QA3uzik//
X-Google-Smtp-Source: ADFU+vvC8nj/oK4By2+uBwrMdTDFPDLZ8i8ninPAa5Vf86oXT8sTO+R/ULp/peL9EAEGwoArfK8NIXRQWcTR
X-Received: by 2002:a63:6d43:: with SMTP id i64mr5379169pgc.201.1585421972254;
 Sat, 28 Mar 2020 11:59:32 -0700 (PDT)
Date:   Sat, 28 Mar 2020 11:59:15 -0700
In-Reply-To: <20200328185916.98423-1-rajatja@google.com>
Message-Id: <20200328185916.98423-4-rajatja@google.com>
Mime-Version: 1.0
References: <20200328185916.98423-1-rajatja@google.com>
X-Mailer: git-send-email 2.26.0.rc2.310.g2932bb562d-goog
Subject: [PATCH v4 4/5] Input: atkbd: Receive and use physcode->keycode
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
v4: Property name "keymap" -> "linux,keymap"
v3: Don't save the FW mapping in atkbd device.
v2: Remove the Change-Id from the commit log

 drivers/input/keyboard/atkbd.c | 41 +++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
index 3b20aba1861cd..3379fb5e7169b 100644
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
2.26.0.rc2.310.g2932bb562d-goog

