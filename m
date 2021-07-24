Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97DE03D49D0
	for <lists+linux-input@lfdr.de>; Sat, 24 Jul 2021 22:24:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229625AbhGXToI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 24 Jul 2021 15:44:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbhGXToI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 24 Jul 2021 15:44:08 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEEFDC061575;
        Sat, 24 Jul 2021 13:24:38 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id n2so6177627eda.10;
        Sat, 24 Jul 2021 13:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=UJSgRDnKmcn38dme24vgWVlBH8IXwNvRexCHUMPGjgI=;
        b=pJ9JEfxxRSkc3z5njHjSIElEWxpSPtFM/aE5KREQcbENKS8HZCQoMVVR3AL9h7cxge
         eRAocvj51kRB9f79wZf5iYSMn3XYHqrDdqNviOvYYcGC8eHf/q2viO6QiHjGFTRyL1x/
         kT8yg8UCCIo1U31DfRHfftOnkafgqGw3GM2qoyqnxiQtXBFD+zOr/C6GvYL1fMKQfA2X
         wM4NSWdIXpWYUziMLK3Xy3C8/Bep5+8IbRt6cNz6Dg5n3NkSjsAjR5ZoRNtSTkOjlR4a
         6UXfEznHjrtCFImTRZm9pHTS87DmV2EFvSIodsv6RH58wrVRcBCn3cuKX0xUjjuwWmcG
         74lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=UJSgRDnKmcn38dme24vgWVlBH8IXwNvRexCHUMPGjgI=;
        b=iWdeq3s42mszi12razJfaP9msGQ5sxnL+g4s5tWCWLaX5ua4+b9dZque6hyVdMmh6D
         TXsGHBj9XBLE6l1DgVQbWywgLdRn2p2e2GdBwaCQv5akXURcdBhlhurWnaa4acBbZVW/
         QFsPUIQudgTp52ucNRgosU/y/fGyl+y1OYW8pudo6NS8I2jbodyh6l56yRfQGgWKApyp
         0uUNFXNQgZ1/zTljsXaDZVlh0fYSYxlXwl7AlIgxKzIulqKcRDcVPekv797MRMkeSqFr
         qoIXCKh2MW/X+Q71yMFgSvblPQPNEfkZV88MaO8Z57LV0p8bupmR4iWSaMSTSVkqRBk1
         mSEQ==
X-Gm-Message-State: AOAM533w2xvZ3dZa6A14FACi5E42qNYuhdtpEfzUYogTKrrtvwhptv/V
        EYIMmk5JGjV5CUUbDs/8X3I=
X-Google-Smtp-Source: ABdhPJxXeCwGJ/SJ+OK886LLRORKTnsMYhMqEOWta6Q7pfX1zApFRiOliI1S17PKpTW2NkebhAHARA==
X-Received: by 2002:a50:cb8b:: with SMTP id k11mr12823796edi.55.1627158277409;
        Sat, 24 Jul 2021 13:24:37 -0700 (PDT)
Received: from pc ([196.235.233.206])
        by smtp.gmail.com with ESMTPSA id d8sm2877055edy.83.2021.07.24.13.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 13:24:36 -0700 (PDT)
Date:   Sat, 24 Jul 2021 21:24:34 +0100
From:   Salah Triki <salah.triki@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        gregkh@linuxfoundation.org
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] hid-elo: update the reference count of the usb device
 structure
Message-ID: <20210724202434.GA528986@pc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Use usb_get_dev() and usb_put_dev() in order to update the reference
count of the usb device structure.

Signed-off-by: Salah Triki <salah.triki@gmail.com>
---
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

