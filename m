Return-Path: <linux-input+bounces-14946-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A980B8D3C8
	for <lists+linux-input@lfdr.de>; Sun, 21 Sep 2025 04:51:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2B093B450A
	for <lists+linux-input@lfdr.de>; Sun, 21 Sep 2025 02:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 464A219992C;
	Sun, 21 Sep 2025 02:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c34fqZ4A"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C905329405
	for <linux-input@vger.kernel.org>; Sun, 21 Sep 2025 02:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758423097; cv=none; b=DZN3liYT+GwuA6M8rWcXpPvgYIQYYflwnYQSgd5aswVw5G3RWej58/NLu/9t9CCdEH8Dmus03ynDG/9ZALiZ49JoieI9YerMdSgT1QrVVQJqUUUCE0wRyY81AnOAzcz/Y0lE3nQrhqIC69I7FYOGtkozAg0VXaPTypIn3uOfZy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758423097; c=relaxed/simple;
	bh=lBKwjGlD2sl3HW/InUD61SetLUkGpSZmLWIOs3WO++0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hVJ5937W5sIcKwBbbbv39OB6deyQ35gt9kZVhNksBps8Z3JS+Z9unHexOIdoW5Vmus8bl7pLzBmodvwy2us7gMmDhz3SDhZarm58WZ9+ZAkiNf6KMmq736rY1Ub/NQ/UncMJ9KOHaYahI3RJTkAdFgWHlfKkDleHDFL3Mid8h5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c34fqZ4A; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-77f2e621ef8so169810b3a.0
        for <linux-input@vger.kernel.org>; Sat, 20 Sep 2025 19:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758423095; x=1759027895; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uNUurTQ+hy6CY4Cjol5+Pld9O12FSqVbj7oLrH9uB4M=;
        b=c34fqZ4ALdicuB0rvpf7UTTZav8oKwjvwDLljjOCh+9QFOyGJsTCnuTbRnK8w1jwrp
         4pcM49o5An3ayeRaiM7MjB3sOCcFubvcv6TA2JT9v126egfj2fZXPaqifXyRGHOujvlf
         8brHNqjWyBGQFk3o11FifRq5cC5lIrtmONe9mX+4078r/yB+oD6clyv5/TjGBKTU/TVt
         v7CEzmtbF3Vz0Q6bjP4YzZY/HIxSJ0jdCMokw23FLA+Nv+Dux6dlkuJBMw4SsLxDMn7r
         hBFK+bosIqwrw2m7XiQQqIgW7dolitXCZAZsETdSis3yS/OKb3GiWqY2Vi9b82SPtHaN
         PvSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758423095; x=1759027895;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uNUurTQ+hy6CY4Cjol5+Pld9O12FSqVbj7oLrH9uB4M=;
        b=CPYarbBnkXoI+zp/iULXiMIMZO9vKpDJ33bvfm/g7HTxsSNzT66ciP3ViaI46/nEda
         s/bPyi/Mc7jP4jfVv8ovu44Ib19GRm6IVInajvXQoJai5l+9D6RZySNwaN3boNnkQsJ7
         /qGlpulMQWtat+8WZAlYCKfVJpQqqfbzwnujogAHYKZ3+VJDP+YFs6EohtdN5Dg3tWGe
         GXYaG3aBPQieAmpggulHEf9I3uAOjXBpvFaPx5fRaWHH9tASapLft1OvhGGjsIi5O6Pk
         44LsqOrOPw+y/UL7m6GI3RZM+HELzwejSs4i8TPXGzOTBWp2PNtkvxbqVIOFIyFYsvel
         NPeA==
X-Forwarded-Encrypted: i=1; AJvYcCV2EFQgi6TVZSDV3XSvbuhLOkEnOtJ9uB+M4Dn+F+CkyvqlvD0+PZCOTx/KXD9c+Pc/7h2zxC1LdXTDBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuYkMjd5k49fnhKXG7WsLzA/l0DFAqRSWz+HIHXYiqd844GmHY
	Fj/ReUjRGdJ/9bB2Fm/OfTOYK3YQim/8K8olzXD52gdCJxRDGz2e2Zn4
X-Gm-Gg: ASbGncuB+YZIS1x8cGrich0AqZhqRu7e6Xx9k3q4LGc3paw7U4OzhZaIXSXbvrevbrS
	Fzf0JyCPUMbAD4QI6niz6TGhEP8XhuZESXgc92t3ho10kHmGDodaMu0gs+IJW/dvHticmnUube9
	y1ktkZYzbvdaVGMyI1iUHPJFd8OLR979g5Pm9K5Mlb35JPFhV3FI92Svh6uNjpsepeOsj7MQzrc
	lrubfAsOlzN1dycxWlmjj98R1S++wQ+Hv6wgFf65eiM8eWrhjEDTvYhWLm6ZTQxIx2PXk0zgL/f
	SSteswApyNv0RXv2Q1PKh632KPJNKoua5WAbQJCOgFXjuLYDVhIku9brOE3pdXEXC26qrojHryN
	KdK16auMpfu8hFwTLsoGzsmsaTJzyBt1rfw==
X-Google-Smtp-Source: AGHT+IESujOc+8Y6ELJdqssqI+rnI6S3xwgji1KMFUZchDD3lbjMYc3GMQ6PK1vBR+/eIGQAQZ2CkQ==
X-Received: by 2002:a05:6a00:3e0a:b0:776:14f1:492c with SMTP id d2e1a72fcca58-77e4d327e41mr10079127b3a.12.1758423095044;
        Sat, 20 Sep 2025 19:51:35 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:fdae:ef9f:3050:cdfb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77e70c06ba1sm6029313b3a.67.2025.09.20.19.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 19:51:34 -0700 (PDT)
Date: Sat, 20 Sep 2025 19:51:31 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Russ Weight <russ.weight@linux.dev>
Cc: Marco Felsch <m.felsch@pengutronix.de>, 
	Luis Chamberlain <mcgrof@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kamel Bouhara <kamel.bouhara@bootlin.com>, 
	Marco Felsch <kernel@pengutronix.de>, Henrik Rydberg <rydberg@bitmath.org>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-input@vger.kernel.org
Subject: Re: [PATCH v3 1/4] firmware_loader: expand firmware error codes with
 up-to-date error
Message-ID: <5tlhy2jl77etqxsna42ksdmvu3x3bsp5c44poshkt45agldfsj@bkzlvbfoshsl>
References: <20250821-v6-10-topic-touchscreen-axiom-v3-0-940ccee6dba3@pengutronix.de>
 <20250821-v6-10-topic-touchscreen-axiom-v3-1-940ccee6dba3@pengutronix.de>
 <ifdhjgo6wchlsztqvgkaawpbnh3zahb76vmyzlomokfrqt6tjp@qjcdvcdqviag>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ifdhjgo6wchlsztqvgkaawpbnh3zahb76vmyzlomokfrqt6tjp@qjcdvcdqviag>

On Wed, Aug 27, 2025 at 03:29:33PM -0600, Russ Weight wrote:
> 
> On Thu, Aug 21, 2025 at 07:26:36PM +0200, Marco Felsch wrote:
> > Add FW_UPLOAD_ERR_DUPLICATE to allow drivers to inform the firmware_loader
> > framework that the update is not required. This can be the case if the
> > user provided firmware matches the current running firmware.
> > 
> > Sync lib/test_firmware.c accordingly.
> > 
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> 
> Reviewed-by: Russ Weight <russ.weight@linux.dev>

Does this mean I should merge this through input tree?

Thanks.

-- 
Dmitry

