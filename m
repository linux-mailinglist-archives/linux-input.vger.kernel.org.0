Return-Path: <linux-input+bounces-10794-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FE1A6026F
	for <lists+linux-input@lfdr.de>; Thu, 13 Mar 2025 21:21:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 934B91896233
	for <lists+linux-input@lfdr.de>; Thu, 13 Mar 2025 20:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 967EE1F4621;
	Thu, 13 Mar 2025 20:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="LImp2y/Q"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E1C42AA9;
	Thu, 13 Mar 2025 20:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741897262; cv=none; b=QupDDVXlxdrJe8Z05gsne+OIEpjbC2/HGLceyT4ut5abLKPeJXYWQCrjUthCbRXfJuh/uNjqyTgwgcihgQpaZ5PPzjgdgLc/gKjjp5G3M5u3KUBMlJtVSDSpbeAJHi5ESliQYKsRR0CfbVkln2HgsNkLqUiKtkF03UVukAzDbiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741897262; c=relaxed/simple;
	bh=fwOTNTXHh6D8XHHTH16cZblAfCwJ7IJpJJPFeQmW7rM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HIqud2RQmCNFlD7uVIDJiF8drraH0HSUoFS+ondiCQ3z4JGyBM00eBIe83vwC/U1MHOTdmCgclWIGMFT2aBpxbZI02AdJFVNb8qcTZ7XF9OLALZq/znSH9R+ZFEvm5kktj63KfeC1etOc0zH2PG2Vah+jWXey9W319fOp1FD+L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=LImp2y/Q; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from karma.space.aachen.ccc.de (xdsl-78-35-81-182.nc.de [78.35.81.182])
	by mail.mainlining.org (Postfix) with ESMTPSA id AAEECBBAEE;
	Thu, 13 Mar 2025 20:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1741897252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6VRkf6/XIxGZmE6+oxrQWL86spw8xiykOIkC41MBvTc=;
	b=LImp2y/QgJtJ76Yxh25a702jD4UTxC2D1kgJLxs0/GDXLpurH7XSN8nAu6RA6lJkNY+4w0
	2+8DSpCIpwK3Ns5Ip51f05C/uUGe7hq7HapVfAvjX0rI7ZBW+jADMkbSrQjGhzsYaU4moM
	AxAp/lWcwpVC6vHcVYF34tRrejYPJ1+fIyWiyTeFGi90Wqt+ElXjykeePBfwI1zLVEffTI
	YqwaHK2Kghol9AIFlnnmh+3Tr6rbSYPASSqRHqwARpayYNjY4juLuLh0CMNiGr6LBtsLCa
	kwDaWK5SxHPnXAGAtFyF1vIqGYF3/GWHoEs6haZ+7bP+eZ+dR3pXwQfQL7N1aQ==
From: Jens Reidel <adrian@mainlining.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Selvaraj <joelselvaraj.oss@gmail.com>,
	Oliver Graute <oliver.graute@kococonnector.com>,
	Felix Kaechele <felix@kaechele.ca>,
	Andreas Kemnade <andreas@kemnade.info>,
	Fabio Estevam <festevam@denx.de>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Yu Jiaoliang <yujiaoliang@vivo.com>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	linux@mainlining.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Jens Reidel <adrian@mainlining.org>
Subject: [PATCH 1/2] dt-bindings: input: touchscreen: edt-ft5x06: Document FT8716 support
Date: Thu, 13 Mar 2025 21:20:16 +0100
Message-ID: <20250313202017.19621-2-adrian@mainlining.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250313202017.19621-1-adrian@mainlining.org>
References: <20250313202017.19621-1-adrian@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document FocalTech FT8716 support by adding the compatible.

Signed-off-by: Jens Reidel <adrian@mainlining.org>
---
 .../devicetree/bindings/input/touchscreen/edt-ft5x06.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
index 70a922e213f2..ed23acd0c9a2 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
@@ -43,6 +43,7 @@ properties:
       - focaltech,ft5452
       - focaltech,ft6236
       - focaltech,ft8201
+      - focaltech,ft8716
       - focaltech,ft8719
 
   reg:
-- 
2.48.1


