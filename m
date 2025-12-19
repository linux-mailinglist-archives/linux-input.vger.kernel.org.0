Return-Path: <linux-input+bounces-16631-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 099D1CCE86A
	for <lists+linux-input@lfdr.de>; Fri, 19 Dec 2025 06:25:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F36A30413E7
	for <lists+linux-input@lfdr.de>; Fri, 19 Dec 2025 05:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 976802C17A0;
	Fri, 19 Dec 2025 05:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bQ9TNMYZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E993B2C0F9E
	for <linux-input@vger.kernel.org>; Fri, 19 Dec 2025 05:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766121844; cv=none; b=kFx3z1E8kJ2WiKtRHGoxD79kHiT2D8yHWvSsnrqQwH7NqmMQ2g1o++1HXNgbRHNVwmZPMz6SbEJDfNwBoRM1nGd0pkbO5cyOplQ7X/wIPsEXb/5DuPJsnqzjGe5sI6AorTVFduR9iI04Vzl7XGoYe4+uPG3CueTwm3QyAI06c5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766121844; c=relaxed/simple;
	bh=hpVgyNRNTF/7kcsg9lnbnogjpGsM8Obr3fagkkDIX8g=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PilkeKQ3tD4nbbOseZ7kqjT0Mo9dLvv8Ja4+FtijzM8ZHFuLcEic/sCu1EpSHf2OGW0to/6vQQLrta/UO5KZODagFE3gKHjnTG/OBgeXYaSHYBo1WdRHPr81C7a9DjoP/i7qgwJIhEDFkMakmlfOr65khNlmG8yVFDn3Y3i6eS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bQ9TNMYZ; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-29f2676bb21so17130535ad.0
        for <linux-input@vger.kernel.org>; Thu, 18 Dec 2025 21:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766121842; x=1766726642; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RodLP0AzMxrSO+sVsgHgtZsW0nvryzTBS7wWjzUGiPk=;
        b=bQ9TNMYZ+ZZxkYX7PMW3D6IMIfi40uX6/FxmZm9BNKybNi8jOsbc0NL4BfLk5vhaku
         WuGVzGRHOx+B5wRq0NUh01svkYCAn8S+3xV+51LXq83w8wrURm0H3k2c0k4tXuXV1D6p
         0Dodv/9QdrfyH0kGnNtI7Wb6GrYq4qqSUYWOmia1hvLVal7HvgfdHZv7bBoLulBhCgg6
         +G7P1hRzNiuTuvNg/x+MYeG4f+sOM9ZAcJe8Xpc05sde3BS9USMNYVP1K3Rb19yLDgM1
         7Y1I+jz81kG/0cIAmZYEUI4tLxLxj4jg1cUf2LEeilJuqPpd3D4e9rTA2jLbC6QatPhk
         wg5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766121842; x=1766726642;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RodLP0AzMxrSO+sVsgHgtZsW0nvryzTBS7wWjzUGiPk=;
        b=V1mHbi7ZBiq8oPyrlDpBOjrFjUrz1XaAfDdpoTDfMl5CEKdwykaqUXoo3l3Vollz1O
         zS4Zo2/hwi8gisy9+jL6Rzkm16SDyXalPTvrbxs9CPomzPR1j5T39usZhzW+hNzMsEry
         TK6mlXIcZxkzPbBvvHwTr70aPKYuPsPrLdVpZFikeyi6JIKTA/ilf7DoqYpqIZxTUvhY
         mRTAZ1w0BknQFykgU0snKLD38GhCrF5hBHYPgtxKEER3Adp5Xm7K67dTy9DaIGGQAGjV
         sNus/0RuZrJ2+4f+IZvKaAeV5icTB7SSubnavUNvlnpjPVXLruGfNo99svGGjTIY/tK5
         k3Jw==
X-Forwarded-Encrypted: i=1; AJvYcCVkUOMzHoCyszToQVlTs3jzpmWfUGW5UpL9wj+B213Locieb5u3cGJjUzB39eB8GNvRhplvDeOuLbL51Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSfNkaNkkg4LSyRNsVKeB9rgQ8YS3wRyNNT/6kQTy6EFHglZpF
	8b+LwITLcxNwXGtyIbq9che4SXiWUsZgsmH30ykc93RBZx5MunWrXf/9
X-Gm-Gg: AY/fxX67FDUJkcGNan0G0nujGCYLZPbzOCgCQcqRZWi+FEbufqOw1IO7CrcFlWq7gKW
	yP2BpvWYq/4OejWoyvRdNxM6holNGBDXGrbIKTlWMXz9oTnlY7+isU+K0dH6CYv9acvwlkauOUz
	d7DKz5BIjiJ1DVLyO7aJ5FCeRILuvLYtbYj6QQVeXUX0f/q26V9vWa5iFf0JYxtOzl2AI/u8xKd
	nsdtTQRe+JaeOf0kFChdeviAtq683XsyFImxQgBNfaIFTwrTx+xlJvX4krdKmErdYa/bjNz9kAG
	w/1Ho5ICtfZW5qwx3Mv8c7dTk6dw8yEYiKiU7IlqD4ILPHGBp6uBXa3xlOco5X1wF82GcSL/bON
	iRBfnxozFeAetqThYFMbYc94o/9Rl6OYlCKoFLck/14Dy8+cvaJgrpVoGm3oHECE/sGoPr3L5n4
	N8FbqF3z5Y7SFwuZOBACfgb3b/Adn4pDICcr35F4WHVc4Yg5hpkf2A
X-Google-Smtp-Source: AGHT+IFDgJZwNEBeeKwBL3wo6S2qUd5lDxhYjadobhv5i0Xz6F5uVOsZEz3MvEz02kCvTGgmYV553w==
X-Received: by 2002:a05:7022:e80c:b0:11d:f44d:34db with SMTP id a92af1059eb24-121722ec1a5mr1842609c88.35.1766121841950;
        Thu, 18 Dec 2025 21:24:01 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:c932:b7cf:9dde:f662])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfdd0sm5033647c88.4.2025.12.18.21.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 21:24:00 -0800 (PST)
Date: Thu, 18 Dec 2025 21:23:57 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andreas Kemnade <andreas@kemnade.info>, Tony Lindgren <tony@atomide.com>, 
	Kevin Hilman <khilman@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v4 2/3] Input: twl4030 - add TWL603x power button
Message-ID: <waxqf7fshz6nyupfky3dgap4x7m6b2mwatouxvwvguwqdvdvop@ubehn3xzl5iy>
References: <20251106-twl6030-button-v4-0-fdf1aa6e1e9a@kernel.org>
 <20251106-twl6030-button-v4-2-fdf1aa6e1e9a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106-twl6030-button-v4-2-fdf1aa6e1e9a@kernel.org>

On Thu, Nov 06, 2025 at 10:00:26AM +0100, akemnade@kernel.org wrote:
> From: Andreas Kemnade <andreas@kemnade.info>
> 
> Like the TWL4030, these PMICs also have a power button feature, so extend
> the TWL4030 power button driver. As the irqchip of the TWL6030 mfd driver
> does not provide mask, unmask finctions, do it manually.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

Applied, thank you.

-- 
Dmitry

