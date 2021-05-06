Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E71F3755D7
	for <lists+linux-input@lfdr.de>; Thu,  6 May 2021 16:45:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234873AbhEFOqR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 May 2021 10:46:17 -0400
Received: from vps.thesusis.net ([34.202.238.73]:47020 "EHLO vps.thesusis.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234759AbhEFOqR (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 6 May 2021 10:46:17 -0400
X-Greylist: delayed 478 seconds by postgrey-1.27 at vger.kernel.org; Thu, 06 May 2021 10:46:17 EDT
Received: from localhost (localhost [127.0.0.1])
        by vps.thesusis.net (Postfix) with ESMTP id 5B79E2F0DC;
        Thu,  6 May 2021 10:37:21 -0400 (EDT)
Received: from vps.thesusis.net ([127.0.0.1])
        by localhost (vps.thesusis.net [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id OyGslXEEArnl; Thu,  6 May 2021 10:37:21 -0400 (EDT)
Received: from debian.. (097-068-109-042.biz.spectrum.com [97.68.109.42])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: psusi)
        by vps.thesusis.net (Postfix) with ESMTPSA id E857B2F0DB;
        Thu,  6 May 2021 10:37:20 -0400 (EDT)
From:   Phillip Susi <phill@thesusis.net>
To:     phill@thesusis.net
Cc:     xen-devel@lists.xenproject.org, linux-input@vger.kernel.org,
        dmitry.torokhov@gmail.com
Subject: [PATCH] Xen Keyboard: don't advertise every key known to man
Date:   Thu,  6 May 2021 14:36:54 +0000
Message-Id: <20210506143654.17924-1-phill@thesusis.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <87o8dw52jc.fsf@vps.thesusis.net>
References: <87o8dw52jc.fsf@vps.thesusis.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

For reasons I still don't understand, the input subsystem allows
input devices to advertise what keys they have, and adds this
information to the modalias for the device.  The Xen Virtual
Keyboard was advertising every known key, which resulted in a
modalias string over 2 KiB in length, which caused uevents to
fail with -ENOMEM ( when trying to add the modalias to the env ).
Remove this advertisement.
---
 drivers/input/misc/xen-kbdfront.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/input/misc/xen-kbdfront.c b/drivers/input/misc/xen-kbdfront.c
index 4ff5cd2a6d8d..d4bd558afda9 100644
--- a/drivers/input/misc/xen-kbdfront.c
+++ b/drivers/input/misc/xen-kbdfront.c
@@ -254,11 +254,6 @@ static int xenkbd_probe(struct xenbus_device *dev,
 		kbd->id.product = 0xffff;
 
 		__set_bit(EV_KEY, kbd->evbit);
-		for (i = KEY_ESC; i < KEY_UNKNOWN; i++)
-			__set_bit(i, kbd->keybit);
-		for (i = KEY_OK; i < KEY_MAX; i++)
-			__set_bit(i, kbd->keybit);
-
 		ret = input_register_device(kbd);
 		if (ret) {
 			input_free_device(kbd);
-- 
2.30.2

