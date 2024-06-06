Return-Path: <linux-input+bounces-4178-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B72D8FF485
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 20:18:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AB602B272EE
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 18:18:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9757C1990DB;
	Thu,  6 Jun 2024 18:18:00 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from forward206c.mail.yandex.net (forward206c.mail.yandex.net [178.154.239.215])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B982110E;
	Thu,  6 Jun 2024 18:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.215
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717697880; cv=none; b=FvRxStI+6yH4yIKPjp6o2s3+1Mu57pHIBpVhxilL+jDD+o7qIcNTC1bDueggmGGT/iwc9DCWVBjvCre1Tw5HFX93/5b5rvk208stIi/8pDGMiN37EIuRW+0rcgyM1+sAjtSDNgJOlLlgbJ17xJo2WdAMiLNEW9VtlnfRk0W5ffo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717697880; c=relaxed/simple;
	bh=sb1zLUYbrl2SIUPBtYUmpKxgCNkIxRuR8jn/SsRGZeU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KLuQcmSZld9hlbZYCxnZo4/kRPv5VAtoRbFigYbdrxTU7kAbSTZIrx2DJzokOIxK7fuZs7YIB1OuewytU0yav5HkesZ8Ab/sY51pNRBMAMH12utBn7vvZ7yWS+hSL74x1lPLWj0TdfdC7GFUFBqoVRegxUsIQ/d1Sli1Gk6also=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=travitia.xyz; spf=none smtp.mailfrom=travitia.xyz; arc=none smtp.client-ip=178.154.239.215
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=travitia.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=travitia.xyz
Received: from forward101c.mail.yandex.net (forward101c.mail.yandex.net [IPv6:2a02:6b8:c03:500:1:45:d181:d101])
	by forward206c.mail.yandex.net (Yandex) with ESMTPS id 318516710C;
	Thu,  6 Jun 2024 21:10:56 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-39.myt.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-39.myt.yp-c.yandex.net [IPv6:2a02:6b8:c12:5c02:0:640:1c2d:0])
	by forward101c.mail.yandex.net (Yandex) with ESMTPS id 26A3D60904;
	Thu,  6 Jun 2024 21:10:48 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-39.myt.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id SAexc4cOm4Y0-fLJE0kDS;
	Thu, 06 Jun 2024 21:10:47 +0300
X-Yandex-Fwd: 1
Authentication-Results: mail-nwsmtp-smtp-production-main-39.myt.yp-c.yandex.net; dkim=pass
From: Jens Reidel <adrian@travitia.xyz>
To: dmitry.torokhov@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konrad.dybcio@linaro.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jens Reidel <adrian@travitia.xyz>
Subject: [PATCH 1/2] dt-bindings: input: qcom,pm8xxx-vib: Document PM6150 compatible
Date: Thu,  6 Jun 2024 20:10:26 +0200
Message-ID: <20240606181027.98537-2-adrian@travitia.xyz>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240606181027.98537-1-adrian@travitia.xyz>
References: <20240606181027.98537-1-adrian@travitia.xyz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PM6150 vibrator module is compatible with the PMI632 vibrator
module, document the PM6150 vibrator compatible as fallback for the
PMI632 vibrator.

Signed-off-by: Jens Reidel <adrian@travitia.xyz>
---
 Documentation/devicetree/bindings/input/qcom,pm8xxx-vib.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/qcom,pm8xxx-vib.yaml b/Documentation/devicetree/bindings/input/qcom,pm8xxx-vib.yaml
index 2025d6a5423e..76a286ec5959 100644
--- a/Documentation/devicetree/bindings/input/qcom,pm8xxx-vib.yaml
+++ b/Documentation/devicetree/bindings/input/qcom,pm8xxx-vib.yaml
@@ -19,6 +19,7 @@ properties:
           - qcom,pmi632-vib
       - items:
           - enum:
+              - qcom,pm6150-vib
               - qcom,pm7250b-vib
               - qcom,pm7325b-vib
               - qcom,pm7550ba-vib
-- 
2.45.1


