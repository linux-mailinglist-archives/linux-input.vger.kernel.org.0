Return-Path: <linux-input+bounces-6758-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F542987321
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 13:55:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DDA10B27765
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 11:55:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1C5515383F;
	Thu, 26 Sep 2024 11:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NBaM49d2"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826A01798F;
	Thu, 26 Sep 2024 11:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727351698; cv=none; b=CjgnCgamPrj/3WpBdDHj2i43gtSdUqsRQXu0Be/ZszxfH7+kFW4NGuKCK3dUhRvC0QsjJotPO/E/J3aRNi3RqrfK6RhfYBVaT61ssN7k8uPrfm026NPbEmnKlJxeIbMPKBFxKKQSoV+jo8wETtpguhRI3NwuX8ipFbjgAURIVZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727351698; c=relaxed/simple;
	bh=pv76Q8cH20FnIagVxuCMJYVjeT1pz9UhuUuSKP7NVOo=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=B+r2B53/T/nNtMOEb+6cG9xmLbMHkFFQYOLa7TL7rJ5giKsXG7Tp3NMnh5QKG4yg+Pv9x4qjAUgKu/Tag2BixDMZqAgLxH+pzqqQk2yCf3/FhZQq16kBa9+JNQi4LBx6OiO7rAMuQ7GqBn0f5xCrpLkMefCzvI3IDbUCsgMWWOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NBaM49d2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC7F2C4CEC5;
	Thu, 26 Sep 2024 11:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727351698;
	bh=pv76Q8cH20FnIagVxuCMJYVjeT1pz9UhuUuSKP7NVOo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NBaM49d2x+11ox7BoohZjS8Lg4Z4Dr0boUzDT+SnyQlHgJhuq4Ro38yvuS4BgSu8D
	 rW9fImvJ2nwdnZDT2pQ16g98sd2LfWoJe7RmdGG7yNFrY6SmQ6nMA0sJZvPnHg82qC
	 ZrdRhMAJcxd07+w8nQEgE/Dy6N8pM1OljquGz46yrMd9L7cKR+y9ZdYz0VFZUqBN/z
	 3sIlxV55nv5ZnNDWNA39bJWFtQkpnHWUJq9dOWnF3O87ANiACUHr2BKKh/Qws9aRxX
	 Xyha4ol4g3TA76M8kWdTIM+WsU13Dta2PG2Ury7gGhS80SPotCeusybgjQI/Wa6jgl
	 afmIG0DIl8hmw==
Date: Thu, 26 Sep 2024 13:54:55 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: "Luke D. Jones" <luke@ljones.dev>
cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
    bentiss@kernel.org, platform-driver-x86@vger.kernel.org, 
    ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com, 
    corentin.chary@gmail.com, superm1@kernel.org
Subject: Re: [PATCH v4 2/9] hid-asus: Add MODULE_IMPORT_NS(ASUS_WMI)
In-Reply-To: <20240926092952.1284435-3-luke@ljones.dev>
Message-ID: <nycvar.YFH.7.76.2409261354320.31206@cbobk.fhfr.pm>
References: <20240926092952.1284435-1-luke@ljones.dev> <20240926092952.1284435-3-luke@ljones.dev>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 26 Sep 2024, Luke D. Jones wrote:

> A small change to asus_wmi_evaluate_method() was introduced during
> asus-armoury driver development to put the exports behind a namespace.
> 
> Import that namespace here.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>

Feel free to add

	Acked-by: Jiri Kosina <jkosina@suse.com>

-- 
Jiri Kosina
SUSE Labs


