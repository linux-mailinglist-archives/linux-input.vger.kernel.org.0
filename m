Return-Path: <linux-input+bounces-5134-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A3893ABF1
	for <lists+linux-input@lfdr.de>; Wed, 24 Jul 2024 06:31:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF70828407C
	for <lists+linux-input@lfdr.de>; Wed, 24 Jul 2024 04:31:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46FBE33DF;
	Wed, 24 Jul 2024 04:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OgTyowDy"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B67EC0
	for <linux-input@vger.kernel.org>; Wed, 24 Jul 2024 04:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721795471; cv=none; b=XzP+E04fc+LCqK7y5o60gzZIZ+eJJ6/nlhp9a68uaDfQZZ1XzhTr4asJEPZjJrwJSD3DybtJD3KYVxVulf7vvyVLa+SmCx/EvawZo/lmfx+ylpHKUYisU6t5s2Tg8Nk9OJxMFwYs/Gr2bgVKOGuCHpbz94LNuAHjIaNMOJFty/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721795471; c=relaxed/simple;
	bh=infD5wfWmNAoADbQrefqBGp0WvYoPFzE7ht+lAz4aQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FC3nRYiIaGRDRQU+gXabIrp5oJc+0QuimwtcKEYFOrVtgQT5ce7cEjyJhTf0D1DgVS9d8tuRTHRbkra7B8+/zQcVKCkgvw9FSARYi58FotDVxlL4L8wDcW5qQwbqhS9dd4OyXacvyK56cFfIs4Ym+GtrFD4D9lpLwUsJNrOQEZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OgTyowDy; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-70d2e68f5a8so1871717b3a.3
        for <linux-input@vger.kernel.org>; Tue, 23 Jul 2024 21:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721795469; x=1722400269; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x8swcF7yHTLWGcwHSeve6s2uaXwzuJNaHFfTPKs41cs=;
        b=OgTyowDyUnC1u1rzg7dAqATmqWFPMMEUrg3+U0+sgseF3ArO6stadrBbFi2JhpV6VA
         EI5Ma1OE730M+examBDLGYRV/WHq7vWkUVZneLHCbEE80eQjFoBDh5//pWLUOa0KoxMz
         Dyo9MKKdQqsLStmEsTnU4hkTF2FRdpWY/iikO5+SpFQmRIfR6pyDbONF+F2ggY/agguv
         RHPR7zQqYafoNCk4ddxFgMNxoK1M7dqPWjHFdAQQttGvfqOhm/kCEsLWdD2gQdax9wWx
         6qVEkz9nU91PLbbDUi6exUrAoP4DatU4LMZSp4I6F1RYnd4t8ba/FnEasTAOB3kUROkr
         tF0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721795469; x=1722400269;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x8swcF7yHTLWGcwHSeve6s2uaXwzuJNaHFfTPKs41cs=;
        b=kFyNXM4KCmaZK3R1j2KvsrZmSmC8HKtetHktJNmIzdoGWa8UW3nXx5t9NH/PE5oNZF
         /3YUBH1eMhQCuVbgCwLj2gvbuMVb1sbpIaeC6oJ8akLGuRJqRcRaCLhC3UFPq5OmliaJ
         SwpYGmLGG6hw1iESKVsD2reMyPCLSmqSR7/UjNwrYxBH7ILmeUJjVb8NSN8GFXBfAjYr
         uq+Ur/NFMjJjaM1mFz5YhoOXt8QF82mWyc2J2Hq8xtlwWhPyQbNnYgGveXsFfCyPznIC
         KUn3txzkYJ8mlyYwaL8A41ckDeKYFBfOcTynAgbTNvG8VERbBdWIjvFUv6EvoySVGdtu
         9uhA==
X-Forwarded-Encrypted: i=1; AJvYcCXzAsnKvq0uKkWbKp/+a9D5myuiCkqLjoUnh8hUvIq80MJeAy6NxOmlVnJuyEvsRKW1v4iRXDWP2RthgzSqRw6ALurqRnR3ZnKdh9I=
X-Gm-Message-State: AOJu0YxHQcjWsgv8gWw/0dCVxhQqCkTs4tZoxy+kUsHFT4KKexh6ClRn
	ratUFSrd4RKxADrzyts3kUXp3dw4wWz4iL2HP6Iw4eUAkwFa0+xI
