Return-Path: <linux-input+bounces-854-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 137C4817F7F
	for <lists+linux-input@lfdr.de>; Tue, 19 Dec 2023 02:53:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 260071C21C26
	for <lists+linux-input@lfdr.de>; Tue, 19 Dec 2023 01:52:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5904917CB;
	Tue, 19 Dec 2023 01:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e+soH9Qq"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1740B15B2;
	Tue, 19 Dec 2023 01:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-28b62c6317dso920227a91.0;
        Mon, 18 Dec 2023 17:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702950773; x=1703555573; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Hsnir9won/gVO2pwimJB6SLJMpxACsH2wj7JTXwDSCI=;
        b=e+soH9QqSLL5YLp3LNswZw37gIujheMq8H2U1UDbPcEpjK4VF5YFjdaH+tb+2xYN5j
         0gowPZzQWmqC/UDspx5cuLVtoFUjfvzo9N0ePlL8bD1Absxx5Zd9TTa7a8a7shS7JudI
         7K6l874yeIuDqQH6hOkXqkluawjnp+H1Ve1Dx2woCE0dZC9TkdkSZ40e55vVuikOxxFn
         GeG/nvruBHYG1BiwHmzit+1Ms4ukYjFDe/LnAKNA3LmU6C2fYka7i9lenlnTuU6SBkpZ
         SVWS4yRQMK6dXAB7R5L0EyHL8i5oVUNmuqDKTQFbOaeiK33xg7BidlttHVyubTNvA9f/
         7Q5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702950773; x=1703555573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hsnir9won/gVO2pwimJB6SLJMpxACsH2wj7JTXwDSCI=;
        b=YFxT4v0HVWaMAZ6gALCMbz6ZXkdsYbKsHMKZHCZ7nm8b/ahotYXSxHNNRFbjjjXCSl
         jliasb+l34LzVokrOMa5QpEpeRxH3PZPgy3TX+kArY+yT4pOMZFOH/B/dJYK9PvVt5rz
         +W2dIQa/TQ9C3W4RL6Ka7PzUptmuz2R1aGl3AMZ+JFDzfPJgn6zypD/2wlDjoUmuNt1O
         O/px8S//y/BWoeUv2fj7SzVznzGOEnClp+7fAd6nNzHSqhcbwIz6gViwxeNvYD2FyMZ6
         QIeLNYjqu9kCCJgEEaVo+lYBw+PPoWCYETg/uBmT5lVVxPHHp0UOsuOFMYY83fW2xVGu
         Rrsw==
X-Gm-Message-State: AOJu0YyAleSYuFaNOs8gQZZ9MmtJctTyIPmZE591HcuC77O9CRKd0LbT
	py2i2wCQABZPmNSIG3hqqSI=
X-Google-Smtp-Source: AGHT+IGqsIIOGSA7+J0XFzCZIxa9M7+tRp3LRkKXTxhhghgfL/Kj2gt3uhD70Q/zWrjWv67fKeZRnw==
X-Received: by 2002:a17:902:cece:b0:1d3:7c17:a5ff with SMTP id d14-20020a170902cece00b001d37c17a5ffmr3279972plg.127.1702950773228;
        Mon, 18 Dec 2023 17:52:53 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:e0f5:2344:80e4:a1fc])
        by smtp.gmail.com with ESMTPSA id w13-20020a170902a70d00b001cf6453b237sm19692247plq.236.2023.12.18.17.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 17:52:53 -0800 (PST)
Date: Mon, 18 Dec 2023 17:52:50 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	linux-input@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 4/4] Input: da9063 - Add polling support
Message-ID: <ZYD3cvHBHMZoACnQ@google.com>
References: <20231213214803.9931-1-biju.das.jz@bp.renesas.com>
 <20231213214803.9931-5-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231213214803.9931-5-biju.das.jz@bp.renesas.com>

On Wed, Dec 13, 2023 at 09:48:03PM +0000, Biju Das wrote:
> +static void da9063_onkey_polled_poll(struct input_dev *input)
> +{
> +	struct da9063_onkey *onkey = input_get_drvdata(input);
> +	const struct da906x_chip_config *config = onkey->config;
> +	unsigned int val;
> +	int error;
> +
> +	error = regmap_read(onkey->regmap, config->onkey_status, &val);
> +	if (onkey->key_power && !error && (val & config->onkey_nonkey_mask)) {
> +		input_report_key(onkey->input, KEY_POWER, 1);
> +		input_sync(onkey->input);
> +		schedule_delayed_work(&onkey->work, 0);

In the polling case you should not be scheduling any additional works as
the driver may get confused if you repeatedly open and close input
device.

Also I think in threaded case it might be cleaner to avoid scheduling
work and simply loop in the interrupt thread (since it can sleep).

Thanks.

-- 
Dmitry

