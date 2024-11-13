Return-Path: <linux-input+bounces-8045-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFB19C6C29
	for <lists+linux-input@lfdr.de>; Wed, 13 Nov 2024 10:57:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7B201F227FE
	for <lists+linux-input@lfdr.de>; Wed, 13 Nov 2024 09:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 023061F8EE1;
	Wed, 13 Nov 2024 09:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OiVGFtMm"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90C01F80B6;
	Wed, 13 Nov 2024 09:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731491785; cv=none; b=OBZw+56Jtq6ZY1tMVZCbOeo2ZzvT7rwRWkun+PyEa6fijues1d4Bd0DlETpBIpmpYm3LhC+0L3/tG7+hMviaA/TekFk1yyPjjPZaKSK0/ER2RI4VrGwmQiolCft5bwg1KwX7t3Xqfy3AQyDehh69FzAMlPgoWYVzgm/oCJQ2feM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731491785; c=relaxed/simple;
	bh=BTw2AmqOjkfMS70DcbeS+Yr2Rlpi3g6g2K3dIVwLLIg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=hRYNDkjaKJkRXUORlwFHO9iSxkqSvz7RZnMg4W7s5cDiZfF/l8a7qyX7ZOijY7kCRWwFRtifYScvxgRlIn/Hx12bJVNwId/Wi3AAVHhDwkwKbbGVVAVkqlOtgt/HBvwFk0ZrGBBonHSpzkc9rML+mOA+VusFtVWfYWP9nxxykzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OiVGFtMm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8BF4C4CED2;
	Wed, 13 Nov 2024 09:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731491785;
	bh=BTw2AmqOjkfMS70DcbeS+Yr2Rlpi3g6g2K3dIVwLLIg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OiVGFtMmUv7XHoRps/YZWRVeWbLtaqauA+4gnuXPtG96+sMYEASYOldJrT1mXc00D
	 3oEY5HWRKBcoMKkzVkTJJnUJUk2E3xrQ0g1eNk4hARj4NBcSfYB9ap75byH2YIYGAQ
	 q5/ltqg+YgwQuz+u/P6XmXHVCZH4FwuAIKoamIB9uktJ0la1aV/xe1MvDItzYX5gdw
	 JO4fbLQ2OjPLDi/hKRs+vnlL4hHY1tBiG5Y4pC/hY8ZTN0zdtuSwmxCHJ4lYSgrdCy
	 vnvNXTYDxc3eU/lzGvi572sBenSA0UUdMPrH6MjXxhC0QYv2u5cghQ4qx4WBMk3qMl
	 ZrhIgy/k+1Usg==
Date: Wed, 13 Nov 2024 10:56:22 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Doug Anderson <dianders@chromium.org>
cc: Charles Wang <charles.goodix@gmail.com>, robh@kernel.org, krzk@kernel.org, 
    hbarnor@chromium.org, conor.dooley@microchip.com, 
    dmitry.torokhov@gmail.com, bentiss@kernel.org, linux-input@vger.kernel.org, 
    devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] HID: hid-goodix: Add OF supports
In-Reply-To: <CAD=FV=WKU2Wwfwg1EACYgJtUKJjYH2OOQn6ELXbBK=B-jzbTZQ@mail.gmail.com>
Message-ID: <nycvar.YFH.7.76.2411131056020.20286@cbobk.fhfr.pm>
References: <20241111075000.111509-1-charles.goodix@gmail.com> <20241111075000.111509-3-charles.goodix@gmail.com> <CAD=FV=WKU2Wwfwg1EACYgJtUKJjYH2OOQn6ELXbBK=B-jzbTZQ@mail.gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 11 Nov 2024, Doug Anderson wrote:

> Oh, I guess the one "nit" is that I would have put "spi" in the
> subject, making it "HID: hid-goodix-spi: Add OF supports". It might be
> worth sending a v5 for that (after waiting a day or two) unless a
> maintainer tells you not to.

No need to resend v5 just for this, I'll adjust manually while applying.

Thanks,

-- 
Jiri Kosina
SUSE Labs


