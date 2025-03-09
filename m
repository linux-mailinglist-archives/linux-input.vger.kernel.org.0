Return-Path: <linux-input+bounces-10655-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B25A5811B
	for <lists+linux-input@lfdr.de>; Sun,  9 Mar 2025 07:23:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4BB116AD0B
	for <lists+linux-input@lfdr.de>; Sun,  9 Mar 2025 06:23:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4443D1547FF;
	Sun,  9 Mar 2025 06:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="XiSjjG6k"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD7628DD0;
	Sun,  9 Mar 2025 06:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741501408; cv=none; b=ZfJbXLw6XEfv4j6MfZdYN0oQSBknaujrwu0F60bgHTvgcvWt/iv5J/13pEiNI5kva7SCj7MsD8tik22yPupk7h3W9ltlBkVGdG9/r+sXCG5ZsMpW6wghh9tLTNQcH66OTfN8K34IaQGiXsj6OEZ5gZ27qLD/jWS2DObKdCOawGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741501408; c=relaxed/simple;
	bh=7AfEAjVueD4CSg0GKlBjrHHbSydJfkmiSzoJ3cmfrYE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lxsWAg/wKv3uvLPSgqLsUDyzM+pDVHJqjJq8oYzijGL57YDbragYLFEN0/ega7oDCK7LnR3rQrTn3rO25M/nJ4dOZRLdNF/7VOKGkcs0Nahfg3AAVJbCCeF10oxJjbKHHx1859zRdQbEF+Xdf8qvgjHZ1XxwYi/HHa8uiXEeMqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=XiSjjG6k; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from karma.space.aachen.ccc.de (xdsl-78-35-222-202.nc.de [78.35.222.202])
	by mail.mainlining.org (Postfix) with ESMTPSA id 9AA8CBBAAE;
	Sun,  9 Mar 2025 06:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1741501398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iTh8al/QMgkOMLb604e8GnqZSp6qAfMwJFpoZXijTOg=;
	b=XiSjjG6ksLnrzhZw5P0dDjZNkkZimQAxPpWK81W+rqCx8Xw6ovI6g0+NMtNu5xfKfYX/vh
	2QmB1HBxSxg4nULwAcBBQ65fA1c07DxVWXGyIRdUfug6RVFfxQD4Q7UPzxJn0yfTDltyHd
	39acpdoRLb0ykeebDpl0IgqKNfJOCQl8s9rMNPhZRLnnwqjDkPHDzY+dmS3ICPI6hNxi3F
	LbpWV57inBjld4eYuJBmn59xBusUpIzDnmRSxCl+aUVoNpZEI8fK41xmKuxKYL+4Fz0jM4
	cByUOylx/gdJXzgmoHxAArDmJjQU20HiUhGPWjIV5RAsB4DpP7HrEYTb86SC8g==
From: Jens Reidel <adrian@mainlining.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bastien Nocera <hadess@hadess.net>,
	Hans de Goede <hdegoede@redhat.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	linux@mainlining.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Jens Reidel <adrian@mainlining.org>
Subject: [PATCH v4 1/2] dt-bindings: input: goodix,gt9916: Document gt9897 compatible
Date: Sun,  9 Mar 2025 07:23:14 +0100
Message-ID: <20250309062315.35720-2-adrian@mainlining.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309062315.35720-1-adrian@mainlining.org>
References: <20250309062315.35720-1-adrian@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the Goodix GT9897 which is a Berlin-A series touchscreen
controller IC by Goodix.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Jens Reidel <adrian@mainlining.org>
---
 .../devicetree/bindings/input/touchscreen/goodix,gt9916.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/goodix,gt9916.yaml b/Documentation/devicetree/bindings/input/touchscreen/goodix,gt9916.yaml
index d90f045ac06c..c40d92b7f4af 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/goodix,gt9916.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/goodix,gt9916.yaml
@@ -19,6 +19,7 @@ allOf:
 properties:
   compatible:
     enum:
+      - goodix,gt9897
       - goodix,gt9916
 
   reg:
-- 
2.48.1


