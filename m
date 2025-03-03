Return-Path: <linux-input+bounces-10484-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4F7A4B880
	for <lists+linux-input@lfdr.de>; Mon,  3 Mar 2025 08:48:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92032189187D
	for <lists+linux-input@lfdr.de>; Mon,  3 Mar 2025 07:48:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FB491EB5F7;
	Mon,  3 Mar 2025 07:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q3y/umGI"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180281EB1B0;
	Mon,  3 Mar 2025 07:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740988086; cv=none; b=C/p02pgYnIRnBxjLZaEKpONrbkbueBjRpY+t6vtFxpBdeQvg8YH3uM/Lsdl7LpHwIC6avGZHJTYPCFzFIcuorBVzYi/0QS1swOn1k1AyBtte2cNgHlz6Pb7IEHDgajB6552FgyedeIvTwbOCKC8SgkC3kwzccKZZhVpPeV+VhWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740988086; c=relaxed/simple;
	bh=4gaI9687yuFdGWUMAt8g+lkT6YXzTDhCa31bc/t4MhQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=u0w2M51fwaexbVx7X29HCteZU3C3Hs/G/3JyQJgEIKOT2TLBN0NwJfDc/W+xk6f5k4Vt+8BxR4/CwKDPMRb8NPcZLnNjm+p5rl+w0S2lR16mvxhK91QAUe/tSLN9AMxIUPuw7eb0wvnOW9rfpAXj1z5DhWNLwH7nLGqGtudAKms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q3y/umGI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D400C4CED6;
	Mon,  3 Mar 2025 07:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740988085;
	bh=4gaI9687yuFdGWUMAt8g+lkT6YXzTDhCa31bc/t4MhQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Q3y/umGI9QLdtcmAnvS8TC8XoNl9SbYnRJzDb0HMOz5VNQ0r96k5MMviUBA8NGJo6
	 yaZNAgx7zT2zJwWUXB00VevFHUrIl37pqL2NLvAUAOdrA+99H8bGu9fn1basm04Jc2
	 QQlDfWZyggLatMQTp0v+RZlqW285Ulckephxd5+CH437LKosj9xeZg8b4lHHK10kB8
	 JmxslGQd4zK7UNc/P5u3UQEmNUGUVEfUSaJTtqsdT6mo/2Uu0s4pu8drMv7ugtoICh
	 N73NibUGzyFVGPa4mkBO2M3zn2wggZXDUuxOBCavMyKbkeM0LSvw/gNuJCUFJTIj+o
	 tXFjtqazLB3aA==
Date: Mon, 3 Mar 2025 08:48:03 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Antheas Kapenekakis <lkml@antheas.dev>
cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
    dri-devel@lists.freedesktop.org, 
    Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
    Maxime Ripard <mripard@kernel.org>, 
    Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
    Simona Vetter <simona@ffwll.ch>, Benjamin Tissoires <bentiss@kernel.org>
Subject: Re: [PATCH 4/5] HID: Add quirk to ignore the touchscreen battery on
 OneXPlayer X1
In-Reply-To: <20250222164321.181340-5-lkml@antheas.dev>
Message-ID: <124553q7-8370-s74s-so88-079q2469orn9@xreary.bet>
References: <20250222164321.181340-1-lkml@antheas.dev> <20250222164321.181340-5-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 22 Feb 2025, Antheas Kapenekakis wrote:

> The X1 devices come with a pen-capable touchscreen, in which the HID
> descriptor reports there is always a battery at 100% charge. Quirk it
> to not report the battery status.
> 
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>

Let me provide

	Acked-by: Jiri Kosina <jkosina@suse.com>

so that this patch can be merged by the drm folks together with the rest 
of the enablement series.

Thanks,

-- 
Jiri Kosina
SUSE Labs


