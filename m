Return-Path: <linux-input+bounces-12566-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B342AC37A0
	for <lists+linux-input@lfdr.de>; Mon, 26 May 2025 03:15:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED91F18930CE
	for <lists+linux-input@lfdr.de>; Mon, 26 May 2025 01:15:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 805AA86348;
	Mon, 26 May 2025 01:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gvernon.com header.i=@gvernon.com header.b="o4xUDEIt"
X-Original-To: linux-input@vger.kernel.org
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BB87E792;
	Mon, 26 May 2025 01:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748222090; cv=none; b=tFBQwLTpIjTiDRR5TYo+fWsXK+tYnnTgmYl9vrL/Nw3PYqPolmqUwhfwB5tteHw+ataGhHe7puLXbZLf8jQ1Ny4dOOQwGoskyJsbbrwLPZwTBNctjiy9hpGXYRXakts+BeE5FztlyKiM+0JivWGbgX+CrLq9eYgfbjtmNFYM+xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748222090; c=relaxed/simple;
	bh=WchQQv1G3+93bfkSDilN1MEYRA5CRDUfEkYf4tCSexo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RixTD6vHbuJWrVEs5+1dGNO8/PjoWTPQ0bA4cmbKYt3r6IOZ93VqfxnPWrMogwT7g/m9Kjl1rUpQxwqcmxvNXlBf1wuLIjeUi6xQfJY2VskvDDUcVdlX6fb06U4qNQego0MKFhI6lKAtDjAkQz/2qaGC3m6oM9VH82Qejaz1i40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gvernon.com; spf=pass smtp.mailfrom=gvernon.com; dkim=pass (2048-bit key) header.d=gvernon.com header.i=@gvernon.com header.b=o4xUDEIt; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gvernon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gvernon.com
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gvernon.com; s=key1;
	t=1748222086;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4xSlqUPdscdRNpqoYd9d7PjyH7uOqu8XNZYs3CgY5gA=;
	b=o4xUDEItuIr4ZpvF08vHTjdNZsEXQDZDXejJ9ID3urqOPKh8a8YRfk7wNediBh03wd3bnE
	oFIUkeZdpr8hV78kg8Tcmsmjp++frQakwwZCzntgbH08pu4hKU2TDBIRk4POSh5Ul/ujGC
	HIXavY3b9PAvi4HgflulVw8b3rhlX2m5BzmPdbI1+TKYRtvnkwDvF5rWTnfiZlxLFpodpS
	h8f8mIT9z6DDfD+ARX2+k2bd4f2m1jIvuNYRhov2lLkGWyGYxMlffwWP/UMO/pooGLubip
	mr2vrDedgFCFYfHaxXxdunttvz3cTCO/Klm8kLpdHhK1RHVv7hqyqQUAUGfZdA==
From: George Anthony Vernon <contact@gvernon.com>
To: dmitry.torokhov@gmail.com,
	corbet@lwn.net,
	skhan@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	George Anthony Vernon <contact@gvernon.com>
Subject: [PATCH 3/3] input: docs: Fix Amiga joysticks grammar & formatting
Date: Mon, 26 May 2025 02:14:43 +0100
Message-ID: <20250526011443.136804-4-contact@gvernon.com>
In-Reply-To: <20250526011443.136804-1-contact@gvernon.com>
References: <20250526011443.136804-1-contact@gvernon.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Make small grammar fixes to Amiga joystick documentation.

Also make heading adornments compliant with the guidelines to improve
organisation of the page.

Signed-off-by: George Anthony Vernon <contact@gvernon.com>
---
 Documentation/input/devices/amijoy.rst | 122 +++++++++++++------------
 1 file changed, 66 insertions(+), 56 deletions(-)

diff --git a/Documentation/input/devices/amijoy.rst b/Documentation/input/devices/amijoy.rst
index ea4de1ac0360..48e326c41045 100644
--- a/Documentation/input/devices/amijoy.rst
+++ b/Documentation/input/devices/amijoy.rst
@@ -1,14 +1,15 @@
-~~~~~~~~~~~~~~~~~~~~~~~~~
-Amiga joystick extensions
-~~~~~~~~~~~~~~~~~~~~~~~~~
+===============
+Amiga joysticks
+===============
 
+Pinouts
+=======
 
-Amiga 4-joystick parport extension
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+Amiga 4-joystick parallel port extension
+----------------------------------------
 
 Parallel port pins:
 
-
 =====  ======== ====   ==========
 Pin    Meaning  Pin    Meaning
 =====  ======== ====   ==========
