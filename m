Return-Path: <linux-input+bounces-4204-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86114900839
	for <lists+linux-input@lfdr.de>; Fri,  7 Jun 2024 17:06:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C3B928E5E9
	for <lists+linux-input@lfdr.de>; Fri,  7 Jun 2024 15:06:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FE4454660;
	Fri,  7 Jun 2024 15:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CPFGtNlO"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFF6187336
	for <linux-input@vger.kernel.org>; Fri,  7 Jun 2024 15:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717772669; cv=none; b=aTf7DhMHqg8T7wqScBYHT4qtjJBRoL3/+o/JAyy6ucOCqaNTG2CE5CiXjGWKBNzZbVbAsHSK5uKYBFkZNKDZfpSbb2SUC0j7ZKHCRrHqEwkLkwnrqAWTTpDA/Anxf0hpVdppmT9Q8vaoikNTz9tKmceFZ6Pimu3hpRTq5tc8VyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717772669; c=relaxed/simple;
	bh=zrZC+YjR1FZzEcStKKeEXzc+JOZ10w7l9GwF1j6Le1Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=pUPscbEE9FzEZWXedZ9g2cOqCineb1CunLpnJ9qwKS6WQ6WvNuDn56Av5fETmYoew1FhFk99YCNPb7ObIxSI79TnDjdBUTAvNnOk3tex11warETbg9TphfCi3uSinwjY4RKgIC1KYf5wnrqn3EehbPZ004sfUWMhicO8p9vwzws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CPFGtNlO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7796C2BBFC;
	Fri,  7 Jun 2024 15:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717772669;
	bh=zrZC+YjR1FZzEcStKKeEXzc+JOZ10w7l9GwF1j6Le1Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CPFGtNlOlPioXju/4GqpgweAS0AlYo84ko4LKH/lek3u+70rvvdbpCIbT8ilrTbh7
	 To39jY19Z0QKDL99uOVdhv+QqLKolDB0gMwn1IKJ4XtS2RYXAclqpdPAB33GZXlezG
	 853LIfAa/wON7R7G85VOLEIeiTh++htXBBqv/EWAyxbg9zVabqkEwmBSDkebdrUDp7
	 AaCV7cmiwR7La2+gQdEWhwhzmtOxpmBYwriMmAo81kSDEFK0P4MVhFw6hYqpjw3xtu
	 8LZU5guGOqpgKmaP0eUWgsS/D3RWeRIzwNS47SzQmzjRI+D+c9ic8oRNaAiSm24HZm
	 0o4ZqsLtGvTjA==
Date: Fri, 7 Jun 2024 17:04:25 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Louis Dalibard <ontake@ontake.dev>
cc: linux-input@vger.kernel.org, bentiss@kernel.org
Subject: Re: [PATCH] HID: Ignore battery for ELAN touchscreens 2F2C and  4116
 on ASUS Zenbook 14 (2023) and ASUS Zenbook 14 Pro (2023)
In-Reply-To: <12450414.O9o76ZdvQC@yuki-p>
Message-ID: <nycvar.YFH.7.76.2406071704130.24940@cbobk.fhfr.pm>
References: <12450414.O9o76ZdvQC@yuki-p>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 7 Jun 2024, Louis Dalibard wrote:

> The touchscreen reports a battery status of 0% and jumps to 1% when a 
> stylus is used.
> The device ID was added and the battery ignore quirk was enabled for it.
> 
> Signed-off-by: Louis Dalibard <ontake@ontake.dev>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


