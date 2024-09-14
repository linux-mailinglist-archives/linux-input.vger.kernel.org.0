Return-Path: <linux-input+bounces-6545-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 441DF978E60
	for <lists+linux-input@lfdr.de>; Sat, 14 Sep 2024 08:18:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08C4F282882
	for <lists+linux-input@lfdr.de>; Sat, 14 Sep 2024 06:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2463F47796;
	Sat, 14 Sep 2024 06:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hS+B5GbH"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC510381D9;
	Sat, 14 Sep 2024 06:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726294622; cv=none; b=aux7LVah3CBrW18R9zGZasOLeg0JoFPKstZ0vJwocAuTSO5Vapwduh2zh9+bqfbIGY5pvPooSptDz15X+xxfLTHXR1GaMMHmh9zpWtfEp1eXt9iGA4jKoyd2Jyu8LERRGRBJMnPrDjs+61zDaOPsDDbHSiZwce7pDkIz78UohCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726294622; c=relaxed/simple;
	bh=X7RiSY//HsgH18rVltttj5L639T5JPjjiP4D/Q/jr/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LQkj4rqH7EBj85pFZv8ztHbC8j1f/pwCgO2ecFoD7M+v8nVGdDJZGRRONF3Uw6RV0IeLOcjvlA4UX5YwFFBz0HF9JxAlOch22907QLfuazhbCg1PK833GZQ1NL4pqG7gaXZc+5F5AvNJB+0+oDRCLVIBOs7oBY0lqPNxldTjHKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hS+B5GbH; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-20696938f86so24746595ad.3;
        Fri, 13 Sep 2024 23:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726294620; x=1726899420; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VClzbhLRY0MrFymFtQGe+Ej2FPGNIMEaOmjXvkAGum0=;
        b=hS+B5GbHjbMNtx3jsd7vR9hDdZbE1YBV8HAejhhAQQZGwv98TvC12IaJegeY2DN8E0
         wEwvNJBbUty1EMnS+5QCEgY8AuD42VmbfLnNbvEe6TK0jy6kcvecZLlpXoq6bAP37zDz
         HtRlOPCBGSJtoK2Zr0qUgL7KKaMPRQC7/8Zy4OVV5IXYuZtsjogH+WDfF9ulaaMQOrID
         CpZP4NWJP1sJrH3km0J6XY/zcdl4X7XyVXYOrtERFVhG81rXK9KYi1yVhXQJ3xDtVvQs
         7654dUgZgWmfdjEYF6hXyzDcpH3KKMkKnMn7aqYrC5vl9/7JI0demHmeVRKymF+CLffE
         POyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726294620; x=1726899420;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VClzbhLRY0MrFymFtQGe+Ej2FPGNIMEaOmjXvkAGum0=;
        b=W0IqiZffAoBzmXLS0ToihAwMWx6FwwQTk/g/4jtS4ib+POQYg7iLXYHe4PNpVRt1Ey
         IuA/hhESjNhsxwMV6ja8PjXSPF+HCemqNJDuWy8YR32WjXpHoM6DByp7vNCno5wp0YJE
         tOQEAtuTG+/L3ixTaT+wEoskWJiGlyEDr/r1js9T5HUjy6AogyQskTi2QKyVnsMVaI8t
         D0b2J8h1r/6CtmDnUuusuGVtANng9gt6VfTAMHKwAw3GYY/s5gaoj4IYlwTWQym5F8GY
         EVWkxPgrzO3EXgOACu/bOb5UbqqYqfIv8M8mW9pEwueBZpukqQrnxMoxNHeZ8qS0teP2
         +Yvg==
X-Forwarded-Encrypted: i=1; AJvYcCUoMnZYFtgWbAZGVlXXqwTbvSypH8265e2wVYf8W4SyhpHC87/IMMoOerR9RcxA4s9QFX54J0LGEX4pgggf@vger.kernel.org, AJvYcCVOP8VguikEAvEtl8mdZ9Qp0Uk1Ya80SL17t9r1vDXAuHU7cPwkGfoUlUoo24pUrUcPM+bCp6oMiRT1RfY=@vger.kernel.org, AJvYcCWe/A3YEIjJa7PEpwTWC0jUzalh3tmmjIvARgzQINLhJNv+PcKoITGq+OJJREqqZQgnlC/LVRaPuKO98Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCN8Fn3u5qMChBQe455xD2KIYgNXR6hBTFrN3zmHM/+ufi04zH
	jlL2J9/VB4yAemqvcki9AmK/rCuY8kfX1mdf7Q84iESskONGs99r
X-Google-Smtp-Source: AGHT+IHwWtypqvXe91IEEuXIxgvLHN8Fw77NwseOBbbDp2EkoYmogKz+tS1rMNXzfKdkW7g2LeMzfA==
X-Received: by 2002:a17:902:d2c3:b0:205:968b:31e2 with SMTP id d9443c01a7336-2076e46b8b7mr132545975ad.59.1726294619508;
        Fri, 13 Sep 2024 23:16:59 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:4c0d:1024:4781:3234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207946d5a0bsm4577285ad.145.2024.09.13.23.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 23:16:59 -0700 (PDT)
Date: Fri, 13 Sep 2024 23:16:56 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Laxman Dewangan <ldewangan@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Thierry Reding <treding@nvidia.com>, linux-input@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] input: tegra: Use
 of_property_read_variable_u32_array() and of_property_present()
Message-ID: <ZuUqWNVXKO94fQuK@google.com>
References: <20240913200827.546649-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913200827.546649-1-robh@kernel.org>

On Fri, Sep 13, 2024 at 03:08:26PM -0500, Rob Herring (Arm) wrote:
> There's no need to get the length of an DT array property before
> parsing the array. of_property_read_variable_u32_array() takes a
> minimum and maximum length and returns the actual length (or error
> code).
> 
> This is part of a larger effort to remove callers of of_get_property()
> and similar functions. of_get_property() leaks the DT property data
> pointer which is a problem for dynamically allocated nodes which may
> be freed.
> 
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Applied, thank you.

-- 
Dmitry

