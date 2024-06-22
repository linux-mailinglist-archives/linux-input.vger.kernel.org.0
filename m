Return-Path: <linux-input+bounces-4563-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C66319132C6
	for <lists+linux-input@lfdr.de>; Sat, 22 Jun 2024 10:30:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8107D283298
	for <lists+linux-input@lfdr.de>; Sat, 22 Jun 2024 08:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A561214D283;
	Sat, 22 Jun 2024 08:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VHj03exM"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4895114B075;
	Sat, 22 Jun 2024 08:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719045005; cv=none; b=lZimh2sC/76Y/7s0M4CwmCJk90v/9HH6sGCEx6Sa/hLny1Ze65oHR+c0uGp5wQiStZGfz5lwMJTuGCCLD5vQjoaVTuH+u2eMlWjJM4FMo+xw+aM/RZJOVNdfZx0+3RgZSUmnza+RQMIxakK473/aEgsjjvMtaX1tVGymgwgr+EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719045005; c=relaxed/simple;
	bh=rlMedck+JVqNsW7xl/NJUnsD1mC7i2MKjRQFUABSFmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WSf1kyyP8HTce2otEvHu8xHSI+FtRh4mHDVSB8Bkw7EEaxNlQzT9F2ilCif+h39eoAnMYMHBi2Upe1Sgbr7ljLagxLsxdJMiQu8rXOtVyO81F7abhrKsukwvB6IkHRVKrbNYELzVAKAASQ6BXyzq5nSPmfv5TtjPeHr+gT+jOew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VHj03exM; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7066cba4ebbso80122b3a.3;
        Sat, 22 Jun 2024 01:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719045003; x=1719649803; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x7POfki1ekMIjYH7xDg4rdFX/nmN7HxR8lhCInSeq88=;
        b=VHj03exMdPo+KjcMieLrh9KgjvF964H4uDn+vlc5R0mZxTUWC0icNpMdh8/RVZiOcQ
         G57oZ+LaLqLZKCUr18wpLSHl4n1HScLeLeRC5SlvPs96AIzmOz0GNLy795887PrBHrg8
         hIMUCG2rg+62ibhFcwmVUBSyFDw1Rnp0FuiK/sXvZ9HF98elXQKGf4x0r91xC3DiXEPo
         uv47egLJYCyllgi87Y6H4LjsECm7JFo6nFIRnGfHplny/YWvzfTK2NxHen989HfBA9jD
         ZUAwKKN+JiRMM0hJtbgvSDf+7ZuIRsNm+MT+wiDWXkA/cwMQJ0+heKDnSTqWFYmzhUOI
         FsHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719045003; x=1719649803;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x7POfki1ekMIjYH7xDg4rdFX/nmN7HxR8lhCInSeq88=;
        b=WUK1gpYh+XNl+m5l65Yph6PCTSEqkh68ESgOLo9448bK6zvVv7kcZ/FRsDcP+ifu5N
         /5zQv3mSuYw/RBKBlDLrMsxHHp2fXUUOSz24BcvyEf5WgRfiC0+fGruylutT4DsNG0sb
         pRZCCs3V9ChShvvJwVHmHlfJdrG/i3erY/vzy0GnW5kRei5BKj27TgiBdCZZCwJsRCYv
         SqRZ5pp1zpmiI8s2uKpx3B9C3KN3vtqt+FmT3b1j11e2GvzgLYugWlM6xAMEHmEQuygw
         dMjD2V+XwhUyomMWDNBWbalm4UNMk+5xaGtIfybge637WzGXbmHfpE3ps60JBslb92du
         r9Uw==
X-Forwarded-Encrypted: i=1; AJvYcCWTObrIu9RUFuWPf7RXjtyc47U9+r1/nnNW1lxVcOOektyb53jb2W6ZvUdIntYibC4XzZLcbscg3Q9negcbZFCuBkGa3ORN2mF4Oho7KNH55sYN9O+Bp+4Ma1QLp9jgSoQCtfL/jL8ZjMQOSTAIAeAluBFmFn38zfcX3l0HaGHyro6tXww+
X-Gm-Message-State: AOJu0YzxPGVWpjqDsTFINreXUYRJwZJX8+t1xFbytr9ixBlJ5VfCoBzH
	7BFODNQHa1/5BJ6FUpgyDaCwLbdLc7kX/xa/ButRoPw0lpks1VHD
X-Google-Smtp-Source: AGHT+IE96JwlA9jELHJVJKdTQ6aBviaKLXSTSMJCauYZbyShfz2dlQbxgrABfyzmdf8EGXu4qNPFwg==
X-Received: by 2002:a05:6a20:1aaf:b0:1b6:3fc5:d08b with SMTP id adf61e73a8af0-1bcee9507aemr373679637.40.1719045003429;
        Sat, 22 Jun 2024 01:30:03 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:d2ec:59a0:2c5f:4460])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c8499c4761sm645244a91.30.2024.06.22.01.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jun 2024 01:30:03 -0700 (PDT)
Date: Sat, 22 Jun 2024 01:30:00 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	o.rempel@pengutronix.de, u.kleine-koenig@pengutronix.de,
	hdegoede@redhat.com, oliver.graute@kococonnector.com,
	ye.xingchen@zte.com.cn, p.puschmann@pironex.com,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, andy.shevchenko@gmail.com,
	felix@kaechele.ca
Subject: Re: [PATCH v3 0/2] Input: add ft5426
Message-ID: <ZnaLiE0pPZldB2mH@google.com>
References: <20240501204758.758537-1-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240501204758.758537-1-andreas@kemnade.info>

On Wed, May 01, 2024 at 10:47:56PM +0200, Andreas Kemnade wrote:
> Changes in v3:
> - reorder compatible also in driver
> 
> Changes in v2:
> - reorder compatible
> 
> Andreas Kemnade (2):
>   dt-bindings: input: touchscreen: edt-ft5x06: Add ft5426
>   Input: edt-ft5x06 - add ft5426

Applied the series, thank you.

-- 
Dmitry

