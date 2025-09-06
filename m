Return-Path: <linux-input+bounces-14530-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2C9B4740D
	for <lists+linux-input@lfdr.de>; Sat,  6 Sep 2025 18:20:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83078189FAE7
	for <lists+linux-input@lfdr.de>; Sat,  6 Sep 2025 16:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24D3824A04A;
	Sat,  6 Sep 2025 16:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJ5ZnUi0"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D311C5F23;
	Sat,  6 Sep 2025 16:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757175644; cv=none; b=lDQpxxObAsWn8JPTBal0H4bJBcIqv4tJXwLs1fz59mAT0m1H71/TLTepn4Cpt+SZQIY6ukejOYVcuwEBPXufS+z3bU2IARe88d5ceHlBqDwmNmJ1akTQjiVAWxS2Ygm7bpmtfJ08O6+REWO5xzaL9TXXtfvewepAbpeuOW8sGuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757175644; c=relaxed/simple;
	bh=yOlxvm/IuI9z8EQnlpAUn+w0NDmCbIwSllZQqGiUoM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Du8haHizjyFt30XKOsFZoK0PlmXU70aiG6dV30TcvSXZY5Eig2oRFmeBoOpQ2UeEyPjSvuwH4RKBgCj8jtRjUeDsZMdcA0f40aqVBq7agGAO8j+o0YEFyXdRAlSo6ZHpHCFxE1yZE7LA0qu7rUgsBrmRRO9VleBblpOD8IVptbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QJ5ZnUi0; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-77256e75eacso2773552b3a.0;
        Sat, 06 Sep 2025 09:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757175642; x=1757780442; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tJzdwL9rYlAVpWrUFdwHJMtmFfmLdcK7IkTFMPKfKjE=;
        b=QJ5ZnUi08EUeJBDFDvY5iUwhFsI4sk+Wv00A7MmNdWviwAbjBMxx+IQz/wzOZO74M6
         i7kECDSWA5vguOYOxITklDttH0ndc8ntMQjfryBKyXO9r5+nOMKMgf0awAysjWJKOJ1I
         HmiofFnSIgZEYNngjvDECzs31p48lkKjnuqu9c9BUZJqe5HCSH2Vgehd4z4spQ6Ysrb5
         Is4JFYWjb5vdJgcfGvwKslOPsTSlBZv5gAEYHvyPWAwupgRnSxXvKc6ztcjDyJTjILyh
         HH1S/BTvjzhAjHHBwFBSTDpEXZf41Y9UN27Fithhfia7/oH9lklGd1iNHzOjPIbDG/yA
         EZ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757175642; x=1757780442;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJzdwL9rYlAVpWrUFdwHJMtmFfmLdcK7IkTFMPKfKjE=;
        b=ZaWbFc8iPI9i9g/5huRGgAojRZAq6vSoWBobtLTChYkthwxoYDqiWgxGXlFKwFL7YP
         tHWg5JAItdIy/Ij7AO9pkMwV+OLaVQyyOsWoPp4yFlnqgp/lFNnfzKn526F4ENCa417F
         2T1fFfsjPEbMpdIMj2Nq6FKxbWshOYIy463a5zgEwKg8iciQmitYaQ/DkUVsT0KHDBxT
         TTTIOFbSoIG7CCNOOBQDP15YGy5Xt0sh+DG6zrxVnBADQY2MNFaww6WaRnpm/oA/89fJ
         Yr551LK6hhIOt2Bnv2If6U+obE1xM2gJoxN2ASpkmKi7b3283CawK1G5CloWHpqM1ySM
         6EYw==
X-Forwarded-Encrypted: i=1; AJvYcCVe5lb3UTv5IJermH5NOuaPzIKh/xVAVHX9seZ5d26Ej25QuaNjol4SfqIZvJcElxB3dr7ptL29J5O+11ohueC0BU4=@vger.kernel.org, AJvYcCVroLZcdmBA3NMdfjldL2UaK6X40GWHULp906ctnHJgtEHydnfoWIb9Io6tKZlf7o0u6RWfMWFlsKWK@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf+PJ3Blyv/Dzwo/qkDFruc1GSeDghoIIBBKpMDOH5w83s04/U
	yEvoT+tKDKzgVGAOd1BvUoOfSNxAAPxsqiE4CHYZnQnX/SuQCul8KVek
X-Gm-Gg: ASbGncsrnI97yrOiVhyc67jkvYY/lwTgb+mOgTuNN3/aFwo9D8w1B2+QAYc7uDJwC1p
	G40kS/ezTlNDk7VXcbtEKRWmUlbcP1+h4DaT2wegGzFGe1ye1GS4RZ8Yvic5MeE1U4dImr2BPkt
	55i8vTnGtM/JVUMo/owx7GE7sdxSjctkgPjtoEuVjY2mlK2WHjj2iFFiJsf2PciECHw21Ato89Q
	DICC8lb+OGpi4OLeS80HBaZZQMMNSewjKwxWeq8leRXSt4dIX92FxBJpjFySjMLYQxikXHr873z
	sNa/tKSzK8FI4HbBvb3uZURSrcwvo36/hsFeylPIW0drTckfNLZRVZ/4zzXqB6jkEGCEAQLhLbB
	Vt3Gev4JHH+BZWRshSxxiTpE=
X-Google-Smtp-Source: AGHT+IFeGaimkzYK+g4w4Ju1TcH/8/AgNIOEcwfVfoUpa9ToQ9TVy5p/179JctTAVymQPOVwzi5NfQ==
X-Received: by 2002:a05:6a20:9146:b0:24c:dd96:5500 with SMTP id adf61e73a8af0-2533d5fec82mr3898398637.11.1757175641777;
        Sat, 06 Sep 2025 09:20:41 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:e08d:5959:e7ec:1beb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b520d33cbd8sm4235217a12.41.2025.09.06.09.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 09:20:41 -0700 (PDT)
Date: Sat, 6 Sep 2025 09:20:39 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-input@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: input: touchscreen: goodix: Drop
 'interrupts' requirement
Message-ID: <pgwfqddpiou2rvawh75cgehteijlr25cxnhmxub32qkar3twje@yiiniixzxtmu>
References: <20250904195727.168152-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904195727.168152-1-marek.vasut+renesas@mailbox.org>

On Thu, Sep 04, 2025 at 09:57:04PM +0200, Marek Vasut wrote:
> Since commit 409fe0cea366 ("Input: goodix - add support for polling mode")
> the interrupts property is optional, since at least the Linux kernel driver
> supports also polling mode.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Applied, thank you.

-- 
Dmitry

