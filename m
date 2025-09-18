Return-Path: <linux-input+bounces-14850-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1494AB852EE
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 16:22:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7DEDA56001A
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 14:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C0F930F7E7;
	Thu, 18 Sep 2025 14:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="bXMnTo5M";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="o66lAM34"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC542D322C;
	Thu, 18 Sep 2025 14:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758204484; cv=none; b=FBWtqvAstOHhywxBTGmvgBAWcW9gTZQTuoMGEdW2LcOBK7HE2ZFwY9gyT5R9V/XKC174Z3403COWNLo4pGWGuoonWzyddQSOHZ1Y62UjkPiGdUaESjqy7cg9X3AqJUhLSLHY+NRynFzD3hsiou0SGz0hZci7IXqblBHPqwubmgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758204484; c=relaxed/simple;
	bh=CIg0t50kSpdFycdkAxgv7OQjjuSIhC3KEGQbrsyUA3E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mZ2u4B0UMK5qR147Ly08RKXkra/Omt8ISDAeIbrFfsnF1a3RNtkAlD0Wgkz+UJvGC/FZRmZZCTqBzC8evSGMXWViZS5TcKIWNKtWhjqbKR8AwSOilqo9RGjnpHJWWmEIbv6UlpipmtQnn08TKGTXNw5oGJ9A7Nt9R1PP2jGhUR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=bXMnTo5M; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=o66lAM34; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1758204207; bh=ekwgQKghcqoPBKPyzdUk6xz
	aQ7LiGLsoE4YjaAxKTAY=; b=bXMnTo5MpPMVRo8wOkB4171UDb3RCjC93xY3uK8HR9fi/Nepyg
	kWDTZJHgX22FS9pXGXY90WUIG2j7AJJR4xmcmk8bbTbC3tLIUE6vft83NtXdIlO1QfYI4sqXT8P
	lQ/dPEj08VC+6prSDitdY/pSWrVCIfKrovuJ+wuowSTbYA2QESTcpWD2Q3WNEv8cCHiJfD+jBHN
	kmLAPyY71Xa2AJQX8+6q0soZSoMnFmxPYTe6JA2mHx0k0N4UXvrNpBjMaLNrskzZG3iXQAfFtgh
	oCKhWXEunj6rUt1bXWCOfYOw2gttyU73whbfSYmozJ8kGM0b5HZORk++UZLgUeSpIyA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1758204207; bh=ekwgQKghcqoPBKPyzdUk6xz
	aQ7LiGLsoE4YjaAxKTAY=; b=o66lAM34b2pPX/6mMX9CkgkGkXG8jvQmkLuqG5Ah1xj476YMPw
	NB+pAMfNPDKNLO8jIYd0XVfiAi7zfcsXd7Bw==;
From: Jens Reidel <adrian@mainlining.org>
Date: Thu, 18 Sep 2025 16:02:50 +0200
Subject: [PATCH RFC 3/3] MAINTAINERS: add an entry for Goodix GTX8
 Touchscreen driver
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-gtx8-v1-3-cba879c84775@mainlining.org>
References: <20250918-gtx8-v1-0-cba879c84775@mainlining.org>
In-Reply-To: <20250918-gtx8-v1-0-cba879c84775@mainlining.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux@mainlining.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Jens Reidel <adrian@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=888; i=adrian@mainlining.org;
 h=from:subject:message-id; bh=CIg0t50kSpdFycdkAxgv7OQjjuSIhC3KEGQbrsyUA3E=;
 b=owGbwMvMwCWmfPDpV6GDysyMp9WSGDLOCKrVKOfMkJaomSD1tLPdOe7/Ga41OWuZ6+/viHhwd
 b0ze8C5jlIWBjEuBlkxRZb6GwkmV62/HZqfb7MaZg4rE8gQBi5OAZhIcCnDP2WlbTIsO5h/L/h/
 +HeP1qF1V7nXaelPmv94/cNjgnKP018wMrw67ppn/UktKVvg0PlZNc3CTLIZAiVLp+yXT2R6HP6
 2mg0A
X-Developer-Key: i=adrian@mainlining.org; a=openpgp;
 fpr=7FD86034D53BF6C29F6F3CAB23C1E5F512C12303

Add MAINTAINERS entry for the Goodix GTX8 Touchscreen IC driver.

Signed-off-by: Jens Reidel <adrian@mainlining.org>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8886d66bd8242ae76ca52393af3958435bf6b9a5..3a3b4f58522466db9e2ede7c900ff504c28d5372 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10544,6 +10544,13 @@ M:	Maud Spierings <maudspierings@gocontroll.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/connector/gocontroll,moduline-module-slot.yaml
 
+GOODIX GTX8 TOUCHSCREEN
+M:	Jens Reidel <adrian@mainlining.org>
+L:	linux-input@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/input/touchscreen/goodix,gt9886.yaml
+F:	drivers/input/touchscreen/goodix_gtx8*
+
 GOODIX TOUCHSCREEN
 M:	Hans de Goede <hansg@kernel.org>
 L:	linux-input@vger.kernel.org

-- 
2.51.0


