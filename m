Return-Path: <linux-input+bounces-15666-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 682F3BFE29B
	for <lists+linux-input@lfdr.de>; Wed, 22 Oct 2025 22:26:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 56E564EFCF8
	for <lists+linux-input@lfdr.de>; Wed, 22 Oct 2025 20:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A92D2FA0EE;
	Wed, 22 Oct 2025 20:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a6GhyydI"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AAD2FB635
	for <linux-input@vger.kernel.org>; Wed, 22 Oct 2025 20:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761164783; cv=none; b=AQmXVrVn6+R5HScCwls+MvNP+S4MHHpYe7fsv2hhjH4SZ2TQD1diuYLoixd1i2KJQMCUEWlsjklaXFW84aN0M9DQn6lvoKhB9k0vw4q/kuaYgYMs6R9ajV44YFPHdKQbFTAwyvI3LSmd25MkEpjHWyCXs5CzLtyt4exH8R2/6XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761164783; c=relaxed/simple;
	bh=DN8wIHw8L2THEi4S5dHy5jflBlp+QDhGYC86piH+GyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qh8bb6ib4YIoD1K3ckaDvspjX4kcEPRRdC9joGfntbErEVsfZjH1UUFoF1ugUURHWVEFL0oVCoQ5g8EI7gFAWG+9V+TIHQ6EqR3ZjYNHbM2CRqWQd58NkctDgWL9GWYWlnubQRl4dGs5L6wKXtDYl11+v/PXEU6Bh16ABu6RoQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a6GhyydI; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7a27053843bso80168b3a.1
        for <linux-input@vger.kernel.org>; Wed, 22 Oct 2025 13:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761164781; x=1761769581; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8hAf3HpEiT48jV3m4EHRH16LKqqSsX+cW74wRjoqq3Y=;
        b=a6GhyydI27nchsOK3XzmQMxvgdrwjht6IYms4fXsm5Rou6wqUAUou3UxDDgWVcaMTe
         c8YHY+MXac52rT/giDlKOghlIXA2zHL6i7ydzQbQEjUxxk1jfp8W33CraOyQFwT73FPT
         y60oFTrbwMiHz/QtNW53RFxCNoJMhmhGvA8AZmKgqLIkgqxi5iW69oPqrTe94O0dIYmX
         RfGGg1fktM9XdWzVZiFnizEAbLvCyh7oHWRwotMdf5OvK2WydGKvIGc/OKI4oslXlSox
         Dui1yspkwGXPLNN1xpzz7Lg/e1oNO5NMmM5CkSkF/gSQpnzDnYvW7bmm1mv7ek+rHKFs
         S2LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761164781; x=1761769581;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8hAf3HpEiT48jV3m4EHRH16LKqqSsX+cW74wRjoqq3Y=;
        b=hKm1ZsdGLb1DGTzcG/oZkttbr5lKHOOPG7AHP/U5KEoqI6SRrFZX+O80cwLdURCSGw
         2CwmB9omfddKoR6+WZm9YBWsIYIVNCuKLYuAjX9sKDD7hwY2TV3lUPFUnGUKOHSWZzf4
         BsOXMxnRqLgBFnWqo7mi42/cZq7qyyG2gRp/qYmlLpjLelK4DOZ0YDP7l04lPT11Oc2t
         kLZX6gRtUFcF6eV83W6juzMEyKMpW8CPsa83f9R2HX/qVH3hNDaOQ3S/MN6GLFgTNE8o
         Wwvv+RUGgX9OfpdyoubEnHJB8OnNFY3VdbX/bgEF7F4G6VZwTnXMEJeUSCG5ieG7pMtL
         LW/g==
X-Forwarded-Encrypted: i=1; AJvYcCXYLcnJHH6zOb7n+J7DhW4S9GTTqiJnzia7BqbNAja7EMzRK2F5AMbaLJ8QGYu6mgsfztgXs98qY3Ri/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIGbAE2dC4fHYRzsEiW59kzLB6I7kb4DlX//IKsCG/AFG9SZcb
	ZZ2KcbrUpDLANEjNE4KS/LHwU/ljUi+3K+yU2fKtbOJgqK/dBmY26Y12
X-Gm-Gg: ASbGncsNxExoQlH44Sbz7juz7n4+v4voVl26sOT8+AC6HBrv6z9Rg1SB2SE6PEQetFj
	qt+25t+MYNV28g0ZG8ct2DeYatHUJFPLMczrwm9PMKidrDjdhf25ZRU7wepW5Fww1fvxwAQcYAY
	Bgk7Pj9sNPN0ImmvSYSEOZn+vszmXBalCMLNVm3Zp64wiB9aaI4ZBRoMaiXHbnGmd6/smn57/ZF
	agsN5BO1a46gMZcbxerhz4AJ13auu9VxxoAF0Q+BSBp/xDDGh/MLJSvHSyjteF0xSE7astUnaPh
	tzJ1EYMxcJqS/GPUNw/14Az7CvkzRvFZIY/PWthAifG2x8XXl/ABAYzRSMdmMECJniYdO4lUTRr
	0z97DNPrDrIOCDZ0SwdJV8KUj+KGt6qUyK4jc79JVwSaKs4Wx+RyQEcyP1AR2VupCfx3m47IWmF
	byMBlJd+JE5bYXW9gHWyjGu19u57s+1CYJCmDL6vc=
X-Google-Smtp-Source: AGHT+IEUWrw1/NIF6k2oNyNi5aIySqQPjcH563349gLGnf1V8S0/R+EqsrCwP+l1wUXaJawvs0BBZQ==
X-Received: by 2002:a05:6a20:72a0:b0:300:5f0:a4bc with SMTP id adf61e73a8af0-334a85bb055mr31514224637.45.1761164780878;
        Wed, 22 Oct 2025 13:26:20 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:53a9:459c:bdc:6273])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274bb37dbsm101523b3a.57.2025.10.22.13.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 13:26:20 -0700 (PDT)
Date: Wed, 22 Oct 2025 13:26:18 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Job Noorman <job@noorman.info>, 
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v4 2/2] dt-bindings: touchscreen: consolidate simple
 touch controller to trivial-touch.yaml
Message-ID: <vv3bpf4t2fgj2iz3hbevw3u33phqitfd2x7mk3ow6iqrjownbs@gab34yb6o2ee>
References: <20251021201924.2881098-1-Frank.Li@nxp.com>
 <20251021201924.2881098-2-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021201924.2881098-2-Frank.Li@nxp.com>

On Tue, Oct 21, 2025 at 04:19:18PM -0400, Frank Li wrote:
> Move azoteq,iqs5xx.yaml, himax,hx83112b.yaml, hynitron,cstxxx.yaml,
> ilitek_ts_i2c.yaml, semtech,sx8654.yaml, ar1021.txt to trivial-touch.yaml
> to consolidate simple touch yaml binding to one file.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thank you.

-- 
Dmitry

