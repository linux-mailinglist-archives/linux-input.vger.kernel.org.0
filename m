Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD00032B4B6
	for <lists+linux-input@lfdr.de>; Wed,  3 Mar 2021 06:38:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354168AbhCCF0q (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 3 Mar 2021 00:26:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351275AbhCBWi4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 2 Mar 2021 17:38:56 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9F3EC06121D;
        Tue,  2 Mar 2021 14:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=J11dlG14AYxQZCH8MFCqD3po8HlFhB5D8IW06rMeixg=; b=Tca5JEW+sbI/BAYvo1EgHLDKTk
        4q0fjmEpdCRCt5JOY8pkBHygNuddhbJ+D0EXgu/IQ1CW3hpnfDVwhz6XxD7wVz8cQbhnwXpXOO6p4
        Q8kiOEoVuP7x2+KcaCOomoF1MOkM8ssNmItGCgpKNQTGNPVe/TkKJpXykAQQ9g6rHn4Jqpl8KE/Bx
        Bcz6HBbkn0gtmX/VHBmgX9uJsbkHAAHJsiie37vlHBuXhxVnZcDslTvJK1nlM2RV2XKp48uHzpiba
        cUessac4KfqFZjdT4X1YYcHkUTnS370R66VbqJIAtB+WnPuJMz+F3oq7FrZw/ytxwp+UV9cwk5nSp
        9p6ppFSA==;
Received: from [2601:1c0:6280:3f0::3ba4] (helo=smtpauth.infradead.org)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lHDcH-000WSO-Ut; Tue, 02 Mar 2021 22:35:46 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Subject: [PATCH 7/8] input: Documentation: corrections for input-programming.rst
Date:   Tue,  2 Mar 2021 14:35:22 -0800
Message-Id: <20210302223523.20130-8-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210302223523.20130-1-rdunlap@infradead.org>
References: <20210302223523.20130-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Drop a repeated word.
Fix punctuation of "eg." to "e.g."
Fix punctuation of "ie" to "i.e."
Add hyphentation to non-zero.
Capitalize PM (for Power Management).
Capitalize ID (for Identifier).
Change "," in a run-on sentence to ";".

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
---
 Documentation/input/input-programming.rst |   20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

--- linux-next-20210202.orig/Documentation/input/input-programming.rst
+++ linux-next-20210202/Documentation/input/input-programming.rst
@@ -120,7 +120,7 @@ Then there is the::
 
 call to tell those who receive the events that we've sent a complete report.
 This doesn't seem important in the one button case, but is quite important
-for for example mouse movement, where you don't want the X and Y values
+for example for mouse movement, where you don't want the X and Y values
 to be interpreted separately, because that'd result in a different movement.
 
 dev->open() and dev->close()
@@ -128,7 +128,7 @@ dev->open() and dev->close()
 
 In case the driver has to repeatedly poll the device, because it doesn't
 have an interrupt coming from it and the polling is too expensive to be done
-all the time, or if the device uses a valuable resource (eg. interrupt), it
+all the time, or if the device uses a valuable resource (e.g. interrupt), it
 can use the open and close callback to know when it can stop polling or
 release the interrupt and when it must resume polling or grab the interrupt
 again. To do that, we would add this to our example driver::
@@ -161,7 +161,7 @@ makes sure that dev->open() is called on
 to the device and that dev->close() is called when the very last user
 disconnects. Calls to both callbacks are serialized.
 
-The open() callback should return a 0 in case of success or any nonzero value
+The open() callback should return a 0 in case of success or any non-zero value
 in case of failure. The close() callback (which is void) must always succeed.
 
 Inhibiting input devices
@@ -182,8 +182,8 @@ providing events to the input core.
 
 Calling the device's close() method on inhibit (if there are users) allows the
 driver to save power. Either by directly powering down the device or by
-releasing the runtime-pm reference it got in open() when the driver is using
-runtime-pm.
+releasing the runtime-PM reference it got in open() when the driver is using
+runtime-PM.
 
 Inhibiting and uninhibiting are orthogonal to opening and closing the device by
 input handlers. Userspace might want to inhibit a device in anticipation before
@@ -219,8 +219,8 @@ It's reported to the input system via::
 	input_report_key(struct input_dev *dev, int code, int value)
 
 See uapi/linux/input-event-codes.h for the allowable values of code (from 0 to
-KEY_MAX). Value is interpreted as a truth value, ie any nonzero value means key
-pressed, zero value means key released. The input code generates events only
+KEY_MAX). Value is interpreted as a truth value, i.e. any non-zero value means
+key pressed, zero value means key released. The input code generates events only
 in case the value is different from before.
 
 In addition to EV_KEY, there are two more basic event types: EV_REL and
@@ -231,12 +231,12 @@ because it doesn't have any absolute coo
 events are namely for joysticks and digitizers - devices that do work in an
 absolute coordinate systems.
 
-Having the device report EV_REL buttons is as simple as with EV_KEY, simply
+Having the device report EV_REL buttons is as simple as with EV_KEY; simply
 set the corresponding bits and call the::
 
 	input_report_rel(struct input_dev *dev, int code, int value)
 
-function. Events are generated only for nonzero value.
+function. Events are generated only for non-zero values.
 
 However EV_ABS requires a little special care. Before calling
 input_register_device, you have to fill additional fields in the input_dev
@@ -280,7 +280,7 @@ device driver. It's a string like 'Gener
 user friendly name of the device.
 
 The id* fields contain the bus ID (PCI, USB, ...), vendor ID and device ID
-of the device. The bus IDs are defined in input.h. The vendor and device ids
+of the device. The bus IDs are defined in input.h. The vendor and device IDs
 are defined in pci_ids.h, usb_ids.h and similar include files. These fields
 should be set by the input device driver before registering it.
 
