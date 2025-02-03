Return-Path: <linux-input+bounces-9703-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F4CA25672
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2025 10:56:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB307167983
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2025 09:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79389200119;
	Mon,  3 Feb 2025 09:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RnsijSIC"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44DE7101E6;
	Mon,  3 Feb 2025 09:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738576600; cv=none; b=pGukPK+ywUei6uZ54pFuVvhIYT5QmLE1hsKEC6YFL/eu9K3mQZo8Qk0CA4LTlqq/i5QN1f7oXyyoAnLbuGF4vaTdjtp+cXw6jUsIjhvk0h5Ud8t3B4FLfn1UDpeBVHw5RtFnAIaabxh+yODvVWB8AqUzHdyVGi3yxmyxD0fpb1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738576600; c=relaxed/simple;
	bh=zJ8G+yq3JQNXvQWV+vf4WMNnKxrU0sJViRg/T9+Hp7k=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=QodMTKFpgVl3uDJ6vqw0kV9yaX9EHWnvPRPIYjDFJ/hBIleQvlFG1xMijOWczMtz0HmTPRQLkLDR91wExM6J9mg5DDQq2XVoqEUnrGb3FJTNVmDeWvudyqSkp63eYn71XC/TrCO9IzpqtGFnfKevCdWLps9eN7jv5yJYm8lsIl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RnsijSIC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E158C4CED2;
	Mon,  3 Feb 2025 09:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738576600;
	bh=zJ8G+yq3JQNXvQWV+vf4WMNnKxrU0sJViRg/T9+Hp7k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RnsijSIC7HbiR+dnUJbyuafuvPzmeFLaodnYf9OunnTHfzEQwDVDPR3pEqGi3jaep
	 lhW/1TQvDvjYvme8uUw/aTCkx3OAw004o6vB1NbErJoWopQKqsz0C6QBYEshPugLUo
	 HaJqXMjJzzBw0AvkFAv+OU7dTJDz6lxj1FA5G6BQo3Y5mC8+rbVFBSuOFfIP03w9wb
	 13KEfzAbj/eB9H5LgW0wAPzRpdagnEXTOCGvkk6zElFxzIf8NIGItXBF/B9Y+7ThL0
	 +ITETJeRTmKy79c9Za9s0EiSu1Y6dIz0jWRgoONH0Pmi3pB6/Vt1hvJtjNuyG5MjXW
	 CLxqDBwJekFdw==
Date: Mon, 3 Feb 2025 10:56:36 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
cc: Benjamin Tissoires <bentiss@kernel.org>, 
    Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
    Mark Pearson <mpearson-lenovo@squebb.ca>, Arnd Bergmann <arnd@arndb.de>, 
    Basavaraj Natikar <basavaraj.natikar@amd.com>, Even Xu <even.xu@intel.com>, 
    Xinpeng Sun <xinpeng.sun@intel.com>, 
    Maximilian Luz <luzmaximilian@gmail.com>, 
    Marcel Holtmann <marcel@holtmann.org>, 
    Johan Hedberg <johan.hedberg@gmail.com>, 
    Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
    Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
    linux-usb@vger.kernel.org, linux-bluetooth@vger.kernel.org
Subject: Re: [PATCH] hid: intel-thc: fix CONFIG_HID dependency
In-Reply-To: <20250123134908.805346-1-arnd@kernel.org>
Message-ID: <49022s2o-36qo-2s30-9136-q34p10p18r87@xreary.bet>
References: <20250123134908.805346-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 23 Jan 2025, Arnd Bergmann wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> In drivers/hid/, most drivers depend on CONFIG_HID, while a couple of the
> drivers in subdirectories instead depend on CONFIG_HID_SUPPORT and use
> 'select HID'. With the newly added INTEL_THC_HID, this causes a build
> warning for a circular dependency:
> 
> WARNING: unmet direct dependencies detected for HID
>   Depends on [m]: HID_SUPPORT [=y] && INPUT [=m]
>   Selected by [y]:
>   - INTEL_THC_HID [=y] && HID_SUPPORT [=y] && X86_64 [=y] && PCI [=y] && ACPI [=y]
> 
> WARNING: unmet direct dependencies detected for INPUT_FF_MEMLESS
>   Depends on [m]: INPUT [=m]
>   Selected by [y]:
>   - HID_MICROSOFT [=y] && HID_SUPPORT [=y] && HID [=y]
>   - GREENASIA_FF [=y] && HID_SUPPORT [=y] && HID [=y] && HID_GREENASIA [=y]
>   - HID_WIIMOTE [=y] && HID_SUPPORT [=y] && HID [=y] && LEDS_CLASS [=y]
>   - ZEROPLUS_FF [=y] && HID_SUPPORT [=y] && HID [=y] && HID_ZEROPLUS [=y]
>   Selected by [m]:
>   - HID_ACRUX_FF [=y] && HID_SUPPORT [=y] && HID [=y] && HID_ACRUX [=m]
>   - HID_EMS_FF [=m] && HID_SUPPORT [=y] && HID [=y]
>   - HID_GOOGLE_STADIA_FF [=m] && HID_SUPPORT [=y] && HID [=y]
>   - PANTHERLORD_FF [=y] && HID_SUPPORT [=y] && HID [=y] && HID_PANTHERLORD [=m]
> 
> It's better to be consistent and always use 'depends on HID' for HID
> drivers. The notable exception here is USB_KBD/USB_MOUSE, which are
> alternative implementations that do not depend on the HID subsystem.
> 
> Do this by extending the "if HID" section below, which means that a few
> of the duplicate "depends on HID" and "depends on INPUT" statements
> can be removed in the process.
> 
> Fixes: 1b2d05384c29 ("HID: intel-thc-hid: Add basic THC driver skeleton")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied to hid.git#for-6.14/upstream-fixes, thanks!

-- 
Jiri Kosina
SUSE Labs


