Return-Path: <linux-input+bounces-14876-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB581B8724C
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 23:29:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B42535832BB
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 21:29:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 066FD2F9DAE;
	Thu, 18 Sep 2025 21:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ItzNtb+Y"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9116E2853F7
	for <linux-input@vger.kernel.org>; Thu, 18 Sep 2025 21:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758230974; cv=none; b=qgW69cckeSekk5CPy/nAcfL4cocGYntsiE76UzXZrKCu/9e8e2HTbbufXusz6yixpEeUKRIRywTqLe3eun6V6vkWKisRK2n+dCrYfUf3dLzyfC+RCNKgGhK55d7AEkRHAY+HPA3BW+zY62Q+8z/A0mmww+frpjpBvSY8ANeZhG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758230974; c=relaxed/simple;
	bh=Y/g7MH1bz5uUTekQcW8JYQMQ93odnK04liGdY8dwB+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eVp8ffQKd7U5zZ5tR0EyWJfYT9pZ+v549RUaKglXg0OFKlom+EBJOMBCT+Wjzisw3MoWSjCAsc5/sEGanHd2EcmgbdtzsaNpHfA5S5NU6D/2LdIeA5b9Pjqi5W4XLXivUluOS+t3NgVk8dywHbLhoVN4SU/PMGi7pP0jdhH37DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ItzNtb+Y; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-24b13313b1bso10495745ad.2
        for <linux-input@vger.kernel.org>; Thu, 18 Sep 2025 14:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758230973; x=1758835773; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OuOfn5BynYjHyfO8hnZOpVSeujXtYV70hxGYV5OTCNY=;
        b=ItzNtb+YeeFoSQlDfyJ+4n14NdYaJbAqRXompb1OYGEJ6WmMjVltaIU4n0c09vLiQN
         MxlOSzVmfiu6C3Oave+ZpvVqDXZnZl7xEQ2n1yceIjHyheHAo/ziO2CJYhzdAhDN3Can
         bjH+pMtZjP9B5V5CvsjulXnHnqWPdsb5tXu7yl5gwMapEqTY9JoBHRYmlTBe9uaAfXdP
         8hfYUUVuKAh0Sj1u9LkGCGShS3PhEjD+x9bzVNssJVSV1Tu7KXgu/4FuDyeow10xQ/Ou
         +xvITm6pG0TAV7ksdtTLHe2XDj4bgHDd+qAWCO2pFNLRAoY/KA4U0v0B39Jca1T04PxV
         l1kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758230973; x=1758835773;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OuOfn5BynYjHyfO8hnZOpVSeujXtYV70hxGYV5OTCNY=;
        b=W+wKARtP2H5sLVndhdkpE/W2kKRE9UzC2ZbrYUWBInabnUx6tusHOV64Xajxg/FP4u
         2TwJ5sc0dLHBs6z75Q7qOdtdd97I8iAZ6TPC0As3Ivcldl5kdUT3N7umk6D6DyJfWveF
         yMTB61pQsTEq71AVSiCxcA3EK72Z9C3p1G+Xqr1/C49MdTtrOVxtXo3rnPUz+6rB9jws
         jodTdhb3N72/TRg5XauKdclAGTBJzBMzs2bLjLeTci6VITfEm0sEK0hGJbl1cGK0pA+e
         eSDsAgQUKNb4wa55En3k2dX3//LPEh8x0JWzLHC5Mkn/DQE+Fw/Qc0jAXL0aU0JMZ7DU
         OcqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVu62xPAGDO3UFV5FQoscpxxKIr7iR+0jTJKgaf1ly3ulYP4e+RPWAJtqW6K6IjWZV6+ceHEADQ2FxEmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwR5EkKpfo40zfmUfY+3+KzX2dgxf9Wi9Awya4teP6IHr51/arF
	B+Jq+nzQO2FQBNVZ89BDGVghsjHEHPsSgBBdIFiAJYWRoU9zRxPgLjv6
X-Gm-Gg: ASbGncutLgxp8L1xom30zqO7WpA7vAQt4TQ70nosSUCVvQkjEcfkJiGGPAEFZwerDsM
	ismHPVuYiiQe7etNBUYluczGw67WcgB9/71txCqjCV1njgmyCzDu2uXslc1enmojUo2+Etny4KI
	BW+WYXyoqP8G9akcgAyO5Icw0l1QSRUN60vO0pWdcdiCioRR2P+lB7AwE83EUqYDH4cqV18qovl
	VDI0UVys2M4KcVf3NKbY2rld0fdPYUmESIJJ8iS1tFORvu/dHRZxWmgjdBj5SPp5Q/QsfbCYbub
	Rg+APjb0tiabOSF5k2rAQAFQ63pWkCE9IPKKOos6115Htqrj894Sp5mlqaaiU2IRCTZTPAFhPMD
	xho2mqCNs8YiK8WAOc2bB2vojYptDOKoi8U7WFaiwbpUbJcMr3g5i
X-Google-Smtp-Source: AGHT+IGJVCoAx599ArMTaqWmQd71Ibkb5sXiglq6XEMSs2fJiAQc2hYEh1dHQTNHwRyHuT99FrXNmw==
X-Received: by 2002:a17:903:3387:b0:260:c48c:3fba with SMTP id d9443c01a7336-269ba53b148mr9460685ad.47.1758230972743;
        Thu, 18 Sep 2025 14:29:32 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:8e3e:e1c9:1151:50c3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269a7dcafb6sm15559465ad.83.2025.09.18.14.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 14:29:32 -0700 (PDT)
Date: Thu, 18 Sep 2025 14:29:30 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v4 4/5] dt-bindings: touchscreen: convert zet6223
 bindings to json schema
Message-ID: <jlncvy4jmxwcuryvrto4jxudnohw4berxa67avjqzrxsdakbvj@tlpf54cr3acf>
References: <20250918153630.2535208-1-dario.binacchi@amarulasolutions.com>
 <20250918153630.2535208-4-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918153630.2535208-4-dario.binacchi@amarulasolutions.com>

On Thu, Sep 18, 2025 at 05:36:09PM +0200, Dario Binacchi wrote:
> Convert Zeitec ZET6223 touchscreen controller device tree binding to
> json-schema.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 

Applied, thank you.

-- 
Dmitry

