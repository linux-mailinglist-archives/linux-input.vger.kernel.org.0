Return-Path: <linux-input+bounces-5252-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A63689435FE
	for <lists+linux-input@lfdr.de>; Wed, 31 Jul 2024 21:00:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B11E1F227C6
	for <lists+linux-input@lfdr.de>; Wed, 31 Jul 2024 19:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A9BA5812F;
	Wed, 31 Jul 2024 18:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aa1TkPOW"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C899161313;
	Wed, 31 Jul 2024 18:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722452373; cv=none; b=ClURjqCgml/3qyf82FpnrDqBllBmVXjlHHNARnO+3dx94pBZnYQCJrOQ7cunOIag3tDbUFsVp12IbP+gSg9W6cmN8uPBGDeTobqPexVdLumAwyABH6659ks6PFyO3yRtaudl6rHtgnopMPNJBXyhhlpZ5eiyifKyAB/89f1RG/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722452373; c=relaxed/simple;
	bh=OoqgrhP2VTGQq8e0fTyuKFwuX31VH50t0N/O/61rNx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zwg084NueWlHUgjOdBg7nh49bvRjBKGvY5HsYixZ4lC1/qvp96Noxa6pZfAXCMFEtwGTYbyA78eJw9EnocP5jU/Dj4/ed6jvl9XrImNi9WIQhByvIv0I55eUWsp5CwdIOg+tnvhNXNP/QazWElb/us6karFdtzxclQRCvvvz1II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aa1TkPOW; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1fd640a6454so46371305ad.3;
        Wed, 31 Jul 2024 11:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722452370; x=1723057170; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7lwIYG6htI5An7J79S+lBD+dk15/lCpc14vhAkd2Jiw=;
        b=aa1TkPOW8F2sishiR1Cq635APKGCKjH1M9h2bFE/sAI1tNFHSwh5Wrp5MP75RdNKlK
         23iPNiy1JBqqsv4iIuvudWxpvqhaxCt3cFCxV/kUUmK3wq1Y08CHckWcqHRpvFUlCq1Q
         eUCW0nEjKhz+g93wzm+MbIrDLm5GwXSQNvMDwd2OcdIKgz9I6N8Spbt8r8Rq0x7ZCOdi
         sSt+UDgvuHFTCzHSZb3Ktg60WkJcacxNEsKIEtrPsaMRaJgN2HDTkihxzm1EC8048RCn
         gJvN84vj42A4tfV0NUrMu6+V6eOF4duobQH9Ca/OT9mIBpl7qd+k8B5CkyZg8knyedF+
         RL1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722452370; x=1723057170;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7lwIYG6htI5An7J79S+lBD+dk15/lCpc14vhAkd2Jiw=;
        b=NXChrOd14U1X3zzQrpHNH2d3kxQG36dS1XathZJ87YoFUvrEh8ffY4367ImL6qyVpQ
         6Qsl2dO2fFTPK+SR606o02hqmRHwSjMbfded1HSMt2KTQju6w97BZnl7IxrsJWZdLYDE
         rVo/SjNRLjU0mQQduOklG3Jcb/9Y5PQHONsKsMOORHy71YUI6DQnc+xHcRhus1TXRNvd
         1KpeQwev5ge0DjaIOrSsrB2xTMPUoFtCF+YHehiJgEMDRyvYwv/GHfsFR8q6+cSc8sML
         b3qlEBMq2idZGWye3c1+wvTyaFWU4iq03RONrjO+v7sL7XlcewUmKdMlYzKXPovDR5VT
         qDrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpY0vmTBgnIVmM/RYTK/m1fPvKyQS4Gg4bKqKB9B3TZTGOuYG+e2mg0+vkRjqxC0szkGB/7INoo72QEZZ4NU/KVC1bw6+MYq0ZL005k6/OtiRiYKNvW3C2i9MmOuxjT+5gRxFgteocI2Y=
X-Gm-Message-State: AOJu0YyizMSvSeuzc89GMDG2Ea3/bPTgn5HonMw/MTY3VKsOb7UAQJ6T
	m9zad767wuaiyHq1WYz1BQt5cDhZRTlN2/AUNgwVTxzRh+f81vx4
X-Google-Smtp-Source: AGHT+IGKc6oxaFiRXyijDNrpHO16s4HbPcb1xyTP3AmViJCDj8LnNAGDofxHVrAmQ30oM0ajcaXPuw==
X-Received: by 2002:a17:903:1245:b0:1fb:5407:22ac with SMTP id d9443c01a7336-1ff4ce8587cmr3202475ad.3.1722452370117;
        Wed, 31 Jul 2024 11:59:30 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1da7:72de:e91f:aa85])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7f1fb58sm123185735ad.203.2024.07.31.11.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 11:59:29 -0700 (PDT)
Date: Wed, 31 Jul 2024 11:59:27 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v3 1/2] Input: ilitek_ts_i2c - avoid wrong input
 subsystem sync
Message-ID: <ZqqJjyo-8dJPqXe3@google.com>
References: <20231222183114.30775-1-francesco@dolcini.it>
 <20231222183114.30775-2-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231222183114.30775-2-francesco@dolcini.it>

Hi Francesco,

On Fri, Dec 22, 2023 at 07:31:13PM +0100, Francesco Dolcini wrote:
> From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> 
> For different reasons i2c transaction may fail or
> report id message content may be wrong.
> Avoid sync the input subsystem if message cannot be parsed.
> An input subsystem sync without points is interpreted as
> "nothing is touching the screen" while normally this is not the case.
> 
> Fixes: 42370681bd46 ("Input: Add support for ILITEK Lego Series")
> Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>

If you are adding your sign-off you do not need to have your
reviewed-by, it is assumed that you reviewed the code you are passing
on.

> ---
> v3: added reviewed by
> ---
>  drivers/input/touchscreen/ilitek_ts_i2c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/ilitek_ts_i2c.c b/drivers/input/touchscreen/ilitek_ts_i2c.c
> index fc4e39b6651a..250133f0d68f 100644
> --- a/drivers/input/touchscreen/ilitek_ts_i2c.c
> +++ b/drivers/input/touchscreen/ilitek_ts_i2c.c
> @@ -203,9 +203,9 @@ static int ilitek_process_and_report_v6(struct ilitek_ts_data *ts)
>  		ilitek_touch_down(ts, id, x, y);
>  	}
>  
> -err_sync_frame:
>  	input_mt_sync_frame(input);
>  	input_sync(input);
> +err_sync_frame:

You are not syncing the frame, so that label is wrong. If you do not
want to release the contacts just change "goto err_sync_frame" to
direct returns and remove the label.

Thanks.

-- 
Dmitry

