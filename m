Return-Path: <linux-input+bounces-13673-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67328B0F823
	for <lists+linux-input@lfdr.de>; Wed, 23 Jul 2025 18:30:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97F81543561
	for <lists+linux-input@lfdr.de>; Wed, 23 Jul 2025 16:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 213FD1F4634;
	Wed, 23 Jul 2025 16:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GIfGqhno"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EE4157A6B;
	Wed, 23 Jul 2025 16:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753288232; cv=none; b=axyMu7aq2KVjf1GlqZj2QTQfzeDeVQB2LDsFlwbG3DG6fsowLGu6QsRA+CPqWEYEecVBBiPGpLQc9Vk92UjVwzsR3x1Gecn8LV+LpRi7gZ28/ST9j++a8xm2jwENM9M2HUnbJx0WjGMo6Q0qZEJzYggAc7IbFW/1xwjkd57KCaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753288232; c=relaxed/simple;
	bh=PkeO9PDMqnc6QujLZf8nUPiNScSwar/lUSE3gpzMV5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FNons+lqggd59Zuv0OM9clzaAPXB4EnULC++cDu7ToYuDib8ydRLaJa16IyzclQtKq+BRwQu8UDTAMgh1LzuwggFZwtEn3McDZhV99C2mlM+xEOM5Ep1Iyscnta8p/R4u8T3FqWS5zzdw0pAx3cR1krfqw2IOmW2YCIgF+m5yBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GIfGqhno; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-235f9e87f78so66504525ad.2;
        Wed, 23 Jul 2025 09:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753288230; x=1753893030; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aiUd9JCXxvuDHsJvrKsD2gXg4/O+HTvlr0dCqXezPfQ=;
        b=GIfGqhnoMHDVNaFoINHi4u0n228nU9XoXzvd17BY1Oxp99KRNndhc107jXeAdhxWPU
         MNDWzbTylXdD2/2PpmvtF8AveyoF/WNx9f0R/wG4QLyotzMGkGtZgXFfGHpLfIRoNAWq
         JtU2JbI4nMKkeViijX+hRyIJV+VPmdF1fKl0rw4AOIvCmE/OwIqdDkQNQ1GTC28tyIC1
         K7I0RbUYeXhNauBnx2sYLg5KHYLaPOdHf9342QKsLvvP18LH6IkN8GMZ836/q72SI93R
         w3sfG1Q1GLW+ldyAdEJJtOYMunam+P6xI8bABCoHj40t5aQ9fAq2ShKkJXfsjNE/C/IO
         x29g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753288230; x=1753893030;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aiUd9JCXxvuDHsJvrKsD2gXg4/O+HTvlr0dCqXezPfQ=;
        b=XCnMPRQA9VDGG7LnLajSGefzdhBfW1a2GAV8oou3byCHD+mcdJ2WQY9lJX5moYdilA
         teNbNf+a70/lO6lcGkXss8txE+xaB3k1d+Vg4cfxwjqpontG2aIapw0xulhjJEhkA09h
         oBkAJm9tJtI7Zo6EWi/kn7LjjJmAoaDhnJeW1Bx1PKU4amgHcIDe01cqry1iJJ7giFuM
         R4LtxOfA6dML8cP8Gpypz4ikSSIOU1x0l6VEf6OAvyXyHphVa4qi7C/PzRnfGgbw1jcT
         ENAPxrebMwu/vDsk4NSLDcE8T7QDtQ8GRRncL69VoX0zaWPHB21Pqp1qRCgfQO59u/sn
         DCKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFJB9/q0mhh3kXGIg3l06QMasHVJw5bplC8x3zlTgceFhusqg7+0CQ8D76Jxu5zg3klT0gZz9MbyjBCv0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKZDu8JCwIdVUd6ZmOcX2Wf3xRxvCfTkooM52ev+T6TN9uE4cv
	b0HE7pyX3XH/IS5R3v2mDHux4ijOoBeLrrVCzqxDNjPhbMx/pCZRZbOT6hqOpw==
