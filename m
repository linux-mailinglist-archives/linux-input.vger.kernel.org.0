Return-Path: <linux-input+bounces-12589-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 296ADAC40DE
	for <lists+linux-input@lfdr.de>; Mon, 26 May 2025 16:01:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8059F179554
	for <lists+linux-input@lfdr.de>; Mon, 26 May 2025 14:01:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82FAE20E6E3;
	Mon, 26 May 2025 14:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gvernon.com header.i=@gvernon.com header.b="FBLIAQVM"
X-Original-To: linux-input@vger.kernel.org
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAC91E3762
	for <linux-input@vger.kernel.org>; Mon, 26 May 2025 14:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748268059; cv=none; b=jMetp6gjeV6kj6Uzh63WJfJwDWF/p8lfyK/tNQ4kteTlxasGx5Rd2fw88aqt48ZccKoWeNw7ARgdavhRGHTdPyj7ZKVX+dtdTUnjV6rTtrh3ABfRbDTgo6LQBazBk/gDWuktb3w0hDoWvgKziUNcLCR3U6ObJnnkj577Fukw9L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748268059; c=relaxed/simple;
	bh=nMyPEDnf/zkddzZ2Cw4741aAO+yU0d/61z+A8WlOS94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tNsj2rIxJEtzLPZVaUHYDQs1RdVp894ndJ+pQn0aqfCIitTnkUMMLIFJDQgPbZiezVV7hVM1OC+QndqW4a6WY1d1C/W6XpvDoBjHFqkwtYjQMFItadpSPiWGV7x8ikwslOjT471khGU+rPGaaJDvfT1BKlkCBZFHovsYEw1upBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gvernon.com; spf=pass smtp.mailfrom=gvernon.com; dkim=pass (2048-bit key) header.d=gvernon.com header.i=@gvernon.com header.b=FBLIAQVM; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gvernon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gvernon.com
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gvernon.com; s=key1;
	t=1748268056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V6dGYyUwgVkfLIw2/DVw8Hb9GNF0VcyeeqTRDuJIL/A=;
	b=FBLIAQVMmdfIUncAJN6oqa+PKQUXox17Sv8De+wBqYNWky7H0t30it9SRYSgQ1JOmYz7Ey
	AXDSbnfDLv3hzEGyKbgIBfrrYUu/azuKE+gSYdPamgrSL4O5rX0Mht4E3D1URBTZfesCsG
	59DWMnU7iTfXY8dA8jI2SbqwIiNQ/Q2DIL6vuO6q7LjDFzr+FQ2G8c9FKrY+OpQ+76LSiH
	mKyReVAEgCccBBTUsWezHYP2LXwo4nbhVKbbAgLYifOAGZ387j/WZRqpdQ5GPE+okuuNYt
	cPLakPex6754Op1M2Zc/TbFyNxLUnnagCiy+xpMVLkKYYSMtg+kqkQZx8eOJNg==
From: George Anthony Vernon <contact@gvernon.com>
To: dmitry.torokhov@gmail.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: George Anthony Vernon <contact@gvernon.com>,
	bagasdotme@gmail.com,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v2 4/4] input: docs: Make headings compliant w/ guidelines
Date: Mon, 26 May 2025 14:59:52 +0100
Message-ID: <20250526135957.180254-5-contact@gvernon.com>
In-Reply-To: <20250526135957.180254-1-contact@gvernon.com>
References: <20250526135957.180254-1-contact@gvernon.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Make heading adornments compliant with the guidelines to improve
organisation of the page.

Signed-off-by: George Anthony Vernon <contact@gvernon.com>
---
 Documentation/input/devices/amijoy.rst | 42 ++++++++++++++++----------
 1 file changed, 26 insertions(+), 16 deletions(-)

diff --git a/Documentation/input/devices/amijoy.rst b/Documentation/input/devices/amijoy.rst
index cbc5240f8af3..a81e9de481c7 100644
--- a/Documentation/input/devices/amijoy.rst
+++ b/Documentation/input/devices/amijoy.rst
@@ -1,10 +1,12 @@
-~~~~~~~~~~~~~~~
+===============
 Amiga joysticks
-~~~~~~~~~~~~~~~
+===============
 
+Pinouts
+=======
 
 Amiga 4-joystick parallel port extension
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+----------------------------------------
 
 Parallel port pins:
 
@@ -19,8 +21,8 @@ Pin    Meaning  Pin    Meaning
 19     Gnd1	18     Gnd2
 =====  ======== ====   ==========
 
-Amiga digital joystick pinout
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+Amiga digital joystick
+----------------------
 
 === ============
 Pin Meaning
@@ -36,8 +38,8 @@ Pin Meaning
 9   Thumb button
 === ============
 
-Amiga mouse pinout
-~~~~~~~~~~~~~~~~~~
+Amiga mouse
+-----------
 
 === ============
 Pin Meaning
@@ -53,8 +55,8 @@ Pin Meaning
 9   Right button
 === ============
 
-Amiga analog joystick pinout
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+Amiga analog joystick
+---------------------
 
 === ==============
 Pin Meaning
@@ -70,8 +72,8 @@ Pin Meaning
 9   Analog Y
 === ==============
 
-Amiga lightpen pinout
-~~~~~~~~~~~~~~~~~~~~~
+Amiga lightpen
+--------------
 
 === =============
 Pin Meaning
@@ -87,7 +89,11 @@ Pin Meaning
 9   Stylus button
 === =============
 
--------------------------------------------------------------------------------
+Register addresses
+==================
+
+JOY0DAT/JOY1DAT
+---------------
 
 ======== === ==== ==== ====== ===========================================
 NAME     rev ADDR type chip   Description
@@ -159,7 +165,8 @@ JOY1DAT   Y7  Y6  Y5  Y4  Y3  Y2  Y1  Y0     X7  X6  X5  X4  X3  X2  X1  X0
          | Right      |  4   | X1                              |
          +------------+------+---------------------------------+
 
--------------------------------------------------------------------------------
+JOYTEST
+-------
 
 ========  === ==== ==== ====== =================================================
 NAME      rev ADDR type chip    Description
@@ -176,7 +183,8 @@ JOYTEST       036   W   Denise  Write to all 4  joystick-mouse counters at once.
   JOYxDAT  Y7  Y6  Y5  Y4  Y3  Y2  xx  xx     X7  X6  X5  X4  X3  X2  xx  xx
 ========= === === === === === === === === ====== === === === === === === ===
 
--------------------------------------------------------------------------------
+POT0DAT/POT1DAT
+---------------
 
 ======= === ==== ==== ====== ===========================================
 NAME    rev ADDR type chip   Description
@@ -217,7 +225,8 @@ POT1DAT  h  014   R   Paula  Pot counter data right pair (vert., horiz.)
          the counters will count proportionally faster.
          This should be noted when doing variable beam displays.
 
--------------------------------------------------------------------------------
+POTGO
+-----
 
 ====== === ==== ==== ====== ================================================
 NAME   rev ADDR type chip   Description
@@ -226,7 +235,8 @@ POTGO      034   W   Paula  Pot port (4 bit) bi-direction and data, and pot
 			    counter start.
 ====== === ==== ==== ====== ================================================
 
--------------------------------------------------------------------------------
+POTINP
+------
 
 ====== === ==== ==== ====== ================================================
 NAME   rev ADDR type chip   Description
-- 
2.49.0


