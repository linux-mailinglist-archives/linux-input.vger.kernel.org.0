Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 850F839F7DE
	for <lists+linux-input@lfdr.de>; Tue,  8 Jun 2021 15:31:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231344AbhFHNcz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 8 Jun 2021 09:32:55 -0400
Received: from mail-wr1-f42.google.com ([209.85.221.42]:45960 "EHLO
        mail-wr1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231162AbhFHNcy (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 8 Jun 2021 09:32:54 -0400
Received: by mail-wr1-f42.google.com with SMTP id z8so21558675wrp.12;
        Tue, 08 Jun 2021 06:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wEuLX4MTWn+pJYhHWbrYh6SkNlwnX089qNLnr2ydmko=;
        b=lfnSwiXeAH9qBOXwWNxVL2pLs14XyYV3BZWGiEGGVt8Cm60j1oU4F5BGZimNDI7mlL
         J0vYnsUAzLECGdFLSL8BMC1gK0Yoaf5xrBZ9t7JOMdiMzLdUEPzgIlk9JgY/1WGreA0G
         JYVqVWOT9ymub4A2rxujYjeSLzj5w9MGSgVDFjcQWUwvaTC96eg2pjxE+bnqP4AlZAFb
         Ii06fpzxVb2cRmEJh0XyE+/IJwC+u7+jmQ8IzSv0FyWgaEZ6vTwGHThzD0WnpslTJtt7
         DGf145wVLlkOEZqr2dLx83KHb+F08ADiCRRVVhVyWHGuDXnfogCS/XwqzTAZ4uTs8Irz
         0WnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wEuLX4MTWn+pJYhHWbrYh6SkNlwnX089qNLnr2ydmko=;
        b=mTgiSnL8Z8fForqbfP851zrKSvg2HxMfmYKE3MH6JJ/horNprsT1QojPoHWoBSoIig
         FqSaKaSdxr2BbYQs74nVU3+1FGtrSk0vbKiElhNQwJxWJLhHxy0aR37w3je6BlOCV+jv
         YoikjvBhdc5B/ICH2bs+GLoo5qc7i3KeYoxCwu4a8Re5UqAhSVid28DOJkvhwNJfnfS6
         V0j9e8nn36lc3Uk40Y6y3VkKsxpbhKyyqWw0mUk5rCcs+yQMKXsg9nkta4XlIme6m6aD
         J+THs/5MiG0Xc8edRIGOA0OtK5dbciURxkv1J/1zLzCc2DM6aPWecG9SIFgdz5IEwlYr
         a1tQ==
X-Gm-Message-State: AOAM5327zPnHaxVPY8VpNCi8b6DFYt/T2zoRSIyx/jpeevNZ/tWL8bYJ
        /B7+VHnjMM8KAH14QRNDWmQ=
X-Google-Smtp-Source: ABdhPJx07c4aV/eXaEUyn+rNnsIFmLptXbgG/NJ1nYPnlbhEx/+Dz2ruYneL06lVX/794s+mSbqinQ==
X-Received: by 2002:a5d:648e:: with SMTP id o14mr21934037wri.27.1623159001150;
        Tue, 08 Jun 2021 06:30:01 -0700 (PDT)
Received: from xws.localdomain ([37.58.58.229])
        by smtp.gmail.com with ESMTPSA id l9sm17445899wme.21.2021.06.08.06.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 06:30:00 -0700 (PDT)
From:   Maximilian Luz <luzmaximilian@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        =?UTF-8?q?Bla=C5=BE=20Hrastnik?= <blaz@mxxn.io>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maximilian Luz <luzmaximilian@gmail.com>
Subject: [PATCH] HID: surface-hid: Fix get-report request
Date:   Tue,  8 Jun 2021 15:29:51 +0200
Message-Id: <20210608132951.1392303-1-luzmaximilian@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Getting a report (e.g. feature report) from a device requires us to send
a request indicating which report we want to retrieve and then waiting
for the corresponding response containing that report. We already
provide the response structure to the request call, but the request
isn't marked as a request that expects a response. Thus the request
returns before we receive the response and the response buffer indicates
a zero length response due to that.

This essentially means that the get-report calls are broken and will
always indicate that a report of length zero has been read.

Fix this by appropriately marking the request.

Fixes: b05ff1002a5c ("HID: Add support for Surface Aggregator Module HID transport")
Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>
---
 drivers/hid/surface-hid/surface_hid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/surface-hid/surface_hid.c b/drivers/hid/surface-hid/surface_hid.c
index 3477b31611ae..a3a70e4f3f6c 100644
--- a/drivers/hid/surface-hid/surface_hid.c
+++ b/drivers/hid/surface-hid/surface_hid.c
@@ -143,7 +143,7 @@ static int ssam_hid_get_raw_report(struct surface_hid_device *shid, u8 rprt_id,
 	rqst.target_id = shid->uid.target;
 	rqst.instance_id = shid->uid.instance;
 	rqst.command_id = SURFACE_HID_CID_GET_FEATURE_REPORT;
-	rqst.flags = 0;
+	rqst.flags = SSAM_REQUEST_HAS_RESPONSE;
 	rqst.length = sizeof(rprt_id);
 	rqst.payload = &rprt_id;
 
-- 
2.31.1

