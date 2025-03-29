Return-Path: <linux-input+bounces-11362-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 395E6A7574E
	for <lists+linux-input@lfdr.de>; Sat, 29 Mar 2025 18:28:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB3057A4C77
	for <lists+linux-input@lfdr.de>; Sat, 29 Mar 2025 17:27:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4153317548;
	Sat, 29 Mar 2025 17:28:21 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9970B372
	for <linux-input@vger.kernel.org>; Sat, 29 Mar 2025 17:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743269301; cv=none; b=Pthz6a/pNQ/kPA+q2a0RNxHXLqZ9kDWBZZlVaZ2YQDdXYz2vT44EjYstk0rM/vVMhfDuArmZmLAlBNKh4h3GGGAFZi/sSyRh4xKvnGdV8/ONqICXzd44UErcP8ytnsuhZs2mjg+3kKvO3wplis4KimZtlVLofy3jh6pIvXK0i1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743269301; c=relaxed/simple;
	bh=LxdejieMdCkbJiUUjGggNRTcm80Sp/56YuZGHmfgBB0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=igoRo4H8lrW7Foh8umkGVrsdiyrHxS+vqAR76nkZ5sg88+ebQqYlLcjM3zdDnNLwJz6Xk4qnc9bG1Cg4D9HtU8tkW8s4q7pQfXcGWVPZcDSZaEsMm1N+om6oHosMZd8Gf2GVdR8pZtO769vRuc8E+4QXMKi/TvYGimQxRIoFAYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=notsyncing.net; spf=pass smtp.mailfrom=notsyncing.net; arc=none smtp.client-ip=217.72.192.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=notsyncing.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=notsyncing.net
Received: from w520.fritz.box ([88.130.217.27]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MGhds-1tuiH01nUo-008Iti; Sat, 29 Mar 2025 18:22:52 +0100
From: Markus Koch <markus@notsyncing.net>
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	Markus Koch <markus@notsyncing.net>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] Input: fsia6b: Increase size of phys to hold full name
Date: Sat, 29 Mar 2025 18:22:37 +0100
Message-ID: <20250329172237.61874-1-markus@notsyncing.net>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Kt4zcblI3NlRT3rYdllX6JH/gUX5/qCVYrDztmtae+rxP1eHC24
 UAEbl6VoMmlKPuSV/WfptcTzq8qp7HKKPG5KP0d60b8bfw7fH+ScZ9EArbGgCqvvmGlUdV3
 /XKxnGjF2BhCxSA2quLf/wjrsddDh6ed+RBgKabloWbdYm1JlufNwj82AN2znqS8Edr2DWq
 MgN7enrOAjqdcLPoumEIg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Rznc1jCGr7Q=;haVyZeWy1LEIMdGAfjHzZJz3749
 m4kgmHYfawFv5BEbv2lhXmNZ/T58h94Dw0nw+ypyU/iVA3aUzlBVQnPA88Ygc/CBCaY6M0YID
 goTQ1c5iZkCvpqs5S9+3yoRQUlbPy5j7gn/Gz6IJ21OAAwzqoeWeuEchlJly+9td846G7PeBO
 Ot/7+D02fA8eY2tu5htjvGekwpv9zIzpYtGgnzDCtvXZN5K+pXww5H+PIeEYf/c1JO5lbAlEk
 n+yINgyE9OgadO0FuV157EgPK3N8eXt9VTGj5BtiAqhAFKaJT/JuA4kJ82zvzKiPehFfsVriZ
 Doogm6tnzaP2nfLtDaUUhxa6aI7H2MFVRlWiT18LfGDq1KbJO69h3FLk3Yi6Vnt1iQKfC9Yii
 thxPh6go0vpqlyoMKUX1k3rJrplAaYuj4NzWet104LT43375jMmUZ3oSSmGrzjjl52ZHhL7F2
 4/gHhriHAOwdSPNbaxW3QeaO0mll/e8WVSWp5Ple4P/sYeRGi28pBpWKAxImuiTJwby2mmfgL
 SUVtKNDM2LgKzzPoWp6a16tQW81iT2jq/QN6CpAZLE9ENRpZT4SkI5LpUzXiM3B11sdbEwVnL
 nD+lbxGx5aZ1KWXDylUzWa04FqGAanEyyo69AetCcoBRuDf6OyfNTZWpHjwjgCPIP+RyODjRh
 bVXcCyumEWiapJU/6kDISoh9osgB8aO4bmFGlPlC9LCnYq8mdWH+82e8ydpOyX0fVZ4gBJ5hF
 PCr6tG0GncUCBQxD6c5CCPNEeiifK4qgTGYP9MzAOChv1BdxaG7fh0UBZtCid7vPOKkoePvPy
 VMcZtIkMBFKDGjiVtTYJdidE9OI47h6eP8Okjk7tmY/dDAhL4ii9yACbaP4tfZfzkZ8hSiUMI
 UrLqi8U7LbT4HPYQf+42M6qVltm04bxSN4SlSLw/knoguPjw2AbPj1kg0WCTlDI6ZEBJfaeVu
 cJ91uMiSs1XoKfa6rs7smagMfz2EZPiKbOD5UHOIb2FP/veUrBNzLM71Ty/r8AgvJEvWBS5Dt
 MRAOgBbm8ht76/2gPaiTTgfMrqcNclbk2y0T0NYcYiDmxytAvR7joD4ZfjoAVGkFwnp+S5gLy
 OMudS28BwXy5foQe2zL7IxMJBK6qqzsucS44ijg48/WjQuA4yjUkFJ3HFz+5KYAcr8D+A6O+H
 UVGuodtWIRBqWfzoNEPuez3nREJKs+yYBLtk/Q14C27yaf0C9BbGFsFNifFjlh0UsUjiI0TO8
 bVI4O3BrJwiIY0k69EfVofJSLjHWkjt9u3SIcranqbjH+5K/HuoJEwjNxHdu4NVhzov1W862B
 lggiC/2A+PUPKUn5iLP95MuPxaJabr5QdByXE3/LuczDXnS4YyDbLaagU2+GlDCsWA3TRz14n
 1LLOZfDXQNbR8rXRZLrGjvrdtwDzZRaatB1Y3v1xi7yq3qemR1iCFfZtBR

The driver appends "/input0" to the phys name of the serio device.
This commit ensures that there is enough space in the variable to
do so.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202501020303.1WtxWWTu-lkp@intel.com/
Signed-off-by: Markus Koch <markus@notsyncing.net>
---
 drivers/input/joystick/fsia6b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/joystick/fsia6b.c b/drivers/input/joystick/fsia6b.c
index 76ffdec5c183..ef1a7a3a867c 100644
--- a/drivers/input/joystick/fsia6b.c
+++ b/drivers/input/joystick/fsia6b.c
@@ -56,7 +56,7 @@ struct fsia6b {
 	struct input_dev *dev;
 	struct ibus_packet packet;
 
-	char phys[32];
+	char phys[sizeof_field(struct serio, phys)+7];
 };
 
 static irqreturn_t fsia6b_serio_irq(struct serio *serio,
-- 
2.49.0


