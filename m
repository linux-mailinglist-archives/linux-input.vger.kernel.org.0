Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F311832B4BD
	for <lists+linux-input@lfdr.de>; Wed,  3 Mar 2021 06:38:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354185AbhCCF1j (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 3 Mar 2021 00:27:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351253AbhCBWi4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 2 Mar 2021 17:38:56 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 488BEC0617A9;
        Tue,  2 Mar 2021 14:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=jnru7A6CJNDQgxd1XaHKuQe6QWiH67rHqnYf9JHq3JI=; b=a+9blF9cjjqsNi/iRJ64QnJkOj
        llIfARqGcb2VZ8jbyw49Pdt6sp0E3SeXCHxf3P0R8wDvPJKcLlps79COQQMhS69UhVJw7jK4M5X3s
        p53HZ1FGpIUKgaAKj20JCX5gv5vFoRJH2cFrRppXDx5zQVkJ5fgDNy9Ezsd6U1EVAJ0Lth8YxnoBz
        3+yvfYee+NuIlrAmsuQkhXymQXT6ipQKn6gptURyobrFxK7D03YMnAh/uZ96HMqtPlrpJKTjOI08+
        ypahQg1MbZ3fOPDjrn6os5PBrW7R2BnLjb2NksV0htTC55xKmkV+N3Ojzs0Tjd5AJbcK8TkPgFcbU
        QfO/nwZQ==;
Received: from [2601:1c0:6280:3f0::3ba4] (helo=smtpauth.infradead.org)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lHDc6-000WSO-EU; Tue, 02 Mar 2021 22:35:35 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org, Johann Deneux <johann.deneux@gmail.com>,
        Anssi Hannula <anssi.hannula@gmail.com>
Subject: [PATCH 3/8 RESEND] input: Documentation: update related file names in ff.rst
Date:   Tue,  2 Mar 2021 14:35:18 -0800
Message-Id: <20210302223523.20130-4-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210302223523.20130-1-rdunlap@infradead.org>
References: <20210302223523.20130-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Change other related documentation file names from .txt to .rst
and be more explicit about their paths/locations.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: Johann Deneux <johann.deneux@gmail.com>
Cc: Anssi Hannula <anssi.hannula@gmail.com>
---
where is fftest mentioned here found? I only found one place:
  https://github.com/flosse/linuxconsole/blob/master/utils/fftest.c

 Documentation/input/ff.rst |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--- linux-next-20210202.orig/Documentation/input/ff.rst
+++ linux-next-20210202/Documentation/input/ff.rst
@@ -16,8 +16,8 @@ goal is not to support these devices as
 (as it is already the case), but to really enable the rendering of force
 effects.
 This document only describes the force feedback part of the Linux input
-interface. Please read joystick.txt and input.txt before reading further this
-document.
+interface. Please read joydev/joystick.rst and input.rst before reading further
+this document.
 
 Instructions to the user
 ~~~~~~~~~~~~~~~~~~~~~~~~
@@ -36,7 +36,7 @@ should keep a hand on your device, in or
 something goes wrong.
 
 If you have a serial iforce device, you need to start inputattach. See
-joystick.txt for details.
+joydev/joystick.rst for details.
 
 Does it work ?
 --------------
