Return-Path: <linux-input+bounces-5296-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CA29467FA
	for <lists+linux-input@lfdr.de>; Sat,  3 Aug 2024 08:14:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 550F61C21022
	for <lists+linux-input@lfdr.de>; Sat,  3 Aug 2024 06:14:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19D7B13D53E;
	Sat,  3 Aug 2024 06:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jDzGke90"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C5714C5A4
	for <linux-input@vger.kernel.org>; Sat,  3 Aug 2024 06:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722665420; cv=none; b=ksRTowt0x+qMDtOYwSiYuB7POZFXCfgd33sTJqfHyjTCEJeblLUyqwW+kMsyyg9+Z95H5ciqCbL4bRvC7VskGsqexX4p0A+MSUZkQoFqpzpu1BkILkVH8nqZZTzncBMYYRhdvv/GmvNbuhcl1cnQ4DiYw1/n4BGxfEk4OIYiS6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722665420; c=relaxed/simple;
	bh=KHTDhZXDB92ymwC66SCeqr34IIOVZEMXKYBNFqRmEm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fjLgmbwSvhab9zH/vUOYMv7sZYpu8DZ1An2M79mrZEiU+gzJIOO4eA4SDBgkNlox5xcWm0n5YVaFPXTr1BTjRV55dF+P10c45MS1NAyg55HAwoEOSwuaWAn4wPN+hV61bXqnZuwZ9c5lN67owVFXAoo5GmevrtYIusftTo3GwPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jDzGke90; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7a1be7b5d70so2861199a12.0
        for <linux-input@vger.kernel.org>; Fri, 02 Aug 2024 23:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722665418; x=1723270218; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NUkzlqaIE4k1r6fKC1loQM3z68EukoH0i6WpZUxZeG0=;
        b=jDzGke90L8AWASmawe42V6SsbgVpCTdaGBIYHW0AilqL6jrIp8DNy52SR6cTSzsIws
         7t6Ipl90LiVDgujBjj3cwXb507zU07/g8IGcC++9hw6qwZOdtNmPCGyHUQX9vk5hb7rQ
         Bg3A7Svaq1jbdNLx6XmGJPYJhcAc77R3eznGusuezn1UrSloFgoMeU8KgREcmHBjrVy0
         Asxk2dXtiCyIlQym7wirHbPRejrPEBSf/Bg/bbwFmo8C9adgRlAHKi81yqd+gieAzRym
         cGWR420ZTJ9Mgc00bQYQilOQQtb2Ha4UqUCiJmaHaoeevOWyLdImPZNebz9hHjBuFvwd
         GfvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722665418; x=1723270218;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NUkzlqaIE4k1r6fKC1loQM3z68EukoH0i6WpZUxZeG0=;
        b=az6UYn7hnDCAF8UpRiAzYS2QUxsqHB/4y7erfcZEmrlYbeFbRA/NUNphCW4cSLEHz2
         1TAC3xVA6o7Vi59ImEppzVxS75baiW24r+ZPGxokL1F+dKOfAp1+MyVVvC9rZHbS/c94
         PdIfGN+PVcMR+GANluotLrEGtOgGxdULc/UvM/f1kr++6x0bJd0J7LWtKRjbhGFio/M6
         BKqOIb18A2xTSS+m0ow0gfxr1709Q8mTYuKUTjIFKd4xro1r91ejOkevKitOtofLI0kV
         gY1A87MbiQhGHGoupyDzXOi7DNSUhpl4l7MlEItmibsJ6aEuhb83bOYo/h4p0XBeNiQB
         ZoEA==
X-Gm-Message-State: AOJu0Yw0vF1jZK3Ik3jDh4eFfc8bMMF73Ihb1m1tz9MPwZ7XV3b/s4ID
	QqqdAkdneDL3/7+q7hzDTt28Q+CnhsWiG47/N7v12RG89nUN6EJpQXwN3g==
X-Google-Smtp-Source: AGHT+IGlHBKJCumLJj6qjwp9g0fp1V1yui9+PhfxPjlPSpZnD5BeiGGoIO6uHgEFmUJpuW0puBWmXA==
X-Received: by 2002:a05:6a21:3991:b0:1c0:f114:100c with SMTP id adf61e73a8af0-1c69a69bfc5mr8602688637.17.1722665417487;
        Fri, 02 Aug 2024 23:10:17 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:47be:b3e2:7c00:141c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7106ec06136sm2259508b3a.18.2024.08.02.23.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 23:10:17 -0700 (PDT)
Date: Fri, 2 Aug 2024 23:10:14 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linux Input <linux-input@vger.kernel.org>
Cc: Javier Martinez Canillas <javierm@redhat.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: Removal of cyttsp4 driver from mainline Linux kernel
Message-ID: <Zq3JxhVMPoZsviDT@google.com>
References: <Zq3Jc7Vt0BM5VWAa@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zq3Jc7Vt0BM5VWAa@google.com>

On Fri, Aug 02, 2024 at 11:08:51PM -0700, Dmitry Torokhov wrote:
> Hi,
> 
> cyttsp4 touchscreen driver was contributed by Cypress in 2013 and since
> then has seen no updates. The driver uses platform data (no device tree
> support) and there are no users of it in the mainline kernel. There were
> occasional fixes to it for issues either found by static ocde analysis
> tools or visual inspection, but otherwise the driver is completely
> untested.
> 
> Should it be removed?
> 
> Thanks.

And of course vendor email is bouncing...

-- 
Dmitry

