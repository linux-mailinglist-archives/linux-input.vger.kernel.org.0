Return-Path: <linux-input+bounces-7897-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBA79BF323
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2024 17:24:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A9940B21A4F
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2024 16:24:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C6802038B9;
	Wed,  6 Nov 2024 16:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EujIkETc"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3437A202F6C;
	Wed,  6 Nov 2024 16:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730910261; cv=none; b=jQBKcsQ0w69P99ytQJkHosOWcJX7Ahwsk+iqAuRicxxxzUj1ELriMnsB3GOQBzSrIegdooVBugiNUGZVNeQUGBv+gUhdAo+RfcMxmugSP05fFob7jS5wZwzFZ1dmyy5vDyDarQUE6uco3oPoLbz4kORyFe2ah5aNEzh8lu7wyUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730910261; c=relaxed/simple;
	bh=WJ85U+Gf0NVtU9Sl8qp6wXx6G8m4tNPloCrhUyzgyPo=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=UsCP8/vs58UnZKvnpOL3jwGWFFb7gJtsU1uo89HM0DuSyOvkFfMtWObIK+YxftijTpkVSzBnSbiTK7C7Aa9+oC1DazaxrZKmlJaqi8xUWDv+1sce7TOBFmiSFu/tAQk932b988uEX7EHMwuy55EUs4/fun413QpPDHwRNrtyKBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EujIkETc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FDEFC4CEC6;
	Wed,  6 Nov 2024 16:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730910260;
	bh=WJ85U+Gf0NVtU9Sl8qp6wXx6G8m4tNPloCrhUyzgyPo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=EujIkETc8SaQWqy210eMkOdlisj0y7zdpzNFkXAvlYDsIe21lmkoJ3idrGljHplqe
	 A9JTsboWIAS/xp+SyqeK+QMyG8Qt2GeqIVjNM7of68vLIdP5l3+0rcVZRRm/ErURsw
	 vJRvDIe3H8T4Ndbzs0x1K+gEx0CUwKh/8sSZivlVUP5xuwsOctC0MoMdnd3JWFDZHy
	 EGXT6ijBfiGFX3OTcYs+GyDusJJgrnJgVqJpQrMrjrrgZObUcgQ6XP1hYS5gWRevgW
	 IJHvSf480MQ/rwuNzHrB5AjfbsQeltCViKRPeeNryG97CyaIopdHwiV4C1srpLohbs
	 yL/2FQ4x8ZF6w==
Date: Wed, 6 Nov 2024 17:24:18 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Vincent Huang <vincenth@synaptics.com>
cc: Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org, Marge Yang <marge.yang@tw.synaptics.com>
Subject: Re: [PATCH] HID: rmi: Add select RMI4_F3A in Kconfig
In-Reply-To: <20241016105549.250515-1-vincenth@synaptics.com>
Message-ID: <nycvar.YFH.7.76.2411061724100.20286@cbobk.fhfr.pm>
References: <20241016105549.250515-1-vincenth@synaptics.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 16 Oct 2024, Vincent Huang wrote:

> Add `select RMI4_F3A` under `HID_RMI` in Kconfig to support buttons and GPIOs
> on newer Synaptics HID RMI devices. Future devices will use F3A instead of F30,
> but F30 is still selected for backward compatibility.
> 
> Signed-off-by: Vincent Huang <vincenth@synaptics.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


