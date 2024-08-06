Return-Path: <linux-input+bounces-5367-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26219948697
	for <lists+linux-input@lfdr.de>; Tue,  6 Aug 2024 02:19:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2DB71F23765
	for <lists+linux-input@lfdr.de>; Tue,  6 Aug 2024 00:19:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C829912B94;
	Tue,  6 Aug 2024 00:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GThIgT7x"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6D9111AD
	for <linux-input@vger.kernel.org>; Tue,  6 Aug 2024 00:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722903543; cv=none; b=MGaV/G3sUjpviJ6r4RKUvizZLald6JRG8P18tB4Urh+MNUT+jcN1xvmXU7n2gaDxpXOAG0kkR5xNZppWD4+DZKYPcayl3o+3tg5KhSu9nLLx2DQnuIS8z9tWqKc+o7ML3rz4UWlGzsr1BwZPd43fcrNihEBCOt4HZGc6Zb+A+1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722903543; c=relaxed/simple;
	bh=SAMojo8t5vgqCoWViqugemsmR2K/Ta8j0A+8yCov8gE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=umwUC9t2iSnpMBTLUN4w6zvZ6h3fOXjWEHwlobCuwyZvmBX0gJLHnj0wMQvmDy/73JWWFXRyRg2L7vDf1Fw6FC/UTxXgU0P5nrkwI95Ce/lGpXdO/pVdmEfm5KFBECToz7DFhYARNMDUxQrFcKW8++m72PPQBwAi37Sd0TTyHoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GThIgT7x; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-70d1fb6c108so37341b3a.3
        for <linux-input@vger.kernel.org>; Mon, 05 Aug 2024 17:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722903541; x=1723508341; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qI0grTCc/yg58523uzOL0jtLln2dh0F0JR51AIUFqhk=;
        b=GThIgT7xZ8F49z7C9X0HmfoUGwIZrleGGdXzDnPDS8z0gMvicsEWPXL6rPpTN4LQ80
         tz9DaLFSaltk2m44fzOrWv0DpNU1GDlYbRSh6HhqcYm7zB5O0Mt4u/1s5B8K0R4ROjDJ
         8WRhRK8YsBxGGTaFo4Gi2StFpL4DZsXlIezEny6ktXu0Zv5xoKq8VXS3WYLmq9+0QIB/
         kT6pb8H7z/8Cvywl/19FaDJgpXrBS4JTL/QKbpy1Obwx8yiTMQdlI/JvFpmVq7fhw/sq
         CM+5Aqt3mMfcAqY7l5nj5OEbIQtH8wWBAwlUAVj9Z4JnNAxcO6nXxYCfMNA9dTF60mEA
         PD1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722903541; x=1723508341;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qI0grTCc/yg58523uzOL0jtLln2dh0F0JR51AIUFqhk=;
        b=eqvDOFy7pNHwhd+5pWf8JGuY9pH93aX0pJCbwYx0vf0Iwk5uNeHhojoOBS66BD8q4Q
         6z5Us12hXmlbOwpKZw7YcVn39TFN+9LGVTtVGI8Utj0Bv9nS/cEqkf+54hZdKffjPSej
         PsHJPX6mhekmakCc8ONhsITNwNjvQIFSYrpVRmvp6h+ezwuMyDftY8M3SNASIKOlt4Ul
         u5h7BSt/O1sAljHJqruIpyEqqT6w7zNvWT17MW6iGzlZrizrn7whO94RaRbnpNuanDjK
         0A8ylPT2Jh5p/Frx/t+GPgFCAv01D8TyPgWteaZvgZZ2ieNZWZ3zudEyg0oep7/No5sL
         Qlhw==
X-Forwarded-Encrypted: i=1; AJvYcCXnMfprlamDi0Q6s6zmTxQn0HsRPX8LMLNNAoLq8R3zA3528LejjsGAwhbP7CndVgrpRi6WafQsDOCshUFufafkLO1MqqunHh5n8Sc=
X-Gm-Message-State: AOJu0YzjaX9fxl461ym11l4fWuEIqqExD7b11l+6Bz8qKWEWT6uNWr6B
	saWqM5lDZ51S/IM+inOUH3rdYRg8h7Xm+knUiz4X0geJwgyNH+Si
X-Google-Smtp-Source: AGHT+IGf02jJz/XKfQRrWcVKow34kI8lWHowjJScti1Psy8qIQ6lxPv8b12YElXKJiG8Llc7h5HVOQ==
X-Received: by 2002:a05:6a20:c916:b0:1c4:8824:24cb with SMTP id adf61e73a8af0-1c69956aaabmr14003784637.12.1722903541378;
        Mon, 05 Aug 2024 17:19:01 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:b116:76da:13a7:247b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff58f19eafsm74965025ad.53.2024.08.05.17.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 17:19:00 -0700 (PDT)
Date: Mon, 5 Aug 2024 17:18:58 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Nikita Travkin <nikita@trvn.ru>, linux-input@vger.kernel.org
Subject: Re: [PATCH 1/2] Input: zinitix - Read and cache device version
 numbers
Message-ID: <ZrFr8k5b7VvC7h50@google.com>
References: <20240806-zinitix-tk-versions-v1-0-63ef79c7f2a1@linaro.org>
 <20240806-zinitix-tk-versions-v1-1-63ef79c7f2a1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240806-zinitix-tk-versions-v1-1-63ef79c7f2a1@linaro.org>

Hi Linus,

On Tue, Aug 06, 2024 at 12:11:38AM +0200, Linus Walleij wrote:
>  static int zinitix_init_touch(struct bt541_ts_data *bt541)
>  {
>  	struct i2c_client *client = bt541->client;
>  	int i;
>  	int error;
>  	u16 int_flags;
> +	static bool read_static = false;

As I mentioned before using such static flags is not the best practice,
can it be moved into per-device structure?

Thanks.

-- 
Dmitry

