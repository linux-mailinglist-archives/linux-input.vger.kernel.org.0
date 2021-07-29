Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB4D13D9A32
	for <lists+linux-input@lfdr.de>; Thu, 29 Jul 2021 02:45:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232904AbhG2ApZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Jul 2021 20:45:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232890AbhG2ApZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Jul 2021 20:45:25 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3722AC061757;
        Wed, 28 Jul 2021 17:45:23 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id q3so4677672wrx.0;
        Wed, 28 Jul 2021 17:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=v7cnCuDq5ZGSk7DH1MRlBzKJ5po3ZMRHzGSaZzKFHNw=;
        b=qK4kP9aMdzNl3v5ZMFoQSSP9i8SlzpJY6ZT6nDqMJGCUCdHA7gjlqJCPYJh4LdZok9
         okA2UjqD44XRE+VV5Gv13WsmFMGetkAaVDBwUWIMat89C0ib38VdjS/H3D2XlqLWIMJG
         9IpmdhA2Sj1ZfPSld9UD6sAvcy3BLeimRYOWtBVlV4i49FNKpgYwDfQodQLZNY9mSfdF
         J6GsDw6S/FRkhHdqrAJSygWvHJ4axzyvSax4b2pjORnBhukksWGNCi83EH+OPhUKlJzb
         yoQIndGSHH5R36Ue/7Cn9hFeO3AzQ5S1i1pqdPVWQTMNMvL3xQGdaJmzjyKfEjzEeNYC
         S0ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=v7cnCuDq5ZGSk7DH1MRlBzKJ5po3ZMRHzGSaZzKFHNw=;
        b=I2CHukvJnPUG0201UsR1xHBWVAF4lvOe9flHY02MhVLYZzEHMA/+1/W//n5v8GySsg
         Hf/y+byNhwgzN7/Pz65tdOWafzPn4AmPrMG9VmDwNseMhdrLl7ANVV7dqe8pLIIsn+rg
         aecsSrC0uRRiZLt7d2xHOaCbts7pCUup37hg8wwSrLP35WIORe0xn8LtuokGbvDYLJtA
         BcgnAiApI4Tv/ECkhXVLHIOdOuuzJQynPpdK3gIPdVqUXF+o1K+ZNyD8NX3bTBTc4R1M
         xKfm36gitrFrjwUJPyF5pphYxL9Idr5NKm1PI3rx+3MUkxJpUMwdWz6kIZwVk2H4X7/c
         Ws+Q==
X-Gm-Message-State: AOAM532BE/gEze1tH8uFScHxCVB9QgitEe8TRW8rodsp+GkfBAqfWBCO
        baoSEIT/2AygZyu93WWO4DAiBrvGNNo=
X-Google-Smtp-Source: ABdhPJydHV0/TpHwnh7Pqvu2Yfv/vzGJcLDJNjBt+jjufRwprnYFLBtZNQlrUHeVm+qEU5W1Anu4Mw==
X-Received: by 2002:adf:cf07:: with SMTP id o7mr1821855wrj.216.1627519521830;
        Wed, 28 Jul 2021 17:45:21 -0700 (PDT)
Received: from pc ([196.235.233.206])
        by smtp.gmail.com with ESMTPSA id q72sm1954094wme.14.2021.07.28.17.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 17:45:21 -0700 (PDT)
Date:   Thu, 29 Jul 2021 01:45:12 +0100
From:   Salah Triki <salah.triki@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        gregkh@linuxfoundation.org
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RESEND v2] hid-elo: update the reference count of the usb device
 structure
Message-ID: <20210729004451.GA783805@pc>
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

