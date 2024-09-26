Return-Path: <linux-input+bounces-6761-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2664D9875F5
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 16:50:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D749F28A814
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 14:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D26F14C5B0;
	Thu, 26 Sep 2024 14:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nsjk5IvD"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B8014B95F;
	Thu, 26 Sep 2024 14:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727362224; cv=none; b=jVSfPDKrdYnECSKZhvsXfoLo3/gwMjawkQK0V8kZdih2NejTEOiN0+sstYFuEB1nidKPuqCUiNe7pKA2DZTCMMRzrIDC/+Ncp8geoOFDQu1YIcZvIG2IWbHHhJHbkD4TjWSDQHhNmReHLq54RU+sNbVMgHimoUQDfzm88y0SfNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727362224; c=relaxed/simple;
	bh=DpikC1E27zuL0wCIKPi24YtRVZOUfVZJKoLwsdwtr1o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ITvjUk5ifHQxfZ4q5nT+0UIfBYAlu2szalsr32y7d5PxG0XXUj82qfZDECoW66OWb/H16xaMVh1E2S35r1Zx513kkt7Wxc7EZIWd7hSsYhnWhFdX27V0qwJjse07BSv8F+Q3CHFXwnHwXxAKTWe+S1bFeuC5HXceyI52g4mBo08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nsjk5IvD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0819C4CEC5;
	Thu, 26 Sep 2024 14:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727362223;
	bh=DpikC1E27zuL0wCIKPi24YtRVZOUfVZJKoLwsdwtr1o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Nsjk5IvDJ2Gr4XhWdQVtMRs41XXCXrmT/DzNqdDGnURk6lVwqVvagaFkRDtAUJUC7
	 q0wZRMKXCladO8qoRBi7FDRNI+iV7TcJTkMBzlGqzVbxPeSkTts9OFULWZJwPESnFo
	 js8PyAYNW/XSu9kfWIc56rQpPjub4UGsUrbQjymEoX1M2AbydpHuIHgWKAY3nMLf3k
	 rCuMpGjqBly/dSgjcxfIvPv1u7rCxcd6kJa0XHFNJKkxOmxy3hHayrtkfr0dfjMMB0
	 sUZx3h228tKtCGmkV6r/rah/lZ4N57l7jVsO2SoJFxK0HoGiRDLRyuA7lM7cdmp/Lc
	 F7l1PBoyHbQWg==
Message-ID: <6a6ed991-ac15-4b2b-99b9-cd14314a98aa@kernel.org>
Date: Thu, 26 Sep 2024 09:50:16 -0500
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/9] platform/x86: introduce asus-armoury driver
To: "Luke D. Jones" <luke@ljones.dev>, linux-kernel@vger.kernel.org
Cc: linux-input@vger.kernel.org, bentiss@kernel.org, jikos@kernel.org,
 platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com, corentin.chary@gmail.com
References: <20240926092952.1284435-1-luke@ljones.dev>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20240926092952.1284435-1-luke@ljones.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/26/2024 04:29, Luke D. Jones wrote:
> his is the first major patch I've ever done with the intention of

s/his/This/

> introducing a new module, so it's highly likely I've made some mistakes
> or misunderstood something.
> 
> TL;DR:
> 1. introduce new module to contain bios attributes, using fw_attributes_class
> 2. deprecate all possible attributes from asus-wmi that were added ad-hoc
> 3. remove those in the next LTS cycle
> 
> The idea for this originates from a conversation with Mario Limonciello
> https://lore.kernel.org/platform-driver-x86/371d4109-a3bb-4c3b-802f-4ec27a945c99@amd.com/
> 
> It is without a doubt much cleaner to use, easier to discover, and the
> API is well defined as opposed to the random clutter of attributes I had
> been placing in the platform sysfs.
> 
> There is some discussion on-going regarding the way tuning knobs such as
> the PPT_* should work with platform_profile. This may result in the creation
> of an extra profile type "Custom" to signify that the user has adjusted
> things away from the defaults used by profiles such as "balanced" or "quiet".

Yeah this is under discussion on my RFC patch series.  Based on the 
outcome of that we can modify asus-armoury later on for it.

> 
> Regards,
> Luke
> 
> Changelog:
> - v1
>    - Initial submission
> - v2
>    - Too many changes to list, but all concerns raised in previous submission addressed.
>    - History: https://lore.kernel.org/platform-driver-x86/20240716051612.64842-1-luke@ljones.dev/
> - v3
>    - All concerns addressed.
>    - History: https://lore.kernel.org/platform-driver-x86/20240806020747.365042-1-luke@ljones.dev/
> - v4
>    - Use EXPORT_SYMBOL_NS_GPL() for the symbols required in this patch series
>    - Add patch for hid-asus due to the use of EXPORT_SYMBOL_NS_GPL()
>    - Split the PPT knobs out to a separate patch
>    - Split the hd_panel setting out to a new patch
>    - Clarify some of APU MEM configuration and convert int to hex
>    - Rename deprecated Kconfig option to ASUS_WMI_DEPRECATED_ATTRS
>    - Fixup cyclic dependency in Kconfig
> 
> Luke D. Jones (9):
>    platform/x86: asus-wmi: export symbols used for read/write WMI
>    hid-asus: Add MODULE_IMPORT_NS(ASUS_WMI)
>    platform/x86: asus-armoury: move existing tunings to asus-armoury
>      module
>    platform/x86: asus-armoury: add panel_hd_mode attribute
>    platform/x86: asus-armoury: add the ppt_* and nv_* tuning knobs
>    platform/x86: asus-armoury: add dgpu tgp control
>    platform/x86: asus-armoury: add apu-mem control support
>    platform/x86: asus-armoury: add core count control
>    platform/x86: asus-wmi: deprecate bios features
> 
>   .../ABI/testing/sysfs-platform-asus-wmi       |   17 +
>   drivers/hid/hid-asus.c                        |    1 +
>   drivers/platform/x86/Kconfig                  |   22 +
>   drivers/platform/x86/Makefile                 |    1 +
>   drivers/platform/x86/asus-armoury.c           | 1051 +++++++++++++++++
>   drivers/platform/x86/asus-armoury.h           |  257 ++++
>   drivers/platform/x86/asus-wmi.c               |  185 ++-
>   include/linux/platform_data/x86/asus-wmi.h    |   19 +
>   8 files changed, 1520 insertions(+), 33 deletions(-)
>   create mode 100644 drivers/platform/x86/asus-armoury.c
>   create mode 100644 drivers/platform/x86/asus-armoury.h
> 


