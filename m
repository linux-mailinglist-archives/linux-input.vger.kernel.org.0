Return-Path: <linux-input+bounces-10317-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AB6A43500
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 07:16:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F137F3B5851
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 06:16:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CAEF256C7D;
	Tue, 25 Feb 2025 06:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c4VLyqFc"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEECE25487F;
	Tue, 25 Feb 2025 06:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740464167; cv=none; b=FTB5d5WCGaKZdPc6GUAoATA2Dsi9RIMRJ4sU6pKOVLNkacyq+02p4s4SsDoOnUtoQqntGMwFvC5iL/WlKNZkEnbpId5gmOxpMccHUnMdG1Xt2vODvuPVe1lTqjnGQ9adzQIzs6n7wWacBOReVmFt/QjMP666Y+CtjHtPQBlEcJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740464167; c=relaxed/simple;
	bh=y04/eiKfX+VDFzL/EZx/SP/AByliZxx8ctE2if+rkdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cJylVVuDNYBg8pQmxwrdN7bV92O47Ukt2nYHUGcS63VJXtNsurtF7b5Broa56QvZH8wsbYicNwtUsBJhVGDS1XLee/vhJPySEi9EutBSDAacggDo3JzPBA42dmhaUd9SrBwgXxLQVZgGV0G4h4Rj76gM1zCdPqykjbDZxMhwP1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c4VLyqFc; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-221057b6ac4so99475235ad.2;
        Mon, 24 Feb 2025 22:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740464164; x=1741068964; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AGVgTKfQzcM6BCbf3nLCuH4nvK6a2ubqTOhh2w4FSvk=;
        b=c4VLyqFcb/qSWSvix1pW/6geUsj3fy15WBPyeyBHfkx6kCWhGsP9HsXzdXIa2EaoNV
         Jh8sXMDIlniSuGjKOkm8EKYZssCcrmcQD5tuWYrhFNoVaYqYee0xY0X4Pry8hzH9sfF1
         deOzH1B83N7SS2nEXt5/Un0E2qQKm86lHpBz2utSLrWymmXc1CVqaESeQm7YKI6jOUY6
         Or6ay37vXMZUWOe16aIffcfpymnU/vLKyGW6P/3hFc8XWznQ21CrpHaRkZIcgCxPw3xC
         2Yy1/8DJJRgP30gIXwGAwBtiLGA04Gtqln3e8Ib8Ksp8edEYDr8WqCs207/lc4hj76vt
         32Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740464164; x=1741068964;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AGVgTKfQzcM6BCbf3nLCuH4nvK6a2ubqTOhh2w4FSvk=;
        b=aHAvG268MdRWQTtJHbpF9Ge1ptw7CDR98muYbTqa1D31qLhEb3LuZPCdqvfPItOSGx
         UpSIPVMD3vrkl4XaEWxTvZs7XSd3mCT8YTdSxXi9ptNyVOeXvh4pVrkXnNapzndmi6J3
         HZARjUE9qSU2mr3U32fn/pO1DPF+OTHvDjwI3tFtakpxBj/L7ZM8JuEQZPPqC6YjzfAi
         adm3by5PyORt7HayQAio7vU/xK8/efb3YbVV2xKtC49jre8dVgLSIVJoahZX5i0GWevu
         3E9sED6Tcoe4lKK3ccOvKF++iQrWwCsPcs1jKmepbfNT/ZkDpFNhqbEcHBIbhSjHBn4Z
         0clg==
X-Forwarded-Encrypted: i=1; AJvYcCVMjuY1TZ1ZR8s74TYJefdQV8mG3WZ3dVgUiLcL6f3Jfu4vN/Z2ZMAOxjMDO03rH39tS+76glZ78hxH4q0=@vger.kernel.org, AJvYcCVfV6ao458l0zG9zJt5nZIX06cMGwVmBGfWSuDAB9lhFSWAFJughAhF2ptl+8mcmVDDlyOl+WolHJ9IKW89@vger.kernel.org, AJvYcCW9VlDQnEFwFiofJeyAC3ixzOHxuIOA6mqU86g+6rw/CKqyi0ASfoK0DOFXOaVyxTUVRk3xxTcL7tJH@vger.kernel.org
X-Gm-Message-State: AOJu0YyTQ/yADwxDyd4JI7VOwLKuHgoFDZqtKK7F4/JLqQfWzoXs6wPA
	dGtuTKtEOyGdQYXetGgoJ5cWOizQ4qg38KnM8G2/MiOoLR8bRvG0
X-Gm-Gg: ASbGnct76co8lfIvaJS+lhfu/iiMFWy5kTSZ1y0lwLVL9fMB1Lj+3hdrWtEB+oYlGLk
	/O2jWOG3DrH9i9ZAQs69S8ID3oXOX1YieEE9v2vTGHPO5F1PHFVjF2q9+II/qLAIAnq3csyRtEn
	MlKoFb7bB8SXBI+5sgYv3wPFfKvsUvdxkAsXGrU4NmQrGgYn+VEk6+iA69Vcv4JstJ90xismlBk
	8nOdr3q0ITD61f14FzGoxJaIqF53zGNoKZ18Vkq7QqgzehxAHhbd7ff5DE3NgxFDnRdbz9y827T
	QwkosIFp1ZQCUZZMHAPYtGjfeSo=
X-Google-Smtp-Source: AGHT+IGs+VKr+OOlZlfm7dkEfjYmOfYQgfwqv6Qp2AFuCJdvwfEPwuo5Oa3/2GGy2JMQF7Y0gUE6/w==
X-Received: by 2002:a17:903:1ce:b0:221:7b4a:4773 with SMTP id d9443c01a7336-221a11c2577mr235316805ad.51.1740464164054;
        Mon, 24 Feb 2025 22:16:04 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:464c:6229:2280:227e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2230a0a613bsm6264785ad.192.2025.02.24.22.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 22:16:03 -0800 (PST)
Date: Mon, 24 Feb 2025 22:16:00 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: fnkl.kernel@gmail.com
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Neal Gompa <neal@gompa.dev>
Subject: Re: [PATCH RESEND v6 4/4] MAINTAINERS: Add entries for Apple Z2
 touchscreen driver
Message-ID: <Z71gIEbbnA3gCQ0O@google.com>
References: <20250217-z2-v6-0-c2115d6e5a8f@gmail.com>
 <20250217-z2-v6-4-c2115d6e5a8f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-z2-v6-4-c2115d6e5a8f@gmail.com>

On Mon, Feb 17, 2025 at 12:38:04PM +0100, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> Add the MAINTAINERS entries for the driver
> 
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Acked-by: Sven Peter <sven@svenpeter.dev>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>

Applied, thank you.

-- 
Dmitry

