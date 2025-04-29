Return-Path: <linux-input+bounces-12065-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4A0AA07D9
	for <lists+linux-input@lfdr.de>; Tue, 29 Apr 2025 11:57:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70FE51898B0F
	for <lists+linux-input@lfdr.de>; Tue, 29 Apr 2025 09:57:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADF422BE7C3;
	Tue, 29 Apr 2025 09:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="YyoWkTsY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14232BE7A6;
	Tue, 29 Apr 2025 09:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.77.79.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745920596; cv=none; b=Kz1PRWGW+Mecm60IifWt9v1mDbwpxlzB6GmOiCcM9NJcycLm4a055V6vAMybD36Dsfj9xCOmKyZOa46CPo1BWHtjgNQODV+WvgP7vcNyT1WTYHwYa0e1/xqjZJruQmJJk9XJBPPWpULLw5Z1nXnNjt4yENiWapLkGH1Rtkuge4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745920596; c=relaxed/simple;
	bh=bsesO5INjgJ4tFPSiwNnw0t550lxr2iNO7jBXLmqZdg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HGAdmNsSFxTHsgCO9vxzRe+RKBxbctLvYhOD+db3QwmvVTtialiBNr3KjKe9Hji6Kn/XKjj/N0AKR8z6Wadkunxz4tkLmXbDex/DVHkwJbdP8ogJFKfWVgPAhkZxDnkRhCc3j7s9CnMl7eEMLAudUNiS8q4sq9HO8xF395RMyzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=YyoWkTsY; arc=none smtp.client-ip=51.77.79.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1745920584; x=1746179784;
	bh=e7lRdKMVAWll060Jx1VwcjOha4eoXllb41i279BmXrk=;
	h=From:Subject:Date:Message-Id:To:Cc:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector:List-Unsubscribe:
	 List-Unsubscribe-Post;
	b=YyoWkTsYuTVNJNIgYRFI3Zbo3S0jbeKL1ztrcAIsBSoUIh53SnnRAD2y1fXFiF8xl
	 2FXxiPIaKsjYJXNYYM1AGYgwZS59ViMDif7zAssWeOJ7HxXKDWRWFL3THbdlUaTbEF
	 l0tWbkM2COdfo9nGyXhzZTeHqzYakpLa0mAPV9KBOrC2TEW5hnG99TCEGLjyG3UNoT
	 i3+7H4hfeDZuEn03TDGmLZnMFeQiuqaKBdQc47K57wTqtZk3pzmvRPKRB+NJ7WKTiV
	 qyI2XvQof3zRLjUwPsENCZaAclmDYn6zxnDpWDle704vCpKzcgigIok8/M+lp9Pvqn
	 20VqIXX7JwkWg==
From: Esben Haabendal <esben@geanix.com>
Subject: [PATCH v2 0/2] input: touch: goodix: Extend reset pull-up fix to
 DT platforms
Date: Tue, 29 Apr 2025 11:56:10 +0200
Message-Id: <20250429-goodix-no-reset-pull-up-v2-0-0687a4ad5a04@geanix.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADqiEGgC/4WNQQ6CMBBFr0Jm7ZhSQIWV9zAsWhhgEmybFhoM4
 e5WLuDyveS/v0MgzxSgyXbwFDmwNQnkJYNuUmYk5D4xSCErUUqJo7U9b2gsegq0oFvnGVeHvaR
 S1aogcVeQ1s7TwNtZfrWJJw6L9Z/zKOY/+78ZcxRY1I9C61ulcj08R1KGt2tn39Aex/EFKzORQ
 b8AAAA=
X-Change-ID: 20250422-goodix-no-reset-pull-up-d2e4a9a3e07a
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hdegoede@redhat.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745920580; l=951;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=bsesO5INjgJ4tFPSiwNnw0t550lxr2iNO7jBXLmqZdg=;
 b=C20GlFKX0hPHfKIF6TVIZt5m8/eA5lFrv/t61lJ6y9g+Z1YKm6JSRJwkkAcEOIKyxCWnWZpIb
 BF3xZT0LSVwBxTfQ6kBNc3PV7zoMcAuVDJjcXvpFqQHjle/ktJesH4Q
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=

This extends the fix for platforms without external pull-up on reset pin
to device-tree platforms.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
Changes in v2:
- Added vendor prefix to property (goodix,no-reset-pull-up)
- Simplified check to only look at gpiod_rst_flags.
- Link to v1: https://lore.kernel.org/r/20250422-goodix-no-reset-pull-up-v1-0-3983bb65a1bf@geanix.com

---
Esben Haabendal (2):
      dt-bindings: input: touchscreen: goodix: Add no-reset-pull-up property
      Input: goodix - Allow DT specification of missing reset pull-up

 .../devicetree/bindings/input/touchscreen/goodix.yaml     |  4 ++++
 drivers/input/touchscreen/goodix.c                        | 15 ++++++++++++---
 2 files changed, 16 insertions(+), 3 deletions(-)
---
base-commit: 9c32cda43eb78f78c73aee4aa344b777714e259b
change-id: 20250422-goodix-no-reset-pull-up-d2e4a9a3e07a

Best regards,
-- 
Esben Haabendal <esben@geanix.com>


