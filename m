Return-Path: <linux-input+bounces-12813-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C8DAD5B7C
	for <lists+linux-input@lfdr.de>; Wed, 11 Jun 2025 18:10:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CFB51888177
	for <lists+linux-input@lfdr.de>; Wed, 11 Jun 2025 16:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EC961DE8B5;
	Wed, 11 Jun 2025 16:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V3RJUwbp"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC121A5B99;
	Wed, 11 Jun 2025 16:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749658094; cv=none; b=OnOTQARQL+yao1A+R4y3iqcztoSrsqZfOj+kFzThqwZekaSsBLuthq4Ip4d3KDMd+EP3SGtBdHZXt/OMVc/I1q8ZiVWKVqbPoel/fFTEz/9r6+jQV4YmsSzOjldziQ1s/3cchYfHl3Pw+zWwXtU+1ZfbRAjRPU4acPH/8HZr0nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749658094; c=relaxed/simple;
	bh=14QE0YHwFNH3Qn7F61SBsHx80PF7+y/VLlnXyH3UAMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pH5lAFDRb4YNT5FwYON7J60dN51kyToxGVzf0BwF8iB8RNhTnVWDLo4qe5iTCtpMcAdXvew6zpdTo1d5bszb8W6LXcZgnIDTp45apPtFEnDhRdrSAnXqDjIhZLFSZMTj/PQAdp02dCHO6CSHRewFIjldIFRSQx5RXAJSlC3SAhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V3RJUwbp; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ad8a8da2376so1118763466b.3;
        Wed, 11 Jun 2025 09:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749658090; x=1750262890; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uaT1m8ZywVYFG/p0OzTe/+0O3rZFOWFv1uLVFO6HGf8=;
        b=V3RJUwbp8oqJ+RZ5QyyROb8kd8sHis59NPp+nGNc61Wdr1fi02rv/gVYTSJbBC2wr5
         ueezn/FEq48TqU+ojHRIUNWqbpxSiAWSVm4rHJ4jRAF2Gf+mzJxx8uF4gzGJOBUBfFpN
         AELurQd0RrvmddZMnweDOybJW5u8zs2BfB8fT46jH2qeaonAoRsxL2ZxDkv0pHaPzJGF
         Q9j6armIRXXmhJ+pSAJaGlBNqB3YhtBZuzBRgFVgIM5wF00pehyxHfXYrMHjqsCIy3Mn
         9JhVbxW8MMqmU3xM9f/YgmcYs6hBpWOmeMgMIEHsAUzTz5D4EttwyHRMCa9Ja8fIio7R
         ASYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749658090; x=1750262890;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uaT1m8ZywVYFG/p0OzTe/+0O3rZFOWFv1uLVFO6HGf8=;
        b=DOg2I/m2SP9vAO00ZZxKc09GI4Tycg1tNTUnkzwxc5bFJcwnKDnW/BJN8hQmVGVh/2
         nfbLbxOqoK07zlZvm/tg0AWp3QEdMxVypU1R26qvza5F/o1DzmrKZlPk3FmkwPfgsIS5
         Y0+Cph+2aiJiB4YhCm1IQthHSt2oiwdOYsoKXZoVHRzKbxM7ZXK71+cmsMHSA7zXfHm3
         vZRwhvPoEMejcFSkPPGIQ9wHlXrn/i//0d4cDTl0CSuZ6kU/MmdqLbABKJGw3AVK7/gE
         4f1PI34Zh8CDHGs7PGNODKcmvtx3H3hN6lcSTzqbqjrRmGRuoNSrsLEIntL9jrHQDub+
         TDtA==
