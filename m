Return-Path: <linux-input+bounces-6942-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AF198BD11
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 15:09:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 31966B210F3
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 13:09:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F2B81EB29;
	Tue,  1 Oct 2024 13:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JiGcYhHR"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F62188A01;
	Tue,  1 Oct 2024 13:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727788186; cv=none; b=hCMPUplUNmpu0s2t1UXAe7J2BiMNDnSAc1a58Z4wgok69uUjKpcDdVEYV5Q5UhsHDIRuNUjGKixENmriOONUA69sHMlt2u6+y7uWER8tWfTHR/xpwa3DQWzoRPg1M8uJBy4u2AUfhbtvQoOQEFhNPZ0kId2l2TAcRHMleFc9W2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727788186; c=relaxed/simple;
	bh=V2B5gxFUBvFeeJmaqXKJNNqVrKbIfRdYxDnjeJFiJRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gLligxKtMNz3AJ7K9sg669DFTQ0ogQQ6PgDNCEfLXAZXOCa938+tizYZjeAZtIkMNXPfiUigzWJXfB7F81X54d8UDTzmEj9ik3Vk7u8vnAk/Cz5KuBe0/Gijx02ZYVq0zBSJ65Y73X+2Q+yDka9yvzKKErbK5zdVGJWI3L+RaNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JiGcYhHR; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-71c702b2d50so1744058b3a.1;
        Tue, 01 Oct 2024 06:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727788184; x=1728392984; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=asrMT1XHHCINBnl4Pr8rF5qdt9HybBBUmfOzTNNvOis=;
        b=JiGcYhHRr796qtTV7Era93tufHYGGgyWgLGrpzU31TfUwVI22BhOM8aBBCuH/Rq/7V
         wWbpIDiaeieHUAdA2fMWWtwbNmxNHIe6gjkgWRfZFkOEMrCoWgjaDOtg99zeN1vBE/na
         rT+33nuK3smCBRdfo3cjlLndJgtNTqRHqK1Ip/cbRHPd403EtuvkqLprwzYL5+nkZ4my
         /sbXLeRznnBDosZTwVwGB4Xr5qrPm5xjoOZfvUDtZj0MGNhdTwFywfj5C2OLT2WPjhTn
         byWjAk25BnvIcIiG7O17/9DBYkv50cN55XIqHGgmrupxUfZL3MAkcNFCba1CCHhQbVXX
         ReLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727788184; x=1728392984;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=asrMT1XHHCINBnl4Pr8rF5qdt9HybBBUmfOzTNNvOis=;
        b=TJ3hsHbCjbHOl2lwn1zjcbOcei3gT5oD+91ioPQTdUmRABlJtLJrYgDxVz7eWZ6cxD
         xDqxZLkuiuKHfwUWGaYA9d4g2ZpYOzbrrqisiwMq76hkj2dmzN24w90XTGi6efac21dO
         iL3GvdyvSsY2vcPzqz2BcKZQblFMLcrxlLYF41Nm2890L6IKyuvbbYIRZXCQ7axqrC2u
         c36sXJ10hSOt2V67gRF2UyTZNNnLNMa+ezGvCkCDg0y+PnaZGgnmhmQT44RbAyEnUZQV
         wMakMRM5s3KI28QieOKegZqSoBQdYOdTzsNsjejUQojYy9WCN0Gf/6VmBfhlzplI8hAy
         37Xw==
X-Forwarded-Encrypted: i=1; AJvYcCW8pwvVm7cfManBAdYN648oTDVFX2t6q7eXombMtduzVziUmtKHXzPQhUk56RCug3neT5GMFqebIsdW3g==@vger.kernel.org, AJvYcCXdg51lSulYHNQkr5ffj1JmA8V1zjBwG01SeS5urFaiqhVWpCQwtqlBE1MbzI4cO/yH1HutpboFLEbbwe+1@vger.kernel.org
X-Gm-Message-State: AOJu0YzTtROPnaxbGZpmS0NMVynZDLmSJj6ccfnbVSz0M4sARkFDkSbz
	anJK2FlXz5bzBJnP5i6wm9oTx+jX7P7m/QTRMEpHYaDySKImzpK8
X-Google-Smtp-Source: AGHT+IEg1Hj2OlndnWsV/eEGVB1CEjsddBvTXahUlqXja/7Qw3mPZ4yWkdmqwG3iHq0W7nHRfIrlAQ==
X-Received: by 2002:a05:6a00:b43:b0:70a:fb91:66d7 with SMTP id d2e1a72fcca58-71b2604609emr23073894b3a.20.1727788183914;
        Tue, 01 Oct 2024 06:09:43 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:70a4:8eee:1d3f:e71d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b2649a2cesm7936740b3a.43.2024.10.01.06.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 06:09:43 -0700 (PDT)
Date: Tue, 1 Oct 2024 06:09:40 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Alessandro Zanni <alessandro.zanni87@gmail.com>
Cc: erick.archer@outlook.com, zhoubinbin@loongson.cn, jay_lee@pixart.com,
	jon_xie@pixart.com, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	anupnewsmail@gmail.com
Subject: Re: [PATCH] input: psmouse: Add unlock mutex before to exit
 psmouse_attr_set_protocol
Message-ID: <Zvv0lDZZVDM2CbHf@google.com>
References: <20241001110839.44762-1-alessandro.zanni87@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241001110839.44762-1-alessandro.zanni87@gmail.com>

Hi Alessandro,

On Tue, Oct 01, 2024 at 01:08:38PM +0200, Alessandro Zanni wrote:
> In error handling code for "no such device" or memory already used,
> release the mutex before to return.
> 
> Found with Coccinelle static analisys tool,
> script: https://coccinelle.gitlabpages.inria.fr/website/rules/mut.cocci
> 
> Signed-off-by: Alessandro Zanni <alessandro.zanni87@gmail.com>
> ---
>  drivers/input/mouse/psmouse-base.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/input/mouse/psmouse-base.c b/drivers/input/mouse/psmouse-base.c
> index 5a4defe9cf32..cb3a125d8d7c 100644
> --- a/drivers/input/mouse/psmouse-base.c
> +++ b/drivers/input/mouse/psmouse-base.c
> @@ -1930,11 +1930,13 @@ static ssize_t psmouse_attr_set_protocol(struct psmouse *psmouse, void *data, co
>  
>  		if (serio->drv != &psmouse_drv) {
>  			input_free_device(new_dev);
> +			mutex_unlock(&psmouse_mutex);

I am sorry, bit this makes absolutely no sense. This mutex is taken
(and then released) in psmouse_attr_set_helper() wrapper.
psmouse_attr_set_protocol() momentarily drops and then reacquires it,
but it should not release it either failure or success parts.

Thanks.

-- 
Dmitry

