Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A62C032B4BF
	for <lists+linux-input@lfdr.de>; Wed,  3 Mar 2021 06:38:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354193AbhCCF1z (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 3 Mar 2021 00:27:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350995AbhCBWi4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 2 Mar 2021 17:38:56 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B330C061797;
        Tue,  2 Mar 2021 14:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=HGAYltNGleL56rvlAeE6uVXd+jAgv9pDM6QWFs4KAA4=; b=T3OOHhyhN3H63Bx9uVLeAptKk2
        NK7gjSa1Q/KGeWxZjmhNSk6xBxuvBJ9xBpkIZ4EgCEpI/cRHjY6GD/Dcxn041fboTAD6LC4+BvttY
        0FJvOdRjh4XjlFXSquE/5Qb91KXygJmq4IU+hrDNDVnW3NG99974GYMDmwmmpvmRWjwUfuiJbMZYO
        9tXI1wwha5r0ZSJ4D7jBQONCPs8sS1eYi7I9YgzdE4L34YgXf4QbmS1ChoXIESMOpd2oGCsXO96Sg
        c+lPyJBZGdkSR/pnBnP3T5cofdlppzsI/KPkQrNO99SYO0bqK5W75C5eUUHGe9kL46s5RlxYykeY1
        HTnJ7Ppw==;
Received: from [2601:1c0:6280:3f0::3ba4] (helo=smtpauth.infradead.org)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lHDc1-000WSO-1V; Tue, 02 Mar 2021 22:35:29 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Subject: [PATCH 1/8] input: Documentation: corrections for input.rst
Date:   Tue,  2 Mar 2021 14:35:16 -0800
Message-Id: <20210302223523.20130-2-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210302223523.20130-1-rdunlap@infradead.org>
References: <20210302223523.20130-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fix grammar, punctuation, and spelling.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
---
 Documentation/input/input.rst |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--- linux-next-20210202.orig/Documentation/input/input.rst
+++ linux-next-20210202/Documentation/input/input.rst
@@ -9,7 +9,7 @@ Introduction
 Architecture
 ============
 
-Input subsystem  a collection of drivers that is designed to support
+Input subsystem is a collection of drivers that is designed to support
 all input devices under Linux. Most of the drivers reside in
 drivers/input, although quite a few live in drivers/hid and
 drivers/platform.
@@ -50,7 +50,7 @@ will be available as a character device
 
 	crw-r--r--   1 root     root      13,  63 Mar 28 22:45 mice
 
-This device usually created automatically by the system. The commands
+This device is usually created automatically by the system. The commands
 to create it by hand are::
 
 	cd /dev
@@ -180,7 +180,7 @@ whole suite. It handles all HID devices,
 wide variety of them, and because the USB HID specification isn't
 simple, it needs to be this big.
 
-Currently, it handles USB mice, joysticks, gamepads, steering wheels
+Currently, it handles USB mice, joysticks, gamepads, steering wheels,
 keyboards, trackballs and digitizers.
 
 However, USB uses HID also for monitor controls, speaker controls, UPSs,
@@ -268,7 +268,7 @@ events on a read. Their layout is::
     };
 
 ``time`` is the timestamp, it returns the time at which the event happened.
-Type is for example EV_REL for relative moment, EV_KEY for a keypress or
+Type is for example EV_REL for relative movement, EV_KEY for a keypress or
 release. More types are defined in include/uapi/linux/input-event-codes.h.
 
 ``code`` is event code, for example REL_X or KEY_BACKSPACE, again a complete
