Return-Path: <linux-input+bounces-8000-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B21179C367B
	for <lists+linux-input@lfdr.de>; Mon, 11 Nov 2024 03:23:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78031280C57
	for <lists+linux-input@lfdr.de>; Mon, 11 Nov 2024 02:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B0B628691;
	Mon, 11 Nov 2024 02:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k9Fxkbyv"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A015117F7;
	Mon, 11 Nov 2024 02:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731291778; cv=none; b=uGvGkhlIWMT8ePyOWc/2Ee75UdX+yWDmyG03htDMuH5mdJ/F3RPxvcAxRUCpYsP/3IXFbM4zlArDs/wgkPGgwx+AtS+1PyfwYOf7B5aDqfVzK//sj1KyNzW2WoqaFtsSL9e0lQ+0WjnR0pc1oT53D08Qi9IrY51+FjkO+cCwIDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731291778; c=relaxed/simple;
	bh=DFU80hu4aSCvH3gE4MhR9lWMnEwlm9RxIA9PrkTTXaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=igVVUtSLLtaCJrKx0/NdM87Xh3Im8IGb8b7gCVakyan0FH1cut0+ZGXYcPZIVCezh+HTmzWgETkjA5Dc+ZsTyH3R7mhmMVBvfLShlxmKTL+OJcAZ9gk8EuxAEr2Ee8xz9PErCg9CKfnypqG1O+OBG2PwK4xT3zNw/tFXdA67NU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k9Fxkbyv; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7ae3d7222d4so2949933a12.3;
        Sun, 10 Nov 2024 18:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731291776; x=1731896576; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Oucybay74xSvcru5zhRgZfUpvUkSoOJayt+l+ExV+yU=;
        b=k9Fxkbyv7iCCsmMU4eQvxgAYr9wl7APs+1zu453Px3ZEDCRxJFxxJBHlRAMa9HO6ZJ
         u3ZdlCDDr6Ug2hMssB0cvhxQW3gvMFhGr84Iug2f786XC4VDCUGC1SwhL2EzjntEZJ9b
         nUa1wC41UAtVCr7kjtSdy4rFHGa+oSaQB47jR/gAWvtl8yzsLFpOH8Q47ck9rH6KWLeC
         zzdAjCIdlfgMcAUJH6Hj/uL2zRMfmi0+eFhVuG0i9npD/JiPEtXQ9PnXfapMgUyBY+VS
         Kq/RAxtvgEWQx3cKLdFK6JsXDsd/N6uDgUUbw639Z9gS0t9qUHe2tbDY/b6Pr0nhBD3m
         xq7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731291776; x=1731896576;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Oucybay74xSvcru5zhRgZfUpvUkSoOJayt+l+ExV+yU=;
        b=jShKqCQ1erDFyT2NLtByuT2TPugoC6HFJKxbPebCXVblOYKq8rdQG/3U4/IS5pZtzc
         0CJh//mlXxEupPz+pgWXPWHycZrElYzmKF9feOAgiVE+Et+2SqpidF5AwuVJyf7f+5JW
         B/GzuFtff+E3LYpvsPJYx5NM0bA1Chorv1M1aalMoK6jmXlrLLmG55SxgGt6ls+mRgro
         i/gBQjFMMQoE2fylgLhp9vqcbpwKkLAaPNrrtCI9dA8uY9krTDqAYqaWRmcILqESCldn
         5qTRm0qfxOS6F05zyytuEE5LVjxRrIZMl5blsek5vC7h9qycjQshKFee0QitqmX+LZak
         HmYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxbIy7oEHurmnUKKf6chDnVuBf/4aHEcKUywPTUwi1PtnKrv+/7a8B5KObucZyF4Q6HGricCNaLC6Ovfc=@vger.kernel.org, AJvYcCWEnX447E3Lc7y/lH6eJqIt8n5U5xUhMDsOREUvfWd8ZuqlNAKswkUcOJCYKeiwExhiEz8t/2DX7JsG@vger.kernel.org, AJvYcCWGjizvISC79GRl+wI8HPoSycsDMmOWw8jSscRqWbFaZWZoUcD2o50kIBBDiWjB9ZDsXNd72WLF12fduDyl@vger.kernel.org
X-Gm-Message-State: AOJu0YwC07ZVqamKQ3kj9K3BSzLKiPiUN7TDSagNitnK61f3aFpDCqVW
	GaXIk2MiOGz1xTBbZLiMc/mJByqu5G2Q7A/a5OXogzg9Dq8qO5/Hq7XpD2vWGBk=
X-Google-Smtp-Source: AGHT+IGWZj/uaiIgTdQoIyYusuzxX4LOWbFhJrQdxwTlXkyDDFQgr33N0tyzed7LHKODGco3kFqh0Q==
X-Received: by 2002:a17:902:d48a:b0:20c:e5b5:608a with SMTP id d9443c01a7336-211834dfb92mr174000265ad.5.1731291775785;
        Sun, 10 Nov 2024 18:22:55 -0800 (PST)
Received: from ux-UP-WHL01 (mailgw01.goodix.com. [45.117.96.243])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e4205esm65973225ad.151.2024.11.10.18.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2024 18:22:55 -0800 (PST)
Date: Mon, 11 Nov 2024 10:22:49 +0800
From: Charles Wang <charles.goodix@gmail.com>
To: Doug Anderson <dianders@chromium.org>
Cc: krzk@kernel.org, hbarnor@chromium.org, conor.dooley@microchip.com,
	dmitry.torokhov@gmail.com, jikos@kernel.org, bentiss@kernel.org,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] dt-bindings: input: Goodix GT7986U SPI HID
 Touchscreen
Message-ID: <ZzFqeXhcJLYZyy0D@ux-UP-WHL01>
References: <20241108120311.87795-1-charles.goodix@gmail.com>
 <CAD=FV=WNcdbdn4tzNyVWaZugma3RdqmvTPa2NsTyuhH4yA3Raw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=WNcdbdn4tzNyVWaZugma3RdqmvTPa2NsTyuhH4yA3Raw@mail.gmail.com>

Hi Doug,

On Fri, Nov 08, 2024 at 07:11:27AM -0800, Doug Anderson wrote:
> Hi,
> 
> On Fri, Nov 8, 2024 at 4:03 AM Charles Wang <charles.goodix@gmail.com> wrote:
> >
> > The Goodix GT7986U touch controller report touch data according to the
> > HID protocol through the SPI bus. However, it is incompatible with
> > Microsoft's HID-over-SPI protocol.
> >
> > The patchset introduces the following two changes:
> > 1) Add goodix,gt7986u-spifw.yaml.
> > 2) Drop the 'goodix,hid-report-addr' property.
> >
> > Signed-off-by: Charles Wang <charles.goodix@gmail.com>
> > ---
> > Changes in v3:
> > - Split the commit into two patches.
> 
> LOL, this isn't what I meant. You should have one patch adding the
> proper bindings, but you need a second patch to _the "driver_. Right
> now the driver (AKA the file "drivers/hid/hid-goodix-spi.c" in Linux)
> is still looking for "goodix,hid-report-addr". The driver needs to be
> updated and that was what I was saying should be patch #2. You'll also
> need to fix the driver to update the compatible string it's looking
> for.
> 

Oops, my apologies for the misunderstanding!

Thanks,
Charles

