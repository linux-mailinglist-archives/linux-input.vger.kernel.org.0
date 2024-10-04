Return-Path: <linux-input+bounces-7080-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BED5F9904C0
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 15:47:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B65D1F2294D
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 13:47:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D5FA212EF3;
	Fri,  4 Oct 2024 13:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fQ0ZwCSu"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A1C212EE8
	for <linux-input@vger.kernel.org>; Fri,  4 Oct 2024 13:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728049617; cv=none; b=saIphcqt8bCHOHNTATVuhv13ephqiR8I8+G6qzMO75ZbFcx8qdd8bRzEz1QUBOaWOqqpM3zXZ8Kv4FavjdK2LAAXmoMfWVGM6kHcQKF7l///Zq3ZrJhPkm5nDBtHQjEW75LhidSDYMTgpkGK7f+wF0rSBsAsd0yti0HdIJAsLWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728049617; c=relaxed/simple;
	bh=kU9RMwVK7tK5tGrD9ncs9Bo5tDjNxEdbyC+uGRc5nuU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NAQ5cQjRAGrZqyRD0y5sHqzYmWsMg5acl2fj9pWWQU25WkKGkoAxX5v+8YgxrAFcEc/2rx5Dpc9xil157CTg6BVTZ+GHQ7Jjvp9vehegKF7WIuIfFP+Sb1Jx/8sXXuFI96huDquP0Bomyc2x1xm6AEFIOVqXyG4qGy4mPGm3B5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fQ0ZwCSu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C9CE6C4CECE;
	Fri,  4 Oct 2024 13:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728049616;
	bh=kU9RMwVK7tK5tGrD9ncs9Bo5tDjNxEdbyC+uGRc5nuU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fQ0ZwCSulZ/ZS74vxP1Qhd0L4JArmpfJQZOYxEmcE177MOHP/1UA2qNrzHfklaon1
	 M6zw+RnUMgiiAN5XmainvoBAWNFN/pAn1zfJMWEk5AD6eJt9/W3b0wxcxuyIAFc9n0
	 AU1B1Sg0QYLBafmH3FycceDoQhPXUWaDr28RD05m80leAipJjAsCvbO07fukI0HR+H
	 57uCn9Rf71XOUYc43ln4IRZvjeWcTx2LypN3mb2vf1CNiH+M35qJ7jesyeIptMvp4z
	 STRfxfSbEAcXgaqOjHP1QKaBDvr2hn/oaRCRh3UsFAAQtQIx/2oi1UEV8WdM/kZ5PW
	 32zRMghaPv1Ig==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFF84CFA779;
	Fri,  4 Oct 2024 13:46:56 +0000 (UTC)
From: Nuno Sa via B4 Relay <devnull+nuno.sa.analog.com@kernel.org>
Date: Fri, 04 Oct 2024 15:46:51 +0200
Subject: [PATCH v2 2/3] Input: adp5588-keys: error out if no IRQ is given
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241004-fix-adp5588-read-refactor-v2-2-275a093758ae@analog.com>
References: <20241004-fix-adp5588-read-refactor-v2-0-275a093758ae@analog.com>
In-Reply-To: <20241004-fix-adp5588-read-refactor-v2-0-275a093758ae@analog.com>
To: Michael Hennerich <michael.hennerich@analog.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728049615; l=956;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=Oyv6w1vVB0WsBBnLrEoR1/r+BQ9oW4zFkMd7v+3aoJg=;
 b=Fs81b3fJ5aOuuyMiSMYuhAbB6WFlTgIXVDF9IqQ/Hmv4MmfUO35qAse6aO2Xx0mjI01B3yVTb
 JSF+J+yuNOUA6O2PenI8BS4wpmYpwEylfSdLu1A6/o9mhFQtwyyTngE
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: Nuno Sa <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com

From: Nuno Sa <nuno.sa@analog.com>

If the keypad is configured, it also depends on the presence of an
interrupt. With
commit dc748812fca0 ("Input: adp5588-keys - add support for pure gpio"),
having an interrupt is no longer mandatory so better check for it when
it is indeed mandatory.

Signed-off-by: Nuno Sa <nuno.sa@analog.com>
---
 drivers/input/keyboard/adp5588-keys.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/input/keyboard/adp5588-keys.c b/drivers/input/keyboard/adp5588-keys.c
index 11a70ee18482..0152e4fa088c 100644
--- a/drivers/input/keyboard/adp5588-keys.c
+++ b/drivers/input/keyboard/adp5588-keys.c
@@ -680,6 +680,11 @@ static int adp5588_fw_parse(struct adp5588_kpad *kpad)
 		return 0;
 	}
 
+	if (!client->irq) {
+		dev_err(&client->dev, "Keypad configured but no IRQ present\n");
+		return -EINVAL;
+	}
+
 	ret = matrix_keypad_parse_properties(&client->dev, &kpad->rows,
 					     &kpad->cols);
 	if (ret)

-- 
2.46.1



