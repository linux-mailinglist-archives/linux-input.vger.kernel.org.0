Return-Path: <linux-input+bounces-5564-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD3A951291
	for <lists+linux-input@lfdr.de>; Wed, 14 Aug 2024 04:37:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C1E81C22B12
	for <lists+linux-input@lfdr.de>; Wed, 14 Aug 2024 02:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 847F41CF8A;
	Wed, 14 Aug 2024 02:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="THv6cgSN"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C21E1E4A4;
	Wed, 14 Aug 2024 02:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723603046; cv=none; b=kxYEYEyyiyp9ANOHrOJQSqDstVSHKbA+ew+3jk7SfL/gSWmrxsGJGnptPKV+e43x18GC5X+673BeQYw4ht4yh52puo5RwUzee5Pea7oVvd1f7hxF28HWX17J+NpbPnK5iIvLr7Z7v3g683BIQYySqjer4YzJDM5iY8/JuNb1v9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723603046; c=relaxed/simple;
	bh=OApqEV6maPpQpui7ajy/55/GMMJoDdDohmRLhY2ZBTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WU93D3Sacq9Rtfd38ssJUXydlf9RFLARDVYIJgYqd5IQCl+7G2wEBODGpz8pyH0a75tymw+otLTuybgwvjBxBFTkyo7COsBgUn6rXs7k8FSoHIWKeIPlpmhidIZyd4MxDGr+vHUCVIgmXB2lE0XoNRQDnEbtx5oCgd6XNmiTNvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=THv6cgSN; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1fc5296e214so59015505ad.0;
        Tue, 13 Aug 2024 19:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723603044; x=1724207844; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OYAc11FrYi5ME2cd4uxE9/C/0gkJLA+RUsUblLBxC38=;
        b=THv6cgSNQPZDYx48mYy3ewpy2TswqqblqCa5ztQWWkx/eXbNCm0iIPbo4pYdWpGUk5
         x3oEvNqjgJC8Kh09tp5HpXqZJY5zEQPAW7zm6kEdsz3SV4fbOTKgb5Mj/WCOiOAhL0jk
         OwtWge7K8WZCdxHkaDWTcQ07BSrPKYbIYdNYFMGF4BTnGiLv65qID+5oTqibgzElVmMU
         NAasDtPtdnhrudXorXCKBPgSXHyWlxD36HISrOefODN4wOioZaaYTo6uRgfE6q91D6bp
         R2T6c2g8f3uwEdSWvzRBpnQvLqZHEXqdQfIKk2d9wFzKi7ViqPCnVMTRska8gjx0T+Po
         Lg2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723603044; x=1724207844;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OYAc11FrYi5ME2cd4uxE9/C/0gkJLA+RUsUblLBxC38=;
        b=KXoNYi38bisQCraW84LhsYjeNtO0Z6QOOCJ/2+aPfBK9pmHMFEEOgah+RTON4f9UXS
         96ZIXUeAh/T3JaZGmTqWicoNO9bQu7NrkLzrKi/XCPJPtONZ+13ylZKKcAl5bropDy9p
         pqGkHghsxOnAA1qIL2BMqyoFKwF8FoI6IRmg0zurqlWihFlbAWQpmRYHJiOTgj81XCDd
         oVecBOEcmgmk1lakdvE/BepE7psfpM0TwRAxiUqyAn02/I9XhTOJPdZNydTyvea2GPAE
         78lYL9tx3JcXouJTNegARLXlcKem1o+49E7HZFdt0f/MeP0Ys+oRe1Ra7CXRDc3VifRV
         uh9w==
X-Forwarded-Encrypted: i=1; AJvYcCU3nZSLOpSlfu2HzFQLMDS/15V/HaL5WeVuhYaXPYKfk2DaV2Sa8oO2CFO9HZvEdBF3tlK7q0EDIYuUtsW0NVXpsVI8jZM2YPHNmbFfHsjrod0buZGuAAm//4vAa0LUhLSSr6SJnvip60ADiq9YRCi1DSxHZRjc6EY/3lGlprIZRFCxzWN5
X-Gm-Message-State: AOJu0Yw4cQiaue2wgT+564HJK55A0MEVvRosRoAkSc337XyuM2cj4w4y
	vfmi5cTgGlMpfSuFDJHmCWrpsale7zDhG/vv5ZJyfHC7lIa8dz4A
X-Google-Smtp-Source: AGHT+IEP6UvV1Ba+WOHUgrCz5v2z94n/x7VuVco8xNTHNBgM09NGjJPSvrmI/v2OZTK8y/i2BSCz5A==
X-Received: by 2002:a17:902:ecc9:b0:1fb:5a07:797f with SMTP id d9443c01a7336-201d638d9a9mr19684835ad.4.1723603044032;
        Tue, 13 Aug 2024 19:37:24 -0700 (PDT)
Received: from ux-UP-WHL01 (mailgw01.gttektw.com. [45.117.96.243])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201cd1e2a21sm19896095ad.308.2024.08.13.19.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 19:37:23 -0700 (PDT)
Date: Wed, 14 Aug 2024 10:37:17 +0800
From: Charles Wang <charles.goodix@gmail.com>
To: Doug Anderson <dianders@chromium.org>
Cc: dmitry.torokhov@gmail.com, dan.carpenter@linaro.org, conor@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, jikos@kernel.org,
	bentiss@kernel.org, hbarnor@chromium.org,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/2] dt-bindings: input: Goodix SPI HID Touchscreen
Message-ID: <ZrwYXajn3a6R8VOm@ux-UP-WHL01>
References: <20240813133612.49095-1-charles.goodix@gmail.com>
 <20240813133612.49095-3-charles.goodix@gmail.com>
 <CAD=FV=WLse_tiiMr8t7Kq0EguzJtt4iqhr6cPUvuDcy8MT0k7Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=WLse_tiiMr8t7Kq0EguzJtt4iqhr6cPUvuDcy8MT0k7Q@mail.gmail.com>

Hi Doug

Sorry for missing the "Reviewed-by" tag, will fix in v7.

On Tue, Aug 13, 2024 at 10:27:39AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Tue, Aug 13, 2024 at 6:37 AM Charles Wang <charles.goodix@gmail.com> wrote:
> >
> > The Goodix GT7986U touch controller report touch data according to the
> > HID protocol through the SPI bus. However, it is incompatible with
> > Microsoft's HID-over-SPI protocol.
> >
> > Signed-off-by: Charles Wang <charles.goodix@gmail.com>
> > ---
> >  .../bindings/input/goodix,gt7986u.yaml        | 71 +++++++++++++++++++
> >  1 file changed, 71 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
> 
> As a point of reference, in v5 Conor gave you his "Reviewed-by" tag
> [1] despite having some nits. It's usually expected that you could fix
> the nits and carry the Reviewed-by tag on the next version unless you
> did something other than what was requested in review feedback.
> 
> [1] https://lore.kernel.org/all/20240618-affluent-unroasted-e6d5d34d1ea2@spud/

Thanks,

Charles

