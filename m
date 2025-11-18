Return-Path: <linux-input+bounces-16194-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C67C6B69B
	for <lists+linux-input@lfdr.de>; Tue, 18 Nov 2025 20:23:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 41BAE4E3611
	for <lists+linux-input@lfdr.de>; Tue, 18 Nov 2025 19:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27E612E11D7;
	Tue, 18 Nov 2025 19:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KqsnLQCs"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF302DD5EF
	for <linux-input@vger.kernel.org>; Tue, 18 Nov 2025 19:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763493759; cv=none; b=DjxaSML17jAm0+CW1+e/YfRdxHpqTyoDONszvYSB/xLK7DRKx2IGfLcUhyhgM7TxAOg0ukUrJ7I0j5TfKahJPNegDChlJTkDV51Te065TlCVRY+GMfWpYi/yGWXkSE0QqlsKUAtTcJZnp4O+xY3V1NsHoVMZ9fd9wQ6LHKzeuPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763493759; c=relaxed/simple;
	bh=675Zk50Y3LTZEsvLuNfGMou8wqdkQy66ind05TlVNkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qANPPrHyJGX6ZweUXIsrkogxJbLIiOgYnRVUAt3sjV1zrtliFZ3Pje2WxsXMW4QKsnjdXXTHaQ6JwcZsO4FXR4FalO/TnftPzqdRmA1yfkIRMIixHDugZ72naD6kHRhqKHJZmeC3b6davIbrDy6eNbjalZndYJRSYvYoM3pRaHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KqsnLQCs; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7b9387df58cso2362235b3a.3
        for <linux-input@vger.kernel.org>; Tue, 18 Nov 2025 11:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763493757; x=1764098557; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gvEa0jnc5aqBUZoWbfiQtt/7FtL9NO49WZyr4JCqvhE=;
        b=KqsnLQCsk/6+QFOLHlPzcoRCV0D139J0OfKNF8/ZTp1Cd7BptFKp/mK8C0XEuJK/IH
         g+XOYWEBruT8cMlRyNMcQba9QU5HR+dZck/ShM+noPlQHjxsldApCwnUnBloxkcvM1ty
         TPlVTpsf06cAYK8SIIqYwqkrFj0XyrF1SLnRSBw33Y3K3keZUmZh2IEM1Yuz19S3YeWn
         YMmFSyp6rcSL43YTHc6LYJofukxulqqVisC4yieZAu/Ntpran2Zk1CXvXjNNMTrz6isF
         EJUmUOuRVm5nhDK1VtfcQCINyDYn77UdZqSrCebTExWhLGp1acaW3IRz9mpoYOnUBCPP
         lGdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763493757; x=1764098557;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gvEa0jnc5aqBUZoWbfiQtt/7FtL9NO49WZyr4JCqvhE=;
        b=io4lgwFXSRrZuYSP1U1jJjIWqYWUMZPkw5dQ7M1ZKAXdqQwYBUvckZQ4u5rjfDHwjM
         D9ecnE/KqYZf9pwd8edIWEgPloEvi7kllore6fmSCZWth67VBvaXDzMUYQ0AZwfZB95e
         j6uUfzLOzLX2hWV4XE0WkTwcoDnzn01guERb2kG0x+z0O+9z6cDx6t5aL3i54MCPMLt6
         YCM/+T+QfKCkhdz5HM4JJlUnpR7KexhgqScsGeJ1bV/c7uVhjEBYiQYhCm26DoLdU/Th
         VA+QdN9eGoVJO710OxPzuL/1LrisNV0FBe51NEPZsO8aSW1CIL0XgF8K0+PBwAMXA8Vh
         IF/A==
X-Forwarded-Encrypted: i=1; AJvYcCVAUOnt2bzw1Iz8O3GXZpff7rRtXJB6LJOGp8NlNB+UaMnf+gSeiF0OVI3v4PrwXGteOCMCeyN6Zn7MTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ7Ess9jDaCPM0yshb3tHOiE5JRn9jIZTy3UWW5K4xkMEJX5b+
	KHqSjciPt4HZSnF4gcjt6klsGSDljZcUaM9OXgIvyyjX/ghdKBssrBrA
