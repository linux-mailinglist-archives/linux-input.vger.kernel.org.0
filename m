Return-Path: <linux-input+bounces-10629-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CAFA56ACC
	for <lists+linux-input@lfdr.de>; Fri,  7 Mar 2025 15:49:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D53AD3A2E74
	for <lists+linux-input@lfdr.de>; Fri,  7 Mar 2025 14:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0554916EB4C;
	Fri,  7 Mar 2025 14:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="izNuZKWz"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFEF8BE5;
	Fri,  7 Mar 2025 14:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741358942; cv=none; b=gzel7KF2NqcLlwqjIrYyYzRZK4FG5aknq327x7f2kyre29lXY2OqywiJMXEsIvOGjQBRxY70NN8Kku5HR6cW/omLJxIHpt1ZrEpdKWm3rKoVebY/M23OcpMNJddcEaMpkW6AjNGwRi0nY+tVDm1fsbihSp8DJ/Zd1DgAaqoXCPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741358942; c=relaxed/simple;
	bh=iZZ2xdpV8WeIZB4WfHwtkSgx+wy9w34BMYHyQVeaHVI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=HSIlNodvavyzFTTX3wyhl4+g+lqZuVFy9KTkDZmWyCn2l5E3wgsT9xmFTfY9IxATgtQlW386fk290lMAhyb+XDjs2avWdXninEdWnfF3GOsvTltXj5BtCA5bHTN0JgUNIDCu9mzX3ZWaJ47UAKEdvpVrKCYtKOGkqFiGNRRdogU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=izNuZKWz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0288CC4CED1;
	Fri,  7 Mar 2025 14:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741358942;
	bh=iZZ2xdpV8WeIZB4WfHwtkSgx+wy9w34BMYHyQVeaHVI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=izNuZKWz01HzeSy2QUnGbH5YMQNqaYDRu9XDL0u4kPEmGy+jBlRfToG0UhTH74t4c
	 osYs6Go0UkEJgQgkvMGR099KLNXY2hu+z4f+A07O8QQS9mXdBUmo1NvyELgvsoS5qE
	 W1TTKC9hqTayMCRpNm3amOAmLbEcoh5uqJWgCRwEpjPV1RekvaGjBQgTqsheBWBz1D
	 X7ieEQd+hR7D5wNRaATruuYRSD6O9pPb2akigd8dWJ/r/PHTKoUphB28y1Nk1iKSGy
	 +nc6TiWy0ylqtp7AafAk2s3+SHjk0KLKKL513i8z4b6ws3wbBctUZpUIcq2gzOljA0
	 Z8ABGzu8Q8hyw==
Date: Fri, 7 Mar 2025 15:48:59 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Bastien Nocera <hadess@hadess.net>
cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
    Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Remove myself from the goodix touchscreen
 maintainers
In-Reply-To: <20250307143740.960328-1-hadess@hadess.net>
Message-ID: <n3p454qo-937r-6sq6-3721-6p794r3sn4qn@xreary.bet>
References: <20250307143740.960328-1-hadess@hadess.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 7 Mar 2025, Bastien Nocera wrote:

> Haven't authored any commits to that driver in 10 years, and haven't
> had supported hardware for nearly as long.
> 
> Signed-off-by: Bastien Nocera <hadess@hadess.net>
> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 896a307fa065..d076e2d34c5b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9827,7 +9827,6 @@ S:	Maintained
>  F:	drivers/media/usb/go7007/
>  
>  GOODIX TOUCHSCREEN
> -M:	Bastien Nocera <hadess@hadess.net>
>  M:	Hans de Goede <hdegoede@redhat.com>
>  L:	linux-input@vger.kernel.org
>  S:	Maintained

As this driver lives in input subsystem and not HID, let's CC Dmitry for 
the removal.

-- 
Jiri Kosina
SUSE Labs


