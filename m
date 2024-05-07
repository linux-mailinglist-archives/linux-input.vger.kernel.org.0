Return-Path: <linux-input+bounces-3542-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C75F8BDD56
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 10:43:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 030F01F2186F
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 08:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CE57149C6F;
	Tue,  7 May 2024 08:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KleSiQcp"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7642113C9A2;
	Tue,  7 May 2024 08:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715071390; cv=none; b=nwumvP06FrWVc4NvRqionfjefQhcyQRCLl+zBDs1srOYnEjDLf8j9xJs8xopIl/WA6SskMjARuspXCTe4V04kwlMfCHbz/C3MWDjtCJPXqn/gjV8DzwJtZe8Twvjxj7BT0rY1h9nmDNCc1zeIh5FmEd4Hs+n6BsHepkKBcibnp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715071390; c=relaxed/simple;
	bh=30R4BGw8vQ2acV/oSTZ/fB078AWccrZdsOiyGoe+OAU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=arnk4/CypLA8Jg8hxLvDOTLfgT/jhQlKk5xgBrPPJZQC2RsDd8eVnmWwgBJm5rkH1euZxkWWjgeI4boezhzO/cY4udP9wrVmZbiV9sBwZOYQ7LBwixLKIjlastKOQH8AlO788tbHA5PIaDNTIB6yVEHx8ZV0+9TiuiSAeiG5l8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KleSiQcp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9DD4C3277B;
	Tue,  7 May 2024 08:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715071390;
	bh=30R4BGw8vQ2acV/oSTZ/fB078AWccrZdsOiyGoe+OAU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KleSiQcpAeVQGDMv7tbDxKCMbgY3y6rcQNJIlZJoQrDvvnRNPJ+kMBpRpMCJKY4GR
	 aAC23jJHZoWT2U9dPxYQ7P9O5QcWPo+dLfcPdw2IIPSNAFeiRUWr4gJETCIn7cIEVP
	 9Q7nvhnTiTum6y70wfMHUb0rwEorZ/NzPOlD/2XVExXoAWS05gZfrpOtJgqHc4W/9/
	 EwodRb6HMrQCCpRrRapX0kxqqGkS/zfwcyO9e+qxvpcJf8+zSzjpIyRW2EvZJhTGhn
	 /PxVoysGnt6zw1cHbLy0paR1D+Oe8lY/MQr3RFo+Vxt0H+dqUBTH72gs03eoIW9qlA
	 957NxJPSX9eiw==
Date: Tue, 7 May 2024 10:43:07 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Kenny Levinsen <kl@kl.wtf>
cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    Stephen Rothwell <sfr@canb.auug.org.au>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: i2c-hid: Remove unused label in i2c_hid_set_power
In-Reply-To: <20240507063656.2892-1-kl@kl.wtf>
Message-ID: <nycvar.YFH.7.76.2405071042440.16865@cbobk.fhfr.pm>
References: <20240507063656.2892-1-kl@kl.wtf>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 7 May 2024, Kenny Levinsen wrote:

> This label was left behind when the wake-up logic was moved from
> i2c_hid_set_power to i2c_hid_probe_address. Clean it up as it causes
> warnings-as-errors builds to fail.
> 
> Fixes: bb1033c8a3ea ("HID: i2c-hid: Use address probe to wake on resume")
> Signed-off-by: Kenny Levinsen <kl@kl.wtf>

I have added

	Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>

and applied, thanks.

-- 
Jiri Kosina
SUSE Labs