@@ -20,8 +21,8 @@ Pin    Meaning  Pin    Meaning
 19     Gnd1	18     Gnd2
 =====  ======== ====   ==========
 
-Amiga digital joystick pinout
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+Amiga digital joystick
+----------------------
 
 === ============
 Pin Meaning
@@ -37,8 +38,8 @@ Pin Meaning
 9   Thumb button
 === ============
 
-Amiga mouse pinout
-~~~~~~~~~~~~~~~~~~
+Amiga mouse
+-----------
 
 === ============
 Pin Meaning
@@ -54,8 +55,8 @@ Pin Meaning
 9   Right button
 === ============
 
-Amiga analog joystick pinout
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+Amiga analog joystick
+---------------------
 
 === ==============
 Pin Meaning
@@ -71,8 +72,8 @@ Pin Meaning
 9   Analog Y
 === ==============
 
-Amiga lightpen pinout
-~~~~~~~~~~~~~~~~~~~~~
+Amiga lightpen
+--------------
 
 === =============
 Pin Meaning
@@ -88,19 +89,23 @@ Pin Meaning
 9   Stylus button
 === =============
 
--------------------------------------------------------------------------------
+Register addresses
+==================
+
+JOY0DAT/JOY1DAT
+---------------
 
-======== === ==== ==== ====== ========================================
+======== === ==== ==== ====== ===========================================
 NAME     rev ADDR type chip   Description
-======== === ==== ==== ====== ========================================
-JOY0DAT      00A   R   Denise Joystick-mouse 0 data (left vert, horiz)
-JOY1DAT      00C   R   Denise Joystick-mouse 1 data (right vert,horiz)
-======== === ==== ==== ====== ========================================
+======== === ==== ==== ====== ===========================================
+JOY0DAT      00A   R   Denise Joystick-mouse 0 data (left vert., horiz.)
+JOY1DAT      00C   R   Denise Joystick-mouse 1 data (right vert., horiz.)
+======== === ==== ==== ====== ===========================================
 
         These addresses each read a 16 bit register. These in turn
         are loaded from the MDAT serial stream and are clocked in on
         the rising edge of SCLK. MLD output is used to parallel load
-        the external parallel-to-serial converter.This in turn is
+        the external parallel-to-serial converter. This in turn is
         loaded with the 4 quadrature inputs from each of two game
         controller ports (8 total) plus 8 miscellaneous control bits
         which are new for LISA and can be read in upper 8 bits of
@@ -108,7 +113,7 @@ JOY1DAT      00C   R   Denise Joystick-mouse 1 data (right vert,horiz)
 
         Register bits are as follows:
 
-        - Mouse counter usage (pins  1,3 =Yclock, pins 2,4 =Xclock)
+        - Mouse counter usage (pins 1,3 =Yclock, pins 2,4 =Xclock)
 
 ======== === === === === === === === === ====== === === === === === === ===
     BIT#  15  14  13  12  11  10  09  08     07  06  05  04  03  02  01  00
@@ -160,7 +165,8 @@ JOY1DAT   Y7  Y6  Y5  Y4  Y3  Y2  Y1  Y0     X7  X6  X5  X4  X3  X2  X1  X0
          | Right      |  4   | X1                              |
          +------------+------+---------------------------------+
 
--------------------------------------------------------------------------------
+JOYTEST
+-------
 
 ========  === ==== ==== ====== =================================================
 NAME      rev ADDR type chip    Description
@@ -177,14 +183,15 @@ JOYTEST       036   W   Denise  Write to all 4  joystick-mouse counters at once.
   JOYxDAT  Y7  Y6  Y5  Y4  Y3  Y2  xx  xx     X7  X6  X5  X4  X3  X2  xx  xx
 ========= === === === === === === === === ====== === === === === === === ===
 
--------------------------------------------------------------------------------
+POT0DAT/POT1DAT
+---------------
 
-======= === ==== ==== ====== ========================================
+======= === ==== ==== ====== ===========================================
 NAME    rev ADDR type chip   Description
-======= === ==== ==== ====== ========================================
-POT0DAT  h  012   R   Paula  Pot counter data left pair (vert, horiz)
-POT1DAT  h  014   R   Paula  Pot counter data right pair (vert,horiz)
-======= === ==== ==== ====== ========================================
+======= === ==== ==== ====== ===========================================
+POT0DAT  h  012   R   Paula  Pot counter data left pair (vert., horiz.)
+POT1DAT  h  014   R   Paula  Pot counter data right pair (vert., horiz.)
+======= === ==== ==== ====== ===========================================
 
         These addresses each read a pair of 8 bit pot counters.
         (4 counters total). The bit assignment for both
