Return-Path: <linux-input+bounces-7820-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1849F9B8889
	for <lists+linux-input@lfdr.de>; Fri,  1 Nov 2024 02:33:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AD116B21A69
	for <lists+linux-input@lfdr.de>; Fri,  1 Nov 2024 01:33:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A21441C94;
	Fri,  1 Nov 2024 01:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HvXvVVJU"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6A027473;
	Fri,  1 Nov 2024 01:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730424788; cv=none; b=rB1gTHO1HivnvP5Ti6891VF0Ftfg0rYyZlBdGKRhyd76FfLp1lZN8aMcuQZXlA1hziQO44b1K3dgnKkesha7bThivkBsIhX5O6fYGC7E3m9VDzmgMY0CqLAXUM0hQ0soJ/FS8BdPD7NrCWvu9sgsuSWOY+f4J20Qf27u9Bg8Xz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730424788; c=relaxed/simple;
	bh=O6lboJrr01IMvPWw1zpJ/ANdJXLzJMZGqM3UuJyX86o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fTBlSOF44thV4jbXdpZ+h6k4r8Oa7Za9bDGtkuy4Cthzl2koiAILDlkzDcxaJoTAi9wTI+IsB9aJ8MYqU7OoUgHHwbSzySE0J3khzGnbk2f9NVw0ElHgWh6QDHDN8s3v63TLmLTDOix1lHIhvH/tf74WmZE7E2gUjb6P8VDgnoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HvXvVVJU; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4319399a411so13252115e9.2;
        Thu, 31 Oct 2024 18:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730424781; x=1731029581; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uHKga0L8y2abkF81SzSex52lW40WHTOqZfuKH4AI/zE=;
        b=HvXvVVJUIvttIarR3dMWLbt2CYu20yFXKz+bMqstEtYixUTqB6O6RVxI7MgyC0DiA9
         e2rpC/65MVjwcZcnW61ePRp0DYznm4jOoaVg+PnBDTvpurEXpONX/hvuDy9RbE4dE/ql
         jxCBEFUmGwn/6jw6TfLAQYToTI1XFciPOX0WNV643chnvI+NevtDagvTrtpNpWJxIhuz
         iqbjSyOMzDyhRv34Fo8H8BvvG5MZGlZpoheNF5uqQMRCVGZDXrGUgPlwZe1p4N2ucni+
         kFsFId0zj2gixbny+zgKMZHH2yfOeNyRGem7fkNUDz6cdOEEBvetiqxnQ2XHiN1nCCMD
         s8tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730424781; x=1731029581;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uHKga0L8y2abkF81SzSex52lW40WHTOqZfuKH4AI/zE=;
        b=sbcT/0wvFlBbeLwT6TPoa2X1W56INwO7QhrSu5K6uGcRKUK/xgXHLzbY4Yqyg6fh8c
         UG/Jxxtx1kFA9cNytha9requ8M77mNiabPQTA+uAAg7NyBudwWQIV2xX5o9hnE5rGhBl
         YXX8OV8ONvnsn3DsozW0t1jP5H05ZhHSNVyS3GAJ7pkaP21jRnQxD3CvR2RjN09RCUZa
         4OnW0a9Dcm2EZjRI5CYjUvrZ09o8dZXAecLeeLd02FRTsK6z2h2I8ZeVuUao4zJ/te0s
         1/WgeDX6jajjWLyuHtM7zPu7FbTTjpNl+piaxl/E7aGwdYTsJY1n/nyhQnHB1w1Mbqax
         xi+A==
X-Forwarded-Encrypted: i=1; AJvYcCU/gnb3/GqfNSOLb7IjVklBEcgjD3jTXW+OhZ9mA9nco9ZV2Rbi5ageT/qmRynz3V7cSgxc8mirZWNd0Yg=@vger.kernel.org, AJvYcCVcT4C3xt8HrdE8eHq9FLQ7mg2gUEKKLDhsADJUjcD3iJYYhEoNK2Hol650bVk7+GGxcTWQbPhWNsDj@vger.kernel.org, AJvYcCW0IIEzYELkd8OJCHd65Tu8leKkOA1eA2oCoL+ezIvy/8wwDVUpT4PRWSwx2FZE8Kv4kPJgOuPkSBsfV7fy@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxwhg3HtyxBRjKwklkEfSnqBTmt5O+TbUo+bgK9V7gR+zDbWOw
	3U91P6UxP8Osx8CVFnBpteLIWi3QypTAfSLOxc0YIfBUQFNtPgKm
X-Google-Smtp-Source: AGHT+IGr9crswomdsnORVLCkRiN3se+j33fXRBLa8UHABGYuBLyof+bBW96/7GeCdjQjkQfRoTWMGw==
X-Received: by 2002:a05:600c:4f03:b0:42c:ba83:3f0e with SMTP id 5b1f17b1804b1-4319ac7078dmr191766785e9.7.1730424780716;
        Thu, 31 Oct 2024 18:33:00 -0700 (PDT)
Received: from ux-UP-WHL01 (mailgw01.goodix.com. [45.117.96.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431b43ab29csm90355535e9.0.2024.10.31.18.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 18:33:00 -0700 (PDT)
Date: Fri, 1 Nov 2024 09:32:52 +0800
From: Charles Wang <charles.goodix@gmail.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, dmitry.torokhov@gmail.com,
	hbarnor@chromium.org, conor.dooley@microchip.com, jikos@kernel.org,
	bentiss@kernel.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: input: Goodix SPI HID Touchscreen
Message-ID: <ZyQvxKi8dYOv1AOg@ux-UP-WHL01>
References: <20241025114642.40793-2-charles.goodix@gmail.com>
 <3ypn62dsgarvmxkmdglugcinxmvpmhdqub2zvkygaonn54odf6@amfgijfcd3l3>
 <ZyLtYdwoJWx9FsdS@ux-UP-WHL01>
 <CAD=FV=UNKECLn=3VrjsJfA+HTNa9Gag1qw5jOcBvw7=ZtkZEnw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=UNKECLn=3VrjsJfA+HTNa9Gag1qw5jOcBvw7=ZtkZEnw@mail.gmail.com>

Hi Doug,

On Thu, Oct 31, 2024 at 10:58:07AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Wed, Oct 30, 2024 at 7:37 PM Charles Wang <charles.goodix@gmail.com> wrote:
> >
> > > > +  goodix,hid-report-addr:
> > >
> > > I do not see this patch addressing previous review. Sending something
> > > like this as v1 after long discussions also does not help.
> > >
> > > No, you keep sending the same and the same, without improvements.
> > >
> >
> > I apologize for overlooking the discussions regarding this issue.
> >
> > I would like to clarify that while the current boards use the same address,
> > but newly designed boards in the future may require different addresses.
> >
> > Retaining this property would likely offer more flexibility.
> 
> I don't feel very strongly about it, but maybe Krzysztof does?
> Possibly the path of least resistance would be:
> 
> 1. You drop the property from the bindings.
> 
> 2. You hardcode it in the driver to be the normal value.
> 
> 3. If/when someone actually needs a different value then we can add it
> as an optional property in the bindings and fall back to the default
> value if the property isn't present.
> 
> What do you think? If you feel strongly about keeping the
> "hid-report-addr" then you can certainly keep making your case.
> However, it's probably best to wait to get agreement from Krzysztof
> (or one of the other DT maintainers) before sending your next version
> unless you're going to take the "path of least resistance" that I talk
> about above.
>

Agreed, let's wait and see the opinions of Krzysztof (or the other DT
maintainers).

Thanks,
Charles

