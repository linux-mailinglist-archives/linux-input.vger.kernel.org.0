Return-Path: <linux-input+bounces-5914-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD01962137
	for <lists+linux-input@lfdr.de>; Wed, 28 Aug 2024 09:35:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF3281C21612
	for <lists+linux-input@lfdr.de>; Wed, 28 Aug 2024 07:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C444158DDF;
	Wed, 28 Aug 2024 07:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="UWzbHv2b"
X-Original-To: linux-input@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CC0158DC1;
	Wed, 28 Aug 2024 07:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724830475; cv=none; b=qQLmd6XNgxnAtBLPKCG0Jt1rgb1hLwT0rN/U66HssyapBSuXrPZYa6vkCqtVTmJalrBEYA4Nr0kFR3fiRfjgA+dOKpcs4HomNGG2oFGcjNIq3JdmZvyhXsrxPCGEhXASI9lLug78QgFGw+lWxdR9pihKcrdf/w4ruBCdqcd0NRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724830475; c=relaxed/simple;
	bh=s8u6a9TkNPDcGsOU0zOl6US0uH9xifpDR4NGmMEERmE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s1tRBBvLFOlClHdT2ERL3r8r/ovmdrqU+cuyi2L//gPz2dQ/46wUatVa/cAvvACP1KM3cAZ0WHhfVAVRJaa4HOBnbFj2oPaDgnbXqFdoqmtIQOS/g3Zewtip5RBOO/NgbyFSq0Ls+nUxokAcUTOpSr98fUpgMMVn++I7DX00Jhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=UWzbHv2b; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1724830471;
	bh=s8u6a9TkNPDcGsOU0zOl6US0uH9xifpDR4NGmMEERmE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UWzbHv2b21wBcbAkI+O2+0VCHe7RMZoBHRrugmAJ0Qo53SCI1MYxZaviPRxh4FewA
	 7/6PHAepMXk5uye3kq+u0PeBT4rQeGFVZC/876lsh6/uOrruJXl+eSZEXuO4PHXRj3
	 zwxiVII5fDpguSpts4gVx77vRED+2iyFGeU3vLPU=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Wed, 28 Aug 2024 09:33:29 +0200
Subject: [PATCH 10/14] HID: pxrc: constify fixed up report descriptor
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240828-hid-const-fixup-2-v1-10-663b9210eb69@weissschuh.net>
References: <20240828-hid-const-fixup-2-v1-0-663b9210eb69@weissschuh.net>
In-Reply-To: <20240828-hid-const-fixup-2-v1-0-663b9210eb69@weissschuh.net>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724830449; l=712;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=s8u6a9TkNPDcGsOU0zOl6US0uH9xifpDR4NGmMEERmE=;
 b=Nk+sZP/Mai9floMTs4IIf93OTdj2RUxOZLh1K6vzzKDFZOYMWo8Z5i0RCLCN+hZcWxtUXGRcU
 aSpEpPCmNUwA3+AopI7PX9F194gHN7Km1H0yLUa1dUlm5scsMITwE18
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Now that the HID core can handle const report descriptors,
constify them where possible.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/hid/hid-pxrc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-pxrc.c b/drivers/hid/hid-pxrc.c
index ef38730e78ab..71fe0c06ddcd 100644
--- a/drivers/hid/hid-pxrc.c
+++ b/drivers/hid/hid-pxrc.c
@@ -17,7 +17,7 @@ struct pxrc_priv {
 	bool alternate;
 };
 
-static __u8 pxrc_rdesc_fixed[] = {
+static const __u8 pxrc_rdesc_fixed[] = {
 	0x05, 0x01,        // Usage Page (Generic Desktop Ctrls)
 	0x09, 0x04,        // Usage (Joystick)
 	0xA1, 0x01,        // Collection (Application)

-- 
2.46.0


