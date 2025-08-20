Return-Path: <linux-input+bounces-14183-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED29BB2DFE3
	for <lists+linux-input@lfdr.de>; Wed, 20 Aug 2025 16:48:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A22C41C477B7
	for <lists+linux-input@lfdr.de>; Wed, 20 Aug 2025 14:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27CE73218C5;
	Wed, 20 Aug 2025 14:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KsCwDHuZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B85A3218BC
	for <linux-input@vger.kernel.org>; Wed, 20 Aug 2025 14:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755701290; cv=none; b=T4/F6jrD3eDdvxQMKeqfV+YoArhSEbigQ0dy6Dt8jt5QVH7BqzqjKVZ7A9nVnbQ9/La5yt3GQBL/tlefLxIEuFcj+JWtVxApA94pvbnL94jWgnGvHwT0apKZGeJsSN54X0ewmSC1wvN81z6+9yhzcSm2biYJHtLDb/H/ok0Fhak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755701290; c=relaxed/simple;
	bh=IUrGjrl/l1txCsSgOPZXbhPn6Tnj3VCBGH0kaDqFOLI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m0KMaIiUq6yptwzqyz5rGVxYiZkhkfLicA8udxGYi6lQ6N3UjIe6IcbGpGpEMOdooTB/qgGt7DG8lmcjE6Z5/PBQMKBBsgNl7z4QSwnGSdNIX19pv2ttxqrLAYo28VVIrEcRnDolT+2xrGwy+8jMUWLQb8VN88xS1pkQ4+PTCIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KsCwDHuZ; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-afcb7af30a5so1107576866b.3
        for <linux-input@vger.kernel.org>; Wed, 20 Aug 2025 07:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755701285; x=1756306085; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NhUBGcq9KiQJcxiCAotwdJ7eICoMjF6+FIweyxl7rFg=;
        b=KsCwDHuZMHf74e5warBYTrtTQBTkhk5lZRT9ynRCjcvwtESc3Y4xuc38bA6c5GdFmE
         2Vl1KUVPmrqHJczv+ROF+bl04yzDrUz+EDrNLV8fI2df/iOS5VA5DPyMPNTxiV0ebK1l
         d0/VSeELdbFtsUv2shLTPnodFRmOVnyqau+fA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755701285; x=1756306085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NhUBGcq9KiQJcxiCAotwdJ7eICoMjF6+FIweyxl7rFg=;
        b=FOUwiizarXyc92psTCr0XEFbWcj6xcq9s9pwu0lX331XJtYhATGa91/Hup+KopzTKu
         ow01tWp6aWw7IdY2uR+1f5QgQmxuiyqEqvzWDQxP6t/yAuqafDj0wX7S1qGaarYJAgCI
         izlkECSLo4qZlausRqg/L5zWdXXKqcS6NBjFOUzWG4vSasi5XqU29tPSomf+C1mxp+Fs
         7mCIm/C2xa0lnXaoQldlqBJ+72eBCP6/uMWAp8xO8VXadxRvt+YFjbqXqkbifHSm4Pgv
         kRFRD1fY2JqHXXnu7TQd4hfkMQkoO6lpvJZJmN8e0mFOog8dCJFrW8UOrmSOdHs0J8kh
         clbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHtwzArFSwWaCcbw/8mGHji1QNh4axUt7McDP1f1hEN25NGqfoSBNg9K9OamxYWd3I9IvqA/BidCAHcA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIFDAV7ZRFzwLVcaSX2CayjLssbNGbzNxaihrhhzsMTTgOaVQm
	Bykb1LVOaRtHa+pV//0/lazowN4XaJ/GqdHzoRCLWVZtKC3V+RILpuzymrq1mZzlOXoFHH8rHiz
	CBjQtdg==
X-Gm-Gg: ASbGncv2ABiD2xqFwgx6MwsDS1IIEjjRlTzF3XXw9CQ0kpmGRvX4zHxxjI2LW/Ktqia
	c8EA8RWQYpH6cWLuBYWxT2jyESPKmUxqTqTb0d7jk345+gxtj6AM2F+2MoRBOyMVgmMDHtkIW2Y
	KzEwcGVoz19NNY86bK2Ps2pDO/Wa90aUauTKZaJwKmZD/4I11B0tGuoQ4rbrfudN4cY+Lkd6WXE
	3piV2xei8WX6t59UzMiOsofSYTaenO+/jvs1o9FkmkMbFUyocCIrI1w0b8HwGqWpMI85+D5+zO1
	lLZ6aLvxLvUPcaNeIbi+HLsO1TAFXjdZzgb/JJaWoHHlJxcdjGj1p9HR/7RBGCXMMQEzhWcyUZM
	UW141zbOVHEdC5wbSyXqYkwfQetkxShVQ3Y1cVQ+C6iBgdopfVHTZgMhZ95IAD8iKO79R59RD
X-Google-Smtp-Source: AGHT+IGXCdXLxW054/i0KJnNZdwNq13vBQAm/4JypUF/W4ENHa7ZKvvL5kH9JCJ36+jnuvLDBmWYZg==
X-Received: by 2002:a17:907:1c9d:b0:af9:7f4f:775e with SMTP id a640c23a62f3a-afdf01e3898mr266208066b.51.1755701284675;
        Wed, 20 Aug 2025 07:48:04 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded478b2csm191154066b.62.2025.08.20.07.48.03
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 07:48:03 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-afcb7a3a085so1010515166b.2
        for <linux-input@vger.kernel.org>; Wed, 20 Aug 2025 07:48:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUtWakr46iB40brFaIbh7yOUDHuQbVyNrfBdTiGcP8gbjGf4D6aQzD6162iXtrGQavcUNHlOlUROf4O0w==@vger.kernel.org
X-Received: by 2002:a17:907:1c27:b0:ade:44f8:569 with SMTP id
 a640c23a62f3a-afdf01a0f35mr268297266b.42.1755701282745; Wed, 20 Aug 2025
 07:48:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820122520.3356738-1-yelangyan@huaqin.corp-partner.google.com>
 <20250820122520.3356738-3-yelangyan@huaqin.corp-partner.google.com>
In-Reply-To: <20250820122520.3356738-3-yelangyan@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 20 Aug 2025 07:47:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X=C1oycGMS2GvGQWxVMR8h-4kv3pXQrH0rXyfvqwv4PQ@mail.gmail.com>
X-Gm-Features: Ac12FXyiFWnDzrYzsNCIRBTvsCzSDFE08U3w3EJvjmOQdowoUEgqgJLZWf1XMk0
Message-ID: <CAD=FV=X=C1oycGMS2GvGQWxVMR8h-4kv3pXQrH0rXyfvqwv4PQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] HID: i2c-hid: elan: Add parade-tc3408 timing
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, jikos@kernel.org, bentiss@kernel.org, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Aug 20, 2025 at 5:25=E2=80=AFAM Langyan Ye
<yelangyan@huaqin.corp-partner.google.com> wrote:
>
> Parade-tc3408 requires reset to pull down time greater than 10ms,
> so the configuration post_power_delay_ms is 10, and the chipset
> initial time is required to be greater than 300ms,
> so the post_gpio_reset_on_delay_ms is set to 300.
>
> Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> ---
>  drivers/hid/i2c-hid/i2c-hid-of-elan.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

