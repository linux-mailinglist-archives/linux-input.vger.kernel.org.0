Return-Path: <linux-input+bounces-5537-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C2841950139
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2024 11:28:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5EFFEB25749
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2024 09:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7E9C16BE01;
	Tue, 13 Aug 2024 09:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oVu0BVQL"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E0217C235
	for <linux-input@vger.kernel.org>; Tue, 13 Aug 2024 09:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723541322; cv=none; b=SkQHbPDBy2HZdMuR8dbp6xxjfbAMMuVa8jngsHdBWezwdlOc17tNQa1fOEZ2Ecx1s7//CCRLpdT5kx1ogl1kowDcnjVqppSqWnLFZdM1p3Q8Paz3DkkDfwe2dseMxDxpudiNjeyPsx1w269S8KwrHtWANvJW6I8MkOf9rUjrs+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723541322; c=relaxed/simple;
	bh=MmUhzM6XDaYL215fSLB+Xv52OUOOAprOqyF4T4E0vuk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=CxNBYyq7rM6EMm8SYEcvS/pJOw5l77pMXZLcUI63n0Co/GZ8dXjgTuTE2lYmaY27xabu0+RmbMEVEsa4OV0lYAsiSnP7HAeI5NgIRbQDMl5Z3d1jHwTRJoyc1GblbtseKa7QSlO8iYKheBjEBf+A1OfujMQO5fdT6MvgKbWf6oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oVu0BVQL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1672C4AF10;
	Tue, 13 Aug 2024 09:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723541322;
	bh=MmUhzM6XDaYL215fSLB+Xv52OUOOAprOqyF4T4E0vuk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oVu0BVQLOTchejUhdwUqDIOoi0GMglqBJq4NwW8ZJ1FXAHQthSwt0fa06qabvT1ot
	 x/7sfPAne3zael7dlkqnAk9WISq4ARUxPwHtxpJnub03nwOtZ8t1AUXqtyDfTFbq+B
	 aQSaX/x7tPmUyWIa+GJp34GDbczhylJv731SdafjzmQ2ExwTPIvJpWbj/bl+gxPSrF
	 EaQf0IlXNLDE1IQAe5aR6aFOuMFg6bybym2HmI4qSbeuKF6QwswiUobfZ0kzif5qeh
	 PqChSV6R3bwCjZtqwI+VIud8p1MIJPaG+HhY7hvr+mF4UYCK2g3vCY4PMYml48jxfx
	 +Ykx46bQKLhng==
Date: Tue, 13 Aug 2024 11:28:39 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: ValdikSS <iam@valdikss.org.ru>
cc: linux-input@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>, 
    Rodrigo Aguilera <rodrigoaguileraparraga@gmail.com>
Subject: Re: [PATCH RESEND] HID: lenovo: fix Fn-Lock on Lenovo TrackPoint
 Keyboard II in USB mode
In-Reply-To: <20240725004934.301342-1-iam@valdikss.org.ru>
Message-ID: <nycvar.YFH.7.76.2408131128230.12664@cbobk.fhfr.pm>
References: <20240725004934.301342-1-iam@valdikss.org.ru>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 25 Jul 2024, ValdikSS wrote:

> When Fn-Lock is pressed on Lenovo TrackPoint Keyboard II in USB mode,
> the keyboard only sends the scancode to the host and does not toggle
> the mode by itself, contrary to Bluetooth mode.
> 
> This results in non-working Fn-Lock switching.
> 
> Fix this issue by sending switching command upon receiving Fn-Lock
> scancode.
> 
> Signed-off-by: ValdikSS <iam@valdikss.org.ru>

Could you please contribute using your real name?

Thanks,

-- 
Jiri Kosina
SUSE Labs


