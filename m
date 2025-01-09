Return-Path: <linux-input+bounces-9102-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DFBA070F9
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 10:09:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D43B9164F37
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 09:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6D68215078;
	Thu,  9 Jan 2025 09:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OuLjajun"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1B1215072;
	Thu,  9 Jan 2025 09:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736413764; cv=none; b=sG6JCUMqTsCjzqLC6aVI2S3eR663wqy8cDNz+slpv+NZ6vRc+rkXfFFsNQ9+Mg2E23A+z8oPoQZcp3t6CTjHmgx7YVIQnIkvIqjLp/JMGk+iENG0tE3FMhK/x1SECf8s8SR4+/vlHhsVpWlCUobsGWOrz6LAbm8e483QFFwJtl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736413764; c=relaxed/simple;
	bh=i6JICWELMqExZXbimav6WoN6WZR7WdoydxtcEzgH8E8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=HS2ZjO7QahHageMU0leXQpakRvOzHodRRV679ngh/mvYfbnRL4JCAH5K/Wq43YLkDlx8FSADgY5z0EvVUk7Vo08NuxCNH1188W0/3bXb/ulrVNRHZA2NiytTXVvcb5zsmx0D3qGJSolOg+WlJDbuchjFatKDlK0TupxYMQr3VFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OuLjajun; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B77AFC4CED2;
	Thu,  9 Jan 2025 09:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736413764;
	bh=i6JICWELMqExZXbimav6WoN6WZR7WdoydxtcEzgH8E8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OuLjajunv7S2I7Pxd0GMqVMomSZ2yxqDK2+0udKNcU63iMQIYSWZqquL9yes3cSZ8
	 Zn/t6YB4zWJwiNqY6GJIsJkPF6N508Uv3txfz2D3Z1SIlgig35ANESi0Lu1I/cTGc8
	 /FuNHbwtN99fGdZKgOOog63HoZYcBTL06vhRa9nIID+XosEx2Q9aqP1CRCF6H6Caur
	 62otF1aBXhnXO8Z/xdLE4g3Wnk2Oau+UQMblfTWT3716EdebnvsX4HcgYngNr8ZSIg
	 lZOFc7kWoPF62aHwpJwmlDWb8Ez/HzspkgSBt243cSuQ+ygFzCfUCmWpdh5uIVZ9sQ
	 lkSNwIA2DRyeg==
Date: Thu, 9 Jan 2025 10:09:21 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: "Dr. David Alan Gilbert" <linux@treblig.org>
cc: srinivas.pandruvada@linux.intel.com, bentiss@kernel.org, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] HID: intel-ish-hid: deadcoding
In-Reply-To: <20241225015509.458032-1-linux@treblig.org>
Message-ID: <p5656q75-8snn-po9n-74o1-r76162518n7p@xreary.bet>
References: <20241225015509.458032-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 25 Dec 2024, linux@treblig.org wrote:

> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> Hohoho!
> 
> Please find a small series of deadcode cleanups for functions
> that were added many years ago but haven't been used.
> 
> Build tested only.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> 
> 
> Dr. David Alan Gilbert (3):
>   HID: intel-ish-hid: Remove unused ishtp_dev_state_str
>   HID: intel-ish-hid: Remove unused ishtp_cl_tx_empty
>   HID: intel-ish-hid: Remove unused ishtp_cl_get_tx_*

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


