Return-Path: <linux-input+bounces-5372-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4AC9489DE
	for <lists+linux-input@lfdr.de>; Tue,  6 Aug 2024 09:18:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 491F91C22055
	for <lists+linux-input@lfdr.de>; Tue,  6 Aug 2024 07:18:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CC65159217;
	Tue,  6 Aug 2024 07:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RnyTcZ+o"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592BDBA53
	for <linux-input@vger.kernel.org>; Tue,  6 Aug 2024 07:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722928706; cv=none; b=UZ7aZmx600HZvAR+eylLZsrasiLF9Gm2RtV8AETOgffaSTe15BiJ+Q9MrzKuiJTrN+ymNrZsYj1BhuzZQIxgWucpce+o6/PFEkUGx+aGl5pxWQHR8aEcQYXoneflkSdRgGv5VhFXfDBxdJAukJGFz0XD+G7Ik8Pcm9/5ErSpH+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722928706; c=relaxed/simple;
	bh=lJpHow9RS1vFlQnWt8CqHjdLNtO/CHe1jqZ8RNV8xMM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=t/ejRE6N3eyv/WbCIINKO3PCLtsFM8gqgNQSOCVUzX4qv9LOKN5HGmcyi6MBt79S19Qf6O0v8tAb5f5oUP+IM7SezDvDMJphd1SaDdhM8uGf9sfE/1oEpyOKEMgwv38Gxsa/shXKOmkrF4r/2TM60OgSIiQ0Iyenrh0z7I21CuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RnyTcZ+o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87BCCC4AF0D;
	Tue,  6 Aug 2024 07:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722928704;
	bh=lJpHow9RS1vFlQnWt8CqHjdLNtO/CHe1jqZ8RNV8xMM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RnyTcZ+oR2uucEOgfurro2rS5QKmr6zFC74Q8rPc7Y02F/F4vdbkVEOy0AcdwSgfp
	 yZ34pU3G/3ajqS1bRp48gValaidh4U9TvK8pwcw0mV+3hS3AmepThEFSL1aIW3Isb7
	 PtlvyJstpZthT2FPEkPtk4AjTw5zj1JU50TQVyyvVO9yV2aB/KAZBsQ6j199i1T/NL
	 MaNe64HSW1IC137havqyXd/Y5/MIl+9uVY63v7yAq/pwtx1hiom/BXq8fsP8gv2bnQ
	 QdfZTNQYtmXJslhDIeh77/eUNBnR1IGlHk+mTZ2XhprymANPF5DLlOoltijbwNYi9p
	 zIG6cb8100IXQ==
Date: Tue, 6 Aug 2024 09:18:22 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    linux-input@vger.kernel.org, Louis Dalibard <ontake@ontake.dev>
Subject: Re: [PATCH] HID: Ignore battery for all ELAN I2C-HID devices
In-Reply-To: <20240805145147.172362-1-hdegoede@redhat.com>
Message-ID: <nycvar.YFH.7.76.2408060843390.12664@cbobk.fhfr.pm>
References: <20240805145147.172362-1-hdegoede@redhat.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 5 Aug 2024, Hans de Goede wrote:

> Before this change there were 16 vid:pid based quirks to ignore the battery
> reported by Elan I2C-HID touchscreens on various Asus and HP laptops.
> 
> And a report has been received that the 04F3:2A00 I2C touchscreen on
> the HP ProBook x360 11 G5 EE/86CF also reports a non present battery.
> 
> Since I2C-HID devices are always builtin to laptops they are not battery
> owered so it should be safe to just ignore the battery on all Elan I2C-HID
> devices, rather then adding a 17th quirk for the 04F3:2A00 touchscreen.
> 
> As reported in the changelog of commit a3a5a37efba1 ("HID: Ignore battery
> for ELAN touchscreens 2F2C and 4116"), which added 2 new Elan touchscreen
> quirks about a month ago, the HID reported battery seems to be related
> to a stylus being used. But even when a stylus is in use it does not
> properly report the charge of the stylus battery, instead the reported
> battery charge jumps from 0% to 1%. So it is best to just ignore the
> HID battery.
> 
> Closes: https://bugzilla.redhat.com/show_bug.cgi?id=2302776
> Cc: Louis Dalibard <ontake@ontake.dev>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Let's see how that turns to work out :) Now queued in 
hid.git#for-6.12/elan, thanks.

-- 
Jiri Kosina
SUSE Labs


