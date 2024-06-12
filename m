Return-Path: <linux-input+bounces-4316-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD76690497D
	for <lists+linux-input@lfdr.de>; Wed, 12 Jun 2024 05:22:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9954E1C23779
	for <lists+linux-input@lfdr.de>; Wed, 12 Jun 2024 03:22:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A446374C3;
	Wed, 12 Jun 2024 03:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="Vhy73vMD"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-43166.protonmail.ch (mail-43166.protonmail.ch [185.70.43.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE8E2C1BA;
	Wed, 12 Jun 2024 03:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718162491; cv=none; b=SDpFSkZ6iJY7NSJFPjG80IhWOubH2NvuT6DXfS292381g/nknJCwVqt9RzUbDS0mN38s51BgI0ECNZjYvxNoCi8b/kpN/HQWngxL4vVKyk8b3SWpIal42MpIOCnH4JHwIv5ECl10e/kgnfA5zxvO1XGTQRVJ0Lgm9UNeGtmluiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718162491; c=relaxed/simple;
	bh=DWxPsEhJZsPyLSnh9ioNt5dXQHtNNFp1hy4BIqKzpF8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C/oWmzlx4CmJFFXsgm/KZNlxDhT12ATFWRcnR+s5FndzDR/ECtCX+fKHBlY6rmWkdZZnNFGFD3uUDn/aIr8jJthLCTAJKJyFjrZhC5GHJGsyHgKys1wmOrqT5FF5d3YhXL0+P+XX8q2uSUqFQtb5KhFkFpFC0mW+dBy9K5/Ir3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=Vhy73vMD; arc=none smtp.client-ip=185.70.43.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1718162487; x=1718421687;
	bh=H1GLr5Hux1N4JOpyjG066oNxDyD7VpK2fBNM2y98AvA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Vhy73vMDoLTJXkODvRsg1B6lSLY8TxMun2DqUxf9Ie8mkOfXc0euOywBNDt7aJGWK
	 AiFoO+/sDWSQPwJZehH1DUXJrP2KPwDjn+jC/YATFFGtoKRBVHpPXLgTRmbq2r8v6I
	 BHrLTkm4h4AUkJfR7958Ab5JvWPWDA63RKFAGoTr1IqDwKUeeuxTZ71MN3LcmEEk3d
	 Nv5eY76vIR1Z3dOsCtxLT+4Tiua4gR88hERiCI7Jhkl0gB6PG91EFapVZ2zghdKWlp
	 mRGGk8eqo5pN7f2gsiXMF2f8yrnxYWT6EmKGfJybAX+d69DUgkN1SYOtbr9G713Sfl
	 xQ40mwwsoS0Ug==
Date: Wed, 12 Jun 2024 03:21:24 +0000
To: linux-kernel@vger.kernel.org
From: Raymond Hackley <raymondhackley@protonmail.com>
Cc: Markuss Broks <markuss.broks@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, Nikita Travkin <nikita@trvn.ru>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 3/3] dt-bindings: input/touchscreen: imagis: Document ist3038
Message-ID: <20240612032036.33103-4-raymondhackley@protonmail.com>
In-Reply-To: <20240612032036.33103-1-raymondhackley@protonmail.com>
References: <20240612032036.33103-1-raymondhackley@protonmail.com>
Feedback-ID: 49437091:user:proton
X-Pm-Message-ID: 62ef74be6eb55fe10e27fc423f06e173d02acdd0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Imagis IST3038 is a variant of Imagis touchscreen IC. Document it in
imagis,ist3038c bindings.

Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
---
 .../devicetree/bindings/input/touchscreen/imagis,ist3038c.yaml   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/imagis,ist=
3038c.yaml b/Documentation/devicetree/bindings/input/touchscreen/imagis,ist=
3038c.yaml
index 77ba280b3bdc..2aea21bfe6ac 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/imagis,ist3038c.y=
aml
+++ b/Documentation/devicetree/bindings/input/touchscreen/imagis,ist3038c.y=
aml
@@ -15,6 +15,7 @@ properties:
=20
   compatible:
     enum:
+      - imagis,ist3038
       - imagis,ist3032c
       - imagis,ist3038b
       - imagis,ist3038c
--=20
2.39.2



