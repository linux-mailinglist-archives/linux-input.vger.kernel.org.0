Return-Path: <linux-input+bounces-3676-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 049688C3127
	for <lists+linux-input@lfdr.de>; Sat, 11 May 2024 14:13:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3FCC1C20C6C
	for <lists+linux-input@lfdr.de>; Sat, 11 May 2024 12:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E406455E73;
	Sat, 11 May 2024 12:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kaechele.ca header.i=@kaechele.ca header.b="LZ1rkKqh"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.kaechele.ca (mail.kaechele.ca [54.39.219.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC845579F;
	Sat, 11 May 2024 12:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.39.219.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715429573; cv=none; b=Ep75zFLThsWkKzST8m2Xy81kRuRBkRrS9oaz0ebrq8VGwqf1NB4ZOiMqvYN+hLtVw2nTHOCK8GLvD6T+FfmIaw13af9W9QpeBszL0IHJpx+I+KBKUUwEXcHTyAWq8b9sxgslg8/ioAKQGev5uk8jBnX78e6e+Qh/zHdTN60Ccts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715429573; c=relaxed/simple;
	bh=Dx5XjY9ALJ/akRnE2LOI8pWxay0oLv1ntfOsOX1QzxE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jLXsrE20+Kp0oBXgxyXWXRtVuEs/Kq7qfvYlosqFp7ZS4b7qUqnB4iYCvQM48Sl5YykwCvKKHZTO493l11/p0kDSb8EW0UIzTgjiwx7g4eTs9PLjuf5syAECytkGroAc+qT495suMW3E6sDQoSNvnoJTXOmwx1lbTywtXKW3tOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaechele.ca; spf=pass smtp.mailfrom=kaechele.ca; dkim=pass (1024-bit key) header.d=kaechele.ca header.i=@kaechele.ca header.b=LZ1rkKqh; arc=none smtp.client-ip=54.39.219.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaechele.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kaechele.ca
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5CC14C006A;
	Sat, 11 May 2024 08:13:17 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaechele.ca; s=201907;
	t=1715429597; h=from:subject:date:message-id:to:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=YxymOJNRI8Z0PQsxSQjedn33vRAMVpksSWy+fNaWfAo=;
	b=LZ1rkKqhew+0DTRfM6xDZSxqvPHsGWggcIFDsZyrzhuT6hFClpqVXITQPmnyp63gvXl8kc
	4UTORcchB/eGY47B/Ejluf9uk0ulqgf5tAluzm+aVV57xOOvXKO5kfU/SWm6k8Hk/i2KAr
	G47Omc+MNTiHk2596W6qA9mYwlGzxlU=
From: Felix Kaechele <felix@kaechele.ca>
To: Job Noorman <job@noorman.info>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] dt-bindings: input: touchscreen: himax,hx83112b: add HX83100A
Date: Sat, 11 May 2024 08:12:22 -0400
Message-ID: <20240511121245.109644-2-felix@kaechele.ca>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240511121245.109644-1-felix@kaechele.ca>
References: <20240511121245.109644-1-felix@kaechele.ca>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add a compatible string for the Himax HX83100A touch controller.

Signed-off-by: Felix Kaechele <felix@kaechele.ca>
---
 .../devicetree/bindings/input/touchscreen/himax,hx83112b.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/himax,hx83112b.yaml b/Documentation/devicetree/bindings/input/touchscreen/himax,hx83112b.yaml
index f42b23d532eb..f5cfacb5e966 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/himax,hx83112b.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/himax,hx83112b.yaml
@@ -15,6 +15,7 @@ allOf:
 properties:
   compatible:
     enum:
+      - himax,hx83100a
       - himax,hx83112b
 
   reg:
-- 
2.45.0


