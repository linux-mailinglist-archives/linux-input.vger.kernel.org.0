Return-Path: <linux-input+bounces-6111-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB9896AA3B
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2024 23:33:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 201D01F25D21
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2024 21:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 090CE18A6CB;
	Tue,  3 Sep 2024 21:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LUVcQzTq"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAAB1922D3;
	Tue,  3 Sep 2024 21:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725399207; cv=none; b=ukUMVX5yP9VmvJ9hXv6hu8LHbuSUSt6feIt0p1nOzfyAGlvufKVvUEHc1IYLq6UnaCCB6PJyFvw4QoaT8kGimUe55ccS1HQ77z3dCMBvwtqKxhoPUY2t6KUN41gH10JA/qKadvaMsr6eKwY7jm6ekEMv8v9qF1OWVKmjo+tOzJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725399207; c=relaxed/simple;
	bh=siROdXbi6QoNvp1nbq7OjP+/sFCOE+zKn39MtBEqcCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rb7TLYcNmk12S+i1yTgpjIe8p8vawkVDjx163JPTWKT0eR4YiVJT0yC154MEnkaF08sElLtWw2P2mo0uMLaJOpYHyz1oZa5aQ+8FmrwF2ZZ00e3+UVN1+Nc8nDTwg6ME6KuSxafqJIMIJIFOCVl+PEhMMs/YzrPIHIZdGkP1ct0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LUVcQzTq; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4570ec45fc8so19354431cf.3;
        Tue, 03 Sep 2024 14:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725399205; x=1726004005; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=huMuxx+pTzI5Ed2sFfVpPNrmfrYqodc/tD1h5FMXjt4=;
        b=LUVcQzTqbI/0BC+UShZ8HS9b4SOzi358crh+YMO7cbJKNrSGVXVK7uiN/nHvzvoFMb
         d7gKuU+qOT0FHyXcV44t8UySVKdbOiAaqJJORDR44YXItHuvo/kcDxSIvQZyNh4TlzOT
         204x7jd/LFGQN5Dp5xlwjX2zeaWP7XItmSI30U63tS7JA7C9qECV6R2udyyu7wtVOYz7
         DIDeANm8vKgot2xwRLCKYGS7oZ5H6iscCpZ/G9lqnnJSlOMBhZJO7H8PQRCg7T2FPAu6
         jEEMS18P9LZA4BEZ5mLkqE+XvSReOADW31x9InW6ftKYKwTSWJh+x/4zr8A5fvmwAjYR
         wswA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725399205; x=1726004005;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=huMuxx+pTzI5Ed2sFfVpPNrmfrYqodc/tD1h5FMXjt4=;
        b=pjtn9ey2L+A5PxkHCcgOzQ0e954GT47qPnRmZvP7urQswmQrMgBIVeSKu1Sus447co
         vDRBW+9QheWRqKQ9heBA9niogK18qB2FQPAVz8znv2fyGlMtv9Uc/NHM9u2XTFWZ47Ko
         d49xOYuZNLN0ZbJwA7Om/lZYowtFGDljJqhz8s6FPUd2uAwcMEAnD2rYgbAS0BRfG8uB
         lzASBdQNhZIOgph913JbzK4IUNrYlUh1VHC3lswRkVsNOapWAAt8MF0aC8Ha+dYpa6SB
         4qdy6jf4Pdy31Gi8fDneLlTLV92/+TctxhwlZVXe+eCqr+n+ZhGepvej5AT1Qw39P17i
         z7og==
X-Forwarded-Encrypted: i=1; AJvYcCWLZTSEnDviY0R+CD9uaTegpNG3xJCRJ0V8aORCVuKmGmkTQYhm/5aZeS1oVAYmr9Mp8rhYUrek+uqseA==@vger.kernel.org, AJvYcCWRFSFpjq8/bq7/zfGt3uKdan7bGB4dZPPtwq/hIBw4OCov1g6+pb3p0k9xLxCNKf5kcBnZJraYfk7zO7Ih@vger.kernel.org
X-Gm-Message-State: AOJu0YziCHXdgz8LWulwdkNgs5qTsBVQXwNI2v2YBeFvIKE8VlCeOxjc
	9YRGY8plEsispDpdqWXOKCz0jRLEY17fDPHc8/Ih6pycUl1GupSf
