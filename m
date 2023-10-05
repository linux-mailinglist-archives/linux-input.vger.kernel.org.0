Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8FFE7BAB56
	for <lists+linux-input@lfdr.de>; Thu,  5 Oct 2023 22:16:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbjJEUQy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 Oct 2023 16:16:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229932AbjJEUQx (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 5 Oct 2023 16:16:53 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A8FA9F
        for <linux-input@vger.kernel.org>; Thu,  5 Oct 2023 13:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696536967;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FUVIX0bsP1YwJPBNVrMFSZ2cSUsDszFrIwqlzblMOxE=;
        b=UJBqk+QbZD34d1FRl6DM4RCrm/95uGXa9vcz2FYnPUba77urkuZWQ7L9SBDM6cSAepZO7Q
        q+WQjmuoli39BZxW1jBj4ckXc0FeovnYzceAXJmUwOC0Fz5ow9z/BQkY9esXr9i57ouQlo
        Vm7wb9v8YO9Ox+6VHE1F+qFbVyLhbm8=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-342-T43GsHaBPoWGoxAULZYRDA-1; Thu, 05 Oct 2023 16:15:55 -0400
X-MC-Unique: T43GsHaBPoWGoxAULZYRDA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 940993801BC3;
        Thu,  5 Oct 2023 20:15:54 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.10])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0E176111CD23;
        Thu,  5 Oct 2023 20:15:53 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH 1/3] Input: atkbd - add skip_commands module parameter
Date:   Thu,  5 Oct 2023 22:15:42 +0200
Message-ID: <20231005201544.26983-2-hdegoede@redhat.com>
In-Reply-To: <20231005201544.26983-1-hdegoede@redhat.com>
References: <20231005201544.26983-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

While debugging a keyboard issue on some HP laptops (see link)
adding i8042.dumbkbd helped to avoid the issue. So one of the commands
send by atkbd.c seemed to be the culprit.

Add a skip_commands option to help debug cases like this by adding
a bit-field which allows disabling a subset of the ps2_command()
calls the atkbd driver makes.

This also avoids the need to add special flags for each command
which atkbd needs to skip on certain models, like e.g. the existing
atkbd_skip_deactivate flag.

Link: https://bugzilla.redhat.com/show_bug.cgi?id=2086156
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
The next patch in this series replaces the atkbd_skip_deactivate flag
with using atbkd_skip_commands to avoid having 2 deactivate skip checks.
---
 drivers/input/keyboard/atkbd.c | 52 ++++++++++++++++++++++++++++------
 1 file changed, 44 insertions(+), 8 deletions(-)

diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
index c92e544c792d..7c16f9cc1e40 100644
--- a/drivers/input/keyboard/atkbd.c
+++ b/drivers/input/keyboard/atkbd.c
@@ -65,6 +65,10 @@ static bool atkbd_terminal;
 module_param_named(terminal, atkbd_terminal, bool, 0);
 MODULE_PARM_DESC(terminal, "Enable break codes on an IBM Terminal keyboard connected via AT/PS2");
 
+static int atkbd_skip_commands;
+module_param_named(skip_commands, atkbd_skip_commands, int, 0444);
+MODULE_PARM_DESC(skip_commands, "Bitfield where each bits skips a specific keyboard cmd (0 - 0x3f)");
+
 #define SCANCODE(keymap)	((keymap >> 16) & 0xFFFF)
 #define KEYCODE(keymap)		(keymap & 0xFFFF)
 
