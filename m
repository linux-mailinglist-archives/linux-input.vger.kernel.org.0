Return-Path: <linux-input+bounces-15892-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBCFC38199
	for <lists+linux-input@lfdr.de>; Wed, 05 Nov 2025 22:50:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3323E18C71AA
	for <lists+linux-input@lfdr.de>; Wed,  5 Nov 2025 21:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D667F2BDC23;
	Wed,  5 Nov 2025 21:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F+vTp1W4"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE4529992A
	for <linux-input@vger.kernel.org>; Wed,  5 Nov 2025 21:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762379427; cv=none; b=F6d8eJDA+IHLTWR5TjGxD1CNIRlAXCc3n3ynHQ//sdVEZ4acrGhxwgiBQk9kGi2tIS2AvMUTFHHYVDzHEGR7g1NxTsyqB7KJqUa7mHwcyKlo3J+4M8O7dt+Io5o8VxmhvpL30TOHAi9H8aj8bVsg9a9EA9GCYVv41zOevAgAAp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762379427; c=relaxed/simple;
	bh=gZ380I0iSEejLLF800fnaHD9+ZfISv/wsUJeZNhR7Rs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GkUoosACavXRDteE91wjUmyZ1AvhO11ZXIyGmljDxvnIVDrvneMoSTlD5Xez2qNPvbwGSkNnFGWFy/xQhNUMZofnBZOb+AvvRfEG+5iiwpf+K2pvK/uFJ4L32w+QaY3jN2m8XaFT+ifsSMMqY7AH4QtgqK1WDyGCEmiu1w3Y4OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F+vTp1W4; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-28a5b8b12a1so3607585ad.0
        for <linux-input@vger.kernel.org>; Wed, 05 Nov 2025 13:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762379425; x=1762984225; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GkJz9g+z54wExynUelx6wglM9y0gBWoZJbd4IPl+Sqg=;
        b=F+vTp1W4SoFJpnBf+kqRgFwXPXlt/dZvyg1FDJwgoyuYnMTbx7s5ueeO2aoOqlfFRc
         D4yX863oBEOeAQWV/VCb/YxxXK6Js1rY6V4Lnjc7wWQwlHIZM50e8pLQj1nTjaSyXUDQ
         cGbBBrRTH2AevK+H4nY7/JX+1WIOT1xJRa7XZE0fQv47I8nM/KkEq4Zn/WGWyPeSBaSl
         tAFMbz0FkDnraREtgzcePy1dQ0/ubTu5nKE3mwQr9JasANzWsUdGlM2o111woPRPzjDu
         8Cyb1b+pkr5OrpRuadkEm5G7RjoujnbPHlGprfiX2dM5/13iMtxqL98RhSPwq8YE3epq
         buEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762379425; x=1762984225;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GkJz9g+z54wExynUelx6wglM9y0gBWoZJbd4IPl+Sqg=;
        b=cLSSJjnLF7Kv4Jys5slv19EZFT0IU2L0oVW7C93C03Rc0gKJbI+xTvNtYLI2UniRVH
         EZ9cAtwYOX7zwOwLkby3PTgnakUE7imH0GFupz3VFyZ+L+HciPYjiR2G+obXApaMTgWO
         HYJ8GM7Nk6yDxhfq5M3ZYBh+ustAFZ5eakBFOJaavk/FbOyftVKtTj+71B1yvD1T7Bmv
         +yNmafK1k+I4ea7epdmP0RkpDgl00U2uEwhvSv2angjrv8yKVwAhZagsaHu+z8jCDfz+
         qfwRT+LAMYrjTL5B9UT8g4sDqLyfFD8m9tvq2NnziZgljkFU9Kv6Vzj6TnRWjM6HmA8Z
         BZ/A==
X-Forwarded-Encrypted: i=1; AJvYcCUJcOVdBMMZs6UmXr5HVmCw0V3m6bsGNJ3Sj0Pd2wRjFK6K48C0932zsOLYYXrUut4EEfD60/FRPqT2yA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzegoSIlvD6DosPCZ2ZaARnEwQ2ID4vtfuE/2Xdm+qeZGOMUlPb
	ATMVWl1B3b6M+MYlaQj/LubjaGyK0vPb8ouK/Py6M2DV3F5r91Jxei86
