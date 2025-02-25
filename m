Return-Path: <linux-input+bounces-10327-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF811A435D4
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 07:55:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ACB03179868
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 06:55:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8833A257AFC;
	Tue, 25 Feb 2025 06:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hArMpTSv"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F78F126C10;
	Tue, 25 Feb 2025 06:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740466541; cv=none; b=SsBy17nmCMglR63cnhOgOpcA7sDMarjtsSP/Ph1oQAhEAAFJxADvPQBIhw43RXZzpDvrIsTz11WdFiGBr3D9HbB5ODeYSdHE4qAwClm7yi7eueBM8TqRMlPUPFQYPZV3n+Q7t2NXI/kTYYK5ZThsoWWY2XiKGPYZRZ/g5gyCTRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740466541; c=relaxed/simple;
	bh=XdaHfHNVzH2DxfM7R+6reWaHUTDC4IadlQSZggIho7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cDSWy2NNMwaDEBYPv7y79pyTM3kwBygZEvFcczQBJqTcbGdbbr+Ylo8hyVJkUzRjCHNnRzXLBaUhqB1yBKCJin015JP51LYZluHoYM3SD29FgkjTXNg/H9Fjarxs2JkdaUDT6LvzdEQrMhFdDEabL+Q3OS/UgMBjR98FYKMSj6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hArMpTSv; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-220c8eb195aso3889145ad.0;
        Mon, 24 Feb 2025 22:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740466539; x=1741071339; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SK+sB2NYj3xrsqhJk5JpYZAhuhVIkEl/E3zvyx25wmA=;
        b=hArMpTSv04+UfpE5GIDtcEGfq+h/MWkRmvMiaZlmwxxOspsTmi7ByFrfc60/8DGH6r
         OnWBgo1oJjKVlekuSyKogo0RbHPGpNunDw3+8XfErepofzAkwVW5AB357OCxuMuDkzlR
         ZX2NwmuoWUBL4Te3jvy4OHAeH+UYxfZWxpNIVqcBhIhheKzJZVXe23lfb4qQjKt4PXHA
         x0xyKxVc9cqPFdXR3DUk+7CZ1wQQqbcKNA5UPttx9xNApn8iKrXxzzwC5brnlKRgjGY3
         DZmv/tMfG4vtawmvwLLnsxpFa9HacXaJPdgojycbhAyVjDYbsFzROobwHncnlWm00ldM
         J+ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740466539; x=1741071339;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SK+sB2NYj3xrsqhJk5JpYZAhuhVIkEl/E3zvyx25wmA=;
        b=T6+hjUDQDEEWoExPrCuJb8++xPeTLNhXXM0OAIPcic5iZ2YxkS2fvYbZzvwezi0Fu2
         HGJ02klFNR8UkFOAklkwbLLuJ9c2dsM5+NRsoBN1Knhrhplvsd1UbS1u8xbA8GQb5Zil
         oLX1Oh2REE4IGXQ8hB4Zvyf6zavJ6egv1M7yyxUcPd2oCvRP4+OHn2I9wFjvkh1SXw5C
         YBgfeiUR43xK1fI5ilAXJzQ4wcV4Ky/WAMOJ8gtfb2et0rQswB7kBz+wT5B3oZxWaqph
         B3LEQ11nOlQlv8tc1KTLAXSyCKSLMOrybadoYDiUP3cY9hv+7a2kWqq/JuPl/JlUjDg8
         V2NQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvld+zHmzsQE6r5Mdli/5XzitfgnVZqWTMo8H6tVwNa56cSYR6iUpYbIPAar99XFy7WglwHVyL0k5l7Fk=@vger.kernel.org, AJvYcCX/OzmCEF/82f/Dc2P8r2n05FHiUJ3TEzIGSyypbg6ozjMyFkpWNCpBRpi5CWZNTHhSVFZjZX8VoJRlAizY@vger.kernel.org, AJvYcCXvlAa2817DNkXRcIQZNU6QYxIyp0G6XhrbSyyFBbQZKcwlVMSVaBYnYIJ/D5Hs7Yk/BddggDKN6VZN@vger.kernel.org
X-Gm-Message-State: AOJu0YySSG1a2pTxcJbfZtHOYSx64ZCQEJeQcSQmPPB26lxrxWMpO0sZ
	yHgY7sSuowOSK6uUJNvwdvO20Z1DIN5UybXsooyJ46irV6ia4mgO
X-Gm-Gg: ASbGncsqFjycVmdsCREZ/oR1bH9n7u2z6FA/1WQbSTcmV/qDWLVXrIdzoT6Cmrm9kkp
	gHhI25aOIVKREC/DYYNHw4AHsfL31UP4Lj3z0d6ZsAhsuhMj1EoThW2osvfn1rTk8gbuB/+HkcX
	+lt4FOvCNLpl1ZKuN4ThEWF+7Whv2x0Ex+s2MIXI3jvFNsdNvuots9jnldWEhtW58Mx0QFzts5o
	GtDxhqcZ5oBrtNMilkq0GvqXlHeiEifQUEsx+xUKx2BCpiUV7jJQ4CsoI5HYgOjHmg9laJX49vf
	oxdQz0VEcpfZ3TRTfSIWnna0iaY=
X-Google-Smtp-Source: AGHT+IFK8dw+y+DNVUgtLr73+PNIRRyKNRO7yFn7L9Z/isc+4Mn2dvGrMONR/glLOu2wtdPi5Hixuw==
X-Received: by 2002:a17:903:2a8d:b0:21f:6584:2085 with SMTP id d9443c01a7336-2219ffc4928mr290706985ad.42.1740466539239;
        Mon, 24 Feb 2025 22:55:39 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:464c:6229:2280:227e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2230a0007dcsm7135085ad.1.2025.02.24.22.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 22:55:38 -0800 (PST)
Date: Mon, 24 Feb 2025 22:55:36 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Manuel Traut <manuel.traut@mt.com>
Cc: Markus Burri <markus.burri@mt.com>, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut@gmail.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/7] Input: matrix_keypad - use fsleep for variable
 delay duration
Message-ID: <Z71paM0nDwVj85ls@google.com>
References: <20250110054906.354296-1-markus.burri@mt.com>
 <20250110054906.354296-2-markus.burri@mt.com>
 <Z7YIKaG0jBHV2FSE@mt.com>
 <Z71l9046XyjxicFf@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z71l9046XyjxicFf@google.com>

On Mon, Feb 24, 2025 at 10:40:55PM -0800, Dmitry Torokhov wrote:
> On Wed, Feb 19, 2025 at 05:34:49PM +0100, Manuel Traut wrote:
> > On Fri, Jan 10, 2025 at 06:49:00AM +0100, Markus Burri wrote:
> > > The delay is retrieved from a device-tree property, so the duration is
> > > variable. fsleep guesses the best delay function based on duration.
> > > 
> > > see Documentation/timers/delay_sleep_functions.rst
> > > 
> > > Signed-off-by: Markus Burri <markus.burri@mt.com>
> > 
> > Reviewed-by: Manuel Traut <manuel.traut@mt.com> 
> 
> As I mentioned in other review activate_col() may be called in atomic
> context where we can not sleep:
> 
> "activate_col() may be called in atomic context, and if fsleep() turns
> into usleep_range() or msleep() we are going to have a bad time.
> 
> We should either stop using request_any_context_irq() or figure out if
> interrupt handler can sleep or not and adjust behavior properly."
> 
> Unfortunately this was completely ignored.

My apologies, it looks like it only is called from work handler, so my
comment was wrong.

Thanks.

-- 
Dmitry

