Return-Path: <linux-input+bounces-10313-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D956A434E4
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 07:06:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96DB33B7D0F
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 06:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CC85254875;
	Tue, 25 Feb 2025 06:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f1wVlCWr"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4E018C01D;
	Tue, 25 Feb 2025 06:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740463568; cv=none; b=cGKuD1RLRbtytyXZqluJUGRD23tekM040rEiL6yKWWjxz1JP+wvNXzB7rFaNwwE32MsYFVCRDG8IiEyykgQ5Fd5H3/F7jnVGN8d7yMqJUTZU6cLfn7I+K6WOGreMaIuCfj9NIluVPwnFbQG0zruCB6BxI55YfdXdSFuP8OzcOr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740463568; c=relaxed/simple;
	bh=bc48ezQvRviIeIip7g45xmENlYs7r4ow80FmK5DIUZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XC/G7BFiIE0nsPjtH+QjDKSYp7grKG1yVIaTYA9cMaN7DdznOHUfXLOEuJWrquTYGo1VDjcUUBB84aiii5HHJbWq4xalmZig1XJiypwJ6GzTHgfJQAc7IXEi2FRpSTZoINn1cf4+aQxapjZBoSzvidJCi36TV96LM80ZATFhA1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f1wVlCWr; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-220c92c857aso88358135ad.0;
        Mon, 24 Feb 2025 22:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740463565; x=1741068365; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SHqEGJKJOnFR0/LQmbjqbZViXUcvPVyNKLLPy+WeYq4=;
        b=f1wVlCWrRvVQGS+cLW6HiR5dKVnm61bsmjft5OsCXf0hBIaS/b0x8510QDrTS605fV
         RcZpKblpeoieSq2y0sf8DYk9jXMqMiTevJ9+yX8YLcMO6HVVPgkQDCX+g2e3GqDgUMYZ
         V8R6GsrTyy63Y8UN+BLWGYKdt52Esbo/n9e8YeMzgtOmJP4f3X337SNZSI51lFxEVBy1
         TugfpMLXZTS0SwI3UF/+LvaoTWCpTrq9MsUfc1tRaWqplUftwCPyvzMjWd0LUQwXoxkH
         pUzy3prVEyJ6S3YyI+qETdLOiFDgcD/3SEP+/SZlHmRwq+IGS6slq0U7nYc6Mld73x85
         mOSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740463565; x=1741068365;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SHqEGJKJOnFR0/LQmbjqbZViXUcvPVyNKLLPy+WeYq4=;
        b=FwPHpE9RzkABrQPXuVpHydRa/mkzAJEsXyJqOS5BRHASu1pGE0AvMINymxCQUCg7UI
         j/9378Z7h41jS9iNkaCX5syp8vgfW5Ls4f6yJKCGv5Qa3UFmiV90n9FurwSaKhkECHQ/
         sWOlJ+Yao1WoKUDHwFFLWp3SvVxYvNCR0jCnGze2ev5QxIYdLhGTTaJ/IfeBOW0DxTiy
         a2oLkk74O4CUKA3Y8ie1KUEKTGVfHmETerks3+JWs7B1WrR/pQpQwNMBPVwe8CqkeXMp
         XUlNvQte9CL7XR1orllEY9dMcLZE2WC9nnxZLtP7nBGUSpgJ6nVhO4znwkyDTopay3s9
         aZWw==
X-Forwarded-Encrypted: i=1; AJvYcCWdUTXHPvv5OWtRgzNvulKikXJxi4qcv3nVTbsRMuYeWswzjCEfdKUHQ+5Ls6q1M2OQ/rr+z9so4Sjf13Q=@vger.kernel.org, AJvYcCWeWyyaCU6Ny6NsgtgRKhkotBQpOrtz2wrAqkJJyrNHXVvg/mbiEgHz3kSX7ck14CAaH1bOg8I37zgq7AOG@vger.kernel.org, AJvYcCXBR960OLt6rapDxavwSmS3WGdnsJ2wm3WH5r0gjo1HfEU4TGxP8M0wTv0v0qTxJL3NuzsxrrwLf/YHsg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0DGf5SdC3GM1+4pxcBrWzPGCAyQehpqB4JnN9bu7j9vytRhuT
	nCErhCXZpZz9QxJNBT+BnpjECJYN4sCqSnY51y1Z7yhJ9BPQID57uPLkfQ==
X-Gm-Gg: ASbGnctS61oedQfnN2oNis/SV6nn91x8TTtzni6neHKu0ZWVn2ICvnkp2yCDzKlBZEj
	CaruC1VrJ5TmXxuVTbGRO+H5fo4WqEfmcvvO4WVCsXqEL47ezw9mcpkezB/4XYPPMmh5jdOgMfz
	OyZ2tBO2kDIaZ5iaTQieBkNfEAqTwp7ngrI7tWbcWcp5uGiNqWCjJKFaNlVsJOQJ2GjyDt09hds
	7camK4FY0vhvyPXjjjJRDIIq5GFgI8Q5FWleLEjniLb8TFT0J3ifAEPDPFug/Vlj+evtui8kFsG
	6jFMus1RSViQyI/3GEkp8qJPYhY=
X-Google-Smtp-Source: AGHT+IGfF0A96X9gio0jde4A5IIny1HyqQ5rsQKgCjUkk+oAqr79W2olVrRFyMfZVEpCp1pcL7mI2g==
X-Received: by 2002:a17:902:d2c1:b0:21a:7e04:7021 with SMTP id d9443c01a7336-221a001fb74mr245262975ad.24.1740463564872;
        Mon, 24 Feb 2025 22:06:04 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:464c:6229:2280:227e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2230a0005afsm6064955ad.29.2025.02.24.22.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 22:06:04 -0800 (PST)
Date: Mon, 24 Feb 2025 22:06:02 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andras Sebok <sebokandris2009@gmail.com>
Cc: markuss.broks@gmail.com, linux-input@vger.kernel.org,
	phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] input/touchscreen: imagis: add support for imagis
 IST3038H
Message-ID: <Z71dykoXysf8Y5Hz@google.com>
References: <20250224090354.102903-2-sebokandris2009@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224090354.102903-2-sebokandris2009@gmail.com>

On Mon, Feb 24, 2025 at 10:03:54AM +0100, Andras Sebok wrote:
> Adds support for imagis IST3038H, simular to IST3038C.
> Tested on samsung,j5y17lte.
> 
> Signed-off-by: Andras Sebok <sebokandris2009@gmail.com>

Applied after updating commit description a bit, thank you.

-- 
Dmitry

