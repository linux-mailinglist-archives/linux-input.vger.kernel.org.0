Return-Path: <linux-input+bounces-10215-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CC809A3E3E1
	for <lists+linux-input@lfdr.de>; Thu, 20 Feb 2025 19:31:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C633B171138
	for <lists+linux-input@lfdr.de>; Thu, 20 Feb 2025 18:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C8582135B2;
	Thu, 20 Feb 2025 18:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gb70yxo3"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D988920CCC3;
	Thu, 20 Feb 2025 18:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740076284; cv=none; b=URu0XOLdHS64xLI3EAN+lncr7wCrD3ia26ePtDuEbs7CvxkQmIz3f0/SzRxrw+uL8sfJ5ltgkc5MMpqPTWMp8K24PUtoP6xIgPoyNYyD2w1efJlg4BAy6xq7ZA2kbRv6zsF1ZZMo9xHxe1HPMQ8xHns44BiCeCj9uxR5O6LQg8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740076284; c=relaxed/simple;
	bh=SNAAWQ33HpVVduE2oRVRlawGqqSdycOEpSVND6/hyV8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=m8/legu0LkOFfEc/dDvPbZj1ZlIurEJKUIWteJd1m4ovPzjY7NY+hZVT2qj1Gc44sYqilZ3c96CoJLhOMpl/1DpjGxtf3o+fa1rG/2U4YE4GWx7asFwFla/wCe6jI81ckkwJEr922hkQb40axJLx1roXhQeUe9R+PZYcVD2H9i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gb70yxo3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CEEBC4CED1;
	Thu, 20 Feb 2025 18:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740076283;
	bh=SNAAWQ33HpVVduE2oRVRlawGqqSdycOEpSVND6/hyV8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gb70yxo3D9wzQFqM+oIz4IPWXd/QJIqtMUb8XTPUStiIMP8ctxt5Uup2GZDloVX4I
	 DYf0W1Fezhs3B37UtFMNkutVePIN1U4qLrO5geX86rSFlz2ncp3FpDOm7hyxlUxDQS
	 SC1GoAaIzEQLSdsIAJuuiZBbkE7ittigUMh92p/VXnPwc4w1nsJM3p4vU7ZzibQQ25
	 qFiNcHzG76Co2ilxX+BohbaBOM2gOzneo1rJQqr/fURJYszcYjhAqKs4N18j5c/bp4
	 BmQ/90AMtNS6JNSX3TRu6rnxknQ4Jvy/++T1dVy+LOld2Am8zktohkD2/MDeiIlqNy
	 L5UpN9iT8EWJg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3402F380CEE2;
	Thu, 20 Feb 2025 18:31:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] hid: intel-thc: fix CONFIG_HID dependency
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <174007631401.1417233.14540583372854918839.git-patchwork-notify@kernel.org>
Date: Thu, 20 Feb 2025 18:31:54 +0000
References: <20250123134908.805346-1-arnd@kernel.org>
In-Reply-To: <20250123134908.805346-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: jikos@kernel.org, bentiss@kernel.org, srinivas.pandruvada@linux.intel.com,
 mpearson-lenovo@squebb.ca, arnd@arndb.de, basavaraj.natikar@amd.com,
 even.xu@intel.com, xinpeng.sun@intel.com, luzmaximilian@gmail.com,
 marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-bluetooth@vger.kernel.org

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Jiri Kosina <jkosina@suse.com>:

On Thu, 23 Jan 2025 14:48:12 +0100 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> In drivers/hid/, most drivers depend on CONFIG_HID, while a couple of the
> drivers in subdirectories instead depend on CONFIG_HID_SUPPORT and use
> 'select HID'. With the newly added INTEL_THC_HID, this causes a build
> warning for a circular dependency:
> 
> [...]

Here is the summary with links:
  - hid: intel-thc: fix CONFIG_HID dependency
    https://git.kernel.org/bluetooth/bluetooth-next/c/a5a056c8d2ba

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



