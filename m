Return-Path: <linux-input+bounces-5361-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D613E9484DE
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 23:34:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9227F28126F
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 21:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1672E172BA5;
	Mon,  5 Aug 2024 21:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QkWxoyUM"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CB9172BBC;
	Mon,  5 Aug 2024 21:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722893384; cv=none; b=Bs9Y0o3F7J0dPz7N32uV3qL2hMo/bjz3Dta5km5QLd0E52JkuOrk1Z4INUrqFUEcGRC5aO4jgIcTVCY3u5PstywK+Sdr2aGzrfS62a7jO22tNaa0c/0A9upMDrvUX19kjORGbyvUdivMrU82f8fpmyr5xQG9JdMMcIIeQMt4DJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722893384; c=relaxed/simple;
	bh=Rc9/Scd9LV1mp7Rp5OWAaSkGROsvNZErc9Y8out3dD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M9TC8s3BGcflwIqL0rfNwl0GHfcKjnYfreskVe7ezGGgBm6fK7Z3Nep5BkZR+8u8dKq1b/jKrddG8aDKPPdpLCqerK1V4pDB5cyf7oSntkAz4wJXs9vrQLuEyTYxMtlLM6UFiSxhzZdAMvEswjkUi2UVbVh0Oyz3pTXW3lim5Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QkWxoyUM; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1fd70ba6a15so83525525ad.0;
        Mon, 05 Aug 2024 14:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722893382; x=1723498182; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5R8qingnKHE1sSnceSvImf+uxhthRiDd71Y2tMBRrYo=;
        b=QkWxoyUMBWMSXoiQvg4mv1G+qAyqWNa4HkLedN/w8EzYpEGTvTGOEjxoVXUfNDyyH0
         bc7JiBYK/IawORqlgy+RtyUtVWksAC3ByZIrv975FalGd/aPp+nIKEmX9qU42jddnwRN
         gy3lXU0+ojYt7cenUPHo3tejmOj8U4x26xS9t6yvpSQ++qtTIUJKdJ26lD99/MMROjsY
         /k/WBmhmCVtixJ/3NqHl1q2CbMdoOy8ozjWAmAtf1NI/0+gDuhUDCbPOtDuh5lNHZ36h
         f1KNqrocOERkgzcvEjsQoCaFPsUeh4UFjceBP6jshndofWRutFdqkKHqKV2c/pM9Ol1U
         1W2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722893382; x=1723498182;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5R8qingnKHE1sSnceSvImf+uxhthRiDd71Y2tMBRrYo=;
        b=YtSVo/kypzJgsdFG6JOqcGRghUp2F9ubrY548Eg79oAMXf/InBz24DKTC0SFH2MoFf
         9tY0vwWf+0LvDnzDLCjedeR+jEQcQxYjxsSDh3oTUxKQIUnkFMKFq8gu5NU7GVrh+tXq
         3j3Gqs9Pm2v2b/oqoSzxBw35X/B96wyXkPYCsNyulHCO+64Kls6vpTpXi42fRcdYa82+
         1hmOILG1dgUSYLOHvhRkyZV1Q77TTauK2LDE09ZU+/EfI7soRwmntmgy5eoXeGScNf6V
         MGozCsPQhnesahHV2Md6usw1xWxA1iOKFxKJR4Q5d2MAIjECZpVfDg9DstxfF2c0s6W+
         lVbg==
X-Forwarded-Encrypted: i=1; AJvYcCVZ7NYNZzpRXsm8b5nnRGbWf7ARiOxly9nXDiSV9WGFcAjCbyIJfYBIMd5R7jRhTdC6AeSP8ZvpeqiTuxZfP3Iva5FhMFjck7GJeRUNRYeAPltKdaDEjLKKeBO/1NrWDo3R+KvYzuwAKZU=
X-Gm-Message-State: AOJu0YxI3XtVfMP2/hlCdju591roFA2cKSxw+qSOHOmYYC/Rnzgt3fVX
	63cOvnn8vSdq4bMqjBzpp40NzH+IIOazx+YWws/7hoO9KmBTBjSC
X-Google-Smtp-Source: AGHT+IF2j7ps9k+6l1cQEnPtesTFVF3Ua6BRrBnA3eWbVWcHwO1aQYqz6PxwW7dFR1rzA0ouq8840A==
X-Received: by 2002:a17:902:d2d2:b0:1fb:7b96:8467 with SMTP id d9443c01a7336-1ff574cf808mr124076865ad.63.1722893381804;
        Mon, 05 Aug 2024 14:29:41 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:b116:76da:13a7:247b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff58f5713fsm73331435ad.95.2024.08.05.14.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 14:29:41 -0700 (PDT)
Date: Mon, 5 Aug 2024 14:29:38 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Vojtech Pavlik <vojtech@suse.cz>
Cc: Clemens Ladisch <clemens@ladisch.de>, Takashi Iwai <tiwai@suse.de>,
	Andreas Mohr <andi@lisas.de>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jiri Kosina <jkosina@suse.cz>
Subject: Re: [PATCH 1/2] SOUND: kill gameport bits
Message-ID: <ZrFEQkveaV6Q-Ayf@google.com>
References: <20140820024638.GA25240@rhlx01.hs-esslingen.de>
 <20140820051815.GA1109@core.coreip.homeip.net>
 <s5hwqa3hetu.wl-tiwai@suse.de>
 <20140820063130.GA11226@core.coreip.homeip.net>
 <s5htx57hc89.wl-tiwai@suse.de>
 <s5h4mx6rshs.wl-tiwai@suse.de>
 <20140824050716.GA523@rhlx01.hs-esslingen.de>
 <s5hppfpt520.wl-tiwai@suse.de>
 <53FF8B2B.3050506@ladisch.de>
 <20140828211110.GA24519@suse.cz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140828211110.GA24519@suse.cz>

Hi everyone,

On Thu, Aug 28, 2014 at 11:11:10PM +0200, Vojtech Pavlik wrote:
> On Thu, Aug 28, 2014 at 10:03:55PM +0200, Clemens Ladisch wrote:
> > Takashi Iwai wrote:
> > > did anyone test the patch at all...?
> > 
> > Appears to work.  The ymfpci gameport seems to be somewhat unreliable:
> > 
> >  analog.c: 100 out of 17347 reads (0%) on pci0000:06:06.1/gameport0 failed
> >  analog.c: 122 out of 1111 reads (10%) on pci0000:06:07.0/gameport0 failed
> 
> The analog.c gameport read routine is unreliable by design. 
> 
> The 558 chip is not an ADC, it's an one-shot timer from 1971. The analog
> position of the joystick is measured by timing bit changes on the
> gameport.
> 
> analog.c does that without disabling interrupts, as the read can take
> several milliseconds. analog.c instead detects when an interrupt influenced
> the measurement too much and retries.
> 
> The retries are counted and reported.
> 
> 10% is a largeish number, but still something the analog.c driver can
> cope with and give reliable results. 

So 10 years have passed since I tried to remove gameport support from
the kernel. I do not believe there were a lot of meaningful fixes.

Do we still want to keep this in the kernel or is it time for gameport
to retire?

Thanks.

-- 
Dmitry

