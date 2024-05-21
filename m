Return-Path: <linux-input+bounces-3761-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 324898CAFF0
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2024 16:04:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E122628443F
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2024 14:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9528C7FBAA;
	Tue, 21 May 2024 14:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aEkf1xqz"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617457F7ED;
	Tue, 21 May 2024 14:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716300187; cv=none; b=TOH1x5BbYZlmzShmZ1rIf+8Tmu/z+RWtUwwAPuI7hqSLokr7JZniempmvSOW36swe7wA3KJ/BBIHL42YLvlt0WZ2KcR0Ywu1YNe05a/U6cOyzpdzH+81QvxJB6AGTZ0p/1vBVD6XkXaiz9bmLTQMglifI2uEQUL++hAo/j4JSl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716300187; c=relaxed/simple;
	bh=7ZEgwSfTRP/dlX5FlfKuMRe1MRjNVmagUhquz/tHbcs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mmxIXuqA53HP7H70J75NxLMAdr+nhR1HmGLfqwwpCbWz/VcTXbI3pqicpEG4uI6ET81wA7F7zy2bYfCcN+e5lfCVfCAzsU2K08fO8hOuXzlupXEQi3waTACY5ASuL617MnzrPGd4SBEZCAIyK0vNpPDb6Uhx/b0002JRqGyVtto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aEkf1xqz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 182EEC32786;
	Tue, 21 May 2024 14:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716300187;
	bh=7ZEgwSfTRP/dlX5FlfKuMRe1MRjNVmagUhquz/tHbcs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=aEkf1xqz4U6ntzRKAyHCET5sfDe/XgDDjoz9xnuxDplK/a6LgPc2eJUr8fL9Ng+wb
	 i/TvBBNFx2rmktBvQ5xbUALp6q5ZAmY1YoDWeVwoYn1ng2fpU0BVxhqI8YqWkkfLDw
	 9g5qvvdpssh8ZunA4DbS7CMZX1N/aOPc66PghW9iDtudClma9R9IChu1SXJDgYIcC3
	 m9dx9n3IidBHapBVXxFfpF/R/L+BdrtwD92Jm38jkNlvx7BAApcc8aRPHht7NJ1Qel
	 TEBue0ONUHDgv5+RPyjzGepw1HJyWtmn/UFPxNmy8ixrtEz3tdn9HANkSZNaEdn2r2
	 QzLhaj9gaG2Ig==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED7B4C25B7A;
	Tue, 21 May 2024 14:03:06 +0000 (UTC)
From: Joel Selvaraj via B4 Relay <devnull+joelselvaraj.oss.gmail.com@kernel.org>
Date: Tue, 21 May 2024 09:02:57 -0500
Subject: [PATCH 1/2] dt-bindings: input: touchscreen: edt-ft5x06: Document
 FT5452 and FT8719 support
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240521-add-support-ft5452-and-ft8719-touchscreen-v1-1-2a648ac7176b@gmail.com>
References: <20240521-add-support-ft5452-and-ft8719-touchscreen-v1-0-2a648ac7176b@gmail.com>
In-Reply-To: <20240521-add-support-ft5452-and-ft8719-touchscreen-v1-0-2a648ac7176b@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joel Selvaraj <joelselvaraj.oss@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716300186; l=837;
 i=joelselvaraj.oss@gmail.com; s=20240420; h=from:subject:message-id;
 bh=PmHC2ulzR6NuEbASOPCRVTimkIgpsuWNPVJYpR8+BgY=;
 b=tco50ujfsz4zA97zYnuTnvJ076l7r4lofkiasmm7wUaMZA7TB/KVzUG40KF5mCbDoWcjzmxxw
 90+wBBfzLJ/A748IkXhK8MaflSfd1aU038pudd/s25VW5uK+/gOH3Pz
X-Developer-Key: i=joelselvaraj.oss@gmail.com; a=ed25519;
 pk=qT4gsuVtlPE0Dpr+tQA/Fumm7wzVP6qfeVaY+6pX04s=
X-Endpoint-Received: by B4 Relay for joelselvaraj.oss@gmail.com/20240420
 with auth_id=165
X-Original-From: Joel Selvaraj <joelselvaraj.oss@gmail.com>
Reply-To: joelselvaraj.oss@gmail.com

From: Joel Selvaraj <joelselvaraj.oss@gmail.com>

Document FocalTech FT5452 and FT8719 support by adding their compatibles.

Signed-off-by: Joel Selvaraj <joelselvaraj.oss@gmail.com>
---
 Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
index f2808cb4d99df..745e57c05176e 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
@@ -39,7 +39,9 @@ properties:
       - edt,edt-ft5406
       - edt,edt-ft5506
       - evervision,ev-ft5726
+      - focaltech,ft5452
       - focaltech,ft6236
+      - focaltech,ft8719
 
   reg:
     maxItems: 1

-- 
2.45.1



