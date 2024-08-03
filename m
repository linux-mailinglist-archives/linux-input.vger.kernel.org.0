Return-Path: <linux-input+bounces-5301-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8442C9469AC
	for <lists+linux-input@lfdr.de>; Sat,  3 Aug 2024 14:34:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 29452B2126B
	for <lists+linux-input@lfdr.de>; Sat,  3 Aug 2024 12:34:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9474014EC5C;
	Sat,  3 Aug 2024 12:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="rUBbWjpD"
X-Original-To: linux-input@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F5E139D13;
	Sat,  3 Aug 2024 12:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722688479; cv=none; b=D00dGH/1yZ7zTwZs1zimh+q/a7niTTtsrA6TmofJFHNDfSIL+AqsQzHsKmF4AsL883gZlpZCHKIsOz41vAp194oDBs26ibekrou8lfV/kRg+j3IzO8nz8R6pyxTSeq9rrGRHywK4lAKW0TwraEILSIH3he6WLFfjt4a8Sv3KehE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722688479; c=relaxed/simple;
	bh=CVotvxt6Ev1/ZtBzJ8QQDB8T5gB/U5poMNIdk49m5XI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O4cjzJyJTgwJkUTjroS7XO/9fu0hze4EjJ/MHaq4I4rLJ+NsoBlt+cmj+coHTf2fZmppDf7Ej6M1jhYLsF75yRUNP5ZksvOCaU0porArreeT4XbywNO6MLYf7Lx21VBwgnGKsIVdgiBr8nKV4JUj9MnecxYXplkNWUux99s/jFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=rUBbWjpD; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1722688475;
	bh=CVotvxt6Ev1/ZtBzJ8QQDB8T5gB/U5poMNIdk49m5XI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rUBbWjpDJ0FMpe2L1fYTli14Y4L0ajrAMElC9kii/fQhCq32CYCaM3DXqWg4fvx4x
	 DWfx4TQaieI8wi47945+yAjdKHkIf6SEACROOlynD98uTyGzdwTtEsEd2Q2XWhwJmJ
	 SV2LSdW+gzKN3hT2amnXVoWm2IRMgGzDs2A5RokQ=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 03 Aug 2024 14:34:21 +0200
Subject: [PATCH v2 5/7] HID: constify hid_device::dev_rdesc
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240803-hid-const-fixup-v2-5-f53d7a7b29d8@weissschuh.net>
References: <20240803-hid-const-fixup-v2-0-f53d7a7b29d8@weissschuh.net>
In-Reply-To: <20240803-hid-const-fixup-v2-0-f53d7a7b29d8@weissschuh.net>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722688475; l=697;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=CVotvxt6Ev1/ZtBzJ8QQDB8T5gB/U5poMNIdk49m5XI=;
 b=DAHwlqPZPFEmSWBgWcpxXGqERIvNzcNxZ921KeGrv2S0WtMMKXxtSevfXcSqDfToJkuS6yjFN
 OnYGN3e+x9oBufeWJ8ytkA9e5j369JYJ31DqOorn4Ee5QZkPMiHzy1z
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Once a report descriptor has been created by the HID core it is not
supposed to be modified anymore.
Enforce this invariant through the type system.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 include/linux/hid.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/hid.h b/include/linux/hid.h
index 502bbc6f078c..c5fb43db0f2e 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -600,7 +600,7 @@ struct hid_driver;
 struct hid_ll_driver;
 
 struct hid_device {							/* device report descriptor */
-	__u8 *dev_rdesc;
+	const __u8 *dev_rdesc;
 	unsigned dev_rsize;
 	const __u8 *rdesc;
 	unsigned rsize;

-- 
2.46.0


