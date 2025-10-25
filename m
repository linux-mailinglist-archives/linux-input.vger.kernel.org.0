Return-Path: <linux-input+bounces-15714-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39313C08692
	for <lists+linux-input@lfdr.de>; Sat, 25 Oct 2025 02:25:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A79691C86756
	for <lists+linux-input@lfdr.de>; Sat, 25 Oct 2025 00:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D545B17DFE7;
	Sat, 25 Oct 2025 00:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HLlZF60Y"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C75618BC3D
	for <linux-input@vger.kernel.org>; Sat, 25 Oct 2025 00:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761351934; cv=none; b=n9oWy5hP7Y28Kp3hS1a+d+dC4cDE+OYBWYC9Kh0Tia2roMG8TxraNaAxPSZaCEol3JORdPkzNE6t/0PTBINz9dDQRXeL3KTTh1vvPJX9eDWbcRC2qJR/id5FjfAk3IRZDYAzUXr2+TniqwmZD1FW+4ZmdTuAtpGlBBTXLshHwho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761351934; c=relaxed/simple;
	bh=DV+93RqA20zYsiZVil2ilvoMWgypauFCp2tp4wJbtLo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PO9HB8TzxoKQSqYL4sgMPsI7yOMlZi76HX5+a6P7DBRC3Gs9++HHiggxQpdrTVpnSnuF0pSUoEHa2E5jgJ9Ish3URRyj9ynYAI78pwASAj9sIspPDwWGg4Ys7fpdHzlKyYfeGv5MMpY4dh2qd4dJxBOhTtAvs8YB4damfs0hMmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HLlZF60Y; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-27eec33b737so37919855ad.1
        for <linux-input@vger.kernel.org>; Fri, 24 Oct 2025 17:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761351932; x=1761956732; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yg5EzbqpAhrvR1YouHoLR93Qim7L8FFl5LtkM7LFT7g=;
        b=HLlZF60YKSxUJ+x1g16WArTv8b4FzBd5ac0WL7yqUU3mktlj8KqvC1RncFfe0Q/yAp
         mlvuKsN40DfbXfC8KRbbjMyxrEqOfiAakxSQiQ84bIW96HszAKfQwHbHi+Bjia1nNRwX
         VNcyOZcJjK+X60Ipefu9bU4qmhT315nFlwjcXrVj15o4u78CyTfqCy9Nc/GTi9QscNpJ
         OcMSgbKHSB75iPDP3F7HCJhSFXqzuf7/dzmXymK0icrFwLCKtV8Z4DKEYDjP0vLpHiMJ
         HJfIx2wtKdMmTVCOGdCRzRF/uTrEWyAHFIdwDlpu69Q03BAdKvMP7mY6Z8PcUFrxiscE
         498A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761351932; x=1761956732;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yg5EzbqpAhrvR1YouHoLR93Qim7L8FFl5LtkM7LFT7g=;
        b=H3xGVHL2XOFHTEPfs4PnjnQ3E8AadgY55YIRsiTnRBKdBnN9ns/vbHkfEIh+g6jWch
         x3M4nwlJ92AD7wMvSUnoXrsk5r0NY9SZFGOZD0k7bif8+shleGt2ZThbOlqlWpvpwUQa
         tUSWA/5m9khP1woaeg3kH8/7zE3siUa4dC0ws4flfKgjkTcsZvPdMn3H0sjgrsQisXC5
         W3fPjzl19E5i75G4BnGO94aoYVZNO8DWjdLNu+FTlH/MQ2JuKn7evKlCfGHxGV9GPbB4
         FBP1z4x4OPjyFPVv7Q66uqXRx7t2BiU5uvhxGAqdVVmDVXYPWvSkftAnVHqpYZl1JCUA
         ZVaw==
X-Forwarded-Encrypted: i=1; AJvYcCUT9xyALvA3JpeDBemXsgJdmraH1iLNtuS/7vBwWBXt3guLOnUYRm0ivSLb8FGMEAXh4uRLWDi5RGsgBA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6LWC4818FvH6TiUISb7wQDPymfEmjXxDcD2cGF9NXkEIa1/Oe
	54zwHLhGjLLekQJJR0DdIeeY+sBjLoAC1DEFTafpsLSz0OKqVn8nMA8j9JsmEiwT5d0=
