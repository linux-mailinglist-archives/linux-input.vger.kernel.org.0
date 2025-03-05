Return-Path: <linux-input+bounces-10554-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A84A2A4F764
	for <lists+linux-input@lfdr.de>; Wed,  5 Mar 2025 07:45:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EACE3AC10F
	for <lists+linux-input@lfdr.de>; Wed,  5 Mar 2025 06:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CDBD1EA7C3;
	Wed,  5 Mar 2025 06:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dzs0A9Ba"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A141156F44;
	Wed,  5 Mar 2025 06:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741157141; cv=none; b=ZxWHX+tWTocpAoYA0WT/sVtiwNJIjq9f8bqCKz8bDF+whFq3jWr85+JP4GfFh2DAMmO0WGppLHTV5Ak367qW/7hIgg7JsKOZMtxfvIHyzw/oBUsvjXnxh6P8kf0rJ8teo5oNiRNfJKKmmncgzGfxzZyziSmD3X452qmttQE4U/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741157141; c=relaxed/simple;
	bh=auSqLtZpa8wrO19Iq/uk2LvKfjGhoCGt5+ZC/eDQM2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X349bkzZvzB/D7d8Jj9r7yN6ZyqLZu0t6SUQzKntCwQZifmhmo/MV2JvMlt0MA94d6+exWFoTYBvwMBIqp0FPitKQnCNEjOcQwS+YL5KKWYPCh6IQHzJls29Boe782caEsMFwY7wUxT/QEX9zWoIKMOicgASkMtlqxsen0mxF+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dzs0A9Ba; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2febaaf175fso8289423a91.3;
        Tue, 04 Mar 2025 22:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741157139; x=1741761939; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G8mCPsB48bmF8aTewO/RfZWrdCX2gTYrS/X2ZpOkCts=;
        b=Dzs0A9BaM/H/Dlx0NvS1W1KfmzP1y4Nb5Konm1JNHkrwIOESGOwk0XTlBQT5MUhRO/
         mXmAyyV0BYbnnlYNg9irP2Zt075nqo3n8tAP6/RdhBNRPKDd6Z7N+Hhygo5vISn8EhIl
         uLo4egJN4RgWhGcmsXAzE7PMsHf+RDumR4UstzaSTTHzAlZHtq4dAz0+tycM2DT1J/U0
         yH32d6cr3MFUxfSCFFVQ1fhmkFGkbr3X5uL8SoSKK8cqXYlK4WNR4gPfJ0bdoQkfGtoR
         shaiMwgIBRJXU5f4GtK5BroW9haNBpVTUvNfYqGEDEz+Q8Tw1D18gpYrbG46OXZLZd3p
         9lAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741157139; x=1741761939;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G8mCPsB48bmF8aTewO/RfZWrdCX2gTYrS/X2ZpOkCts=;
        b=gsA9+SeW+NAVGjXVy6GHRHYeo4GB4+gEPNSKRehn/beJZ1Ak9NRsqYQuOfXtsgeVzC
         nLd1x9+3Uezr9DPW0PHdWFNFcJ0p+/h9Tagejyl/B9LKMIarKPPMfMzZMb47fJ8LNJ6Q
         lHumXGJtjYWihRt8bHeWdorBFn7Ek9Jvuf7fbNCsplx4xEH2OLpo9w4PeVZPwo428d3j
         kvfDGvyad08ToQc7HD3uhHpH60wCE4Ob9u6VQun7eUqECHeNDK2ddKYJXn/g8P3+YQ5b
         k7FFo3G1KldonP4eIfJrgOlDy51GbWr/YC88BUEguMsmK0r3hvNK1bddT0gRD1Ws4Qt5
         NtJw==
