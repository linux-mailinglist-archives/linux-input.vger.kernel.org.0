Return-Path: <linux-input+bounces-14725-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6488CB56C3A
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 22:39:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18E7417AC37
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 20:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29D162E8B70;
	Sun, 14 Sep 2025 20:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="AUEv+5RM"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643462E888C
	for <linux-input@vger.kernel.org>; Sun, 14 Sep 2025 20:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757882316; cv=none; b=exAwEw1//iU48AIUIPey9zwlT22elC02VQgmpK5X7UTv65MWGke3u2JVOiJHB7R3wwl/sU9GzgA1tckqvdZZ9BVy1tETuneSNhNP6fyfUQCd/dJQSLjovExPdgPdIoaB79W6yMnmMMC3830EvEDqeg7UdAfA5Rjmf8spQCtuGnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757882316; c=relaxed/simple;
	bh=/oqsdERk1dOnIz7pgCq78P2/eMnzdLETqpsc7c8e0Qc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dbslFGAPiU4BUuhdkJRMu/ue/uCwPcSywaRFmMccQcjdpAQxWRzH6BT0XdIBY06ZarTwVzPhir9egDDhAuXzitO0wVNAUKiOC4FmpVUGVJNafLP3XIBnsZUNfAo0vxHpjzQ7AxyS352Q8lSSgm3TNw7pk+CssCG17mTe3PQTWyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=AUEv+5RM; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-62f277546abso1542357a12.3
        for <linux-input@vger.kernel.org>; Sun, 14 Sep 2025 13:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1757882313; x=1758487113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WRNP/ea+IMU+WtlCpH1FQlK5+aG3ehZbfYI0GGMGE9E=;
        b=AUEv+5RMQRhL0H3Xl4vvaCxpsYA97T0AUZxLK2E3rtq/Vmz+qWJ5G3w6mBAalpePcx
         3mOozxtcmp71efraIK1sebaI1Xb6GeMQV8Ra6b0h+ZYJycIE+bNGiHyCNMtf1wWCek5c
         utnz3Znd8hOSnx8/jnmC1g04rC/ow/YgPKHHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757882313; x=1758487113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WRNP/ea+IMU+WtlCpH1FQlK5+aG3ehZbfYI0GGMGE9E=;
        b=mnYU+rAwr81YFiNRnwcBp2lQhPIKyzJIwgLzdfF+P1h5EF/EI/wr8DYOXr83Cx/AP1
         Zk+zrB2AaZoTOrLLprWR0ya0GAUrozTusvGGrndoFOsZ8CUl3dLywU4oC+3fLyjqU2Vk
         5gfBNEB74RbZAbGe3s5CFllsaRPN5VP+rVOVgU6ih3sqm8WuPeUtjxzWvwsEPr67e60G
         CsKIIh0L6vWBlye21z153EXkiRaTM+5V8vs/crs0HHiFuh8eWZq5E5nEk79sGd/3haoS
         7/L3QqD0G3io4kjC912FLouWIh4z7AP4K6LHGAxzo+jasOaTPSq/aciNtavGpA7pEL/B
         /W3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUEhw3+RHDpB+KgfERtfOn0JeyaB29xfn/OlnF9aZTemvhePWk8AZ7TgLUoIQmhQepJSpsCy59xrNlK6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDkFLoQc+0q2WK+Ivms5b0Zd7huiX0ZuMIzf/lyx34gNOuOVpY
	HWazpM5XpEuZbdQas7Jal89gIRgFyVSN6OiZxG+YpNLQqv6pkq0xdixKgKlSF5A8PgQ=
X-Gm-Gg: ASbGncueQgw4oFX3zELLMCYpQymjIJTfcj5Nxglb5XG/0bNd8RpPJBbbjqq+YTHZtrp
	AB8xP1dNRqu2gKynVKzTF0aKcfeYwbElFFBGJad+eTa8hcCeD/7l87WJHK34V4V2XQIG67CUyal
	kW2koCGUbxAkSUbQ6gdGQBaDoAwaXYYu3ugOdlUFuONYYZR0SdTRIVJVf4Udicn0Q0WrReIJ1nW
	tM67ywJl6YUGsversC/It2ysPXPpD60b8bSUHia5jfBcR2aPtavPOG5VPxxEuyxb/mKethd3Dr1
	EGw5mzxjuk9Qq8B+SCozXNv2/eReVndWD0nvtD1IGH146cG/Y0EZ3p7Kc+EgldF14LCzdWqMcTT
	C2O51cGNOz5O36EHSblpuIy9DpQhsUxPOO0lEv+XYkGzjQi4/swbHro9E/heBv15favMqSc8c1e
	G3CiiHyoBifl42E6b5P7V5mdFmb+Ly1HE2GYeLaISEypY+xpxaahWrH8/inBV0Tpbkuo+XO+GB8
	dA=
X-Google-Smtp-Source: AGHT+IFmx1iKDCMnVdGgKnBLwcjUK2UHcFgx/Uomcucd/BtDSvIuEp4t1zmwRoy2VyM0EaarmQA9Uw==
X-Received: by 2002:a05:6402:2348:b0:620:d826:b4c9 with SMTP id 4fb4d7f45d1cf-62ed69ab473mr9494870a12.0.1757882312803;
        Sun, 14 Sep 2025 13:38:32 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62ec33ad242sm7803739a12.17.2025.09.14.13.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 13:38:31 -0700 (PDT)
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
Subject: [PATCH v3 5/5] dt-bindings: touchscreen: remove touchscreen.txt
Date: Sun, 14 Sep 2025 22:37:56 +0200
Message-ID: <20250914203812.1055696-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914203812.1055696-1-dario.binacchi@amarulasolutions.com>
References: <20250914203812.1055696-1-dario.binacchi@amarulasolutions.com>
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

(no changes since v2)

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

base-commit: df86f912b45c20e236060321c85fe35437e9325d
branch: drop-touchscreen.txt

