Return-Path: <linux-input+bounces-14954-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F44B8E239
	for <lists+linux-input@lfdr.de>; Sun, 21 Sep 2025 19:34:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4666944050C
	for <lists+linux-input@lfdr.de>; Sun, 21 Sep 2025 17:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5760A2749C0;
	Sun, 21 Sep 2025 17:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="EAj+dlII"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABD326E70D
	for <linux-input@vger.kernel.org>; Sun, 21 Sep 2025 17:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758476043; cv=none; b=TXN3PWk+pZIuJmQY0nrDG6FSHK1MS34fk3qoqw5qGrr3kDnyv1+tGtAUV+myFmrc8SZG/94UJyEOgRg9ermMQwJj+LSe330Kh6npvu8FJYcMVzY4OmMi9IJjWeMQNSlSWRV2Ri9AqT8xLInktQ7kK/3MERwMHnwBw2gdONFsHiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758476043; c=relaxed/simple;
	bh=U5rpBoUei7B3mGSsrABizF4eMV2IFAukcd+gEXdncFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LwRnW58dZ0iTwdrFv2w2TIyxmCZiVHsAFr8d5Nh4n1AR6p4mvYdiQnuAdHkO1qxgewSDUiop8+l2hoYNhCO6kQ65kazvc4nw0t3jiEe+JEbvbRayLdQNy6p6Gpre1maHXmEqi6e8dutjtT/EHDHMDoOcOI/73OpuihHiF2a03W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=EAj+dlII; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b07c2908f3eso546646766b.1
        for <linux-input@vger.kernel.org>; Sun, 21 Sep 2025 10:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758476040; x=1759080840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FzJWTSZGsWBx3i24RVD3dVzdxwVQmNlRx6nunjK1UCs=;
        b=EAj+dlIIBTB9kaQOcBw7UV47CTJ83QUI5B/zZ0Ah2mer3qenpabJ2+YN2SA4xOASag
         QJxL4ycyRwpCjP3UVrmy3983wE6erOMJNponKLEaXL+2yF8jo+WqWYcVTKi/q8GpyNcn
         SmQ/OMw1E6bLCQitVI+B7YIaCYv4YfXYzPdzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758476040; x=1759080840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FzJWTSZGsWBx3i24RVD3dVzdxwVQmNlRx6nunjK1UCs=;
        b=epajYGyKh5CTf3YAdNnSbFKdGKSYtGEYaqBUv1G/pkWo83iHIhAtO5oh6dZ9a4x/xR
         LlkqzZnDo//tuPJeJgFvmKVANlzDyaD54rCndbnU53L1ewV/Fr5d5t3yToEIYZ3v92BG
         Z7pCXAPhQAnKL+TpE1eHSNtsyGg7OshgC3JVcx7drgJcaVjOPRUDrirVEm5a+HrSdBN0
         WL45Y45EC4i05e1sjfnrFE+UBm7PkdkKPCS6crrfUU6jFtNyTM8OXQt6pnB7Cm95ewjj
         ytcYW0VRsV//ZkQxMzHvSbCwU7rvK+rNZqql6Q3Of5zOydYAu7BhJCv3mJJn1W1erTpm
         BySg==
X-Forwarded-Encrypted: i=1; AJvYcCUxOvRs+KfMYcf3UwIOzrvcjj6Us7U4VUV3nWpI9vZxYHApwjpHPJA3rwaNh8Sb9/iHLZi7YnD46ZnWHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCdS8K9ngvPzI/AFNVhDpHTK19EfK73Cedz+UXWHE6/AUyjqtZ
	636wsEEPV7+2ejHRfljsabnd06lrjqSsHDDfwC87kP+HtPkxHdM4FRvKu/lK0GO55JRg0JQt0MP
	BqjoJ
X-Gm-Gg: ASbGncs6pOzpGgnG2DjNFKyO/MkZXdoBf2+7PsKO+AYzjcdj77s6W/lsuzsVJJB3Vlu
	jVYBsk7IT8q4fv34X+MDqxw04j4GkYMZNyJ+4AwPhpgWqACDeioZuWbD8F/yo675+o6NunpCPRJ
	3NI1t6qxlO7fg13cdFbs/lNLqLYgVyuVUdZ/5HBIAnDKKXTC2QkknL5dRpm51lYqxsrTPgkvXAn
	fJh6EG9PkrGTzRworiaIrdijKlU05Cs3jxAc/0+P4Kl5Bejhrh+oi9MxCrlU/uZEvsvcbsAIb6s
	yDugno8eAJpq4KV7Uwud24dNGDOJfFbMbyJpGiVXiq/X2XX0U0lw7N+tf9orJK5+msOQxSpjpYO
	UdzDl4J8y+IDkPPHiK8bPfYT5U/ju2ACx5T3pEInV2cRgNcGMaHlGNNPBPzvsxFtKGG0xDvIV/r
	0UZYOvjUg9OH6yv23Bjpa4qS1RopLZ6CR7cb8kO6cSC3/zC1wKqsn+NIHUiA+jjFan
X-Google-Smtp-Source: AGHT+IGz0pd6yisb8PdKwdoXAN1/izzqJHKajxmZxcXhsHPhM86fjHeHGd4HkEVtbFTY3+U0FGA7cw==
X-Received: by 2002:a17:907:3d94:b0:b2c:fa32:51d4 with SMTP id a640c23a62f3a-b2cfa41a17fmr31404666b.3.1758476039775;
        Sun, 21 Sep 2025 10:33:59 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b2928cd31a6sm324347266b.102.2025.09.21.10.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 10:33:59 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	sebastian.reichel@collabora.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH v6 3/3] dt-bindings: touchscreen: remove touchscreen.txt
Date: Sun, 21 Sep 2025 19:33:44 +0200
Message-ID: <20250921173353.2641438-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250921173353.2641438-1-dario.binacchi@amarulasolutions.com>
References: <20250921173353.2641438-1-dario.binacchi@amarulasolutions.com>
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

Changes in v6:
- Put deprecated the properties added for the eeti,exc3000-i2c.
- Drop the example for the eeti,exc3000-i2c.

Changes in v5:
- Drop patches:
  - v4 1/5 dt-bindings: touchscreen: convert bu21013 bindings to json schema
  - v4 4/5 dt-bindings: touchscreen: convert zet6223 bindings to json schema
  because accepted

Changes in v4:
- For rohm,bu21013 bindings:
  - Drop description from reset-gpios
  - Simplify description of avdd-supply
  - Rename bu21013.yaml to rohm,bu21013.yaml
  - Add Reviewed-by tag of Krzysztof Kozlowski
- For zeitec,zet6223
  - Drop "Phandle to the" from vio-supply and vcc-supply dscription
  - Rename zet6223.yaml to zeitec,zet6223.yaml

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

base-commit: f975f08c2e899ae2484407d7bba6bb7f8b6d9d40
branch: drop-touchscreen.txt

