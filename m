Return-Path: <linux-input+bounces-4490-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFB7910917
	for <lists+linux-input@lfdr.de>; Thu, 20 Jun 2024 16:56:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D149B24B50
	for <lists+linux-input@lfdr.de>; Thu, 20 Jun 2024 14:56:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32A251AED28;
	Thu, 20 Jun 2024 14:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kaechele.ca header.i=@kaechele.ca header.b="VQDuihoO"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.kaechele.ca (mail.kaechele.ca [54.39.219.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38521AE083;
	Thu, 20 Jun 2024 14:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.39.219.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718895381; cv=none; b=kPEmkFnQ19JZSoZBtNmkjl8MOvndOydNYvD2Tom901Ss+p69lnlNyjVrlU0FpifTt11AhkUMidV4I5X67n6zV4madDZuLX+xfV9J7gd5EmcgOGUlv9wkCtyKxO3GQbRAdtyvhIjbHjRQ0XEHlhpBzhF7Rj2QEjt65rEFApbVWHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718895381; c=relaxed/simple;
	bh=HELkkarDKoiIzgewN1eHfJl5FJ8bH/Y/B9z+tSNdslE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jg6OhHWZ1Cwblab9Gmy1ihCoO4RnMHW6zin9oldHeShkJwwdrkLRceBYIQDVYYyQy9LEPxX9em3KRpeAWfsJ8NKBvXLTlMCvT68p1IghOEH3CQrRK/B9Jb8qGErix5Z7Tqt5UGtxuNn7eFMn15h2jTk78Pc1pCO1gNAZPMpanyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaechele.ca; spf=pass smtp.mailfrom=kaechele.ca; dkim=pass (1024-bit key) header.d=kaechele.ca header.i=@kaechele.ca header.b=VQDuihoO; arc=none smtp.client-ip=54.39.219.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaechele.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kaechele.ca
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C2DE7C006A;
	Thu, 20 Jun 2024 10:52:05 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaechele.ca; s=201907;
	t=1718895127; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=ssK0mY4ZibiWPcJi3x1KxbtlmlbaryPSbpR5dRa8d/M=;
	b=VQDuihoOg2ciDxtC0nsjQITZvqJ8bEpAXylhKMfIAxQWTSKlT/jaZgLNbQU5tFmcq9nUta
	cH9BhFJ0VOtmlz9war3roacU/lv3Ko4e6UWn6xtzCKS41EDjeoe9Z06oYXfRkIiWJVvFmN
	7vI1p/bQHBsj8/O141y2Msck+OvNlJ0=
From: Felix Kaechele <felix@kaechele.ca>
To: Job Noorman <job@noorman.info>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/5] dt-bindings: input: touchscreen: himax,hx83112b: add HX83100A
Date: Thu, 20 Jun 2024 10:50:02 -0400
Message-ID: <20240620145019.156187-2-felix@kaechele.ca>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240620145019.156187-1-felix@kaechele.ca>
References: <20240620145019.156187-1-felix@kaechele.ca>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add a compatible string for the Himax HX83100A touch controller.

The HX83100A presents touch events on the internal bus rather than
offering a dedicated event register like the other chips in this family
do.

Signed-off-by: Felix Kaechele <felix@kaechele.ca>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
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
2.45.2


