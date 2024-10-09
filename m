Return-Path: <linux-input+bounces-7215-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC028996FB7
	for <lists+linux-input@lfdr.de>; Wed,  9 Oct 2024 17:29:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDEBF1C20C16
	for <lists+linux-input@lfdr.de>; Wed,  9 Oct 2024 15:29:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 205DB1E131F;
	Wed,  9 Oct 2024 15:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aUSAMP6Y"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C1919DF9E
	for <linux-input@vger.kernel.org>; Wed,  9 Oct 2024 15:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728487182; cv=none; b=W3kfqhV5fPhrLWbHZmdrjZXbmbv8S8WHX1xm4gSoNh2coT036XWaFb14V8vJQibI44fokmvZU/su6IktXdUhkkTsXYokG4beLWs9D5vp77fMBPVKwEvPv6oVgir0WGotGbWPuFtitvvQdl4frE5PGg0P9LleH7vOg14ARs6xWEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728487182; c=relaxed/simple;
	bh=4QhgkII//cyS0Dl3I7E9WMwnea7IWxLO7BsSFxPSgS0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Zh612SsuawY4pxQn0AaE7tDjN7hKUWBXKWpguDFVo5U2Q/YSN+8Uzt6J90rI1tqTSGM+NrunhH+Mkny0A8Alg3bVXm7xHFX8pApbjpDEksdOcGkKcg42upc/RiHd4cucaAOuWhfj4lu5SiS+TM/9wlTk4DdhXPviinEq8kjtc+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aUSAMP6Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C2C1C4CEC3;
	Wed,  9 Oct 2024 15:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728487181;
	bh=4QhgkII//cyS0Dl3I7E9WMwnea7IWxLO7BsSFxPSgS0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aUSAMP6Y9HY9PRAJjbyR/cvenD7V8HorkYHEF3GWZtQ3mL5Xa3HyfS0qKFZPy7oRj
	 9GD16qEhv+4XxlnO9soys6WAQlj3XzJ+A93z14VQZWeIIAcxa/XxdRs9bFC11zbeTK
	 n1LAUNFCgEMgkg52ifgXcO/A936bPKQl8LyxJDDgWrczUHLvIc9MnQdu9xrSJD9elz
	 gPOoHER7V+A3srI7KYONYDUIO36isn2+JBb+gVgYZE0EYm7BmM/EjzaydhbBrZprZH
	 pMX1cFwH4nNnZtE03Q3+o6r2Czi3HVDIymQ+w5xJW0s5Xy3c3E2sgSd0sJCrzZR2eZ
	 Oc0H593GSVZOQ==
Date: Wed, 9 Oct 2024 17:19:39 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
cc: bentiss@kernel.org, linux-input@vger.kernel.org, 
    Chris Hixon <linux-kernel-bugs@hixontech.com>, 
    Richard <hobbes1069@gmail.com>, Skyler <skpu@pm.me>
Subject: Re: [PATCH] HID: amd_sfh: Switch to device-managed
 dmam_alloc_coherent()
In-Reply-To: <20241009144757.3577625-1-Basavaraj.Natikar@amd.com>
Message-ID: <nycvar.YFH.7.76.2410091719200.20286@cbobk.fhfr.pm>
References: <20241009144757.3577625-1-Basavaraj.Natikar@amd.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 9 Oct 2024, Basavaraj Natikar wrote:

> Using the device-managed version allows to simplify clean-up in probe()
> error path.
> 
> Additionally, this device-managed ensures proper cleanup, which helps to
> resolve memory errors, page faults, btrfs going read-only, and btrfs
> disk corruption.
> 
> Fixes: 4b2c53d93a4b ("SFH:Transport Driver to add support of AMD Sensor Fusion Hub (SFH)")
> Tested-by: Chris Hixon <linux-kernel-bugs@hixontech.com>
> Tested-by: Richard <hobbes1069@gmail.com>
> Tested-by: Skyler <skpu@pm.me>
> Reported-by: Chris Hixon <linux-kernel-bugs@hixontech.com>
> Closes: https://lore.kernel.org/all/3b129b1f-8636-456a-80b4-0f6cce0eef63@hixontech.com/
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=219331
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>

Applied, and will expedite it to Linus.

Thanks,

-- 
Jiri Kosina
SUSE Labs


