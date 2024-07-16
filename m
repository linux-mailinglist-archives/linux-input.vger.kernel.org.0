Return-Path: <linux-input+bounces-5048-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E2A931E42
	for <lists+linux-input@lfdr.de>; Tue, 16 Jul 2024 03:05:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89ABFB22112
	for <lists+linux-input@lfdr.de>; Tue, 16 Jul 2024 01:05:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5020A187F;
	Tue, 16 Jul 2024 01:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E7cdU2n6"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4D3F9EB;
	Tue, 16 Jul 2024 01:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721091915; cv=none; b=dPn6TzEpFymeePAMZm/oR/u4St8t29y6XdJNs5wV0wmhKMMJo64MzLmM9nCuFqn/0QvPkyY8/j/VAe9c4VOyoVOF1IK4Wa8NTiyfXnb/V1662H2Nv2x2xpdeIHqt/EDvNcW7Y7khBySACByxydQE5galqwUgGd52fBHlmV9TI50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721091915; c=relaxed/simple;
	bh=9gPSAq95rNiZCXyBU3Kd6hCeOEJ2HutuI47VBsQFkI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VlJ3vraF9f/aJw34ZKtydSccyeiADy2dY3Q5BGIxyy6C+VtGAEGykqlBYtJCB1Bxgp620CajtPOBOYhCkZ3uNemcKdhhI5ehk5bDeoMhosvDiVDA4QY8rDwUNJW2XXKV7RYH5+HFbAjPsJSIQlsD8/66u9YXmdDP6lvkIWT9nnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E7cdU2n6; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-7669d62b5bfso2881670a12.1;
        Mon, 15 Jul 2024 18:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721091913; x=1721696713; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pp+fEGwUsMKJFAFFVlger+9tRuEQAUzXCtEx0rK1fiM=;
        b=E7cdU2n6Upm6xCnLL1w5NjmUJD5TG+BuE76Z/0MX2yU5gDPiY9O1UAxmDlixH2YLnX
         G4o799dNNMGydXTaovxMECeO2nPMZhpW/CDQl5wwR88HmFHFwmuqWaKfTSDyFv38TTH9
         IyjIOWTfF9FKeA3rH6UCp/Z0u9ZwVJ1MmGBiOOpmBSO9z4jHBhK5WHWaZztXL7L+H0BX
         wRuCrgloI6ID5dPcUcbSWIRqnPYB1YACId6Y64GTgH0XoS/ucl7Of4eh5dzRdPLsOMWu
         M8SjncA6c4lUWQZsgjbWXMRwgq1iwTc+5CqKX3OINPlFORvRoISWZZ8FcJqjXr1Hmvsw
         57hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721091913; x=1721696713;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pp+fEGwUsMKJFAFFVlger+9tRuEQAUzXCtEx0rK1fiM=;
        b=UFS7yRru1hX44zi3mwx7A659U/PgZR5pSTlhO/kFSN9+FdXsCBGVDKPwRqzSHgeYV6
         BZOEwhfqrriDwrBDCXgT7ZwWSoO8h0uo9tgU74rizZGxbOhmi8LkK5HI3Cnmgv1AmxWC
         TI41sS0e/sbtYTadSHYD8j9b7SsFm8FGDdIC0Nz0P6tk6aDyJkYIToHCdKCGq8crDj5/
         imgnmbUzz6bPZTEr2BS8zWaKD7oHIYAw105eKZaalVN+Ms3eH4NEFQ5nj3IgHKCrjvL4
         sXLRz39uhmFJ2fKR2MaSdu/bGO30SSAJM7i9NYt0aZDsxmI0X1cAOZYa4YoG3hnOltJn
         LsNQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1DaEc2Vh318ukkSuuq3Amo8RoMhGB7P8UOiFFiLsXA7dzKIFH444II/MqIXGNgvmbU6ofoLU7+RE3VIhc3ya7B0REY+2rpfF0h/xE
X-Gm-Message-State: AOJu0Yyq/sWa0yg8MnQq2y1HL4u+oqjMi7xgYOtdZyU3bb74DgwnxtUa
	lwOWB8VizT3qEVY3rLBzIjsNS7b9TBx8BuSqAjANodJ5KXvIF++J
X-Google-Smtp-Source: AGHT+IGGgF7eGJU3h+t38zRil0xKHRoO/XzydhvlGw9FhA3C+gaj3VzYyzjevCA2/kXHraOzTumULA==
X-Received: by 2002:a05:6a21:1796:b0:1c0:f48e:a5ed with SMTP id adf61e73a8af0-1c3f12719b5mr644048637.37.1721091912990;
        Mon, 15 Jul 2024 18:05:12 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:6d45:d4db:b14d:ea69])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7ebb6754sm5011506b3a.56.2024.07.15.18.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 18:05:11 -0700 (PDT)
Date: Mon, 15 Jul 2024 18:05:08 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] input: use device_for_each_child_node_scoped()
Message-ID: <ZpXHRPLJOMJ-K2jb@google.com>
References: <20240412-input_device_for_each_child_node_scoped-v1-0-dbad1bc7ea84@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240412-input_device_for_each_child_node_scoped-v1-0-dbad1bc7ea84@gmail.com>

On Fri, Apr 12, 2024 at 10:57:29PM +0200, Javier Carrasco wrote:
> Switch to the _scoped() version introduced in commit 365130fd47af
> ("device property: Introduce device_for_each_child_node_scoped()")
> to remove the need for manual calling of fwnode_handle_put() in the
> paths where the code exits the loop early. This modification simplifies
> the code and eliminates the risk of leaking memory if any early exit is
> added without de-allocating the child node.
> 
> There are six users of the non-scoped version in the input subsystem:
> 
> - iqs269a
> - qt1050
> - gpio_keys
> - gpio_keys_polled
> - adc-keys
> - adc-joystick
> 
> This series is based on the master branch of linux-next (next-20240412)
> to have access to the scoped version of device_for_each_child_node().
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Applied the series (after adjusting qt1050 patch), thank you.

-- 
Dmitry