X-Forwarded-Encrypted: i=1; AJvYcCVAxS1gWT5XPDnAF+ikxFsYnrAVVUEVoqykgBkzbOMF7wQH/cPVY4huAQRJgU/I391XShDzQTh1BE+T@vger.kernel.org, AJvYcCW12+5KB9FBN756hDyzRF73ShrdEL0MBRUqTFomVSBEePp6s6xisfnJ/uSWaettEkgmwn2V9txVBrRk31k=@vger.kernel.org, AJvYcCW2SOU9KGTBEqm00jatC2/3bINK2VJA1w8c8gAsfutkBbAJO12DMnBdKmOey4z/RB9riC4pP2lmTjXBRUo+3w==@vger.kernel.org, AJvYcCWYLhZBhjaRhQoqTt3wUpYu3/1sjyvq3EwWHNAkLF/JfZqL1CUr86rwVJtLZfVijpLLt9RJPKGh4Of1KM0Z@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp6GU0nWCT8pDVa23tGAJCC2FxXHL4g7HfZ1XokVEirlYXYqpT
	scJ577m4Kg2l0n/X+cCw9yAYcHiTGL52xSSTrx/dZ2JjgJ/5XKxNbVRkVw==
X-Gm-Gg: ASbGncslMjX2Uq91r2KHPOzoYXzSAvQ07GqautoyKxWdF18jgh3r1X3iA3G8VBNJDUp
	6qzNZs8e3C28KsQTkcwPSdUuJpUa4bMNGgb3dU4tZexrNPFFJE/JgozUzkryvZSv9VDBqoqJ0Sk
	+GuTFCPsc2kElcwYBS/KfUmIRZdM5rb07ouhLYbTOfr84lDCpyhoA+zpGnukRwA0TGZPFrAlq11
	rPwCCObB/CaCy0HzejSJdJqjm3uVqpVFZyfye9gVqUeNTy/SX8E1zaIUi626V/dLzbVSVBLvvWs
	UYqBig6fb4dWZEoEFvzdYdmhbOFjDpt2vytx/5WdlA3wsg==
X-Google-Smtp-Source: AGHT+IGVH2wtIlAGIOQtGVzGD0CuvkOPmb/y/Y1xOui07mAMEjGJ65jR706zmjbyQkUklwU66ojQhA==
X-Received: by 2002:a17:90b:2d8f:b0:2ee:c2df:5d30 with SMTP id 98e67ed59e1d1-2ff49841e81mr3287562a91.26.1741157139110;
        Tue, 04 Mar 2025 22:45:39 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:438c:d5a2:41a6:66d1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff4e7bda78sm626452a91.48.2025.03.04.22.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 22:45:38 -0800 (PST)
Date: Tue, 4 Mar 2025 22:45:35 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: foss@joelselvaraj.com
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 1/4] dt-bindings: input: touchscreen: edt-ft5x06: use
 unevaluatedProperties
Message-ID: <Z8fzD-aF-hN0PeyD@google.com>
References: <20250303-pocof1-touchscreen-support-v4-0-cdc3bebc3942@joelselvaraj.com>
 <20250303-pocof1-touchscreen-support-v4-1-cdc3bebc3942@joelselvaraj.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303-pocof1-touchscreen-support-v4-1-cdc3bebc3942@joelselvaraj.com>

On Mon, Mar 03, 2025 at 04:36:55PM -0600, Joel Selvaraj via B4 Relay wrote:
> From: Joel Selvaraj <foss@joelselvaraj.com>
> 
> In Xiaomi Poco F1 (qcom/sdm845-xiaomi-beryllium-ebbg.dts), the FocalTech
> FT8719 touchscreen is integrally connected to the display panel
> (EBBG FT8719) and thus should be power sequenced together with display
> panel using the panel property. Since the edt-ft5x06 touchscreen binding
> uses almost all the properties present in touchscreen.yaml, let's remove
> additionalProperties: false and use unevaluatedProperties to include all
> the properties, including the needed panel property.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>

I believe this is better be merged through the arch tree together with
the dts changes.

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry

