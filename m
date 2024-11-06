Return-Path: <linux-input+bounces-7896-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 955D19BF0EB
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2024 15:57:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C723E1C21300
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2024 14:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00E0E2022F5;
	Wed,  6 Nov 2024 14:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="smQe3r+f"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F34201273;
	Wed,  6 Nov 2024 14:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730905067; cv=none; b=nfxvYCoq0nWm1em/Fng2PDYeoZu8w1Mmwa32ggI7u9gmcD2xx2VBQlDetUyis78+TZv107gCvLzf319IBJ7+MvnBVatZMyVOSLNMP5YJeADLsxDxfuhJjz0QWU87AhNkidFUeNdRTyzezmTv3RGKQBXn4M6OvPyfqUyFqJSnzV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730905067; c=relaxed/simple;
	bh=utFqICGPWmp6KXXP3Bpl7fUMqVyTy/jHgpPDNAWtMvM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=OReoKr+4x4A5//FkyEskebudbbwK/fGx2WkA8HLka9zzGLuEDmjty3bGFeYxGviBbUvxjeLYyIT8YIOegqAsi7ZEGeVrrfc3V53sXxCuc+6gWsskfjyojp0dLAjiT22kTIaB2/JDxbRQh95+MEvK/k8zPSKrjL48SRrxTLdepg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=smQe3r+f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C370C4CEC6;
	Wed,  6 Nov 2024 14:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730905067;
	bh=utFqICGPWmp6KXXP3Bpl7fUMqVyTy/jHgpPDNAWtMvM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=smQe3r+fgy76kHxJinHnGzdFGPOKDtDVXIw6i3cwrhmiLwAKze89F4F3Fhrr5+mZu
	 yVI6M9qbYLflhVFvZgysifaM9B0kxTomHBX0claYROKXcXtqRMBC3kYg55POY0KFV1
	 6laWFSU5Z0p14PrX75bMf3ZSNM63b0NgQTNu3NnI4JCK5r80ZgBiOH9S2YN3WYu0LM
	 OTWmUE1T8jX9ZCKHQ5Fk0VofJTYVDKHxsSE+0rx20p8ixnvNp1xtqAz7RsjutlZK7d
	 FEj0c1gqENQhACenASCqdUb4LDw7pWR/MIv9IMPo97vfW7Kho+JAie0UmYH02ZTDsP
	 9F8pTXpn01FtA==
Date: Wed, 6 Nov 2024 15:57:45 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: "Gerecke, Jason" <killertofu@gmail.com>
cc: linux-input@vger.kernel.org, 
    Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    Ping Cheng <pinglinux@gmail.com>, 
    Joshua Dickens <Joshua@Joshua-Dickens.com>, Erin Skomra <skomra@gmail.com>, 
    "Tobita, Tatsunosuke" <tatsunosuke.tobita@wacom.com>, 
    Jason Gerecke <jason.gerecke@wacom.com>, stable@vger.kernel.org
Subject: Re: [PATCH] wacom: Interpret tilt data from Intuos Pro BT as signed
 values
In-Reply-To: <20241028173914.68311-1-jason.gerecke@wacom.com>
Message-ID: <nycvar.YFH.7.76.2411061557130.20286@cbobk.fhfr.pm>
References: <20241028173914.68311-1-jason.gerecke@wacom.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 28 Oct 2024, Gerecke, Jason wrote:

> From: Jason Gerecke <jason.gerecke@wacom.com>
> 
> The tilt data contained in the Bluetooth packets of an Intuos Pro are
> supposed to be interpreted as signed values. Simply casting the values
> to type `char` is not guaranteed to work since it is implementation-
> defined whether it is signed or unsigned. At least one user has noticed
> the data being reported incorrectly on their system. To ensure that the
> data is interpreted properly, we specifically cast to `signed char`
> instead.
> 
> Link: https://github.com/linuxwacom/input-wacom/issues/445
> Fixes: 4922cd26f03c ("HID: wacom: Support 2nd-gen Intuos Pro's Bluetooth classic interface")
> CC: stable@vger.kernel.org # 4.11+
> Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>

I have added 'HID: ' prefix to the subject line and applied, thanks.

-- 
Jiri Kosina
SUSE Labs


