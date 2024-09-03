Return-Path: <linux-input+bounces-6114-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C297096AB46
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 00:06:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CC781F21831
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2024 22:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C93011DB525;
	Tue,  3 Sep 2024 22:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MxNMOKSa"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CB81DA609;
	Tue,  3 Sep 2024 22:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725401022; cv=none; b=qFmUp+SfHS5h7oHvlrY0kWFfhJH+YjFy99DLNuj9Pk9jhi/KfdfMiUflpCRu1EnB70FZfwMDNgrvX1fqgUIB+yCNizIZqwtifA+/0fohPpsnHGEL2iaUv4MSYh7tvaoMwLTUr/gTVv8wKG+2XyzWlTko6WVXk/n6ebFisvzQgP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725401022; c=relaxed/simple;
	bh=cz4p2ODJm/ytXkJBxY6JpLu+G71YhDCA60Y5nA7S0o0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kCXyJcvvlUBXy8Nf3Fr4atNdi4BBIeXW136v12KQNgNm+7p1TYGEt5mv9T4h3sxORfvjsOLMnjzKj6HZfD2OfTJecOcTXaw0elom3PVZFW3kkQCokw6t6t1p3+ZuQHMRX6usR4OVg7AwripQbk1qmnDxDWRhZh6WLrggsDqjKZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MxNMOKSa; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7b8884631c4so2400642a12.2;
        Tue, 03 Sep 2024 15:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725401020; x=1726005820; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DSaJhRoNakzGivzbT5n1z09XgYc1jmuejdmEvDZUXHc=;
        b=MxNMOKSavYS5lnnsdaSHuetHOOOe/DNm5kciu739JAJgAqm0cxJceGj8yX0FU/Uqbv
         AZREJYqmW3n7edMctlCwDejBW7aN7yQ0dNP3VmXx1bj2GnVCvVSFQYUsC+xnE0LH+Ezj
         +AK688IuST2kwHiZ0qPxPo1wsajb/u+HLWQC8Q4pqnT4kfGlWA3fyNM2BSUtF2Hr1CF7
         4gt1Zo22Bazdxz1ELjVBtE5LfOSCeoGvDZ7Pz5m8XT3Sw/7ZKa/o4HfGgEksI1aQX8XY
         uqUC4+xF9fric5ijlLRenV9rG2tLcC+D4a+y8sLlOYR8dErarkgZUmluCvxx4wkb8YFQ
         N1Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725401020; x=1726005820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DSaJhRoNakzGivzbT5n1z09XgYc1jmuejdmEvDZUXHc=;
        b=RvFd5cfLThafwjwHjtwdoCCTacnGLJwwKaKxQK0Qg656meONVGr5CiOfjlqZgHXWKK
         dSPMU+3h8XOZH/7mD7GfJHmeII0S44KpfEJAWy1cYPuqnXH6YBJgSuYlP2t3ooFBn43m
         ND6Wtrez6n0rgMk/3Vftek3U2p5qCX42/eOWsMIcYv/JPHPOYD8DhS96uBB5YND+PcKe
         qY+i8xPt1CKrncXy1yXCUVCRkezx821SUbnk+//L6onQ/fA2VfzQS4t2S/zdCWz4I8m8
         HAjXHdUFd5DkeE6rUv2wR1vptG5r5XKkjE/7WD4JowlqLZa2/ernPtRpZJJmtFHJ/yix
         IoqA==
X-Forwarded-Encrypted: i=1; AJvYcCX32cd2N8EYJbTmGjVXh6f2Jb5RWUeiv+xQZQqI78Kfl1CPLwg5LqP8oH4OtDKqQCJPSJB9HxIrKmQkvA6J@vger.kernel.org, AJvYcCXTBTove0d2YmRzGE8zzkj/ugJsTx8lCPNi//fO+ohYNhiUPxHlHLPc+m+l316mrLRRZiC5nIUJYefUrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKnNCassjavn97TqIY+kOvoGK9zVFp822SI+K36gnnFOGHebjg
	+0MiIlmJH8NICUMcMRPpa19NArk9U9x3TPT+zLAFhC0imAV6bU51JtjJ7A==
