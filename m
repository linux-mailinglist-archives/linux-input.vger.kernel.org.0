Return-Path: <linux-input+bounces-13632-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 394B4B0D76C
	for <lists+linux-input@lfdr.de>; Tue, 22 Jul 2025 12:37:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1861F1C24FF4
	for <lists+linux-input@lfdr.de>; Tue, 22 Jul 2025 10:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76C062E2EF0;
	Tue, 22 Jul 2025 10:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Um0vZbyW"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7185A22688C
	for <linux-input@vger.kernel.org>; Tue, 22 Jul 2025 10:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753180640; cv=none; b=Mzafy2IpHV68j2M2SxZn73R4CUVXiA82uf74tdO5EApFZHGV/L5Gh5n4foh7zzdlzRhHYAJPPXNq0jfuysl2Leek4iPySo9yshR1LLrvIcgHnJ2b8eBI7WRuWvpIZZ0dSfOBT4r8NLjQEoU4VneLpZ0UtyaK3DDexEoftzfbJ/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753180640; c=relaxed/simple;
	bh=6DM9dMZAtcwlDKvhQvsmdFJDn+355Evyd4COdeLDukI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Whl+8B2kVk2MpI9QoFTXosQTFQRCa1UHm9QvqTklGdnno1H1Kl0qEZBH1brfdTTRXBHyyC273hWUdfxS3x3yNyv4VTTJzREUTsWrudKrAGdz75v3tlnVmemfdcxjGl0EIqIznZO46OV9WJ8wGV7aVGvFai436pWkTkDV4kA5Eq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Um0vZbyW; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ae6fa02d8feso777239366b.0
        for <linux-input@vger.kernel.org>; Tue, 22 Jul 2025 03:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1753180637; x=1753785437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtY6xQODciaFQXT13QEjMt2xFfxEtt0WYueluTMBhAE=;
        b=Um0vZbyWwagJoJVoyvzt10dufXbWiL9BGSf+gyy83x4GxniBv0Oh/KyASUkabJNAUv
         yqKz8yorgGOLhv3OffBbkgUhnovWOstmmvFbET8yAwMMQmzo3YJ9Am9WfQDFuHX1GGOj
         yG3YRxoz4ZeHiLmsNaqE9EDhg1eVta4sUyq4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753180637; x=1753785437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GtY6xQODciaFQXT13QEjMt2xFfxEtt0WYueluTMBhAE=;
        b=DJ7x/uDTZ9e5FfxV88gMpFmSzNgC7Twh4kTesbUbT0A3KYjaIJvfTcsjpzhEg+3U+x
         WrZRqlvJDuBg+aCRmtZk1ZxXToB2G4EO9q69PGsC8vE/3cD1+g6og1VVdwYiOGbBp0/q
         q7hQKz9Fbfn/NA40ptFcqxOUIbuNzYkNpyA7iNu9ASni6oCP9iaMh2G+3ivFYwfzHR2T
         1w9SryNXcyJlbjB9bJzuzmtCqzkiL+Dnkj++6qlRUsPjB1ejW5oNPmL5t5JUjZVvysSy
         2UzgeZ35ZMCSsBh4usLKeC0VKFlsbPCbBRzE3eI7BQ6uAZmpzMHL6A6l+6HD6ONfkkna
         AHHg==
X-Forwarded-Encrypted: i=1; AJvYcCWmkQMjH48B/Iq6hLo1Yvq/2K/+X88vm7uMJKHmzE5OjIdAj+zzlg1/VGasVlUsFvvSdJ0LwGv8ihyyiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzneIDfsVUOsPbqcN1hJ/+0JLG0/QBtRURBhw65Cc1soudc+ND
	TqV73uLR2sY5slfVpWIadvSi+2BdOx3WtmNYiBueoZBiLt0r9IyeuH8KvpzX6O8oKo8=
X-Gm-Gg: ASbGncufZPJRzuDFkM96vjs0abuI/FgMK7SU/5dOXQlchk8auXjNX/eeaNOs/q9Asaj
	93FMN9Kyids9oQG8uubKJQxg1pDuTVtlROirmjWAEJUm6l4iElBU5Qb8kMmQx/94ujbWCWpfH4v
	A+fDAJNh4PKJxcLpiw+58pHEBqr11Eni2ErT9JXI6p6MsMF6TuhIAzUyf+yT7c2duWEHXVgOwVk
	zlpis8I0kkpp7T8FjKUU5XNAYJIsVTqgDBhPy7puHW7W6iWwjj0QHh1iArPtipuLyN1UOzXCjgW
	FrpU+nXZyAcjvlY9t5/me3ELLKS0soBuJLIiHnPiSU35DPrLJwyhFaE74nPpIkCLpTtgPeiG3Tu
	GU3uXU1h+vMxx0XyfibHJ5Q12JKUAO1sIQneGItEZKt5Y96blP5uGsiE7AiQ=
X-Google-Smtp-Source: AGHT+IGaHOYHJrE7/OlnHeCdJT7X6M+1OGRNxK7Jx2o38iPchbY1YGECx/VXRXtQUdO2o2c/K0RoAQ==
X-Received: by 2002:a17:906:9fc9:b0:ae3:cd73:e95a with SMTP id a640c23a62f3a-ae9ce0d2aedmr2549138266b.36.1753180636628;
        Tue, 22 Jul 2025 03:37:16 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:2bba:d7b0:8e79:c982])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca310e2sm844568766b.79.2025.07.22.03.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 03:37:16 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org
Subject: [PATCH 2/4] dt-bindings: input: touchscreen: fsl,imx6ul-tsc: add fsl,glitch-threshold
Date: Tue, 22 Jul 2025 12:36:16 +0200
Message-ID: <20250722103706.3440777-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250722103706.3440777-1-dario.binacchi@amarulasolutions.com>
References: <20250722103706.3440777-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for glitch threshold configuration. A detected signal is valid
only if it lasts longer than the set threshold; otherwise, it is regarded
as a glitch.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 .../input/touchscreen/fsl,imx6ul-tsc.yaml      | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
index 678756ad0f92..2fee2940213f 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
@@ -62,6 +62,23 @@ properties:
     description: Number of data samples which are averaged for each read.
     enum: [ 1, 4, 8, 16, 32 ]
 
+  fsl,glitch-threshold:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0
+    enum: [ 0, 1, 2, 3 ]
+    description: |
+      Indicates the glitch threshold. The threshold is defined by number
+      of clock cycles. A detect signal is only valid if it is exist longer
+      than threshold; otherwise, it is regarded as a glitch.
+      0: Normal function: 8191 clock cycles
+         Low power mode: 9 clock cycles
+      1: Normal function: 4095 clock cycles
+         Low power mode: 7 clock cycles
+      2: Normal function: 2047 clock cycles
+         Low power mode: 5 clock cycles
+      3: Normal function: 1023 clock cycles
+         Low power mode: 3 clock cycles
+
 required:
   - compatible
   - reg
@@ -94,4 +111,5 @@ examples:
         measure-delay-time = <0xfff>;
         pre-charge-time = <0xffff>;
         touchscreen-average-samples = <32>;
+        fsl,glitch-threshold = <2>;
     };
-- 
2.43.0


