Return-Path: <linux-input+bounces-13174-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD149AED235
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 03:28:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C2B63B1510
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 01:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E394714AD0D;
	Mon, 30 Jun 2025 01:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iW74vJm+"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E006E56A;
	Mon, 30 Jun 2025 01:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751246903; cv=none; b=QFXV5XBzRf4l1SxgYA0VVrkV9+x0eIfBX9xE18ZyjTNtU4pLQyCwhwmyq6Dq74IfzZM7g0ACERMJZfGBNHXfVe7rCc7tNbd2g1QPrkNUttsdmOnV4H2CHgOWpmIgc02KHE4C9kQWn0reZ6EzRW8Wtpdahy0WfvnowgxDF3V2qUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751246903; c=relaxed/simple;
	bh=LxnxdqKVF6OqeNcMlrOScMjyDVg2H82nmYyXIreIaOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ENbkJ0iyW9w5llKJovfTaeot1Eh7deqJ5LqfFhATs6/NdRh7o1azUTQ5kviG0w5Mh4h2VnmWins0OglJhrvv7YEV6H5NfRNJEB1p73PuPDOl1KEFF/RFUfSzqRKfnmzF+A8encdmNM0L0UxWoRQl+/nb9zp/I4ZdlkwCujnwdh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iW74vJm+; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-748fe69a7baso4133060b3a.3;
        Sun, 29 Jun 2025 18:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751246902; x=1751851702; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y7+Cs2mMFyRe12Hi0Vnz7lZckoc8hoQk7TLkK9V+qD8=;
        b=iW74vJm+q8lG3faJ9RW1y8r2jvte5zPb/tXpjyd7m032SEvMxO4jxhi+7/q5KKKAPN
         /dseSOGNHEollQHyRRalz2RhBEPDByBexDIuI/+pLY9oqFKLTIBJ9CSFqklLM+g2zMUF
         Ly061cz7XqcQeqviW1zrjGPncklWfpQaJXHPkKw5f0ZJNbexXueotlK1B3GUFvlBTN3O
         oNDhMVmWxW6MxzWfxfWRUZrRg5gHbp5NwCDnPf+yLEgAxhrHxFWrpTrcEdZ16V/ML9DQ
         jvAKzoF7TS2QMntUm0Ci3haiEOcD5HxUOlWxosMTyYbGY9OCPNTn2YRc9+/zRifyjBHR
         a7eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751246902; x=1751851702;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y7+Cs2mMFyRe12Hi0Vnz7lZckoc8hoQk7TLkK9V+qD8=;
        b=ZMUiaCtv/ykNCk9g/OjkNUGoodbpQdRWokgZqYulPeu+pwmKgvnJ7FelTd11dqaPzE
         L3yPFGu+rlx2E5h8cpZcm5wKhEb7C5lUEanepX7vbd3V3gw0ZAXRF8xNO/t7Lk4Gn9HH
         oENCeI1iQtYT7SzkOqWEI6XHCNSLof6MQwFEF59FLBP+4xqeZwmBxsyoS8Iof2wZ76kO
         wPrTLGjudRPwWM/r0xoVYHxl4sZf4VkL35BeF7P2gNzhRTtjPWps8h160yvJJEMy8KRK
         Knyy5/jXLBrEgmNqYXzirQ3/OL0cYDoa3FEka4dd9wd/2IpwFguIJbq/DK2pKTvhX5in
         GX7g==
X-Forwarded-Encrypted: i=1; AJvYcCUfR+QlBISLOl6Q0E0lJBvVdsL36FdUBAuDiAoFY5hA/+/kldHOfx2LBml8g+Ddm0umrWOVk9vzdbgix+zD@vger.kernel.org, AJvYcCX1QgzUiVPyzufTj07kKUoKhMl5KgFmeLlP3fcnWrB0FRJiSu3741eaJk3ml6uAHS0oaCea4DzJe0Wbjw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxW/70vLgg8Zh9vdx1xpggdz/SuRnkK5HK9zmW3/iWSmiNCCCkb
	2zjrW4WEKZhPLeOb68OpE2bAwGC98fKA3/eShOe4ohZbciFcJsnrP7T+
X-Gm-Gg: ASbGncvDyNAoqBzLEy4mIsp9qOsDwulYI7GTGRycXYLEq8ZGuh4pqKQdIFuDHnK31VJ
	OA3Ya9dUCNmOp/7CSseYmoJVsU6LkxHPM2ZoMQP/pr/eS72u2zGbG2tEBV2wgke/juTc7u35WHD
	t68+u57QajzjEPVvqzxvheKKasRUVDBrKe15sleMt7O/bfkAKJtyuM5q+/TljPiyVspHNJB72A2
	IKe5jyk2+lhkFyLfHOMQoS5UK1TN8ZCCU5WCPqfXM5FgulEzc0MB0BEheTiaGfmSEXxytyGW6dW
	s2seBk9JLSuPXIOb4+M1LcMXJMo1CusT/NGK+vyu7NHzSeMbm2dveaPPe0xFxGI=
X-Google-Smtp-Source: AGHT+IHQVjSotoxpoYNoe3y6WLOzN5X8jxNDmKd06wTvj7u/BuNbjWGw3dnk2u6wMXyMa8DYbfFDEg==
X-Received: by 2002:aa7:8884:0:b0:742:b3a6:db09 with SMTP id d2e1a72fcca58-74af6f6d604mr15231938b3a.16.1751246901663;
        Sun, 29 Jun 2025 18:28:21 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:d8da:e3e0:2b93:2315])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af541e66fsm8171246b3a.69.2025.06.29.18.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 18:28:21 -0700 (PDT)
Date: Sun, 29 Jun 2025 18:28:18 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Joseph Guo <qijian.guo@nxp.com>
Cc: Bastien Nocera <hadess@hadess.net>, 
	Hans de Goede <hdegoede@redhat.com>, "open list:GOODIX TOUCHSCREEN" <linux-input@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, haibo.chen@nxp.com, justin.jiang@nxp.com
Subject: Re: [PATCH v3] LF-15225 input: goodix: add poll mode for goodix
 touchscreen
Message-ID: <idfsvfqivfng43r6h4ni3sqxeei4ra54dmeq26ld7vmyj5jtgd@z7wj47eh6kwa>
References: <20250522020418.1963422-1-qijian.guo@nxp.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522020418.1963422-1-qijian.guo@nxp.com>

On Thu, May 22, 2025 at 11:04:18AM +0900, Joseph Guo wrote:
> goodix touchscreen only support interrupt mode by default.
> Some panels like waveshare panel which is widely used on raspeberry pi
> don't have interrupt pins and only work on i2c poll mode.
> The waveshare panel 7inch panel use goodix gt911 touchscreen chip.
> 
> Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
> Reviewed-by: Haibo Chen <haibo.chen@nxp.com>

Applied, thank you.

-- 
Dmitry

