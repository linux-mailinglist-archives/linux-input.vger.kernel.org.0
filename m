Return-Path: <linux-input+bounces-5727-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADC6959CA9
	for <lists+linux-input@lfdr.de>; Wed, 21 Aug 2024 14:58:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E10561F22187
	for <lists+linux-input@lfdr.de>; Wed, 21 Aug 2024 12:58:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39B88192D7E;
	Wed, 21 Aug 2024 12:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mm5RoP+t"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B33188A3E;
	Wed, 21 Aug 2024 12:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724245104; cv=none; b=fhOFrICLkxLSTop+WBQ+w27val+EfELsJv4rAAgSLiDsU6dW8BEhJhLAUG7ljaYHhvgfjKAAezOwRBAoq5CqU1tZrcbRKvj/D7Ttm08Fz3qspd7ujZJHHuiZWrjzASLSJTecYLnnxkeIrRRKQIUNJIX4/l8273d3mx3YJ0J/ZaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724245104; c=relaxed/simple;
	bh=mpBh5TTSg1PYnhzinoSMRvpQ0SALxojd6diANBY1Llk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=DwUnht+5EY0b5RG+3YmsbkVteDK3KSBjqAOC6JjNYwJyFCll1S0RlrV9R1DXA8Hho3sP9akGE//A5Yrnx2YzF5XJuDpWy2PeWBPPzHxBS2QMYx7WzsGBnKOI7vihofh1T1x/3XHq/B5JRRbY8HSnKaD2P6lrKt2f0g9xFG91qXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mm5RoP+t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 387CBC32782;
	Wed, 21 Aug 2024 12:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724245103;
	bh=mpBh5TTSg1PYnhzinoSMRvpQ0SALxojd6diANBY1Llk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Mm5RoP+t8Y9ONXsB+YR9D50QRJW5a+0LSgjwpdFAuZhi4YnPghtkt34MELQ7wJDbm
	 kEaIuW/Bhzuwyq+0hu5u3qb4vPRj4ZLcM4CTvsYdhK5ofTYkI6tTgDbhotHU/k2bFF
	 y6FEqCyU5sVgYMDeXmAsWBTiVI3+DSjEHA94Hv403lZe9L5GMGhNFqgCDmRubRqn4T
	 zSIXP0nNrm5Se36mA3lSkLrYDEKhvYu9ugFAKb+eziqB1UellrgRLT54+Vk3uSaH09
	 dVr3fx+oyObouQqYUYXTPg9bToWt/FvyTihwRws9mMAaB9GhKwY84CrY+Tolk2z8N3
	 6xL4vVY6dycrw==
Date: Wed, 21 Aug 2024 14:58:21 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Peter Hutterer <peter.hutterer@who-t.net>
cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] HID: hidraw - add HIDIOCREVOKE ioctl
In-Reply-To: <20240821065936.GA635104@quokka>
Message-ID: <nycvar.YFH.7.76.2408211458000.12664@cbobk.fhfr.pm>
References: <20240812052753.GA478917@quokka> <nycvar.YFH.7.76.2408210231050.12664@cbobk.fhfr.pm> <20240821065936.GA635104@quokka>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 21 Aug 2024, Peter Hutterer wrote:

> Benjamin just messaged me about a HID CI pipeline failure caused by this
> patch, looks like it's buggy. Can you please revert it again?  I'll send
> out a fixed version ASAP, thanks.

OK, thanks for the report. It's now reverted in for-next, and branch 
for-6.12/hidraw is dropped.

-- 
Jiri Kosina
SUSE Labs


