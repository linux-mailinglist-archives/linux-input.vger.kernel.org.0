Return-Path: <linux-input+bounces-12776-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F99BAD42CE
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 21:22:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 328BC16BB07
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 19:23:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E33A025FA05;
	Tue, 10 Jun 2025 19:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vGlE+ypE"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B954B29D19;
	Tue, 10 Jun 2025 19:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749583374; cv=none; b=qjOIzBuCipifF6aV5K8uKOshb/J6i+X3AgZ697LcfW16n7hUGX+qL+2vpm/91vxRd2a34Oa4d5b9sCiroUKrWcWDCwseTuGWJ2dt/j3F4Wy4mUKlk7mAzDLGLvaf7pfl5lHt7bQLu4uhdMpcU8MFNQC+9E/cwPgKhop8A8u68g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749583374; c=relaxed/simple;
	bh=pxZbAU/eeRZsCLiLadVwF9MqDzKUyBxFq+kpGNxy1Gs=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=QH9McClLHkZGrt7mNviqunkGqOZ4EWCrbNfl8VmFhYfhNsCh9FzsbOIVnox4FiUS1o+bKsYacuWV5RbSSiIVYQLXxBpQK9fYVrbcI+MhrT22CF3gLxNwHS0vQXPtV2AXDhNjRk89sgf5S9JOnyqhfzmRj+RFgXAXoBpU0+zDqAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vGlE+ypE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBC70C4CEED;
	Tue, 10 Jun 2025 19:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749583374;
	bh=pxZbAU/eeRZsCLiLadVwF9MqDzKUyBxFq+kpGNxy1Gs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=vGlE+ypEyarg4rV3Y+uNBi0p+utH0ZHUVayFZzOb7jaJRC9T2PRSJn5mWey79EH+G
	 OzxxGi3s2POIuB8p980SfpEtTUTiklZbWFU24OIYqdEGEE5nSrA8wepEDHc4ObizDF
	 sLD4uPRjMV/oz30ITp2ChwIg3yQ39bciAvv7o09Z1VyRrxNL0OOME3rPcJLY1MN60m
	 +cWIEmw4NOB3k7qu3E/Opi8K+/AP1QMthXz1njq1Y3XHldAFqTg5M9fExdwofsXr6u
	 ua+db9oJTy8/b2Ka73U+WwXi5R77e95wbKqj5/xEO/b7HE8zOQV/PA9NY059xus0OL
	 9y3vr5WSMGtbw==
Date: Tue, 10 Jun 2025 21:22:51 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Aditya Garg <gargaditya08@live.com>
cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Grigorii Sokolik <g.sokol99@g-sokol.info>, 
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
    Linux Input Mailing List <linux-input@vger.kernel.org>
Subject: Re: [PATCH v6 0/8] HID: apple: combine patch series for all patches
 recently sent upstream
In-Reply-To: <PN3PR01MB9597843FE87D50116665ADC4B89CA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Message-ID: <n8pq9503-111o-95p5-6n99-20081r407np4@xreary.bet>
References: <PN3PR01MB9597843FE87D50116665ADC4B89CA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 19 May 2025, Aditya Garg wrote:

> Hi
> 
> This patch series contains various pending patches for hid-apple in a
> single series.
> 
> The first patch moves the backlight report structs, that were incorrectly
> placed between the translation tables, to other related backlight structs.
> 
> The second patch makes use of switch case statements for the ever
> increasing lengthy device table for fn translation.
> 
> The third patch removes the unused APPLE_IGNORE_MOUSE quirk.
> 
> The fourth and fifth patch adds Apple Magic Keyboard A3118 and A3119
> USB-C support respectively
> 
> The sixth patch adds a new fnmode=4 to hid-apple that enabled disabling
> translation only for F keys, which is useful in case of Macs with a Touch
> Bar, where F keys are shown on the Touch Bar itself.
> 
> The seventh patch removes T2 Macs from the hid_mouse_ignore_list since
> no driver exists outside the HID subsystem for their trackpads.
> 
> The last patch adds support for third party replacement trackpad for
> MacBookPro15,1 which has different PID from original one.
> 
> v2: Add A3118 Keyboard
> v3: Add A3119 Keyboard
> v4: The "from" email in patches authored by me was different from the one
>     I signed off using (thanks to outlook's weird oauth2 requirements).
>     Anyways, I've managed to get a workaround to get outlook working
>     finally, so sending them again properly.
> v5: The cover letter itself failed to send in v4. Sending again.
> v6: Add 3 new patches to improve support on T2 Macs.

Now queued in hid.git#for-6.17/apple. Thanks,

-- 
Jiri Kosina
SUSE Labs


