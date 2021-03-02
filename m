Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C833532B4B2
	for <lists+linux-input@lfdr.de>; Wed,  3 Mar 2021 06:38:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354148AbhCCF0I (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 3 Mar 2021 00:26:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351254AbhCBWi4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 2 Mar 2021 17:38:56 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3038C0617AA;
        Tue,  2 Mar 2021 14:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=fB7cIY86DyAWTapI+MAfsx1E3wwthMq8695L3n2YfGc=; b=hCYnifQZVDQCOJPF8Vy9XG/nRw
        Rs1l+qVcu/2hpbe+mL1wPNZX5qasZ9Q2ihY3iEP4w62UJssq0TFQoggxJSUfb99sVnHfRQ+YUhDya
        94C7cQKS8WQGANVGlMWek5yrIi4He/wOHd1CcE5m7sp36kFNAgDD0wZ3K6fmDWJAZi77cnBioxxp1
        oeNTe6gI97VoKDzjFBY2Mmobh3MAdTYG7iQjOh/ZOeAxlvEIiaYDkdCjfhwEgdVlAEB5W4A1JsoN1
        OhoJZ3B7zGZmFRfgGfeuGYL1UNigiOii/H42RUtGMjQ0ChZtAOmzSpb/EuMxhpikT4HCQlmfFkYGi
        /RSbWtFw==;
Received: from [2601:1c0:6280:3f0::3ba4] (helo=smtpauth.infradead.org)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lHDcA-000WSO-98; Tue, 02 Mar 2021 22:35:38 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Subject: [PATCH 4/8] input: Documentation: corrections for gameport-programming.rst
Date:   Tue,  2 Mar 2021 14:35:19 -0800
Message-Id: <20210302223523.20130-5-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210302223523.20130-1-rdunlap@infradead.org>
References: <20210302223523.20130-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Use "E.g." instead of "Eg.".
Use correct index for buttons[] array.
Update all of struct gameport's descriptions.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
---
 Documentation/input/gameport-programming.rst |   35 +++++++++++------
 1 file changed, 23 insertions(+), 12 deletions(-)

--- linux-next-20210202.orig/Documentation/input/gameport-programming.rst
+++ linux-next-20210202/Documentation/input/gameport-programming.rst
@@ -21,7 +21,7 @@ choose which one to program the hardware
 addresses is preferred, because the likelihood of clashing with the standard
 0x201 address is smaller.
 
-Eg. if your driver supports addresses 0x200, 0x208, 0x210 and 0x218, then
+E.g. if your driver supports addresses 0x200, 0x208, 0x210 and 0x218, then
 0x218 would be the address of first choice.
 
 If your hardware supports a gameport address that is not mapped to ISA io
@@ -78,7 +78,7 @@ the gameport. To register a cooked gamep
 
 		for (i = 0; i < 4; i++)
 			axes[i] = my_mmio[i];
-		buttons[i] = my_mmio[4];
+		buttons[0] = my_mmio[4];
 	}
 
 	int my_open(struct gameport *gameport, int mode)
@@ -117,25 +117,28 @@ Simple::
 The gameport structure
 ~~~~~~~~~~~~~~~~~~~~~~
 
-.. note::
-
-    This section is outdated. There are several fields here that don't
-    match what's there at include/linux/gameport.h.
-
 ::
 
     struct gameport {
 
-	void *private;
+	void *port_data;
 
 A private pointer for free use in the gameport driver. (Not the joystick
 driver!)
 
 ::
 
-	int number;
+	char name[32];
+
+Driver's name as set by driver calling gameport_set_name(). Informational
+purpose only.
+
+::
+
+	char phys[32];
 
-Number assigned to the gameport when registered. Informational purpose only.
+gameport's physical name/description as set by driver calling gameport_set_phys().
+Informational purpose only.
 
 ::
 
@@ -210,8 +213,16 @@ gameport.
 
 ::
 
-	struct gameport_dev *dev;
-	struct gameport *next;
+	struct timer_list poll_timer;
+	unsigned int poll_interval;     /* in msecs */
+	spinlock_t timer_lock;
+	unsigned int poll_cnt;
+	void (*poll_handler)(struct gameport *);
+	struct gameport *parent, *child;
+	struct gameport_driver *drv;
+	struct mutex drv_mutex;		/* protects serio->drv so attributes can pin driver */
+	struct device dev;
+	struct list_head node;
 
 For internal use by the gameport layer.
 
