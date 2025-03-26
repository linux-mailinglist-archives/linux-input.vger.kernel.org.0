Return-Path: <linux-input+bounces-11291-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A64AFA71433
	for <lists+linux-input@lfdr.de>; Wed, 26 Mar 2025 10:55:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C520172C95
	for <lists+linux-input@lfdr.de>; Wed, 26 Mar 2025 09:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C34019E992;
	Wed, 26 Mar 2025 09:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BxBm/3zm"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D062A1B2;
	Wed, 26 Mar 2025 09:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742982898; cv=none; b=uzzl5qNHP1gF2B7KVXQA6SMwoxscsdzVqDcM0AA4VFGeetJw5cKM24Q/SozCs9B7rlO05p5w38YS8P8W6QRxg23yfSnZpa1P6lHySLhbs2Luly9zJd9xHbZJZWfuNCFU0Z4qUhdQyokiGrZSB7BIvQj71i+DlriKs4SwGAF0mG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742982898; c=relaxed/simple;
	bh=Ov1AgyYh3kM4hCEm6V6qb5sdi+6O1RBZvGdEtbZlBnU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=bchcsYllnrmrfBnnExEQCAWd8ASYQNUMQVYr6poNd5U0/Zri7DnWT+DrPQ4rNjrUbkjdVhH3e9StrHlIWsZKxrZ5vBARbxQ3Ldv6fEGqV2Xicef/bk5TW52gT8GaYMNB5FVzV3lf5u0MFBOzRSH/blppQJTQaCZIjXGDjPWbmkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BxBm/3zm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41EE3C4CEE2;
	Wed, 26 Mar 2025 09:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742982896;
	bh=Ov1AgyYh3kM4hCEm6V6qb5sdi+6O1RBZvGdEtbZlBnU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BxBm/3zmwoyfzil4KP1ekcmQhwFLh874LJq8SGnYExJvY+7ZDKuNTo9eeo2Gqf4Gz
	 QWs5eH48XqvcMr+C0NSY2tbdj+JWPRoJeK5nTwTstf8vojgyaCrpIJubgiMvQ/0eEG
	 4SGQQf2C4Rhxk9mhuYPMeW0d++3UieNW0TkhcwmghOI7EyulZOxpBpvXRsBYCOUPIV
	 GZ0d08KcjZmN1cwA4J0wH2IVz1ZuqF0/zrsBZwhEYtdw56Oqz6zXA83nba0ve8R/Bn
	 T7H3BmH+qcMiQ49qWglS45TPgGcpIyDBG2NaFnOtoRImVVw5EdTw5kwolR+x/aAytj
	 01hFUS+/XcKcA==
Date: Wed, 26 Mar 2025 10:54:53 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Aditya Garg <gargaditya08@live.com>
cc: Aditya Garg <adityagarg1208@gmail.com>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    "admin@kodeit.net" <admin@kodeit.net>, 
    "benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>, 
    "kekrby@gmail.com" <kekrby@gmail.com>, 
    "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, 
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
    "orlandoch.dev@gmail.com" <orlandoch.dev@gmail.com>
Subject: Re: [PATCH RESEND 5/5] HID: multitouch: add device ID for Apple
 Touch Bar
In-Reply-To: <PN3PR01MB95979ECF0C403CA6622E56D0B8A72@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Message-ID: <7rsn5334-npo6-408r-8442-6o3qo3qp05q7@xreary.bet>
References: <bzb6rk7q7rs27kbonihpfftkgueievpux7vpqjgrgsud5pf5g2@tuxymj7vk3it> <219B5F93-611D-48FA-A4D9-F9B71401A57D@gmail.com> <PN3PR01MB95979ECF0C403CA6622E56D0B8A72@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 25 Mar 2025, Aditya Garg wrote:

> >>> Yes I can move hid_find_field to the original location as well. But, 
> >>> I would not want to devm_kzalloc as well unnecessarily if the 
> >>> touchbar is in the basic mode instead of drm mode which will cause 
> >>> this -ENODEV to be executed right?
> >> 
> >> It shouldn't matter. hid_core calls devres_open_group() before calling
> >> .probe(), and calls devres_release_group() on failure. So yes, we'll
> >> allocate a piece of memory and release it after, but it's not something
> >> uncommon.
> > 
> > Fair. I'll send a v2
> 
> I've sent a v2 from my gmail address. Outlook is being too fussy these 
> days, so hopefully I don't have to sign off twice using gmail as well as 
> outlook.

Thanks. Please always make sure that either in the cover letter or in the 
individual patches you otline the differences between individual patch 
submissions.

-- 
Jiri Kosina
SUSE Labs


