Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8871532B4C5
	for <lists+linux-input@lfdr.de>; Wed,  3 Mar 2021 06:38:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354197AbhCCF2K (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 3 Mar 2021 00:28:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1575650AbhCBWvL (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 2 Mar 2021 17:51:11 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1707CC0617A7;
        Tue,  2 Mar 2021 14:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=n4VpW1dbQd8Zx+huhC9LfBK+7Clecd7ozsypBkRhGIc=; b=KwElQgJ0cx8ytnlLbFabpIWy08
        J/f4Q4AS3y98+/1SZSKWbdRKG/keIii2x7wcjk1CK06+dzfjmuh4iYzBnWFNJXQ1On7Mg5t6BOVJF
        hb6+0v1vXYYXqhd0Ox6dbcsT0cTJqkhFBFqfnzamlA6wkyaVWzFnh6rNnWry9xPMp0Tj1BqVYugXZ
        YRUyTqvIrVHCF2WSd5w6GalcwpMwa6u+MD5Y+IaGv5VhYrckB/bxbSL5ZJwsYAyL6j0rVzftjA7lo
        7f2YS25ArJsCFEsEH6C8eLdq4ovfTclMCAdzJZ4smi3tkInr35uxWAdQuS7gLu6ac7VeFEBzHfV7V
        JIxpgA7Q==;
Received: from [2601:1c0:6280:3f0::3ba4] (helo=smtpauth.infradead.org)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lHDc3-000WSO-Fm; Tue, 02 Mar 2021 22:35:32 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Subject: [PATCH 2/8] input: Documentation: corrections for event-codes.rst
Date:   Tue,  2 Mar 2021 14:35:17 -0800
Message-Id: <20210302223523.20130-3-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210302223523.20130-1-rdunlap@infradead.org>
References: <20210302223523.20130-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fix hyphenation, typos, capitalization, and a referenced file name
(.txt -> .rst).

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
---
 Documentation/input/event-codes.rst |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

--- linux-next-20210202.orig/Documentation/input/event-codes.rst
+++ linux-next-20210202/Documentation/input/event-codes.rst
@@ -246,9 +246,9 @@ A few EV_ABS codes have special meanings
 
      A device should set the resolution of the axis to indicate whether the
      pressure is in measurable units. If the resolution is zero, the
-     pressure data is in arbitrary units. If the resolution is nonzero, the
+     pressure data is in arbitrary units. If the resolution is non-zero, the
      pressure data is in units/gram. For example, a value of 10 with a
-     resolution of 1 represents 10 gram, a value of 10 with a resolution on
+     resolution of 1 represents 10 gram, a value of 10 with a resolution of
      1000 represents 10 microgram.
 
 EV_SW
@@ -344,7 +344,7 @@ INPUT_PROP_BUTTONPAD
 
 For touchpads where the button is placed beneath the surface, such that
 pressing down on the pad causes a button click, this property should be
-set. Common in clickpad notebooks and macbooks from 2009 and onwards.
+set. Common in Clickpad notebooks and Macbooks from 2009 and onwards.
 
 Originally, the buttonpad property was coded into the bcm5974 driver
 version field under the name integrated button. For backwards
@@ -356,7 +356,7 @@ INPUT_PROP_SEMI_MT
 Some touchpads, most common between 2008 and 2011, can detect the presence
 of multiple contacts without resolving the individual positions; only the
 number of contacts and a rectangular shape is known. For such
-touchpads, the semi-mt property should be set.
+touchpads, the SEMI_MT property should be set.
 
 Depending on the device, the rectangle may enclose all touches, like a
 bounding box, or just some of them, for instance the two most recent
@@ -394,7 +394,7 @@ Guidelines
 ==========
 
 The guidelines below ensure proper single-touch and multi-finger functionality.
-For multi-touch functionality, see the multi-touch-protocol.txt document for
+For multi-touch functionality, see the multi-touch-protocol.rst document for
 more information.
 
 Mice
