Return-Path: <linux-input+bounces-11809-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B9FA90A5D
	for <lists+linux-input@lfdr.de>; Wed, 16 Apr 2025 19:45:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D427C3BC7AD
	for <lists+linux-input@lfdr.de>; Wed, 16 Apr 2025 17:45:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08221214A74;
	Wed, 16 Apr 2025 17:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="poVs4j1q"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08FD154C17;
	Wed, 16 Apr 2025 17:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744825521; cv=none; b=m3cLa/OVoVUNddwMeDW7ikewV0kGchHbEklOAHs7+gP1MH4u1gt4DCl9Ilt0sCcJGAmGJFCg/h0QA40C+/itKTvMQapvFSTy3hsMmhiP1Jtxm5QGAK1JYqcso9zcdiqvjcZctp7Perm0PnxWBAhlV/yfDOUFGeOwixJCT1qnmkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744825521; c=relaxed/simple;
	bh=INhAtgzTbo+H9P90iWeVT1I+06inDlWJEEG+41qUq1c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WALEuYm0Ob+Kcc/EPAlp73B6ygXUpfhmhsBNHLFL/2u+V3yitXLU/U7ojknTj4vIJgW9gJ1a9As7HEaooJVnx/P0HhuYDlpJ+fikzvSMKOkAgdN5kUPWTj4OKswTITEtnAcpQPDS5h07nWhNMHjs3OHe7uTXkSRWwmwZjV5sfWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=poVs4j1q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44402C4CEE2;
	Wed, 16 Apr 2025 17:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744825521;
	bh=INhAtgzTbo+H9P90iWeVT1I+06inDlWJEEG+41qUq1c=;
	h=From:To:Cc:Subject:Date:From;
	b=poVs4j1qzHaSgPNBoCaQY9VleGrtK4KIDHxrF6jDFV7guhXfUwtBKNgFVC6Cp02qX
	 jfi+S7SUHj03VvAO1of9wiNMODEwfSbra9N6Q5hj25QxFiZpYq3MBvQXZ8yMU4vyyG
	 REtrao/EpwYsQiwVi8NSaJaIBXSHu+HtTmE4ySOsglj/7lYyD0CLnApZrOBcDdHEM7
	 3gXfZnF4V+TxWBQLq6Ei/Lqp+1jlRgRjodIIgV4ghW+vaYUjQgvGIuaFz5fRTAC6gv
	 AWGwheJPReFqrCotJa+w/BD7bVd9H/YXdQXE70uM6DmAmSu5YQLG2eI7L1OvIV1RLT
	 TKoiuzYPGu1Qw==
From: Kees Cook <kees@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Kees Cook <kees@kernel.org>,
	Erick Archer <erick.archer@outlook.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] input/joystick: magellan: Mark __nonstring look-up table
Date: Wed, 16 Apr 2025 10:45:17 -0700
Message-Id: <20250416174513.work.662-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1560; i=kees@kernel.org; h=from:subject:message-id; bh=INhAtgzTbo+H9P90iWeVT1I+06inDlWJEEG+41qUq1c=; b=owGbwMvMwCVmps19z/KJym7G02pJDOn/36x5tEVfWlVaPPLcvdbjK+TuXFZzNdtyacfem9cSG i7e0fgwraOUhUGMi0FWTJElyM49zsXjbXu4+1xFmDmsTCBDGLg4BWAiQV8Z/vBaZcebzA5JE793 oPLCjGNLs48HHziXvWjF/+cJaxNrdYoZ/tmrSHxObAn8lnLodIpyYuPpjEP61xLfGBzfGqrZdfX dRSYA
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

GCC 15's new -Wunterminated-string-initialization notices that the
16 character lookup table "nibbles" (which is not used as a C-String)
needs to be marked as "nonstring":

drivers/input/joystick/magellan.c: In function 'magellan_crunch_nibbles':
drivers/input/joystick/magellan.c:51:44: warning: initializer-string for array of 'unsigned char' truncates NUL terminator but destination lacks 'nonstring' attribute (17 chars into 16 available) [-Wunterminated-string-initialization]
   51 |         static unsigned char nibbles[16] = "0AB3D56GH9:K<MN?";
      |                                            ^~~~~~~~~~~~~~~~~~

Add the annotation and While at it, mark the table as const too.

Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Erick Archer <erick.archer@outlook.com>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-input@vger.kernel.org
---
 drivers/input/joystick/magellan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/joystick/magellan.c b/drivers/input/joystick/magellan.c
index 2eaa25c9c68c..7622638e5bb8 100644
--- a/drivers/input/joystick/magellan.c
+++ b/drivers/input/joystick/magellan.c
@@ -48,7 +48,7 @@ struct magellan {
 
 static int magellan_crunch_nibbles(unsigned char *data, int count)
 {
-	static unsigned char nibbles[16] = "0AB3D56GH9:K<MN?";
+	static const unsigned char nibbles[16] __nonstring = "0AB3D56GH9:K<MN?";
 
 	do {
 		if (data[count] == nibbles[data[count] & 0xf])
-- 
2.34.1


