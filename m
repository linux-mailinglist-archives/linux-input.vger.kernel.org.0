Return-Path: <linux-input+bounces-3518-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 044C68BD6E7
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 23:32:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ACB0E1F21546
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 21:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 335C615B974;
	Mon,  6 May 2024 21:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VGRWUeZG"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0931415B0FC;
	Mon,  6 May 2024 21:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715031137; cv=none; b=hW4tJLIhrkSEgueS3hBQkgy+KZ+sIMBMYWY2aUwiJpPhzrF317z6g2Ym0DN9dzC04gcHWMtSg8ZVoQhbCMGQKj5PnyiI7eJxbB2V71y4XnpjWTnh0wOgZ8LS0x4faZgs9CwsG4wY1f0kgMZ+XcSdK7zEkW2Jb7ANeuai0TZcbzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715031137; c=relaxed/simple;
	bh=Ewip+AdAKCpL4v6StD/FXI4OK0nqlbKX8uj894inBtc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=FSXCAJwqGyOVcFAJQm5ohK01XKJ1CwsqvUj2EXhwwb841XVbBpY+puk6Sr+CYB1swgqC2rUJxIVi3vFDuKI6HccTJnWlPH4FbMPExQb2ethsCX3KIKgPXineTzFHeK/tzg+QjSjTmxDVWeFpC0pEc3W1MCFudicnXFZ2QhDFRtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VGRWUeZG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40011C116B1;
	Mon,  6 May 2024 21:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715031136;
	bh=Ewip+AdAKCpL4v6StD/FXI4OK0nqlbKX8uj894inBtc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VGRWUeZGEieljxvi+vrdndEw7/2Q9zUlEvC4hN/1zVH1CU5gESL/bPGOp1BCES5yF
	 8ZY4y7L9pVWvfqZPrtMJKFz9vkKcNpiwYoXnyaKQ40zZUgBh+1hUVtQFTLaCGUrw/W
	 6hGlRUrS6m9YS1wKG6AoqwK4VE9j6VTX0FW/eJte7tYYx827lw8ZAr8VvDKl9PCfwr
	 l8v5VzfgoyUv5I164JvfSuQzNTjHPvGe5k6UZOJXhVIE5L90bblOLtEhGdNfRTjL76
	 w/2DnBAqFmICUFQ9F2YEqEir/Trc2zpYC4+p06zUVRD9/KPiu1/sex2SUFQFi1Orwc
	 9OBoZG8Lj33oQ==
Date: Mon, 6 May 2024 23:32:14 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Max Staudt <max@enpas.org>
cc: Roderick Colenbrander <roderick.colenbrander@sony.com>, 
    Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] HID: playstation: DS4: Fix calibration workaround
 for clone devices
In-Reply-To: <20240504165531.21315-1-max@enpas.org>
Message-ID: <nycvar.YFH.7.76.2405062331420.16865@cbobk.fhfr.pm>
References: <20240504165531.21315-1-max@enpas.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 5 May 2024, Max Staudt wrote:

> The logic in dualshock4_get_calibration_data() used uninitialised data
> in case of a failed kzalloc() for the transfer buffer.

Good catch, this completely escaped my attention during review.

> 
> The solution is to group all business logic and all sanity checks
> together, and jump only to the latter in case of an error.
> While we're at it, factor out the axes' labelling, since it must happen
> either way for input_report_abs() to succeed later on.
> 
> Thanks to Dan Carpenter for the Smatch static checker warning.
> 
> Fixes: a48a7cd85f55 ("HID: playstation: DS4: Don't fail on calibration data request")
> Signed-off-by: Max Staudt <max@enpas.org>

Now queued on top of the for-6.10/playstation pile in hid.git.

Thanks,

-- 
Jiri Kosina
SUSE Labs


