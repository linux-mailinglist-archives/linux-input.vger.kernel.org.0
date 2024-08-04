Return-Path: <linux-input+bounces-5310-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 012C5946C08
	for <lists+linux-input@lfdr.de>; Sun,  4 Aug 2024 05:18:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE48A281CBB
	for <lists+linux-input@lfdr.de>; Sun,  4 Aug 2024 03:18:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 763E48485;
	Sun,  4 Aug 2024 03:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kaechele.ca header.i=@kaechele.ca header.b="TfrSGSIr"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.kaechele.ca (mail.kaechele.ca [54.39.219.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A416FCC;
	Sun,  4 Aug 2024 03:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.39.219.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722741527; cv=none; b=XaTd71gJR7yNfLByYnIOAXFQydkH/7iBtrVNaXEhrzH7Rb1akjms7PariEbHP/V8dZGHeQseE8/hmB+I8iJhnIcu7tljru1Hn4K3VRPxUX4y2X/gySKykSoa2E85/IhRz2q6/dwdOpRG1OqkoSsRsV4HXx5WNJ/fam55i2hyoeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722741527; c=relaxed/simple;
	bh=ddl0/l6MIRpo8hxmk6kXIFT/8Zq5luO/4mPPQwQDMBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=in2vCcGXaa/oBigTTTP8cpRcmzsWFCjrEQUXiVkjjOlOcpBFm0LkerJe5ILue67sksdAiwP5bEcHH9eYK35lrq17Sx32iDmdjOSr2LXLAi2W6ARynttVzWVFldEyeAYqzzmYQKR/G93M3Ot8xwxifeTtiK0OlPs9+oVHnHi+6R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaechele.ca; spf=pass smtp.mailfrom=kaechele.ca; dkim=pass (1024-bit key) header.d=kaechele.ca header.i=@kaechele.ca header.b=TfrSGSIr; arc=none smtp.client-ip=54.39.219.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaechele.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kaechele.ca
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7C1D2C006A;
	Sat,  3 Aug 2024 23:13:38 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaechele.ca; s=201907;
	t=1722741218; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=jd70HtEC774z+AwtPgsYb5kQahbRnuVVqjk9jKpbpOM=;
	b=TfrSGSIr0ruCqJOLWck6GVrVMdtMApgSBLrbpcoVW+WFJwaQV0cli7revIHdFcDGvbXQNB
	WiLdHwsyUYiaWleTA6VrHfGf14enNcSQnkDUGCVMsdRHY3oDx+SAAoF3KkC/7Mi1wCKmwE
	thK6KXG9qqgtvCPzOVatZ7GEsXLXaP4=
From: Felix Kaechele <felix@kaechele.ca>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: input: touchscreen: edt-ft5x06: Document FT8201 support
Date: Sat,  3 Aug 2024 23:13:09 -0400
Message-ID: <20240804031310.331871-2-felix@kaechele.ca>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240804031310.331871-1-felix@kaechele.ca>
References: <20240804031310.331871-1-felix@kaechele.ca>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Document FocalTech FT8201 support by adding the compatible.

Signed-off-by: Felix Kaechele <felix@kaechele.ca>
---
 .../devicetree/bindings/input/touchscreen/edt-ft5x06.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
index 379721027bf8..51d48d4130d3 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
@@ -42,6 +42,7 @@ properties:
       - focaltech,ft5426
       - focaltech,ft5452
       - focaltech,ft6236
+      - focaltech,ft8201
       - focaltech,ft8719
 
   reg:
-- 
2.45.2


