Return-Path: <linux-input+bounces-15068-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45452B9B7EA
	for <lists+linux-input@lfdr.de>; Wed, 24 Sep 2025 20:33:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0970D3224DD
	for <lists+linux-input@lfdr.de>; Wed, 24 Sep 2025 18:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15F5E2848A9;
	Wed, 24 Sep 2025 18:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="efsmGQUS"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABD1245028
	for <linux-input@vger.kernel.org>; Wed, 24 Sep 2025 18:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758738783; cv=none; b=orK3RSboBpDd8XD11xyVqdZo3Qh0vx0HBKT7n8ACw7nagyN4Sq2cZPb7sRzS1mX8CvBKbzCUo22o7J7eJ8r6JUcQok5bjluCvX1XIPa1pEi6XPjNuN83KR+skWf2Y2kc4I0buXh74UpGYw31viW5Svgk+Cur/nvT4uoNE/jwUH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758738783; c=relaxed/simple;
	bh=BPmp7/HZwCEN2P3jkfww+6QmR4v0glh9O0ulkchMmyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gr9XYltIde6G58KDkHFQbdLv6MHB9Zhw5UoDUbTEOmbEn2pp6b9xDVNvVzX+eTG/ueGKj8c5MJgnrIaU0JtEioPQqRlLzsrxYGZgA2KtCYvFQbkDRytt09eOVebs8xQ5IdHQShxCRoB+G39sZeC5KJtQBEwrgPAK2Ojcitj41Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=efsmGQUS; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-77f2c7ba550so154475b3a.1
        for <linux-input@vger.kernel.org>; Wed, 24 Sep 2025 11:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758738780; x=1759343580; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0ZiGUngEg1bz9RIGYOxgVE+7eeU9JAJ9lijyiP/taFE=;
        b=efsmGQUSpeAlPhYHne6mC9XC+C9cNzm6ws/4Ul28qA1tV22MQq/u+/O0JouKGUlWsB
         Wg8aQR3IWtavWeaibMajUZYpQ73rb5v4O6F0KOmCFAq5Gz6PwNetVK7bWKp8Tw6mPL7E
         5ZuAfkeO8xgdBah+Js9Z3uVhESeJZWIqvVbPgx3uF/xguI+WgG4yLngOl9cmHZTTn6Ng
         LS/WfY3SG3CVQ37ATQh/qhypJX5s+AoKuctiUHKPWFvEPbAOkCNNC8g8OLLCR3UZ23Ka
         g8HLw1zh61PvqSya2YzFZyovay2iCDkNmu+7zp5GQKFxoSswiC8LBZczkewG1LArYuuk
         HlBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758738780; x=1759343580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ZiGUngEg1bz9RIGYOxgVE+7eeU9JAJ9lijyiP/taFE=;
        b=qOEs/NAWMtWSsB53gt0JaBMaUo1gSwrml7BZ8Mk0u5SHsWOnAYpjlZDJjX/wCdzOUp
         92y9KMz7rQGIO1/BZrqrMjqjvOSfHSoD4Jb+OzRp4k2lMkyiz2hGVdwteePWJlKl3Kmf
         /lHBvrYXdz97McZvMTj3gIN2qdMdmDg1HoLp4eNJ+E5XpdSO/drzwh/jSHu4KJC1Tgq4
         Q4OHBeEu4zCGV2DGEOz7f9vkEomVKsahnN/gKMh0TowDKJsVF8wqCWbJCr+tErnCZ6cC
         PCYVv5dKEHbEJKaNRQ8kJ7DmB7K6jU4BBpOJRLQlKPrtfL143R3pFPL9r7PpTBqXBBL4
         DkaA==
X-Forwarded-Encrypted: i=1; AJvYcCWai1bthivIewxC2Na/nBdVsppjFOMaTc7MVzs1JOiYRqycPwVM8MbFCMDQqzwTJy35brZyFka7QOhjYg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4sCyAhnAY241gNg41LuQHJDnn82aYddrn66wfBmvApDxVP4jo
	yQBc1ohVfRPxQW+jkVo0LQnEkCm/93YZZktxpfJqlnHWzQsafSu0Zsmg
X-Gm-Gg: ASbGncsE+A0Y8sOhcm+En7GNzVNNhnu2L7U6AcgrgzOKztxvITA9LXY9mk9VqwcGWgE
	e9DhEgPk1HDsQmx4jFwGJpik5dx4NAU5h7CSSLV3avZs61jZlCkM5M3iVEfAnB+UFmQ5BE4PFQe
	Rklt8UcFSJmk4cQyHuDJVnD31slrsNqAsURUS+8ak9KANEH94oavlMlGqe2FCjHG68YbT6C10oV
	Q1p2SbSaOOB2buy47Qg/OY8ZTi6rumWRwro/+kDVPa7CdGY3QGPPq56yJ2VtyXrga33Eo41Jdmn
	4awvTHMr7emZC86+IANzIhi6j2QOYR9vLepWqo/bs6pOi8c3AVzLs0V78VdBD4CiffC5X6xfRHe
	UVzQU9TXZt6540PfO4e72Syk=
X-Google-Smtp-Source: AGHT+IGjh8GHJkW4HrCxPM3eBOhaOjfwbgk4g/556B0RsOzYugb+CgPT02LHWIyv3xFJhWkcNdv5fA==
X-Received: by 2002:a17:90b:3d4b:b0:32d:d4fa:4c3 with SMTP id 98e67ed59e1d1-3342a2ef04fmr506703a91.31.1758738780237;
        Wed, 24 Sep 2025 11:33:00 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:f4c4:bad6:f33e:ddc9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341bda06ccsm3113092a91.7.2025.09.24.11.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 11:32:59 -0700 (PDT)
Date: Wed, 24 Sep 2025 11:32:56 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, linux-media@vger.kernel.org, 
	netdev@vger.kernel.org, linux-spi@vger.kernel.org, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Javier Carrasco <javier.carrasco@wolfvision.net>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Matthias Fend <matthias.fend@emfend.at>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Paul Elder <paul.elder@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Horatiu Vultur <horatiu.vultur@microchip.com>, UNGLinuxDriver@microchip.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Mark Brown <broonie@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v2 02/16] ACPI: property: Use ACPI functions in
 acpi_graph_get_next_endpoint() only
Message-ID: <iqfarpvf72l7qbhfinopjb27qvfm7wg77d4yhuy5qyubcwtcd2@exmcuvgqr353>
References: <20250924074602.266292-1-sakari.ailus@linux.intel.com>
 <20250924074602.266292-3-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924074602.266292-3-sakari.ailus@linux.intel.com>

Hi Sakari,

On Wed, Sep 24, 2025 at 10:45:48AM +0300, Sakari Ailus wrote:
> Calling fwnode_get_next_child_node() in ACPI implementation of the fwnode
> property API is somewhat problematic as the latter is used in the

How exactly is this problematic?

> impelementation of the former. Instead of using
> fwnode_get_next_child_node() in acpi_graph_get_next_endpoint(), call
> acpi_get_next_subnode() directly instead.

I think we are moving into the world of mixed fwnode types with software
nodes/secondary fwnodes, so I do not think this is a step in right
direction.

Thanks.

-- 
Dmitry

