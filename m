Return-Path: <linux-input+bounces-15097-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C8569B9E186
	for <lists+linux-input@lfdr.de>; Thu, 25 Sep 2025 10:40:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51CFA326ACC
	for <lists+linux-input@lfdr.de>; Thu, 25 Sep 2025 08:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53006274B22;
	Thu, 25 Sep 2025 08:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BoWxT3/o"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65C925EF97
	for <linux-input@vger.kernel.org>; Thu, 25 Sep 2025 08:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758789599; cv=none; b=Xa0UJxD1brcFnaGLzq7M0bzg1iS4+KERVK7Sr3wdJqwfOiol4jivsQ+4oNlBIf+A92yytiaNh+p9WDbZMtC2VE+F8p9EGwfzn8WWqVYBCXEzgKiz9jUFo46sSEu6sbU5zs+1p0rpO1JVc/Lh7xTvZr/3Ny1FD4TLGnj4Boi1jig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758789599; c=relaxed/simple;
	bh=AjT96+20GcsVWhgMNMhihCW2r6PfyLiHYLGy6V+/pog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lD8KO/F3/eSJXKAxTRyt1PWJwZ6fFMMjP1a8LSAlDcqJ8JuvEclXoT3Y/htabU9SUhYg3Xgrrk74IDq0mdkw6789196ZkunMC3miElhf/jddI+Meauefptd7esXE8SdbWTdBFK8zJ/1AuPWCafvKRKeSUdhBh3/kpPOvk4GCthA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BoWxT3/o; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3696f1d5102so6140641fa.3
        for <linux-input@vger.kernel.org>; Thu, 25 Sep 2025 01:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758789596; x=1759394396; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AjT96+20GcsVWhgMNMhihCW2r6PfyLiHYLGy6V+/pog=;
        b=BoWxT3/oFwCUH/Q7knf+WDyQFyQ/QVQ+1IVjXh6YqVZTFSCWkFi7lS22bEaivbz3Bn
         aMt6GzDDE68VEOIay2MB84pp4/Jq3+z8lhhZMBzgjeiiAEpZ5yj07Faul4wPHaB2bStc
         Uf0WQymzMCgPvRBfbxAPk7wjBbhRobdCKVcqd2UZKDP/YJgYvy8XENJW/cRfyGBtqbL+
         G0Sl6LiX8cBqcxByZu7Pi39diBHqNkc3mcU6BFakEiQDdZt6iYeLXQtFyuDWTQpIISMq
         98cC7aQZ2HY8kDS+AbGiNeET9WwGgpXY05wEKTLO5vay3fk9juDRS+E+v73NuVk+fkLx
         K/Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758789596; x=1759394396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AjT96+20GcsVWhgMNMhihCW2r6PfyLiHYLGy6V+/pog=;
        b=CpKNidg6HyOQJ4Zc97x5LFKPbO4pzfBfkmtjYjTkkRIxPy0s9Zg2+meWZ6QvAn5I2R
         Ax5gSj82MGN8QXxuKay77qOSRdx6TP1fGO0FSbX4VZq5Z0ikH7a9w8G4sosZ5rZAv5Th
         Pg/dExlejPoc4FyC/nor8m43D4j8fne9QEVlx5aJLXoy+6jN2yb55Opxqna9tw5U+ZEg
         x26GRZcDtqUckRc+/IxbahAdgVgQ7vxpSweI94Bb5KY/N/KG5mAljic2XcBk2XNG0zud
         4qyFFVtGXs2gZP5n7MiZxL0J77zNDC5mgMR1MH7b/yTp0h8MacidjSgTpgzpAx02TRrq
         ytpA==
X-Forwarded-Encrypted: i=1; AJvYcCUKX6E2BXdV16gnNaW1XA3aJ4A8MEo9Nil0uEzFxBMJoZOlUKg8s5+64qEHukQHFNwzBjTNxbQgQTr3lw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXr45x1A+NoPPgY2o+rMBsYKua2dHsva3o9AxxOn9tEuNr59LP
	Oc4OWmLS83jVtcbulfeUiV33TsdESr/q8Z4VuPfvIzgpKotbnXEl7GIeoRDaKCYn9eb1Qe3oo/y
	SFvojCTz/C9eFzrQXmMWgDsltZEe7PRvgEnxbQHrYJA==
X-Gm-Gg: ASbGncsjwkvg3xr6PgIRBPuFUIOGYgmMkeH9oD672/ev/VOMnfuuPzJheIQJOsB83ej
	5JSqafZ6Pv1qfVZKLjQYA1HwrIReF0pRyy6Mg30mGZuIMMxzNtubmH1Ww5YkfME1Cge+vRu8E2O
	V0xn3XJRgbyv2bnAemrkttVZ/D3nxawqBLSM9Tjkh557XlWVzL7y84EKDGo2CZXDUVY2oE6uJSw
	y7ilvM=
X-Google-Smtp-Source: AGHT+IG7SA7kgFu9YK7tZIfH8QWdRLzls5jm/uRCsfbrsbUOkigQRnLDF2PK/zyKGqmGwfzQFwz/hu5kVD7L9V0+lg0=
X-Received: by 2002:a05:651c:35c5:b0:351:10a7:c6ca with SMTP id
 38308e7fff4ca-36f7c8f016cmr7545081fa.7.1758789595775; Thu, 25 Sep 2025
 01:39:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924064905.276174-1-wei.liu@oss.qualcomm.com>
 <CACRpkdZ49_mo0AN78ri4WTt+V2gNdFOTgxzgfXw+3vd2rNNiJw@mail.gmail.com> <kdpj4yddikjg2cvd7pyzf55udaqrttlyhuwmupmhvrn4jxdjw4@q6pajmr5f3i4>
In-Reply-To: <kdpj4yddikjg2cvd7pyzf55udaqrttlyhuwmupmhvrn4jxdjw4@q6pajmr5f3i4>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 25 Sep 2025 10:39:44 +0200
X-Gm-Features: AS18NWDiOOQNnkPc4afuLtbiStKw0PQnZtHavv8A6AJOThzvhSizooVuso5NT4o
Message-ID: <CACRpkdaPuZzibAkFpPLGBeW5UtRK+edebTQ2Ebdv5nKjws9zbA@mail.gmail.com>
Subject: Re: [PATCH] Input: gpio-keys - fix misleading GPIO number
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Wei <wei.liu@oss.qualcomm.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, gatien.chevallier@foss.st.com, 
	namcao@linutronix.de, zhiqiang.tu@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 25, 2025 at 2:07=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> I see vsprintf() has %pC for printing clocks and %pg for block devices,
> maybe we could have %pGD or similar for GPIO descriptors?

I have no idea how that actually works, but I like this general idea!

Yours,
Linus Walleij

