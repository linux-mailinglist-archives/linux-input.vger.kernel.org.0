Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 051FC32B4AE
	for <lists+linux-input@lfdr.de>; Wed,  3 Mar 2021 06:38:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354139AbhCCFZm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 3 Mar 2021 00:25:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351252AbhCBWi4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 2 Mar 2021 17:38:56 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B365C0617AB;
        Tue,  2 Mar 2021 14:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=V1Htl9i9ALhyRPuRFiH4WouYrmwFA3kifK1CMhsgjAI=; b=PvaFNG4q0yHTdizWgUT1fPsXme
        2LBlj4nWCgnlFre1lXGuQOMil1BblNsY1a5LSiPINO19p6BshUe0bGgNFWmxQIHEItdbn9LZZH/1a
        S5N8KX6quVBEMppMh963A/xKXOOGZ7YuA3ImCuIEvOU/6LbvFnNS0NGF5ggNPw3dejEBVlOmja989
        y1P4SZNixyYzjJnB+zAh7sijtno3j4u+9V9Fdy9kJRiQJwfGlTLs0HfE/GLqbr1QuaWlNTDXsxwUW
        FT7owfSriKJS1+SvG8cHozZu3LF3DZFzURzNwW7wfvz1An3mT8W9W6hM8LwdshrO2abyzptpHq3xb
        vkSkUntA==;
Received: from [2601:1c0:6280:3f0::3ba4] (helo=smtpauth.infradead.org)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lHDcC-000WSO-T0; Tue, 02 Mar 2021 22:35:41 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>
Subject: [PATCH 5/8] input: Documentation: corrections for multi-touch-protocol.rst
Date:   Tue,  2 Mar 2021 14:35:20 -0800
Message-Id: <20210302223523.20130-6-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210302223523.20130-1-rdunlap@infradead.org>
References: <20210302223523.20130-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Correct hyphenation, spelling, and capitalization.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: Henrik Rydberg <rydberg@bitmath.org>
---
 Documentation/input/multi-touch-protocol.rst |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--- linux-next-20210202.orig/Documentation/input/multi-touch-protocol.rst
+++ linux-next-20210202/Documentation/input/multi-touch-protocol.rst
@@ -261,7 +261,7 @@ ABS_MT_PRESSURE
     signal intensity distribution.
 
     If the resolution is zero, the pressure data is in arbitrary units.
-    If the resolution is nonzero, the pressure data is in units/gram. See
+    If the resolution is non-zero, the pressure data is in units/gram. See
     :ref:`input-event-codes` for details.
 
 ABS_MT_DISTANCE
@@ -279,14 +279,14 @@ ABS_MT_ORIENTATION
     max should be returned; when aligned with the X axis in the negative
     direction, the range -max should be returned.
 
-    Touch ellipsis are symmetrical by default. For devices capable of true 360
+    Touch ellipses are symmetrical by default. For devices capable of true 360
     degree orientation, the reported orientation must exceed the range max to
     indicate more than a quarter of a revolution. For an upside-down finger,
     range max * 2 should be returned.
 
     Orientation can be omitted if the touch area is circular, or if the
     information is not available in the kernel driver. Partial orientation
-    support is possible if the device can distinguish between the two axis, but
+    support is possible if the device can distinguish between the two axes, but
     not (uniquely) any values in between. In such cases, the range of
     ABS_MT_ORIENTATION should be [0, 1] [#f4]_.
 
@@ -356,7 +356,7 @@ The range of ABS_MT_ORIENTATION should b
 the device can distinguish between a finger along the Y axis (0) and a
 finger along the X axis (1).
 
-For win8 devices with both T and C coordinates, the position mapping is::
+For Win8 devices with both T and C coordinates, the position mapping is::
 
    ABS_MT_POSITION_X := T_X
    ABS_MT_POSITION_Y := T_Y
