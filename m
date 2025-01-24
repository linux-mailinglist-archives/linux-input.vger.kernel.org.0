Return-Path: <linux-input+bounces-9503-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 635E6A1B680
	for <lists+linux-input@lfdr.de>; Fri, 24 Jan 2025 14:00:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF3E03AADA2
	for <lists+linux-input@lfdr.de>; Fri, 24 Jan 2025 13:00:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57D3B35945;
	Fri, 24 Jan 2025 13:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aIsXcG4t"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62F61BDC3;
	Fri, 24 Jan 2025 13:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737723639; cv=none; b=MOzddtpYBhUhx+HJUnxrk/Mx9gEaB1UxUwPp7b6BQG5NNj+h9no3L4KzGT7wMO3VMPW1qrgv0ZAKjrq9HLmmh+rX3f52PdDlx/laqSiBB7yBz93EEy6JIK4jzugbRl/SrWdYJYKL1N/PkkEdnaWD0DpnDbWkJxhLVyzGm7V1pWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737723639; c=relaxed/simple;
	bh=jzliCqKtVeGDnMimplbCTVCYT8+Z/SXaawlRDmqCqQI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tdyGtmCjhPRinsPzTEPKHPij+cNIT03NjL+l5iY5CX3+kLpIKP0K7zP08kwRTxhYO6eQ02br0bB5bBWqeSj+lRV0U7r4ci72Vf5adNSjozJeVKdEKIG5mJVTsVXSIG6v5HbXJ/0RnX9sEP0h7l3BCDM+jORpTUxMJEWRjXamszs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aIsXcG4t; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-385f07cd1a4so2063186f8f.1;
        Fri, 24 Jan 2025 05:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737723636; x=1738328436; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jzliCqKtVeGDnMimplbCTVCYT8+Z/SXaawlRDmqCqQI=;
        b=aIsXcG4tkj9lOqMn6IhUYbsLZxlw0nj1ORdG5xR2gzUI4QgDgKLv/vigqa2ll2oATS
         4h59tA5hjuVDCx3k4U5jf5eFex7VuH62uNKGpROhXPHK61riWpY8U7i9/GugGV0eteXA
         SQ3DIR10ApjGwE1C/cuj5Vtv4mvCreH0lOckmdXa3s5j8JYCMJam0SxrGBf79WbWn+gH
         1BS2SLk8OUW1wit/3bSAROLCs1DbtcrXt7mZHqs6DRNH5f9CKHV2SJnLz5LxFGYOLzZS
         maFPpMmJWMchGSBy0IZ9FnkPsi43kD/LOXpqWyC3uDYtHAqjrcdHRX3Uum1lxr/8JXMl
         mlbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737723636; x=1738328436;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jzliCqKtVeGDnMimplbCTVCYT8+Z/SXaawlRDmqCqQI=;
        b=v2S5F1H5FRfljvndfhZZsuOKZUv/DXuvsFeKNBvdf8eJn6uA46aNmx7QPySAQQyb4C
         ngyVz/CdTXUO/XyfAyBxUTH/Ax0loV9+dMnVKpzLqsc5D7pux7+WrCOryir7lKaiJIy/
         Q/cGSa2d1HfyQ52M6yew4vfsW/0DIxdG5bctaF6NIW8rR/FaCrjFna2atMMn+J6RoBDU
         u6oaDWLxsvJt+3ItM7lWs+usIXbCWVfb81UmCb3oF3LJHQOrdpBoe3/A2PvgRoW4y/iv
         klXXZFLiQrQwFprHODxWDSD1VbyLeiZbvae6GswOjY2dUKJk+67rzK4W0PEP9MvrX7Zj
         6D9g==
X-Forwarded-Encrypted: i=1; AJvYcCV9XhZ8WSj0FoXPQXnOpfmRH32k49jMJ6TkQxFD2t9nrsOYb4TljrZj523GlFo4KdGQQKm5Bku0TS3N@vger.kernel.org, AJvYcCVUh2DmwFEKgOPBUlPDlWeoadXOhDlFhC3GNnpWxU2i4GE8IMmQPS1iEVK1ecm1mQmK87N9hPo0XpcsfYRo@vger.kernel.org, AJvYcCXrfczC+uQ0BJDx872RqKo2EJpr/gGXhdA7FTA7qPoFld4anYwnaDOjnUfHWei5sQ69jqMiajbDX2NWdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRtkhWb0zyi8IVY52N3AYI1pZhdwjN0Bn6TOFH0obiytXlxp92
	GlRbsJU36rQXQCQILnpCkMA1UNWd1D87X4Ez46OqXiSnrm9SHSmhsAqTohek4Na0ybirfLVk8wU
	3zdWaby0VhBJQpGYB+jVEL2DDPow=
X-Gm-Gg: ASbGncsOD6mRkqP/zkxqI0yOu50O8hMq1nBlSKFxTMw6TpHpXHeT7yspjVBJyCluQgY
	7h0gDXSiTKgbgAXv9jtszRSkZf+l6lvP6C3Qr7/f0IUxXzRNgSosn/pqu89rzwgc=
X-Google-Smtp-Source: AGHT+IGlrGIYf3vlAGmgFqJEN4jLSLw8+NYeVz0uCO7tfscYCUhUQZTVTFC/1ew+wUmuEFutJ2i1AB4xCj8Nv/UbqR0=
X-Received: by 2002:a05:6000:1faa:b0:385:deca:f7cf with SMTP id
 ffacd0b85a97d-38bf5655457mr25857546f8f.8.1737723634169; Fri, 24 Jan 2025
 05:00:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <67923cb2.050a0220.2eae65.0006.GAE@google.com> <20250124080915.419680-1-lizhi.xu@windriver.com>
In-Reply-To: <20250124080915.419680-1-lizhi.xu@windriver.com>
From: Stuart <stuart.a.hayhurst@gmail.com>
Date: Fri, 24 Jan 2025 13:00:22 +0000
X-Gm-Features: AWEUYZlFTp84le3osHpRU5HOMqeKSQ3eYpimfJjNF5BLkK6OCJ07L1cSual2FjU
Message-ID: <CALTg27nGsrJNY=6D8N_R47+6DCoC5YCTwSVTRmfc76wRZ_2Sog@mail.gmail.com>
Subject: Re: [PATCH] HID: corsair-void: cancel delayed status work if device removed
To: Lizhi Xu <lizhi.xu@windriver.com>
Cc: syzbot+cf5f2dd02bbd4d2d411c@syzkaller.appspotmail.com, bentiss@kernel.org, 
	gregkh@linuxfoundation.org, jikos@kernel.org, jkosina@suse.com, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, rafael@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hi,

This should already be covered by
https://lore.kernel.org/all/20250121200017.33966-1-stuart.a.hayhurst@gmail.com/

Thanks,
Stuart

