Return-Path: <linux-input+bounces-6280-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDC596E979
	for <lists+linux-input@lfdr.de>; Fri,  6 Sep 2024 07:52:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A8C13B23377
	for <lists+linux-input@lfdr.de>; Fri,  6 Sep 2024 05:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3A2883A18;
	Fri,  6 Sep 2024 05:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ntS5P2k6"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9E1208A4;
	Fri,  6 Sep 2024 05:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725601922; cv=none; b=k/lYYX2jZoFGX9a0w3T5FLAc6Jb2kLndLVDuxqvw+OlOvmAie3iFiYk4c1KN7aQRBX9rcRyob1XqiusFuKLBc4otJn7jDF9aUAMc5aEg+MHcCKuMcxQ+vmuu/VMOa3W0r0BdvdZH9H+hz7VZYOG9bzVIzKrP8U6Zk0y5vzFTz5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725601922; c=relaxed/simple;
	bh=o+b03M4oIh6T/mO1zYIw8vUKdX2iI+rnDxNrKZsmkNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WuzfVakyQteTkXC/lJd4I65qnATx3Bx+Q1ZqzvVhSMeK66O/4dCkjICQBlv4G/YvTIcDrQc+pPzyvl9GT+IzzPGxCqBWd/FxkVWiJWSAfTmumkkN8sxqQojS7WDI1g4D5QtJAKePwpcyoaZhBmKCl79kS0MpWXNpHfOE7YWO0Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ntS5P2k6; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7d4fbe62bf5so1205772a12.0;
        Thu, 05 Sep 2024 22:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725601920; x=1726206720; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nGDegmUWUcAdJnXFrGeDVNzBYVl96Zdk2+FAxGKk5hc=;
        b=ntS5P2k6am0puyC4FmhP61hVVrpUL5BLfRv/bvYMbe3CxLszOaF427IOUw6ifAjIyc
         lkGj81KXI3E8FnLMFTNaT8BtQ69gjQIBaFe0sLKbDhsJ4Pbpp9e1yoXYY1TKRsgYM4qm
         x6UAP7eqe2fCko2Y9N810LXbl5Rn5EL4NCDpXL9pNNwv9zTMXtv1Lke+Ln8g/LSeeM4m
         0tbZlx8zNsMzl29Ujqyoy5V61qKeYM60KZHyDJ/XgH9gG/yrPmQTmKeYkwQqxevohfD0
         j1UjATn897Y9713Cs/0WtG/FYWXLyMUeDph5FHAEQHxkg1MZdJjXIDHq8mlrheDnCrLy
         oEFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725601920; x=1726206720;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nGDegmUWUcAdJnXFrGeDVNzBYVl96Zdk2+FAxGKk5hc=;
        b=YHuaqIugsE9IoHqgtyAk2hXQnYUGLpWV1iGJxpIOAt+5kyold3LIba840ltofFJVsV
         KI/SQzLrxLW0jcbpkcKBH6SXVgYwYQFLxv5EGbXNzQnuHlY18m2+CdZyFIdeOlmSSrvc
         PnTDh1LAQIv9yujt+xijP+vk7Td1KqIE2WAQfcd3MYGFMQQmwsmYRizMixwhsJwmS4cA
         Iw9RbyKN03Y6E7CrC6bi9fFEIpO3EecEW9xMFzv2jIacNhtYR5BaNCZXJK1JcCs59bqa
         t+eEBTSitBMyD0R0ZqtYlGp2B2UUhi6WlSOJ2qdl/75JrqOvOdG9rUOBRg+n3Ir3HXuA
         gZ2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXAfbV3lpWQawiMSg1KrdvmYM3BwS1OBF/p7kTwUAbpocKTb7zuXhVVv66N2ARVcq8NcVrnNCgfx+1pztM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy93GjrRuQykfKRBA/XgHIZ2UoKznzLbssipMAvZBtVXnsTAChq
	aeb+OOoGI0RR6lWa1z77UhhfbszS2uRRo394Olz9bqNYOnDxZ3F9
X-Google-Smtp-Source: AGHT+IHCPf22vLHlz0Jkjq2u5Bt7PWO3M24AOoZ31h1eFnUMqeI+HaLHKdtzt5JV/huU28aLFCzOoQ==
X-Received: by 2002:a05:6a20:d50b:b0:1ca:db51:85df with SMTP id adf61e73a8af0-1cf1d05cc9dmr1472679637.8.1725601920431;
        Thu, 05 Sep 2024 22:52:00 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1de8:3062:3230:1a45])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206ae949f07sm36708595ad.68.2024.09.05.22.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 22:52:00 -0700 (PDT)
Date: Thu, 5 Sep 2024 22:51:57 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Cc: linux-input@vger.kernel.org, Erick Archer <erick.archer@outlook.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: alps - use guard notation when acquiring mutex
Message-ID: <ZtqYfXzrJGif4zOE@google.com>
References: <ZsrBkWIpyEqzClUG@google.com>
 <20240825201347.pdphq33cmng4ltds@pali>
 <ZtC2lcKuZd-NbDdl@google.com>
 <20240905154414.5cnp5ozwflefp36l@pali>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240905154414.5cnp5ozwflefp36l@pali>

On Thu, Sep 05, 2024 at 05:44:14PM +0200, Pali Rohár wrote:
> On Thursday 29 August 2024 10:57:41 Dmitry Torokhov wrote:
> > Hi Pali,
> > 
> > On Sun, Aug 25, 2024 at 10:13:47PM +0200, Pali Rohár wrote:
> > > 
> > > Hello, I'm not familiar with new guards and their usage. But if this is
> > > a preferred way for handling mutexes then go ahead.
> > > 
> > > I just looked at the code and I do not see any obvious error neither in
> > > old nor in new version.
> > 
> > Is this a Reviewed-by or Acked-by? If neither that is fine too, just
> > want to make sure.
> > 
> > Thanks.
> > 
> > -- 
> > Dmitry
> 
> Hello, I have looked at it again, and you can add my:
> Acked-by: Pali Rohár <pali@kernel.org>

Thanks Pali.

-- 
Dmitry

