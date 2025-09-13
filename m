Return-Path: <linux-input+bounces-14678-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D6BB55FE6
	for <lists+linux-input@lfdr.de>; Sat, 13 Sep 2025 11:27:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 919E9A080E1
	for <lists+linux-input@lfdr.de>; Sat, 13 Sep 2025 09:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E07022EB5CE;
	Sat, 13 Sep 2025 09:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="lzeFdCuD"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1C82EAB6C
	for <linux-input@vger.kernel.org>; Sat, 13 Sep 2025 09:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757755638; cv=none; b=b1uHFGMEzbzKcqRPqntDAW2ARmte1yfSFJbdhMIi7gVvX80isFwKe51FgMqxrX6zXHLttxWGJYn+69z4NFDscfh81OePUvq28ksP+jpV3xwqhMWC//YFc8UKHkM9m3a0AiksWYYn74kuBGlpnNwr0a7EpRz115kCErpSrjFhCtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757755638; c=relaxed/simple;
	bh=yrpiAloBhI4p4ZhNenjc/ytnMmXyltlftqvFi3+CYcA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TOmgQE86aTtTyOy2Ip6Nar3MYh3xoUVMEg1wGBp1e3kr2ZBLdjkO6jWKqOnxicdP4UQ+QpH3bQKKaYGoSv9wkzXJQtI1wNbBQD9FE2UqaLFVb8b0XR3/sxXBrSIG4GqMsEXaLDnY3SwgfaKWOBDkoytKLBDgcV4tTwXXx4Ch2vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=lzeFdCuD; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-62ee43b5e96so1907892a12.1
        for <linux-input@vger.kernel.org>; Sat, 13 Sep 2025 02:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1757755635; x=1758360435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZN4beYZHw/m6widRTHsuro02Y0QudB0qsvA1rFXjFHs=;
        b=lzeFdCuDsgEbKjIVR98zhARXXwYK/iplkNXgoRMed4pemjP2Gh04mmEdpMgHxlR1Jp
         A4uKxckus2VcJ+iwaqOMNv3/37VWQ9GrooWr2q8ijihdM+ar8kI6rrsdrkdsM55B2014
         aoHvkos6C8PT21/tx1O/d/8TJcNOI+CaqltLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757755635; x=1758360435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZN4beYZHw/m6widRTHsuro02Y0QudB0qsvA1rFXjFHs=;
        b=DuLfrqWIFFT5P2YPApPPBUFLG/wCeBEyvhQ3CRZl70bKXAnZKiGO8Nj582JSSzmu0F
         QRyppFF4q03bVDhqcxTTTmXrJsGoNvFnkX5D3of+KZH1nD2Bu5YdDFf/uWUblP11PhXS
         GcZX47YoNR1nHyEp28UOYx+l7nnlSTi0JbDsY9j0EzpW+ItBtpgR7kHyWHqKXorrhv6z
         EABaCoLYvn7YokTjPVAxMMf8BQlJ2vr5Bax9Juvn37V1Cwqqo9+CjLTu4U+F0qcgjMGk
         reCe9VV3N5ciKkzLTQx6zsrOnXpVk4bvTarVGGzmaxYYFhnlfMhW02fxauxnGkiAiy0a
         PWaw==
X-Forwarded-Encrypted: i=1; AJvYcCVFr5lTEJ5Hfv6dNrb/gMxys3KWB8a1EDud7LnDSUwJvjU2Z0fJWmFOxkyBSEeDld1emvFHWowhRASMgw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwALkQMEK2nH6bePEU41Y7G8zKOwSBRpWQuET7MrYTEcb0lIm1g
	GysNtTvOWP8bcps6WD0FoYVE/Foh8a1Wog2E8ALILcHyaGjh8GCqjcVVUlk2+chy/RI=
X-Gm-Gg: ASbGncvLV0LHAMGIQlO0WxdBUgfVF2pqxgxcHv1xUHRwawBnmjXRXGO/C3GsLzgQi22
	YRlrY2uAQZMBRcwL2ITbUrskTmaauWvSHhDDP22dF+6Ru+T2BIZMpQupi1rv6mLpXlC2KYGs6qh
	oiLgTYN4EDvihBMSA1L9okSAq4mPKW/2n6JZkl1tieHUcZxmwyyfOzx2jape8bH2AuIf5T0YrCn
	z6kWpLs/rfTAiMud5LDxcbYnJdwqbbCG1ygOpyPhtapAeSWyjt1YgjksmL+7h0j/5IXKPbl7cOV
	i7QlmeT/qB6M9pu1NPnVUOycYPO8dSCWXpAjBGQg+MZKL4Is90WJoQWNTGvVOBGoM+VJXarVVS2
	ZMViWHDrP6IKLSL+TxkI1qAUUalzCwcMyLsTUPqsuXA2RmoK0K/M0nvQmAIh029uPIisBnP9shk
	FF6WW4OvlWk6ZPdGLjT9WF7COrBJA6QLpwEMeGRz5sulwZRRzQGTsqlnSRJoS5TBVUM3dFOhOiL
	7I=
X-Google-Smtp-Source: AGHT+IHv7bNkL/Bm3DVHJJzKvLokKqToRNVyhlC2S70s85D3t3Bilce6lDaE7bZNFEYk4zHC7lh/yg==
X-Received: by 2002:a17:907:2d2c:b0:b07:9c13:153e with SMTP id a640c23a62f3a-b07c353e3f8mr586848266b.2.1757755635504;
        Sat, 13 Sep 2025 02:27:15 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b33478besm551705766b.99.2025.09.13.02.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 02:27:15 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH v2 5/5] dt-bindings: touchscreen: remove touchscreen.txt
Date: Sat, 13 Sep 2025 11:26:55 +0200
Message-ID: <20250913092707.1005616-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250913092707.1005616-1-dario.binacchi@amarulasolutions.com>
References: <20250913092707.1005616-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With commit 1d6204e2f51f ("dt-bindings: touchscreen: Add touchscreen
schema") touchscreen.txt is no longer needed, and since no other file
refers to it, it can be safely removed.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>

---

Changes in v2:
- Update the commit message
- Add Acked-by tag of Rob Herring
- Add patches:
  - 1/5 dt-bindings: touchscreen: convert bu21013 bindings to json schema
  - 2/5 dt-bindings: touchscreen: convert eeti bindings to json schema
  - 3/5 dt-bindings: touchscreen: convert raspberrypi,firmware-ts bindings
    to json schema
  - 4/5 dt-bindings: touchscreen: convert zet6223 bindings to json schema

 .../devicetree/bindings/input/touchscreen/touchscreen.txt        | 1 -
 1 file changed, 1 deletion(-)
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt

diff --git a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt
deleted file mode 100644
index e1adb902d503..000000000000
--- a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt
+++ /dev/null
@@ -1 +0,0 @@
-See touchscreen.yaml
-- 
2.43.0

base-commit: 22f20375f5b71f30c0d6896583b93b6e4bba7279
branch: drop-touchscreen.txt

