Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A97036E4EB
	for <lists+linux-input@lfdr.de>; Thu, 29 Apr 2021 08:31:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230148AbhD2Gci (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Apr 2021 02:32:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229814AbhD2Gci (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Apr 2021 02:32:38 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22339C06138B;
        Wed, 28 Apr 2021 23:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=QGDPuaBe6OyFqVcBPz0n15qtWRoyFEXYwJlGgdmu/00=; b=kRQnE7SUrvjzzr7b9P9Bw8y6M2
        380BBlPPV7yh1WIygwUfqLAXSlURLYnfG0JqyKLX5K530J/7dKiEPcdIWatCh5cfHW3IROt1k4WUW
        gDrHFCAXiKZSVOT8ejXb8T5GKlFT883FekYgKaQpoSRUtt/cm0qtjJHdrmS3IRDmlRVFPmDkOGwhw
        XgHuC8DGru5T5V+5ooivzVGfTr12Qk4eB8r95/lytmMSLc9wUDb9u5to/TH310q8+X2a//tmXNmoS
        qNugRD5VGYZbZCMl5sjvkrGKar+OJAJls7jUwmvjCXh+g27m9P+ICkaxBW/VS193YohGQD14LrXoT
        4rdAC1Hg==;
Received: from [2601:1c0:6280:3f0::3bc5] (helo=casper.infradead.org)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lc0D7-009Hlc-MQ; Thu, 29 Apr 2021 06:31:47 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-doc@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Subject: [PATCH] Documentation: input: joydev file corrections
Date:   Wed, 28 Apr 2021 23:31:37 -0700
Message-Id: <20210429063137.20232-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fix typos, grammar, punctuation in
Documentation/input/joydev/*.rst files.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
---
 Documentation/input/joydev/joystick-api.rst |   14 ++++-----
 Documentation/input/joydev/joystick.rst     |   26 +++++++++---------
 2 files changed, 20 insertions(+), 20 deletions(-)

--- linux-next-20210428.orig/Documentation/input/joydev/joystick-api.rst
+++ linux-next-20210428/Documentation/input/joydev/joystick-api.rst
@@ -71,7 +71,7 @@ The possible values of ``type`` are::
 	#define JS_EVENT_INIT           0x80    /* initial state of device */
 
 As mentioned above, the driver will issue synthetic JS_EVENT_INIT ORed
-events on open. That is, if it's issuing a INIT BUTTON event, the
+events on open. That is, if it's issuing an INIT BUTTON event, the
 current type value will be::
 
 	int type = JS_EVENT_BUTTON | JS_EVENT_INIT;	/* 0x81 */
@@ -100,8 +100,8 @@ is, you have both an axis 0 and a button
         =============== =======
 
 Hats vary from one joystick type to another. Some can be moved in 8
-directions, some only in 4, The driver, however, always reports a hat as two
-independent axis, even if the hardware doesn't allow independent movement.
+directions, some only in 4. The driver, however, always reports a hat as two
+independent axes, even if the hardware doesn't allow independent movement.
 
 
 js_event.value
@@ -188,10 +188,10 @@ One reason for emptying the queue is tha
 missing events since the queue is finite, and older events will get
 overwritten.
 
-The other reason is that you want to know all what happened, and not
+The other reason is that you want to know all that happened, and not
 delay the processing till later.
 
-Why can get the queue full? Because you don't empty the queue as
+Why can the queue get full? Because you don't empty the queue as
 mentioned, or because too much time elapses from one read to another
 and too many events to store in the queue get generated. Note that
 high system load may contribute to space those reads even more.
@@ -277,7 +277,7 @@ to be in the stable part of the API, and
 warning in following releases of the driver.
 
 Both JSIOCSCORR and JSIOCGCORR expect &js_corr to be able to hold
-information for all axis. That is, struct js_corr corr[MAX_AXIS];
+information for all axes. That is, struct js_corr corr[MAX_AXIS];
 
 struct js_corr is defined as::
 
@@ -328,7 +328,7 @@ To test the state of the buttons,
 	second_button_state = js.buttons & 2;
 
 The axis values do not have a defined range in the original 0.x driver,
-except for that the values are non-negative. The 1.2.8+ drivers use a
+except that the values are non-negative. The 1.2.8+ drivers use a
 fixed range for reporting the values, 1 being the minimum, 128 the
 center, and 255 maximum value.
 
--- linux-next-20210428.orig/Documentation/input/joydev/joystick.rst
+++ linux-next-20210428/Documentation/input/joydev/joystick.rst
@@ -133,15 +133,15 @@ And add a line to your rc script executi
 This way, after the next reboot your joystick will remain calibrated. You
 can also add the ``jscal -p`` line to your shutdown script.
 
-HW specific driver information
-==============================
+Hardware-specific driver information
+====================================
 
 In this section each of the separate hardware specific drivers is described.
 
 Analog joysticks
 ----------------
 
-The analog.c uses the standard analog inputs of the gameport, and thus
+The analog.c driver uses the standard analog inputs of the gameport, and thus
 supports all standard joysticks and gamepads. It uses a very advanced
 routine for this, allowing for data precision that can't be found on any
 other system.
@@ -266,7 +266,7 @@ to:
 * Logitech WingMan Extreme Digital 3D
 
 ADI devices are autodetected, and the driver supports up to two (any
-combination of) devices on a single gameport, using an Y-cable or chained
+combination of) devices on a single gameport, using a Y-cable or chained
 together.
 
 Logitech WingMan Joystick, Logitech WingMan Attack, Logitech WingMan
@@ -288,7 +288,7 @@ supports:
 * Gravis Xterminator DualControl
 
 All these devices are autodetected, and you can even use any combination
-of up to two of these pads either chained together or using an Y-cable on a
+of up to two of these pads either chained together or using a Y-cable on a
 single gameport.
 
 GrIP MultiPort isn't supported yet. Gravis Stinger is a serial device and is
@@ -311,7 +311,7 @@ allow connecting analog joysticks to the
 driver as well to handle the attached joysticks.
 
 The trackball should work with USB mousedev module as a normal mouse. See
-the USB documentation for how to setup an USB mouse.
+the USB documentation for how to setup a USB mouse.
 
 ThrustMaster DirectConnect (BSP)
 --------------------------------
@@ -332,7 +332,7 @@ If you have one of these, contact me.
 
 TMDC devices are autodetected, and thus no parameters to the module
 are needed. Up to two TMDC devices can be connected to one gameport, using
-an Y-cable.
+a Y-cable.
 
 Creative Labs Blaster
 ---------------------
@@ -342,7 +342,7 @@ the:
 
 * Creative Blaster GamePad Cobra
 
-Up to two of these can be used on a single gameport, using an Y-cable.
+Up to two of these can be used on a single gameport, using a Y-cable.
 
 Genius Digital joysticks
 ------------------------
@@ -381,7 +381,7 @@ card, 16 in case you have two in your sy
 Trident 4DWave / Aureal Vortex
 ------------------------------
 
-Soundcards with a Trident 4DWave DX/NX or Aureal Vortex/Vortex2 chipsets
+Soundcards with a Trident 4DWave DX/NX or Aureal Vortex/Vortex2 chipset
 provide an "Enhanced Game Port" mode where the soundcard handles polling the
 joystick.  This mode is supported by the pcigame.c module. Once loaded the
 analog driver can use the enhanced features of these gameports..
@@ -454,7 +454,7 @@ Devices currently supported by spaceball
 * SpaceTec SpaceBall 4000 FLX
 
 In addition to having the spaceorb/spaceball and serport modules in the
-kernel, you also need to attach a serial port to it. to do that, run the
+kernel, you also need to attach a serial port to it. To do that, run the
 inputattach program::
 
 	inputattach --spaceorb /dev/tts/x &
@@ -466,7 +466,7 @@ or::
 where /dev/tts/x is the serial port which the device is connected to. After
 doing this, the device will be reported and will start working.
 
-There is one caveat with the SpaceOrb. The button #6, the on the bottom
+There is one caveat with the SpaceOrb. The button #6, the one on the bottom
 side of the orb, although reported as an ordinary button, causes internal
 recentering of the spaceorb, moving the zero point to the position in which
 the ball is at the moment of pressing the button. So, think first before
@@ -500,7 +500,7 @@ joy-magellan module. It currently suppor
 * Magellan 3D
 * Space Mouse
 
-models, the additional buttons on the 'Plus' versions are not supported yet.
+models; the additional buttons on the 'Plus' versions are not supported yet.
 
 To use it, you need to attach the serial port to the driver using the::
 
@@ -575,7 +575,7 @@ FAQ
 :A: The device files don't exist. Create them (see section 2.2).
 
 :Q: Is it possible to connect my old Atari/Commodore/Amiga/console joystick
-    or pad that uses a 9-pin D-type cannon connector to the serial port of my
+    or pad that uses a 9-pin D-type Cannon connector to the serial port of my
     PC?
 :A: Yes, it is possible, but it'll burn your serial port or the pad. It
     won't work, of course.
