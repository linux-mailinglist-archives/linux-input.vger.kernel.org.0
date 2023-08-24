Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02D2978675B
	for <lists+linux-input@lfdr.de>; Thu, 24 Aug 2023 08:15:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240013AbjHXGPA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 24 Aug 2023 02:15:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240014AbjHXGOb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 24 Aug 2023 02:14:31 -0400
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85FE310F9
        for <linux-input@vger.kernel.org>; Wed, 23 Aug 2023 23:14:29 -0700 (PDT)
Date:   Thu, 24 Aug 2023 06:14:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1692857665; x=1693116865;
        bh=4XKRv0EyMFF/Fs9/hSrqMLH5iIDEpHodNHfvMuf+WWU=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=ujsTgwn4V1eKEVZx94ngRjgFS+ASPqgEHkMZ6NvNCDcyqLbVBpDLB8vq6DJlhJ4lM
         dzsuWjPF89dnv/iYn6R1a+YcFO682NQb4PHwH/98rYULbtkO/YjooXNWDI5pwMQi8e
         kLoXgNXwed2zs98x/tEhhGK3UoxqlKEhulPqMrYEEeCsQMNhkaFqkQm3EqgPxiW3N+
         /HR6XDRm8qVHmhtQ5K+IU2mmo4Vn+qdcq4InQzr0C7TMMsMyMx243zBPnNrwXabLrV
         qqIUM3HNzeY8fpVR2/L3UKHjsgA2Lz7scs5nT9/pt6f2SG1SGVk7S58/x4nJuCS9Nd
         ZZpu3WNVeqK5Q==
To:     linux-input@vger.kernel.org
From:   Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rahul Rameshbabu <sergeantsagara@protonmail.com>,
        syzbot+3a0ebe8a52b89c63739d@syzkaller.appspotmail.com
Subject: [PATCH HID 1/3] HID: uclogic: Correct devm device reference for hidinput input_dev name
Message-ID: <20230824061308.222021-2-sergeantsagara@protonmail.com>
In-Reply-To: <20230824061308.222021-1-sergeantsagara@protonmail.com>
References: <20230824061308.222021-1-sergeantsagara@protonmail.com>
Feedback-ID: 26003777:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Reference the HID device rather than the input device for the devm
allocation of the input_dev name. Referencing the input_dev would lead to a
use-after-free when the input_dev was unregistered and subsequently fires a
uevent that depends on the name. At the point of firing the uevent, the
name would be freed by devres management.

Use devm_kasprintf to simplify the logic for allocating memory and
formatting the input_dev name string.

Reported-by: syzbot+3a0ebe8a52b89c63739d@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-input/ZOZIZCND+L0P1wJc@penguin/T/
Reported-by: Maxime Ripard <mripard@kernel.org>
Closes: https://lore.kernel.org/linux-input/ZOZIZCND+L0P1wJc@penguin/T/#m44=
3f3dce92520f74b6cf6ffa8653f9c92643d4ae
Fixes: cce2dbdf258e ("HID: uclogic: name the input nodes based on their too=
l")
Suggested-by: Maxime Ripard <mripard@kernel.org>
Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Rahul Rameshbabu <sergeantsagara@protonmail.com>
---
 drivers/hid/hid-uclogic-core.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/hid/hid-uclogic-core.c b/drivers/hid/hid-uclogic-core.=
c
index f67835f9ed4c..ad74cbc9a0aa 100644
--- a/drivers/hid/hid-uclogic-core.c
+++ b/drivers/hid/hid-uclogic-core.c
@@ -85,10 +85,8 @@ static int uclogic_input_configured(struct hid_device *h=
dev,
 {
 =09struct uclogic_drvdata *drvdata =3D hid_get_drvdata(hdev);
 =09struct uclogic_params *params =3D &drvdata->params;
-=09char *name;
 =09const char *suffix =3D NULL;
 =09struct hid_field *field;
-=09size_t len;
 =09size_t i;
 =09const struct uclogic_params_frame *frame;
=20
@@ -146,14 +144,9 @@ static int uclogic_input_configured(struct hid_device =
*hdev,
 =09=09}
 =09}
=20
-=09if (suffix) {
-=09=09len =3D strlen(hdev->name) + 2 + strlen(suffix);
-=09=09name =3D devm_kzalloc(&hi->input->dev, len, GFP_KERNEL);
-=09=09if (name) {
-=09=09=09snprintf(name, len, "%s %s", hdev->name, suffix);
-=09=09=09hi->input->name =3D name;
-=09=09}
-=09}
+=09if (suffix)
+=09=09hi->input->name =3D devm_kasprintf(&hdev->dev, GFP_KERNEL,
+=09=09=09=09=09=09 "%s %s", hdev->name, suffix);
=20
 =09return 0;
 }
--=20
2.40.1


