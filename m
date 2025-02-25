Return-Path: <linux-input+bounces-10365-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1F7A44E4C
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 22:04:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C006B3A8673
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 21:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A10142144CD;
	Tue, 25 Feb 2025 21:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c2A9xDAg"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B8F2135C3;
	Tue, 25 Feb 2025 21:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740517364; cv=none; b=s0RYn2Yz+rZkUmN/+KQKsyZdAX/clW+bWD1ATPwWWcLS61LoBl9LOqlOWYUsiENePkd+njAPBzmy7IwfH2tTt1f/prS2K1+tdbXM8Vrhi6dXH7aldwIx99tshUGWadMclPNU3C6Epow5eJOZMQNh711y0GROizdFKywottl39y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740517364; c=relaxed/simple;
	bh=k2bAZRH/vT28zRkdeBRPQ7B4kTZgLHZd8twEY7tXRzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DfWtNTKWTeJWuOTwSG4MzZG/D8z8NwHLkGH8vHXmKn5IrLsD7sVNrt9RFoq4Y76376PajkDCmeUAQMNzs3pTTGTY0MDtSllLs+jSHekit0POqcW+iihKY0C9NqMuAtp4DKxjsWThMGQHSZukpLTSjm8DZawJZdnMSBjlg3zTF0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c2A9xDAg; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22113560c57so38237695ad.2;
        Tue, 25 Feb 2025 13:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740517362; x=1741122162; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5ka/SwCQ3OPJpGyoJlcRKErlP9IhLnGv+6NuwlSMDeI=;
        b=c2A9xDAgXpiKVcqehdCVwHoBlx8Fkhsql45/F9Wm8i1O7I5WcJCHJOORx/pAblNHWr
         45jsBt5MtQgoL637qHocwGp+yCrHJvYjrPhBQvPrDQfe7x4KnWC3Jh4HNspmFytqp7xv
         4gfiNf27FVoo8WeeWSxzM+yDw6WuR/lO6KuEmL+vN5YSdMfygPpFfmik258e9dVnaY23
         RWSp4vbySlfO6VlimmkxTz7WLRLjpFpKieCbiMwlLCysDiIbmWzJ1U3BMaATWD6HOd/s
         7lBU+UFJ2F+zQXBqc1oNQ2URuyy9DBGloWLYJvLETJlIKC5hr+W64sKjGn1toD1IS2sa
         ccuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740517362; x=1741122162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ka/SwCQ3OPJpGyoJlcRKErlP9IhLnGv+6NuwlSMDeI=;
        b=JdrMdyMr3iFJrNoAwDWWzf34zaotBqN+0ffZsFeylBkvIt5WHfsMK9QkkY/iHqLeCy
         HEl9XAu7qMoXEfgcwkh6TSPIjZ7tLCb6lADhTx4HniBX8kEb3ViIoDn58mAYm+hZMSl4
         7AXhr6iw/BgcMklWxUoBrPtUFn8fRc0vYBwUA57rUUFQ14yc3zz5tfjCHXvh7/rUzohq
         9Z9z3DUa7Dud6qCHU6QMNaGIGr6YHxR3IsgZchyDPZ/Bl0A24BNGIAQMOdGtse4+YoWQ
         H8Vv4ZdLCWZJoAjGgugdcjz/nTUPhofnfHQmgrABSW/KkUHt5xswog8l+p+GuVdcO9sS
         1p7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXAUJ4HYBeCefhAvSM2JqBuSsa0WESjWUWV4T72VEYbeCaME6HJAAmzEsT4pyTq98KMWgGUr4C8F/ZZ1oI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0OCAxGVISBq5v1AFS+fFyNHAoLDO83bhJFx/lMDOjQW43FNO1
	W4L4u6cVN73DRfESvaN+8LPLrd5e2Lk6/om8KACk745gMFZXd82v
X-Gm-Gg: ASbGnctKM0EIyAG93m2n0+SZxwgCnf61ePERD2QmNTM8igB5KzOJswiW3fWa7htOK72
	lAGOUmCFfbZQ65egDdJET2YM1KtK3Mt44EA45vqpC1JvpAv12pF+1N4wxrr5dMTNvB0VBCKEb6i
	1sJIAi4URtr8SBACozehL6/A35+7vJFWQmaqxq9/9n0qoIWC4ld5pMX2SPdclCfWjQwgQpgr9c5
	uvsLzEkr3FIv8VTmRu7GlWr+AaTAM/4Ch9hls6eCh4XPw1ijbdQy5TMwXuU2uATKjC8p0hTWM8H
	qXhrXWSCjyHPNzrX0N5+hx8U9E6F4VN5+vQXnWpGF0GtPg==
X-Google-Smtp-Source: AGHT+IEoT+SDYoTWeQfzXv5VosnpcKmYO3GBDwGylcY2HYy48JfZQlvNGBsExZk1VL48JnTFQTm2Jw==
X-Received: by 2002:a05:6a00:4b54:b0:732:6217:8c69 with SMTP id d2e1a72fcca58-73426c94ad6mr35357923b3a.3.1740517362216;
        Tue, 25 Feb 2025 13:02:42 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:987e:29fc:176a:2ed5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aeda7f83fa8sm1830115a12.29.2025.02.25.13.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 13:02:41 -0800 (PST)
Date: Tue, 25 Feb 2025 13:02:39 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] Input: i8042: Swap old quirk combination with new
 quirk for NHxxRZQ
Message-ID: <Z74v7xXiavs3d9J8@google.com>
References: <20250221230137.70292-1-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221230137.70292-1-wse@tuxedocomputers.com>

On Sat, Feb 22, 2025 at 12:01:22AM +0100, Werner Sembach wrote:
> Some older Clevo barebones have problems like no or laggy keyboard after
> resume or boot which can be fixed with the SERIO_QUIRK_FORCENORESTORE
> quirk.
> 
> With the old i8042 quirks this devices keyboard is sometimes laggy after
> resume. With the new quirk this issue doesn't happen.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---

Applied the lot, thank you.

-- 
Dmitry

