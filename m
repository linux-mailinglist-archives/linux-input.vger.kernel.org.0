Return-Path: <linux-input+bounces-2721-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8904F892C41
	for <lists+linux-input@lfdr.de>; Sat, 30 Mar 2024 18:58:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 010841F2298F
	for <lists+linux-input@lfdr.de>; Sat, 30 Mar 2024 17:58:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39F8D405C6;
	Sat, 30 Mar 2024 17:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kKaSRplx"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3197C3C484
	for <linux-input@vger.kernel.org>; Sat, 30 Mar 2024 17:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711821523; cv=none; b=nV1vJjw9Ku0A7fwFvg7921aJSfi4ehlAP4Lric5MsSXgiYfNJqvtjTwLF6T/ovYAJyIf6TI0sA1qy2bpeFuyEHLPFYhgW+gTfcjEc1W86d2C5RNJaq0i4a9C8UDm3RjJjd0574IwAg4rAQtyOuz+Q7yn1X3rHfY6+6k9uhFS+LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711821523; c=relaxed/simple;
	bh=gznZUdRjC840/RIpKY+qbDdAJIfZQ5O12HDGRmxBxms=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mLsIutmq49iL5WRAR3afvtKvtpNosRiDfMGLQWCd0CNi2a9WMdEKERPbbrm1peKzJbTO+X8HSa87Lpk/UaERJciRK4wBKGdVFsMJA4x2ywIylIULfMGc82aKv5JSh28ms5VMdIPl7qlvqZPhjVlFr6FRauljE4w6TtDLF7qkU18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kKaSRplx; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4154bf94fe4so11474745e9.2
        for <linux-input@vger.kernel.org>; Sat, 30 Mar 2024 10:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711821519; x=1712426319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QuHz7NbYphgsBERKb7Gi6jBAyiMkVdvzVzWkI73/WU8=;
        b=kKaSRplxr4TSUYPNLjqHl4XCyJCVQfQyGkzLvNg+0dWI596k65bnjwXajEk6ovJFer
         ueWceGhzRm2kmkvMxoBIghdPujTLKTqz9igOkbgQH0LAoOSGS63Fxi7MleO9Hfgt6tEz
         TEaIcVg99h3wZLYxmTs7QmIRl6w15lXuD4i5je5bKDNRSUHEN2dNnn+x0TUOtoQFeTno
         apoi8pj3EhHtxH9u6Hk99H0dNGkLMSkp0TEjD1NqAIu0zJZ2BCXVXV5fgceBt28pJ713
         rSRdUCQXNd+nC5dKoENMe8aqN2uJzUk9DwXmw+qIvRzzDh5cQsm27HSkRzXXBwuwfUP4
         GmxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711821519; x=1712426319;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QuHz7NbYphgsBERKb7Gi6jBAyiMkVdvzVzWkI73/WU8=;
        b=kTVNyv07Fu9N1PJ06KaJrpJgQWI8k0LSNcfj8JDLeN3mTeTQ803yKzTK21a4RvSyaT
         8YDd6sPa36blbbMaJVTufD4iYs4fUt/2NgfMiNtu4Ack7gJOt3jjp6xIVi34UVMeCoZm
         +bGA3K+ni3JGedcp34aUMBz1w2RI+C7EDR9md4UxpmApTzGm2OJmoBL3Xl1KwSOl8yiZ
         +vJLvC9xXS7JO//zK0g/DfTdilKEMdR4BwRkid2Rfqpvq/CcCIRWeDy3hQMzhvXKWCJY
         xKc6h7mKCGYZ3Mc97uySpnWvlCgo2hx9kMr0emsJfD9dcRd1eXzg0IoNSmDnB4HE2zcO
         LyNA==
X-Forwarded-Encrypted: i=1; AJvYcCVw/X0GdMO5gaUcSCGC/C1OEhlXXvZgnk+i/ya3TB773mtODE41LsRMeGAlPnfUcOQ7WxFwZtqQoY1RQiSPKkr15jJc8Q2qGN1IyLs=
X-Gm-Message-State: AOJu0YxHFoYYmmw8pc/qkpu3fHM8WDFREGRY6oBJtwOl9HtlyjUukiTX
	H2FBISWBxYVHvIWxhdfAYPJEP4FGtfvhUD5g14dGfNc5tnKiifT7WfHzM9fsoPU=
X-Google-Smtp-Source: AGHT+IGqlMz1alWRKxGaognRF10drFVQxV6mNURT1OgHL5DqwKDRbiiGAjlSz2Ygixur7KvLK2brog==
X-Received: by 2002:a05:600c:5349:b0:414:8065:2d23 with SMTP id hi9-20020a05600c534900b0041480652d23mr3858145wmb.20.1711821519529;
        Sat, 30 Mar 2024 10:58:39 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id o41-20020a05600c512900b004149536479esm9235312wms.12.2024.03.30.10.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Mar 2024 10:58:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Russell King <linux@armlinux.org.uk>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, Vinod Koul <vkoul@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Michal Simek <michal.simek@amd.com>, Eric Auger <eric.auger@redhat.com>, 
 Alex Williamson <alex.williamson@redhat.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-i2c@vger.kernel.org, 
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-input@vger.kernel.org, kvm@vger.kernel.org
In-Reply-To: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
References: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
Subject: Re: [PATCH 00/19] amba: store owner from modules with
 amba_driver_register()
Message-Id: <171182151736.34189.6433134738765363803.b4-ty@linaro.org>
Date: Sat, 30 Mar 2024 18:58:37 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 26 Mar 2024 21:23:30 +0100, Krzysztof Kozlowski wrote:
> Merging
> =======
> All further patches depend on the first amba patch, therefore please ack
> and this should go via one tree.
> 
> Description
> ===========
> Modules registering driver with amba_driver_register() often forget to
> set .owner field.
> 
> [...]

Applied, thanks!

[01/19] amba: store owner from modules with amba_driver_register()
        (no commit info)
[02/19] coresight: cti: drop owner assignment
        (no commit info)
[03/19] coresight: catu: drop owner assignment
        (no commit info)
[04/19] coresight: etm3x: drop owner assignment
        (no commit info)
[05/19] coresight: etm4x: drop owner assignment
        (no commit info)
[06/19] coresight: funnel: drop owner assignment
        (no commit info)
[07/19] coresight: replicator: drop owner assignment
        (no commit info)
[08/19] coresight: etb10: drop owner assignment
        (no commit info)
[09/19] coresight: stm: drop owner assignment
        (no commit info)
[10/19] coresight: tmc: drop owner assignment
        (no commit info)
[11/19] coresight: tpda: drop owner assignment
        (no commit info)
[12/19] coresight: tpdm: drop owner assignment
        (no commit info)
[13/19] coresight: tpiu: drop owner assignment
        (no commit info)
[14/19] i2c: nomadik: drop owner assignment
        (no commit info)
[15/19] hwrng: nomadik: drop owner assignment
        (no commit info)
[16/19] dmaengine: pl330: drop owner assignment
        (no commit info)
[17/19] Input: ambakmi - drop owner assignment
        (no commit info)
[18/19] memory: pl353-smc: drop owner assignment
        (no commit info)
[19/19] vfio: amba: drop owner assignment
        (no commit info)

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


