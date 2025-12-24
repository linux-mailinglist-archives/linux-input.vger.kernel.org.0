Return-Path: <linux-input+bounces-16683-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E378FCDBF06
	for <lists+linux-input@lfdr.de>; Wed, 24 Dec 2025 11:13:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD25730767F7
	for <lists+linux-input@lfdr.de>; Wed, 24 Dec 2025 10:11:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF466330B34;
	Wed, 24 Dec 2025 10:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="Kkg9Fi4f"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414CE2C11E2
	for <linux-input@vger.kernel.org>; Wed, 24 Dec 2025 10:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766571061; cv=none; b=RyFzhck0Dl8S1Qo6yad4k1oMMifzZXfiTuuS37+gm4xmEb05PvwMD5S/wo6YOF3+DuRdKBtRZnewZmjQKgsd2kccoc7Agy6kgmkv87gOIvtjXpwXtzZDHINZ2Xrukmv+BuYppQMYfAgJ4UrCiPvcgE5tUgbmoqsdIQt2EfYyKvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766571061; c=relaxed/simple;
	bh=opoRu0oShSE9vKmU4/Lbp3lEB5j8hPGGHo/PxJzsPwY=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ODU4FvVmLkpTBa0VDSSkjsDXht69g4XzA4MQmN6mISC1w0fr5waM5C++nRiSSVJ+Vp6bHTE0/Ty6Qq9sDxBEK1BTHnpHEZXqWAA6ShFr2pcdQMNEVN+mah0ETHv3+1WWN+g1OU4SRwmD0QEJS4Hm+kyPlrANmBnR2OQLK+DH7Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=Kkg9Fi4f; arc=none smtp.client-ip=185.70.43.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1766571052; x=1766830252;
	bh=VfGh99DaHyxuNNcjDG+xthx2dce/rPW4sAfjxa91af0=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Kkg9Fi4fM2KsdpLuiWTu21K4wiHEb6rvP77in2HFWQHzmZMfV2tqRfoyhaxPTpguI
	 caI6wtPmeldY+LFh532HngPY7lxjQkxey+Lun26WnwANF50eJKihDSWzRWhyB4C0B4
	 KQF5755tMSYNEMVsvlueisBrOLikmJQPL50fYgxbQ+1v8y0HnELrNSiU86rUJUiwHv
	 921YIz5XRth62KXzMTk9AidAekbwTDED4n4ax/s7vCyJ1fjIN57FX49SiuosBCNKc3
	 t0h2YMkCoaK/YWnT4XKast6Gstnco4aCfNI1PgXBx5TtwwiwrZxBebNWSnZJUpyOq0
	 SAeFkCSaABPBQ==
Date: Wed, 24 Dec 2025 10:10:48 +0000
To: linux-kernel@vger.kernel.org
From: Raymond Hackley <raymondhackley@protonmail.com>
Cc: Markuss Broks <markuss.broks@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, Raymond Hackley <raymondhackley@protonmail.com>
Subject: [PATCH] dt-bindings: input: touchscreen: imagis: allow linux,keycodes for ist3038
Message-ID: <20251224100941.3356201-1-raymondhackley@protonmail.com>
Feedback-ID: 49437091:user:proton
X-Pm-Message-ID: 20e023c92c0ef6208d6c92209203c9dee83e9a89
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Imagis IST3038 provides touch keys. Allow linux,keycodes for ist3038.

Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
---
 .../bindings/input/touchscreen/imagis,ist3038c.yaml           | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/imagis,ist=
3038c.yaml b/Documentation/devicetree/bindings/input/touchscreen/imagis,ist=
3038c.yaml
index 0ef79343bf9a..dfaffbc398d3 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/imagis,ist3038c.y=
aml
+++ b/Documentation/devicetree/bindings/input/touchscreen/imagis,ist3038c.y=
aml
@@ -55,7 +55,9 @@ allOf:
         properties:
           compatible:
             contains:
-              const: imagis,ist3032c
+              enum:
+                - imagis,ist3032c
+                - imagis,ist3038
     then:
       properties:
         linux,keycodes: false
--=20
2.47.3



