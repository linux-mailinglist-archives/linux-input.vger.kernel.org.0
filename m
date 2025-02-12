Return-Path: <linux-input+bounces-9995-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BEAA32727
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2025 14:31:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D3D31880448
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2025 13:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE45520E6E1;
	Wed, 12 Feb 2025 13:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J3iQopJ6"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9217205AA7;
	Wed, 12 Feb 2025 13:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739367067; cv=none; b=JXBlhE/1I7gi3/+7BHVASUGz/z+9nRzX/3EqXA5CsEGBMigVoTtCj3r0/WSN/6x9ad0XH7a3FJJKOW4F+fH6sdbDnFTlpM5zh/nB00uzHIguUlx1sTAxp14dhXQ96WKQMvrAAWaNooZKlXo2ajhsV09RWb8WTdhwLtCE3KkQ1Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739367067; c=relaxed/simple;
	bh=kApJtCtd/6G9vbdy3Zw6CPfIH0zwHzv1yg41rvrFPns=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JGdreEQdvouCvpYnL9ucvUtI+5kMjsYokhxesWIDUbOp+v03eRQO/APBWl9FMocI3Jmjs8XpliybTo0j4KZzxm5tX+uGKtvwW9Qx8LotKRjZSwFDt9N1TzcOPxEFOD+ANkWEfgz5KzGyWOsw6WP74kqq0yVG3HqkXzk2nEp8MT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J3iQopJ6; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ab7ee6f5535so22924866b.1;
        Wed, 12 Feb 2025 05:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739367064; x=1739971864; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding
         :disposition-notification-to:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=p7geNC4E1J+sp/PMxn2+gCYJ+qwFRG86MbpqHzD7gu4=;
        b=J3iQopJ6i7Ft8Puhcaa8wKMV6cdpQjUCjIOIyP+EsKRgwGvFqnIBl0tzaJtDic1leX
         2ejb7QyCaVHlLGIKFyB0xJdYdHEIaYsfJofPu1702PEdRVemxp0AtaUvZd9iFvoi1A2b
         ag6YmQeUsd8ApAIKmv2sbCgaw9TJwmUuUcN4nfSTrGjZ9PEt8/q3Wyx5RfOVjnwTXIxU
         ZZy8u9AENDrU1sfusG3dcXHkeOonBEkChACWanV8ssU4xeU4YCEECVSbo2L7bgYms2TG
         5o25GUtf6B2WGqVwa/w9ta6CRhv+uBk3hGrffwUVWJhQLCFopU0vKYiytM4mAacRbQWV
         Y94g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739367064; x=1739971864;
        h=mime-version:user-agent:content-transfer-encoding
         :disposition-notification-to:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7geNC4E1J+sp/PMxn2+gCYJ+qwFRG86MbpqHzD7gu4=;
        b=Dv7nBbzo9c8IdWss+AsRinM1HjLeg5IcT3FAKLnkPckWP6nc3USzcFEquA+ZIpVJM6
         fx4QIDGebTIPZE2xhu0M/scMI7wf9TL2jtt6pBeA6CPQUCuXKPOx1bFXGqIe/iwUrKZ9
         5iet3QH/ZEEWsw9zw6dar0unL04YO7dj4YVz/xAHDRPWQnwrbaOcafrT705yW3H6nEa1
         Csfm4t8iAg9woRUWNYVADqcOhbQgQ4j02fCJbgqaUzXFLOkQOEw9PY6yn3ieS4RTxSg9
         wcHwEl85+w5PW0PLTfxjiDrxly5QrjHFVXKv0mfLK5H173lLJII1pHGsc5hkQxxVpDcy
         /w5A==
