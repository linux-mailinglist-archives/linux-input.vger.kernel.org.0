Return-Path: <linux-input+bounces-16874-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AE2D03D5E
	for <lists+linux-input@lfdr.de>; Thu, 08 Jan 2026 16:28:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CB3B1303DA9B
	for <lists+linux-input@lfdr.de>; Thu,  8 Jan 2026 15:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 819FC3EFD2B;
	Thu,  8 Jan 2026 11:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="feKTMdR+"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E13C39E6D7;
	Thu,  8 Jan 2026 11:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767871081; cv=none; b=chuWM8k/yyTU4sNCgQg2wMK9ARdY3PANuOG1l2QlJPWGskRAqgacFdWKPqH7xzos0m4v+9w9G/nw2JfMw7hSbNPhsPhoqDfKXvNSi2PL92C4SNMIeQSHYsPUAC+pPhPjT7PoWMlp6ERmPTTtPDwnuI/a7m92/4kgUQR2sYERFAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767871081; c=relaxed/simple;
	bh=ykmgZtZv9A4iuAYE4HLKSEBO3gFbNyNdgtKMFkUoGS8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=dPwNV1N1Q29UOHh0Dl68oXk2FDBJ9s4ExP71phs+iuQ1iOV+z+6Qkk+PBAofJquPNYvB1zgweI7Knhm7Wa1mUJ/RYCcA19OB8lPUN/KGv3+zOQNc3gRaFdzd0uKlKmSh+w29TKsb7PtPa7CvNz1VbeCjlmpR4bXyeii19fh0MIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=feKTMdR+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F806C116C6;
	Thu,  8 Jan 2026 11:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767871080;
	bh=ykmgZtZv9A4iuAYE4HLKSEBO3gFbNyNdgtKMFkUoGS8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=feKTMdR+MphvMSiBu6lg/8JNf6Fo6c/keJkGyMo3ikgphUlSaq6b6PqiwAEpC0GKn
	 ZRKl+IausTOp/BHD1ugmB62euLVQG71STzCzOLMUdDtzeyQubv9aLNa9Q3sA+pTUs+
	 FHrEcPfkSltpr+/OTxPtW4fVWrUPA7yOwlyE12AwlzeiluLhZcRMyAlWXGU7ERy4In
	 hbozc99iD+2aOETGnXMVjd5hV6Fv/eukPdn2Rf3XFvO6VRe2SOmuyAd2ZH0W+Cd0lU
	 CBml0Iqrp2+qKsQcUt/pbfOBpDqpsUmeXa5WVQGOnxnOHPeVqPaq4SZ2ZiKd4PCU55
	 AZ86rkd3iQo2w==
Date: Thu, 8 Jan 2026 12:17:57 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: "Ionut Nechita (Sunlight Linux)" <sunlightlinux@gmail.com>
cc: bentiss@kernel.org, benato.denis96@gmail.com, ionut_n2001@yahoo.com, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
    superm1@kernel.org
Subject: Re: [PATCH v5 0/4] HID: asus: Add Fn+F5 fan control key support for
 ROG laptops
In-Reply-To: <20260108074025.5799-2-sunlightlinux@gmail.com>
Message-ID: <8q669r9p-p289-qqq9-7qr8-p77q1ps1o4s1@xreary.bet>
References: <20260107154219.164514-2-sunlightlinux@gmail.com> <20260108074025.5799-2-sunlightlinux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 8 Jan 2026, Ionut Nechita (Sunlight Linux) wrote:

> I hope this email finds you well. I wanted to follow up on my v5 patch
> series for Fn+F5 fan control key support on Asus ROG laptops, which I
> submitted on January 7th.
> 
> The series has received Reviewed-by tags from both Mario Limonciello
> (AMD) and Denis Benato, and I've addressed all the feedback from
> previous versions, including the removal of IS_REACHABLE guards as
> suggested by Mario.
> 
> I wanted to check if there are any additional changes or improvements
> you'd like me to make before this series can be considered for merging
> into mainline. I'm happy to address any further feedback.
> 
> Also, if you could let me know what the next steps are in the process,
> I would appreciate it.

It took me some time to go through the iterations, feedback and review the 
patch, now applied to hid.git#for-6.20/asus, thanks.

-- 
Jiri Kosina
SUSE Labs


