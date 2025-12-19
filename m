Return-Path: <linux-input+bounces-16632-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6EACCE89D
	for <lists+linux-input@lfdr.de>; Fri, 19 Dec 2025 06:35:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9FCF3300C15C
	for <lists+linux-input@lfdr.de>; Fri, 19 Dec 2025 05:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D220C29A9FE;
	Fri, 19 Dec 2025 05:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bs9p6BI7"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A672367D3
	for <linux-input@vger.kernel.org>; Fri, 19 Dec 2025 05:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766122524; cv=none; b=pLXZ3L6S59LHmI40ATbn4NQ+darwvlk1EoqCkPMmbB508yaFCsOSiHlEEFJy9X3Zq+qv3NzHO2hx6MsuGGNzoYNH9j7YgRePgO/JwZPi+z3hNTNEjsTTufK1tfQeFyVGWpA3KgtrZ3uTb+iVR70e4SNrdD3cKlyewhnpkBOumgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766122524; c=relaxed/simple;
	bh=ZhvazSte91iU+jx4QdnhFUqokDPmeF886UFAsqdeOG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OX0rtBhVlp56/ZgNgMX6JhK7fzCdEGFpi8Vj6InA1nwHzvFxRRk8QKDr/HR28Hs56FLee/dEibmxcDTFG8/LPQ8UzoCAHQz3O7jL3t8zynP9rOAVYXiheQ9FMj6TsWZ3NZKqNANDibkGbyf4w7h9gwnD+Fc50h7/zTbWfmBV74g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bs9p6BI7; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a0a95200e8so13147715ad.0
        for <linux-input@vger.kernel.org>; Thu, 18 Dec 2025 21:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766122523; x=1766727323; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rMTTCuooxMDzb9iO4B2W3oktqAuVxYafRzDCiEnReDQ=;
        b=bs9p6BI7bmrcIORWo/ouvVkwMR2MJQw79BRm4iUgC8T1NeTqSeo+SIADqNiNXFRdBy
         xpFumRz9sK7PWNGUEHAGHUx7DUyiU79cCqzGvukkli+WKMq08QlsDDf4E/uoWwMsoibF
         y/OxEkomcR0WUXCfg7uCZ0RiR2knOXmgWWBzqtRaU2AOYYSCHWQT85fZFxbFuu5ICWmo
         GTHlHqXNFPE7lseUwS7pbfyIcSDCu2NQduswrqexxUVDYQ6JrJCxzQc13bW8WIsTbgig
         fSiCHh5BHSWQwvBsZoHuaPDFJxCfEOJxCVSyTZUpR4LN+QGxXyrL7fPpfDqBj64gCmSn
         e9ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766122523; x=1766727323;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rMTTCuooxMDzb9iO4B2W3oktqAuVxYafRzDCiEnReDQ=;
        b=abPTFfFtprYLFoCF6k66Cdf0A5snPC+pXJlK615Rywpcu9+8nfih0HN+DlTOesvlcu
         5dM74ITi+D611zoqfm1VTKkVB0Kk687V5qls+32B9xU35jXcfFs/30Hezf1/RQNu6igt
         IVa1Y6IL2y+c7KWgsYZAV8C+Gd7ZKCDBDSH8t2OPWs44oouxB/Wvmcs5di7ewne67ho1
         36CqLMSgWySlmeQ2hcRyZcwp19x0feaqVpbN1RSklgu298/+HRFRbM3a1OFZMW0lPLVR
         kVr5pJYJZQlIZ+XC+PxBF5MxV6w0l6HPp8GvNZm3BtKOHqAe25r6bT8y0Ywd6d6eEW7Q
         fq9A==
X-Forwarded-Encrypted: i=1; AJvYcCXdJPY1ag1wpsn/iF8qEkv6mtPMvW0pUJQRq/JKsdU/5aiE7o5dl8lqbusosolCVSOilb1+YGASm2gZgw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgcrmDAzPy05It4nUGpcldTLVs/OCAhxjUV3GS/wmOzcaT0Ji+
	R2dhsw9HTcL5KtXRnh97F3DzZq7MOvOtutyGkFXgHCeu8m/Og45u/5be
X-Gm-Gg: AY/fxX4NQLPDb0G4ymoyfu9xagnMaaJZ5XhyGvwrapNRsB500GMd6L+EXhVdB1KIl5M
	o6040bZI4Le7UInELrZYyY+AgbdUwJawD+dligdicXIRnvJ/f4uo3Uvvq/pc90dFSmCSzj728U8
	JOEXSd9/oolhhZjqLDDnintxxE+crlEccq75gYlxe2jaVbwdoV1SrGMTIxV3KJV52NPYoKE8B0c
	HtpYJrFUrYXTNCPuJSHkhk3379hP2hBfviz6t53gRpIK4p22ToT5RMoTwdyhkZV8TpEKYna8Wd4
	X6/4zFWGWWrk4SEex+XJelIpDPIDiTMllGHyE1DMFcBfWDcOxXP74GmRvSDopV4EBWvsN5IZaWm
	ASW37O3fl3oO74upycIML3Ls7CqGscsgT+Kc3nNuUf/0fRaX4OFHCkF+sWUNu9sPGzsl2rGtsUP
	Mb3A708lJXHx5FhkVwGvVVWRMRxsefXeKT6XmOfRbf2nq6Rwqv7ssY6lR4EXBNfiU=
X-Google-Smtp-Source: AGHT+IEckbGoyBwvIpN7+hsyYKZeqS+PjBBpgEAIEIby7FqmlE1JAmvvNFeTVYuKm8/epNSNg9/pVA==
X-Received: by 2002:a05:7023:d03:b0:11b:9e5e:1a40 with SMTP id a92af1059eb24-121722ab330mr2043333c88.15.1766122522555;
        Thu, 18 Dec 2025 21:35:22 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:c932:b7cf:9dde:f662])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217243bbe3sm4998600c88.0.2025.12.18.21.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 21:35:22 -0800 (PST)
Date: Thu, 18 Dec 2025 21:35:19 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: david@ixit.cz
Cc: Jonathan Corbet <corbet@lwn.net>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Casey Connolly <casey.connolly@linaro.org>, Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>, 
	linux-input@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, phone-devel@vger.kernel.org, 
	Gergo Koteles <soyer@irl.hu>
Subject: Re: [PATCH v8 1/2] Input: add ABS_SND_PROFILE
Message-ID: <ipazh76ewhshd3rtgjr4oz45zaqqmsqfdstu6nbxo3ctrd2x7k@wpd3tyywk5ay>
References: <20251113-op6-tri-state-v8-0-54073f3874bc@ixit.cz>
 <20251113-op6-tri-state-v8-1-54073f3874bc@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251113-op6-tri-state-v8-1-54073f3874bc@ixit.cz>

On Thu, Nov 13, 2025 at 05:02:58PM +0100, David Heidelberg via B4 Relay wrote:
> From: Gergo Koteles <soyer@irl.hu>
> 
> ABS_SND_PROFILE used to describe the state of a multi-value sound profile
> switch. This will be used for the alert-slider on OnePlus phones or other
> phones.
> 
> Profile values added as SND_PROFLE_(SILENT|VIBRATE|RING) identifiers
> to input-event-codes.h so they can be used from DTS.
> 
> Signed-off-by: Gergo Koteles <soyer@irl.hu>
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> Tested-by: Guido Günther <agx@sigxcpu.org> # oneplus,fajita & oneplus,enchilada
> Reviewed-by: Guido Günther <agx@sigxcpu.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Applied, thank you.

-- 
Dmitry