X-Forwarded-Encrypted: i=1; AJvYcCUyEdJKHRoA9Ek2/XMZnUfDPILrIZi2S8ZhWzMFQ9ZtSjlrXeWYkUKn5URWG2FS3tWSUV0d+NWsA0eCAJpK@vger.kernel.org, AJvYcCWWU5r8hy/Q2P9YnUFJkYiPimCWEZuH4aOKRpk3sDxheRv94Z7HjS8SO0ChnHPbxrr+VNZePXoT3nivuRw=@vger.kernel.org, AJvYcCXNG+SEeLsD0X4BXpRhMxwLi8S0Ek9ugZf9GmpEgBWhFQbENxXLnCRJZL8H9QMlj7APKIzZMvX1TiNs@vger.kernel.org
X-Gm-Message-State: AOJu0Yz28iYHfOw5VoavZuU1zzZe40itymg7ptqLVZjK+E3vAmzXViMk
	CL1MZOpjETy8QlCqMLedS5SRHN+1wZaIAHMf2fW0RrpTxSOuoLip6zdzOCVJM490
X-Gm-Gg: ASbGnctBr5ResRNC2v2u0AVD/g8ncP3+Z1k+frrfxS7PaAoM7OUwR4Vc06Pw01JI32U
	MS4UopriO/SWo0EEt13poCEg7/BdHstxO/5FcqI5uEsAeKRBzdIoi+o7aIv+BlD7C1Mtl9aIiR/
	NjGu3f9g1WjE9r1WGStA5CwRO4VtzbZx15QwT4AH95PEO8fSvbk26oVxi28TLaB53sqObDNZN8x
	7LksIb14mxJxxomEPeXjZszhseuZOcWFPUOe/E+yYVBLFLsB9Nv+5/YTEsWCL6HKi27/1mt9eGx
	eJc1ETwvCJyxJ8zgWD10o+W2ZkpJH38z75bx6Ns5EZkhE9vPrdcQmtXOOM+IK7EyOUWmj1Ga4Hl
	8GQ==
X-Google-Smtp-Source: AGHT+IGkwhe+CnUPPbtlYeCi2K1RsCJFsZMBMkH60hdrROt946z3oFlrAZmIy+D7HoDvQBFv7IMQXQ==
X-Received: by 2002:a17:906:ef0a:b0:adb:4775:93c7 with SMTP id a640c23a62f3a-ade897f33d4mr391370266b.56.1749658090116;
        Wed, 11 Jun 2025 09:08:10 -0700 (PDT)
Received: from jurenat-workstationFai ([195.178.92.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1e3625bbsm906761566b.185.2025.06.11.09.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 09:08:09 -0700 (PDT)
Date: Wed, 11 Jun 2025 18:08:07 +0200
From: Tomas Jurena <jurenatomas@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: dmitry.torokhov@gmail.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: tca6416-keypad - Add OF support for driver
 instantiation
Message-ID: <aEmp57H3Tk6DnJty@jurenat-workstationFai>
References: <20250610154609.1382818-1-jurenatomas@gmail.com>
 <20250610181542.GA2396962-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250610181542.GA2396962-robh@kernel.org>

On Tue, Jun 10, 2025 at 01:15:42PM -0500, Rob Herring wrote:
> On Tue, Jun 10, 2025 at 05:46:10PM +0200, Tomáš Juřena wrote:
> > From: Tomas Jurena <jurenatomas@gmail.com>
> > 
> > Adds support for instantiating the tca6416-keypad driver via
> > Device Tree. If no platform data is present, the driver can now be
> > probed based on OF bindings.
> > 
> > A corresponding Device Tree binding document is added at:
> >   Documentation/devicetree/bindings/input/tca6416-keypad.yaml
> > 
> > This allows the driver to be used in systems that rely solely on the
> > Device Tree for hardware description, such as embedded ARM platforms.
> > 
> > Tested on Toradex Ixora 1.3A board and Apalis imx8 SOM.
> 
> We already have a GPIO driver for this chip. Would the 
> gpio-keys driver work here instead? Seems to work for 
> arch/arm/boot/dts/ti/omap/am3517-evm-ui.dtsi.
>
I was not aware of this. Anyway, I tested this today, and it seems to work just fine with my hardware. There is no need for this change from my side.

