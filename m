Return-Path: <linux-input+bounces-9261-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA40A13069
	for <lists+linux-input@lfdr.de>; Thu, 16 Jan 2025 02:02:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2CF687A1DD8
	for <lists+linux-input@lfdr.de>; Thu, 16 Jan 2025 01:01:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BE801367;
	Thu, 16 Jan 2025 01:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YDSHtH69"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C143370803
	for <linux-input@vger.kernel.org>; Thu, 16 Jan 2025 01:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736989320; cv=none; b=L4AdxM1ZvWCnABOwOZN2w4y6sA/Um24QQ3n0q+GgJQu+jt6OO7aWre+ZLH1lA7kUGwV6no2JxQgc0pQTUIgqFg2/F/rw43r2v4An6bYuhfMFbDlrY4foXH8OW+FrUG4Lr4xbk9UhqgpwAkcwjkLYv8wQYQuMarhNKMsoA4yOzEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736989320; c=relaxed/simple;
	bh=VOORpGV3GpvJZyhldlOzfR2L7TCk9x8CUmhVOBHJSTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u//+ByJG2yD3ZmJuDIGM13/LZXXJ6Juo4zWz0Qif3E6eCnITaTd5Y0jt+PfnDsgX6Bja3SoinBU29zRY2+mb5GpJ63Wa2TRzhBtAmPSIRarxlEnh3bjqvRp/MEkQ+2y+T80XvEKxyDHrFuFq5GtjRHPfwxCEBLIr6FBFtaUSOo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YDSHtH69; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2163dc5155fso5439515ad.0
        for <linux-input@vger.kernel.org>; Wed, 15 Jan 2025 17:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736989318; x=1737594118; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LivSoOObaBFRg6/+7khYvhz+Yfzzl2+fnkPvmjqVfUU=;
        b=YDSHtH69+HDfX+g5oPs76W0YTj9GuMptn/ycr9HOKxbHlvPE+P/OYCbvCYo4IODkEH
         k7u2Wlt+2aofdSyojelBfkx2LZWntgS7Y92lfmuaClEfD8+r6YWNeQaNnPQM1bEWQi9L
         1x7IFKnGfhkbAbErGSghMVUErzF0ZsEEYOWingmVpgeOew7VN/8oscYeqa0nTi9Chrjg
         PGesznYuF5DH0EH5iWf/jbuS6Gos7MQubb6CRUkfg9gjS9hdZVaedXVgXJO2+u/0TzLF
         DNckNhQQAAIh1bq9fj20GB1zzxaGRgN7t5HO1kSbjtV6DjMWVTZSfBni4UeadCKYIqVB
         zhEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736989318; x=1737594118;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LivSoOObaBFRg6/+7khYvhz+Yfzzl2+fnkPvmjqVfUU=;
        b=Q9neOiN99Crr9hitVQqBJ0vdOlJhf3NDi+0QgnHoE3TkgaLc8e6sFyZGAz7/7/ZXsq
         3K1eiKAocyjJzfhKqmRA/kvLVM3Ut/mMVxjqT6j+yWqCjtTLNMhL6ib9/mE1FFZ/UgIy
         0Vpcv2WfWH0j9phb3mm9an81DMpD7NFkfG2GnaadNR+I25kLggpnGg2azxFOzlbZdrNB
         Td6Av36CFRfG7pAEEnrIlNKu8msFNajtEjyaeNYSbcfQiH0jBw7rD7jSBU0QhZu/GmCy
         7o/EaPbQf5N5wauFJoLSWfrN203QMpHlLlQkWINVmJmYcEItkFP2iFCdFpetZS84WYqL
         dWtg==
X-Gm-Message-State: AOJu0YxHfNZIVTsDt+ge5ffVpN3+uQIWa5SMRYeJhy2AA21buwDGBmMg
	1rjxUho3lmIMh8tgXvIM/wQwLDuuTZ2j7/j0W/GaplVYBZ7uV2EI42DFQQ==