@@ -182,6 +186,13 @@ static const unsigned short atkbd_unxlate_table[128] = {
 #define ATKBD_XL_HANGEUL	0x10
 #define ATKBD_XL_HANJA		0x20
 
+#define ATKBD_SKIP_GETID	0x01l
+#define ATKBD_SKIP_ACTIVATE	0x02l
+#define ATKBD_SKIP_DEACTIVATE	0x04l
+#define ATKBD_SKIP_SETREP	0x08l
+#define ATKBD_SKIP_SETLEDS	0x10l
+#define ATKBD_SKIP_RESET_DEF	0x20l
+
 static const struct {
 	unsigned short keycode;
 	unsigned char set2;
@@ -592,6 +603,9 @@ static int atkbd_set_repeat_rate(struct atkbd *atkbd)
 	unsigned char param;
 	int i = 0, j = 0;
 
+	if (atkbd_skip_commands & ATKBD_SKIP_SETREP)
+		return 0;
+
 	while (i < ARRAY_SIZE(period) - 1 && period[i] < dev->rep[REP_PERIOD])
 		i++;
 	dev->rep[REP_PERIOD] = period[i];
@@ -609,6 +623,9 @@ static int atkbd_set_leds(struct atkbd *atkbd)
 	struct input_dev *dev = atkbd->dev;
 	unsigned char param[2];
 
+	if (atkbd_skip_commands & ATKBD_SKIP_SETLEDS)
+		return 0;
+
 	param[0] = (test_bit(LED_SCROLLL, dev->led) ? 1 : 0)
 		 | (test_bit(LED_NUML,    dev->led) ? 2 : 0)
 		 | (test_bit(LED_CAPSL,   dev->led) ? 4 : 0);
@@ -736,6 +753,9 @@ static int atkbd_activate(struct atkbd *atkbd)
 {
 	struct ps2dev *ps2dev = &atkbd->ps2dev;
 
+	if (atkbd_skip_commands & ATKBD_SKIP_ACTIVATE)
+		return 0;
+
 /*
  * Enable the keyboard to receive keystrokes.
  */
@@ -759,6 +779,9 @@ static void atkbd_deactivate(struct atkbd *atkbd)
 {
 	struct ps2dev *ps2dev = &atkbd->ps2dev;
 
+	if (atkbd_skip_commands & ATKBD_SKIP_DEACTIVATE)
+		return;
+
 	if (ps2_command(ps2dev, NULL, ATKBD_CMD_RESET_DIS))
 		dev_err(&ps2dev->serio->dev,
 			"Failed to deactivate keyboard on %s\n",
@@ -786,6 +809,13 @@ static int atkbd_probe(struct atkbd *atkbd)
 				 "keyboard reset failed on %s\n",
 				 ps2dev->serio->phys);
 
+/* Only skip probe for translated keyboards to avoid mis-identifying mice */
+	if (atkbd->translated && (atkbd_skip_commands & ATKBD_SKIP_GETID)) {
+		atkbd->id = 0xab00;
+		atkbd_deactivate(atkbd);
+		return 0;
+	}
+
 /*
  * Then we check the keyboard ID. We should get 0xab83 under normal conditions.
  * Some keyboards report different values, but the first byte is always 0xab or
@@ -802,7 +832,8 @@ static int atkbd_probe(struct atkbd *atkbd)
  * the LEDs off, which we want anyway.
  */
 		param[0] = 0;
-		if (ps2_command(ps2dev, param, ATKBD_CMD_SETLEDS))
+		if (!(atkbd_skip_commands & ATKBD_SKIP_SETLEDS) &&
+		    ps2_command(ps2dev, param, ATKBD_CMD_SETLEDS))
 			return -1;
 		atkbd->id = 0xabba;
 		return 0;
@@ -906,17 +937,21 @@ static int atkbd_reset_state(struct atkbd *atkbd)
  * Set the LEDs to a predefined state (all off).
  */
 
-	param[0] = 0;
-	if (ps2_command(ps2dev, param, ATKBD_CMD_SETLEDS))
-		return -1;
+	if (!(atkbd_skip_commands & ATKBD_SKIP_SETLEDS)) {
+		param[0] = 0;
+		if (ps2_command(ps2dev, param, ATKBD_CMD_SETLEDS))
+			return -1;
+	}
 
 /*
  * Set autorepeat to fastest possible.
  */
 
-	param[0] = 0;
-	if (ps2_command(ps2dev, param, ATKBD_CMD_SETREP))
-		return -1;
+	if (!(atkbd_skip_commands & ATKBD_SKIP_SETREP)) {
+		param[0] = 0;
+		if (ps2_command(ps2dev, param, ATKBD_CMD_SETREP))
+			return -1;
+	}
 
 	return 0;
 }
@@ -931,7 +966,8 @@ static void atkbd_cleanup(struct serio *serio)
 	struct atkbd *atkbd = atkbd_from_serio(serio);
 
 	atkbd_disable(atkbd);
-	ps2_command(&atkbd->ps2dev, NULL, ATKBD_CMD_RESET_DEF);
+	if (!(atkbd_skip_commands & ATKBD_SKIP_RESET_DEF))
+		ps2_command(&atkbd->ps2dev, NULL, ATKBD_CMD_RESET_DEF);
 }
 
 
-- 
2.41.0

