Return-Path: <linux-input+bounces-6418-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 58199974503
	for <lists+linux-input@lfdr.de>; Tue, 10 Sep 2024 23:48:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04EC81F253E3
	for <lists+linux-input@lfdr.de>; Tue, 10 Sep 2024 21:48:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97F6918C33E;
	Tue, 10 Sep 2024 21:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i0zRSVHd"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749A016C854
	for <linux-input@vger.kernel.org>; Tue, 10 Sep 2024 21:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726004932; cv=none; b=c6ksVj+AkL2DXvfCospPAPgurUqBcl8R3ywD1/Uzm/dlJ15YnnNFAhlzQ4fwyWM9gQ6H8P3gYwMTl8CPpTtaySqEehELOcXZRe01U6twX8argBbYIr7nZRegS0bItoWUv3EEeutPX5zKPm3zH8igej/8wuyvhpSCtZaAOHhksaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726004932; c=relaxed/simple;
	bh=DvO/gsRIVNvxodU2IdYYOhhBYJ/EvXLFMhf9qNZ8QhI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=DGC7fWNPx4rbvvMMuKCsJldT58O0dVFK1ICdQ/BjXV2pbEgelni5c1ShJlPbC2g3QcaM17NAauTY6nvWToUNerhY/D+IG5ilygRYs7wYdrXOmLe6eO6Ub2fMKIx9ZWN+ou4/DJh2YRyT0SSvvYKhb/hKaiArSihfUTpZSupBbVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i0zRSVHd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7EA1C4CEC3;
	Tue, 10 Sep 2024 21:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726004932;
	bh=DvO/gsRIVNvxodU2IdYYOhhBYJ/EvXLFMhf9qNZ8QhI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=i0zRSVHdNByMdHPHlA0NZtCSl5NIpihDDpSK9ztqSi46LdAHGsWddjwAl34hiD5aF
	 B4tHyl1Znt5G7HPzkpE4oNz+YhLbj8MClG4JQU6Rd0soCKv5LggtjZENli6Au0+UQU
	 gNVi35khjmpK4I1h1pfv1KW9JRSXAeO8V2XtkGkhrz1ErPtxMmsf+W7JVVyZdJ3SCV
	 PAZVFbw+lkmOgKsMuIeRvgc5rYmxZ711NHV8LzNKXA/QTE0UK8mgJ2nwXj44wulkG0
	 VKH8zoiBwJ11C3Hkr+9N1JDDI6IUB1cix6qUdpk7eGD8NA58Ee7rohAwzh/ZpQ0dkv
	 OGGrvEkahFWLw==
Date: Tue, 10 Sep 2024 23:48:50 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Jason Gerecke <killertofu@gmail.com>
cc: linux-input@vger.kernel.org, 
    Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    Ping Cheng <pinglinux@gmail.com>, 
    Joshua Dickens <Joshua@joshua-dickens.com>, 
    Jason Gerecke <jason.gerecke@wacom.com>, 
    Joshua Dickens <joshua.dickens@wacom.com>
Subject: Re: [PATCH 1/2] HID: wacom: Support sequence numbers smaller than
 16-bit
In-Reply-To: <CANRwn3ROebV4gj2w9Q2q7xDSKL0qEiH+Knx_jF55FqQLZ1YRcA@mail.gmail.com>
Message-ID: <nycvar.YFH.7.76.2409102348250.31206@cbobk.fhfr.pm>
References: <20240909203208.47339-1-jason.gerecke@wacom.com> <nycvar.YFH.7.76.2409092238300.31206@cbobk.fhfr.pm> <CANRwn3ROebV4gj2w9Q2q7xDSKL0qEiH+Knx_jF55FqQLZ1YRcA@mail.gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 10 Sep 2024, Jason Gerecke wrote:

> These are pretty minor fixes, so I agree that there is no urgent need
> to get them into 6.11. Feel free to queue them for 6.12 instead.

Thanks. Both now queued in hid.git#for-6.12/wacom.

-- 
Jiri Kosina
SUSE Labs


