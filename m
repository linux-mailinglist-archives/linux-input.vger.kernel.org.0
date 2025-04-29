Return-Path: <linux-input+bounces-12060-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83471A9FF2C
	for <lists+linux-input@lfdr.de>; Tue, 29 Apr 2025 03:44:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 080681A87E5D
	for <lists+linux-input@lfdr.de>; Tue, 29 Apr 2025 01:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 123101C5F25;
	Tue, 29 Apr 2025 01:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G1Gu8X9/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE1D1C9B97
	for <linux-input@vger.kernel.org>; Tue, 29 Apr 2025 01:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745891076; cv=none; b=sTEK6MAXCXTNyWs8mE8XrTRhzCYRwvahQaSd0fFQXzDu2uwAo0HwVOoUccJguofv7I7QFEwoNKYNlqFz1Y1bVOLWP1EFlWBtQGxZ0P7Xe3WkVM4p/K6rmdlhv4lNRCQhPWEe3I3E/Y31ieJd7XO78Sl3XBVFaueDWH37AlER92c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745891076; c=relaxed/simple;
	bh=5h7D33Ip5DwhQw0ByZTjqYt+Mpl15yAyNB4Oroj404k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rSHdafupe3iiaUm2MLOgY7XrYe/TcU1ucRG2+kWVwb9iL17TN9yv4fBiTjN1TnHAyDXFAjIQfCsuYwmSvqP4AjI7hbvclG9I/VP05GG9vaeXN82Cp8NEJARzaCBGdYOReIpcnBXnn/NnM9KbW3RN0ivp9HoWBUinpZIZo0HBqaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G1Gu8X9/; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-736e52948ebso5901407b3a.1
        for <linux-input@vger.kernel.org>; Mon, 28 Apr 2025 18:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745891074; x=1746495874; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lq62zzQyOHK78uiVqtPw1IxBYWeG5y8aXibo6GbJSRM=;
        b=G1Gu8X9/c0Pt8WwXZtJc9YnURIE6wphiWlyILyVvnkLm5FRkIV9TwTX0q6AaL1qrvb
         UaDYaDxOhqwktS8wFbUhOGtismkSR6B40UaMwRKuzpPDJhhrRPZNaQxCOUFTwxi+EsNS
         s6D1qeI0tqUpEpvBUH1eRm/6au7LHWYyeDF6GuR8Q8TBCveFpxtDuF/nJah6b1JuZAd5
         gFDT7ubpGZxHHUoqz18zMxUyvCH6ecWvtAuvGqSeopkjJNUMCDhf77HFAceH83LnHp9A
         oF6cYt5oDEQ5CSOwPW6wsrAvavWgS3uvD990mjhBKTM/4NZH6kiEamIcwzYQ8RBYOEcZ
         3nYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745891074; x=1746495874;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lq62zzQyOHK78uiVqtPw1IxBYWeG5y8aXibo6GbJSRM=;
        b=DqBDw4leyDVnAAntCqzJRug0In8LrDy3m6r0Ny92abbi+v3iCpUinAsux6o01Q/FGx
         7C13JcugCZMycELMHQXf5xnfYwgnarTBiDiEJ1zdS+hXpA5aVp9YWZgzsTf7Yfrz4Bjc
         VZT2/ssHGyu6HPYTDXiqMWJFIUmX+hoiWyOrf1P7ewnDYtwOhq4vBjtGJhsogshFaZvg
         Zn+bOMrODGypdIZxU9us5Qjek4by8PwENcOyIj3MQGlw3L8GDx75Ndi/tawli4Hj/nvn
         6B9EY9Z1sCa+lQf8xYdpnSKsGafh5jlYyZKYwcFr7tISfMaYkaABfwTHPdbri7IFfkXP
         vKHg==
X-Gm-Message-State: AOJu0Yzjf8O7aN5NGjeoinghHUZuM76XHESjdelKXBu1EKVcyInh1e1p
	6kLDfRbnw+QMTL2yRaNjEo7rXnZURrwUVR8PV+0l7yVYLi7txJv05iEe3w==
X-Gm-Gg: ASbGncttQ0p6QIbC+TPR4VqGk3XY39gA/lT3hzwb/uOMC48cG21A04+De9gD83rcYEW
	ipJgVsXCdTaNuM18M/2+LtCooJ+dhsgS8w/df67MeqnOOBpII3L0X/F8oMe43L1vxyH4gRej31e
	/CmEV7c3SczHFjeGC2VElcn0GwZ5d6cDHhcJr5J1vJbvGRI99jusn67+bF8YTaOALG1c5WOKjjh
	8oGHHN42hUDFmomUROlxPTgerMN/YMpxNXVi4L9k0cVZkDotzEEK6Lm5/3ynutSEaLH6KsyNbU7
	rdn6w2xIQjTnPipCxJQ9szEy8pYZyzbSXMALiWO2yP2nXfEfUSOc
X-Google-Smtp-Source: AGHT+IHEUQE7frKxzlJ8NqemLgqVZ3OwRZg6mQd3V9wkj4vyFKSG43LxKXfrJO3J70kmTV/V+4WFyw==
X-Received: by 2002:a05:6a00:9282:b0:736:4b85:ee05 with SMTP id d2e1a72fcca58-740271597d8mr2624098b3a.11.1745891073663;
        Mon, 28 Apr 2025 18:44:33 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:adc2:8397:4f51:d5a0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25acccd0sm9047248b3a.178.2025.04.28.18.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 18:44:33 -0700 (PDT)
Date: Mon, 28 Apr 2025 18:44:30 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Marcos Alano <marcoshalano@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: Re: [PATCH] Add keycode to Dell G-Mode key
Message-ID: <vyyy42prkuhvaqxhcuy42v3viwb4t63ptoxu6etopy7kh5shcu@cq3354ua7fqu>
References: <20250419113132.36504-1-marcoshalano@gmail.com>
 <c332518c-f997-49bd-a2cd-4612def52b81@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c332518c-f997-49bd-a2cd-4612def52b81@gmail.com>

Hi Marcos,

On Tue, Apr 22, 2025 at 10:49:09AM -0300, Marcos Alano wrote:
> On 19/04/2025 08:31, Marcos Alano wrote:
> > This key exists in some Alienware and Dell machines.
> > On Windows it activates the performance mode.
> > 
> I noticed just now the missing of a rationale about my patch. Sorry about
> that.
> 
> This patch is part of a multiple stage plans to enable the G-Mode key on
> Linux.
> The most important part is this patch, that will define an exclusive key
> code for the key.
> There will be necessary a newer version for libevdev, specially the Python
> support, using the newer headers with the key code I'm adding in there.
> Subsequently, I will update my change in systemd so the scan code for this
> key, 0x68, returns `KEY_GMODE` (today is returning a very generic key code).
> Finally, I will release a simple Python code I developed that is responsible
> for monitoring event devices, /dev/input/event* (since I doubt that I have
> how to know what is the keyboard device).
> When detect `KEY_GMODE` it will enable performance mode, and when press
> again, it will disable.
> Today I'm using D-Bus to call power-profiles-daemon, but the idea in the
> future, with a quite set in stone key code, any user-space tool, like
> power-profiles-daemon, can use and manage the key by themselves.

Could you please tell me more about the performance mode? What does it
do and how it differs from normal (?) mode, and also whether it is
something Dell-specific or whether it is also available on other
devices.

What input device emits this key code? atkbd? Something
platform-specific?

My inclination would be to use KEY_VENDOR for this functionality, at
least for now, as the feature seems very vendor-specific. 

Thanks.

-- 
Dmitry