X-Google-Smtp-Source: AGHT+IFf+3IzlZF+3UsKCaGeiqMGV9MhFgko/ICTfRjy4+0dZi7xW7dZeOrCX33QZ813NhBCGuyO1Q==
X-Received: by 2002:a05:6a00:170c:b0:706:5dfc:7b73 with SMTP id d2e1a72fcca58-70d084fc220mr17203451b3a.16.1721795468836;
        Tue, 23 Jul 2024 21:31:08 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:c2d6:b5c3:537e:3830])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70d24a1d62fsm4533728b3a.184.2024.07.23.21.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 21:31:08 -0700 (PDT)
Date: Tue, 23 Jul 2024 21:31:05 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>, Jon Xie <jon_xie@pixart.com>,
	Jay Lee <jay_lee@pixart.com>, Huacai Chen <chenhuacai@kernel.org>,
	linux-input@vger.kernel.org, Xiaotian Wu <wuxiaotian@loongson.cn>
Subject: Re: [PATCH v4] Input: Add driver for PixArt PS/2 touchpad
Message-ID: <ZqCDiTOl1GEuZUWb@google.com>
References: <20240704125243.3633569-1-zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240704125243.3633569-1-zhoubinbin@loongson.cn>

Hi Binbin,

On Thu, Jul 04, 2024 at 08:52:43PM +0800, Binbin Zhou wrote:
> This patch introduces a driver for the PixArt PS/2 touchpad, which
> supports both clickpad and touchpad types.
> 
> At the same time, we extended the single data packet length to 16,
> because according to the current PixArt hardware and FW design, we need
> 11 bytes/15 bytes to represent the complete three-finger/four-finger data.
> 
> Co-developed-by: Jon Xie <jon_xie@pixart.com>
> Signed-off-by: Jon Xie <jon_xie@pixart.com>
> Co-developed-by: Jay Lee <jay_lee@pixart.com>
> Signed-off-by: Jay Lee <jay_lee@pixart.com>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
> V4:
>  - Thanks Dmitry for the review.
>    - Just return what ps2_command() reports, instead of replacing it with
>      -EIO;
>    - Refact pixart_read_tp_mode/pixart_read_tp_type(), to separate mode
>      value and errors/success;
>    - Pass the INPUT_MT_POINTER flag to input_mt_init_slots() and remove
>      some redundant code, like the call to input_mt_report_finger_count()
>      and the setting of bits in the touchpad section.

Thank you for making the change. I noticed a couple more things that I
fixed up on my side and applied. Please take a look and shout if you
see something wrong.

> +
> +static void pixart_process_packet(struct psmouse *psmouse)
> +{
> +	struct pixart_data *priv = psmouse->private;
> +	struct input_dev *dev = psmouse->dev;
> +	int i, id, fingers = 0, abs_x, abs_y;
> +	u8 *pkt = psmouse->packet;
> +	u8 contact_cnt = CONTACT_CNT(pkt[0]);

We have a nice FIELD_GET() macro that operates on a bitmask and value,
so I changed CONTACT_CNT(m) to CONTACT_CNT_MASK and converted this to:


	unsigned int contact_cnt = FIELD_GET(CONTACT_CNT_MASK, pkt[0]);

Same for SLOT_ID_MASK, ABS_Y_MASK, and ABS_X_MASK.

> +	bool tip;
> +
> +	for (i = 0; i < contact_cnt; i++) {
> +		id = SLOT_ID_MASK(pkt[3 * i + 3]);
> +		abs_y = ABS_Y_MASK(pkt[3 * i + 3]) | pkt[3 * i + 1];
> +		abs_x = ABS_X_MASK(pkt[3 * i + 3]) | pkt[3 * i + 2];

That's way too many of pkt[3 * i + offset] repetitions, I made

		const u8 *p = &pkt[3 * i];

temporary.

<...>

> +
> +static int pixart_reconnect(struct psmouse *psmouse)
> +{
> +	u8 mode;
> +	int error;
> +	struct ps2dev *ps2dev = &psmouse->ps2dev;
> +
> +	pixart_reset(psmouse);
> +	error = pixart_read_tp_mode(ps2dev, &mode);
> +	if (error)
> +		return error;
> +
> +	if (mode != PIXART_MODE_ABS)
> +		return mode;

This should be "return -EIO".

Thanks.

-- 
Dmitry

