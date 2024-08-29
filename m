Return-Path: <linux-input+bounces-5949-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D955F964D53
	for <lists+linux-input@lfdr.de>; Thu, 29 Aug 2024 19:57:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 189501C21EDD
	for <lists+linux-input@lfdr.de>; Thu, 29 Aug 2024 17:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F27CB1B6543;
	Thu, 29 Aug 2024 17:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N/FU2x64"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1D91B5824;
	Thu, 29 Aug 2024 17:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724954266; cv=none; b=Zq6zCCdSg1PYT1hzunpcN9L0VazusRsvhoTEIG9Btl8bIVwVG1t97NLie7laX7YUCp/bOsx+/GyWMe7QoZgAfWi3oYquMHXUfPsQ+0IksbbOKeFCAlrKRzHhsagCumH3bZjqUrv9NE4PpkMdwXa7323O/hSmd4iExgtLYLa/R6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724954266; c=relaxed/simple;
	bh=T6WI8Lw01foexB/1O4uLWwUhKMh6qWqXQD8rGjqCJCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ig7IoOSiPQnUGLlGM7eo8l0A9qiSylTLiw3VK6S+H+momcXWZEdFkBXpa1j//pTnvOX1irX4YXdHQY47RiYvTtm/XO+wNpKYg787EY0UEC/KOAszEPqInQn1apxlUdqouLqxnHZUCrd+Nn8xwqdg36G702EPFDNdXmRwpSPCLI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N/FU2x64; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-201d5af11a4so8860885ad.3;
        Thu, 29 Aug 2024 10:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724954265; x=1725559065; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HJza1Biz7WAacTNVjTKwjOUpYOqWndzdrTWRBGwQSdQ=;
        b=N/FU2x64UzvWg5gth2U5da4RdqpXO6bqSdqVh+3x/1DTW4JR+GcBYV6U9zb67b/dQb
         m9zdLUCDZicotzfO4zL9z1X2fsroTb+jInVYDzad/UsymSRjuMSKUeqgORY9YAy7Vtjw
         JYIPcAgYFgHoMAOFdRcbFsvoehZt4ej6yYsDnnffb5SYQSUIBXnAiuczCetchaAwYbhD
         QuhQq4j9+3BEQ6K3AJYaO8kGxRGijPevs/yhhg7Gk8OnXxIbcaOnQk0MP3Ma8WeKLRqw
         eXjeFeRU/uK4pBdhLmeUw96uJOH9qsDhfuhz9+2tgBS7dtTRBtWeCa64e6uLb0Zny0Vk
         gfuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724954265; x=1725559065;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HJza1Biz7WAacTNVjTKwjOUpYOqWndzdrTWRBGwQSdQ=;
        b=RO2VHfM11ayzZ1eGzDKPy07Gj+uOGrNleRbRNGxwNhgKjC4JtDWSb5Iwl9GjWngQB3
         RY12O6Z6r92sdvbdcDeeCyB0jQyq/dTpeFW/m+2nJTopfQkVYXuAlMMOF5NnxCsUXjPa
         QuP3pDSOSocApr6MDRJqh4zrgL9VcMuLvfXdGJVgLX3uIojqg2Xf0swu9MHYvIl8MWGJ
         INT7WJGe3NsRkzkXJdQwieZtUt6dT3saGOE9yVH7G5M9ke0wCIFCwQ6XycbMVm/YYas/
         AhyIl3tW9vQMwuT+K/qEQ8Wtn89QddBPIVNUD1kfbQgLLyh3Ecz9jDNWyMHqi5WyP31t
         cy8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWgHkCzhBSKxX69EvFu+PvnYPY/Xik8lNyX8VrLYva98yFUq2HhJH7Ohwjzc7pT37KgRmn6P1lG8BepiOo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNtPB6mXi5HVqUa2pXqv7nqNyAJldHsb8fLKH/9EQog3BY1MPi
	OrT3qzMPrG105B7mybXznSKNWofC9TwXmuZA1oE5j7Juld13LWRX025tnw==
X-Google-Smtp-Source: AGHT+IGJ00EPg1iEsjL+C+UO9uTzBzl6cJWFOa5tKT6Y07ORaD/vYkdHLaFkU47YwbADb6xDRvTnDA==
X-Received: by 2002:a17:902:fc8d:b0:202:3174:9d44 with SMTP id d9443c01a7336-2050c346abfmr45326775ad.20.1724954264421;
        Thu, 29 Aug 2024 10:57:44 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:2ed6:5fae:d35c:9c2d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-205152d041bsm14218745ad.113.2024.08.29.10.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 10:57:44 -0700 (PDT)
Date: Thu, 29 Aug 2024 10:57:41 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Cc: linux-input@vger.kernel.org, Erick Archer <erick.archer@outlook.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: alps - use guard notation when acquiring mutex
Message-ID: <ZtC2lcKuZd-NbDdl@google.com>
References: <ZsrBkWIpyEqzClUG@google.com>
 <20240825201347.pdphq33cmng4ltds@pali>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240825201347.pdphq33cmng4ltds@pali>

Hi Pali,

On Sun, Aug 25, 2024 at 10:13:47PM +0200, Pali Rohár wrote:
> 
> Hello, I'm not familiar with new guards and their usage. But if this is
> a preferred way for handling mutexes then go ahead.
> 
> I just looked at the code and I do not see any obvious error neither in
> old nor in new version.

Is this a Reviewed-by or Acked-by? If neither that is fine too, just
want to make sure.

Thanks.

-- 
Dmitry

