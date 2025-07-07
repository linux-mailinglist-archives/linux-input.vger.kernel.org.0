Return-Path: <linux-input+bounces-13404-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E21FAFBBF4
	for <lists+linux-input@lfdr.de>; Mon,  7 Jul 2025 21:55:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86D4A17EA49
	for <lists+linux-input@lfdr.de>; Mon,  7 Jul 2025 19:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA4432676C9;
	Mon,  7 Jul 2025 19:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QwnAY5ta"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D2D2E3716;
	Mon,  7 Jul 2025 19:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751918099; cv=none; b=M+fltHoDR0DY7Ty2dmwYmZRLnj1e2sePm+e3EJVUWYJeAC+w1ItHeWM4NfL586XSsrQo3JZlfIsWcPiQB8P8OE+pDzB98rYkVeD2Slio7IPqwWX7niSTGmq3Gbu/WdneBb8tJCrfNqzt/kh7DnVI5OsmoZh1Jb2lmxqr2O3DZt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751918099; c=relaxed/simple;
	bh=oF91pBiPsZSokRv+yeOUOLKFw0wkKXlMGWEA4NgRpRo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HRLiTrXieySMFkk2+DL6yUr69dbOKdxpswniBfzveAGNgZ7+193Iv1aQmNYMuo38fKW3ezSXFpKcNnGe8VQkE8VXGmpHMxArZRJWPYVtkuDN3BFNXbCDRPnUkWBS01un+YJ+PeRtXEMOP3xlSToDGr18gBoQjXCu4d4mOwbxwwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QwnAY5ta; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 22FD2C4CEE3;
	Mon,  7 Jul 2025 19:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751918099;
	bh=oF91pBiPsZSokRv+yeOUOLKFw0wkKXlMGWEA4NgRpRo=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=QwnAY5ta7p/a/SRjSXn9iAk6BNZ3cbOfRfqm8+CTOschtjZNEYAydwtOEaA6oGiYR
	 9eaVtguEoBXNGEvdzj+1JlMZfLAJDftnYNtQXmESq+S6I9IjIwa208v8+TxKMBa0GG
	 IqYtBjO/YMh+krIt01kxzl5aRbaWPdnK3hEBv11B9pLSLj9PzUTxrIb8wcc1VAXWEu
	 rDuvVmpNxMyY+O8vrxFUA4mmkwBg3DYCVALt6TdLHO4yk2nl5TtQhLjjqsnB4AYlWt
	 D8mByO1GawCiYBbg35fpAVKFBoP142ziEp4nZYofaR7pCPJk9e1tci6xjUk+xQX9/A
	 7wu84aKkCFPHg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11CADC83030;
	Mon,  7 Jul 2025 19:54:59 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Subject: [PATCH 0/2] Input: synaptics-rmi4 - support capacitive keys
Date: Mon, 07 Jul 2025 21:54:24 +0200
Message-Id: <20250707-rmi4_f1a-v1-0-838d83c72e7f@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPAlbGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcwNz3aLcTJP4NMNEXXOjtJS05LSkVEMzEyWg8oKi1LTMCrBR0bG1tQA
 yrW3yWgAAAA==
X-Change-ID: 20250707-rmi4_f1a-72fdfcfbe164
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
 Vincent Huang <vincent.huang@tw.synaptics.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751918097; l=863;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=oF91pBiPsZSokRv+yeOUOLKFw0wkKXlMGWEA4NgRpRo=;
 b=OFzkxImMWeQxuZDTo4mVWBh591E3DHDwdQJKBMJSwQAaSxdLc3bYjfvJ3sgQHx4wZOpuVNfpX
 U9e730KsGKEBH9pGWTE6B7nTAhTEDWcuqVeIo2JIDhsc4nDrug+MTTX
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

Add support for touch keys found in some Synaptics touch controller
configurations.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
André Apitzsch (2):
      dt-bindings: input: syna,rmi4: Document F1A function
      Input: synaptics-rmi4 - add support for F1A

 .../devicetree/bindings/input/syna,rmi4.yaml       |  20 +++
 drivers/input/rmi4/Kconfig                         |   7 +
 drivers/input/rmi4/Makefile                        |   1 +
 drivers/input/rmi4/rmi_bus.c                       |   3 +
 drivers/input/rmi4/rmi_driver.h                    |   1 +
 drivers/input/rmi4/rmi_f1a.c                       | 145 +++++++++++++++++++++
 6 files changed, 177 insertions(+)
---
base-commit: 26ffb3d6f02cd0935fb9fa3db897767beee1cb2a
change-id: 20250707-rmi4_f1a-72fdfcfbe164

Best regards,
-- 
André Apitzsch <git@apitzsch.eu>



