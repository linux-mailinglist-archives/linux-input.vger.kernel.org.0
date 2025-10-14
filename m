Return-Path: <linux-input+bounces-15466-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7889BBD8904
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 11:50:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E21061923F6C
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 09:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E95F2ECE8A;
	Tue, 14 Oct 2025 09:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ev6m9C85"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93D42EA464;
	Tue, 14 Oct 2025 09:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760435379; cv=none; b=HVRAAxOg+mB66QyNt2fawSGS62ia/E+iXpvEJxqbQJqT3Uji6fj1/yLTMulGRyWfD7TwbJQA/WthkKizBXf2ja3LyUdNDyD1TSNZ06nISvN+WRV+0XbH+KfSQ0coP517U2CIDlIPI0EsDBuB2GufnVS826HEPYsQrZvi4tRH1iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760435379; c=relaxed/simple;
	bh=uH7py945OSsNNbDCC07bufm25hd2kEbN/BWICZz3kVY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=LjoJLQ/N7SPjA5m/r03t886+au8auqBxLEJI0LNPbOohy9eE8Bhsb/j32E44aDSi/8IlcfRzlIjS7VkEukYh7V5c6d0UPSu2LgQxX0Ba98PXe8PwwmhU+SY3JlBZAiQWe0l8DPbKp2xIk4G50jOvjk9KdsCC/Kl3p5raJmXcPoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ev6m9C85; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1766DC4CEFE;
	Tue, 14 Oct 2025 09:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760435378;
	bh=uH7py945OSsNNbDCC07bufm25hd2kEbN/BWICZz3kVY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ev6m9C85G9BoEknIhp0oKmQNENObBfdmmO0qcD7seJXX0y2YbXmFOgf9lNC5G66OF
	 NjCiL/wZODdkLwA8cl5clUI954cm+opGJ3XPvQsbuUpt8u/UfVy4v7WRY1/136/K5I
	 oP1x0WbeHyjMM01eg64xRhkNXtPTLGNOa8tR4KobG7yTSAOHuBkL6l4PHZWF1dNVJ4
	 lQiO0ALxvvU9nN5NPxW70gG7ci3F7UbrQCbG7rvjZD1jZgV8upiFq85g8KO7Pqkv3y
	 jd4IfDFEyCgd1W/GbF7g5f/dcK76u7bOU+BryMHFIvg7z94fwqtRYO1b+ZfAyJ+Kkr
	 UOvY/GgdTi5Lg==
Date: Tue, 14 Oct 2025 11:49:35 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Oleg Makarenko <oleg@makarenk.ooo>
cc: Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: quirks: Add ALWAYS_POLL quirk for VRS R295 steering
 wheel
In-Reply-To: <20250929154639.1014717-1-oleg@makarenk.ooo>
Message-ID: <263521s2-1r18-92o6-53r8-sn31075731s7@xreary.bet>
References: <20250929154639.1014717-1-oleg@makarenk.ooo>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 29 Sep 2025, Oleg Makarenko wrote:

> This patch adds ALWAYS_POLL quirk for the VRS R295 steering wheel joystick.
> This device reboots itself every 8-10 seconds if it is not polled.

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


