Return-Path: <linux-input+bounces-6906-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F0B98A801
	for <lists+linux-input@lfdr.de>; Mon, 30 Sep 2024 17:00:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CAE1BB280D6
	for <lists+linux-input@lfdr.de>; Mon, 30 Sep 2024 14:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B4891917F1;
	Mon, 30 Sep 2024 14:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZyoEcp3U"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4925190471;
	Mon, 30 Sep 2024 14:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727708393; cv=none; b=gIw7cYwgYJNmYVH0zy42fytQDhw46i57gI2mrYAY7fXw7IQAnAGnDxHTV8+JpaDxhjl89Mp2YxMRVKTrCHrWGHX8xWw04zpg0mHlP4hlOXnkho+zJWCYIpxWlf2a43PHkfgTfH127XKcUjCsYDZkjPa9cnoTzuGf2hx+MIM8Qv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727708393; c=relaxed/simple;
	bh=Y2tcEkmIwJKzjGaJTn+E3RreDWmeS5vWrAs2dhqRFBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=chzQIBOEYzyuP7BZ2z5fmikGq3th9lBVGbNH1P5ltj3IhU8udpTGs0iT4ojbohWKwJQSPaT7INHLQEBSpU/JBjirDim07vwFLFghMdGiMOk/bWVLk2Mz4JtAD1o2OX6k2ZqUS3KUdvHD1fCRJ7yiXgsgAyWcOg9Cc+wUfTIaJiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZyoEcp3U; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20696938f86so38753765ad.3;
        Mon, 30 Sep 2024 07:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727708391; x=1728313191; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OFZabu6/EuGD9so3eFqCViJBMXs8SfL9R7DI8/Lv3Mo=;
        b=ZyoEcp3UMrl2uaYhAe01TJ9jKQwQYmoOoxuZEGa2JdA2/FN1Qa8ALrTdhvAGXF2YUe
         4tOAGxFxZCZqHiJwG0wnvNhI+8hwgtp3qTiQ6q6cbr5UPsRwetPQi5GsnQFOnV70rRW5
         /RES6JkpViglhfT4Nqk9Hjr6JObhNb4xyjb2PJO6Qr8XRHazKCnHkMzm+3IJzhu3QNb6
         hR9xf26GAo5MSxSuWkv94UR0tmMF4JRHmbfFGt9pro2D3ck8J9IpMQI5P0MldUtLks/v
         g55NNsf/NK05PP1EP4bc+xo8bfcQ8Hkw9qOzitMB93ph3hZS6s1WHw4VlOBdzVgXsC2M
         GumQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727708391; x=1728313191;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OFZabu6/EuGD9so3eFqCViJBMXs8SfL9R7DI8/Lv3Mo=;
        b=NcVCT3U6VTY5qG5tTyP9cNJFkLVC9zwkjHwwOxpvbi9WQ0jljubdh6iYyx6S5VKDH4
         XMN2D38mF033EBAIOPRpHwNiWUcValjEy/9Tw0z6Xi3ULkCJY2eO/+2j5aTDtQKvpTGp
         i7Imd4chT0uxkosdxtVd3A+2BfowtfUMwaJ74gV8QH62wJdLBIwEPjDCTiWv0EN5BzlA
         fdxhWO4Mlu0zLDe0CXYFLdHKQquQKPr8xNVvn9w7Cjrpq6wgz3v1AFPgRzqgzI0Z/7pN
         UL0WAM9tJAwmoK8dzXV01aSS0xpV6PU093BmUTG8G1b+Q4rwg92WMEYuWdG0I+BuCVW9
         Dexg==
X-Forwarded-Encrypted: i=1; AJvYcCWxicKZcNhwZkEweL+UiUjiYzFae0ipUqI4KOzz+nhoHTCuQ7l+XQJy8mDItq420BfdQJdunvH8r5o3eg==@vger.kernel.org, AJvYcCXKmhIbb9/6LcBWgrsvA9hquxogujiaabUOhQ7fnRQ1sLAwh7zRS1my15yar23MdfDz+4bXq8spQ710hQGk@vger.kernel.org
X-Gm-Message-State: AOJu0Ywuu8AnLedsItrF1vnaFZs0BVJylz1qWZDl9oM+3Vdy7eWnRGbn
	v4BNucsPJ2PrVLUU6luDJ/8pzv3lO8OMMezqa0lP4jjwcgl69d6g
X-Google-Smtp-Source: AGHT+IHT5XTFhpto3WFrh9GWPbjt7aTddIG0CfgoiCnk4FxwdYw4bbBd0qvh/Vgt+5BdakZW/rpcNA==
X-Received: by 2002:a17:902:e850:b0:20b:632d:27c0 with SMTP id d9443c01a7336-20b632d299bmr104795455ad.41.1727708391076;
        Mon, 30 Sep 2024 07:59:51 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:671d:78af:f80f:975b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37d68a93sm55507545ad.56.2024.09.30.07.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 07:59:50 -0700 (PDT)
Date: Mon, 30 Sep 2024 07:59:48 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Shen Lichuan <shenlichuan@vivo.com>
Cc: o2g.org.ru@gmail.com, mitr@volny.cz, Henk.Vergonet@gmail.com,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	opensource.kernel@vivo.com
Subject: Re: [PATCH v1] input: misc: Correct typos in multiple comments
 across various files
Message-ID: <Zvq85KfvZpyPQKXv@google.com>
References: <20240926075515.10042-1-shenlichuan@vivo.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926075515.10042-1-shenlichuan@vivo.com>

On Thu, Sep 26, 2024 at 03:55:15PM +0800, Shen Lichuan wrote:
> Fixed some confusing typos that were currently identified witch codespell,
> the details are as follows:
> 
> -in the code comments:
> drivers/input/misc/drv2665.c:18: Contol ==> Control
> drivers/input/misc/drv2667.c:19: Contol ==> Control
> drivers/input/misc/ideapad_slidebar.c:26: meaningfull ==> meaningful
> drivers/input/misc/ims-pcu.c:742: bootoloader ==> bootloader
> drivers/input/misc/kxtj9.c:28: funtion ==> function
> drivers/input/misc/soc_button_array.c:518: indentical ==> identical
> drivers/input/misc/wistron_btns.c:274: satelite ==> satellite
> drivers/input/misc/yealink.c:380: singe ==> single
> drivers/input/misc/yealink.c:617: coresponding ==> corresponding
> 
> Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>

Applied, thank you.

-- 
Dmitry

