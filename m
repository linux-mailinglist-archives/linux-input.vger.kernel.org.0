Return-Path: <linux-input+bounces-5216-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 302B994223D
	for <lists+linux-input@lfdr.de>; Tue, 30 Jul 2024 23:36:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9DF41F231E4
	for <lists+linux-input@lfdr.de>; Tue, 30 Jul 2024 21:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1558A18E02E;
	Tue, 30 Jul 2024 21:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="UcR1fYmh"
X-Original-To: linux-input@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C4F18DF81;
	Tue, 30 Jul 2024 21:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722375373; cv=none; b=FdrjYkXI7z5lV663L1sy6rb++swUPvKL7zn0/YMTKMeHHH4+h8AawZ4sdfXmfz0mQtLw2Afiv8oeDeRG0oyVxhDWlQFqi8mfN0+WD1wu5jS35inx4Jz5ee+h4aAp8HvWyJ8p+1StVFttPRyJwj6EeoUOWVGY3y1Ugz1HsMIjWgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722375373; c=relaxed/simple;
	bh=HqF2jZdEKGHsJTB8RCtb6VbOiiZngzSQrgnKBN4QiNQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IV3KzcsIj5BWeHCA0sNJreqZhp5WmioXHlMdgVtp56iydBtUdSFU3nhwuz3W49CA93HM4A0DeM3VwlylTo+m4zS5wgrXgy1Lob4VhZB2EM9NeRY67pXV7f4jnKwK5ni8+c8hG8See4U8/e5Ol8/1MPXLBdlWgKqcrIklKOubqms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=UcR1fYmh; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1722375361;
	bh=HqF2jZdEKGHsJTB8RCtb6VbOiiZngzSQrgnKBN4QiNQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UcR1fYmhIPiLf7jSNGgsbQD5YJgGX21t74ttJmAZoGihKCoHCG1tgdoJYjB1xtmDi
	 6sDIQhLCymNmJbdazxZKXU8L0bT5bXe4VEvAZ9t6rJkt2uvFc2uRbX4Shmf6cmOvzx
	 WCUW7hT6KyFrjZzqVWZ/ueDUIWJuXPm27cLPjIUE=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 30 Jul 2024 23:35:58 +0200
Subject: [PATCH RFC 2/4] HID: cmedia: directly return fixed up rdesc
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240730-hid-const-fixup-v1-2-f667f9a653ba@weissschuh.net>
References: <20240730-hid-const-fixup-v1-0-f667f9a653ba@weissschuh.net>
In-Reply-To: <20240730-hid-const-fixup-v1-0-f667f9a653ba@weissschuh.net>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722375361; l=899;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=HqF2jZdEKGHsJTB8RCtb6VbOiiZngzSQrgnKBN4QiNQ=;
 b=gtPWFFwLa6VlvpwpvXzX9Y5A3YmU7yMB1ZFLFRqndnTDY02vBB5z4jQMMGm5xZMY3RgUQXWJR
 uSycQzj0cEMCUqiLNxX8nRSuaHRcKLcoDYMoftPMWEn3tdfADcBpoF/
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

In a future patch the return type of the _report_fixup() callback will
change to "const", but the "rdesc" parameter will stay non-const.
Avoid constness errors in that case by not assigning to rdesc but
returning directly.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/hid/hid-cmedia.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-cmedia.c b/drivers/hid/hid-cmedia.c
index cab42047bc99..0681d8882ac8 100644
--- a/drivers/hid/hid-cmedia.c
+++ b/drivers/hid/hid-cmedia.c
@@ -204,8 +204,8 @@ static __u8 *cmhid_hs100b_report_fixup(struct hid_device *hid, __u8 *rdesc,
 {
 	if (*rsize == HS100B_RDESC_ORIG_SIZE) {
 		hid_info(hid, "Fixing CMedia HS-100B report descriptor\n");
-		rdesc = hs100b_rdesc_fixed;
 		*rsize = sizeof(hs100b_rdesc_fixed);
+		return hs100b_rdesc_fixed;
 	}
 	return rdesc;
 }

-- 
2.45.2


