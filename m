Return-Path: <linux-input+bounces-13904-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE85FB2082E
	for <lists+linux-input@lfdr.de>; Mon, 11 Aug 2025 13:48:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B090C18C58D6
	for <lists+linux-input@lfdr.de>; Mon, 11 Aug 2025 11:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5040E1E5219;
	Mon, 11 Aug 2025 11:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cy9Ou5ck"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2649B199223;
	Mon, 11 Aug 2025 11:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754912905; cv=none; b=l/Z21G3c9o9qe8jIIKFo7CYJgKbXEDoTjfZBhv5yfWZb45HJkG0HNqwDWcBXubOvPxgciMJJsz7zNyXfzRfqc7a/t3NnEmWwzKy9aX09pFfp91VgTjN8l0FQq8J5EeMR65OQ3uC+uSajikT711EZChdJqJEO0AsA2Px8YOSc45I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754912905; c=relaxed/simple;
	bh=GALCFWWVVaMP0Qh3lW438ZF6XSXEp7GMMF/6zwC0VfU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ttWOC3ifzJngg3rEjNclS5hSNnXG+3Orxg3WeZSZISa4bChlBh9aby6pWiTGEcB/vHlNMHgnZJDUDQbQ6AXDnaqqqANUNGVHL8I/m3DICsOEaNZFiYBsMXBaHfwevjOtwEYXIPZ9gDBtuE5SdXyhkTrEPhPFreIGUgTT2Lvyje8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cy9Ou5ck; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B813C4CEED;
	Mon, 11 Aug 2025 11:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754912904;
	bh=GALCFWWVVaMP0Qh3lW438ZF6XSXEp7GMMF/6zwC0VfU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cy9Ou5ckr178C66djNDhIk6LjNtaaa537/FifQnpBEUyjaMfE+SdIyDy+AYtKtEDK
	 I7+bFuNvCpCuKaqm7ZwbXS0cMPWS8HNNH6mclufEd2mZ8A1s6O9YGLBkeYY/rgtQc4
	 tlpluE1cL+Gg1ApmOfAaEqhg5mbmUskb+tHBHysTtwRkL8Sp2u59DS54kJsp+0TaEu
	 vv+qvhigV1fVvGMG5IouBrTw8hiqm/GVrdl7xLKgLwehS5xd0U7er7PHhhWZs8skNq
	 1o1O1fd6K2ONI0ZAFa3iQyrLd++n15hQjErEplBBq3dgnbFZ+3QRwt7TMe1bRehuKS
	 G8Daz3PZQ1GtA==
Date: Mon, 11 Aug 2025 13:48:22 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: =?ISO-8859-15?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
cc: bentiss@kernel.org, luguohong@xiaomi.com, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] HID: input: report battery status changes
 immediately
In-Reply-To: <20250806073944.5310-2-jose.exposito89@gmail.com>
Message-ID: <4q4qn3p8-6s3s-289n-44s2-43s76qrs2oo4@xreary.bet>
References: <20250806073944.5310-1-jose.exposito89@gmail.com> <20250806073944.5310-2-jose.exposito89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 6 Aug 2025, Jos=C3=A9 Exp=C3=B3sito wrote:

> When the battery status changes, report the change immediately to user
> space.

Could you please make the changelog a little bit more elaborative, i.e.=20
why is it needed, what user-visible behavior change/improvement it brings,=
=20
etc.

I know it's in the e-mail thread, but at least some summary should go also=
=20
to the commit itself.

Thanks,

--=20
Jiri Kosina
SUSE Labs