X-Gm-Gg: ASbGncuNKBxbvEOo6RMA5KYzUUJVFnXau7vVEWGvPrk6eH+JL43bJrgtpitygkPAU1O
	lXnI67+/Tl3j6oJL6uJ/8MaH5qKIT1M8ogrfiXW1vYDd99A5Jk0NmaJNFBUUzhh7jWABdx7f+ZV
	JnyIW0XMdrQrBz14+AJMmxoONvrYGqLN5yU9fV61jvRfRMA8z5XiwRt2gTEGbQhlp4kMvzTdOw+
	R5b4n6QxtYW3Ju6T7kyzvFtasVLZBI8n3vgvdo+wY0VYmLJXtNgaOeb6dnIiGisi6ajathbBF4W
	zsSMiIqniJv1R7R/OwZ+4+MiohD/joYp+K+GNBN/GCEQ+t0947TtlI3B9WU5DAOeGYbYYsAXHcR
	Sz9X3smLAIxDAeg7uKdQWXMaNgmG7CABdlNu/aStF9/BHP8KIKMEhdksH6U3ZBpvIKw95z3rKQF
	vDNt3ZsUmGQxk/68JiRXB+1uiCywclUopvW7Gw4yaAuSqSUOOKXHFjIqmS6pP4lWybQQPI8FPHA
	g==
X-Google-Smtp-Source: AGHT+IELEZhYWlXzd98KtP04N9FRevtbbB+qIzdu2jhq6XqeRQcPW3sY3BwS8IiZhjDpaOtgcw6rPw==
X-Received: by 2002:a05:7022:43a6:b0:11a:49bd:be28 with SMTP id a92af1059eb24-11b40e846demr7788674c88.4.1763493756655;
        Tue, 18 Nov 2025 11:22:36 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:a011:6b85:c55d:d1f5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b06088625sm64635016c88.8.2025.11.18.11.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 11:22:36 -0800 (PST)
Date: Tue, 18 Nov 2025 11:22:32 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Josua Mayer <josua@solid-run.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 04/11] Input: ilitek_ts_i2c: fix warning with gpio
 controllers that sleep
Message-ID: <rifyic7w2zyjupbmzwcewcslryqiyexxdvbgcuxtkw3trmtulw@y4otarfyvgm7>
References: <20251117-imx8mp-hb-iiot-v3-0-bf1a4cf5fa8e@solid-run.com>
 <20251117-imx8mp-hb-iiot-v3-4-bf1a4cf5fa8e@solid-run.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117-imx8mp-hb-iiot-v3-4-bf1a4cf5fa8e@solid-run.com>

Hi Josua,

On Mon, Nov 17, 2025 at 01:28:46PM +0100, Josua Mayer wrote:
> The ilitek touchscreen driver uses the non-sleeping gpiod_set_value
> function for reset.
> 
> Switch to using gpiod_set_value_cansleep() when controlling reset_gpio to
> support GPIO providers that may sleep, such as I2C GPIO expanders.
> 
> This fixes noisy complaints in kernel log for gpio providers that do
> sleep.
> 
> Signed-off-by: Josua Mayer <josua@solid-run.com>
> ---
>  drivers/input/touchscreen/ilitek_ts_i2c.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/ilitek_ts_i2c.c b/drivers/input/touchscreen/ilitek_ts_i2c.c
> index 0dd632724a003..8c5a54b336816 100644
> --- a/drivers/input/touchscreen/ilitek_ts_i2c.c
> +++ b/drivers/input/touchscreen/ilitek_ts_i2c.c
> @@ -396,9 +396,9 @@ static const struct ilitek_protocol_map ptl_func_map[] = {
>  static void ilitek_reset(struct ilitek_ts_data *ts, int delay)
>  {
>  	if (ts->reset_gpio) {
> -		gpiod_set_value(ts->reset_gpio, 1);
> +		gpiod_set_value_cansleep(ts->reset_gpio, 1);
>  		mdelay(10);

This (and below) should be usleep_range/msleep/fsleep.

> -		gpiod_set_value(ts->reset_gpio, 0);
> +		gpiod_set_value_cansleep(ts->reset_gpio, 0);
>  		mdelay(delay);
>  	}
>  }
> 

Thanks.

-- 
Dmitry

