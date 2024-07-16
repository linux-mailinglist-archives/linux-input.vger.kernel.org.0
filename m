Return-Path: <linux-input+bounces-5050-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1F5931FAA
	for <lists+linux-input@lfdr.de>; Tue, 16 Jul 2024 06:23:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C8521C20F6F
	for <lists+linux-input@lfdr.de>; Tue, 16 Jul 2024 04:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEF2CFC19;
	Tue, 16 Jul 2024 04:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oe79pu+g"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674D737B;
	Tue, 16 Jul 2024 04:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721103829; cv=none; b=pzwZj+W6OPJ/RXYn7/9D7VXKwTrJWrgymdQHqg1d5zUM2wHJxmy/qyDMYWxLLPNlTG97EI34WwxFTyu8lFvSERlpNbhKdOCyceYeOX+kj+i6/O1xNR69RMHxbUZXCBi8/9ZlA2JvfUqYpK8++FuhIYfnwedduNhLYPHSPDSYvvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721103829; c=relaxed/simple;
	bh=lojhaQHaRiDZL6PfArGtYYuhb020RDJlITsowLFV2Fw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=afSXK3INvXyK1fk+/nMUvXECJd/8bzZqICs/GK46iksPZ+ruO6NwSWds9OYkRutdgw33opOpWiz66lCR3/q2DNkc42Gbuwvd2pe1AE9cHT8Lhg80qZFN5EruQ7YNuFTBtTOPCgEU/d6zLcRKncMd1V0IfofIQYUZJ6jkNJ0CD2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oe79pu+g; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3d9e13ef9aaso3157602b6e.1;
        Mon, 15 Jul 2024 21:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721103827; x=1721708627; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9ml6RznhKN6IKPxF5M6sD9htOG+ki9BR3J6HzTheL2A=;
        b=Oe79pu+gjf8qTpbKXBIuP/P/JOuLxAWgz0qw5JZpru8mzV97zyhtgjZ2Z6gHntmNib
         Gll1A6vXtUfulyI/mRwNu9QvmzvKWfRBijTua5X2i9RnHqoVKk8wrO60uXRNyErscfMh
         3sxwHonFqrBj6/2g0YPoaZ0qwTV4tqsid0m4SVkyXg2x4tK7hd6rfnG9Qme1iD+SR0Ra
         jcHIVJx5gDHQjTXSkZ1dOJ28W92X9K7ZMkBFnP+qGMIz+bOy9Xnqdx9wlGG+NklL93lZ
         gpfbTN27SRwo5CDQfOYLW4BmADmWsQmXahJF5tIOppOUbyrj/nQfgL5s0vVwSruNjexB
         boGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721103827; x=1721708627;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ml6RznhKN6IKPxF5M6sD9htOG+ki9BR3J6HzTheL2A=;
        b=MX3QKLJEQPvwgRaTpnRnoil6NF+ZEmPI6gsFkgpE4xWcGEckfE3YPkUDUhKt/bdFUt
         T6HhkciVK4ITbx5ruzHRap+py/KHJwJFn1717lQiw3a6FkMEFa5AoMu0mhI9F3iwITpi
         zfisqoHPVu2vzi/qOUF/7vBOvxA3WkTvl9SKb6uj9L22lhVYzbvaj4/9c2TEJHCebuR5
         Sh/SBYhWQ9asP7Mx/uMqobqGhZc0NAnY9hZ1HDI4RmX+wkoV/p5khK9MSu268dGwkIRj
         fi28j70p8rWTL5Fbo4cIc8beLsmcVNs5rIYna2CmY5bTOq3cRp6DOSPR3fVQNU23gLcg
         lzNw==
X-Forwarded-Encrypted: i=1; AJvYcCUD7UAAmh2RHZnzH4e2kpMT/iHRHnfj8jMr2h+qpqX9At4/aAFFYTkEO2G/tQlObreiSMSfndoD2X8XJltxjPYwR1whNzhF+8mkzDTL
X-Gm-Message-State: AOJu0YxqAbBZSWs2NvCwrXbQkmUtSw4eWWtRXdkggG1G2dQdgY1t4U6M
	QfYli+KAi6rz4qM1Lf+7nHDQHEQhAeo1X03DBl48vb4+2c7aey4U
X-Google-Smtp-Source: AGHT+IG7WhXhUyDH6wL8Vn699L/2Zg/YDZfvm6Ub8/VmEQ5JUx9zYeViFCpjE4N/H6FM6bY3Ox9HtA==
X-Received: by 2002:a05:6808:17aa:b0:3d9:245c:4209 with SMTP id 5614622812f47-3dac7c17b36mr1127006b6e.40.1721103827234;
        Mon, 15 Jul 2024 21:23:47 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:6d45:d4db:b14d:ea69])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-78e34864ae9sm4037934a12.40.2024.07.15.21.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 21:23:46 -0700 (PDT)
Date: Mon, 15 Jul 2024 21:23:44 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] input: qt1050: use
 device_for_each_child_node_scoped()
Message-ID: <ZpX10HRCFMhBbeoU@google.com>
References: <20240412-input_device_for_each_child_node_scoped-v1-0-dbad1bc7ea84@gmail.com>
 <20240412-input_device_for_each_child_node_scoped-v1-2-dbad1bc7ea84@gmail.com>
 <ZpXG_TOdvq6SF22s@google.com>
 <5fcf9e51-1fcf-4f51-8870-e709b6c87a55@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5fcf9e51-1fcf-4f51-8870-e709b6c87a55@gmail.com>

On Tue, Jul 16, 2024 at 06:17:35AM +0200, Javier Carrasco wrote:
> On 16/07/2024 03:03, Dmitry Torokhov wrote:
> > Hi Javier,
> > 
> > On Fri, Apr 12, 2024 at 10:57:31PM +0200, Javier Carrasco wrote:
> >> Switch to the _scoped() version introduced in commit 365130fd47af
> >> ("device property: Introduce device_for_each_child_node_scoped()")
> >> to remove the need for manual calling of fwnode_handle_put() in the
> >> paths where the code exits the loop early.
> >>
> >> In this case the err label was no longer necessary and EINVAL is
> >> returned directly.
> >>
> >> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> >> ---
> >>  drivers/input/keyboard/qt1050.c | 12 ++++--------
> >>  1 file changed, 4 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/drivers/input/keyboard/qt1050.c b/drivers/input/keyboard/qt1050.c
> >> index b51dfcd76038..6ac2b9dbdb85 100644
> >> --- a/drivers/input/keyboard/qt1050.c
> >> +++ b/drivers/input/keyboard/qt1050.c
> >> @@ -355,21 +355,21 @@ static int qt1050_parse_fw(struct qt1050_priv *ts)
> >>  		if (fwnode_property_read_u32(child, "linux,code",
> >>  					     &button.keycode)) {
> >>  			dev_err(dev, "Button without keycode\n");
> >> -			goto err;
> >> +			return -EINVAL;
> > 
> > It looks like the chunk actually switching to
> > device_for_each_child_node_scoped() is missing from the patch. I added
> > it and applied, thank you.
> > 
> > Thanks.
> > 
> 
> 
> Thank your for adding the missing bit. Did you remove the child variable
> at the beginning of the function as well? It will be unused otherwise
> (child is defined in the macro itself).

Yep, I did.

Thanks.

-- 
Dmitry

