Return-Path: <linux-input+bounces-9203-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D2064A0C1B2
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 20:43:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E372A1888EDD
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 19:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 304161C760A;
	Mon, 13 Jan 2025 19:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LgjXsW5E"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11DC19922A
	for <linux-input@vger.kernel.org>; Mon, 13 Jan 2025 19:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736797386; cv=none; b=OIqwUCZ43W5EN8RvJkQCGD6o/5n1IwbvW2+Yrre29AbCuXreUB0+ZC/9QhrfxF5EmfnsXjp/f5hLkGAGudlH7gmwL9wAyFXx/i6e0//1nkinVxvnvZaY+YHc7hemCldfE46fgL01QGFEfPsUJHq5V3p0HN9X42FbeT9IgXca5k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736797386; c=relaxed/simple;
	bh=Yot+aH7KIXkjzXcAzLtUKxoF30UH6nhud2VRczQsntA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J+qAPLiGdC6PYeFU09rTlMxzXBUxb1K0Ru/YeeoV0sdBTSyJhHVFu3GkNjpL2cIQGFQyU1aHq4/bBYT2gxY4XUJXCxbF/dWbulGJCdzy0FdYZ8iXFEEsoBiPnH/tH8Tn0RWuNUqHc0foF8bu7kPE0MZkjbbq3nBnhMuo61HQQEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LgjXsW5E; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2163b0c09afso85729455ad.0
        for <linux-input@vger.kernel.org>; Mon, 13 Jan 2025 11:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736797384; x=1737402184; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bO08fomHs2oo6rrJvSFDaTUl5GjkHHQunP4xAJ//hq8=;
        b=LgjXsW5Ehkle6hCQwa+kmYmHa6rnkumRDiChjAhU3YCCw85EHE2nSooWHm1RSfxX3s
         TlbJqcE7vXi6i1iYjfS1K3FmLI1O/kkpZhZfdPJU7ccKKwh1OKdKYvrhFUWPbnIM9PZi
         oZufSDznbA7X83Aurm8PT6l/OlyqjNKs77k6O5A9ynzAefjWDuELSoXqSAq9FPhoQmbl
         VRCaKAc48/h05olgtnKLNDrd8jgiKUgafcNGS1WfIc9Lf5HZ8S2E/Gw4ISXakpWLxfq+
         ZxMv9s9CXT3uaD2TV64nyXWmgehmPG268VCBvUVt0cC4OngVAiM95i4OYHxiqiN/YY0j
         VStw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736797384; x=1737402184;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bO08fomHs2oo6rrJvSFDaTUl5GjkHHQunP4xAJ//hq8=;
        b=wtD0VYpcy6eU7I4LCimNXqYyEXi3vJ1PJ3eNbx7XNp27ZuTgF+yok/ffqCxcAjiUpT
         bVyPrPRzgq8DLGB8XpLHV0tE7l+/pj9GvZHXUAR3EbAZMeWSkZJmUag3vTWXOs2gnu1M
         YotOBzLpa9g8uHSA5QkZGgTFYGf2aK+UJsPDdl3QekqtGYmVEpUtx5fZ5n5jij6f2gSX
         c+aA9svga/8mAQhrYlqN2t0q+F7XBIuUKd1hiUG9tXDIzDWz56SFbCfkc8hdC7pUr5X6
         ZDaMX8/rVRXuaSEHIXBK2BoVhycDbB01VAjgqZ0ztAQnUuY6QkFX37xJp90MjSS7j6uO
         L1qg==
X-Gm-Message-State: AOJu0YysBMpWE9IheKBEBcTTTTCg2VhEA6luZcDdX8c1fTHPLcqejvLJ
	7z/OwaqfVFlcklbF+kx6AU294LozqoaD5fwdWdmfRTKKqG05OhGEl69gkw==
X-Gm-Gg: ASbGncv4lvzdM2oBLMBi+/xWTOwGiX2yml/hrCrimE6A1HOLtZMMmFOqTuDKYPee7DO
	fqcCQg5OjEkx6JDcI/GEehkYyi5fizjJp0lP/ipeBsCJT+JMWRFq1g4I6ICe+NSWwPpxjyKcdSG
	P3vVy0QPKl/DtDtndAFl1pcNq7MUuAHddwfA2qJb45Wz8SiIRdYpkPzgZVmgwczV4BnHTJufqwi
	WzRAeMFDtdy86Db3+t6XmKOPjn9U3dVtwg/bBniClHxZN6JR+mmCMK/Yg==
X-Google-Smtp-Source: AGHT+IGhpDPKq0fhPPNRi8oE7shIlr+NQi8RhXIlv/sZ0RJ7Q1z/vFXcvTon6dS/WS9p14ijFuFQxg==
X-Received: by 2002:a05:6a00:858b:b0:728:8c17:127d with SMTP id d2e1a72fcca58-72d21f2da93mr33783806b3a.8.1736797383848;
        Mon, 13 Jan 2025 11:43:03 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:2345:9641:c9a2:f3ca])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d40658d77sm6348241b3a.103.2025.01.13.11.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 11:43:03 -0800 (PST)
Date: Mon, 13 Jan 2025 11:43:00 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: linux-input@vger.kernel.org, Michael <mksgong@gmail.com>,
	Nick Dyer <nick@shmanahar.org>
Subject: Re: [PATCH] Input: atmel_mxt_ts - support KoD knob
Message-ID: <Z4VsxKJ56jqQnZGr@google.com>
References: <20241223190416.52871-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241223190416.52871-1-marex@denx.de>

On Mon, Dec 23, 2024 at 08:03:24PM +0100, Marek Vasut wrote:
> Add support for T152 KoD knob events [1]. The KoD touch controller
> family supports up to two knobs attached to the glass. Each knob can
> be turned in either direction and the touch controller processes the
> event and reports the knob position for each knob. Each knob is also
> pressure sensitive, the pressure is reported as well. Each knob also
> supports center press and additional buttons, which are reported as
> BTN_0/BTN_1 for the center press for each knob, and BTN_A/BTN_B for
> the additional buttons on the knob.
> 
> The knob is similar to Dell Canvas 27 knob already supported by
> hid-multitouch, except it is non-removable and there can be up to
> two such knobs .
> 
> This implementation is extracted and heavily reworked from Atmel
> downstream patchset work by Michael <mksgong@gmail.com> from [2]
> branch master as of commit 9c77fbf32982 ("Merge pull request #35
> from atmel-maxtouch/20240103_HA_protocol_fixes").
> 
> [1] https://www.microchip.com/en-us/products/touch-and-gesture/maxtouch-touchscreen-controllers/kod-family
> [2] https://github.com/atmel-maxtouch/maXTouch_linux
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Note: I am not sure whether reporting the second wheel as GAS/REL_HWHEEL
>       is the right thing to do, I don't think it is. Maybe there is some
>       better way to handle multiple knobs ?

How about creating separate input devices for these?

Thanks.

-- 
Dmitry

