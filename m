Return-Path: <linux-input+bounces-13672-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C8011B0F7CD
	for <lists+linux-input@lfdr.de>; Wed, 23 Jul 2025 18:09:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B055C966B46
	for <lists+linux-input@lfdr.de>; Wed, 23 Jul 2025 16:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5B121EDA2B;
	Wed, 23 Jul 2025 16:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xa+L9TqO"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CF81E1DF0;
	Wed, 23 Jul 2025 16:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753286951; cv=none; b=NhKsWtAT6vd8Z1lwilkZ2K9UKkARkMLnKCrt5kNgJUNAxpA44PFwDvveAOtcKihKbZnPAy/UpjCprw8oPJLP+hOUCasdJVY75X17/iRXwQPphK5xIjjMvvW37D1wIO2gMpsxHQvZa5NzauJxHvvjcOre26FrEQ9FEBy39gMAOC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753286951; c=relaxed/simple;
	bh=KNZuLeZ7Vb0Khk88R/AaUPOLawwpWLR+37p+5OnxvlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UiCQoMGUZrjvYyqoPzPNQsbWCjfBXzOBMmSEfFdyUrsbzpwYx0E2IeZaxNFpQHkdQSp0lxsZ5SCbDQU+6W9Syx9zhrzFAlxuSloBbN3RqFU6WIpNbBDK/JZ7+YIKIGfy791lbVoV3mGdznUh3Js/1R8xkh1vILQEtlf8YjqXX0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xa+L9TqO; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-236192f8770so1019785ad.0;
        Wed, 23 Jul 2025 09:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753286949; x=1753891749; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YuLKbXDIBftvEU2DM9EdxfNNCG5GSDwVeQjo6/hbZjM=;
        b=Xa+L9TqOxoVj8B/7o/ZGx6ZTLgFKllplLsD90Mj3OWm2CN2nCyNWRktfIr9/lHz7k2
         hhkpJclsofeOlyozFDIuNSy4Vkte+GgiOFMT59TTZqBXprPSfnAt5UWzZy0lnUhCNcFw
         6jk0/nFnJ9HAqdE+xiXDMEwtmLIevpdYQklmJB/R4Phn8lVpnWwjsSH/1pnzbwY04zht
         DDmOtk3CnKx4cHToPEf1rAHQjJHHRa2eqlkWbGaYNv09ccvf7fzdCNn5VBkSl220LFkV
         DKGHo6MOT/lvx8BKhfYJdCKeFv9JCsh8K3Q6PY8erj+9rJMPZGwTGnPKZ/1rhIV2opSz
         3rvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753286949; x=1753891749;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YuLKbXDIBftvEU2DM9EdxfNNCG5GSDwVeQjo6/hbZjM=;
        b=DwIabX3MZwzwQxrwDSf8yDw1cLw80GTEZO3L7mnvV5tjLYOhBq5XoSUJ//FhkVUjXs
         PmfjMM5RGcFhkaDQZCy1VJ26fAJ1B5E9FN9Hg4bx9SCQBfJOly7hOGikh5kF13ovST+9
         zx/yWX/Cqt/o9xCef96Db9YlGeuMmDzMCNigEk4jFh6XPVFeH23Lbr9EO6XAyuF48p8r
         2ODyqhfs0MJbqaNzHSAY5c9Urlw6hEV8CwofF7Et3KakbP2YgeYUXoB3uvXUwUXkUPYq
         8xKEsAn3m2M1UVIuJ0a28Rx7xkaFwMtkafGZIkdN4IDhWmWawfy0JjQ9DuyctuyFez6S
         H1jQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDDCJ8UxtLS9Zv1DZz0xrTZSVSdGH5a5R0/1WE5m70/0mPZmQfrRK9IXlEhWWSzQyldXVAjMlcb0mTsGd1@vger.kernel.org, AJvYcCWIcJp/NULqpnHU+6LRPtP6owUteRvuMDIcS0DT2J5noTM6iQJkg+WvFXPqYiY9gYDmfWutYgOkn8S3WA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywja1dwrkuJJOEV7hVGY6SKSn0T1FRutEnZUG5nZzPhNLbqPfUQ
	5LyRHKxSTVqiIhPi97Z7QlMxsD6bKN9OCpyVo9N6gfrGOzqE10kZ1b2R
X-Gm-Gg: ASbGncs/FJPPYo8bQMeZr3BdmCp3rpMjMyWvRBJa5Oz57LhYWq/Bl+Z5i/3n7VBPqHY
	dUwGQevvWR+/xcC8W7oq5gc7QVp3Xz1dx2ZvtOn3mPFq/Mq72V8Y/1+qMuea8lnuNnvWD5ZixSq
	L7a+2Hzd3psXtZSg12p7fej3j5IBpM86v2eW5s31ZPsYWy0x7Dr5vyJRV0VI+O05prznJegQZ2/
	zvXc2Dnh8JUACabTkiz55KGp5xhpIyz3N178ccUqoeGxsPo0vUgOMX0wBAibsjWaPgjsdb4KXee
	OOmYXH4whIUbqtTGe0UIfwut7635vDAPum0gmQyWPDmBMMVpqF53r3O6d1F/m1Jj+RImYGj53NE
	N/59rCXOJvmdlUYXEHkaK8/8=
X-Google-Smtp-Source: AGHT+IFL2EPxoMJO8ZYQyXqhonrDjQ8EuQCZKedYL3E7gvzeOJr/c2Ku50XdLXKppQMgV3Zwgl0HZg==
X-Received: by 2002:a17:903:178b:b0:234:b445:3f31 with SMTP id d9443c01a7336-23f8accc965mr125258415ad.17.1753286949338;
        Wed, 23 Jul 2025 09:09:09 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:a883:25a3:a8f0:9fef])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6b4a93sm99316355ad.102.2025.07.23.09.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 09:09:08 -0700 (PDT)
Date: Wed, 23 Jul 2025 09:09:05 -0700
From: "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>
To: Joe Hung =?utf-8?B?KOa0qumKmOmZvSk=?= <joe_hung@ilitek.com>
Cc: "francesco.dolcini@toradex.com" <francesco.dolcini@toradex.com>, 
	"emanuele.ghidoli@toradex.com" <emanuele.ghidoli@toradex.com>, linux-input <linux-input@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Luca Hsu =?utf-8?B?KOW+kOWYiemNiik=?= <luca_hsu@ilitek.com>
Subject: Re: [PATCH] input: ilitek_ts_i2c: report key event for palm
Message-ID: <adsqcvnik3korhviuhebw7vxe63fuobqmrwwqrfzxygtfvqvqb@kdmf5aohulj3>
References: <b372a99d01c14d1690afba4ceedd0936@ilitek.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b372a99d01c14d1690afba4ceedd0936@ilitek.com>

Hi Joe,

On Mon, Jul 14, 2025 at 09:51:42AM +0000, Joe Hung (洪銘陽) wrote:
> From ec0d80214fee6acc0b38f33ad0b6b487098963bc Mon Sep 17 00:00:00 2001
> From: Joe Hong <joe_hung@ilitek.com>
> Date: Mon, 14 Jul 2025 17:20:11 +0800
> Subject: [PATCH] input: ilitek_ts_i2c: report key event for palm
> 
> Add support for reporting user-defined key event while getting palm event.

Palm contacts should be reported via MT_TOOL_PALM contact type and not a
fake key event.

Thanks.

-- 
Dmitry

