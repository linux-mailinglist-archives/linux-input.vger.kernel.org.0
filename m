Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7047C78675C
	for <lists+linux-input@lfdr.de>; Thu, 24 Aug 2023 08:16:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240015AbjHXGPe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 24 Aug 2023 02:15:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240088AbjHXGPO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 24 Aug 2023 02:15:14 -0400
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 055F710F4
        for <linux-input@vger.kernel.org>; Wed, 23 Aug 2023 23:15:12 -0700 (PDT)
Date:   Thu, 24 Aug 2023 06:14:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1692857708; x=1693116908;
        bh=8sk89UlcqL9XG6lGf8oHAA4Tl8QyXr9EsvcswnO8N6A=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=C7EXUxS0W87tejNsZutcufC5uiAxyLDCMeRBSzjdIi3GtjZGsRDtRa/PEfFPoVWYW
         B2Y8ETX7OVsjnTw5dLaf3nH00fXAEECXPPNoybec/lBl3xIVcsfpYwiiMxVFJR7Kvv
         PgaKLWszMU/gCtllI/huD2Meytt7C7D9TYz/2RliUcCOkqd0Et+ivE8Ikw7EFg5eBY
         GF80QhA6PqLEzDituG2AQ7GDqHxcNgippCe6N9F6LxyP/ILUOGAVYtg7tikdu6hpSc
         b2ecIdOLTZRVFzLtZeG+SEXfZ1kvAYgvoR0qEvBneXp/L0Sjon3hjJbSnQ1fMXEe73
         X930OsiNjr5jA==
To:     linux-input@vger.kernel.org
From:   Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rahul Rameshbabu <rrameshbabu@nvidia.com>
Subject: [PATCH HID 3/3] HID: nvidia-shield: Reference hid_device devm allocation of input_dev name
Message-ID: <20230824061308.222021-4-sergeantsagara@protonmail.com>
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

From: Rahul Rameshbabu <rrameshbabu@nvidia.com>

Use hid_device for devm allocation of the input_dev name to avoid a
use-after-free. input_unregister_device would trigger devres cleanup of all
resources associated with the input_dev, free-ing the name. The name would
subsequently be used in a uevent fired at the end of unregistering the
input_dev.

Reported-by: Maxime Ripard <mripard@kernel.org>
Closes: https://lore.kernel.org/linux-input/ZOZIZCND+L0P1wJc@penguin/T/#m44=
3f3dce92520f74b6cf6ffa8653f9c92643d4ae
Fixes: 09308562d4af ("HID: nvidia-shield: Initial driver implementation wit=
h Thunderstrike support")
Suggested-by: Maxime Ripard <mripard@kernel.org>
Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Rahul Rameshbabu <rrameshbabu@nvidia.com>
---
 drivers/hid/hid-nvidia-shield.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-nvidia-shield.c b/drivers/hid/hid-nvidia-shiel=
d.c
index a928ad2be62d..084179a6be86 100644
--- a/drivers/hid/hid-nvidia-shield.c
+++ b/drivers/hid/hid-nvidia-shield.c
@@ -164,7 +164,7 @@ static struct input_dev *shield_allocate_input_dev(stru=
ct hid_device *hdev,
 =09idev->id.product =3D hdev->product;
 =09idev->id.version =3D hdev->version;
 =09idev->uniq =3D hdev->uniq;
-=09idev->name =3D devm_kasprintf(&idev->dev, GFP_KERNEL, "%s %s", hdev->na=
me,
+=09idev->name =3D devm_kasprintf(&hdev->dev, GFP_KERNEL, "%s %s", hdev->na=
me,
 =09=09=09=09    name_suffix);
 =09if (!idev->name)
 =09=09goto err_name;
--=20
2.40.1


