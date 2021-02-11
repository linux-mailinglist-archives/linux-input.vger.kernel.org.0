Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64DFB319323
	for <lists+linux-input@lfdr.de>; Thu, 11 Feb 2021 20:32:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230116AbhBKTbq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 11 Feb 2021 14:31:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229873AbhBKTbp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 11 Feb 2021 14:31:45 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C43CC061756
        for <linux-input@vger.kernel.org>; Thu, 11 Feb 2021 11:31:05 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id k22so3861752pll.6
        for <linux-input@vger.kernel.org>; Thu, 11 Feb 2021 11:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kotmFBgmtgcNqI69WqTGMPvuAgsmLZNkK6WDsoB+PrI=;
        b=Q6M2/HoeepexObF2fScXQqQD6hCCN/9O3vroFylWEqqowK4Ow5mQ+euZF3eiapI4rB
         T+0xOhqMLfVd0KkM0F8P+hZqLBf1TLlmd5cuDCUk/F9HEAmIYQWpsrzpKPfr8VAqmKUB
         mqMS9iXpbuPw9WP6/9bjsnaGmUnx/Tk62BgEbE+cmgQYeQCvK8LbI4dIVm0vL2nmm/xR
         X9L2sGqTkQNzXiRJhJXh/Ps0hcPc8ik5LT/fQWfBcER5PqvVwawMoGOcNOwllsOSrkXx
         SLSrZVO3gs/fedNaVJF4fFc/By9OBFiTwCLMaWCllt4wr237dJzy5QoaK+LqDhiZjHt8
         JD9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kotmFBgmtgcNqI69WqTGMPvuAgsmLZNkK6WDsoB+PrI=;
        b=lBlplxuBmsxt83u5VsCSX7VS4/kN9iJrH1TlA7Db0kGdU9wfrDUKnE0GTzSwztWCJX
         FGm/1TNiFmC0FjpT31sRk/fqpoU9X+wfSnCR+rwtyqVpnfcnJpZaObJ3VsjEpeI+JYJr
         +H3esju3kym7ccQgyWw5g9KpgMTiqeyqDi9RJROAMXlplBD/5jtt3Ro4IwQUsSDr5FX2
         1KYXi7h/4Cl6+kwPjY/Rk4UHOK7psKGS7MZMZLpPPMQuSwkgYQzWl+YjG3cXGCmPkXjY
         LM+S1RNBB5sKKyjSNt8he8N9eYJp5V3E/y3Mrsy1sHryZSfCWM3y1CbQf0cjtyWHTckx
         u3kw==
X-Gm-Message-State: AOAM53156wba3b+VLlWwcmLBVxLlGjhXQPpD9HCh/zJhjyv0rPi5kVJe
        OJx1jAo66Y9EMwOlGf4R5YTVKNMxcWCs+g==
X-Google-Smtp-Source: ABdhPJztSBZL0nEg9073t26ubcszP/E9h9eqZwi74GVS0lj/UHCUrn+I0Np1x15AcU09OIe8Sx199A==
X-Received: by 2002:a17:90a:a897:: with SMTP id h23mr5365081pjq.224.1613071864503;
        Thu, 11 Feb 2021 11:31:04 -0800 (PST)
Received: from horus.lan (71-34-94-168.ptld.qwest.net. [71.34.94.168])
        by smtp.gmail.com with ESMTPSA id s7sm6736559pgb.89.2021.02.11.11.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 11:31:04 -0800 (PST)
From:   Jason Gerecke <killertofu@gmail.com>
X-Google-Original-From: Jason Gerecke <jason.gerecke@wacom.com>
To:     linux-input@vger.kernel.org
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jason Gerecke <jason.gerecke@wacom.com>
Subject: [PATCH] HID: hiddev: Return specific error codes on connect failure
Date:   Thu, 11 Feb 2021 11:30:59 -0800
Message-Id: <20210211193059.70291-1-jason.gerecke@wacom.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The only caller of this function only cares about gross success/failure
but we still might as well resolve the following smatch warning and fix
the other error paths as well:

    hiddev.c:894 hiddev_connect() warn: returning -1 instead of -ENOMEM is sloppy

Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
---
 drivers/hid/usbhid/hiddev.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/usbhid/hiddev.c b/drivers/hid/usbhid/hiddev.c
index 45e0b1c75cb1..2fb2991dbe4c 100644
--- a/drivers/hid/usbhid/hiddev.c
+++ b/drivers/hid/usbhid/hiddev.c
@@ -887,11 +887,11 @@ int hiddev_connect(struct hid_device *hid, unsigned int force)
 				break;
 
 		if (i == hid->maxcollection)
-			return -1;
+			return -EINVAL;
 	}
 
 	if (!(hiddev = kzalloc(sizeof(struct hiddev), GFP_KERNEL)))
-		return -1;
+		return -ENOMEM;
 
 	init_waitqueue_head(&hiddev->wait);
 	INIT_LIST_HEAD(&hiddev->list);
@@ -905,7 +905,7 @@ int hiddev_connect(struct hid_device *hid, unsigned int force)
 		hid_err(hid, "Not able to get a minor for this device\n");
 		hid->hiddev = NULL;
 		kfree(hiddev);
-		return -1;
+		return retval;
 	}
 
 	/*
-- 
2.30.1

