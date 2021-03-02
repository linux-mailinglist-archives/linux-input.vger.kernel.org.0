Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EC1832B4B3
	for <lists+linux-input@lfdr.de>; Wed,  3 Mar 2021 06:38:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354158AbhCCF0S (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 3 Mar 2021 00:26:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351251AbhCBWi4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 2 Mar 2021 17:38:56 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE8B4C061356;
        Tue,  2 Mar 2021 14:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=1NnV/3MX76vIpFJ07qSqHoXXIoa38K+iwiSeHBS6zK4=; b=VwlrvOIA9mXaL/Aa5kGOcxuiMY
        JBhVRmFYC16bNGig22CAVYkUlgkaEbSx3jCUgt4mx6dq9XOCDJ6CgruBzcxJRsWgc23hcckPRPDNZ
        gAvceIR509WQ+JxD4i4lU+SLfFJKy/4cFVNEe2l5agfbfk7imriFkd5gweh00ZOjPk1xLcCpa80JJ
        FACRcOPUXuhNXwemGQ6eCcXqzZNISdC14UDFLJVYRJ3NRp07l9InEZr5LLVEhECz2E7579+arIS+k
        wrBP/Gw15aXCyCjYE+YjcP3Rulr52vJD72YdeQCpWK1bC8vo/cN8v2WL2nGbM183XxqWXzngwrfLg
        4dmLJMrw==;
Received: from [2601:1c0:6280:3f0::3ba4] (helo=smtpauth.infradead.org)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lHDcF-000WSO-9q; Tue, 02 Mar 2021 22:35:44 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Subject: [PATCH 6/8] input: Documentation: corrections for notifier.rst
Date:   Tue,  2 Mar 2021 14:35:21 -0800
Message-Id: <20210302223523.20130-7-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210302223523.20130-1-rdunlap@infradead.org>
References: <20210302223523.20130-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add 'ledstate' to the keyboard_notifier_param struct info and tell
which header file contains that struct.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
---
 Documentation/input/notifier.rst |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- linux-next-20210202.orig/Documentation/input/notifier.rst
+++ linux-next-20210202/Documentation/input/notifier.rst
@@ -4,11 +4,12 @@ Keyboard notifier
 
 One can use register_keyboard_notifier to get called back on keyboard
 events (see kbd_keycode() function for details).  The passed structure is
-keyboard_notifier_param:
+keyboard_notifier_param (see <linux/keyboard.h>):
 
 - 'vc' always provide the VC for which the keyboard event applies;
 - 'down' is 1 for a key press event, 0 for a key release;
 - 'shift' is the current modifier state, mask bit indexes are KG_*;
+- 'ledstate' is the current LED state;
 - 'value' depends on the type of event.
 
 - KBD_KEYCODE events are always sent before other events, value is the keycode.
