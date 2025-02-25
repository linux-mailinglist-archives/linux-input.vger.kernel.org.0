Return-Path: <linux-input+bounces-10362-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CF2A44E2D
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 22:01:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBE6A189CADA
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 20:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E905520C48E;
	Tue, 25 Feb 2025 20:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P5YfGFl4"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7880F1A3142;
	Tue, 25 Feb 2025 20:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740517186; cv=none; b=HLWkD11UO4vbt1JL/TZur08CYVvb49vWV73lhlksoYxXC1+8P7GUyD0XRYs2nmlxf9hX0wvtVe6lReVYlFGroSylJlHuOmhqtF67kC6edS0DeVW1pkh/4JY7mOamtVyo7JDTYScmzWjS4AKs/eypcyYPxPywkQWA6S6I04tZkQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740517186; c=relaxed/simple;
	bh=+3bhPAdyfaod3PZw9U0HDRQGKTtCLjMMQIxRkSmZ/v4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YcnjepINCJ44PnrCOzT4Q79ckwa/L6JDUSFe9DharDKs1mlnUqdGUX8ERQZ9OzQb0ib4Z6fFjMAzAp87SSg55n2BiMfADnRH/9B7B5qPaXdTo22pGYZxqBfOJN7+DlRg4Oo+LaApfOCmQe2pnXBOvOHWHhVHma2+tUVC/EoIXIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P5YfGFl4; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22185cddbffso3458475ad.1;
        Tue, 25 Feb 2025 12:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740517185; x=1741121985; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1O7Y90t6kj121J9vA/lw13SRmx7Y5MgSyLYR040wf8Y=;
        b=P5YfGFl4uJKgFMf5czTGcTfARUjlSxmXQUmSjcIpA/HcBqLa1mzwuzZT+VtT1QNBIU
         7s1RdJhi1Gkg12yagdwFJl/m8NYsIZXnb0UA+t/Fld1HUv8MvrTdSIc/+t2k5LTDdfNd
         gPavAG8taMMUA9wDXX7/VtaJE5WkBxlXpku8TQ9zOcIEQjBQT3f7PY0Y+JDXqU5uqU3g
         D7PWR3m0TF5+Owrie6GdPRR8N58K90kzVuZ2OxmvA+JwbXj2yvEqW3nwYEKVoaNi7tia
         X6at1CR6b00XO+yieby1ys/hqLyi2UsQ/FbZ50vaWT51uFgLflMZ/A/g1bx/5DEByCcw
         X9eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740517185; x=1741121985;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1O7Y90t6kj121J9vA/lw13SRmx7Y5MgSyLYR040wf8Y=;
        b=LaAdwnHjVA6NCtfbK4G3x++2Jg7gq3VPq8zSTfvZKmI5iWBYVaBWjFJq1sKZjbokAw
         7lC+10pCuCahe1o+uc3kNW7zWVnIHQ0bnBwCJOcyfnxBUpLRetkeFcrnhSO9Y6s5Az8l
         yrHCpjC4KeforYyK0cLrUK9vSML7vUJ4BAfTLKd5O2mE9mT+TwdZw093REMz0Zje3uxK
         xo5bbkswz7r1VRuRW/GIlgSbOvYC2JrFADu3DXe6SVHeRQbRdBDSkX7ve5Fmiu6vo8AW
         0HYKQi35oXVBKkwC8qFSzdbn741TpDilspVtvhHWYXLmxLHauEkfH6k8tX8pJ7bLwCbZ
         QZpg==
X-Forwarded-Encrypted: i=1; AJvYcCUnG1mqcB3UccpV5GTn2+CQ7D3cy6Z0HhaRPQro3QBC5/kXc9uuJTp4xJeAXBAySYVaZfdFQSswL45F9Q==@vger.kernel.org, AJvYcCXt1fSIbC5Kg6oo8tm70+1VuHzmsnhRojWaN3gpO2ZSKbSfEpTcNrthX3HemUpsL0ofdHZC0E1i4CaZbRoh@vger.kernel.org
X-Gm-Message-State: AOJu0YxIETiS2bY3OEvIf9LUEVEZost+883bDZa9s3vzNR/2b9syeRst
	31q2x76NPdUh5oKUDQSj50dDrlPakOdhcJ2T/oQxjUsNCK0fSUcf
X-Gm-Gg: ASbGncv3nASD/9AUszXg17SBLVRrFvJE9JxK2IhdkljhOUKTBQvHRC3XI6sTsqT8ruX
	BYLEAk6XmzY8a+Qdia2hKk3ZevB3VW5OYgv7iGy5wtCblEprjfAKTY0JNsy5sow/ubyJqgKmTJv
	wVQqRUR+yUuPWrGolbIn5jCM9OJHXMewF+oGZCPR2obpgP1gHQTmSjRAQloLKjrJehP722/gLyR
	aUHccUq1tk2J5uOL9Z5/UjLvX37bo8hWgWYHpKGx3pcIQxP+f2vMzzS6NwsQSPlYh/3gXpxfnJX
	WYu3yLafv0ScYBdWRZN037wT5YI=
X-Google-Smtp-Source: AGHT+IGl4Je6RrhO3Pxpk4OqIcDpXzJLg2JMEYUIAVQ49VtMSo+wo4PJ2OOcksaH84CllnjjQMEHqA==
X-Received: by 2002:a05:6300:8981:b0:1f0:e2e6:f41e with SMTP id adf61e73a8af0-1f0e2e6f4ecmr11261006637.8.1740517184718;
        Tue, 25 Feb 2025 12:59:44 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:987e:29fc:176a:2ed5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a7f9d77sm2041499b3a.101.2025.02.25.12.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 12:59:43 -0800 (PST)
Date: Tue, 25 Feb 2025 12:59:41 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Benjamin Tissoires <bentiss@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Takashi Iwai <tiwai@suse.de>, Jonathan Denose <jdenose@google.com>,
	Erick Archer <erick.archer@outlook.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [RESEND] Input: synaptics: hide unused smbus_pnp_ids[]
 array
Message-ID: <Z74vPf6-qETZG0t1@google.com>
References: <20250225145451.1141995-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225145451.1141995-1-arnd@kernel.org>

On Tue, Feb 25, 2025 at 03:54:38PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When SMBUS is disabled, this is never referenced, causing a W=1 warning:
> 
> drivers/input/mouse/synaptics.c:164:27: error: 'smbus_pnp_ids' defined but not used [-Werror=unused-const-variable=]
> 
> Hide the array behind the same #ifdef as the code referencing it.
> 
> Fixes: e839ffab0289 ("Input: synaptics - add support for Intertouch devices")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied, thank you.

-- 
Dmitry

