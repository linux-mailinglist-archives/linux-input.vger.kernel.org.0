Return-Path: <linux-input+bounces-14564-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BD581B4FD5E
	for <lists+linux-input@lfdr.de>; Tue,  9 Sep 2025 15:37:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B59691666C2
	for <lists+linux-input@lfdr.de>; Tue,  9 Sep 2025 13:34:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 256A835207E;
	Tue,  9 Sep 2025 13:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="PBKxQNAD"
X-Original-To: linux-input@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4C9338F36;
	Tue,  9 Sep 2025 13:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757424709; cv=none; b=oR2LWQpO59dY72MxJNrSKRuWTwW2SscndO8vtW1ECj7qBjtuuC5qi6IMUVR1PF616vs9k3IS2FghUSF6vQpEYOKMw1QKsUs0dE+/6Zea73cL09ZwWBlSGndA2yT8bRHAIG8WPqrGc+B1+XwCvdWLxbaj8V0Pqvy6La7NsFFWhxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757424709; c=relaxed/simple;
	bh=MUCkbJyci6FlxOeX9Fzjxr+SBdqQ4dJ0Fs8P02ob960=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IswKTC42rle8MeHHx27W8w1u3gUzSEAwVOuhbXIe3Z9cwIgwC/7dCilJ00ZmjhrIA2ixnW5dEQo5SVIP4+1CEuYqaPp0Hp9Gfx3BdYKA7z8EvTb00Jk/UOxvvrrc9A1dMvXNGuh64Ym66fhcOvz8w56HvSHQPQ6hxq9XCjUJMQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=PBKxQNAD; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1757424243; bh=MUCkbJyci6FlxOeX9Fzjxr+SBdqQ4dJ0Fs8P02ob960=;
	h=From:Subject:Date:To:Cc;
	b=PBKxQNADQ1wU6hYpRa7M7VdzBma9YLrFHpez0aowA3ahvnfpgTeS6mXrlQSUYrG1b
	 zS3TxQ9K1zJV/h2cubSfFFvlNZmcfXloZQIe58tl+naz2Kb8yrjFKvLFuMhZUzGRwE
	 sW0Bnz8qhllDRSKcr9USFk4hIInpKNtOXZA8kD7U=
From: Luca Weiss <luca@lucaweiss.eu>
Subject: [PATCH 0/2] Disable wakeup for resin keys by default
Date: Tue, 09 Sep 2025 15:23:06 +0200
Message-Id: <20250909-resin-wakeup-v1-0-46159940e02b@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADoqwGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDSwNL3aLU4sw83fLE7NTSAt3UpGRz87RUc9MkC0MloJaCotS0zAqwcdG
 xtbUA5Z+Zpl4AAAA=
X-Change-ID: 20250909-resin-wakeup-ebc77fe75b81
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Courtney Cavin <courtney.cavin@sonymobile.com>, 
 Vinod Koul <vkoul@kernel.org>
Cc: Bhushan Shah <bshah@kde.org>, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1088; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=MUCkbJyci6FlxOeX9Fzjxr+SBdqQ4dJ0Fs8P02ob960=;
 b=owEBbQKS/ZANAwAKAXLYQ7idTddWAcsmYgBowCpIkgdumpvnEx7661RFD2SDQD1asBdsiAyQE
 dH3YqS4EfyJAjMEAAEKAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaMAqSAAKCRBy2EO4nU3X
 VsJfD/91TVsLO+puct88Pzhp7w8pLhpBCjTzDH+DW1SQ7TqOLtahwwU/SkrEsV9NR59ZTY8fu7d
 PS/aGx94LGR4BBTiBmUZg4v7/7ArV7UcgYxe4ciN+K3v2/YqITWhw/p2s6nSeacAaZB3OyMleOF
 s8LJYyBgmQtbU0vbmfImAKB1Gp3MjdrzhOQPbNlw3wsLNFtGlrff8C+iDxe80sdCVDitSevM13d
 jr/of0DjCjm0muzqBDXXkKzmmpcKeN2o329yPhTi8mRHYEe8D2JmgY68PD0XMT2kuID9TXRS8Yt
 4HTJNwwTt8ldL19IlzNFlywsI3gyEUHrtAXXZ1tIT8bpwi3y7HGwzaGoneXSxLEm7JRi0dJHQi3
 G/6+fP257ciUH4CYHHo5pKlfVbeKS2foS3nvzG4z+wTcMSsguftu+EWumDTBwEPQ2JMjjbRAK5y
 qbvYKbfp3IMYm1eA+gCLwmGsw3HmXw+vQe0wcV44h6lBGQJNiq6tSTkXdspJlcSGL1RuE+LIkZY
 JZZRenBmfMBPVnUd7B6hdw0o5aXnXjkgL4iJONswLeliODO6pQTG3DVIY+9Nha5+TnfAc76/0Or
 pnYfwPTiMTtkvMl41zW7xLHYWp/PJE/Xnaj6H9UjqcsnPNFH04bc3vb77qejx43lSyF4g56DYV7
 0BhwgsiEfArok1w==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

'Resin' (*Res*et *In*put) on Qualcomm PMICs is usually connected to
volume down buttons on devices, which are usually not expected to wake
up the device from suspend.

On the other hand, pwrkey should keep wakeup on.

Note, that this does change behavior by turning off wakeup by default
for 'resin' and requiring a new dt property to be added to turn it on
again. But since this is not expected behavior in the first place, and
most users will not expect this, I'd argue this change is acceptable.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
Luca Weiss (2):
      dt-bindings: input: pm8941-pwrkey: Document wakeup-source property
      Input: pm8941-pwrkey - Disable wakeup for resin by default

 .../bindings/input/qcom,pm8941-pwrkey.yaml          | 21 ++++++++++++++++++---
 drivers/input/misc/pm8941-pwrkey.c                  | 12 ++++++++++--
 2 files changed, 28 insertions(+), 5 deletions(-)
---
base-commit: 76eeb9b8de9880ca38696b2fb56ac45ac0a25c6c
change-id: 20250909-resin-wakeup-ebc77fe75b81

Best regards,
-- 
Luca Weiss <luca@lucaweiss.eu>