X-Gm-Gg: ASbGncu9lBGPOeRZNP/vs/ww5soxA+TuChpEEodzrrG2QA7gqy7PNlfID/N29GajAKa
	JjnIxccTORk9faikvQ5W1u3Fd5TSZ7L73Me2a9BrDiZLA1h5DgVQvfWt/SnJcGNVqQCYo1hGQle
	YjfATDSRaRlVyT0Sh62lmBtMiM2O7eNU/06o2UrYrKAkwX+Qpg4z/UactqgOpmEeOhajIBOEc/2
	AzwLXcdi5DNPMLiVyLE5HGbc0URxCvyfxN7r6ULSba0FC7e49KJMYs=
X-Google-Smtp-Source: AGHT+IFUgksofu/Msb8METQQVqSmR2YK95MB+zhTvEu/7qL/9uUwEw9hWhu2rFyA6dXcbdJR2nndjw==
X-Received: by 2002:a05:6a21:3996:b0:1db:d738:f2ff with SMTP id adf61e73a8af0-1e88cf7f75dmr51634428637.2.1736989317920;
        Wed, 15 Jan 2025 17:01:57 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:11ad:f29a:4b5:d0a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d405943c2sm9747420b3a.79.2025.01.15.17.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 17:01:57 -0800 (PST)
Date: Wed, 15 Jan 2025 17:01:54 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: linux-input@vger.kernel.org, Michael <mksgong@gmail.com>,
	Nick Dyer <nick@shmanahar.org>
Subject: Re: [PATCH] Input: atmel_mxt_ts - support KoD knob
Message-ID: <Z4haguYzh87Bz8hx@google.com>
References: <20241223190416.52871-1-marex@denx.de>
 <Z4VsxKJ56jqQnZGr@google.com>
 <952a79a6-a13f-42b5-a311-13321076686e@denx.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <952a79a6-a13f-42b5-a311-13321076686e@denx.de>

On Mon, Jan 13, 2025 at 09:08:47PM +0100, Marek Vasut wrote:
> On 1/13/25 8:43 PM, Dmitry Torokhov wrote:
> > On Mon, Dec 23, 2024 at 08:03:24PM +0100, Marek Vasut wrote:
> > > Add support for T152 KoD knob events [1]. The KoD touch controller
> > > family supports up to two knobs attached to the glass. Each knob can
> > > be turned in either direction and the touch controller processes the
> > > event and reports the knob position for each knob. Each knob is also
> > > pressure sensitive, the pressure is reported as well. Each knob also
> > > supports center press and additional buttons, which are reported as
> > > BTN_0/BTN_1 for the center press for each knob, and BTN_A/BTN_B for
> > > the additional buttons on the knob.
> > > 
> > > The knob is similar to Dell Canvas 27 knob already supported by
> > > hid-multitouch, except it is non-removable and there can be up to
> > > two such knobs .
> > > 
> > > This implementation is extracted and heavily reworked from Atmel
> > > downstream patchset work by Michael <mksgong@gmail.com> from [2]
> > > branch master as of commit 9c77fbf32982 ("Merge pull request #35
> > > from atmel-maxtouch/20240103_HA_protocol_fixes").
> > > 
> > > [1] https://www.microchip.com/en-us/products/touch-and-gesture/maxtouch-touchscreen-controllers/kod-family
> > > [2] https://github.com/atmel-maxtouch/maXTouch_linux
> > > 
> > > Signed-off-by: Marek Vasut <marex@denx.de>
> > > ---
> > > Note: I am not sure whether reporting the second wheel as GAS/REL_HWHEEL
> > >        is the right thing to do, I don't think it is. Maybe there is some
> > >        better way to handle multiple knobs ?
> > 
> > How about creating separate input devices for these?
> This is what I had originally, but ... why ?
> 
> This is a single input device, touchscreen with up to two knobs , so why
> would it be multiple input devices ?

So as you can see it is hard to express the knobs purpose within a
single input device. Additionally (as far as I understand) knobs are
not connected to the touchscreen function but rather rotary encoders
just happened to be mounted on the touchscreen. They are not considered
contacts.

Therefore I think it makes sense to report them as 2 separate input
devices (maybe modeling after how drivers/input/misc/rotary-encoder.c
does things).

Thanks.

-- 
Dmitry

