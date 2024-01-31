Return-Path: <linux-input+bounces-1596-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0C0844CD7
	for <lists+linux-input@lfdr.de>; Thu,  1 Feb 2024 00:32:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B65641F229EC
	for <lists+linux-input@lfdr.de>; Wed, 31 Jan 2024 23:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 822F13F8DB;
	Wed, 31 Jan 2024 23:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B3KCQxdR"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99D53E478;
	Wed, 31 Jan 2024 23:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706743183; cv=none; b=Nty+j81DSs2tjzJCSugxAi1ifOgjOCaPCRlgQSkACcukWqZqg5h+fCMaMrRsqoAt2wNEdWOD0C9fP0BHIq2TDvOGPdIMvqFUCH3dUeMB+Wlu6UbXaDt6KXtPyY0Qe3LS5nhzPk+s0akj/ld/+kfREViExBLBoQ+STFA6o0Cb/IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706743183; c=relaxed/simple;
	bh=/ccncMG9tMlB00BXpT+dUB5cCFOEy9w6xAauEs3pywU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VG0vlnKuCHxBvgRexXUbX6CBHdiS51xTkhkt2DfWDcpWaeXXqTfmYdIc2sBBJzeRnGMe+JgF9rPdiPuP5/7OBsBpwgF08DWEcTCQ/IYisCFXG+R2128F4PmvlPqsZThDFQrnueNX7yyMDB+kIrDBW9T5wD0LA+W0O7y6ZWRRJ3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B3KCQxdR; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6ddc0c02593so225491b3a.3;
        Wed, 31 Jan 2024 15:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706743181; x=1707347981; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JZgkDLgyrPsCaWklPOuNtS9DRohp8LWP5R1zj3C6cBo=;
        b=B3KCQxdRCOc8eo1hfvzupRYlhwulaLl/8i/BSSq8KfjJv4+jiT6E8fApmfpeX8K3WW
         oT8CzWkoyTFmhNmDo65bpJIgAjgXWrB13pR+SWf919Mzs40boBBmSO2udn3uRNrwYc3L
         2dFP7MfElhijNeM07BEvLhHK3oJ370V3Yuk2l51uyy9CIwmb01Jn913xThq149RNqm/c
         Tv//+yUR1waAvtwZEvJjGLUHnKDisehK6fbeVhMi3HZ9NRBl5B42pEpJqnt15zOm/xbu
         v83Og0/lJNUsg2+dz2aOg3MyekglMiaM+Rn8H5V5TRmEDCmcSJvLkdzqpeMe+sD5T91B
         kk2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706743181; x=1707347981;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZgkDLgyrPsCaWklPOuNtS9DRohp8LWP5R1zj3C6cBo=;
        b=S3kggiDICX6Ws7cD3VSp9oYq/vWAHv1dAtVooEqF5vbup7hIZaXGG87Vlot7FjOb4Q
         +gjaxJHPNfOAZCp6wp4BL5x9QvgD6yAb5TZFbURptsJH2+z16X7VtKlMloWCdgZRqMRS
         psg4hznmpsN7tR33cuvKGxDjIBvhB7VF/G9c1R7fAMTJnWENSx4Bx/LjKRdP8/aYDwnY
         dUUZMADy42wD5IAALobs9jkxR0VD7dmg1+VFx2UBGhEq3hXw3jajVbQqT1sC6KjcLR9R
         uA49RAkB3KJXV4kRCSmC2rQvci3fDQGblBKXKQepE2HtUoCkeSylNcMmkDCBuQChPnE9
         kYOQ==
X-Gm-Message-State: AOJu0YxP3Aose/Hsic/ExAdAQh41MU304c7FDxqsVDo6kHg6xUGep4zS
	won5iq5J/YG65A2eMxd+JU0pbyYjvsOeZp20YHoNPJzH/Q+BYvqS
X-Google-Smtp-Source: AGHT+IFss5FF+Tid5rIuRhTMTGgZo0Pi9AWVAnIwIipN4YKIEpXs4HCz14vFpzHZ/FWr5HuYRxTr1Q==
X-Received: by 2002:a05:6a20:3c89:b0:19c:999e:b7a5 with SMTP id b9-20020a056a203c8900b0019c999eb7a5mr545696pzj.53.1706743180819;
        Wed, 31 Jan 2024 15:19:40 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCW9KF9FPaRWisv508jd0N4eeYnMYq6lQXO/eF1sZvDsjnuiMzcroB7H2c8koDIcM5fQiueZfGUAuJu9KmnizV2oHK7m1C4nNi2NWsJWrsqzEHrHmimKI3VNrv+kWRqXK9mgM/mS1PRPni8Y7hdatNEL52mCmK4r7SDXR6fozE2tbU40/lpwyxQ8sDB6VedIp983yFcGqhzwUQWrwmWjL/qwDYdjIQCwsKmO24cnSP2IpUcr5KW1yl8RRtuHW/nl1x23kheQnf2AiGYzcJbOu2XGuHB2P5LmPfLeeuG1MTNhD1z1nfwbCYGFySVNCpLsCprUm9OiqNhXneDb5SZ2nw6rxoCJCTWyOSH6A8IY8r4UnCpK/HwiH/UA+u0aiv1d3q0+fjJFQ/2bew3unOGgcGfafCunbM5IivCrM6ReBM1EBSzpFJKMm3I8UbUVicNQAE/zbRdCPgy7u6AX84kEmJZ+iu8nd+F+WQqyZKkNYv64dEeYYafF2pC60caWNm3Nexm53GfR4ruKHHhb+qnFNiY2HNJbU5zUy2zcUk1v4gx/cOKV
Received: from google.com ([2620:15c:9d:2:dd5d:ba2a:a6f9:365f])
        by smtp.gmail.com with ESMTPSA id o4-20020a170902d4c400b001d8a5c08277sm9303166plg.260.2024.01.31.15.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 15:19:40 -0800 (PST)
Date: Wed, 31 Jan 2024 15:19:37 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Support Opensource <support.opensource@diasemi.com>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v6 RESEND 3/6] dt-bindings: input: Convert da906{1,2,3}
 onkey to json-schema
Message-ID: <ZbrVifc-HW8QDy4W@google.com>
References: <20240131102656.3379-1-biju.das.jz@bp.renesas.com>
 <20240131102656.3379-4-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240131102656.3379-4-biju.das.jz@bp.renesas.com>

On Wed, Jan 31, 2024 at 10:26:53AM +0000, Biju Das wrote:
> Convert the da906{1,2,3} onkey device tree binding documentation to
> json-schema.
> 
> Update MAINTAINERS entries, description and onkey property by
> referring to dlg,da9062-onkey binding file.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Lee Jones <lee@kernel.org>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry

