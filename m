Return-Path: <linux-input+bounces-16924-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F9AD0D39F
	for <lists+linux-input@lfdr.de>; Sat, 10 Jan 2026 09:55:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D7F913019277
	for <lists+linux-input@lfdr.de>; Sat, 10 Jan 2026 08:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 374BD155389;
	Sat, 10 Jan 2026 08:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jOyat5uH"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142BE500947;
	Sat, 10 Jan 2026 08:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768035306; cv=none; b=EGqWjOokUMhZSGjVVJB6sfUvCEJaYQBzFtBbv3eqjwGlKAIYSKrgOPoU3wcljPfr1oAaV80yUqBK9xh26OgUjgIHTKXOyPAe2aleym/fsYbAKV9AtBZ/11RsVrNW4BqPsNhLvbjZ9pcl1xLzeqwh7Xw+CpRouPjLxneFydGkf5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768035306; c=relaxed/simple;
	bh=Ff+O4j7v4/U02vu0/F5qyjuu/Xp+C4MNE4Fd1xYw0oM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=PT4NUDB5lH8NTdsQ+y9YuuuJsL9Qr5utTAiTMD89jGm9oAi7eSL9gTFfj8OLRRC5haUR7pjfduvJF0eEy4vVM1IOPuZ5McHbsGK/hmd6Eq6OOnbGsS6so34Ad/s6QQFE2Mco10+WpwiUsM5i7wQ86dkhnCVV47JS2nJOCtv47gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jOyat5uH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 832D7C4CEF1;
	Sat, 10 Jan 2026 08:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768035305;
	bh=Ff+O4j7v4/U02vu0/F5qyjuu/Xp+C4MNE4Fd1xYw0oM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jOyat5uHoEStC1OiMhIzx1tiFdoLF1tZEK8mbi/LlEB7XbtAgXZ9P5kn7Ep3HowX2
	 q8jo56EVEkojkGYEnfpv1Co9V7fj6pDVUEP6po21C52SYk37cUe8WV9XhbF28q2Zm0
	 7y5SJzNISjeHRI3obOuBqJ7XRymy/EoAErchmLce87zpBcWAyXvdJbE7TZccj+1pgQ
	 R2kizafYdz+fZwAr8+msU6ocY65AoYVyroOosmw7MNh7c5KSzzbm1oee+RdvQCV9s9
	 5mfir4K7V2EX/xvkLqaXK/BSTSXw5qmFfupIjzoMD6QJcLEpjUeUnTGJa9lAfH2uju
	 j1vhGuAmj4jYA==
Date: Sat, 10 Jan 2026 09:55:03 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: linux@joeybednar.com
cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
    bentiss@kernel.org
Subject: Re: [PATCH] HID: apple: Add "SONiX KN85 Keyboard" to the list of
 non-apple keyboards
In-Reply-To: <176292759108.7.4651202733090413990.1001877915@joeybednar.com>
Message-ID: <420044n7-85r7-0504-8p61-5r196859qn9r@xreary.bet>
References: <176292759108.7.4651202733090413990.1001877915@joeybednar.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 12 Nov 2025, linux@joeybednar.com wrote:

> From: Joey Bednar <linux@joeybednar.com>
> 
> The SoNiX KN85 keyboard identifies as the "Apple, Inc. Aluminium
> Keyboard" and is not recognized as a non-apple keyboard. Adding "SoNiX
> KN85 Keyboard" to the list of non-apple keyboards fixes the function
> keys.
> 
> Signed-off-by: Joey Bednar <linux@joeybednar.com>

Sorry for the delay, now applied.

-- 
Jiri Kosina
SUSE Labs


