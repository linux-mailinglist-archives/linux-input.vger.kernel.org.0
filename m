Return-Path: <linux-input+bounces-6736-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C00986DFC
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 09:47:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6D6D1C21444
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 07:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AE5F188A25;
	Thu, 26 Sep 2024 07:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kaq3xLT0"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7788D14F10E;
	Thu, 26 Sep 2024 07:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727336845; cv=none; b=J5HWxIXMQ6Z2Vj3zNhsUxaah9L5qozsARmfU5lAt/UHl1sCAm61HX+X/9EKGFuHhsDSMG+3bIGHWs1yX/sNP/8VBCkwQnPStgjRkMvwNHGaKT0ex89dWowyKqsnCWZGOm1/D7SMKTAjNglc8WLW0Lu5/PZo0vf8i5g9BR6SW9fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727336845; c=relaxed/simple;
	bh=sbp35loG1dkiN3K6+DS+J207tNv9+/xCv8SXqYl3Gjs=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BgMHCKvJsOgfO0+L/qCs7lDuW9+i/pxpX3zJ5308OONrRmp2fWN8AoW91SMu1nTAlpZAp+aU9O4o9JwgytD4WAC2wZVzF2w1yDmyxPVwdhrcwzyBQBD8KZYKrVGktPnzw+gYp8sXEgYUCHtxgShWKYNAxqHISqy8LJybibNm2bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kaq3xLT0; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a8a7b1c2f2bso102621466b.0;
        Thu, 26 Sep 2024 00:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727336841; x=1727941641; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VXgcQt/t3gCBiL6CrVkztXkAMt0TnTUvjHyyD1p//ys=;
        b=kaq3xLT0qYKCIME2Gl8lgp/SceSTZZFSP6gzEqM8VrX0/SoBDsMI1BF+Mh3XG4LGw7
         Il2ziRzpzg8eqSv7WZEI50J6vfBU1Zzn97jf6pKuj+mbPx8h1DnvLg0PAcF8RNeS4gOv
         h8bxqNatGoZEDb7i78RaMmBKjwq1G2h7lrCxTWaeY0SrBBPCHw3FCoalWQ0lrBx8mEhl
         vauJGKw7+aifeVnsoyrb7ASbVyP3vrd0vGyB0+X/o1vYpvrbmuUDcOzm+WZfQGbGWfVI
         swqMaOiKlqKCEUncIFshM/wZUfJGr+gN7PuUsC5oURINxWcYg3rgR9+k2I8njqzYSKh3
         r8hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727336841; x=1727941641;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VXgcQt/t3gCBiL6CrVkztXkAMt0TnTUvjHyyD1p//ys=;
        b=xEnKsJ8RFl+zYuMWu4ujXwMFaNK3LrddKzGGevju6+wLzNdfNkfx+/gH8VipKKvgod
         vPr5tdRYJcsGNmoagIIfeAgAP8xhB8vS5YRHS3+l2YfkAWF/ZK7FCMZUO+5VOb0pSrUG
         hkZp01Ev4wA30aXGNfu6dCJAdw/CNaVCn054SXjTDrfOQ8vXCE4p6CSIqs0P+pTh64LY
         2t7y6phwlPLsr5Fch/ms6xEOUz9UTGToSS7IDh7EFlpLEetyFjYZtsHd9rfp99AZRlaH
         frbm7om7tl3a6aOyp3DNRNA6EADbPqoPtT1yeVz10CajBALaVSMaEYlmERFkjMZW+Qor
         sdfw==
X-Forwarded-Encrypted: i=1; AJvYcCW/eGt6j6JtvmFZfqAkQkuzO9DmLCtcV3mjPxnsI/HEmYmXKa65M7QY6qKge+hQ3ZNK4yoRfbdW83108g==@vger.kernel.org, AJvYcCXWO1VW0CTNbXM+tzPNIDsPzURARpQKk0mzbN0YiahGY2YiDOr8X4pDQQf+hggZYmFo+U/cBu6Tj2AMUazj@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3HVs3V0AMP6/jY5Sq5sLIfcRMWhhEZbbKUTtcVs0BzC5AmpVj
	36/Q552jnu3urEZx4HA1wEp1pGlBGW7cChXSp/n9zPgveV+TtlQj
X-Google-Smtp-Source: AGHT+IEJXaXg4njtPdRpa2+FF2h/xySF67hNU5lrTkwJ03kFktgRk6Pd9eooA6tbBFdzJPIFxUaJFw==
X-Received: by 2002:a17:907:31c9:b0:a83:94bd:d913 with SMTP id a640c23a62f3a-a93a03202f3mr572242566b.10.1727336841193;
        Thu, 26 Sep 2024 00:47:21 -0700 (PDT)
Received: from localhost ([217.151.144.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93930c8a98sm317428966b.124.2024.09.26.00.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 00:47:20 -0700 (PDT)
From: Oliver Graute <oliver.graute@gmail.com>
X-Google-Original-From: Oliver Graute <oliver.graute@kococonnector.com>
Date: Thu, 26 Sep 2024 09:46:18 +0200
To: Yu Jiaoliang <yujiaoliang@vivo.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Joel Selvaraj <joelselvaraj.oss@gmail.com>,
	ye xingchen <ye.xingchen@zte.com.cn>,
	Felix Kaechele <felix@kaechele.ca>,
	Andreas Kemnade <andreas@kemnade.info>,
	John Keeping <jkeeping@inmusicbrands.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	patches@opensource.cirrus.com, opensource.kernel@vivo.com
Subject: Re: [PATCH v1] input: Fix typos in comments across various files
Message-ID: <ZvURSswZLdAakNU6@graute-think>
References: <20240926031457.3479350-1-yujiaoliang@vivo.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926031457.3479350-1-yujiaoliang@vivo.com>

On 26/09/24, Yu Jiaoliang wrote:
> This commit fixes several typographical errors in comments within
> the driver/input directory. No functional changes are made.
> 
> Detected using codespell.
> 
> Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>

Reviewed-by: Oliver Graute <oliver.graute@kococonnector.com>

