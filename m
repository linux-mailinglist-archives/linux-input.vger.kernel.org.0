Return-Path: <linux-input+bounces-15880-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 390D4C32B72
	for <lists+linux-input@lfdr.de>; Tue, 04 Nov 2025 19:58:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C50A834BF10
	for <lists+linux-input@lfdr.de>; Tue,  4 Nov 2025 18:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14B2A33F8C7;
	Tue,  4 Nov 2025 18:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PFO5WWTk"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAF12F7AD1
	for <linux-input@vger.kernel.org>; Tue,  4 Nov 2025 18:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762282698; cv=none; b=KM6xPUzrUPL2LNtQnLPuarU75mqyM4aAeW6ZBWi9lZ32P7Cffm+POTPuMGPj/lNcpbkK+1AGkRZw8UGXRQibn7GJJDR57RQVCCLcqo4+OhosqOEsQ3SyHSYGZw3/rU62y2AmmpcO0N2LSxMGi2b3YFm23Fd3AmQnTXuNFctInbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762282698; c=relaxed/simple;
	bh=sXJ6oo046UdvVw+WZY0s1bpUrcjoT8rdWb7NkoJ1tDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HoC5WpzFu9Vl4KhJn6jC4OIFYCjNviEc0KAw/x7slHpTAy6ZPStIffsl1r8lwrdY4BvTmlH6A/uORjqMaxC114WdcHzzVRGorj8qh+4KzorZH7ihuuhxNbR4uZAxl2f/JFyLN2JXOahCGK7wq9BAHPfkDvlR/N5FliPg331Eu7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PFO5WWTk; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2952048eb88so63541715ad.0
        for <linux-input@vger.kernel.org>; Tue, 04 Nov 2025 10:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762282695; x=1762887495; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6B+aPmBbpdYFEZ5jj5U7gq6e1DRXMQ9PT8K+t5rVros=;
        b=PFO5WWTkj4Wr49uMspyv2IJ6/mfwA8B0MrW1oowem9/90Lftns+R4fAJ0n/sccbfF/
         iesuUKI2oiUOIMq7D8wJyX87ZP6cGXNg8E048BpBcT3/K6G/zA8/4/EomHdkzbDS89kl
         SD8+PfwLZ/fY9XnKmnjzihts7/1Es4UU48tnRNu9oMKmwRJAiHD0uWkLqgpnX2Az1S/u
         VN69udvM5nLwKm9vYNcmnHG7PYbY2vWbDkH2s/2eiuPjrJ2su3/In29DinL3JAEp99yZ
         qbe6sasOwTY+9kQBaPpUNZ6zMpXnn6TcXLrW8eMwT2M4MFhJf9nRQwMaKD/fiXz8swbp
         yYwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762282695; x=1762887495;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6B+aPmBbpdYFEZ5jj5U7gq6e1DRXMQ9PT8K+t5rVros=;
        b=BXNLgiZlKFzF7r1SKbIJR6yzwHyyEFgcMaXrAFDLmyV0hzXqKGwK5PaE53g44VLyIE
         QGYXda2jmaOVqxhAT50Y7hrdxcJGmFTBEkpweM+o94x09ByJthAp63BOzqeDN2IpQG3a
         sgaNqdYUTxT35U0+Rm1NJV8GCZ64wpAaArCc7TZfsDyqgx9kI5288bnj+C4OO4yFKbJi
         5HBZaoRoucyUCPDlwiUAb7d5Wko6PjlLxYQcbGUoRw9nwunZNwSZFc8YT3VoU9SdMjb1
         S8jWMR+uCaRPxZAEf2y1sahd0BtvbzcgjFNfvh7+65cwilU333dyCpsYC1hctKtZE3Bv
         0kvw==
X-Forwarded-Encrypted: i=1; AJvYcCVyozixfU85ErMJwKWe6wShdv/LtxNQG8lBJVo0TnBaoU5CqMG5/6eXkeOILnFnWU+UIvLCogc6hbVcXg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz72NczAIKjJaegXL8VlLEKMUxsGU1RqGj/9U/68JryS2KfxE/9
	wk/scO9INOBaW3uvZaK5Dp0FI27B8XO5hyiIJckLMFj8ZmbNnPejxm2v
X-Gm-Gg: ASbGnctP3yujjye8eUz9GhrXGxZIoLeO8W9zlJP7NUrREJxyyJaRi+PriKAn25nvmy9
	qGsYdyR4wD4xdSMJ36Quw97O6rLPRDMMt/WCIp566AQc9MPIP9NPBtBaizhSM7V6NCowwxJgEyr
	RxecCrFkCnnXXqlg7CWn5zqJmO5DZaHsVIHyGeahho0MBJVQGpQTm38KXnluiKYnh8dfZYb3lwo
	EEUMpUtK8bBupGZsomdBGMJEHD3zPqBEIKOwqF3SWXa7HH7TaIlPLQBPh8wSg3+BpjujRoVodS5
	qXeYKxc/56iBzRYiTgBw3C0o5No/AE+2YZE8TFdjs2kaiREAXxdQXnvISbri+AAsTOQu5DC9Ba7
	IZkbr8DGqO+1hyHkt7vJ25BnMV4LLtj3czILFQUYysXBk8HYj5QrALe7UqQbEUXx31BFa+7pbSF
	UXwUGVfce6NLJnItcFBKr6DqoYa9Xe+HrC/Z7hZ9PW0A==
X-Google-Smtp-Source: AGHT+IFHo1RV7muJZAmmalRPgMc0IPBuau1lfoRTnOMDYdIJrPmtkFZaswgqqRuY7j3qYZj5YpoDdg==
X-Received: by 2002:a17:902:d482:b0:295:425a:350e with SMTP id d9443c01a7336-2962ad0c176mr6981645ad.8.1762282694755;
        Tue, 04 Nov 2025 10:58:14 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:1f2a:f7de:951a:621a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601998d4fsm35273745ad.43.2025.11.04.10.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:58:14 -0800 (PST)
Date: Tue, 4 Nov 2025 10:58:11 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Anson Huang <Anson.Huang@nxp.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] Input: imx_sc_key - Fix memory corruption on unload
Message-ID: <uimkyxzdrcrcm6jmprcsnbl7pw6w3impm5dqam5q4gln3lrcwi@ngqtd5pbuywo>
References: <aQYKR75r2VMFJutT@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQYKR75r2VMFJutT@stanley.mountain>

On Sat, Nov 01, 2025 at 04:25:27PM +0300, Dan Carpenter wrote:
> This is supposed to be "priv" but we accidentally pass "&priv" which is
> an address in the stack and so it will lead to memory corruption when
> the imx_sc_key_action() function is called.  Remove the &.
> 
> Fixes: 768062fd1284 ("Input: imx_sc_key - use devm_add_action_or_reset() to handle all cleanups")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Applied, thank you.

-- 
Dmitry

