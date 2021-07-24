Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51B5B3D4A11
	for <lists+linux-input@lfdr.de>; Sat, 24 Jul 2021 23:20:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229749AbhGXUjt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 24 Jul 2021 16:39:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbhGXUjs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 24 Jul 2021 16:39:48 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 312ECC061575;
        Sat, 24 Jul 2021 14:20:20 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id da26so6349462edb.1;
        Sat, 24 Jul 2021 14:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=TVsrRmuCxIDTU92vEnsCByOwM7gov1/gE6GIbq2IbxA=;
        b=hLWfwKBrq92s9szZs40HRbtE6zX1jKISQxkVQ9a28msYg2c1pg/3NPWRJSIFDVlulu
         f7Jn04tmo87qagVP6zB2UI+DaL0wiY63FmO65ZK4GZIdP9ecGVSzCB2tpCUkJ5tXFUYU
         5E5Ojfa6/Zs86uElYlIYkRB/EmeyY1LrsxS1acIi0tsG59hJqtaP92I+D4sNTOidRDE6
         x27bkkGMYipBvi0sGT76ix39JvJizf8RMVZEVhqVEwhZjGuc3iN/DRHybhLK1Xk6BVwx
         S99DWjC8qYmFhOlruep15R1zuSsZHO2wGdg9KhKShHnuZHdDjbW15jlTtfXktUf3XH5b
         jYEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=TVsrRmuCxIDTU92vEnsCByOwM7gov1/gE6GIbq2IbxA=;
        b=pZ5CYNHpH+zz54Pf/RWuF5ykIHLe2PdurnkGCv1xA/Bt0bBDH3bDJ/kvowK/uFfs87
         Ah6WgevksnFPeVSdHbDSxP6KOxz7Zt9QTnRLJCVwF2y79SJK242Iuziucpu7vzBglF8j
         /JCfUwHFxtTRx/qd1boALv+51NTAHzLt33St2eiui4LZKo404uBc6DmsUUnHERGrrexB
         yfghjO5JuuIk3tVEA4RiOfM3DV6dv7j2gsWEpQv3YudRJNCmj0Jc+X3kjDU0I7GV778q
         imnOYBsDRsfcH7VkrbD+2QjB6At+rJqYejquKZkLv0+aR2MhUtVmlkcfWmUgEZO7PdzM
         OAkQ==
X-Gm-Message-State: AOAM531wO+txGcyK7PQAees7Vav5Rt/2cUym6pBiq1QsarOQpqxReiwb
        pYReHXDzDgNsUJH1PNts8+Q=
X-Google-Smtp-Source: ABdhPJwXOX3Zxt3mBAjrWf7x/TcDOo7rdMeNq9Tq8LhuoAYnGs3zql/BTOovjUL8Z8rvS1+QZigO5w==
X-Received: by 2002:aa7:c74e:: with SMTP id c14mr12985143eds.40.1627161618871;
        Sat, 24 Jul 2021 14:20:18 -0700 (PDT)
Received: from pc ([196.235.233.206])
        by smtp.gmail.com with ESMTPSA id f1sm14948971edt.51.2021.07.24.14.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 14:20:18 -0700 (PDT)
Date:   Sat, 24 Jul 2021 22:20:16 +0100
From:   Salah Triki <salah.triki@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        gregkh@linuxfoundation.org
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] misc: powermate: update the reference count of the usb
 interface structure
Message-ID: <20210724212016.GA568154@pc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Use usb_get_intf() and usb_put_intf() in order to update the reference
count of the usb interface structure.

Signed-off-by: Salah Triki <salah.triki@gmail.com>
---
 drivers/input/misc/powermate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/input/misc/powermate.c b/drivers/input/misc/powermate.c
index c4e0e1886061..69dc3347478a 100644
--- a/drivers/input/misc/powermate.c
+++ b/drivers/input/misc/powermate.c
@@ -337,7 +337,7 @@ static int powermate_probe(struct usb_interface *intf, const struct usb_device_i
 		goto fail3;
 
 	pm->udev = udev;
-	pm->intf = intf;
+	pm->intf = usb_get_intf(intf);
 	pm->input = input_dev;
 
 	usb_make_path(udev, pm->phys, sizeof(pm->phys));
@@ -428,6 +428,7 @@ static void powermate_disconnect(struct usb_interface *intf)
 		usb_free_urb(pm->irq);
 		usb_free_urb(pm->config);
 		powermate_free_buffers(interface_to_usbdev(intf), pm);
+		usb_put_intf(pm->intf);
 
 		kfree(pm);
 	}
-- 
2.25.1

