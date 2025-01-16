Return-Path: <linux-input+bounces-9283-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B84A1417C
	for <lists+linux-input@lfdr.de>; Thu, 16 Jan 2025 19:15:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54CE9188CBE1
	for <lists+linux-input@lfdr.de>; Thu, 16 Jan 2025 18:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6296022C356;
	Thu, 16 Jan 2025 18:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AMnT3rIK"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A4F159596;
	Thu, 16 Jan 2025 18:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737051340; cv=none; b=RXLtQbBVrBT514jq0U90n1U6oPBoGdNUl7PrVOe2RNeecoEN6kdJECYtwgJqXoQAsNVOeKYcDYWoTtOlZDCMheexfMrCWIphBoCLU8m4oRMJywSCxENJ1RTn800CcmjpWJ/bEL4oGeEMAa5pllJMr05KzUEEZZAfnPgR6Ir95XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737051340; c=relaxed/simple;
	bh=KptHDReiAuAVut0TbIhwrjmU//EamaUBcbLJsjyU1Rw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XvwZ6XsAKM7fxQXbWFSvikmjhvWpufjoIJTTdhctpIr578KUerK8jkfZ0WCYpzQw/HBEHbVi2rjBNHg4bQUNBAz3k5z8r2rYnBxifqvyDt8L1xER3hwjhJ9bWyDuGJ83+ub7jYc4JLRcuJcE2Ifb4L2SjtvRxEnVohdKG0xRYWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AMnT3rIK; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-216281bc30fso29199985ad.0;
        Thu, 16 Jan 2025 10:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737051338; x=1737656138; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rtOVxbgChZ7onBpUetKBIJWrka8DDr9EfUQBHMNVzrA=;
        b=AMnT3rIKJrQ2kbRWkw6pDVecQN/laUvARgc4fdgGM5cBNIlg9WhEdIfiGa0W3hWLcq
         yD3z2XWXwxa87eUZOH48HcAgvCZMWWfTFanKayD03NyIvFdyVHbf7IQF2pLmBFBlTaeE
         GaNicNv0mqJy3eexUV+8neAnfZ8eAsNYHmtQIVIft6lj1lxbVyEU2soAydqwF06ocqkf
         QQALNSupsQqpkaZvICwPPpBjj5mK57ubh58Ol8iYoe5VCpMghJBY21iJVWVwoXocryLt
         aEsPeCsJjIe7mNH6WHwV+BeVH6SxB+Fxl03NPHK9ZqKEXXMfEd/cgiPs3FZJqN/MMfRC
         4Q3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737051338; x=1737656138;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rtOVxbgChZ7onBpUetKBIJWrka8DDr9EfUQBHMNVzrA=;
        b=arH4ThnW83lBp8ZCAn8k+BqYjbjnTXpGAHzEMh+3Is9sTM81ge6kEeDwtW1LVmyDvy
         5pSHVSTKc+4ROITCyBsazO4dTznoqT8AXSG6Fc3YAMyy45RB3hmNmonQI5+OZmo2Cjza
         Tn4P93MoY9Mu3UXr+tVq/SiV8GaQ35gquTril934YxlenTggEuvIOPwN2zd4gxSiB6rV
         AbSB48w4w0xQ67LW04aGlshwUl2xy1x0QvgZeNqcKeI7qZcGMkxp9QMFkGm85ZtnxYsr
         SNwXTpe/DgXXjA/fBghjdVwOHPHbtHkaZYqq/Oa80FYowduDBssDaxbiOAnFW+Z2Lr6t
         IwNA==
X-Forwarded-Encrypted: i=1; AJvYcCWxl0RnWNMGkMuWKYFBfcrwlT4O+lqR264/EfCR7EZ/z6l4Jsv5tUFj7bhM28SRDlbd9XQzVJLvzOKi7l8=@vger.kernel.org, AJvYcCX+R1X5/srsnVhoH6n4F9xW2KoKMtSchLIjm/yo5rdyzawlEzA0gopEGpkGD/3SPmFt7hxSkTdi2U2v523w@vger.kernel.org, AJvYcCXwEVF5WcwQpWN34L0kZyrL2UkUskoCRLwAp6o6FDVxs3M8tGTV8opVBcOEuQl6SdGjEKnrB87S/eWQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyYy0vImdkHP5Tkweg+hYDKiMG/Z5p93j6uEjzIbyeg7mcChaHK
	yVKvNLcY8TW4o0Z4S/ZeydwKyxpfpNTtRx0CD3JoGTLG+bqHupCT
X-Gm-Gg: ASbGncvLWxpfVH2ZCpFhxTUFY7lvNXS8fjE6EAcJ2Svh6jTsvJA8shZPmhDMSFYJDHB
	/dYJinXPR28t2tIgOZWI5XrDFEq3FrzzI+6U9Rv3H/8LF4qfNZCtVFsRsw1spCoMzUJ2i13nsDZ
	+yAdcH783HGphrp4zH9Zux0GS1bBKvzsxMpNE+D7aIMIQRuthi7LTVTWN6s2/VD+qWZn6y+7N5C
	ZPE3OcATRuGt2ufnPJYM/K53RmSbzhJCx9KY09fzwOLRCO8Gp+X4hytRQ==
X-Google-Smtp-Source: AGHT+IGdo5ig12ulCIg57VUHccD9Uy0qJdr/79Z8+d6H17KB/rpCQR7jmI4tw4oL7Fnmr9aw5T6/Xg==
X-Received: by 2002:a17:902:da82:b0:217:803a:e47a with SMTP id d9443c01a7336-21a83f3eff2mr499223585ad.4.1737051336701;
        Thu, 16 Jan 2025 10:15:36 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:a7ea:d193:fb69:2f82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f77611f0a0sm438250a91.6.2025.01.16.10.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 10:15:36 -0800 (PST)
Date: Thu, 16 Jan 2025 10:15:33 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: devnull+fnkl.kernel.gmail.com@kernel.org, alyssa@rosenzweig.io,
	asahi@lists.linux.dev, conor+dt@kernel.org,
	devicetree@vger.kernel.org, fnkl.kernel@gmail.com, j@jannau.net,
	krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	marcan@marcan.st, neal@gompa.dev, robh@kernel.org,
	rydberg@bitmath.org, sven@svenpeter.dev
Subject: Re: [PATCH v4 2/4] input: apple_z2: Add a driver for Apple Z2
 touchscreens
Message-ID: <Z4lMxdFWrZorX0h2@google.com>
References: <20250115-z2-v4-0-d7361ab16ba0@gmail.com>
 <20250115-z2-v4-2-d7361ab16ba0@gmail.com>
 <3991ab78-d1a2-4cae-bea5-fb4dfa58aba3@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3991ab78-d1a2-4cae-bea5-fb4dfa58aba3@wanadoo.fr>

On Thu, Jan 16, 2025 at 07:03:13PM +0100, Christophe JAILLET wrote:
> Le 15/01/2025 à 23:46, Sasha Finkelstein via B4 Relay a écrit :
> 
> > +
> > +	/* Wait for device reset to finish */
> > +	usleep_range(5000, 10000);
> > +	error = apple_z2_boot(z2);
> > +	if (error)
> > +		return error;
> > +	return 0;
> 
> Nitpick: These 4 lines could be just:
> 	return apple_z2_boot(z2);

The current form is actually my preference - if a function has multiple
points of failure then do

	error = action(...);
	if (error)
		return error;

everywhere with final "return 0;" at the end. This way it is easier to
rearrange code if needed.

Thanks.

-- 
Dmitry

