Return-Path: <linux-input+bounces-4237-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B81C900C7B
	for <lists+linux-input@lfdr.de>; Fri,  7 Jun 2024 21:31:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD9FA2850D6
	for <lists+linux-input@lfdr.de>; Fri,  7 Jun 2024 19:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A64A738DFC;
	Fri,  7 Jun 2024 19:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TDGjsecF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483931DFEB
	for <linux-input@vger.kernel.org>; Fri,  7 Jun 2024 19:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717788707; cv=none; b=PbWFlzUJX2zZBVqqHoypaXpb72nHMq3CUN9QtBmSmxLL2rYfUEx3Wm0BhsyZUf9Niz1y+dIjR9MP/ATKwo1XPJRArdyFwdd72ntbVxILoiTp0qLIM87cvsoch8N2USUM56rr5oa6bQA7+46t2+qIWTy3jNvC6r1o0DL3UCTDRAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717788707; c=relaxed/simple;
	bh=7nnRHXJ5mTGJrBQXW+PDSlKO4SxMJGnpUQguAokIw44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZBWBNSwEIvHuWUcFfAK7F5Qyjp6uQxI/8QdlwZvgAheGvObX0NoqKr/L+Cy8ccqUwb59SXSGEl+trV/IS4T/6NeuBfstftOL7K1bk205icZr2cv2odbhmsJRqmriKWKbDkhlJw/jbxb6nOw9KxLMPLYbhHft/Vc8ElI0phfNjrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TDGjsecF; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-6c53a315c6eso1929505a12.3
        for <linux-input@vger.kernel.org>; Fri, 07 Jun 2024 12:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717788705; x=1718393505; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YbsQKrCsW5vLFQx3e0JQMpoS3G8vMtKKtCTiCmvwkWg=;
        b=TDGjsecFe+B30/tAsBGQ4v0803DdZ3B8SWvIvgQbi7MqTodyQ4DKFP92zPSiijkYlh
         FJHgn3WF+bpj4X5GAE7sw4D7h/yP4VXvhIZFfpCSvlyrl3ZoVlV2i2vGVizDimdnNlhz
         AZ7OlunxRDvEZPiaMqBZDIPhu446gM+F0UfZCeHyWbdWBgx6W9AODbtVVL08jTYtfCB/
         cQ1DQt+JCeieETazAPsuMMK1Tpbc6SM0UqUMGzUh9EPDFt7zeJdKD9l8pELdOd4MtaP4
         0OzJJy9rbu5MfDLpoKo1B2+fg/QJp3mV4VpVF+JqiPSBpDSjomUo4QhWsLqQHCN8LbwE
         JGlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717788705; x=1718393505;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YbsQKrCsW5vLFQx3e0JQMpoS3G8vMtKKtCTiCmvwkWg=;
        b=can9RAWg8HHEqP9NlMw2Xcv4jWmqEqkZue3LySN2Nk+O1+eiZcoH3ZgTLLrrzfBUHJ
         8n2UeCJvDCR6LN9zbyfexCZvep4bxrmNn4f0NlH9qXcfkNXhou1A6BZhbvWFgjgiXF6P
         54Sqfu/y/N58U8sp2tzCqnDOTcSEsMa2SSoNgS2Rr3oCNs+vLokjdzf312Ltsmd5e6Qg
         AKS1XtEo2tQVka/SoAFqfCOi3L364ZAHveWNktaY+Bu60DumeI6MQ+mIywXYbiwDrbvW
         yBDbN57EosO3wl02SYC6qeQ78g7Mv6OQXgrFcMJqxdZXPtcBlwYfTZaSyFs4A3iBlSPz
         uSDQ==
X-Gm-Message-State: AOJu0YzWWFaZzRBoZXZ2uWTxyPsLtb83OrfYM3u6a+bjgWSzJLJ4QPir
	2Tx6RDw+WhfThnavyU9igFC2IWTPWJc5RSrtnPp4Aedqo9zqHNYQ
X-Google-Smtp-Source: AGHT+IHlbqlLrtrjwixi7v9vW135P+j5cOK64NQN5cvAz3s7YXX2vlf13JaSF4sTpMHxMIDkSzIckg==
X-Received: by 2002:a17:90a:2ec2:b0:2bf:8824:c043 with SMTP id 98e67ed59e1d1-2c2bcacb8e7mr3489231a91.18.1717788705379;
        Fri, 07 Jun 2024 12:31:45 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:b8e9:3447:a54a:310b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c29c240e72sm3982577a91.33.2024.06.07.12.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 12:31:44 -0700 (PDT)
Date: Fri, 7 Jun 2024 12:31:41 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-input@vger.kernel.org, contact@artur-rojek.eu,
	hdegoede@redhat.com, paul@crapouillou.net, peter.hutterer@who-t.net,
	svv@google.com, biswarupp@google.com,
	Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH v3] Input: adc-joystick: Handle inverted axes
Message-ID: <ZmNgHfI2maMKoMzc@google.com>
References: <20240115192752.266367-1-macroalpha82@gmail.com>
 <ZaozAsSblybdoeEK@google.com>
 <ZauN-gBsIPO0AyGE@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZauN-gBsIPO0AyGE@google.com>

On Sat, Jan 20, 2024 at 01:10:18AM -0800, Dmitry Torokhov wrote:
> On Fri, Jan 19, 2024 at 12:29:54AM -0800, Dmitry Torokhov wrote:
> > Hi Chris,
> > 
> > On Mon, Jan 15, 2024 at 01:27:52PM -0600, Chris Morgan wrote:
> > >  
> > > +static int adc_joystick_invert(struct input_dev *dev,
> > > +			       unsigned int axis, int val)
> > > +{
> > > +	int min = dev->absinfo[axis].minimum;
> > > +	int max = dev->absinfo[axis].maximum;
> > 
> > I changed this to input_abs_get_[min|max](dev, axis) to avoid peeking
> > into absinfo and applied.
> 
> Apparently min_array() and max_array() are a bit too new. Also I am not
> sure if they are actually needed. Can we do it like this:
> 
> diff --git a/drivers/input/joystick/adc-joystick.c b/drivers/input/joystick/adc-joystick.c
> index 10ee13465cfe..916e78e4dc9f 100644
> --- a/drivers/input/joystick/adc-joystick.c
> +++ b/drivers/input/joystick/adc-joystick.c
> @@ -185,14 +185,14 @@ static int adc_joystick_set_axes(struct device *dev, struct adc_joystick *joy)
>  		if (axes[i].range[0] > axes[i].range[1]) {
>  			dev_dbg(dev, "abs-axis %d inverted\n", i);
>  			axes[i].inverted = true;
> +			swap(axes[i].range[0], axes[i].range[1]);
>  		}
>  
>  		fwnode_property_read_u32(child, "abs-fuzz", &axes[i].fuzz);
>  		fwnode_property_read_u32(child, "abs-flat", &axes[i].flat);
>  
>  		input_set_abs_params(joy->input, axes[i].code,
> -				     min_array(axes[i].range, 2),
> -				     max_array(axes[i].range, 2),
> +				     axes[i].range[0], axes[i].range[1],
>  				     axes[i].fuzz, axes[i].flat);
>  		input_set_capability(joy->input, EV_ABS, axes[i].code);
>  	}

OK, I went ahead and folded this into the original patch and applied.

Thanks.

-- 
Dmitry

