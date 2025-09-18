Return-Path: <linux-input+bounces-14875-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 707DAB87241
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 23:29:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31D891CC308F
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 21:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D65192853F7;
	Thu, 18 Sep 2025 21:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WFUsDaaY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555A02EBB84
	for <linux-input@vger.kernel.org>; Thu, 18 Sep 2025 21:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758230960; cv=none; b=gvcGDjrdcvyZirZkeGlh3e/pJ5765X3UrszT9OcICAFcIdZLH7YbEQxJUm2fyn0p2sSxNfBKAfnpxLeOeI+Yv2V/gPxcixUltRPYzNKeE8fYkaqdHkd0JQZRJm4r0vLR9HJmrt9ABbw4a9inunoFKHJQ6aS6NCLOU9jy2CUUzuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758230960; c=relaxed/simple;
	bh=HhwvCvZmySup6P/KoBzvo8skgfYCyXTfkBl8Xon7+cA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ikw2cqiLuJhhhwYyRHLqKHbzsXkHGgnKGzsry1B0ccGgnuEmSzSlulRbpifBKWSeT6NitbBr1+BAQCeDuFZuxVpvNIZZfy2IrSCvjEsOFcR3Wah7EQYZwjCkAMTreMaWvLKQ5tZ/u1yCZ8yVyj3P39B80TK7n2zljZGoUFIlo4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WFUsDaaY; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2698384978dso11413915ad.0
        for <linux-input@vger.kernel.org>; Thu, 18 Sep 2025 14:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758230959; x=1758835759; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t5FfQ8fE9EyrFTigYn4OGWQVM7XEzur4GFkeN8+xurY=;
        b=WFUsDaaYKlacvEN4srcm7tRJNN/WwomU/K5jYTGNAjcJ71NxGHfoLYsUg9eIsfiQ7o
         ErQkrdTgdylUVqdQqPBhALFlNC87At3+57hcmSLvcMiOpIpdjzg3w8kKSIANQ4Y1X9+b
         YrTFmxpBYWFRSCp2CyKYEyzz75AwA/1b8ZWCN8xroZhBSnitEnuIBY6TBWEzWhuVVE5o
         TAE5hwKVDFQ6rJqV7TWy7NfyFSzuW6jvjd04Up8bu16QOjvFfNpCFmu2bkM9dNuoMCOM
         GEUUx7bj4JDPqoBCc0CjUvLBfl9j9iOR2bbcrohboZuMkJgMvceNSEs+OyEr89iM7FC3
         oc+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758230959; x=1758835759;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t5FfQ8fE9EyrFTigYn4OGWQVM7XEzur4GFkeN8+xurY=;
        b=IBPTXJPbNI77WEmYYxxNnJJDSSaeeZbPWH+BmWzetCmvAzYibHxO7XCsaa4D4yV+11
         dZmEh+EOhKQrkOiq7XbUMc0/znOUfg6Zb1URdu8RkX6+m8O3PiNbm1b7Xcm6DlXPAmNJ
         JpDFcQPulEJwRikoGIpqf5pPWMdyrfbfjrvi367sjwuBEx2EBz0nS5UEQztOJwN6yJ9z
         86ImrxNxPHRsZVaoE49mv/HxGRfE0MJFSg65RWw4Jg0Wxdxl1cwAeH6GR8Enxfay7sy5
         nDcDg5IW9YxASsb67UTZV0weYoj8rMhP+XnhOHUzbEpYzhlvNTTwO2OEP+TqV0nNmFDb
         1NHA==
X-Forwarded-Encrypted: i=1; AJvYcCXi2Lkhy89aqNBayQsoa+6i+106wYd5nQXTwsnKfTCzwbMRxJwyiAD87pI0ci21h76gWPjQNEAKzh4wJw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6PCm/wAWtB+QAg2EsCXPfxEbOjv9JqScqIWmWbQs9VthxSA1C
	G9/pjMhyMU+nETyPzqVKYVssFUEq41kNKvg8GsccRVkF/jsAM59oIIXc
X-Gm-Gg: ASbGncuC1NbFjkg+9LzmPh4Q0iJfZT3AbVr/IEMUT3jUgMWofZ/z6Kv3sVbcDRgRTPr
	AZqkyzInX1HL+EgNNnxJhIF7US+qBQu9cvEjvPP4/fGT/4PRvJwpewF/cJE0kwD34jeVsV4PcTm
	OQeV4voskwSsIun7Lx3vJu+sCma7QxsGE3qFyBAPCEh3QLAEN1ma0hMOYI+NT3dJgYwYR+f8jWf
	FsCMpDb8eHz2wQXDKzXfNZntAq/7DM0DFnroydk3FqjClIhrTm+0GLfVjHHceymuTUkV1uECq5S
	wVaJQ5Np9pKyXCy4JM/MvecRFtXvbFOAbOTprUeB16207h3UAm6bGou87/h/2pZEnGsNlrabLoW
	oKvrmOTC9yLNYQrXFfzOLXp5+/UNevIqGFCgCBLvByw==
X-Google-Smtp-Source: AGHT+IEbft4paW40MvQeDZQuD9dWp8aiBG6nFm7xbVwWQWYmFP/VGjbbe2yfvPhDG9/lnQoov1z1VA==
X-Received: by 2002:a17:902:f691:b0:24a:f79e:e5dd with SMTP id d9443c01a7336-269ba5081ccmr12875835ad.37.1758230958575;
        Thu, 18 Sep 2025 14:29:18 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:8e3e:e1c9:1151:50c3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269802de5e9sm34246905ad.72.2025.09.18.14.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 14:29:17 -0700 (PDT)
Date: Thu, 18 Sep 2025 14:29:15 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-input@vger.kernel.org
Subject: Re: [PATCH v4 1/5] dt-bindings: touchscreen: convert bu21013
 bindings to json schema
Message-ID: <na323mzpk72zkrxqmqpbubacj4f2iylkggcen65hcvsafcb7ys@ez5jot73iyqn>
References: <20250918153630.2535208-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918153630.2535208-1-dario.binacchi@amarulasolutions.com>

On Thu, Sep 18, 2025 at 05:36:06PM +0200, Dario Binacchi wrote:
> Convert Rohm BU21013 I2C touchscreen controller device tree binding to
> json-schema.
> 
> Additional changes:
> - Replace <supply_name>-supply with avdd-supply to match example and
>   existing DTS.
> - Add reset-gpios in the example because it is required.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

Applied, thank you.

-- 
Dmitry

