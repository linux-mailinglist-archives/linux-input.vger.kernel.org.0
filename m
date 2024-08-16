Return-Path: <linux-input+bounces-5602-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 728FC954198
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2024 08:17:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E7DFCB26169
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2024 06:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3BDF81749;
	Fri, 16 Aug 2024 06:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JPGxkB20"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C563F9D5;
	Fri, 16 Aug 2024 06:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723789044; cv=none; b=QkomGlSBePX4ujjktnlsBfrYGXD2Mpt795Lo6meV9QtnxHX/zGaDr5LjKW7cY8SkSmvFHBzl/pFeg+ytA8EN5JwU/xod+yoUka/5EkGHHyl+8wUXEQuXGHnJs8IM39C5IzUq/e2zth+V4f8C+Qg62S7qLlTOR+n/dRne3Opeml8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723789044; c=relaxed/simple;
	bh=Q6mPka1ujlVbIbZsoSnqWJF9mbq9bmgokM11gbsB8Yk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cbKS3nThLn/FBxcme1Ooi88i1Zc1zDzUITHaB+9ySskrE5G/pEVMCB5+XzyFEq+KYhzNedsnlb8vaBLufggBgLuiTHC6u/+mB5TJSNJ6E1ELFwbI0DQdcDpnMeTxQ9+zDwuGlQVtQERgQCC7B9hGW9gwAZbTueiSEWBlIG2JHqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JPGxkB20; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-710ce81bf7dso1337131b3a.0;
        Thu, 15 Aug 2024 23:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723789042; x=1724393842; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UVresqul5/tHtfI08W5YN0YBSJ58015BBcYo4XD+OQc=;
        b=JPGxkB209rQS5DwwxxpiNQ+Ea7ZLaXl4cYYreIDFY6Lr5wkY2T185XDnwntzplyGSc
         8dNFeaSMShlvFFJydmDZW2g2tPJdfLGXrwUQ6ssLYqf78kcAvhAWUMPVsEADP5gy78j1
         OxYM+hvxJjUUIn4tVyIx3G1QQ7gVBtUTVyjv+rt6spV4iSY7j08Bkie15ahuDFwbnSE+
         DfNTpDaROhQKPz8DikNTt2J9sWAtdhMqWXfKhXMl+uVF28aCjpnIMEUT+3ctrKRKyGij
         O6SCN/MYA1WJhH6WYNA3HWlGu/LaUUim/WO7LGNScsta6bOnQOSV/S6vjyG7OIlRUM4g
         3Xgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723789042; x=1724393842;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UVresqul5/tHtfI08W5YN0YBSJ58015BBcYo4XD+OQc=;
        b=bD489oKtzFpKyAvB1ni7pIeMZf5KHHW78xQ21z8BiuZsfTWaF3rL0j0axw50O2XCYy
         iPJiYRrdT/bNSaxhuP33UascsgWv6kV6VbNlP9kV6jyjl/QHwu2V3QUdDwJtiBySWo9T
         +8EET+fHNEjSAwIzcEjSbjiZEVmgg+An8XHYdUjRp815RSBgcx65MGFoOVy+n4FKQuGn
         0QEVA2WzHu3QoVTNHxvTyzV3kihvJtWVuZh/aO79BLidPrcCkxFHo9ypRWNSQOsYtZWL
         XOMW7sfL86/mvlvjYXF1th+IAZBY8Jkiikh7/ZJIP9/kNFzyUiW5aUkMiEDbZwDc5c2e
         yVmA==
X-Forwarded-Encrypted: i=1; AJvYcCU0gaTxpZ+W+HtaZ1GuXuLhKiqnQSQFhhCkWq6PGqvd4E9uX4cfPRsc1eg8lXQDDgbDZgkrOi8H+TyrwfRVMcOoStG5ygG+69zfkjxu
X-Gm-Message-State: AOJu0YxD36lDmn/gHl8TI5Dc6uomAzp7H9hr9tfzCb5j9Nzri6RbW72n
	bNAduiAfQK4kpelRd4XjQXeQU6SxVUjgpwCQW/gwovlBKFpQ3DSq
X-Google-Smtp-Source: AGHT+IEEmXxZAbTZFK49QYW+aa0W1aTLIJ0GLMUNjB8luX7mrdR5/ydTNCpv+AtoWlWYXm04lpdgMA==
X-Received: by 2002:a05:6a20:9f9b:b0:1c6:fbec:7abc with SMTP id adf61e73a8af0-1c905060d46mr2447131637.45.1723789042198;
        Thu, 15 Aug 2024 23:17:22 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1ffe:470a:d451:c59])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f03a57f3sm19095005ad.299.2024.08.15.23.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 23:17:21 -0700 (PDT)
Date: Thu, 15 Aug 2024 23:17:19 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Peter Hutterer <peter.hutterer@who-t.net>
Cc: linux-input@vger.kernel.org, Jeff LaBundy <jeff@labundy.com>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] Input: evdev - limit amount of data for writes
Message-ID: <Zr7u78IvuiwbmxYZ@google.com>
References: <Zr5L8TUzkJcB9HcF@google.com>
 <20240816001805.GA232957@quokka>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240816001805.GA232957@quokka>

On Fri, Aug 16, 2024 at 10:18:05AM +1000, Peter Hutterer wrote:
> On Thu, Aug 15, 2024 at 11:41:53AM -0700, Dmitry Torokhov wrote:
> > Limit amount of data that can be written into an evdev instance at
> > a given time to 4096 bytes (170 input events) to avoid holding
> > evdev->mutex for too long and starving other users.
> > 
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> I'd expect anything coming near 170 input events is going to trigger
> SYN_DROPPED anyway, so:

This actually going the other direction (userspace -> kernel) so there
will be no SYN_DROPPED, at least on the way in.

> 
> Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>

Thanks for the review!

-- 
Dmitry

