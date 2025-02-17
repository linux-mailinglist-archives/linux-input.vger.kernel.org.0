Return-Path: <linux-input+bounces-10090-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B1FA37AE0
	for <lists+linux-input@lfdr.de>; Mon, 17 Feb 2025 06:26:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83D573AC683
	for <lists+linux-input@lfdr.de>; Mon, 17 Feb 2025 05:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9723114D2B7;
	Mon, 17 Feb 2025 05:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="No9iZ3n9"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD1F286A9
	for <linux-input@vger.kernel.org>; Mon, 17 Feb 2025 05:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739769983; cv=none; b=OlamcJfUuXLVc7vgxsQVxZMWuimP1BuLwv6y4jdpe2eAzqgJIafkvv4dF4J/yWAwFhuUSbTTeQitfkgQHG5hWRVnboNePDu0hYfx8sChfLa0H6bRp6oTa5qxJbI2bunAz5wKa/3KV0xjFTeozwoLCGoUUu7jFci/yAZ6kKRrAzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739769983; c=relaxed/simple;
	bh=tVlNBhsH/Gozx7tLK53Qfpy6WWDRPX0ktbx0jx1Kfkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LSMqzqUSPw3Pqx+0qKtkG6idlrHL4MgY6FV4M0Ks9Qu/BOyfxZuYikBjGgVuuKi0aIQcY9BHq7xYYd314K2TxFcQZm/0aNqLjHU5THFzl8OyFCYOgzdE8ndAQirTWWL3qcq6nRRO/l3z9UC/163Ix9i4Zbpk6+bge9UI0qhmZOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=No9iZ3n9; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so791988866b.3
        for <linux-input@vger.kernel.org>; Sun, 16 Feb 2025 21:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739769980; x=1740374780; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W7O1+eSVUJDTdg067+CZYBCkUeIi9esU+lytc/BT0RU=;
        b=No9iZ3n9JMISXcU4qUubiZTl2iSiK0o8HQ4TZI2NilY3lVNiWbeCVSmyMN2nhKPO/N
         33UiQXAe+JsasK+rOZ5kGw5jj0ijorpjvd8OWKPbml5MCh1xjlgxz7R0aJytrYnP60WZ
         FcA1mY/eeVyjwfQmahTb+Xa6yU2IkSYwlkOW/V+PNN7qC+QdCoQvWmKnVK3659kjm6fJ
         L6OkbO/NRDjk1fhfS23kBryW3VxFgbRbKOykjneiP67r06XyRK4LPOkhzGSm/PT23KZf
         +rTq2P4n9Q3A8YNk5MWO+2jOVZcoEwx2xyphurU0Pf0X2AGgk5/w1WIn4+2M3tXalTZ0
         gdMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739769980; x=1740374780;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W7O1+eSVUJDTdg067+CZYBCkUeIi9esU+lytc/BT0RU=;
        b=b00TugdSbX6MA/yEOEYOLM7P6i9nqM45OW0yL1g44syCK/0U1Q+v16ZRftg40PzgK/
         5HXPXKqmnhyZHODp2xYbBdgyR9FlRcq7nOIBqApCgrHKW1VvBEw8ZbZXoy8OKJusTb8C
         ICeKxwEUQBRuf2BFfeHRoET6UgjEc42Xnh0RoU1bUdqfJoUE0M0LYjsLmuqCZorHIM8o
         v4Yy8E46bPfEDGTZ5OlEJPvzUzwgvDu5ANfQyLR3yd3lqV3gJiYR3uGuMdym4x5a7w+u
         lshUVCp/eWbMaO3ssEPrWIkpCyxNKNshANT1lmZMvXSCrWuSe3U8MxNLCqrhXplCqzwV
         rMOA==
X-Forwarded-Encrypted: i=1; AJvYcCWLi4BrvRUP9B++6As+kB/Ycq/0r6hGghxVl1f0iKiwB1Rjd7C3fqp50kJc0J0IrGHPjEF08xzQsT9oyA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9680FyTYCMUz4d6nxhbKz2WxL7JsFfZcvShAwwHbUw+/9hKNp
	X/zMFjPy/vFd6OMX3s1qbdL9x/Z78HLhvfubMlSj6Dk7NynSFLZ14uJExM45kxU=
X-Gm-Gg: ASbGncvWLffEJTNQHtEwL0bmKxHs+YAoYhIQ3HCJd2wdBZ8YBsec5gaoaRQ8B/Vc4DP
	e1OEK/6wEt/jijZQ/tXsUq7L3b/p9uRqI/Nwbta3WQBmnyDjNXeg0sDii2Ol0i2C9WkmU9uFi3d
	d64APp+b3FBET7n6WjfdVUBmmixOm+edIctmMcLMO8orr99wzX5b5PuaFvFXC0biTh4RwApDsYQ
	mLdX2QA0RHsHS1yh324xMSgCwqMeih1bZPg8SZZzSBXXq3JHqiXLKK7Bd+PKXLy7SNjMoTOG2Hl
	cOAoBSHSgKLRTVPy4Xpc
X-Google-Smtp-Source: AGHT+IGYOV95EfvJDGIKSYioiiiMN/UAHX+0J7gOGKT5GYMMtNiCRHAxttNE56UwCO/bx83V8PlYLg==
X-Received: by 2002:a17:907:780f:b0:ab7:440e:7d08 with SMTP id a640c23a62f3a-abb70bff32emr640040466b.4.1739769979998;
        Sun, 16 Feb 2025 21:26:19 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abb3d276290sm494256466b.178.2025.02.16.21.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 21:26:19 -0800 (PST)
Date: Mon, 17 Feb 2025 08:26:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Aditya Garg <gargaditya08@live.com>
Cc: Jiri Kosina <jikos@kernel.org>, "jkosina@suse.com" <jkosina@suse.com>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Re: [bug report] HID: hid-appletb-kbd: add support for automatic
 brightness control while using the touchbar
Message-ID: <cef09c87-167e-449b-abf7-cb06e5ad174c@stanley.mountain>
References: <6263a1a2-4d50-41db-aa54-cfcb3e0523a4@stanley.mountain>
 <88774FD7-0DF2-4F93-B4C7-3D26FFFC48A1@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88774FD7-0DF2-4F93-B4C7-3D26FFFC48A1@live.com>

On Mon, Feb 17, 2025 at 04:50:19AM +0000, Aditya Garg wrote:
> 
> Patch series with some issues I myself found out, along with the one you flagged are sent here:
> 
> https://lore.kernel.org/linux-input/8365C1B3-3A38-4F6E-955B-D6BBABA6B00A@live.com/
> 

Thanks!

regards,
dan carpenter



