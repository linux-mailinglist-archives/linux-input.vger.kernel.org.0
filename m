Return-Path: <linux-input+bounces-5315-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 866A69471DB
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 02:13:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC8131C2084E
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 00:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99CD5631;
	Mon,  5 Aug 2024 00:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SBpQDztc"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F346365;
	Mon,  5 Aug 2024 00:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722816823; cv=none; b=nL6rfV+umx2dXlV4U7L+Csg1XEAjV+OIU7VmvVRmk3AwoLBaU3KKVZHpTfoO7LuH9WoTSFLfQIKhhDI8QwLIXVWxAvNwFN1jDFbZPJ69fKCwJ3vsX9hu4u9l6/hxG0UMroK3k9YRksUCV6mPTVNKCF7sNJDJprAwCcaJsFkf9To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722816823; c=relaxed/simple;
	bh=uVorrCAduiKeWUTyairGtco+4A+09i2uq/mFF8crB1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DDkW2vdxum++N+fotmjl6qHV0JhkeybEIjxkeIE8rV2h7HnbgfyCtT+L6Yue3X8Psr/Tu7mCd4J80eBur51c6VKUPv+IdVCGVXLDQG9Vy58NmBCHXk5LtVQFamcNdCVpvsj9Gk559Vrd+YJIFc8ME6ml0aqSFDgRbZ3g0w2iZEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SBpQDztc; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-260e6dfc701so6068864fac.3;
        Sun, 04 Aug 2024 17:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722816821; x=1723421621; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dkFQnqc3Vckow7kxwkifKPwvvrqP8gds2NpG6dbOj/w=;
        b=SBpQDztcChY3yiPpL5pAWAzv60fjoOTVPgqo7erduqujOdKEs19yjt6VhybOxNgVBf
         ej9ZYwcAJ6xynJE+kX0B34tfr+c14SBvaNNPkugXJ6Du+Lw7iszZgeXdfVg4CkOHSpfx
         xqMPd+0Dv+8wqB2u9iKM1AcOAO0iFW5BtpXLvlTCkuFbfp4b4WwT2wNmo7RxEVw4RufS
         0uCZgVwI4BHO1YxWVUYkfgPG+pmhQJS/4FZ+H7fGvPHIULpnorRYGHgA53SLI1FT1ed0
         iCAzsnnwNmMDuFMkDPi8yg6s84cIHRbTQLJYNhcxVUfC0D9UzMAXM61ge4G6N7Soej3T
         VDPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722816821; x=1723421621;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dkFQnqc3Vckow7kxwkifKPwvvrqP8gds2NpG6dbOj/w=;
        b=qE38wqKJ6RAD3V3rfCq8cIIIbsdgrxvrfiUnZplFyKxAMybk3RKY2VpZmdQDm3FlId
         d35XADdhFOTieOF01I4lFf9LUsINYDkCQNtSaxqdfAIY7A8RW7b11o4+YQV9f7SIkDON
         Gui1DNljSsyRZDT/g8ktL4HRal505upgk6ODsVuROtYSduKCDyjTcyz5V+/5Dijd7eaR
         dCbVzaXUKuVM+fgLEOyWqSXuuE/NPA4skGoMXr4TA2iNbAWKWkUUaroAAoXEGwF1PU4J
         g7+gSpeQ+UfGtwTP3JbPIU+NTZF1CoT3XbTohD850ZKPb6ib+YzWAon0QuIlRaE5uFFU
         YCjw==
X-Forwarded-Encrypted: i=1; AJvYcCXWAFFJUIdBQQ9XjiJvhpX+LgTyfqESicCKKb6sDYX5iqUzkrrlWWDPtrGbG0Jt2TfwHGvkywijqFwOMGgRmoa0oqEhCMS0D6DbRvRSd/A06VCLqp+Gm7RVtrWHMrXgkCSDC24+pTLfqND/acwDwCnGh7Qsx477SIo3RvFitqaB9ZrICbvQ
X-Gm-Message-State: AOJu0YyyvRD0mH5iD5zxQOvi4do9RDsxJ8dsShalapSWkno4FCZU7xoq
	kPcMxh3p9je7Aw54yr0BRSG8TmsgFN1njpODtmS20fFwRjMYJJxn
X-Google-Smtp-Source: AGHT+IEmGHyJx5myGf7MwLAWtkQsDtVYfn30W5TGhMcIZJLXT8frvmlb96JUBDtbTa/JWaAlGDbzcQ==
X-Received: by 2002:a05:6870:a689:b0:261:679:d7f4 with SMTP id 586e51a60fabf-26891d4b1c6mr12833570fac.25.1722816821062;
        Sun, 04 Aug 2024 17:13:41 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:22e4:17a:28a:7497])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7b7653b4be2sm3709119a12.77.2024.08.04.17.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 17:13:40 -0700 (PDT)
Date: Sun, 4 Aug 2024 17:13:37 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Felix Kaechele <felix@kaechele.ca>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Input: edt-ft5x06 - add support for FocalTech FT8201
Message-ID: <ZrAZMVCt5w7ls4mO@google.com>
References: <20240804031310.331871-1-felix@kaechele.ca>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240804031310.331871-1-felix@kaechele.ca>

On Sat, Aug 03, 2024 at 11:13:08PM -0400, Felix Kaechele wrote:
> The driver supports the FT8201 chip as well. It registers up to 10 touch
> points.
> 
> Tested on: Lenovo ThinkSmart View (CD-18781Y), LCM: BOE TV080WXM-LL4
> 
> Felix Kaechele (2):
>   dt-bindings: input: touchscreen: edt-ft5x06: Document FT8201 support
>   Input: edt-ft5x06 - add support for FocalTech FT8201

Applied the lot, thank you.

-- 
Dmitry