X-Gm-Gg: ASbGnctn+arDpCZR6iyYDEan1NAcf/puW6KSU3ypkDIhF9Zl8wsjfO8j/18q/WLMu+o
	t9BWGVi7FfXiaRknh8UJ3F3zvBYXuDolXGBq/87vDNTtq7cwdEz7zdtdn0zDkRFn7ak/NfYhUIz
	Kp+DqStbUC9bCwXparr/z2j07+97CYBhTWNPhuUh7Udhz1S1AwvedwigOMmHm9J4Z7yTjWFe3rn
	kzyPB3/ikJgJBgH2JGvJcdcsDRZcZSHgv4dSN37drZzZJhr2pJfxZ7KjP28NIYWGMaJniyP4Dn9
	OPLkjXijpQAk1mlpZR1SdFdkrp0PNr0smycNWWQQHpDQM61NgH4mUYeknoMIOHvDq1QQ7gmIxmH
	51v/g7mdEUGkX1NV5gTV7I7sl6PtkKj7Gm+702+kPhOOzq9zn7O5Lf5ASKfTNdwvW77Q49ApOvc
	2fGPaUo4iTVYxmuiTOJvMZt+dMiVlJSqjIOjHRhgZFZw==
X-Google-Smtp-Source: AGHT+IFMkzfsbijd+VCoID/c6AsM0dQ38208M4pgSEwiraeFpdyxx2AcFvyuO/wBvwY6fhwy/w0BQw==
X-Received: by 2002:a17:903:1ce:b0:294:ecba:c7f with SMTP id d9443c01a7336-2962adb9771mr69381825ad.48.1762379425495;
        Wed, 05 Nov 2025 13:50:25 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:35dd:7def:e1d1:adfe])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651045bf0sm5331095ad.48.2025.11.05.13.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 13:50:25 -0800 (PST)
Date: Wed, 5 Nov 2025 13:50:22 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Peter Hutterer <peter.hutterer@who-t.net>
Cc: Jonathan Denose <jdenose@google.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>, 
	Sean O'Brien <seobrien@google.com>, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2] Documentation: input: expand
 INPUT_PROP_HAPTIC_TOUCHPAD to all pressure pads
Message-ID: <7h77umivuixhxkktdcypzthlrm6xll4524e4dy3cb54iljeox6@guwqyvx2e2pg>
References: <20251030011735.GA969565@quokka>
 <20251031041245.GA1316325@quokka>
 <ueksimssfw7eqxa5mfmxruj2ghtuncznhbgdxvoorjf6jhjfhk@hsuapbn3kie3>
 <20251105060333.GA2615904@quokka>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105060333.GA2615904@quokka>

On Wed, Nov 05, 2025 at 04:03:33PM +1000, Peter Hutterer wrote:
> On Tue, Nov 04, 2025 at 09:09:09PM -0800, Dmitry Torokhov wrote:
> > Hi Peter,
> > 
> > On Fri, Oct 31, 2025 at 02:12:45PM +1000, Peter Hutterer wrote:
> > > Definition: "pressure pad" used here as all touchpads that use physical
> > > pressure to convert to click without physical hinges. Also called haptic
> > > touchpads in general parlance, Synaptics calls them ForcePads.
> > > 
> > > Most (all?) pressure pads are currently advertised as
> > > INPUT_PROP_BUTTONPAD. The suggestion to identify them as pressure pads
> > > by defining the resolution on ABS_MT_PRESSURE has been in the docs since
> > > commit 20ccc8dd38a3 ("Documentation: input: define
> > > ABS_PRESSURE/ABS_MT_PRESSURE resolution as grams") but few devices
> > > provide this information.
> > > 
> > > In userspace it's thus impossible to determine whether a device is a
> > > true pressure pad (pressure equals pressure) or a normal clickpad with
> > > (pressure equals finger size).
> > > 
> > > Commit 7075ae4ac9db ("Input: add INPUT_PROP_HAPTIC_TOUCHPAD") introduces
> > > INPUT_PROP_HAPTIC_TOUCHPAD but restricted it to those touchpads that
> > > have support for userspace-controlled effects. Let's expand that
> > > definition to include all haptic touchpads (pressure pads) since those
> > > that do support FF effects can be identified by the presence of the
> > > FF_HAPTIC bit.
> > > 
> > > This means:
> > > - clickpad: INPUT_PROP_BUTTONPAD
> > > - pressurepad: INPUT_PROP_BUTTONPAD + INPUT_PROP_HAPTIC_TOUCHPAD
> > > - pressurepad with haptics:
> > >   INPUT_PROP_BUTTONPAD + INPUT_PROP_HAPTIC_TOUCHPAD + FF_HAPTIC
> > 
> > Should we maybe rename it to INPUT_PROP_PRESSURE_TOUCHPAD? We are within
> > a release of introducing it, so we should be able to rename it without
> > much fallout.
> 
> I'd be happy with a rename too. Want me to send a patch for that or do
> you want to rename it locally during applying?

Please send the updated patch for input.h along with updated
documentation.

Thanks.

-- 
Dmitry

