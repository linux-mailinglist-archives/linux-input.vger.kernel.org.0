Return-Path: <linux-input+bounces-5657-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACAC956B41
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 14:52:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3B921F22B35
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 12:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D224116BE33;
	Mon, 19 Aug 2024 12:52:27 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3067616BE12;
	Mon, 19 Aug 2024 12:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724071947; cv=none; b=A43rGT+4cdSBL2Me5iixw4ydZTR6/u/TY1F7tC7HZXxbUSrvR5cAWCcuTypJvcSyJ27GVr5nYQgaNsv9hjnSZmFFCOGiuO9cDxxulywUlHZQSHgX8iLCLUJAaQ7Fr73GCR3VHjDkkI34M7qTK0r6ilQ41GuL2tv096y5QHNkRAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724071947; c=relaxed/simple;
	bh=paWJbbTEuiDKh850m9o+UmhGrouJPteEBnJjkkOntDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YyA5xdUCibF+J5dDbuyxodX3OCEn4wxHey9fuR70zQcWhJeNQt3atzNXdoIkuUsC9pXsDbguoMFuounhITQMpHuL4R+cDoeOLfcgliPaY034UiAG3l+wxwntGPJAaNx4HyOc6E045mHsXAqMxVB3bgk1wBODzF3y6YyDWrY5lCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4281faefea9so33555135e9.2;
        Mon, 19 Aug 2024 05:52:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724071944; x=1724676744;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9I/zIIf8OiCJi1SuHf0ybhJTsQQa0EL3MDlwq0Y5tVs=;
        b=SPZdrtdAa41gmbpMlxbRA+YxGR0EgLN2+ASTLlyOB7iCpu3f79ilVnH1akuKY0saKH
         FPjHY9SUWQ6Bxlz2snw1RjYnz+uHOqgivWiWnutcGvYmC1cOV49uG3dzVzGrBga2hEUw
         SFqi2uE7oFI5IrcVUuQDrmHBMRvb8kYSuK3WNWknatdvib5FaQGihfrvWXV9kH+MHT33
         9kCz6eVKPQDiMrbm1YQgknWu5sULGCL4rN/Lv77KkK/4fc7CZblgqfxmG3GeP15bR9vj
         7N1irXy+Tp2p/gpgsGs5YpUbQ4Cb/aKIYdJwxMwvIj/3UwbZLQUP4EFIs2VLDkwrGmH1
         XMrA==
X-Forwarded-Encrypted: i=1; AJvYcCXXMjCxuG/jfEctI9SLzw+2zVS+k1sk/xA1jN0LDEEk4JSC5f5r5vgi4jX0nX/b+ICX8NJNmmHmzhsl2zEieVvSEzPzPpJ1Q798KP6i9k72qfF8HW6B7FkSxLYDS0Api++zyCAGmibrVTDtwhRSJDnYw0BsuiYX3DQ8RW436ppCsG8ATm87Nvc46NwtbpfVCarT2O1YpHRJTHCVVHtsrpKyOJHqzcK1KTo=
X-Gm-Message-State: AOJu0YzjMTJFrJsAjgEypGSEd6cWRbAfI07FWQO271FGZzV+CwenjSIG
	hxFsccxP8A3QbRDxOhF5pNENMGlyjQhM+c4m/JszpJW/gZ1sfnOE
X-Google-Smtp-Source: AGHT+IFa+Ymfdf1npYlULnWEBfrJiWttISu6EgHfO2nefSr5HHAl7ifLGtdCd56noNVVubkb21K4EQ==
X-Received: by 2002:a05:600c:5254:b0:429:d43e:dbb9 with SMTP id 5b1f17b1804b1-429ed7cc4d4mr68950095e9.23.1724071943979;
        Mon, 19 Aug 2024 05:52:23 -0700 (PDT)
Received: from krzk-bin ([178.197.215.209])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-429ded720fbsm166252615e9.35.2024.08.19.05.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 05:52:23 -0700 (PDT)
Date: Mon, 19 Aug 2024 14:52:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 03/14] Input: samsung-keypad - do not combine memory
 allocation checks
Message-ID: <722zodz4zvuoruz7htxxwcyp7ztlxf35tykbkysjcqbvrruf5j@j4622j24nsms>
References: <20240819045813.2154642-1-dmitry.torokhov@gmail.com>
 <20240819045813.2154642-4-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240819045813.2154642-4-dmitry.torokhov@gmail.com>

On Sun, Aug 18, 2024 at 09:58:00PM -0700, Dmitry Torokhov wrote:
> The driver uses devm API to allocate resources so there's no reason
> to do allocations first and then check and release everything at once.
> 
> Check results immediately after doing allocation of each resource.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/keyboard/samsung-keypad.c | 5 ++++-

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


