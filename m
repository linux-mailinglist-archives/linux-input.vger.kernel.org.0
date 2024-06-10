Return-Path: <linux-input+bounces-4288-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90896901DE7
	for <lists+linux-input@lfdr.de>; Mon, 10 Jun 2024 11:13:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 363D81F21D81
	for <lists+linux-input@lfdr.de>; Mon, 10 Jun 2024 09:13:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B4A76F31C;
	Mon, 10 Jun 2024 09:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Twer1ZAu"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45CF6BFA3;
	Mon, 10 Jun 2024 09:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718010803; cv=none; b=bVI6DpWB2rzhTXre4GGikEYk2eOa70wrq/qE2gtTRYPHDrxGhkHo+Rs6dV2lpcLz0ipz1vul7Z56rIe5huELBkFk1fHpWVxDQmoE8q2qn1ZkV5gW5TOq86a29U9UEX3LvY5RyGbc4bb2fCZywPWhDb2DqMBnfHwgAG3GZQ7ZX0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718010803; c=relaxed/simple;
	bh=5ujLML2QXMFKALZISgEcgTJDQ7PnkNQE3qzbK5GW+QQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ezaU6iFbp2xC5KGQ1xZLKhMLzZ7S62OuEzFNmi9/eUeNVcLCvBs/rUNgmlxktTq1tJSFcyexocfbsS+4AY231fWhjO0Okd6ubgmiO0R5rje1DxYwd8onXyT/SCUWA1tHuuinx9db7G9xYyk61UqZY8yGxcQE3Vm6vcMb1+vI9C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Twer1ZAu; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-57a1fe63947so5233461a12.1;
        Mon, 10 Jun 2024 02:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718010800; x=1718615600; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5ujLML2QXMFKALZISgEcgTJDQ7PnkNQE3qzbK5GW+QQ=;
        b=Twer1ZAu4wG+VHC+owo6ZOXgH1jgF9InZsY+oQ2+9tBb7h7JIgwtnUvfT0OgQiJJCc
         zKtYWEFZ37zRVn+rF5ppDzxtL8OjhkyRTCyjabAvSpJ/YxFci8mxyc/g9/XRN9ZeFCBL
         6kU58d8WenwFxjwG/Dt2XkBA20rXqtkXGtsTCs+hQCItx3Fq6iiBtSvSyd3u2Ujv2mBd
         2MwW7mVeG95ceYRIBVlKphT8UEKpFc+5tADkQuD1aDoHgM8QzHfX52gg+CYqb5f51EuX
         vqwK10duJcTaM5Z6XkvOdSbMnAnXMcb/uQa+BIe0SmbeDwmE5nCT6Nvgz+iFeYCGsCbM
         ipsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718010800; x=1718615600;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5ujLML2QXMFKALZISgEcgTJDQ7PnkNQE3qzbK5GW+QQ=;
        b=YpLarWe50Jw7nXbYK2QNX76qg3CzARPRyGHhSkV0cFvmQdDJeJ/sMcqHzYQwKzFfOz
         LrCJk+tBBNmLqArE6BTwAEx7spFYcrrKJj5Mcler0yFlrCJ7lcxcozA4GFeQc7L5PLxm
         Skk3a6UoT2cejeF3ypAQY57MRx7zEol+rBCmLDAarXa/Hx0gBCZ8S5YXOiwqj72nfXoV
         la4CICscIQ6OZ7FtfRjc5GNBSIJjvYSYhXguNe2VmYUiUh98Ypi4TNQVtZ5II5RSz7pu
         19la5FUSYX+JV49h2sGfX/DcRZ6teipZQnQvobvBUyjlGyN0J4BSIdrJ6MjiK46sr9gx
         56XA==
X-Forwarded-Encrypted: i=1; AJvYcCXzApuGgo0EQh9W0uNPWVzBtuMw8ABGLAkFEv+lEta7KllTqpBeU2nMd9zh8o0YIR7o0HnCFk4XrNz8E+yvygX8NFAgI7hNO0ZjNe4VwDeQqrjv6nGCTRJB1fC3V2uaK8ktwgFs5TxOtL0=
X-Gm-Message-State: AOJu0YxsepPw8Q9jeGfTZT04aLWPMH2sBPmnJGSUA1pTbMGHz9LinRfk
	j1984E6qX10pzb6RB8bbUJrHuzUX+EQ5dh2PNcNrYNwlc/aPunNa
X-Google-Smtp-Source: AGHT+IE1VXfFnRLBeCfrtWvYW8NWm++kwAp4y4wKNXbofIUDpVeN/X7Q9HfRtVJdC98xJcXNbviqgg==
X-Received: by 2002:a50:8e55:0:b0:57c:75a1:2a14 with SMTP id 4fb4d7f45d1cf-57c8c30766dmr385139a12.12.1718010799677;
        Mon, 10 Jun 2024 02:13:19 -0700 (PDT)
Received: from ?IPv6:2003:f6:ef1c:c500:ee59:d953:f148:40ba? (p200300f6ef1cc500ee59d953f14840ba.dip0.t-ipconnect.de. [2003:f6:ef1c:c500:ee59:d953:f148:40ba])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57aae23a0d7sm7124719a12.95.2024.06.10.02.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 02:13:19 -0700 (PDT)
Message-ID: <9d76c55ccc1602ae329e33ac382e3ae68916d882.camel@gmail.com>
Subject: Re: [PATCH 1/3] Input: adxl34x - use device core to create
 driver-specific device attributes
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
Cc: Michael Hennerich <michael.hennerich@analog.com>, 
	linux-kernel@vger.kernel.org
Date: Mon, 10 Jun 2024 11:17:07 +0200
In-Reply-To: <20240609234122.603796-1-dmitry.torokhov@gmail.com>
References: <20240609234122.603796-1-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, 2024-06-09 at 16:41 -0700, Dmitry Torokhov wrote:
> Instead of creating driver-specific device attributes with
> sysfs_create_group() have device core do this by setting up dev_groups
> pointer in the driver structure.
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---

Reviewed-by: Nuno Sa <nuno.sa@analog.com>