X-Gm-Gg: ASbGncsrRDBtmdnbeI9NRf2zJUNTlGGy81FK08wW+htSccFS9IqgU1OeM05FGyFjBxB
	5pjdltIkCWFNaQ40WrWxF/gYMp7tMWUjkJlpKeTgQRyrk+JuP8h0gNGn9+Qf111B6Bk+0hGt7x9
	XURi8vV4ZL0NNSgSBf24lxLCBZm90X7EnDeGmmQviSN7vCAhbXQy+BMKHoS43lndIAf4j/lKETO
	cX9cDDouP8luXj1dd/Hw2G4u/ZEbiNl0yz4MDAMHkRKizoSs9XWOlw8i/+IIAOo1Ow+F/Pn8LbP
	o8OixzeiZslNriMu7qxrDxmALMhJVECQrLjyg/1zJzoh0lnWpvstu9UuUGXNNTFCx4Ade7P/UCT
	TY9SRV8GrG7B9S24E3YQROpHVr7pbK1+QE2xiNfWthrp44jGA1oF6OSHz1g39sMs0eo5MuQgNol
	iRDDm0c+fqtccqutLlZU65DSTPJo88UflM5g6bQxfgLQ4fP0CBevG0UW6W3fLftkUgSzqkxzt2b
	7xQgPWn01e902Ns07+3+raZFz4wAnHForx0JpiApUofT9Wsz0JXsQ==
X-Google-Smtp-Source: AGHT+IEmYwFaqV8z42kKVpm+csA5lgwwLVTZWeE7isuCiwv14jZl51eAVuMpwZ1A5qrZNvfHQofXdg==
X-Received: by 2002:a17:902:ce81:b0:294:918e:d230 with SMTP id d9443c01a7336-294918ed5edmr33375155ad.56.1761351932492;
        Fri, 24 Oct 2025 17:25:32 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf3f4asm4728885ad.11.2025.10.24.17.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 17:25:31 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 25 Oct 2025 10:24:36 +1000
Subject: [PATCH v4 05/11] mfd: macsmc: Add new __SMC_KEY macro
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251025-macsmc-subdevs-v4-5-374d5c9eba0e@gmail.com>
References: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
In-Reply-To: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=876;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=DV+93RqA20zYsiZVil2ilvoMWgypauFCp2tp4wJbtLo=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBl/JM7uT5j/5uLhmIJrXj0R4mce1dxacTk7SWbXtmDFt
 k1TQ7V0OyayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKhjrGPEwMUpAFNddpvhf8lXBsaJthzWLl7P+442dhqmB2rFujvXrvAzjZq0s8yAn5FhY5v2Wqd
 9hjPq9/XOutZTeMc+OfwDH1vU9kDLgg1Mbzh4AA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

When using the _SMC_KEY macro in switch/case statements, GCC 15.2.1 errors
out with 'case label does not reduce to an integer constant'. Introduce
a new __SMC_KEY macro that can be used instead.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/linux/mfd/macsmc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/mfd/macsmc.h b/include/linux/mfd/macsmc.h
index 6b13f01a8592..f6f80c33b5cf 100644
--- a/include/linux/mfd/macsmc.h
+++ b/include/linux/mfd/macsmc.h
@@ -41,6 +41,7 @@ typedef u32 smc_key;
  */
 #define SMC_KEY(s) (smc_key)(_SMC_KEY(#s))
 #define _SMC_KEY(s) (((s)[0] << 24) | ((s)[1] << 16) | ((s)[2] << 8) | (s)[3])
+#define __SMC_KEY(a, b, c, d) (((u32)(a) << 24) | ((u32)(b) << 16) | ((u32)(c) << 8) | ((u32)(d)))
 
 #define APPLE_SMC_READABLE BIT(7)
 #define APPLE_SMC_WRITABLE BIT(6)

-- 
2.51.0


