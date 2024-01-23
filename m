Return-Path: <linux-input+bounces-1415-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6070F839ACF
	for <lists+linux-input@lfdr.de>; Tue, 23 Jan 2024 22:05:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 168A41F2C193
	for <lists+linux-input@lfdr.de>; Tue, 23 Jan 2024 21:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2A5412E7B;
	Tue, 23 Jan 2024 21:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YAj8ff+O"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8B24F211
	for <linux-input@vger.kernel.org>; Tue, 23 Jan 2024 21:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706043894; cv=none; b=PHf5V5FZkmNAqkojJWqnPGrmSwC0heUPTV29oR88KyRyTt2P8kBazDwb/rSl+a9WiAySkoJ32yup/5y4WoWWlHCLxFlOWyEurpXaL8Hc5Y+aOyXwjeoXthwjkGq2ixijJtIihM+blL8iypl0EFrr+XFR5gzJlSrlDaRcglEkm4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706043894; c=relaxed/simple;
	bh=Wql55NSu74RChfsWDEJ+8GIyniG2mIClUX2TKzJUz4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UW38c/uJ0fw+ETBo6ssyDcsyqYRsWWYhnzBiFLGiQwQuGp6HmyjVeK132I1gGYeLVpZwOmtRaadB/19ZHcat6Y3L+kOyq31zwIvKkDKXDJ5eWlHk9du1tiblUwjXkUbh2jm2/yLk7mjYNNYc51LngD+wNPStJUfypwcqbrhaV8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YAj8ff+O; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1d75ea3a9b6so19147755ad.2
        for <linux-input@vger.kernel.org>; Tue, 23 Jan 2024 13:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706043891; x=1706648691; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PYw/qbtyA6IDie81vfIVJqc6FfWuXktsl3KKxMsgDxk=;
        b=YAj8ff+OC+pjWOPhBxzYOI1yspiVWhKLcz+1N4eQuEb+VCA4nGKk5QeGfyAOy67r+e
         Tj0rf49Koczzis1D56FnefhucJxQ0htWOAVJVogRlq+yeLL3MwAnvyTaX1cWky9OKe7h
         vutz8/gPtxRajaZhDwnpH2rmU2qBEPifo7hytZVbMzMH0YmgcSPJowbJRGiKVEAtDvkG
         MiY/1NbdmaOb6PZaaoPmowpt/Ak6WThQAI/xN1b/2sBnBWs7SWIWz0vn5gqRlUuwNfbD
         73AyijUf+LUJduQf2Xxh0CfWU3DA5pn5tA7tW/W9kZmM+zt6e+Ut3tYKm2+yBq57FYkM
         R1xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706043891; x=1706648691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PYw/qbtyA6IDie81vfIVJqc6FfWuXktsl3KKxMsgDxk=;
        b=LG2vQL5KiwsxcNDfeh/B1+HpnpRrkIZRR+CVw2ARfQx55v7XfXSe5t64OBhf/LS0cG
         FPnQ13GsVGaKeJ6FmRkWcdI3TDgyONDOVEYYaT1Kyh9/LPVSd3+Jxqty93txaezrebtl
         wkRDqNt9YmAgO87RIFKZYZneh5tSFGLBGiSh2tpztvTMsXjHOsZB4dyuBv7h/1t2c2DG
         7gufHdaENA5Q4Ti4QKhn9bbYWt4GgrRqvkq8RU/w+q8TRdrvuXPlKGfRxGPKCNa5ySqo
         AwuQVUUWOFt4R7zdYoZeyy19IXmA4WtQGctyaR0WJ0YXoi01Pz6LpAOjWaz+CbvZATMa
         QixQ==
X-Gm-Message-State: AOJu0Yzs7AC65kUxO6hYD2tL/4RR1RM7CBFAU2Y54u5vxs0Z6hmf3Fob
	zuv4aDcU86SkuURLc5J3wv5SK1LxAIDeCfaDLCH1UpbRFqQyZf4G
X-Google-Smtp-Source: AGHT+IGGvNtUrKPkZQC17vrIAF1boUpeIr+U9wxmmBhP7NZhHcdBnlWtZsaz6GSu/XMb6p6i9q3t+A==
X-Received: by 2002:a17:903:200b:b0:1d5:f10d:2ac6 with SMTP id s11-20020a170903200b00b001d5f10d2ac6mr4964631pla.115.1706043891081;
        Tue, 23 Jan 2024 13:04:51 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:cddd:d715:19de:f1d8])
        by smtp.gmail.com with ESMTPSA id lo15-20020a170903434f00b001d71f2ae008sm7455065plb.85.2024.01.23.13.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 13:04:50 -0800 (PST)
Date: Tue, 23 Jan 2024 13:04:48 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Chris Morgan <macromorgan@hotmail.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	linux-input@vger.kernel.org
Subject: Re: [dtor-input:next 134/135]
 drivers/input/joystick/adc-joystick.c:194:10: error: implicit declaration of
 function 'min_array'
Message-ID: <ZbAp8Lfn1GCWeqYe@google.com>
References: <202401200614.B4PnBzhk-lkp@intel.com>
 <DM6PR06MB533707F89AA767C845DD3D68A5742@DM6PR06MB5337.namprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR06MB533707F89AA767C845DD3D68A5742@DM6PR06MB5337.namprd06.prod.outlook.com>

On Tue, Jan 23, 2024 at 10:17:25AM -0600, Chris Morgan wrote:
> On Sat, Jan 20, 2024 at 06:55:32AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
> > head:   3af6e24a456437d323d1080bd254053f7af05234
> > commit: 6380a59c534ecab1462608a1f76490289a45a377 [134/135] Input: adc-joystick - handle inverted axes
> > config: i386-randconfig-011-20240120 (https://download.01.org/0day-ci/archive/20240120/202401200614.B4PnBzhk-lkp@intel.com/config)
> > compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401200614.B4PnBzhk-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202401200614.B4PnBzhk-lkp@intel.com/
> > 
> 
> Assume this means we need to explicitly `#include <linux/minmax.h>`, right?
> 
> Should I submit a new patch or a bugfix for this patch?

As I mentioned in another email I think usage of min/max_array() is too
clever here. How about we simply "swap(range[0], range[1])" when axis is
inverted?

Thanks.

-- 
Dmitry

