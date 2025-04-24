Return-Path: <linux-input+bounces-11979-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 77325A9AB0A
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 12:52:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE95B4A1BC9
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 10:52:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3627C20D517;
	Thu, 24 Apr 2025 10:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sdsn6Pq8"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8FE1AED5C;
	Thu, 24 Apr 2025 10:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745491966; cv=none; b=EDIM9GVUxJbWpRQBzXaxI34ijcm55krPTqRng52qgBSV5d8Bs/+Aw6K9hlmBPzwMwhs0PqxtnSl6WYztJP+i+CHdiL+2Chhn53YeKYyw1AlYfDIYOSRRYsqKy+uV3E9iGSthCqSv0cBRa5IbZdk6P6bFWex0T3WJvYRPtss1ukQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745491966; c=relaxed/simple;
	bh=MCG8Ac6mkhMpF26cd1WC45TmabIM89oBIDVku54yUxQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=T7bmvctyjPE+us2uWibL7awlraKDZlPZNlBhc2uxJxdBkX/Nn0gSPtCwBwV9dfl80TWk3xFLBFPU9AceiqmkHumX+LWKjS0m0vPuo98XPtb+y9TWs6+twwtqqMsEP8Z3pBd3Hz5tQ8FqFpbpIppYq4DF9dNgWVH2okMqcGDvQlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sdsn6Pq8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19AA1C4CEEB;
	Thu, 24 Apr 2025 10:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745491965;
	bh=MCG8Ac6mkhMpF26cd1WC45TmabIM89oBIDVku54yUxQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Sdsn6Pq8Z91hDfc0RB27kGPxZev+Pv9r8EsxOOG9l9mPvGdGvHAUNrJqSSFYETI7s
	 9yRI4UJ4h4+YVhCP8Wl7yXGFkbHqCW762aVN7s8G5uHbm9e21AIAzL0AaS4o13GrF5
	 +P2nXPANxK3WKPvxpSkR9OZAyA4FQGG/z2dxZ9+xpnohtPOQcJS0Y8wGM4GTce6mXt
	 zsaR+ccgHMj39lBHpBpqj3M/Jn2Li/svrdp/e3LkiWrCFdGjPW4QvFn6+Bbf6K3uQS
	 6jp/Ly61QnSPA/uPDuaOhvy3xl+RdkqX1+kJzhXFWBNlL7THOQfLhIlq6ttTr96xoa
	 wghigPSaVV0+w==
Date: Thu, 24 Apr 2025 12:52:42 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
cc: bentiss@kernel.org, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH -next] HID: hid-steam: Remove the unused variable
 connected
In-Reply-To: <20250416025803.9078-1-jiapeng.chong@linux.alibaba.com>
Message-ID: <s882pn65-04r1-p9qq-qpop-ronopp5n32r3@xreary.bet>
References: <20250416025803.9078-1-jiapeng.chong@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 16 Apr 2025, Jiapeng Chong wrote:

> Variable connected is not effectively used, so delete it.
>=20
> drivers/hid/hid-steam.c:1153:7: warning: variable =E2=80=98connected=E2=
=80=99 set but not used.
>=20
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D20462
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Applied, thanks.

--=20
Jiri Kosina
SUSE Labs


