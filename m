Return-Path: <linux-input+bounces-7355-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2203B999FDF
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2024 11:13:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7172DB20FC5
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2024 09:13:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF33C20C46C;
	Fri, 11 Oct 2024 09:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U/3CGc9G"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C524E19E7E3;
	Fri, 11 Oct 2024 09:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728637980; cv=none; b=iQp5Kt8FG2ETWT4Xz0FvkJn6s5dz11q4t1T02nHU247iJ+p2HJ/8hN+dvDNjRav//D1Ej9zwONRqWocWL6xeZM9qmZXKg7fk1Aw/QY3+d03OGQ9hpf5evnboAbb7FD5mRblmaRPuV/VkYUPWVniol7sgrdV1iWUOF8Ac5RCPSuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728637980; c=relaxed/simple;
	bh=IllrL8JahpxL/UoKuYWXzb5AdCCI0kshL1qk/SQvC6Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ttUPKoWFMtst9BDh7bdlBtbsYcF8qtPu3Tttdon9BE/WcNDvtARrsV6bw8uZy56lrhnMqDrnh8rtmD7OZxTjYeKd2a52qNQt6Qizbu0AWPm2S2n9HIsK4wnxkJbfIslDXpePuHp4nIHeTalTk4dRnNqKfmznTTj9Y4qslMiwceI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U/3CGc9G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD2F1C4CEC3;
	Fri, 11 Oct 2024 09:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728637979;
	bh=IllrL8JahpxL/UoKuYWXzb5AdCCI0kshL1qk/SQvC6Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=U/3CGc9G6sxdbmBF3rvSihv1m2axf5ugWaf7zRseMJg074uHyuIjYB6Lo7KQ6NUZT
	 6U4PwFzPKlsf+tP3LeZ2XflXRKtHKDPzu0aL6auJlmo2A4snGYszubcVIlw/lYkiVn
	 NbdY91hVK1MfmJm8YnWqKQNQhofrh4v29pUuE2IvSnvzuY4M1y65v2DVPQss8pEcLs
	 pE/aYwPPCsfI615gnqQkzTuC7Y9/pHTlk/7muu/unNtC8E7gjkLXVMFBdfvyqMvNyi
	 vL0yDFi4ld5w5+ONBwDyQJYxAZjafobygk77GtfP3yMcAmApib1s0b1ex7p4OSS8El
	 kYRSXsG/KLUkQ==
Date: Fri, 11 Oct 2024 11:12:56 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: "Gerecke, Jason" <killertofu@gmail.com>
cc: linux-input@vger.kernel.org, 
    Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    Ping Cheng <pinglinux@gmail.com>, 
    "Tobita, Tatsunosuke" <tatsunosuke.tobita@wacom.com>, 
    Jason Gerecke <jason.gerecke@wacom.com>, Daniel Jutz <daniel@djutz.com>, 
    Christian Heusel <christian@heusel.eu>, stable@vger.kernel.org, 
    Benjamin Tissoires <bentiss@kernel.org>
Subject: Re: [PATCH v2] HID: wacom: Hardcode (non-inverted) AES pens as
 BTN_TOOL_PEN
In-Reply-To: <20241009164121.30281-1-jason.gerecke@wacom.com>
Message-ID: <nycvar.YFH.7.76.2410111112430.20286@cbobk.fhfr.pm>
References: <20241009001332.23353-1-jason.gerecke@wacom.com> <20241009164121.30281-1-jason.gerecke@wacom.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 9 Oct 2024, Gerecke, Jason wrote:

> From: Jason Gerecke <jason.gerecke@wacom.com>
> 
> Unlike EMR tools which encode type information in their tool ID, tools
> for AES sensors are all "generic pens". It is inappropriate to make use
> of the wacom_intuos_get_tool_type function when dealing with these kinds
> of devices. Instead, we should only ever report BTN_TOOL_PEN or
> BTN_TOOL_RUBBER, as depending on the state of the Eraser and Invert
> bits.
> 
> Reported-by: Daniel Jutz <daniel@djutz.com>
> Closes: https://lore.kernel.org/linux-input/3cd82004-c5b8-4f2a-9a3b-d88d855c65e4@heusel.eu/
> Bisected-by: Christian Heusel <christian@heusel.eu>
> Fixes: 9c2913b962da ("HID: wacom: more appropriate tool type categorization")
> Link: https://gitlab.freedesktop.org/libinput/libinput/-/issues/1041
> Link: https://github.com/linuxwacom/input-wacom/issues/440
> Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
> Cc: stable@vger.kernel.org
> Acked-by: Benjamin Tissoires <bentiss@kernel.org>

Applied, thanks Jason.

-- 
Jiri Kosina
SUSE Labs


