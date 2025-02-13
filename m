Return-Path: <linux-input+bounces-10018-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 25324A3491B
	for <lists+linux-input@lfdr.de>; Thu, 13 Feb 2025 17:09:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C2F2163C22
	for <lists+linux-input@lfdr.de>; Thu, 13 Feb 2025 16:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAA5C1FF7D8;
	Thu, 13 Feb 2025 16:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="XAHF7HjI"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB4014037F;
	Thu, 13 Feb 2025 16:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739462928; cv=none; b=m8q0GTmmBCAqHhgrV4V2zL9FB8OBQcnrMsbOESCDaunIc/nEg9AVhLIkWUhHcD4B8qznf0ZtEFR6IaBmzW3P1Dx/7+/rHLTLFUirWKmsWDdh24tBbL8suXuAUkE1oslUTytCAxydC4ozx3qXTmzrVK1tC+H41Gp/K2rSJEWzh6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739462928; c=relaxed/simple;
	bh=A/lCEuMa75fovArUpubEtG5hex3pzF40l1Uc5U/7dUs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uJjds20hZz3nQav564avmkRVN/rkd+2WhlTrtw9mmNNluSOTzQFU+g0nMIBxBU1FIx3UUrjBMbtoU1+iehWj5RjoQRP9SOe28bGFsaw3EPpwNcUnc2kSobwZZ63je4Vbnbs+blHJ1Yx+rV5osbWnqatvaGYy6yIA814yZpXeeb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=XAHF7HjI; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from wse-pc.fritz.box (pd9e59260.dip0.t-ipconnect.de [217.229.146.96])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 473FA2FC0050;
	Thu, 13 Feb 2025 17:08:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1739462917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AaVfo3vMuV2Raqt2pic6Kzvk+Q0btwYb50rAqP4ncM8=;
	b=XAHF7HjIDmh6ccfx0DzWI1xd9OSrzqIvHIzIzIZUXanq+zjjXyrQ7Jbm7Ww0yjpfiyubDQ
	ZWGJ/jMwY3a5HLGEaVR8wRMp7QB5L4Jq7zW6zWb6Jxwy1wIDAP7dzqGGmk0gpQ43DQoYxM
	zC9k/1wTEyCfLxWeugd6DsSTrglfPZM=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] Input: i8042: Swap old quirk combination with new quirk for NHxxRZQ
Date: Thu, 13 Feb 2025 16:47:09 +0100
Message-ID: <20250213160832.74484-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some older Clevo barebones have problems like no or laggy keyboard after
resume or boot which can be fixed with the SERIO_QUIRK_FORCENORESTORE
quirk.

With the old i8042 quirks this devices keyboard is sometimes laggy after
resume. With the new quirk this issue doesn't happen.

Cc: <stable@vger.kernel.org>
Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 drivers/input/serio/i8042-acpipnpio.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/input/serio/i8042-acpipnpio.h b/drivers/input/serio/i8042-acpipnpio.h
index 127cfdc8668a0..ea6ce258144e5 100644
--- a/drivers/input/serio/i8042-acpipnpio.h
+++ b/drivers/input/serio/i8042-acpipnpio.h
@@ -1219,8 +1219,7 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "NHxxRZQ"),
 		},
-		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
-					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
+		.driver_data = (void *)(SERIO_QUIRK_FORCENORESTORE)
 	},
 	{
 		.matches = {
-- 
2.43.0


