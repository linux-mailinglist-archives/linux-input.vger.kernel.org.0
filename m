Return-Path: <linux-input+bounces-10536-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 639CCA4EEA9
	for <lists+linux-input@lfdr.de>; Tue,  4 Mar 2025 21:45:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A6DD37A9489
	for <lists+linux-input@lfdr.de>; Tue,  4 Mar 2025 20:44:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01B2C25FA19;
	Tue,  4 Mar 2025 20:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FUO98Ekm"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6720265639;
	Tue,  4 Mar 2025 20:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741121131; cv=none; b=N0dprVUnKCmsP7P8s5YS5f4vIgT3T8p81e2j4pQ95CP+iKNixjyA9Tcm3ONy1ZHqgQTgNcC5qxi1NkvboATLaFGlEu2ZRmdgoU+JazJWWY2+aWohBUd8lsJWO5TcKycho7LXNpfy3bMoc9Rbb4BSsKTVblUJ2LCZNf59s6GQ3mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741121131; c=relaxed/simple;
	bh=oao6VfbwNj8WG3JQ/qDYHHTP/jtD7RI6kqWRj5K7Ezk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=lNm7Zr7J/+5fxTjLReHwqRoQMN0I54qSmmIrbkbqwdeRK6s3IXLS9nnBP0nH08Nag/nfXTbt2vaqCHNIdSBFnN3Kh4QtlI/KUPPsTjSPFYn4RtxI+DmcirxCGoktN9sZYVFVMOA3cqfUGXaBySiSWuztKG3LCvo8AamQSKKHd6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FUO98Ekm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB253C4CEEC;
	Tue,  4 Mar 2025 20:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741121131;
	bh=oao6VfbwNj8WG3JQ/qDYHHTP/jtD7RI6kqWRj5K7Ezk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FUO98Ekm4GETHKN2lQCvVV41G+1Rr6W3Sjf9Ntv0UJ7IDn3gtjNOK6sUncHrg5NST
	 JgcPfTZUtQlX9rT7wiSei1WtwBGCzS3za24noLSyW/kowatT54D2kdzuq2iAHGFa/L
	 Gu1FychK+vScu2mbmyFc5SaVJHzlgG99Eh0hUQGlU5A21O92QtsNTBSjSxYS6IDG5e
	 9Wf44kHxvJZxGHfPOOJpePM/x9vELxQToC45xnNY/idElK7+NvkWpcbftXnYna2F8I
	 buKxK1Fzhk0mPSuOqeYeLEqiqxTU5yKpI049e2IKqtSGTsq1BlJ/akElXUaJsVBJmd
	 8LQbkytM8pxNg==
Date: Tue, 4 Mar 2025 21:45:28 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Colin Ian King <colin.i.king@gmail.com>
cc: Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
    kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] HID: debug: Fix spelling mistake "Messanger" ->
 "Messenger"
In-Reply-To: <20250227223357.659460-1-colin.i.king@gmail.com>
Message-ID: <9358pnrn-o1q5-o744-5sn6-347881q75780@xreary.bet>
References: <20250227223357.659460-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 27 Feb 2025, Colin Ian King wrote:

> There is a spelling mistake in a literal string. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/hid/hid-debug.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-debug.c b/drivers/hid/hid-debug.c
> index 541d682af15a..8433306148d5 100644
> --- a/drivers/hid/hid-debug.c
> +++ b/drivers/hid/hid-debug.c
> @@ -3450,7 +3450,7 @@ static const char *keys[KEY_MAX + 1] = {
>  	[KEY_MACRO_RECORD_START] = "MacroRecordStart",
>  	[KEY_MACRO_RECORD_STOP] = "MacroRecordStop",
>  	[KEY_MARK_WAYPOINT] = "MarkWayPoint",	[KEY_MEDIA_REPEAT] = "MediaRepeat",
> -	[KEY_MEDIA_TOP_MENU] = "MediaTopMenu",	[KEY_MESSENGER] = "Messanger",
> +	[KEY_MEDIA_TOP_MENU] = "MediaTopMenu",	[KEY_MESSENGER] = "Messenger",
>  	[KEY_NAV_CHART] = "NavChar",		[KEY_NAV_INFO] = "NavInfo",
>  	[KEY_NEWS] = "News",			[KEY_NEXT_ELEMENT] = "NextElement",
>  	[KEY_NEXT_FAVORITE] = "NextFavorite",	[KEY_NOTIFICATION_CENTER] = "NotificationCenter",

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


