Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA81A7E2929
	for <lists+linux-input@lfdr.de>; Mon,  6 Nov 2023 16:55:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232032AbjKFPz1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Nov 2023 10:55:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231767AbjKFPz1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Nov 2023 10:55:27 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B5A4107
        for <linux-input@vger.kernel.org>; Mon,  6 Nov 2023 07:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1699286076;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=ctzJaUeyIfhgnVbxYv6nVLQNbJ7H1OTJ8HAdA+PLpEk=;
        b=NA6QQPRydw+X2N3qhmowYyO6asp5mnBpoXzv/jutLOaPrmEmY95Kirlv6aFQ0qXd0JGYVQ
        G71gbYzRXx/PqSr45/1+SDWglsOsFYxiTShZH3COJH5VkM+Ra8CkX1XBJeyxI8Mxi4WPDi
        63+HVi5RUJbOUtMhZI2yolc7hVNMCNc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-140-ArQwv8nCP1qaNzV3CCfvXw-1; Mon, 06 Nov 2023 10:54:32 -0500
X-MC-Unique: ArQwv8nCP1qaNzV3CCfvXw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7498E85C6E9;
        Mon,  6 Nov 2023 15:54:32 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.133])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7DABB502B;
        Mon,  6 Nov 2023 15:54:30 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        Shang Ye <yesh25@mail2.sysu.edu.cn>,
        gurevitch <mail@gurevit.ch>, Egor Ignatov <egori@altlinux.org>,
        Anton Zhilyaev <anton@cpp.in>
Subject: [PATCH] Input: atkbd - Skip ATKBD_CMD_GETID in translated mode
Date:   Mon,  6 Nov 2023 16:54:29 +0100
Message-ID: <20231106155429.5377-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

There have been multiple reports of keyboard issues on recent laptop models
which can be worked around by setting i8042.dumbkbd, with the downside
being this breaks the capslock LED.

It seems that these issues are caused by recent laptops getting confused by
ATKBD_CMD_GETID. Rather then adding and endless growing list of quirks for
this, lets just skip ATKBD_CMD_GETID alltogether when in translated mode.

The main goal of sending ATKBD_CMD_GETID is to skip binding to ps/2
mice/touchpads and those are never used in translated mode.

Examples of laptop models which benefit from skipping ATKBD_CMD_GETID:

* "HP Laptop 15s-fq2xxx", "HP laptop 15s-fq4xxx" and "HP Laptop 15-dy2xxx"
  models the kbd stops working for the first 2 - 5 minutes after boot
  (waiting for EC watchdog reset?)

* On "HP Spectre x360 13-aw2xxx" atkbd fails to probe the keyboard

* At least 9 different Lenovo models have issues with ATKBD_CMD_GETID, see:
  https://github.com/yaescallop/atkbd-nogetid

Note this also removes the "NCD terminal keyboards are only supported on
non-translating controllers." warning since that code is now unreachable.

This has been tested on:

1. A MSI B550M PRO-VDH WIFI desktop, where the i8042 controller is not
   in translated mode when no keyboard is plugged in and with a ps/2 kbd
   a "AT Translated Set 2 keyboard" /dev/input/event# node shows up

2. A Dell Latitude 9420 (always has a "AT Translated Set 2 keyboard")

3. A Lenovo ThinkPad X1 Yoga gen 8 (idem)

Reported-by: Shang Ye <yesh25@mail2.sysu.edu.cn>
Closes: https://lore.kernel.org/linux-input/886D6167733841AE+20231017135318.11142-1-yesh25@mail2.sysu.edu.cn/
Closes: https://github.com/yaescallop/atkbd-nogetid
Reported-by: gurevitch <mail@gurevit.ch>
Closes: https://lore.kernel.org/linux-input/2iAJTwqZV6lQs26cTb38RNYqxvsink6SRmrZ5h0cBUSuf9NT0tZTsf9fEAbbto2maavHJEOP8GA1evlKa6xjKOsaskDhtJWxjcnrgPigzVo=@gurevit.ch/
Reported-by: Egor Ignatov <egori@altlinux.org>
Closes: https://lore.kernel.org/all/20210609073333.8425-1-egori@altlinux.org/
Reported-by: Anton Zhilyaev <anton@cpp.in>
Closes: https://lore.kernel.org/linux-input/20210201160336.16008-1-anton@cpp.in/
Closes: https://bugzilla.redhat.com/show_bug.cgi?id=2086156
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Note this supersedes my previous atkbd series:
https://lore.kernel.org/linux-input/20231005201544.26983-1-hdegoede@redhat.com/
---
 drivers/input/keyboard/atkbd.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
index c92e544c792d..c5ffa79548d5 100644
--- a/drivers/input/keyboard/atkbd.c
+++ b/drivers/input/keyboard/atkbd.c
@@ -786,6 +786,20 @@ static int atkbd_probe(struct atkbd *atkbd)
 				 "keyboard reset failed on %s\n",
 				 ps2dev->serio->phys);
 
+/*
+ * On many modern laptops ATKBD_CMD_GETID may cause problems, on these laptops
+ * the controller is always in translated mode. In this mode mice/touchpads will
+ * not work. So in this case simply assume a keyboard is connected to avoid
+ * confusing some laptop keyboards.
+ *
+ * Using a fake keyboard id is ok in translated mode. Only atkbd_select_set()
+ * checks atkbd->id and in translated mode that is a no-op.
+ */
+	if (atkbd->translated) {
+		atkbd->id = 0xabba;
+		goto deactivate;
+	}
+
 /*
  * Then we check the keyboard ID. We should get 0xab83 under normal conditions.
  * Some keyboards report different values, but the first byte is always 0xab or
@@ -813,13 +827,7 @@ static int atkbd_probe(struct atkbd *atkbd)
 
 	atkbd->id = (param[0] << 8) | param[1];
 
-	if (atkbd->id == 0xaca1 && atkbd->translated) {
-		dev_err(&ps2dev->serio->dev,
-			"NCD terminal keyboards are only supported on non-translating controllers. "
-			"Use i8042.direct=1 to disable translation.\n");
-		return -1;
-	}
-
+deactivate:
 /*
  * Make sure nothing is coming from the keyboard and disturbs our
  * internal state.
-- 
2.41.0

