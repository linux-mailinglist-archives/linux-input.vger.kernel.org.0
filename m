Return-Path: <linux-input+bounces-16809-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF3ACFC1BB
	for <lists+linux-input@lfdr.de>; Wed, 07 Jan 2026 06:46:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3BB7B30590C9
	for <lists+linux-input@lfdr.de>; Wed,  7 Jan 2026 05:44:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F951255F3F;
	Wed,  7 Jan 2026 05:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=altimeter.info header.i=@altimeter.info header.b="RO6OQFcT"
X-Original-To: linux-input@vger.kernel.org
Received: from hognose1.porkbun.com (hognose1.porkbun.com [35.82.102.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CD5224F3;
	Wed,  7 Jan 2026 05:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.82.102.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767764687; cv=none; b=d5HFo6X5uJa2Wu9QBlgafCJQZW2XfWieH36yV9lPYZQZsZUE27yPJCldtIq5cMlLlS4IbS5GLyGBz5HVK0GLc3hV5+n1EzY43zeNU/zo/O8M7aWcJlbsVKWjnRneRx5NLSufmlNcYLgazG/6awVWtP08vsebjn3G4w9cLaWGTq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767764687; c=relaxed/simple;
	bh=haNhdRLJ8rg+s+oRKwf7pxoUXwkwgt+TyoeMykHfYTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jdxSD0J09m22QMD6HQbibQ6rIZNGOoF38Jo7590jzgnnabnWsTQpKHKdSqagcF8kfS0lCXEWgKFH7IZlcgMA5R9RlDm2/vO5FOz7vLZmv1Scv6TXqyERRRa+1TWJjBhP9xVjj1uEa3YXh4x/SPgkl5pfGoeiW0AfwaFiFK5YhMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=altimeter.info; spf=pass smtp.mailfrom=altimeter.info; dkim=pass (1024-bit key) header.d=altimeter.info header.i=@altimeter.info header.b=RO6OQFcT; arc=none smtp.client-ip=35.82.102.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=altimeter.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altimeter.info
Received: from altimeter-info (unknown [45.55.225.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	(Authenticated sender: linux-kernel@altimeter.info)
	by hognose1.porkbun.com (Postfix) with ESMTPSA id DF748475C76;
	Wed,  7 Jan 2026 05:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altimeter.info;
	s=default; t=1767764679;
	bh=haNhdRLJ8rg+s+oRKwf7pxoUXwkwgt+TyoeMykHfYTc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RO6OQFcTokqWzAhI2qrbmbt4RLDzhVG6lBEAw0dvEn2pJDoln03LZyUCn7HsguwBJ
	 +G3QxJp7qVQEOXZBuhGWF6XLwcPZR9EVdrQg9Ya+ZKjFWixHj/za1YoFwnOGxKkduL
	 Q2rYJ5qvDN8l1ptTb0LBKcwUvnD0CcPttIQ57YTI=
Date: Wed, 7 Jan 2026 05:44:36 +0000
From: Ivan Gorinov <linux-kernel@altimeter.info>
To: Tomasz =?utf-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
Cc: dmitry.torokhov@gmail.com, corbet@lwn.net, jikos@kernel.org,
	bentiss@kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	vi@endrift.com, peter.hutterer@who-t.net
Subject: Re: [RFC PATCH 0/6] Input: New EV_BTN event for generic buttons
Message-ID: <20260107054436.GA30968@altimeter-info>
References: <20260104213132.163904-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260104213132.163904-1-tomasz.pakula.oficjalny@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)

On Sun, Jan 04, 2026 at 10:31:26PM +0100, Tomasz Pakuła wrote:

> I'm eagerly waiting for comments, recommendations and critique. Currently, there
> isn't a way to poll states of all buttons like with EVIOCGKEY but I'm not sure
> if it's needed? I added INPUT_MAX_KEYS just for some sane limits BUT I don't see
> a real use for it. Instead of this define, we could just use U16_MAX. 65k of
> buttons ought to be enough for ANYBODY :D

If I understand correctly, EVIOCGKEY is the only way to read initial state of buttons
and switches when the input device is opened with /dev/input/event# interface.

Legacy /dev/input/js# interface sends those initial states immediately after openeing
as JS_EVENT_BUTTON | JS_EVENT_INIT event type.

