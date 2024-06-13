Return-Path: <linux-input+bounces-4334-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BE753906230
	for <lists+linux-input@lfdr.de>; Thu, 13 Jun 2024 04:57:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 723481F2247E
	for <lists+linux-input@lfdr.de>; Thu, 13 Jun 2024 02:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96C9E12C7E3;
	Thu, 13 Jun 2024 02:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="SjQTVGkp"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-40130.protonmail.ch (mail-40130.protonmail.ch [185.70.40.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18CC12CD9C
	for <linux-input@vger.kernel.org>; Thu, 13 Jun 2024 02:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718247430; cv=none; b=oAB5ZGgCVvXkevw9+9LKyXvtaGxSnXGB/M2eQscxUoeZ1BB1Gyrx8b5JhI2Nn98SUXPuiyHSBwfpHUzhc037t0AnWA743eja9numUJy+eLHZfr/JATlBdKppyOyH5ypcIRZF5OWLuZH3qEY0xvb+ad8ZYHeaHdorerLvW17Blao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718247430; c=relaxed/simple;
	bh=X2R/Lqe3yyTPproE8laMoHIAUueppVslkaDZtKIU3AQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=scaPRFExUXg2wWi1b3FmWfSpmWoUrEClQno+jXyyJ2CZj/X8rLDc7EnfD8opBqzUZnQXnGCg6xVXaobgeF8BHU79L8/KTFIGAOHjplET9N1cxUib5IKWgnXZi3aC8T5pl5dfT2rSwL0mE3QgKwPcOtUbfHyPMO2EIi9+kLW2i4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=SjQTVGkp; arc=none smtp.client-ip=185.70.40.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1718247427; x=1718506627;
	bh=lXG+SXSI+bu0iO+6Eh0TYcpfoJKVKHkixFTF9yc6DLw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=SjQTVGkpRORQEtDZgCjPpsln5nZcY6btSqE059m0Flg3aogO3BIOuuR+RiSvKVJV7
	 1eXwK5pZvA7a/AFX/003FIobvdUEAv1tbQRlxSUF660i11z0l7K09zOai1M73McPpR
	 AqAX/Ohex+ACZ/dfMWvOtIRT7IhvH0wr7QT3Mr0V2C0Kb+sMVQnEq8X8othklufWvg
	 ykNQSyWy3xL/6hCN8PqeqHyDi2cmPuVLif7XzIjdE+gUtrBIsDO9R2ZP7KEnzCHmFN
	 CyvAR8920QfUKfmASd/oM5AQjL9oblex0xhLsCsxF3fGeP5db4/h45N0aGVEhxOUhi
	 6Js/91rQwVyjQ==
Date: Thu, 13 Jun 2024 02:57:03 +0000
To: linux-kernel@vger.kernel.org
From: Raymond Hackley <raymondhackley@protonmail.com>
Cc: Markuss Broks <markuss.broks@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, Nikita Travkin <nikita@trvn.ru>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH v2 2/3] dt-bindings: input/touchscreen: imagis: Document ist3038
Message-ID: <20240613025631.5425-3-raymondhackley@protonmail.com>
In-Reply-To: <20240613025631.5425-1-raymondhackley@protonmail.com>
References: <20240613025631.5425-1-raymondhackley@protonmail.com>
Feedback-ID: 49437091:user:proton
X-Pm-Message-ID: 77572c561c77337988721220ea7e60757b362388
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
index 77ba280b3bdc..e24cbd960993 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/imagis,ist3038c.y=
aml
+++ b/Documentation/devicetree/bindings/input/touchscreen/imagis,ist3038c.y=
aml
@@ -16,6 +16,7 @@ properties:
   compatible:
     enum:
       - imagis,ist3032c
+      - imagis,ist3038
       - imagis,ist3038b
       - imagis,ist3038c
=20
--=20
2.39.2



