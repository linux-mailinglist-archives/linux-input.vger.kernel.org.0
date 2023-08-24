Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADF4D78675A
	for <lists+linux-input@lfdr.de>; Thu, 24 Aug 2023 08:15:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240014AbjHXGPA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 24 Aug 2023 02:15:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240085AbjHXGOt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 24 Aug 2023 02:14:49 -0400
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A44F81725
        for <linux-input@vger.kernel.org>; Wed, 23 Aug 2023 23:14:40 -0700 (PDT)
Date:   Thu, 24 Aug 2023 06:14:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1692857677; x=1693116877;
        bh=mJOsIarCJFq1yZ+dQYTuCbLEkIrOjjJIo4ByKQ8V7j4=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=PYh0MvXBfhX0pqBFJ4kH1XopDp6XDVko6KlRXpcUWFVeYcOW+YCqzNuq2gdzyWDM1
         HsCaNiSjhOYQr1pl+gDKQo2VhTbDA8if6QlfRMqbsWYIxcOie2JFEM9IbjDR/qltag
         sBicuplKjlny+tYRuLKSoYtaUl6GCzPAQCF7rz5FKiHywACw0SB5MqwV1UxTAk2rjs
         hnQyMPyTqMykK48KnXz563NIwSjvGBAN7rd/z5vPhCaw+MGODiV92iUOIEJULPvEGg
         tvWdBngI3TX+jPWIQlTo/AOSSdjQaPHKLlMSObueWzP5wnuc0WrAPP2HvGyO8laU4H
         KEx3+hQ7F1VOA==
To:     linux-input@vger.kernel.org
From:   Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rahul Rameshbabu <sergeantsagara@protonmail.com>
Subject: [PATCH HID 2/3] HID: multitouch: Correct devm device reference for hidinput input_dev name
Message-ID: <20230824061308.222021-3-sergeantsagara@protonmail.com>
In-Reply-To: <20230824061308.222021-1-sergeantsagara@protonmail.com>
References: <20230824061308.222021-1-sergeantsagara@protonmail.com>
Feedback-ID: 26003777:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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

Reported-by: Maxime Ripard <mripard@kernel.org>
Closes: https://lore.kernel.org/linux-input/ZOZIZCND+L0P1wJc@penguin/T/#m44=
3f3dce92520f74b6cf6ffa8653f9c92643d4ae
Fixes: c08d46aa805b ("HID: multitouch: devm conversion")
Suggested-by: Maxime Ripard <mripard@kernel.org>
Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Rahul Rameshbabu <sergeantsagara@protonmail.com>
---
 drivers/hid/hid-multitouch.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index e31be0cb8b85..521b2ffb4244 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -1594,7 +1594,6 @@ static void mt_post_parse(struct mt_device *td, struc=
t mt_application *app)
 static int mt_input_configured(struct hid_device *hdev, struct hid_input *=
hi)
 {
 =09struct mt_device *td =3D hid_get_drvdata(hdev);
-=09char *name;
 =09const char *suffix =3D NULL;
 =09struct mt_report_data *rdata;
 =09struct mt_application *mt_application =3D NULL;
@@ -1645,15 +1644,9 @@ static int mt_input_configured(struct hid_device *hd=
ev, struct hid_input *hi)
 =09=09break;
 =09}
=20
-=09if (suffix) {
-=09=09name =3D devm_kzalloc(&hi->input->dev,
-=09=09=09=09    strlen(hdev->name) + strlen(suffix) + 2,
-=09=09=09=09    GFP_KERNEL);
-=09=09if (name) {
-=09=09=09sprintf(name, "%s %s", hdev->name, suffix);
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


