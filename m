Return-Path: <linux-input+bounces-4194-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B0E8FFCDF
	for <lists+linux-input@lfdr.de>; Fri,  7 Jun 2024 09:18:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B36AB21AF3
	for <lists+linux-input@lfdr.de>; Fri,  7 Jun 2024 07:18:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3056015380A;
	Fri,  7 Jun 2024 07:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rVbTnKqK"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732B229406
	for <linux-input@vger.kernel.org>; Fri,  7 Jun 2024 07:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717744674; cv=none; b=Ah0qcntq+4Vp6zM/k1yImrr/rahjciER204TDKGzjczo77sHPAtXwme//ey3aVs+KvgGrBmcbQD3WcuzdRh7W5mC99c0lP1aBCu+kyH8O+Ur5pYKYmo6vxT5V0kOxt62WdXTTqFYP6KFQOWj8qSYpgJyoXZpw2zWRvZGrkxd4Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717744674; c=relaxed/simple;
	bh=YiEZ3bX0ayB1nOs74MObDCAeLmQirzoQwjpYGOfJuoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YJJTXqQrIMtxnvnrErFNbDc3wFed5rY1CZvaO9bePe9nxcY+2awM5jhUYBF2Vun7tSqXPUVsX+PYEYvIcjQnzTz7Wr6RamSaYK12SrpKIgjj4EseOYPIZkUAhhoVGqoo2AMSHgN1LWyJG0/6+OKvHJJK6/D1hnI0+HK2YjR5fOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rVbTnKqK; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52b9af7a01bso2301751e87.0
        for <linux-input@vger.kernel.org>; Fri, 07 Jun 2024 00:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717744671; x=1718349471; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=goOM+D3enUA/KRbqdIW8pJqTSuZzDywMtVI+QwHEMOs=;
        b=rVbTnKqKn/Q0OTO4Qd7CovK0dlC7NSa3W1pOkCw9kYzUr0ZPyBotMHV89OFOQoEMGM
         IuaEjI9LzNmrdgLCMYDYgbszWLXy74D1GwhIbYoPxSOtfzOObhF+kz9ZMQl+82lfZoHa
         YgPz6MDWzNXSuOZdseGjiaFtbLJn5bfAm1T/HiHp5wxe+uP59XatsuZcLrjizT4l9DJr
         gkVUnyMio12P4ssVKdjlQQol4mpPzui7/hkU6LoRrJr7t+9xudeNmNKX8shhGPhQKJQr
         Vpt4pG0OgSmOJUmuqeQSg8Hopb0RTqKN7VcKqtDZCbNnW97K86eLFGANG9WvwOxGGJE0
         wXSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717744671; x=1718349471;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=goOM+D3enUA/KRbqdIW8pJqTSuZzDywMtVI+QwHEMOs=;
        b=pJjudPO/xm27KMBTFYcaJD91g+KtCufkFN/2Mo6qD00Nrmcluks3dlhZG1Hn/eYWQ6
         Yi5OtzcTGFQyQQ45A67CekDJ287YSy5qjSK7VmNfKyYSNsxt14dS3eJujaEmLxJVXyl0
         jTUXdbEaWYkr9LA107GVqlXrNuZzJ4kArESljwwTjnznUWlD/r+vWzZcRPMMCGVSNGTm
         0ig2zULTuVS12TPS9C4XbIoSg0ihEGomaCJ3J9U4y4VQSmjA5C5U7M030v3GApfs9Uci
         JfgZE0SP0xd6yY/rH/TphGEP3zFbeFYJpzcWBXPbN6Rn+Iy4BecVOKESox5TXSGPPoQR
         sg3w==
X-Forwarded-Encrypted: i=1; AJvYcCUdsvpjuWPslFoHxvvrc79LMtbcUa15wShdMg8hh+wekHIInvSIaZgeJiiUx6gGqS3QaVo+OhA61dOCnGKToH9bI2xoJlOgFG8pX5s=
X-Gm-Message-State: AOJu0YxM3jL11RzeFUrXfny12KC5IjLYaeHh+I7U0OtiB8ZrflSmHyNT
	Kp3l4wXXXYO4AC3CgZBI4n00NrKxELu8/9r+pu+n5Ih4CopDqNK6iauSM3iQBnA=
X-Google-Smtp-Source: AGHT+IFayl6a5cyRp7UrKG/w8IISxueREsY73BBE8MGwS5t+Zc6w/UW44a5gLOBjcSSlpsNSb9jMLQ==
X-Received: by 2002:a2e:a487:0:b0:2ea:7dbd:adbb with SMTP id 38308e7fff4ca-2eadce83583mr10384791fa.50.1717744670594;
        Fri, 07 Jun 2024 00:17:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ead41bf12fsm4287171fa.105.2024.06.07.00.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 00:17:50 -0700 (PDT)
Date: Fri, 7 Jun 2024 10:17:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jens Reidel <adrian@travitia.xyz>
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: pm6150: Add vibrator
Message-ID: <ckf2kobxwzlc64lulwroo2gkyoms5kzeufu55id75nsm6y26ug@cgyawalr65bx>
References: <20240606181027.98537-1-adrian@travitia.xyz>
 <20240606181027.98537-3-adrian@travitia.xyz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606181027.98537-3-adrian@travitia.xyz>

On Thu, Jun 06, 2024 at 08:10:27PM +0200, Jens Reidel wrote:
> Add a node for the vibrator module found inside the PM6150.
> 
> Signed-off-by: Jens Reidel <adrian@travitia.xyz>
> ---
>  arch/arm64/boot/dts/qcom/pm6150.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

