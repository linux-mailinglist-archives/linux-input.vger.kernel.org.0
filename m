Return-Path: <linux-input+bounces-4739-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D4191D5CF
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 03:35:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C901E1F21707
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 01:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBA092CA2;
	Mon,  1 Jul 2024 01:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aLlcnuhG"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5437A847C;
	Mon,  1 Jul 2024 01:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719797718; cv=none; b=o3jqgIvg2Vd2RF7VVphxGMbKKwH4Q+vFFktFm1+fhq7MbpSf6H6uIfHzXbMS0QVncNP70OQ3V7o/Lv/WYiGUpKNyPh387RN2mWPSCr9mecUL7I/BCd/a2TK+CBVPtQrAPfHZ2zgPUATqSi9Ld7oAbTB8xNOnWyyNx7/sR0lMHOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719797718; c=relaxed/simple;
	bh=QXGvyv4dc/C594KPbdWqh+erqMWMNESAXYjWqoBFgok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VuPy9gVqNRn4MDA5BhzPgrj8YC91YiMtNcNK/6TNT6ThD13yf/dZZZRjy2DhCiQ4i624Rev/Gp/r5G+zibAilONRPgeA5+UN2Z53a1309KEztT6zP7enP7scN4WsHqpGJN0xaORGuFhYVD/D+N0MyS32IDPwfKdP/QrDu9UXu58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aLlcnuhG; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-70670188420so1484147b3a.2;
        Sun, 30 Jun 2024 18:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719797716; x=1720402516; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TQQn1j58t9nLeF0b2LNufFZwTiFUhCHzGVW8dgiIQ9I=;
        b=aLlcnuhGKDvyNQy8xRE2iaw9M5NakdoXst+exs7XSIAwZ1YcpcOKu+kXOI5H3xFiem
         GfwQHOWSVQFaytYcQ2mOGTpwR9CB7/FG6jSeOYTd8/IAEhS3XvYMrrsU9MoO74N5Bw2u
         Rb2J5b9V0sqNsZXrcZ+y8B31n1Uw2vzhXEWIE17v/5LdUVT/4zJ4F7ImJWl7oeXT6uvM
         WBz19+jL+mVDtvpCWBLcZW3SgUnw4zQ6CvWEi2B0Qbk6WFzQ93SuoQ+Bi2u1HLwv4loD
         1otAKNszABaFNcvhHIQy4odRhi0JE2LvWPL5B9vhXv6a4yiRAOCSYbcgTAiuUuRQu+Dc
         sM6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719797716; x=1720402516;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TQQn1j58t9nLeF0b2LNufFZwTiFUhCHzGVW8dgiIQ9I=;
        b=ZIE4piozPvS1NMgoU+5La0O6FK+xBEPLRK7Dg80Mf7Pg6U0xezHTyuE78XWOdpRg09
         fegsrDpgcTN12ulVlZQD/v1tsJ81MQR2hdXcLPIIxN3GSRH9PD+YR7/F6+YZotLutUGR
         ljOZILaKh9vP74pXIMd5PNWtpfWrYBJThUhFFXT/KIMqVx5i+I7ADPtgqbUVLbN5t1SN
         c3+TuZqYb6v0BOlD6gVYS4lO51Tzlrz3GkMuj+rCNlyIEYagWC6LRiD0f7HQ4K86jSib
         3oxYP0ExNAPS/+tCBP49WQ/y65KXhqnj8qEt3/w661jSD5J88xGwgNnlfskGxAwbrDAG
         rNpw==
X-Forwarded-Encrypted: i=1; AJvYcCWoaY7bFi1FiJgNYh0HEMiqJhh78TfvCqooNgcoq3lldiMm1nSeFkfapFcMyPw7fKiYS1kE9IL7i5ELh7mWAETG5tx/f0YSL/czuyKPJ3spJuNQkfzp5EDpBzL/K2aBsItdjpf1EXgjPWyFwt8IZTQUwY6dgFoXLIaxxb1S1wxdsCefvMQH
X-Gm-Message-State: AOJu0YyZdfs4+xMqG6cGdyEXVrUWtiCetgkdCj7XmKtTVdDx34ZqsC68
	uQz6wrHNXshZYF2yuMi60NKIKFCZIiLYCMJLsfQrR+lYjKIe60V9
X-Google-Smtp-Source: AGHT+IFBK4tz7vP4nvoPFyP+apmogncqsE6QoVtl2tcv/PWC9oXL42qPiAGp55B55QszY0izCcu8kA==
X-Received: by 2002:a05:6a00:3e1d:b0:706:a87f:98ae with SMTP id d2e1a72fcca58-70aaadd0e01mr3447630b3a.24.1719797716258;
        Sun, 30 Jun 2024 18:35:16 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:7783:69e6:8487:f6ab])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-708045ac8b2sm5267910b3a.183.2024.06.30.18.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 18:35:15 -0700 (PDT)
Date: Sun, 30 Jun 2024 18:35:12 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Daisuke Nojiri <dnojiri@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Reka Norman <rekanorman@chromium.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Gwendal Grignou <gwendal@chromium.org>,
	Pavan Holla <pholla@chromium.org>,
	Lukasz Majczak <lma@chromium.org>,
	Ching-Kang Yen <chingkang@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Prashant Malani <pmalani@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 2/2] dt-bindings: cros-ec-keyboard: Add keyboard
 matrix v3.0
Message-ID: <ZoIH0FfNGAZPgCCi@google.com>
References: <cover.1719531519.git.dnojiri@chromium.org>
 <9ae4d96cc2ce8c9de8755b9beffb78c641100fe7.1719531519.git.dnojiri@chromium.org>
 <ZoFM9QJVp3cpf012@tzungbi-laptop>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZoFM9QJVp3cpf012@tzungbi-laptop>

Hi Tzung-Bi,

On Sun, Jun 30, 2024 at 08:17:57PM +0800, Tzung-Bi Shih wrote:
> On Thu, Jun 27, 2024 at 04:53:08PM -0700, Daisuke Nojiri wrote:
> > Add support for keyboard matrix version 3.0, which reduces keyboard
> > ghosting.
> 
> Dmitry,
> 
> I saw your R-b tag of the patch.  Would you like to apply the patch
> through chrome-platform tree?

Yes, I think that would be the best.

Thanks.

-- 
Dmitry

