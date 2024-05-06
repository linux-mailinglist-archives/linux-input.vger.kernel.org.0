Return-Path: <linux-input+bounces-3514-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DB38BD6CC
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 23:25:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0EEC2837D1
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 21:25:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E470415B553;
	Mon,  6 May 2024 21:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mcz1T0Dv"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEFAEBB;
	Mon,  6 May 2024 21:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715030714; cv=none; b=P5kslfvCkzhOtOSJY2W6xMB9J0tb+Fq9tceOz4U7hw8TeAM9KnT6L5stKN81BkLG21kM4EDglxWy8ETVwSK7RCamWLBOpRglapOMdKn49m7pD6r2DUucllQff3VZdK3grk2h/NLS9o6peyr7T8CJAnWcCsGtY+oRoz8//RQnR5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715030714; c=relaxed/simple;
	bh=1mGRnbSMckOR5vdPI2l+c5EnAebjlvUDwYoPOhXiX2o=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=sSpZyyiCIHMdOmA2q5+gcFXwC4uagrmaF3lnZWbxb5/d0l4AnvzmTv5us6FmgXiDj/nId7C3BIQBhB0pFBZBS0gxiausWgwU0/sG3Ze6g0/ykSrh/idffTjnxTbbOkI6UfgxFl+hMbMgldWhHzVhTSoe4jb6jiMN7Cc2kWti1AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mcz1T0Dv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B08FC116B1;
	Mon,  6 May 2024 21:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715030714;
	bh=1mGRnbSMckOR5vdPI2l+c5EnAebjlvUDwYoPOhXiX2o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mcz1T0Dvnlbk4qFpV7Xu4I8AEQBJEnEKUJANzPJyiEqt2SH29GacwY/fHt2sVlfJe
	 srKZ0PJ5s+RoPGZJSFlex+IUO0hVRNAjBGoUyDr7HXcMTx/c/Pe+1vbXf4wWDJ6Ehl
	 7uG0PxGlB/CjVTlEf+7o4spJnDBmSSaajtiGcRgtGsGJfoE4szDrAe1cFzNm1pT9i2
	 ki/4sySoJR+Pf4SnE8lZdws+FlQ41WLqiVM7JmPH5TsUcaYhDciV6BaMwWhU1/wSI9
	 AQ6H313rkGoI9qqNxSWAOa/bAPaKYMLkUBawJzXy5s22Hgvp8WQRV102yy8/unZPwn
	 8bORbO/Juyk3A==
Date: Mon, 6 May 2024 23:25:12 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Allan Sandfeld Jensen <kde@carewolf.com>
cc: lains@riseup.net, hadess@hadess.net, benjamin.tissoires@redhat.com, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
    Allan Sandfeld Jensen <allan.jensen@qt.io>
Subject: Re: [PATCH] Add Logitech HID++ devices
In-Reply-To: <20240424113130.60386-1-kde@carewolf.com>
Message-ID: <nycvar.YFH.7.76.2405062323420.16865@cbobk.fhfr.pm>
References: <20240424113130.60386-1-kde@carewolf.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 24 Apr 2024, kde@carewolf.com wrote:

> From: Allan Sandfeld Jensen <allan.jensen@qt.io>
> 
> Adds a few recognized Logitech HID++ capable mice over USB and Bluetooth
> 
> Signed-off-by: Allan Sandfeld Jensen <kde@carewolf.com>

Thanks for the patch!

Two nits:

- the shortlog (subject) of the patch didn't really follow the pattern we 
  are using in HID subsystem. I have fixed it, but please take care of 
  that in your next submissions.

- the patch was against some old version of the code, so it didn't apply
  cleanly (more entries are now present in hidpp_devices[]). I've fixed 
  that manually, please cross-check the end result in the git branch

Thanks,

-- 
Jiri Kosina
SUSE Labs


