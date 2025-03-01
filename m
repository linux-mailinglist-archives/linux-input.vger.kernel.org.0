Return-Path: <linux-input+bounces-10472-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62720A4AE66
	for <lists+linux-input@lfdr.de>; Sun,  2 Mar 2025 00:43:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 588571894D09
	for <lists+linux-input@lfdr.de>; Sat,  1 Mar 2025 23:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 365D81E8335;
	Sat,  1 Mar 2025 23:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q3b+nXd8"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E351D8A0A;
	Sat,  1 Mar 2025 23:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740872605; cv=none; b=lmctEAAYsw2qedsXWXFiq9oZVctJxZa7A98wVLhgID7LFLizNKa2dk0px6wapco9HsdhaPGxIokDUMUgRZyMYFyklHrKoZdwOzDDfyxRgZZSQ169Tna7FUFSOZoy7ivlgiUPht9tanxFFqCsjqfwffIN/DDqOSmwMMqGisZDYtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740872605; c=relaxed/simple;
	bh=xvkwrHUQz4ikYwZ+oJjWj0wK9PwJFZbjNab9K1Ea2Ho=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HfXPaCAztrU8a5k2E9ueTQZaaEZAezwe6EbpQAWGyn+diuch9nK7OG4eqhWQSfRjikwgLU3jfydmzI8+SZ2p5pJGylUEGx5dZi66I8BZB30774vm6bK8WM5VrAX9W2iSk9vwEfM/qg5Z2ESQ0N0h+HFwe7I2TvDAH8ZoXhRRihg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q3b+nXd8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 64D1EC4CEE7;
	Sat,  1 Mar 2025 23:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740872604;
	bh=xvkwrHUQz4ikYwZ+oJjWj0wK9PwJFZbjNab9K1Ea2Ho=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Q3b+nXd8u1wZojnltZbZXqFMBycgFIAlLEzBJOoV3y4SWj+SOOFbRE2mZLezz7uL6
	 j7y5kQuRQoFL8m3NewgImeSSmWImxIy8eqRYf/TYAVxzxpImUmAJMjpuoSamrhGQw9
	 FmZSLfbVyQ+Si9hxAHuO+4IQNnakmyuJT+9vZZiXe6D3/z3soCOzVVeAgaWpDfSoXD
	 1hqqIn+vzKglreKS1yxM62ab6JqG9ERXXNB4ceuomi5BmUsFvEeHkXJB8HNbxgYOCt
	 mmSRjl6oWuN+IPeKwMa+QGrh+BAY+H90WxRefxS1wGyYiI+Ut4bQhC5MeqLAnQuh4w
	 fG9biUqTmUADg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50E00C282D1;
	Sat,  1 Mar 2025 23:43:24 +0000 (UTC)
From: Joel Selvaraj via B4 Relay <devnull+foss.joelselvaraj.com@kernel.org>
Date: Sat, 01 Mar 2025 17:43:07 -0600
Subject: [PATCH v3 1/4] dt-bindings: input: touchscreen: edt-ft5x06: use
 unevaluatedProperties
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250301-pocof1-touchscreen-support-v3-1-af01c3b30b55@joelselvaraj.com>
References: <20250301-pocof1-touchscreen-support-v3-0-af01c3b30b55@joelselvaraj.com>
In-Reply-To: <20250301-pocof1-touchscreen-support-v3-0-af01c3b30b55@joelselvaraj.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 Joel Selvaraj <foss@joelselvaraj.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740872603; l=1445;
 i=foss@joelselvaraj.com; s=20241007; h=from:subject:message-id;
 bh=Hy7fx86jeHjmZUnnNlmFO22hJjV8J6P/Dt8ZLHz4/64=;
 b=w3OaW0bwYui19t6U+QjdY67xgmlCjqsQuvyEUP05iuber/3fCzp3Pyi1Ie8IlLa6z3AWLcWgR
 RD41JNDNl7PAeV4UHn615pYM21rfiwSz+Q75gT0yJYNKL/8nYsgFUHG
X-Developer-Key: i=foss@joelselvaraj.com; a=ed25519;
 pk=pqYvzJftxCPloaoUbVsfQE7Gwv8bynZPy8mjYohwMCc=
X-Endpoint-Received: by B4 Relay for foss@joelselvaraj.com/20241007 with
 auth_id=238
X-Original-From: Joel Selvaraj <foss@joelselvaraj.com>
Reply-To: foss@joelselvaraj.com

From: Joel Selvaraj <foss@joelselvaraj.com>

In Xiaomi Poco F1 (qcom/sdm845-xiaomi-beryllium-ebbg.dts), the FocalTech
FT8719 touchscreen is integrally connected to the display panel
(EBBG FT8719) and thus should be power sequenced together with display
panel using the panel property. Since the touchscreen controller uses
almost all the properties present in touchscreen.yaml, let's remove
additionalProperties: false and use unevaluatedProperties to include all
the properties including the needed panel property.

Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
---
 .../devicetree/bindings/input/touchscreen/edt-ft5x06.yaml        | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
index 70a922e213f2..ab821490284a 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
@@ -103,16 +103,9 @@ properties:
     minimum: 0
     maximum: 255
 
-  touchscreen-size-x: true
-  touchscreen-size-y: true
-  touchscreen-fuzz-x: true
-  touchscreen-fuzz-y: true
-  touchscreen-inverted-x: true
-  touchscreen-inverted-y: true
-  touchscreen-swapped-x-y: true
   interrupt-controller: true
 
-additionalProperties: false
+unevaluatedProperties: false
 
 required:
   - compatible

-- 
2.48.1



