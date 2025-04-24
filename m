Return-Path: <linux-input+bounces-11970-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF21A9A9A0
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 12:12:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 996EF18851D8
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 10:11:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5003F221264;
	Thu, 24 Apr 2025 10:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Khqy5tJq"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2960421FF26;
	Thu, 24 Apr 2025 10:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745489471; cv=none; b=D8BIimGjcgfOFfJQPBd16hevelIaOOWjBnf5lMcIYsktzwZ9FCzXvvmaV53TmlqG6Vh3F9fyiUwi8vtWKpQPad1PeSdlkBV6mJktl2xRRmXxKAIQXkPqbPRxQAxq+3wXP2HUnmKvsPCx4ubxEZCtqFPThdUrLXyu7noYJWtlqCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745489471; c=relaxed/simple;
	bh=gwGs+zEQrgnebf31eA0XJog2YaKl1vdWSbAnzz6kI+Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=R3I0eOHOSKCUru7LOH1dpG4CN5yQ52iR3sttSHJb3b2aYyfN8miHa4ywLDQM4tNh83EBw0LeasteXVNirxfP3vhfB6b1SOeAD3f+9iTW33zPCEaB7GePgk8z5s1MxMGzH9MQZLctKFELAH/OKpIF2x1l3NQ8dT0e2TKWxLI2mcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Khqy5tJq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11A83C4CEEB;
	Thu, 24 Apr 2025 10:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745489470;
	bh=gwGs+zEQrgnebf31eA0XJog2YaKl1vdWSbAnzz6kI+Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Khqy5tJq767AbXxsuzPRcTa6QqevexlRxECUtyvMzbfn3w7bj0V01fVMWvAGNkZZG
	 PL2uK4Fsl6iqoRxueDg9Bz5Ut4f0mmyHpJY9Y8fuJ4KvugX0PG0YnoBN5XvMks8n0r
	 AIJP9Vtw4S8n8QPx8+ha8513YOS6a9ClL0gbsYPZsiimJFeKeyvkWBtzcrvLtNDlQX
	 jdQQHtvEttWOWwg9PWNBxPUXeItljfYfz73v0p5zOLp1mzTifywWjHTZXJbLY/wVr3
	 rEe7iGkUE+bQCNi3FNkpJHkYSrzdyFCSIqcYMMaL+6c2gS9ZWgb4yXduOjbEYJOpjR
	 a+wF6nxz3O+AA==
Date: Thu, 24 Apr 2025 12:11:07 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Aditya Garg <gargaditya08@live.com>
cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
    linux-input@vger.kernel.org
Subject: Re: [PATCH RESEND v2] HID: magicmouse: Apple Magic Mouse 2 USB-C
 support
In-Reply-To: <PN3PR01MB95978C46B66BD92230030AD4B8B22@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Message-ID: <o0035599-3p0n-7rs1-1951-9o854266o77n@xreary.bet>
References: <PN3PR01MB95978C46B66BD92230030AD4B8B22@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 15 Apr 2025, Aditya Garg wrote:

> From: Aditya Garg <gargaditya08@live.com>
> 
> This patch adds support for USB-C model of Apple Magic Mouse 2.
> 
> Except for the hardware ID, it should resemble the existing configuration
> for the older Magic Mouse 2.
> 
> Signed-off-by: Aditya Garg <gargaditya08@live.com>

Thanks for the patch, now applied.

If I may have a request though -- please avoid all those resends after a 
few days, those are not helping and just create more mess in people's 
inbox.

We're very rarely losing patches, it just sometimes takes time to process 
the whole queue.

Thanks,

-- 
Jiri Kosina
SUSE Labs


