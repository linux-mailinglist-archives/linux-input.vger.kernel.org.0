Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B150CB27DC
	for <lists+linux-input@lfdr.de>; Sat, 14 Sep 2019 00:03:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403962AbfIMWD2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 Sep 2019 18:03:28 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:34674 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390504AbfIMWDY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 Sep 2019 18:03:24 -0400
Received: by mail-pg1-f194.google.com with SMTP id n9so15972019pgc.1
        for <linux-input@vger.kernel.org>; Fri, 13 Sep 2019 15:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=peRAbMQ2xKT0fFJ89FYNdeBR3nBllTZJZRN8uGrtZQY=;
        b=a16SB8y7DtHAZOq5Hes9SBNTETQkEg+2M16auoZs6P5Nx+GDEkq6hcyakn5++4DdcB
         xuotJ1/LBSLQ6/x9i8PSx9EORvkMkkcAslecx1PEO2e932P8IGbrvFqJcEOscwYd0Qjl
         JGGr1z03FZH0C+mmPO4aH9P6LGbCOROUFsGTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=peRAbMQ2xKT0fFJ89FYNdeBR3nBllTZJZRN8uGrtZQY=;
        b=r74sN/6m3hI+kSUz/c+Dcmu5Rv39lGiaoVC6OLTptEd+ZJzmNvIfomOl5N+g6PsH/d
         efi/K8CXb96C5+zWN3sczkNz61RHz0vyZNv1RF9pfa3uha26nnGqBX4oOLBFf9sP2+pp
         krtXTqgKoBCTnjV2WqHcAYkJR+PmvubRyWrL9VRmBaWXy11S486SThkgQNFKBhNg0vBR
         2CF1rp5g+O0j0VX9Omd2iqW47GSeV2UFqtc0Ok9pjs1qea2hYwgizvBNa3qmBop4D0df
         jhheXSSX2/JVNw8DJZWtkdbP5nyJyxS11JMt448reep9FiH3T8KM9BwacKRuy9JYvhmY
         CFMw==
X-Gm-Message-State: APjAAAVzVwLvJDre2tblmJw8Org8dzlDMHyJQoz1qSGgCKkOdFpG+76v
        q5bujRQsvUsMH5ZFEUUB+k/6Uw==
X-Google-Smtp-Source: APXvYqyKIbWs4Y3boyjYAXcLk2CgyMhKDAHsPob+taOZvGOpsX89CxIujHHpsDtA4DxKLQQ7FYVN9Q==
X-Received: by 2002:a63:c149:: with SMTP id p9mr11350330pgi.50.1568412203692;
        Fri, 13 Sep 2019 15:03:23 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id o19sm2524486pjr.23.2019.09.13.15.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2019 15:03:22 -0700 (PDT)
From:   Dmitry Torokhov <dtor@chromium.org>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Nicolas Boichat <drinkcat@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] HID: google: whiskers: signal tablet mode on connect
Date:   Fri, 13 Sep 2019 15:03:17 -0700
Message-Id: <20190913220317.58289-3-dtor@chromium.org>
X-Mailer: git-send-email 2.23.0.237.gc6a4ce50a0-goog
In-Reply-To: <20190913220317.58289-1-dtor@chromium.org>
References: <20190913220317.58289-1-dtor@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

When we receive "keyboard position" event from Whiskers we can
conclude that the base is attached, even if we did not get EC event
for that. We may miss EC event because there are some units which
have a lot of leakage on the ADC pins that the EC uses to determine
whether or not a base is attached.

Signed-off-by: Dmitry Torokhov <dtor@chromium.org>
---
 drivers/hid/hid-google-hammer.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-google-hammer.c b/drivers/hid/hid-google-hammer.c
index 3dc6116c8f76..31e4a39946f5 100644
--- a/drivers/hid/hid-google-hammer.c
+++ b/drivers/hid/hid-google-hammer.c
@@ -402,16 +402,16 @@ static int hammer_event(struct hid_device *hid, struct hid_field *field,
 	    usage->hid == WHISKERS_KBD_FOLDED) {
 		spin_lock_irqsave(&cbas_ec_lock, flags);
 
+		/*
+		 * If we are getting events from Whiskers that means that it
+		 * is attached to the lid.
+		 */
+		cbas_ec.base_present = true;
 		cbas_ec.base_folded = value;
 		hid_dbg(hid, "%s: base: %d, folded: %d\n", __func__,
 			cbas_ec.base_present, cbas_ec.base_folded);
 
-		/*
-		 * We should not get event if base is detached, but in case
-		 * we happen to service HID and EC notifications out of order
-		 * let's still check the "base present" flag.
-		 */
-		if (cbas_ec.input && cbas_ec.base_present) {
+		if (cbas_ec.input) {
 			input_report_switch(cbas_ec.input,
 					    SW_TABLET_MODE, value);
 			input_sync(cbas_ec.input);
-- 
2.23.0.237.gc6a4ce50a0-goog

