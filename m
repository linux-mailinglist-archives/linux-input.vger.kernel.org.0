Return-Path: <linux-input+bounces-6659-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA1D984F78
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 02:32:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 458991F240E9
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 00:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B5AF4689;
	Wed, 25 Sep 2024 00:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V0BbCCeY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B3B256D
	for <linux-input@vger.kernel.org>; Wed, 25 Sep 2024 00:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727224357; cv=none; b=TKj94jwuN6vgcvW2ak70SqWFJuPI/f6y44U6GmrGQpaUTdsTIQX4UZKRNNkn1cD1crOJSKTvO87wMdcZ0U1V+ZzCW4HjDtQXZKercvE7ntWMUrjUD6U4YcxYyZNv0FhSekHPdxIQ0lCM/bT9Lp8mHiyi1mXaAwFM9nPXm9xEpp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727224357; c=relaxed/simple;
	bh=1mP6Ih4G59A6qkPVuXn1DrYImsn4yclWYE0YPrSyOyU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CgSoXZNdF7lGPI0lFf+4OE+AYWbU1IxS0ACpGThG7YV6EcC+lxO3bc7YE4ASN/gghuD9suYkd4UK5mgWWhwJu+ovlw287T7+SN8KatjeLNeYYWEZuwKvikYM/gtUdu+bMLNCZNE8eqqzLtrBLjdmR7lHPkxn+vMb+EOLCs1/Mi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=V0BbCCeY; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3e037a7d2c3so227722b6e.0
        for <linux-input@vger.kernel.org>; Tue, 24 Sep 2024 17:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727224354; x=1727829154; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cKpbUlFq9zFj2SDO/vJpUQOdcuejJj3IWGAJsJZVEfg=;
        b=V0BbCCeYa/MmiL5gBY3XLGxBDt7PXo64245uBNubcmrvkory3EOQRGEKlZiV7/NcTJ
         Y1ByA0jXEgBlFBhZ062dez21KgVnC5xDWGuKbBcCjA8HrpsGjH8jr/ITISgjDAlNpn6N
         E4wsCCKxShvr6/3yJzZqcEJ9ghQvYqF5t6zE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727224354; x=1727829154;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cKpbUlFq9zFj2SDO/vJpUQOdcuejJj3IWGAJsJZVEfg=;
        b=B6dZX0UROSmzTiRxQBZIgDlS36kGdXy+7qEJdjymlMQ4hQaXS8uGrqtWkekbMcH5uO
         PA9/zCaIBZ4wtLmqnzd7mbucQ4YWmvtn3YUBixqA8mYJ5mlYGIsV+LPBeBLEU4WIhHfF
         XXe9Nj29jubFc4stx+uhx7sm9bVG47gmINmjsveR5Ecv47OsmkEK31WDjSpq1Wi+nXc4
         vWXOhFctdWNdCHwsgHBudTQr1mJmaEpy3wiW2RTVv4NdvGey/WWXYKJmMQNofmaM0pdK
         8w4xCmi7KsnTeldK5AqS66oJPc0ssb1h8C/nYnbxULouTsokVE1S/DudQWFoaA2QxIiy
         7DMg==
X-Gm-Message-State: AOJu0YzlJ1uZ3XDRaMbwMx4AAmRA1we9tjSL/ZfmToHXxAoimap3w0oF
	Fz5+CHkRddOnhJ0juDOC4YovYD6hMoSQ429NppqCuQQtKSBjBx6pDQg6Pu8MofmRxYEP223Pg8Q
	=
X-Google-Smtp-Source: AGHT+IF1H1LbPN2sYvYppLysYp48GGgMUWxv7Yrc0YsnVF8KDoXt9MoAB1fwWX57Xf8Z7FtamBZ9Jw==
X-Received: by 2002:a05:6808:f03:b0:3df:2ea:51cb with SMTP id 5614622812f47-3e29221e4aemr2399298b6e.6.1727224354265;
        Tue, 24 Sep 2024 17:32:34 -0700 (PDT)
Received: from google.com (syn-076-182-240-212.res.spectrum.com. [76.182.240.212])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3e29396feabsm783579b6e.56.2024.09.24.17.32.31
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 17:32:32 -0700 (PDT)
Date: Tue, 24 Sep 2024 19:32:30 -0500
From: Aseda Aboagye <aaboagye@chromium.org>
To: linux-input@vger.kernel.org
Subject: hid-input.c && vendor defined usage pages
Message-ID: <ZvNaHt7ePvoUpgy8@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Perhaps this is a naive question, but why does `hidinput_configure_usage()` in
`hid-input.c` configure vendor defined usage pages? In actuality, it seems like
it's mainly handling some HP specific usage pages.  Why aren't those in some
`hid-hp.c` file that's selected by a kernel config?

Curiously,

--
Aseda Aboagye