X-Google-Smtp-Source: AGHT+IG8eUc0WZDH2DCEUZhRvMBgSX3QFbN75OF5ZsnM7mc2YrLEshXEjhJeQM+16d+pQR1weipTrw==
X-Received: by 2002:a05:6a21:e91:b0:1cc:cdb6:c10c with SMTP id adf61e73a8af0-1cecf757e4fmr16044272637.37.1725401019875;
        Tue, 03 Sep 2024 15:03:39 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:e682:e3dc:908:eef0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7177859a4d1sm348443b3a.177.2024.09.03.15.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 15:03:39 -0700 (PDT)
Date: Tue, 3 Sep 2024 15:03:36 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Marge Yang <marge.yang@tw.synaptics.com>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vincent Huang <Vincent.Huang@tw.synaptics.com>,
	david.chiu@tw.synaptics.com, derek.cheng@tw.synaptics.com,
	sam.tsai@synaptics.com
Subject: Re: [PATCH V2] Input: synaptics-rmi4 - Supports to query DPM value.
Message-ID: <ZteHuMJFkqOk44WE@google.com>
References: <20240805083636.1381205-1-marge.yang@tw.synaptics.com>
 <ZtdQW7nqAOEJDNBN@radian>
 <ZtdYJkU17y1iNsLG@google.com>
 <ZteAo-bklYbs29Pq@radian>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZteAo-bklYbs29Pq@radian>

On Tue, Sep 03, 2024 at 05:33:23PM -0400, Richard Acayan wrote:
> On Tue, Sep 03, 2024 at 11:40:38AM -0700, Dmitry Torokhov wrote:
> > On Tue, Sep 03, 2024 at 02:07:23PM -0400, Richard Acayan wrote:
> > > > +	/* Use the Query DPM feature when the query register exists for resolution. */
> > > > +	item = rmi_get_register_desc_item(&f12->query_reg_desc, RMI_F12_QUERY_RESOLUTION);
> > > > +	if (item) {
> > > > +		offset = rmi_register_desc_calc_reg_offset(&f12->query_reg_desc,
> > > > +			RMI_F12_QUERY_RESOLUTION);
> > > > +		query_dpm_addr = fn->fd.query_base_addr	+ offset;
> > > > +		ret = rmi_read(fn->rmi_dev, query_dpm_addr, buf);
> > > > +		if (ret < 0) {
> > > > +			dev_err(&fn->dev, "Failed to read DPM value: %d\n", ret);
> > > > +			return -ENODEV;
> > > > +		}
> > > > +		dpm_resolution = buf[0];
> > > > +
> > > > +		sensor->x_mm = sensor->max_x / dpm_resolution;
> > > > +		sensor->y_mm = sensor->max_y / dpm_resolution;
> > > > +	} else {
> > > > +		if (rmi_register_desc_has_subpacket(item, 3)) {
> > > 
> > > The item variable is NULL in this branch, as it was overwritten just
> > > before the if statement.
> > > 
> > > This patch causes a NULL pointer dereference:
> > 
> > Ugh, indeed. I guess the simplest way of fixing this would be:
> > 
> > diff --git a/drivers/input/rmi4/rmi_f12.c b/drivers/input/rmi4/rmi_f12.c
> > index fc2cc8e2b0ba..8246fe77114b 100644
> > --- a/drivers/input/rmi4/rmi_f12.c
> > +++ b/drivers/input/rmi4/rmi_f12.c
> > @@ -129,9 +129,8 @@ static int rmi_f12_read_sensor_tuning(struct f12_data *f12)
> >  	 * Use the Query DPM feature when the resolution query register
> >  	 * exists.
> >  	 */
> > -	item = rmi_get_register_desc_item(&f12->query_reg_desc,
> > -					  RMI_F12_QUERY_RESOLUTION);
> > -	if (item) {
> > +	if (rmi_get_register_desc_item(&f12->query_reg_desc,
> > +				       RMI_F12_QUERY_RESOLUTION)) {
> >  		offset = rmi_register_desc_calc_reg_offset(&f12->query_reg_desc,
> >  						RMI_F12_QUERY_RESOLUTION);
> >  		query_dpm_addr = fn->fd.query_base_addr	+ offset;
> > 
> > Could you please tell me if this works for you?
> 
> Yeah, it fixes the bug.

Great, thank you for reporting and testing!

-- 
Dmitry

