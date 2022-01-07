Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C338A48748C
	for <lists+linux-input@lfdr.de>; Fri,  7 Jan 2022 10:14:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346402AbiAGJOE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 7 Jan 2022 04:14:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346398AbiAGJOD (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 7 Jan 2022 04:14:03 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0618C0611FD
        for <linux-input@vger.kernel.org>; Fri,  7 Jan 2022 01:14:03 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id w7so4413558plp.13
        for <linux-input@vger.kernel.org>; Fri, 07 Jan 2022 01:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=u41zQxzUJskSm1JtWiXabOaQySyrCGnhUZ53TnpbGpY=;
        b=smwDmME3VUxoGMc9YFhEy4pLhEavyaB4mrYD6YOUUV2UMjIpj1rXZqNOUPOjaioQ93
         OdOPUk2uiCO77dEpNQkomtg7a6gXVl35D5jnFvzcmNQ60UxERhZzNS7Pnno+3YcG1cYD
         9yVGsYf55ORxXJrblJnJ/0cwIlu3VGaqhhsoUH5UyB+VB3x4AFBu+29QAQFLSG/ZjJmB
         d3GStGrFLjR6NTsEQB3/hOMZfsCpAMkPM+agm8e/3lMLKI1LQkWVOuc1m6i2vAWbm9s5
         YqdScY6iNYEjVLuiL/FbKA4GkzHnyLoo9EDAtHb/CwvHL8/xv00IPn3+Z+w7MGPhZW8V
         2DpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=u41zQxzUJskSm1JtWiXabOaQySyrCGnhUZ53TnpbGpY=;
        b=y4LD70uZK+fqHA312XwpDywsWs7e6d5GItOVUxGZkKqeAC3a4ssqKYdgWoRtBdfgz8
         D+z2p/b36GK8BwocSDAH05UzcWjqwA4Dah4n7JzyAOIWjS3DGbhvwv2NaTwNolJNDQ+U
         ycv72jM/21EM3WDkMyvIxjdGDujuiWLMJlQW6ECJZVGUeo6Xwyrxamu/ffv+Ij243AfN
         ymZSYcbX+6eZiH/7CKpA+/+YBStDE0Cev4uBRDJ+b+t80uJQuYtYoyPwBMehNAGUrujS
         HSKiThSPr0UsWQdrCVEeaxK9TknGY8NB3ybn9/1ciiJ35+DBaCr7pekP7MNJVovXvyZg
         A7Lg==
X-Gm-Message-State: AOAM533H6fuYP1YOaKxZGXIQsGzICW/0+eUfB+brj9hjN1UJF5hEiCHz
        leTYbVWYaTSw1aC/piCZTWN+vw==
X-Google-Smtp-Source: ABdhPJwQjt9ERBNHx2f2cwuGqlzpQGsV3rxZnAtnOpFt8SIitKk7KLdF/dpiL5GSeDMQ/98D/7MSQw==
X-Received: by 2002:a17:902:e541:b0:149:2af:fa6a with SMTP id n1-20020a170902e54100b0014902affa6amr62348194plf.27.1641546843300;
        Fri, 07 Jan 2022 01:14:03 -0800 (PST)
Received: from ubuntu.huaqin.com ([101.78.151.213])
        by smtp.gmail.com with ESMTPSA id my5sm5814653pjb.5.2022.01.07.01.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 01:14:02 -0800 (PST)
From:   Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     dianders@google.com,
        Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [PATCH v2] HID: google: modify HID device groups of eel
Date:   Fri,  7 Jan 2022 17:13:57 +0800
Message-Id: <20220107091357.28960-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

If HID_GROUP of eel is set to HID_GROUP_GENERIC, Whiskers Tablet
Mode Switch of eel hammer will not be detected by system. when it
is set to HID_GROUP_VIVALDI, system will detect Whiskers Tablet
Mode Switch successfully.

Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
---
 drivers/hid/hid-google-hammer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-google-hammer.c b/drivers/hid/hid-google-hammer.c
index 0403beb3104b..e5acd15f4a55 100644
--- a/drivers/hid/hid-google-hammer.c
+++ b/drivers/hid/hid-google-hammer.c
@@ -585,7 +585,7 @@ static void hammer_remove(struct hid_device *hdev)
 static const struct hid_device_id hammer_devices[] = {
 	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
 		     USB_VENDOR_ID_GOOGLE, USB_DEVICE_ID_GOOGLE_DON) },
-	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
+	{ HID_DEVICE(BUS_USB, HID_GROUP_VIVALDI,
 		     USB_VENDOR_ID_GOOGLE, USB_DEVICE_ID_GOOGLE_EEL) },
 	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
 		     USB_VENDOR_ID_GOOGLE, USB_DEVICE_ID_GOOGLE_HAMMER) },
-- 
2.17.1

