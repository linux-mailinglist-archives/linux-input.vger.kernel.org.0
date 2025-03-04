Return-Path: <linux-input+bounces-10539-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F070A4EEC5
	for <lists+linux-input@lfdr.de>; Tue,  4 Mar 2025 21:50:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 039E77A6284
	for <lists+linux-input@lfdr.de>; Tue,  4 Mar 2025 20:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E29B225FA39;
	Tue,  4 Mar 2025 20:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JOcWs3Jd"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB741FBC98;
	Tue,  4 Mar 2025 20:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741121411; cv=none; b=L6L+0eZGWx3G3XOfY5zRm0tmlGsYaOAhOuiHUkTG3q0AUOaQzpiHIiehXNdZ+Yl7URsjXkPxrfAg1g+7AWT+lBETuiQzIK4U0k1CdV8eAMXtsMAp49/f12mhMdsA/jzKhBtTL1/I86ai7bxHCrrjYBUgHymMwj2/8k5DAaOeDWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741121411; c=relaxed/simple;
	bh=uZfFOwSw+BBMrL5iw8NIGnQf3vjmZCTPjUic+pzdnkM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=tYXr7kmcOAG/vv+KbDREdWSLUsoKIVSjd3KF4oS02k84jBB/doKkEo6TmedqTHvBNiFmnynOUOShaZQCE3FND374bmstIN5qqYBbLzpIgoWSsn5kb+1f9h6MppVLP6hhNsx2hQSwQ/JAAdH6xrw0nk6L8ZjCqjev1WCqbNFS3Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JOcWs3Jd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8402EC4CEE5;
	Tue,  4 Mar 2025 20:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741121410;
	bh=uZfFOwSw+BBMrL5iw8NIGnQf3vjmZCTPjUic+pzdnkM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JOcWs3JdkxkVRNBR7x8cps4MXDNAOgRjG8PVZxQroyAgSjUNUhR2BGl8A8GZltcIV
	 ZfAoYKX8sQVh4WEQCyqOBIm3DTCL9Sw3BnxKieCjLohdcj5OfYbR3k1tqW0sN+D5xE
	 esB+aaM8dI28tVGRDeM3xzvaBECLb5afJrHMCP1+Df6oaUCOnFEDf1Mc2wVbsh0nSC
	 hupA0AYmx9I/aNqxpXTc2ZH7IOR6ZhQUqLfEBjDVPGvAC1rM7mz/03FpfouO3x6pdP
	 LohCEb5JflixITtgSTpJq/FFicgZTaqfMnPGrLzjF5IorNXcmVSXWjfW1aNv5Q+R9K
	 ixDT0KySZNCcg==
Date: Tue, 4 Mar 2025 21:50:08 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Mario Limonciello <superm1@kernel.org>
cc: Basavaraj Natikar <basavaraj.natikar@amd.com>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    open list <linux-kernel@vger.kernel.org>, 
    "open list:AMD SENSOR FUSION HUB DRIVER" <linux-input@vger.kernel.org>, 
    Mario Limonciello <mario.limonciello@amd.com>, 
    Pratap Nirujogi <pratap.nirujogi@amd.com>, Anson Tsao <anson.tsao@amd.com>
Subject: Re: [PATCH 0/3] Adjust behavior for HPD sensor
In-Reply-To: <20250228163153.2554935-1-superm1@kernel.org>
Message-ID: <rno803rs-8o49-r788-npq8-7n879sr47977@xreary.bet>
References: <20250228163153.2554935-1-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 28 Feb 2025, Mario Limonciello wrote:

> From: Mario Limonciello <mario.limonciello@amd.com>
> 
> Some platforms include a human presence detection (HPD) sensor. When
> enabled and a user is detected a wake event will be emitted from the
> sensor fusion hub that software can react to.
> 
> Example use cases are "wake from suspend on approach" or to "lock
> when leaving".
> 
> This is currently enabled by default on supported systems, but users
> can't control it. This essentially means that wake on approach is
> enabled which is a really surprising behavior to users that don't
> expect it.
> 
> Instead of defaulting to enabled add a sysfs knob that users can
> use to enable the feature if desirable and set it to disabled by
> default.
> 
> Cc: Pratap Nirujogi <pratap.nirujogi@amd.com>
> Cc: Anson Tsao  <anson.tsao@amd.com>
> 
> Mario Limonciello (3):
>   HID: amd_sfh: Allow configuring whether HPD is enabled or disabled
>   HID: amd_sfh: Default to HPD disabled
>   HID: amd_sfh: Don't show wrong status for amd_sfh_hpd_info()
> 
>  .../ABI/testing/sysfs-driver-amd-sfh          | 13 +++++
>  drivers/hid/amd-sfh-hid/amd_sfh_common.h      |  1 +
>  drivers/hid/amd-sfh-hid/amd_sfh_pcie.c        | 58 +++++++++++++++++++
>  drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 50 +++++++++++++++-
>  drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.h |  3 +
>  .../amd-sfh-hid/sfh1_1/amd_sfh_interface.c    |  2 +-
>  6 files changed, 124 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-amd-sfh

Now applied to hid.git#for-6.14/amd_sfh. Thanks,

-- 
Jiri Kosina
SUSE Labs


