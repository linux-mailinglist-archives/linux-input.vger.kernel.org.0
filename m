Return-Path: <linux-input+bounces-12447-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A75ABC491
	for <lists+linux-input@lfdr.de>; Mon, 19 May 2025 18:33:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9F457A1241
	for <lists+linux-input@lfdr.de>; Mon, 19 May 2025 16:32:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A946B287512;
	Mon, 19 May 2025 16:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X3I30S4Q"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AE1287501;
	Mon, 19 May 2025 16:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747672342; cv=none; b=sQI/C66/aZ6jpzMAR7hBUTWhfTwJty+thFUn/cyyzSsxYHf4EHapQF6P+fxtxzjrtEZ+Vur3FVy7Gt+R1szhmGR8QNODv/tgadsZydAPozLkOd52VPuSSxgvkAO/7wc2lPo3GWRkBFInDUTFPA81R6byX0mhPZj8SubtOjiWDwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747672342; c=relaxed/simple;
	bh=RpJR+P7r38vulz/L3fQvvYF1xiqu9aH5y9M/TZHJasY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h98Teun0PDoUA2PWZThmsIlBy6geFb1IGtmcOzqN2fLXvxp4I6DwV0LHQVX5NJf1IfNEOC/CdCOnRlQY35sxqOgbDrApg7ImcOlXcNJ2nTnNB9pyjc1w8Y7+aWPJ4Znfj1XXQLNNl6M8mveN525fliOvdtbOExmlRI6RboZDiRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X3I30S4Q; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b1fd59851baso2830425a12.0;
        Mon, 19 May 2025 09:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747672340; x=1748277140; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ghCBvCmhF7SDcyaA7/n+ORvRGKdagU76gRhYlNhP+8A=;
        b=X3I30S4QJpIunyaqo+/qjEfwjzTtcWafwfPtB425pds6QDRoOnn0amHFeiMiXLMnEM
         seIwT99awXUKhNJZ/xdB0EvC7UrpWHkxByE9BcwOv6hiztgj7Ts2HzJDbxFyPKAxRN0f
         aehiitqmI3Um0uuP6r3X++BzQ98dXbwR8TQakygEGXmVUOhx8dcjG4SsOnJa8LKWa72Y
         UUheBWnCBAkCBvXJieuusvUH4irxgUL4c3bux7+4eDVci4cXr0SMk14t19pKVG7PLi4w
         LWqmYIasHc/cKPYQr4+JeMW7GHUfl39hxSUSCdIZJm3IktjxjP1FgsxlAmdwQHOPaO4o
         mxYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747672340; x=1748277140;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ghCBvCmhF7SDcyaA7/n+ORvRGKdagU76gRhYlNhP+8A=;
        b=hUy4Y3qBvsgwsemAmem8zHg+6AetX0Tw2BB3Tq95WlDTcHHYqsB6rPInINdKQLZZsD
         kqo6a79yoFfeYD4NWCwdQWAFCRJ92mZp+w+kDLBnkvTKl6xj58GRAhAJIPLU2X+1D1ye
         yJVXrmS1LZMDvLIup2LBzPDj5twiJ1HP5KRC/DLFBHU40IYR7Nz2Fpwz7Zvj2XGRK0oc
         VZpd3rvMXAlauirLeSl+I/mu+KxWYM94JFxExE/4TfcFfIt6neBj8SO1JIO4XczzQJ7P
         8dYllfu1d9M672VZpBajWebiJC4a8/8hkse01iP1qwoiVQvtit+5SmmRxNjKufM9ErM1
         XkXA==
X-Forwarded-Encrypted: i=1; AJvYcCXiDGIHkaeXFwcS+ALu9d66I+0cWZpKpibL9pVBatgdx4gQ1PIplhIoPVf1Toexf5P1gVNCLMK+mDNDE6I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpyMXW6SXxiqSNYCZhavXpP0/acF0XWUsqUhPzGPg2HBJztwm3
	VLHLuMREDrukPrn9OAXb2Iqt4+bK1flx4rOrdHmBzZnPohWZxk6rudhsK7PUYQ==
X-Gm-Gg: ASbGncvKpQITGDvS29Yib3V38x/XMnpjnGxPi7HSZfNALCYKjPi3cFiOg+B3Ypju/OQ
	f3UWFD5FS7yBBtIHIa5c/ocItim/5V6SfdeBONg2OLIrPC0TMhYzC69LKUFoLO3xNmXg3RfqxmG
	IF5F26XWNLCl5rUp0NkRLpGNdo+APUEzpeI3ocRwkSL49dG5rkTI74gi1pYx+ESC+jb3ByDPeGz
	/bF2TtDHHQlSzxqhwtCAKcXedjJjS+IOPwh8RLmPU6hmn8B4/VAQ0zbYtWxqM7OvavLnCZSUurR
	d8d7V8gJRbu1H+Og0T0j/g64I3HPZzExOKnLrKwOprxHIxeW6g==
X-Google-Smtp-Source: AGHT+IG9m/8bbFFKLMMDpyFdsBIzfzWV0oI/072VL++MQWffZmIUXG9slCuAxKlwrm9ebA5DzJWJvg==
X-Received: by 2002:a17:903:230b:b0:224:10a2:cae7 with SMTP id d9443c01a7336-231de370f6bmr202892875ad.40.1747672339921;
        Mon, 19 May 2025 09:32:19 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:e134:a6aa:27:6156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ac9fbdsm62168085ad.50.2025.05.19.09.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 09:32:19 -0700 (PDT)
Date: Mon, 19 May 2025 09:32:17 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Apoorv Parle <apparle@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/1] Input: xpad - add disable_xboxone module parameter
Message-ID: <naxnt42hmvorqkif3pu4x36tpo44ugo2oiblrbtlrauucm5di2@tr2yobgoywmm>
References: <20250517105045.70998-1-apparle@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517105045.70998-1-apparle@gmail.com>

Hi Apoorv,

On Sat, May 17, 2025 at 03:50:44AM -0700, Apoorv Parle wrote:
> Hi,
> 
> This patch adds a `disable_xboxone` module parameter to the xpad driver,
> allowing users to prevent xpad from binding to Xbox One and Series X|S
> devices (XTYPE_XBOXONE). This is especially useful for users who wish to
> use the out-of-tree `xone` driver (https://github.com/dlundqvist/xone) .
> 
> Currently, there is no in-tree driver that supports Xbox wireless dongles;
> the only option is the out-of-tree `xone` project which implements the GIP
> protocol. The `xone` project itself, or similar functionality  cannot be
> easily upstreamed due to the unclear legality of redistributing the
> required Microsoft firmware. This patch lets users avoid device conflicts
> and run both drivers side by side, without having to patch or fork xpad
> (eg: https://github.com/medusalix/xpad-noone) for each kernel update.

I believe this can be achieved from userspace by unbinding the original
xbox driver and binding the alternative driver via sysfs, no kernel
changes needed.

Thanks.

-- 
Dmitry