X-Gm-Gg: ASbGnctpwXwS1aSKUMdXAJAi8tkZx3uIlJqJbf9iuqnkX80EoyxcNfZcQ25y0sWxGJs
	a5ZITb7EkzUfiglhH1yx59DvhFPdWjdDRdPXdqA1OcKRA/ngpySxh792zPNmnhTtuBv/H5jeise
	xy9MdAJTdJDee8yFuH+wfe2a+w0sDvfOrvzrGZ7BhBsU0OSIhu5iUpRTkMXb2tTgb6bMeplSLTY
	OP60EHEaRFex9UB6a+mEgE8Z9d7RKNB/sj6HxtgKzfIigMPXa1rvWcxsJC0QHjDBR+Vjmg45bhx
	fjP7xLLuCk2TQmxD17vRe/tIfPrFVxpBYlQd07JjOjtBIqt+KK6xfMpATBBYYYLI1rA8T3YBdX0
	Ec8i2zUAI5MbzLHI5UCPeDNo=
X-Google-Smtp-Source: AGHT+IH8OBSw12ZLlQDKcLJS/LPxrH3qiamfj5i0R4e1dUumM4GXuXXU0A/S+Ah+z2YqDMY0wj93Wg==
X-Received: by 2002:a17:902:cf09:b0:235:ecf2:393 with SMTP id d9443c01a7336-23f981de13dmr50365195ad.53.1753288229868;
        Wed, 23 Jul 2025 09:30:29 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:a883:25a3:a8f0:9fef])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6b4d04sm99486865ad.125.2025.07.23.09.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 09:30:29 -0700 (PDT)
Date: Wed, 23 Jul 2025 09:30:26 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Marge Yang <marge.yang@tw.synaptics.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	david.chiu@tw.synaptics.com, derek.cheng@tw.synaptics.com, sam.tsai@synaptics.com, 
	vincent.huang@tw.synaptics.com
Subject: Re: [PATCH V2] Input: synaptics-rmi4- Add a new feature for Forcepad.
Message-ID: <6sjnlz2zcstrsjgh5qxfmswlvwyjm5wiyz4wtlndprskw2aocr@icqoimso45wd>
References: <20250716033648.1785509-1-marge.yang@tw.synaptics.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716033648.1785509-1-marge.yang@tw.synaptics.com>

Hi Marge,

On Wed, Jul 16, 2025 at 03:36:48AM +0000, Marge Yang wrote:
> +	f21->sensor_count = fn->fd.query_base_addr & (BIT(0) | BIT(1) | BIT(2) | BIT(3));

We could either use GENMASK or just 0x0f. BIT() is for individual bits.

> +
> +	if (fn->fd.query_base_addr & BIT(5)) {
> +		if (fn->fd.query_base_addr & BIT(6))
> +			f21->query15_offset = 2;
> +		else
> +			f21->query15_offset = 1;
> +
> +		rmi_read_block(fn->rmi_dev, fn->fd.query_base_addr + f21->query15_offset,
> +					f21->data_regs, 1);
> +		f21->max_number_Of_finger = f21->data_regs[0] & 0x0F;
> +	} else {
> +		dev_info(&fn->dev, "f21_query15 doesn't support.\n");
> +		f21->query15_offset = 0;
> +		f21->max_number_Of_finger = 5;
> +	}
> +
> +	if (fn->fd.query_base_addr & BIT(6)) {

Just double-checking - should it be BIT(5) give that reading of number of fingers
is gated by BIT(5) in the block above.

> +		dev_info(&fn->dev, "Support new F21 feature.\n");
> +		/*Each finger uses one byte, and the button state uses one byte.*/
> +		f21->attn_data_size = f21->max_number_Of_finger + 1;
> +		f21->attn_data_index_for_button = f21->attn_data_size - 1;
> +		/*
> +		 * Each sensor uses two bytes, the button state uses one byte,
> +		 * and each finger uses two bytes.
> +		 */
> +		f21->data_reg_size = f21->sensor_count * 2 + 1 +
> +								f21->max_number_Of_finger * 2;
> +		f21->data_reg_index_for_button = f21->sensor_count * 2;
> +	} else {
> +		dev_info(&fn->dev, "Support old F21 feature.\n");
> +		/*Each finger uses two bytes, and the button state uses one byte.*/
> +		f21->attn_data_size = f21->sensor_count * 2 + 1;
> +		f21->attn_data_index_for_button = f21->attn_data_size - 1;
> +		/*Each finger uses two bytes, and the button state uses one byte.*/
> +		f21->data_reg_size = f21->sensor_count * 2 + 1;
> +		f21->data_reg_index_for_button = f21->data_reg_size - 1;

The block is duplicated?

No need to resubmit the patch, please just provide the answer to the
above questions.

Thanks.

-- 
Dmitry

