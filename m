Return-Path: <linux-input+bounces-6923-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D4598B79C
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 10:53:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F10191F20F00
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 08:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CED818D65A;
	Tue,  1 Oct 2024 08:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DPBChLY/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192BE1E4AF
	for <linux-input@vger.kernel.org>; Tue,  1 Oct 2024 08:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727772830; cv=none; b=AszclMgoAt3Mg5LQcPceku2z1ru+wO53C3YHDP0rpCBY4fwT0l4IbRXN8o+q8Y5+AsukxnRz6PnqiipcGUv7iZtTH0CSsITwa1LEGLLtudGZ4RteR0ItleEalZ0+IqDDZ0h6BlcYOjplr/qDcRsG3+XBgDPoVEuihEJIGHE/t/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727772830; c=relaxed/simple;
	bh=9iAOQTRkrVKJvfXYMjLIkKJfQ5oSZ9VK7kNc5fvDXZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oHc0rkmtT84W4MV4GS4fBYZF2pxjDllJFKqYEP5ee3R1bwITFv1UFdsAeiEsybJ4RADoev5c+tSr1tU1sYMRNOUTbIcjFemAEyj7c/bX1bB6lfEUvadE/VqAOgTSWRrKL5d4BukjSRYrp6CM7EsquiAROZsLtiIJ3koCelUvRD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DPBChLY/; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20ba8d92af9so7849425ad.3
        for <linux-input@vger.kernel.org>; Tue, 01 Oct 2024 01:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727772828; x=1728377628; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cQ7DhItorO5fK1o4quJdHiXgqt8pj3ZCyYFg+jg0ka0=;
        b=DPBChLY/r3FRSmsNhDORLoJW7U3JSeL48D6YSRxv1l07Z651zo2jZCQxq0zeiP6iO5
         /1iyTyOCWZLG9s46mcnm2NtGymq2svKwrB/jTY5YANL7KhFHfxqJ87qhU6cRe9Ac0FQ4
         wui5hdSkf0KrfnzV8breERXeAslg/7r4pvbNGvUAkwy159F8I+iP3OD6d3mtFoxkaiMj
         8rGlawZyzzNZz4PPPUf3CyOoEwClWLJHv5ZrnG10N2hYLkMntpzCzy+I+K5969u80aFl
         U/Ku3OZVEw5d1mERjidW63eJhHGh8+3E8u+cOzTQQxoJqpS9jqAUZETdj530QWNBCJ8V
         NrcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727772828; x=1728377628;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cQ7DhItorO5fK1o4quJdHiXgqt8pj3ZCyYFg+jg0ka0=;
        b=V9zLgJaWTxre0GWAFgj/vys8BoBQwUyluPAs/1XPOTJLrL7giwGIoAMwJc+b9m892r
         vn1p1isRRgZtT5W+PrR2MrRqoQsGrLnRUqhi9zDMdoanA8Rhi4eZTHi5pn0TwWdGCw8V
         dAR683Lib3AupIToop0SJTLWoKFxgYXLinYZPnUIKVIQ7cuVHyFIggxCHmovczstsK6k
         9idCf2Dw0aRhMnm0LvACQ42spoR/JchNmFGKqb/0rkgiT65jxac23VmzMVQk+2iZGJbt
         D1BECHXEy8GLUDb0bMjrofT9CKDJYqHuPLEAMCVL3tCAQdMfcZ18GJsvhuOV6jM83+ID
         m7sg==
X-Forwarded-Encrypted: i=1; AJvYcCW7OOx0J0M9hWAbMLikOsFrhJzTKavtW39N/XodvWLw12LznQlDqYpuzvhbNyj7f4uMUCJXTR6XquzeRA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsxa1q8RDIreftKISmrW9+YaX7IrlwPm1ZrV9Fcm3YeJt9u9xL
	e8v1Tiwy1eeHYCARYGvVjQD55zp5biDc/0E4/jBV54EGTFLUwEQsvAmuetYXU+M=
X-Google-Smtp-Source: AGHT+IEm0IXWyjuzBB3LkWap7hEbhX/RGFcIpgGpV7IMbxBbCHQjG7VCjPkPq207idIuJP/hQJDpmA==
X-Received: by 2002:a05:6a21:1796:b0:1cf:3c60:b8dc with SMTP id adf61e73a8af0-1d4fa7ae2f4mr22105952637.34.1727772828267;
        Tue, 01 Oct 2024 01:53:48 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:70a4:8eee:1d3f:e71d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e1741490b9sm217568a91.39.2024.10.01.01.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 01:53:47 -0700 (PDT)
Date: Tue, 1 Oct 2024 01:53:44 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>,
	Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>, Jon Xie <jon_xie@pixart.com>,
	Jay Lee <jay_lee@pixart.com>, Huacai Chen <chenhuacai@kernel.org>,
	linux-input@vger.kernel.org, Xiaotian Wu <wuxiaotian@loongson.cn>
Subject: Re: [PATCH v4] Input: Add driver for PixArt PS/2 touchpad
Message-ID: <Zvu4mMaOzuL3tDTW@google.com>
References: <20240704125243.3633569-1-zhoubinbin@loongson.cn>
 <tbhy6xk4tjuza7rgsv55xss5woysyv4wlg46m6sxfq6y5nk7da@7hyl7cf5ehus>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tbhy6xk4tjuza7rgsv55xss5woysyv4wlg46m6sxfq6y5nk7da@7hyl7cf5ehus>

On Mon, Sep 30, 2024 at 05:59:01PM +0200, Benjamin Tissoires wrote:
> Hi,
> 
> On Jul 04 2024, Binbin Zhou wrote:
> > This patch introduces a driver for the PixArt PS/2 touchpad, which
> > supports both clickpad and touchpad types.
> > 
> > At the same time, we extended the single data packet length to 16,
> > because according to the current PixArt hardware and FW design, we need
> > 11 bytes/15 bytes to represent the complete three-finger/four-finger data.
> > 
> > Co-developed-by: Jon Xie <jon_xie@pixart.com>
> > Signed-off-by: Jon Xie <jon_xie@pixart.com>
> > Co-developed-by: Jay Lee <jay_lee@pixart.com>
> > Signed-off-by: Jay Lee <jay_lee@pixart.com>
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> 
> It looks like this new driver made in v6.12-rc1 but is already breaking
> other touchpads in fedora:
> 
> https://bugzilla.redhat.com/show_bug.cgi?id=2314756
> 
> The reported touchpads used to work properly but are now directed to use
> the PixArt PS2 driver instead of the old one (I would say it should be
> using Synaptics).
> 
> I haven't touched PS/2 in a long time, so it's going to be hard to
> pinpoint the error from my side, but it seems that the new driver is a
> little bit too greedy.

OK, I gonna revert it and hope PixArt folks will figure out less greedy
probing sequence (or maybe we need to push it down a few sports).

Thanks.

-- 
Dmitry

