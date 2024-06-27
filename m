Return-Path: <linux-input+bounces-4687-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F51891B30D
	for <lists+linux-input@lfdr.de>; Fri, 28 Jun 2024 01:58:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F15B283A57
	for <lists+linux-input@lfdr.de>; Thu, 27 Jun 2024 23:58:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E030F1A38F7;
	Thu, 27 Jun 2024 23:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MAm6E76D"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667001A2FD4;
	Thu, 27 Jun 2024 23:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719532711; cv=none; b=bz3wt0vm4ymcb4dYr+uOqAtYiPMfR0nkWakyow7e84XYTNx/MK941HnVF8kgeuMryBP7J8ECAOnMTZ2v4nOIBo8MYxwWV/EbKEcxV81xVvOnQUieqUX4r1wU+d+1b9kbW1hiv8y83uLJQgH5g7c1TAIf0+m2j7CKM9miRfL3Bx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719532711; c=relaxed/simple;
	bh=VvEmbALPGz/CqKOGYJCQ7qM1A373D4L/J/qlsil0cmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VAvj+sfCI5N8cXWuPlsAOV6a/RGarbuNP5cOzxQS8rGVWj4oKzzFag7Dc+uGf0QFtJ57IsOgUmZyj+ylXWfUimv7qc4yxMLDi6R7hfNSBh1uo2sObLpXYW4hiH+R9RrYg3pFvFg31aY5dTe3VNFa/G0Q5gXDoBiApt7uY4+ey6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MAm6E76D; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-70671ecd334so62341b3a.0;
        Thu, 27 Jun 2024 16:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719532710; x=1720137510; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SlgJ747gekZZdrBLHi0FNPvw+j4+eabf4RtOttHEcPQ=;
        b=MAm6E76Doh0/cOGMyYu0qHgDKCLszLkNp1lncdUQ2LXUeC0qeSj8iDDIOmvXvEeAQf
         YoD2AQ23NV0X+MjICVsjpFT+Wr9SEnUIINNgbKnqrI4nh87ptSgzDiHagByzLsU86tAq
         f0VXPhEWrbH2LBJ7IZHV/C4Du/aAKmHMABBVgKYQ266oQN1y3+o79EIvbbObnbXO060D
         zJYOtG3wdiKBOfUpbc+x6xfSkZytOp9znoOjzlV4ZUQK6f2Ka0HQG5OoPED2dgt/ScUi
         0bTBtO9fkLAyKIAz/tDNf98XTQzMYG5/R2ObEMRMPGE8VxpL3Au49bMrFawtEZONVWwI
         GzkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719532710; x=1720137510;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SlgJ747gekZZdrBLHi0FNPvw+j4+eabf4RtOttHEcPQ=;
        b=PCk4aAoRnf1z5f+lnUQkGNc/MI4WpqEwk8RIhCQCvTwjJSWxN2Tc4sVZlafgSrtwoU
         iVBYEQG8cy9lW5qavBaAd9a+0h1dVCmAQ3jsU0wi6b50HMJ5XfmkEkc71lzwWk3wfo1E
         6SN+vfYdmzGDqcfUQwOfn2XSHO2HS1pwpIa2CVzfdDsaw6qKpY3Pweyx+zIT6kBvzSH9
         Ok6nkZddIhJ7as+yHPX9B9NQOSqJaLL2zgit6ahiqMhbA3T5qahBebyEFxVd+Hn6UaDC
         Uv390ZYrmSlw1v+55mLeCsfOpN8qR4I3z2FZPkbS0AR+nHRe4ifIaJbpYg/k+geu1vrO
         15ow==
X-Forwarded-Encrypted: i=1; AJvYcCWhqtiaXtSoXKlaSWWWsX0eA1aWNlexOibP4+Hfm1FS39Ylus7xMA3kzO+dR5AbeOgbL5dvIngJFllJsvepAXhrmAPG6RbsxcWXW4Az8pCLWFI3lIgq0Vg5tLzHisMN8IP7b5S87Ph5ilAXsvvFNKmEA0Fl/38+kCnkdPl1JqfRFNlS2BhB
X-Gm-Message-State: AOJu0YwebTAsDPwqSaJ1l/eMMRpHHABWGUPuPDzfx/cuC+XcffAwBgI2
	63+5P8oX/1xKaUv+miVIc7u07ryP9f4UloqvkijrURnHNwv42Nqq
X-Google-Smtp-Source: AGHT+IGK9yAdSPH8/kcb7YeTj/d2kPcFUZTaSP6n+f/K5RJLPg2HXD8SzlEsAacZXWRJiB4wrV6/Zg==
X-Received: by 2002:aa7:9dc4:0:b0:704:2a93:a6c2 with SMTP id d2e1a72fcca58-70670eead80mr13868250b3a.17.1719532709454;
        Thu, 27 Jun 2024 16:58:29 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:c929:2998:720d:a104])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-708044ae395sm299712b3a.144.2024.06.27.16.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 16:58:29 -0700 (PDT)
Date: Thu, 27 Jun 2024 16:58:26 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Daisuke Nojiri <dnojiri@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Reka Norman <rekanorman@chromium.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Gwendal Grignou <gwendal@chromium.org>,
	Pavan Holla <pholla@chromium.org>,
	Lukasz Majczak <lma@chromium.org>,
	Ching-Kang Yen <chingkang@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Prashant Malani <pmalani@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/2] cros_ec_proto: Consolidate
 ec_response_get_next_event
Message-ID: <Zn38onz6Dm4Pt4DH@google.com>
References: <cover.1719531519.git.dnojiri@chromium.org>
 <fc251d6935c1cfc39d7a31d3cfe735d31a0371d1.1719531519.git.dnojiri@chromium.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc251d6935c1cfc39d7a31d3cfe735d31a0371d1.1719531519.git.dnojiri@chromium.org>

On Thu, Jun 27, 2024 at 04:53:07PM -0700, Daisuke Nojiri wrote:
> Consolidate struct ec_response_get_next_event_v*.
> 
> Let X->Y indicate kernel X sending EC_CMD_GET_NEXT_EVENT to FW Y.
> 
> Old->New:
>    Existing kernels send a smaller container (e.g.
>    ec_response_get_next_data) which may or may not fit the last few
>    bytes. The FW copies as many bytes as possible to the container. The
>    kernel processes as many leading bytes as it can understand.
> 
> New->Old:
>    New kernels send a bigger container. Existing FW copies as many bytes
>    as it wants, leaving the last few bytes empty. The kernel knows it
>    didn't receive full size data from the returned data length.
> 
> Signed-off-by: Daisuke Nojiri <dnojiri@chromium.org>

Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry

