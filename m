Return-Path: <linux-input+bounces-15415-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 45535BD3D56
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 17:03:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 433453E5B25
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 14:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 582D730AACC;
	Mon, 13 Oct 2025 14:48:19 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E8D2EA164
	for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 14:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760366899; cv=none; b=GpXyXZ4unxtwpUn48JNaiGn5hA0ZCLkYR5rCkozVkh+HkZ4vn8e8LGUvjWsx4+jJqyIYSwB+ilHtnLst72jaQr7/1lqN+M8uZIvB9r6JBJ+KPICjIJWy5xBP9x+YcG8yVr4OzrtHNI4ISxTKn7evrmLGImfmEHVLqTJR/1LFG60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760366899; c=relaxed/simple;
	bh=a8rzeaiQ54tOFcMOe+sIUa8tfmcif5r7xjlXNM2RFaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mulLG3rY8kXUzzIuTd52zhjcRDnD94EcenHmWnxYCvvcpafoS7BvM0ZLna9uEkgRP6aFjjDWYF5FrVYPY2TRKuyDy5ykx/itgOk906aFsY+dLXSkXzNQsurenIbrPBMHQST56kfY7KWG+yzB3Kw4xxX5DYnjCHgKgAGwXoKnAZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-855d525cd00so765454985a.2
        for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 07:48:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760366896; x=1760971696;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8BF1nvJKgerbunlxq6rI58NsjqwKmmQvTj5E3RRtPIQ=;
        b=I1E4nD+zHAzJNGYMHrz8rIdUxZvKABCmax8IaWc1GnQuOufldcu0NEWouL2iXqh46Z
         B1bfAC8eMuaTG5U1H0PBYVlV0Fw2krYpqGT7kLUmdaCovpSoplSInsi4KD9RV78tmvOL
         mEfXVuLlBZS0a8d6sMO9kpiLy6MvfskPmNDav8WWpvHTjjCzDEoUDxL+F+C2vzxf+KOf
         d7UUHVQEcZJ7i+Mq15I/F1HdLYj9O7yZl+HjN3heewgeLuWjCsosDGqnlRm8cEbLuZaf
         kNxXZtWz6M1oZSMzNe4kskdUECiFkvxOqNH7+o2AXVfPCYFO9LXh64+hX63PW9ER+LCp
         xsLg==
X-Forwarded-Encrypted: i=1; AJvYcCVIbkd7s5ftbaXSobmI7327smFzhnKyIYTb9PAaVJ4xNbGwCoSr9e13ZPvghnSntM0SaLnfkchF/sBVCw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu0dV+i8qUwGFwg7jSu25R9k6Bpnds+tvnpaSLRFRijXmIlKA6
	lzopo6j6ba8SWl66PE0LZ0HVFhjsZOmFgb8B0ROmH00pn4iH1BrwPXw+jRXbJVqZ
X-Gm-Gg: ASbGncvg8Ww/R594PsXBV3GRBOENYfmglpWbqXVy33fN32qiCArP9HN/r9I3sPc1M++
	Dsp1Ff8jrsT7ibVuIRbZOCxapyfCzRWSZSitRFLbiNl39nF3CkGT9iHXI3xGo3t4LxpQzatv/ma
	ElICkP9+FBQZxJ1fnJWzVc84taagapMzxhBXfSbzkfmRXxz2Ud2wPaYi8VKbe5VnTUCo8KNQryy
	obZL1YvTacrFNlfwbsovC5N0D1yom0FOaQ+lkcaDlYscEGX7994WCH+Iql36aKl/ytJ5IKl7ISb
	lobmzuj3G0+jD0aRm5at1ZQdRk0ojJCCWhnPkKqpQy0hNC0wXT75PnQWAdM6k7qYWeXm+OTT+Wq
	28w6v7XoXI9pnpjlB5YS/PXrEH14wBteaGjapBguSTxjPTWh3JCAS1t12Roldhz+el1I1Qlb0KF
	RpEhfwVJHJiIF1bSMcMA==
X-Google-Smtp-Source: AGHT+IHwWSw3U9EEBWuLzL5RDyU3+H/7jx2drj51gPmoCAyV34Z/ZdhHS27SUw/9R4tmLwTht1lTuA==
X-Received: by 2002:a05:620a:1720:b0:852:a340:c6e9 with SMTP id af79cd13be357-8835088d5b3mr2785718585a.18.1760366896333;
        Mon, 13 Oct 2025 07:48:16 -0700 (PDT)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com. [209.85.222.171])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8849f3d862csm1005157785a.10.2025.10.13.07.48.16
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 07:48:16 -0700 (PDT)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-855733c47baso832513785a.0
        for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 07:48:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCViCZxinh6f2k9oLdvaxRmh6Xjsdv8nAZiOemc0EH/fuyYJyYHRVz+hcoJHDk127HN+s3STkUOhF8EtRA==@vger.kernel.org
X-Received: by 2002:a05:6102:598b:b0:521:57e7:3b19 with SMTP id
 ada2fe7eead31-5d5e23ad946mr7466194137.25.1760366582403; Mon, 13 Oct 2025
 07:43:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org> <20251013-ptr_err-v1-27-2c5efbd82952@chromium.org>
In-Reply-To: <20251013-ptr_err-v1-27-2c5efbd82952@chromium.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Oct 2025 16:42:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUw4x4GxxZ+m+108rp+_uiuiNFHO4Vtrd3vftb_LwmCLQ@mail.gmail.com>
X-Gm-Features: AS18NWDbEQGWUFg0r_aGxPQP6vUjubUz4v9cHDpfk8kXxZq-lj2695LEwK7MQ10
Message-ID: <CAMuHMdUw4x4GxxZ+m+108rp+_uiuiNFHO4Vtrd3vftb_LwmCLQ@mail.gmail.com>
Subject: Re: [PATCH 27/32] media: renesas: vsp1: Use %pe format specifier
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Leon Luo <leonl@leopardimaging.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Julien Massot <julien.massot@collabora.com>, Jacopo Mondi <jacopo@jmondi.org>, 
	Daniel Scally <djrscally@gmail.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Yong Zhi <yong.zhi@intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
	Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Rui Miguel Silva <rmfrfs@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Dafna Hirschfeld <dafna@fastmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 Oct 2025 at 16:24, Ricardo Ribalda <ribalda@chromium.org> wrote:
> The %pe format specifier is designed to print error pointers. It prints
> a symbolic error name (eg. -EINVAL) and it makes the code simpler by
> omitting PTR_ERR().
>
> This patch fixes this cocci report:
> ./platform/renesas/vsp1/vsp1_drv.c:958:4-11: WARNING: Consider using %pe to print PTR_ERR()
>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

