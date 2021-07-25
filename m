Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE63E3D4DB8
	for <lists+linux-input@lfdr.de>; Sun, 25 Jul 2021 15:29:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbhGYMse (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 25 Jul 2021 08:48:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230075AbhGYMsd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 25 Jul 2021 08:48:33 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8C73C061760;
        Sun, 25 Jul 2021 06:29:03 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 9-20020a05600c26c9b02901e44e9caa2aso4521187wmv.4;
        Sun, 25 Jul 2021 06:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=v7cnCuDq5ZGSk7DH1MRlBzKJ5po3ZMRHzGSaZzKFHNw=;
        b=ST9BdOPGw0sa/vFoWmxuFKmfHm+IKXQU/QOk1XJFzl8g4G9sDehR8fTpt8MF4Yxn54
         9kKQxj4vjrowaFcx+3n54suI3yz6SCJUIubmDn7lq8UlXWwHF95BdiWhnh1IadNxc1jT
         5HJYD6xcaMBvM2MZgNm8PG4rOTDeebEGophTxAseKlq6GoeJUYh30/IHeq8p7ZY0GGa1
         AB6R+8DFb4bth6/SpqU5Ujj2ofacqmSypbgS12aQJVRMnrpNkl6ICWjfNJOYrxx5Mc05
         2mX/h2FTSX4mXGtAJKUhzdlvVEB4D177kwxUYpQDRqXzqOOq8PyN25vU+XLIOAM9oHNL
         s86w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=v7cnCuDq5ZGSk7DH1MRlBzKJ5po3ZMRHzGSaZzKFHNw=;
        b=I+GUNKHxH507UslChulcjf1hJDlocSKC8Il26JyDXlrma7V2ndNYSw17Cfp27wb2Ec
         j9pF6iLimWn8LCIvEMimmUwU6ysf2IeFcMKDaFhYhwQrRGuCT923VhE7AryWArxnRiN+
         mSoXRFY+kGvwUScSlQ4FJY0SwD4tzZoJp7l8FnD2DjdwVtJ9MGKTHpX3HqPmr5Jbq1L+
         2k6Ps25cPgBcx37T5KL4dCRVt0D6Ngm25p2DJ1SpExozh9VrMIxr87VjybO/DGI7DwYR
         uNb4YI49AFNEbS2atoV7icJBZFXp/Yyu8Vz0KmmT9bszo6GtPN+Tyugzq0G4zWSJqQW+
         hYaw==
X-Gm-Message-State: AOAM533DFxhNslUeH7dgBIe+ksOcq4P378UD15cFunJTL6kyhzKAKMxe
        ztmJK5TIW8Ja2uaCIPPnOso=
X-Google-Smtp-Source: ABdhPJzA+IGhEWdT+aE8IqiZIGsJX3lbPJmCeIo1NpXRUJmQvN7dqZr+rBmvc3mOuTwwFJrKdeJEeg==
X-Received: by 2002:a05:600c:2942:: with SMTP id n2mr2230863wmd.152.1627219742578;
        Sun, 25 Jul 2021 06:29:02 -0700 (PDT)
Received: from pc ([196.235.233.206])
        by smtp.gmail.com with ESMTPSA id q17sm4010433wre.3.2021.07.25.06.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jul 2021 06:29:01 -0700 (PDT)
Date:   Sun, 25 Jul 2021 14:28:58 +0100
From:   Salah Triki <salah.triki@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        gregkh@linuxfoundation.org
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] hid-elo: update the reference count of the usb device
 structure
Message-ID: <20210725132858.GA614754@pc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Use usb_get_dev() to increment the reference count of the usb device
structure in order to avoid releasing the structure while it is still in
use. And use usb_put_dev() to decrement the reference count and thus,
when it will be equal to 0 the structure will be released.

Signed-off-by: Salah Triki <salah.triki@gmail.com>
---
Change since v1:
	Modification of the description

 drivers/hid/hid-elo.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-elo.c b/drivers/hid/hid-elo.c
index 0d22713a3874..383dfda8c12f 100644
--- a/drivers/hid/hid-elo.c
+++ b/drivers/hid/hid-elo.c
@@ -228,13 +228,15 @@ static int elo_probe(struct hid_device *hdev, const struct hid_device_id *id)
 {
 	struct elo_priv *priv;
 	int ret;
+	struct usb_device *udev;
 
 	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
 	INIT_DELAYED_WORK(&priv->work, elo_work);
-	priv->usbdev = interface_to_usbdev(to_usb_interface(hdev->dev.parent));
+	udev = interface_to_usbdev(to_usb_interface(hdev->dev.parent));
+	priv->usbdev = usb_get_dev(udev);
 
 	hid_set_drvdata(hdev, priv);
 
@@ -265,6 +267,8 @@ static void elo_remove(struct hid_device *hdev)
 {
 	struct elo_priv *priv = hid_get_drvdata(hdev);
 
+	usb_put_dev(priv->usbdev);
+
 	hid_hw_stop(hdev);
 	cancel_delayed_work_sync(&priv->work);
 	kfree(priv);
-- 
2.25.1

