Return-Path: <linux-input+bounces-15801-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C5AC1FAE6
	for <lists+linux-input@lfdr.de>; Thu, 30 Oct 2025 12:00:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A082D1A25A46
	for <lists+linux-input@lfdr.de>; Thu, 30 Oct 2025 10:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D37A3351FD5;
	Thu, 30 Oct 2025 10:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CyLCUf8r"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA11A351FCA;
	Thu, 30 Oct 2025 10:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761821945; cv=none; b=mXfERSs+YU9GVVVXTWhTVuyiloPqJkPwia4oSZyte5jHqMLkaZEJ+t7JUwvi//9OdvhjfE+A0dMnciUDhzxU3s016wFjDJ33Y6CgduO/GqoSnLldl8q0LaswMID/n6cUGTwEGJcD2jgV0kjQ1+WC7qaF8nvPDonI2TKux9YOmvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761821945; c=relaxed/simple;
	bh=COZRRndTXCCuNb9jdjk52Qv9H7eoNjS2vtzbmIqKmwo=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=HcXA2E+O96g+BQ4BSetqvCeFaWJ9VKR78QbfEbPGXoETqsU2UA1pPTcIXr6Yq1oXQGElduW/PXGHU6WrWyuzKjsJw81yD6kAL6erk1RijSCLLQR1DDQid/YIcAYLV9ZgzX24EYLSJlXGsWFMx7GslQgZfXsr3dL6gJNW6yNlPSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CyLCUf8r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF8F1C4CEFF;
	Thu, 30 Oct 2025 10:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761821945;
	bh=COZRRndTXCCuNb9jdjk52Qv9H7eoNjS2vtzbmIqKmwo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CyLCUf8rO9V+tE2jFfLIjoWtuCtJY6kIJ3tQx0FZLW82CUDmCFYVUS7xWrgbmQgnk
	 xptce0qIbFfsGNXP13O4CyOw4A7gCKvkhyxh22/dmur0MiNawZWqNtNhnYM1ZlvcWs
	 lKFA1ZVkwBoTl/O4+v0ZyKfNwmS1pSV/iJmgPkJOnMQ2CsD4pL3dFQt4eM5r3CRUBs
	 sKvYyqm2/aG11L3WFhMDgaXxgG57BzaIVfXJAsyL5zFDYZsBFiGnCojS9mMDtOXsAv
	 xb4ATZx96du/Oxz5kd7cyrq32R8goevj4IMkDxa7/vuQPHHZBU523q/CIWrHoH3ju6
	 FDfl6TIW3zlwg==
Date: Thu, 30 Oct 2025 11:59:02 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: "Mario Limonciello (AMD)" <superm1@kernel.org>
cc: mario.limonciello@amd.com, basavaraj.natikar@amd.com, bentiss@kernel.org, 
    stable@vger.kernel.org, Titas <novatitas366@gmail.com>, 
    linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: amd_sfh: Stop sensor before starting
In-Reply-To: <20251020155101.3905957-1-superm1@kernel.org>
Message-ID: <1or13364-50n7-8071-r47o-997nq0on0327@xreary.bet>
References: <20251020155101.3905957-1-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 20 Oct 2025, Mario Limonciello (AMD) wrote:

> Titas reports that the accelerometer sensor on their laptop only
> works after a warm boot or unloading/reloading the amd-sfh kernel
> module.
> 
> Presumably the sensor is in a bad state on cold boot and failing to
> start, so explicitly stop it before starting.
> 
> Cc: stable@vger.kernel.org
> Fixes: 93ce5e0231d79 ("HID: amd_sfh: Implement SFH1.1 functionality")
> Reported-by: Titas <novatitas366@gmail.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220670
> Tested-by: Titas <novatitas366@gmail.com>
> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


