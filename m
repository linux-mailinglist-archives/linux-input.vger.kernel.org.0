Return-Path: <linux-input+bounces-7644-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB689AC95A
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 13:47:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 567BDB214E3
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 11:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DC3D15B0E2;
	Wed, 23 Oct 2024 11:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mNrup+/R"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F262549652;
	Wed, 23 Oct 2024 11:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729684017; cv=none; b=JSwDbHohh5TP/DB2e+OZdbGNqiMTFVkWrnhBnhXnq0G7HtQAnGIxzjnYsLL3gBqx5o8tTHb6c0gTrq14DAKjsnIXmR8GcPGabIiEV+FjumzPZC0FSiSx+zev9BPEg2nh1RLplMySQQ3LuAPIgHDiuiRMtnGRViMwkxiPyIFkrYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729684017; c=relaxed/simple;
	bh=lUMdmbqWp/QCKZv6BcJzumYsfeCX6w9mAbHLy3btNbU=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QYaJQ4zIwBSioHkaERJrqShwbXkE8BMbPfdbOZeamDb/0oMq6XmNLGi1ArNb9FsD5U40EJ5kpizH0gP3EyiUZRIzWFHMkLWqbLYp9+PHm5BxlA6gNz8JmNR7n/Vos/tZNgMl3SfSzm4jzHZNrZdFPWLNQ7JMBizZWCcnf77273o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mNrup+/R; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43155afca99so5258095e9.1;
        Wed, 23 Oct 2024 04:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729684013; x=1730288813; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=plAsxO4PCbKsmy3ZQnDvRzjUJc08W0m0O+/m1oLAOsI=;
        b=mNrup+/R5aQNkV2UF0ZDan184XY9VMWDI0HUKHtkb1XuahXin+tcHfupDq5rmsOndx
         j/JmYbuDVboT/DZ2CQl23aB6syMCZoQd4S3Amv9nwA9yUVuiETiPZ41PTC7UEOwY+xD0
         DqVYVy1SNbMwDowTNJvVFHl9S1lBo8gXnzVvMrQYoxIdX9g/njEXeKBglh2x/pQiJRI5
         bN9OqPsfl0/QGunoqaEtWZynxAzTRJXfp3rKhbcnU5KtQcK9L9sNWELN1uMWXiTqBKLI
         fDKP4aSpjSGiQtArZlAaC6iQtrgRsyk9J3TIrfxzi/L1eQ4Q/bKFrpX3HXhwnBzCubLx
         jqGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729684013; x=1730288813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=plAsxO4PCbKsmy3ZQnDvRzjUJc08W0m0O+/m1oLAOsI=;
        b=tXzdQC/YqRFnnHR3vgB2nJ9MzeRWo3+gDqKUSoxuQLEBl8DeLl1zFz3TYQJbSJA7XX
         hP7LRfppUHFUPvLXOg1TRWpLIcno0SnAfnvDnqM2MCDmdcoF06R6TL4lO1XrK0sn/YDv
         Li5EsCSXsBbnprcfaER74XByqgl8mnxV/YmbTMusW9yFbbmon39x1AAMPzUF/WD3uNfp
         IH0NEdiZVV7dSCdmC+bEUYaERgheEUH+N40EuhBmb+DdhOlxesKoGk4Dkuor14dGgauU
         9Ws65fkEJFvopiomtmAoSFBhgEGFly68Zy2DzzspwsvV+zqb15C83watCFq5QYc2gCpn
         9BfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqjRUwYEv6Uvv7GscRy8qUFcvxclNC930HwIDR1vohIDtFsoyur8Qt9cncAvyiU7VN/RolnHZPNIieU6Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyT5YDQPJVZNkxAxWR0mRDp5nDhShnmJsyB/84MFkg7vHem+Lwz
	rBZWWpWyud3B6DscyEWXgOSCVbfa4N+DnufDDDE1HKwVID70EO1jihOshw==
X-Google-Smtp-Source: AGHT+IEL4eRtzgtGJm0/dlJVQGIKjvw0RrlG5gQRGHXwK67hxnxaeNDPfxZ8Eq3pFgIw0bZ5zdR5bw==
X-Received: by 2002:a05:600c:3590:b0:431:4a82:97f2 with SMTP id 5b1f17b1804b1-4317bd7f68fmr43810555e9.6.1729684013095;
        Wed, 23 Oct 2024 04:46:53 -0700 (PDT)
Received: from localhost ([217.151.144.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b9bb66sm8661930f8f.95.2024.10.23.04.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 04:46:52 -0700 (PDT)
From: Oliver Graute <oliver.graute@gmail.com>
X-Google-Original-From: Oliver Graute <oliver.graute@kococonnector.com>
Date: Wed, 23 Oct 2024 13:46:43 +0200
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Felix Kaechele <felix@kaechele.ca>,
	Andreas Kemnade <andreas@kemnade.info>,
	Li Zetao <lizetao1@huawei.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: edt-ft5x06 - fix regmap leak when probe fails
Message-ID: <ZxjiI3at4r+QGBMK@graute-think>
References: <ZxL6rIlVlgsAu-Jv@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZxL6rIlVlgsAu-Jv@google.com>

On 18/10/24, Dmitry Torokhov wrote:
> The driver neglects to free the instance of I2C regmap constructed at
> the beginning of the edt_ft5x06_ts_probe() method when probe fails.
> Additionally edt_ft5x06_ts_remove() is freeing the regmap too early,
> before the rest of the device resources that are managed by devm are
> released.
> 
> Fix this by installing a custom devm action that will ensure that the
> regmap is released at the right time during normal teardown as well as
> in case of probe failure.
> 
> Note that devm_regmap_init_i2c() could not be used because the driver
> may replace the original regmap with a regmap specific for M06 devices
> in the middle of the probe, and using devm_regmap_init_i2c() would
> result in releasing the M06 regmap too early.
> 
> Reported-by: Li Zetao <lizetao1@huawei.com>
> Fixes: 9dfd9708ffba ("Input: edt-ft5x06 - convert to use regmap API")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Oliver Graute <oliver.graute@kococonnector.com>