X-Forwarded-Encrypted: i=1; AJvYcCWgokanpSa9ziRioT863VO84/JDkIp+7W2fdH9Uqm2R6Q6s81PcEFI35W9aJ/QENuCVB62G4sMDeB0Ndjtz@vger.kernel.org, AJvYcCXN4Bde3M5lcE3hLfC4S/SCKd2k8IJdeJDVdW8z3j9V4isSowHJZVwKcuQpSL3sTjbX2F9FyKL585+R0w==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm2m6HvOdsXFzMuajSPoJ1EkrqWeO42d5BWVopAe4Gkf7Dofq6
	DsoiwSDq2ZCrxy/1clpKOGIFnmtoomBwzXTT1lM6HwalhJ0jdU/iy7kyAM7fiWg=
X-Gm-Gg: ASbGncvAbWdDNwFvWZbsRnsTaU5TupBI9mloyp71p0n9qjQWpOjfHhWVusDweN136UM
	3E0VTHiOVh6nBUT6BFnhBEEOLDFIuNysBT2XhQ9z8QGdM1/J+QQ6XhLgURYvIghnbQlruGoYoQ7
	oVwy3yIAfvUn2LnfyEprX1aclHT50fXgfvYBFSq2ZO9mNiyuCYq6qS+EC/yXnsIUZrMnRR0lkDC
	d31KmDAt1dtT0ENJ2NGqSUGgeHDg+L8TftMdhOskpHvLEKfWwDcJWdLrYlmDqE122mMQWmCOCtp
	AU+oAHYXAZ790VtUuO0xKarCs+keivy7AZWx9tp8jId/Djb1R0aUSo3CygYQxuccinzZ
X-Google-Smtp-Source: AGHT+IEN7Gw4tjxbHiTzd1DSth8yZsaKN7tAsBzYwtGanlUBLMUh52Y9e7IE8/BmexnJ5tZh/Q4JFA==
X-Received: by 2002:a17:907:9495:b0:ab3:2719:ca30 with SMTP id a640c23a62f3a-ab7f347056amr119748566b.10.1739367063966;
        Wed, 12 Feb 2025 05:31:03 -0800 (PST)
Received: from [192.168.1.239] (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7b2adcd58sm761858666b.112.2025.02.12.05.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 05:31:03 -0800 (PST)
Message-ID: <067382bbfaa4bf9729a8d8ba1a7afb387ba04bd4.camel@gmail.com>
Subject: Re: [PATCH][next] HID: hid-universal-pidff: Fix spelling mistake
 "sucessfully" -> "successfully"
From: Tomasz =?UTF-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: Colin Ian King <colin.i.king@gmail.com>, Oleg Makarenko
 <oleg@makarenk.ooo>,  Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires
 <bentiss@kernel.org>, linux-input@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Wed, 12 Feb 2025 14:30:59 +0100
In-Reply-To: <20250212122347.495701-1-colin.i.king@gmail.com>
References: <20250212122347.495701-1-colin.i.king@gmail.com>
Disposition-Notification-To: tomasz.pakula.oficjalny@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-02-12 at 12:23 +0000, Colin Ian King wrote:
> There is a spelling mistake in a hid_info message. Fix it.
>=20
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/hid/hid-universal-pidff.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/hid/hid-universal-pidff.c b/drivers/hid/hid-universa=
l-pidff.c
> index 5b89ec7b5c26..001a0f5efb9d 100644
> --- a/drivers/hid/hid-universal-pidff.c
> +++ b/drivers/hid/hid-universal-pidff.c
> @@ -104,7 +104,7 @@ static int universal_pidff_probe(struct hid_device *h=
dev,
>  		goto err;
>  	}
> =20
> -	hid_info(hdev, "Universal pidff driver loaded sucessfully!");
> +	hid_info(hdev, "Universal pidff driver loaded successfully!");
> =20
>  	return 0;
>  err:

Huh, I actually "fixed" that word recently but only added one missing
's'. It's a tricky word for sure :)

Applies cleanly on top of hid.git#for-6.15/pidff

Acked-by: Tomasz Paku=C5=82a <tomasz.pakula.oficjalny@gmail.com>