X-Google-Smtp-Source: AGHT+IEZTGLAaGioDRreFw0HgRmPpymCve4FCUEmLnZ4OxenWVmxkLRToLtBOinXu4jUWil4YzFuTA==
X-Received: by 2002:a05:622a:428b:b0:453:74cc:ce09 with SMTP id d75a77b69052e-457e2d27101mr61344411cf.8.1725399205142;
        Tue, 03 Sep 2024 14:33:25 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200::24da])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45682d9560fsm53679411cf.86.2024.09.03.14.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 14:33:24 -0700 (PDT)
Date: Tue, 3 Sep 2024 17:33:23 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Marge Yang <marge.yang@tw.synaptics.com>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vincent Huang <Vincent.Huang@tw.synaptics.com>,
	david.chiu@tw.synaptics.com, derek.cheng@tw.synaptics.com,
	sam.tsai@synaptics.com
Subject: Re: [PATCH V2] Input: synaptics-rmi4 - Supports to query DPM value.
Message-ID: <ZteAo-bklYbs29Pq@radian>
References: <20240805083636.1381205-1-marge.yang@tw.synaptics.com>
 <ZtdQW7nqAOEJDNBN@radian>
 <ZtdYJkU17y1iNsLG@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZtdYJkU17y1iNsLG@google.com>

On Tue, Sep 03, 2024 at 11:40:38AM -0700, Dmitry Torokhov wrote:
> On Tue, Sep 03, 2024 at 02:07:23PM -0400, Richard Acayan wrote:
> > > +	/* Use the Query DPM feature when the query register exists for resolution. */
> > > +	item = rmi_get_register_desc_item(&f12->query_reg_desc, RMI_F12_QUERY_RESOLUTION);
> > > +	if (item) {
> > > +		offset = rmi_register_desc_calc_reg_offset(&f12->query_reg_desc,
> > > +			RMI_F12_QUERY_RESOLUTION);
> > > +		query_dpm_addr = fn->fd.query_base_addr	+ offset;
> > > +		ret = rmi_read(fn->rmi_dev, query_dpm_addr, buf);
> > > +		if (ret < 0) {
> > > +			dev_err(&fn->dev, "Failed to read DPM value: %d\n", ret);
> > > +			return -ENODEV;
> > > +		}
> > > +		dpm_resolution = buf[0];
> > > +
> > > +		sensor->x_mm = sensor->max_x / dpm_resolution;
> > > +		sensor->y_mm = sensor->max_y / dpm_resolution;
> > > +	} else {
> > > +		if (rmi_register_desc_has_subpacket(item, 3)) {
> > 
> > The item variable is NULL in this branch, as it was overwritten just
> > before the if statement.
> > 
> > This patch causes a NULL pointer dereference:
> 
> Ugh, indeed. I guess the simplest way of fixing this would be:
> 
> diff --git a/drivers/input/rmi4/rmi_f12.c b/drivers/input/rmi4/rmi_f12.c
> index fc2cc8e2b0ba..8246fe77114b 100644
> --- a/drivers/input/rmi4/rmi_f12.c
> +++ b/drivers/input/rmi4/rmi_f12.c
> @@ -129,9 +129,8 @@ static int rmi_f12_read_sensor_tuning(struct f12_data *f12)
>  	 * Use the Query DPM feature when the resolution query register
>  	 * exists.
>  	 */
> -	item = rmi_get_register_desc_item(&f12->query_reg_desc,
> -					  RMI_F12_QUERY_RESOLUTION);
> -	if (item) {
> +	if (rmi_get_register_desc_item(&f12->query_reg_desc,
> +				       RMI_F12_QUERY_RESOLUTION)) {
>  		offset = rmi_register_desc_calc_reg_offset(&f12->query_reg_desc,
>  						RMI_F12_QUERY_RESOLUTION);
>  		query_dpm_addr = fn->fd.query_base_addr	+ offset;
> 
> Could you please tell me if this works for you?

Yeah, it fixes the bug.

