Return-Path: <linux-input+bounces-11959-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC9EA9A88D
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 11:43:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE9A192785A
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 09:41:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D3EA2566CB;
	Thu, 24 Apr 2025 09:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ywl53Ea1"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A6F255E30;
	Thu, 24 Apr 2025 09:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487254; cv=none; b=bI/16TqIl26tOhvp8fdlm2CRHVynyS43jJ1gROOor9fgpvD34UaQbPyPM7xiOEiERY/PKol5kSTgdacqgG0n2sUssU4XfXTAER1hkjr6v4MAUOejN5cWfGVnEbo5ic15oaaI/NdreY7FM11l3dyERC3U+24fNSoRLOU3RMe/woo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487254; c=relaxed/simple;
	bh=5wegsOzKhPIzBcWQmjpUnmFvDoW5xaWE67FCqLXk4Aw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=pwJLJRPWhOXhBBTnA4Zh+hcsRUgPR51PFO+85ZH7cBqs2yWtUpPqBr/8uXkGIxiECYRjiwD6dGR0lWHHIgojG7Hf0bwenfEaiQ2Z474GFzIC3QvCA/p1ke7oDcxHg1Ag5382g9xNHW256qEoWWLNlPiLtxnnUvxqfDWGs67rwQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ywl53Ea1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50F46C4CEEA;
	Thu, 24 Apr 2025 09:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745487253;
	bh=5wegsOzKhPIzBcWQmjpUnmFvDoW5xaWE67FCqLXk4Aw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Ywl53Ea136glKwEK3u+1KeGdw7ltEHAKvF4yyolAn0GW7NXyM1oVIh87hCCvm8pij
	 hzLWuzY4u6sjttGxmYISsZgRSgLsUmx43R2OU4b42joEQHFxuXmat0z7MplOim81HA
	 4m/MqzujmVRnfzoDhg6dcDu+DJN1CWeeUDEZQ0qFokCRSXnDDWW2DbhJr4xP+0SMIO
	 E0NmkZDYccim9SDnNgpQrUaNSa9ultqJb/iibMlzBtq7qbC79cw2hKKIRqVfeWOf5M
	 t4CbRxepsAt0I8kcNzNK4AUlCCVNNRE2mrgyHMqrwZqaTmBVxksKHK9TGHGH9W6fNn
	 fXchXVoULCSFQ==
Date: Thu, 24 Apr 2025 11:34:11 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: tang.dongxing@zte.com.cn
cc: bentiss@kernel.org, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org, yang.guang5@zte.com.cn, 
    ye.xingchen@zte.com.cn, yang.yang29@zte.com.cn, xu.xin16@zte.com.cn
Subject: Re: [PATCH] HID: hid-logitech: use sysfs_emit_at() instead of
 scnprintf()
In-Reply-To: <20250317144903174zOkphecnOt0ZMjif03iQV@zte.com.cn>
Message-ID: <r0s79204-s4o2-4439-29qs-60685211qo3s@xreary.bet>
References: <20250317144903174zOkphecnOt0ZMjif03iQV@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 17 Mar 2025, tang.dongxing@zte.com.cn wrote:

> From: TangDongxing <tang.dongxing@zte.com.cn>
> 
> Follow the advice in Documentation/filesystems/sysfs.rst:
> show() should only use sysfs_emit() or sysfs_emit_at() when formatting
> the value to be returned to user space.
> 
> Signed-off-by: TangDongxing <tang.dongxing@zte.com.cn>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