@@ -198,6 +205,7 @@ POT1DAT  h  014   R   Paula  Pot counter data right pair (vert,horiz)
   LEFT  Y7  Y6  Y5  Y4  Y3  Y2  Y1  Y0     X7  X6  X5  X4  X3  X2  X1  X0
 ====== === === === === === === === === ====== === === === === === === ===
 
+..
          +--------------------------+-------+
          | CONNECTORS               | PAULA |
          +-------+------+-----+-----+-------+
@@ -213,12 +221,13 @@ POT1DAT  h  014   R   Paula  Pot counter data right pair (vert,horiz)
          +-------+------+-----+-----+-------+
 
          With normal (NTSC or PAL) horiz. line rate, the pots will
-         give a full scale (FF) reading with about 500kohms in one
-         frame time. With proportionally faster horiz line times,
+         give a full scale (FF) reading with about 500k ohm in one
+         frame time. With proportionally faster horiz. line times,
          the counters will count proportionally faster.
          This should be noted when doing variable beam displays.
 
--------------------------------------------------------------------------------
+POTGO
+-----
 
 ====== === ==== ==== ====== ================================================
 NAME   rev ADDR type chip   Description
@@ -227,7 +236,8 @@ POTGO      034   W   Paula  Pot port (4 bit) bi-direction and data, and pot
 			    counter start.
 ====== === ==== ==== ====== ================================================
 
--------------------------------------------------------------------------------
+POTINP
+------
 
 ====== === ==== ==== ====== ================================================
 NAME   rev ADDR type chip   Description
@@ -238,26 +248,26 @@ POTINP     016   R   Paula  Pot pin data read
         This register controls a 4 bit bi-direction I/O port
         that shares the same 4 pins as the 4 pot counters above.
 
-         +-------+----------+---------------------------------------------+
-         | BIT#  | FUNCTION | DESCRIPTION                                 |
-         +=======+==========+=============================================+
-         | 15    | OUTRY    | Output enable for Paula pin 33              |
-         +-------+----------+---------------------------------------------+
-         | 14    | DATRY    | I/O data Paula pin 33                       |
-         +-------+----------+---------------------------------------------+
-         | 13    | OUTRX    | Output enable for Paula pin 32              |
-         +-------+----------+---------------------------------------------+
-         | 12    | DATRX    | I/O data Paula pin 32                       |
-         +-------+----------+---------------------------------------------+
-         | 11    | OUTLY    | Out put enable for Paula pin 36             |
-         +-------+----------+---------------------------------------------+
-         | 10    | DATLY    | I/O data Paula pin 36                       |
-         +-------+----------+---------------------------------------------+
-         | 09    | OUTLX    | Output enable for Paula pin 35              |
-         +-------+----------+---------------------------------------------+
-         | 08    | DATLX    | I/O data  Paula pin 35                      |
-         +-------+----------+---------------------------------------------+
-         | 07-01 |   X      | Not used                                    |
-         +-------+----------+---------------------------------------------+
-         | 00    | START    | Start pots (dump capacitors,start counters) |
-         +-------+----------+---------------------------------------------+
+         +-------+----------+----------------------------------------------+
+         | BIT#  | FUNCTION | DESCRIPTION                                  |
+         +=======+==========+==============================================+
+         | 15    | OUTRY    | Output enable for Paula pin 33               |
+         +-------+----------+----------------------------------------------+
+         | 14    | DATRY    | I/O data Paula pin 33                        |
+         +-------+----------+----------------------------------------------+
+         | 13    | OUTRX    | Output enable for Paula pin 32               |
+         +-------+----------+----------------------------------------------+
+         | 12    | DATRX    | I/O data Paula pin 32                        |
+         +-------+----------+----------------------------------------------+
+         | 11    | OUTLY    | Out put enable for Paula pin 36              |
+         +-------+----------+----------------------------------------------+
+         | 10    | DATLY    | I/O data Paula pin 36                        |
+         +-------+----------+----------------------------------------------+
+         | 09    | OUTLX    | Output enable for Paula pin 35               |
+         +-------+----------+----------------------------------------------+
+         | 08    | DATLX    | I/O data  Paula pin 35                       |
+         +-------+----------+----------------------------------------------+
+         | 07-01 |   X      | Not used                                     |
+         +-------+----------+----------------------------------------------+
+         | 00    | START    | Start pots (dump capacitors, start counters) |
+         +-------+----------+----------------------------------------------+
-- 
2.49.0


