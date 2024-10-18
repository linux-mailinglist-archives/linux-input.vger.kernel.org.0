Return-Path: <linux-input+bounces-7531-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A279A3BB1
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2024 12:36:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E99FB280C5B
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2024 10:36:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8E5E201109;
	Fri, 18 Oct 2024 10:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rcb5kyfz"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C579C201108
	for <linux-input@vger.kernel.org>; Fri, 18 Oct 2024 10:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729247808; cv=none; b=hoNZfuuyXpiAik1j6SsWaGucCXEe7fkrNQQHGz38YWEUwMY0mYAeRWLxNeyAiBtbJ+CJHOqtTl298ULjGSolgmrdgc4YL+GZkDjnx2tIOHnlKmw9TEuT2tfVcB8cutEB4EJ1NCmsd9Hxqlo9mdsM1P0TlKW/5CPXqq6ZwDOe8Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729247808; c=relaxed/simple;
	bh=ZCBXv3l3YnTiic/ShNkBmaetvFwjU7iPDLMcNsm6G0s=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Ah3pipDrwuZECdGiz764LCWO+6mOFvGknLIdIUWjQudng07diSq6DUsZZcRDoLQNJav670x8rnh+PAEMoN636F8B/kEEikIvDx92u+GPX/iOFpJJUwsEyuiIWtfmRboh4JbKXzX0grQDH3o3MC32MZ/nkmvM1o1sQpx6Pv8N4i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rcb5kyfz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A34AC4CEC6;
	Fri, 18 Oct 2024 10:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729247808;
	bh=ZCBXv3l3YnTiic/ShNkBmaetvFwjU7iPDLMcNsm6G0s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rcb5kyfzLGjft48KSZbf/YUMji3OLyhOvSEPfmD6z2PWR3tWQVy+KIBvWzqM+5v5v
	 iXuuZCkBxXTvInmDjsksYdtVMLWDprT2TFACGGr9K+hd9CwZ5wYevZxsnx4j1TaR0D
	 nOZtw+QCNoSzYdyjmWylFAEDwITR/hSC1VqyE547CT7fBXpPo2Lt1KxTLClOoOeuXN
	 U/egqtgY1P4CzAxh0uxxk+4n95pNK0rAULXxjzY1R4eqswOPQDWwN2m7/Fyi0p2MjH
	 VML2tJOo9lsR+3eDv+I7CHQUV5kNWez/AHVbpZKenys2YgI9GKE8Dp151WyuagsKM+
	 8mFQ6FAF9alIQ==
Date: Fri, 18 Oct 2024 12:36:45 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
cc: Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
    Izhar Firdaus <izhar@fedoraproject.org>
Subject: Re: [PATCH] HID: lenovo: Add support for Thinkpad X1 Tablet Gen 3
 keyboard
In-Reply-To: <20241010094512.215797-1-hdegoede@redhat.com>
Message-ID: <nycvar.YFH.7.76.2410181236350.20286@cbobk.fhfr.pm>
References: <20241010094512.215797-1-hdegoede@redhat.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 10 Oct 2024, Hans de Goede wrote:

> The Thinkpad X1 Tablet Gen 3 keyboard has the same Lenovo specific quirks
> as the original  Thinkpad X1 Tablet keyboard.
> 
> Add the PID for the "Thinkpad X1 Tablet Gen 3 keyboard" to the hid-lenovo
> driver to fix the FnLock, Mute and media buttons not working.
> 
> Suggested-by: Izhar Firdaus <izhar@fedoraproject.org>
> Closes https://bugzilla.redhat.com/show_bug.cgi?id=2315395
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied to hid.git#for-6.12/upstream-fixes, thanks!

-- 
Jiri Kosina
SUSE Labs


