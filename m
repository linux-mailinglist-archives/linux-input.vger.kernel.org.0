Return-Path: <linux-input+bounces-14456-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CB8B422BB
	for <lists+linux-input@lfdr.de>; Wed,  3 Sep 2025 15:59:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A76F617E2CD
	for <lists+linux-input@lfdr.de>; Wed,  3 Sep 2025 13:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81ED62FE587;
	Wed,  3 Sep 2025 13:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e4TIvj5E"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15572D9EDF;
	Wed,  3 Sep 2025 13:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756907916; cv=none; b=A8MKZj18RMPsII5ANSSDtz4ObVl3nSXtyuIQ4lr/P77l5sVkUmplNdzpxQ1MLp25BO/Q/0BVvUZXgCLjDSxzm2Ybrd2wJlvMMCHRf6X9xsj045vtLYumekZLRLGIAocI20YekvDiH5tyk5kgdzOGTe59JbrYMgxaP0+BV7Kk2hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756907916; c=relaxed/simple;
	bh=IirmmlGam5se7iXc/mYiqtSiPLOv0qa9RK4q0YNBGlE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T5LAjIyTw0SkZniNEanzfnCK0tTYPBnD+uJoy35AkzU+BJcz0sBuN9ep+fYid32UgSwlUzrSXgP52y0iYHLuckHC6+EP/qVlWsNsHu4kRU1Uxp8EbdtsZJcYFekup2SDKcf/PFOCFxzLXF2UmaMoNriNSzzEDP6vxI4cv2VJRrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e4TIvj5E; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b49c1c130c9so4483211a12.0;
        Wed, 03 Sep 2025 06:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756907914; x=1757512714; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lXT0zXsgfMx57Cdo6jSoHQ+Yt/gY84DdNKZyQH26IQg=;
        b=e4TIvj5EuNyNcdhi6pPUWdeDyvXN5ZD8MJHhSnkxRfxWBapbFvBSDwwQPo5Oa3ykvs
         QYVT0dRfBgBA3M+tjl4T9ormgKnAk0DUXFe7R4TUc3e9EET8SBd64IolSM4nblVltzvX
         7zJGM/t4XkI56r4tW5cAerxLOIhpsBt0XS+4ZlWUWU9on8d7hAvLFdJvh8o66OJSa3Sm
         CksRTQSlyo73QzDfsTUNyz+tC33jTG2TWTqDh/19kQ6tT0pzbxVVD1yjk8IPCqXkrVWN
         Npu+gWkNtGD69jgcXJIzaNJo74bhrTr7YMXHehQTLBZkYBYNg7P491jYIIzV6NsetH/M
         n5Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756907914; x=1757512714;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lXT0zXsgfMx57Cdo6jSoHQ+Yt/gY84DdNKZyQH26IQg=;
        b=llFG7/GQyEro9QnoF6RF8mjQnRCDFkBjfMEzOy+WUKcrwrIE+NdQ2uDxI7U/8pQB5t
         i3uMw2XzaUkNKjFeTL4bfWfQnIfKUFB/F/ws4ZlJc9b4lAbsADGMc9XBD0m9dlPew98/
         xWCzgkXYkn8ZA4SVRTAhZCi4/Sjl4LaeA/yxk5xahdsuuw8SKbdYwtF2IjzjLG54eKfM
         WJvS6QQ53pK7/lMqJmClAG+I6Jbvqqe6Vw/I39xoElBIhDV2XvjAVPDOBVt77TOi4WVA
         VZ6+9K+bjb5gaAusDz5lXY48qr8f3tFe3mw9e/Fn8V8FpocX8b2QGT8InX6hNYht5KoS
         404Q==
X-Forwarded-Encrypted: i=1; AJvYcCUkaJa0WnPr2ml41uCB5BGLnwf8y+PDWBP5O3D52KVjHSOlP/ifeeo66iY4qjbL/PlPkt8o0iimLrqT@vger.kernel.org, AJvYcCXU/an3kto+1DjsInAboO+/hQH7qIoIwNcMIEKNCZj7tT+fFeIiT9yKrmmGc/wUabtnIMt82WqR2vEKlGk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQJEVWNvDv5Ss7TxZx6AKLMeU0i1Bygq8G0gpJ7MJjcIY6xB+b
	c2UlWjmXBJckf9id/VjEJMSrlA9AUMPWXF1l4z9tGvpt9Bd8DuW0+D5U
X-Gm-Gg: ASbGncsf8Z1wVCXcN7WOJ9tdAcuWKOe923h/+k6qhtzVzS8Er0dNNlivj9sz48DxK5W
	Lfv3rCcyDri37OWjyzs1gJS3/+TphDiBIN1TtnuumEeQvaVDfuhx9c8YQXSOwobjXhpQTwUwcLZ
	EbY0Ft0TiyLsK/bXPdtlpJe1pM9x91Q1N++Z2Did7GmjcUv2SLkvt/ilIyMgaSUq9OIlxCE15U0
	ZSBpwtAXrJx2ya8BxZhRHipf60N9P5gesNfkxvQFrFRdnKSh3JYP0dLbE96Skp8f8Sm4K8Q5UhE
	c2QMuS0FGHuxK3IgfNDuTWNQd/ZbzC8lWcV9hjcPwYAMDPAd1NIcSSo27Oh1SsfaS0lfdvdLkmj
	jIGEmQYIgujbj/QrdV+ynVJM5yg913SWffw==
X-Google-Smtp-Source: AGHT+IFByx0S9UioQ8gncPIVwKiyz3GHx/abqmcrtcNwY0/ie4OlrIycNKCUo1uT/Pn0HRCthAHqHA==
X-Received: by 2002:a17:90b:1848:b0:321:c81b:29cd with SMTP id 98e67ed59e1d1-32815412269mr17826703a91.1.1756907913902;
        Wed, 03 Sep 2025 06:58:33 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:dde1:b1e1:74ba:18b3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-329d089395esm6675303a91.1.2025.09.03.06.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 06:58:33 -0700 (PDT)
Date: Wed, 3 Sep 2025 06:58:30 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	Frank.Li@nxp.com, linux-input@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: input: touchscreen: tsc2007: Document
 'wakeup-source'
Message-ID: <gjjtam5kuujgxrwo33azwrw37lfvmnftpp4nnx2uqgnfbxzdoo@2vci7h3oxfob>
References: <20250822213245.125901-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822213245.125901-1-festevam@gmail.com>

On Fri, Aug 22, 2025 at 06:32:45PM -0300, Fabio Estevam wrote:
> The 'wakeup-source' property is used by many devicetree files and is
> also supported by the tsc2007_core driver.
> 
> Document it to avoid the following dt-schema warning:
> 
> 'wakeup-source' does not match any of the regexes: '^pinctrl-[0-9]+$'
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Applied, thank you.

-- 
Dmitry

