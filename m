Return-Path: <linux-input+bounces-16846-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DC9CFF1E0
	for <lists+linux-input@lfdr.de>; Wed, 07 Jan 2026 18:32:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0DDAD3491131
	for <lists+linux-input@lfdr.de>; Wed,  7 Jan 2026 16:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FDEB381714;
	Wed,  7 Jan 2026 16:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y1FnSxT3"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9082533B6FB
	for <linux-input@vger.kernel.org>; Wed,  7 Jan 2026 16:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767802121; cv=none; b=ojk598gYE6eBaftk8HHCOyXk4L0GpC5pmpiwiteZCIqq+MuAo0C1lvJF8gvvTXohFV/hy8gkfLIVqiLfEunzXn3Te/vR/cXR/IW9xTn6NZ641cHy4JjOehhUvX0s7mWjfTEtE9JuoiyUWScBjBGI382wXwTP7lxpIL4IbcTvo3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767802121; c=relaxed/simple;
	bh=QGyIp+lK9osQq3lbVQdGSeyOFzxru1f5zIbvvF1pqSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qYXY1kDEtHAE6DYMayn7FF5bf6vgEhfOgSFHQU38kG7LwgDhKw5/fRYHdh6Y61jjxqzKgzHkK/MuBzoK2nrz8r8UU20b+/Ftfi4GYOb7pmJb8aUJ0f5+KjFXtKG3a2lDrrVz8pWUPCmNXlK+n506KTjlwKYYoY7YxY4Y45w7ffU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y1FnSxT3; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a0bae9aca3so18138665ad.3
        for <linux-input@vger.kernel.org>; Wed, 07 Jan 2026 08:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767802106; x=1768406906; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QGyIp+lK9osQq3lbVQdGSeyOFzxru1f5zIbvvF1pqSg=;
        b=Y1FnSxT3BNj/HCn0Qa+rCh5Zih2QODGqelbqxUbIVuoZgnWYHcRPWs66K7eQ9NKp41
         iDjg/Wxkcj3fDfNVsGcQmlg4ljM7Xyy6Bz91DWm3laPEafRjz7LiUTdfyAs+KcB7dKR7
         6rFo9+cqaQlHy/504fZJw57sbvQuTfAOgkHTiAUYKFFfBGk5pg74rOzVzXYt0F+Lovim
         PXudSIHGC6Bbpor3okjn5ASYLBFLyRcGsLQC9I3PwYq9h+w/o5VSaXO+RemEqES74QYu
         GLYlId1MOvRjfLBCK+0PvpN4rVdKoBz5w6ZbkxuUXUqwndzvOU5zNqbam6zbkKhZyu1m
         XtzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767802106; x=1768406906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QGyIp+lK9osQq3lbVQdGSeyOFzxru1f5zIbvvF1pqSg=;
        b=FHiKMEyyPQBR/w7DHG60ny3ncz5XDp6ZnwoxEUq2amgpPzLikbBguAkZksUYwz8cOa
         Lv8iAsolo54DNjFUfBCMHHJRzH4he3OK9qmEb/u82gjz4vmbuFf184MD+3om0O/cG6jd
         /3PLu69EVrkKeYYDaYmHqx2dVt203/N+Olh2ds/rVJ/wIG63KdUaUn5UsC0EtqqeRh/9
         9U41jWrIZynHxD0y6CexHfk/VbU+TmFErz4FJOrOtg2X11bPQmhbjd1NMtF/9GZWCGOl
         bNcMDIwtdGJGcgIP3Vt3A7j+GSx9NSaD8y4H5SN83Ofn+WTctZ+oZsZsC2VEx6wAMGoQ
         b7nw==
X-Forwarded-Encrypted: i=1; AJvYcCUSWikNTGaOmfnslZQqtCREVE1dZtlXtp7NDSxsh85/fQvlJT9ldXqIUhAeHEZTsE2bvTJjHWxPuNT37Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbrJfhHWG6Hp7Ljx/qM/3zqxr/56cadpxa8RqoDFfZvOG3EpaJ
	0FJeaf2grYurmScTsBW9F4gU78XtDcOFOU+6eeq0LqycyzB+fjjqRef7
X-Gm-Gg: AY/fxX5O1Xry5xrOV29ryfvtC/PGTP3bThQ8rrnj1ifGHlHJ6bgxxhKB5EfuoxT66eg
	cRVymDhobFgLlRTEblD178ObM8yQbmpApiErwFxOz+h5mWk2ZVSZbub38m409DhQXMDrgv029Mr
	7OWgKIVul3/DNYF0+lDEqxr+GEjSvhop3MA1zUZeTqt4oVARpGtUyeq1xfajQL5MPU4PnZtLMxC
	+x+Vi9WNJ++h7l/71duvcHUvDlU7KjTFrAyW0ZxgAF64ggaslY3GZ0mXo/s0WcTivPZfYFduChw
	cTuBegBmXofuKsrDiYBd9NZHm0djXg+/vH6nPJF8o7xS/I+ASmDURJWAyRWqY8CYu3agY2/BvTQ
	4odhTzA1w9fv5IIBqF4oxck8v+PezWW1Nzf2/d98fWdSNsZkK+h+86ElTtSY9r0mee5/88jih44
	KDQkTaVsUWvpgL1dru4xN0I8GBD/Gc6VkoBKfCCfluEXBBnji025aw6YxL7izix98EKKl0VqEu/
	vvZX42K2a8Ncohs+3Gj2lJKoDgOYWol1r09C2TPCep9/ZvGJA595JQ51S/P
X-Google-Smtp-Source: AGHT+IGGgjws0QI2dh99HA7x2QQoBYxtkkxyx7w+vFCI7qZqMfcPcyhwCJVG4ZPAwQkMQYunU+rrxg==
X-Received: by 2002:a17:902:d491:b0:295:20b8:e104 with SMTP id d9443c01a7336-2a3ee50676bmr20739135ad.58.1767802106009;
        Wed, 07 Jan 2026 08:08:26 -0800 (PST)
Received: from anonymous ([113.252.77.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c4796asm55507165ad.34.2026.01.07.08.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 08:08:25 -0800 (PST)
Date: Thu, 8 Jan 2026 00:08:22 +0800
From: kenkinming2002@gmail.com
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: jikos@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: i2c-hid: fix potential buffer overflow in
 i2c_hid_get_report()
Message-ID: <aV5_76eRrcGJ1ehE@anonymous>
References: <20251231181830.232239-1-kenkinming2002@gmail.com>
 <or6uoheepcbcx4sm36g7z3ccevhjn6iv2ddztx6mpw4qgbdoyo@n3yfbkwlye5i>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <or6uoheepcbcx4sm36g7z3ccevhjn6iv2ddztx6mpw4qgbdoyo@n3yfbkwlye5i>

On Wed, Jan 07, 2026 at 03:20:13PM +0100, Benjamin Tissoires wrote:
> It makes sense to put this min call here, but it's already present at
> line 304 a few lines after. Could you remove that second check (and
> unnecessary one after your change).

The min call at line 304 uses ret_count which comes from the first 2
bytes in the device response and indicates the actual size of the
returned report descriptor. Notice that importantly ret_count can be
strictly smaller than ihid->bufsize because persumably not all reports
have the same size. The behavior will change if the caller provides a
larger buffer than is necessary. With the min call at line 304, we will
return the actual size of the report descriptor (without the 2 bytes
length header). Without the min call at 304, we will instead return the
size of supplied buffer.

Yours sincerely,
Ken Kwok

