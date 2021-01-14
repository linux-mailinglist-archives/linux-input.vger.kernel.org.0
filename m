Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 803592F5AA5
	for <lists+linux-input@lfdr.de>; Thu, 14 Jan 2021 07:26:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726172AbhANGY6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 Jan 2021 01:24:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726117AbhANGY6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 Jan 2021 01:24:58 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58400C061575;
        Wed, 13 Jan 2021 22:24:17 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id i7so3084000pgc.8;
        Wed, 13 Jan 2021 22:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=lcW4JpxXQprA1ci8TUjnK5K087ExJhs0k8B5yG40WMo=;
        b=PmYzb+mdGfQYIcz+8g9hf0jq3y+JlyxzXFMemzpQieJ6uEQ5htQEG58sA/2lG2EkW1
         9mvVqdok+AQWMU7qg0HCiWPsSBRtD92F3dRmDrfwXdSyDnxGum8Vl7sKV+1NgnPzYEGF
         1KGWFEYx8V6QEFmyFN61noG8CpC0THhwibGwlGVR7SVDxSSnfGb6IktfcFJT5POJ/pYc
         IF/ahMcK/YxLoNTVQEwWfLGPSy1dnKZQtVC+Z9nQL6t4CW9RUrBYqHzozHTbVf95rGCe
         XO/HLNICEMOX7t/o0HngIJgqeWXB/jHixzwiFt28RIUZm7fL0OcVM6nvfub6B49yK6qz
         zwBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=lcW4JpxXQprA1ci8TUjnK5K087ExJhs0k8B5yG40WMo=;
        b=q9EINQ7v6MeARWm7cqrGFIfraoYYNcxWNMm4INb34UftrFcsowB+fdXM0KyaXrzlR3
         YECVOpMxmQRyVZ0WVmnPt0JpWc/PCysGUiZ7qpdkDVhaJumuEb6t7ToHm95g9eOHCnoY
         xityEesPv43AFr+1aKzn/3A1ozx4/ytTtiJVYE+Mm8NdP3N2LWsqCOdMuIdxQDZby6vS
         7HN5AJe4h7JH+/ym/A+ZC2xq5cSGChrDUhcbaMdu/IDoTOBScvpJgsDXwFIfAND24Abz
         qzqXlLR6sl+DplPUh6FW/idbzwuSV7lRAVMRnV6r91jRapNbpa9zOjowSYqxDNTjkwb7
         Oe0Q==
X-Gm-Message-State: AOAM530bhE8636m+rwpCL/rST3sC+Grma4RXvNFFsYJ6Gg0Imn2OINeC
        A4nRJ4cHY62Rnr+5tx+WfmA=
X-Google-Smtp-Source: ABdhPJxQLbET4Ld900+XwfK2j4nkJF52RA4Q3du1NL9nN0EH1WB2KhXsyboQ2Vh6Z7ghuyxBd8zucg==
X-Received: by 2002:a63:1261:: with SMTP id 33mr5835343pgs.213.1610605456870;
        Wed, 13 Jan 2021 22:24:16 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id ck20sm4404098pjb.20.2021.01.13.22.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jan 2021 22:24:15 -0800 (PST)
Date:   Wed, 13 Jan 2021 22:24:13 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Peter Hutterer <peter.hutterer@who-t.net>, seobrien@chromium.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] HID: hid-input: avoid splitting keyboard, system and
 consumer controls
Message-ID: <X//jjawwbm8FxbQU@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

A typical USB keyboard usually splits its keys into several reports:

- one for the basic alphanumeric keys, modifier keys, F<n> keys, six pack
  keys and keypad. This report's application is normally listed as
  GenericDesktop.Keyboard
- a GenericDesktop.SystemControl report for the system control keys, such
  as power and sleep
- Consumer.ConsumerControl report for multimedia (forward, rewind,
  play/pause, mute, etc) and other extended keys.
- additional output, vendor specific, and feature reports

Splitting each report into a separate input device is wasteful and even
hurts userspace as it makes it harder to determine the true capabilities
(set of available keys) of a keyboard, so let's adjust application
matching to merge system control and consumer control reports with
keyboard report, if one has already been processed.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-input.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index f797659cb9d9..df45d8d07dc2 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -1851,6 +1851,16 @@ static struct hid_input *hidinput_match_application(struct hid_report *report)
 	list_for_each_entry(hidinput, &hid->inputs, list) {
 		if (hidinput->application == report->application)
 			return hidinput;
+
+		/*
+		 * Keep SystemControl and ConsumerControl applications together
+		 * with the main keyboard, if present.
+		 */
+		if ((report->application == HID_GD_SYSTEM_CONTROL ||
+		     report->application == HID_CP_CONSUMER_CONTROL) &&
+		    hidinput->application == HID_GD_KEYBOARD) {
+			return hidinput;
+		}
 	}
 
 	return NULL;
-- 
2.30.0.284.gd98b1dd5eaa7-goog


-- 
Dmitry
