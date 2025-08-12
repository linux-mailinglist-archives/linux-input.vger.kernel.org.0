Return-Path: <linux-input+bounces-13937-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB32DB22718
	for <lists+linux-input@lfdr.de>; Tue, 12 Aug 2025 14:38:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8ACB4168643
	for <lists+linux-input@lfdr.de>; Tue, 12 Aug 2025 12:36:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90BDC1AB6F1;
	Tue, 12 Aug 2025 12:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LpPv4vwJ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD541A9FB9
	for <linux-input@vger.kernel.org>; Tue, 12 Aug 2025 12:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755002134; cv=none; b=pIhEtGSSbNR+XhZ5Sps14/z9bKJGh91aiXpGCueHninoen3UWBfC1lyQWLmYVTLPbijqUBuTfmMklwEMTS0Qam9O0sQh1qw3Q006xg8qe5FGqdYGiARyRwdnjtQDU/5wKBQO/Iq+hn4AFc1FrBX+FepGHPtRTQvyZIuW8BFgse0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755002134; c=relaxed/simple;
	bh=3SNqkz+t+jIfQ3zYN7EMzkM2CFTNY1rXRN9hsMiwp1M=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=DyD6J+pO8SuRsOViFKKZ7cOEr/Z566Pmg5iPjJ9ABlM4iiNmNE8EHD6cv5wbPXI3gZVyhHfRPTJWitXaYv1WVuWxlaPtFhULY9c81U7vxozxu0IHVRGbFMKFWrwNXiNnJuU04QfIkEL2yYPjV4cUh1572vkp9MYzIeUWAY2FXtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LpPv4vwJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6390DC4CEF0;
	Tue, 12 Aug 2025 12:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755002133;
	bh=3SNqkz+t+jIfQ3zYN7EMzkM2CFTNY1rXRN9hsMiwp1M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LpPv4vwJgvXMEKOfYsECh5zzmia29uTrROtOC7XBYsB89dvGKIXWbhjWd0VmpLzOk
	 lvReXax64J1k68mjDdwm7Ik24jZ/kfDNGYu4pbK23NEsPaAp4n+kJkenIdc9J/dKZz
	 gohspgnYxfMMyUNVIcglZbJSvuopBBoNLBtxWOWbs6JdEEOjPJoae5GRmerpEFnPJN
	 sMaKLzur+7/36x2+PdhpwjcL3HXBvcPZRE0E6QEufV4WBAP2SHCWn+sJBvedl6uruL
	 NsJTIRBx9lvnFGlID5/wMwXGikfAQgapMMM0eSZx9g9qlHFIkj39bqpvhPLoBZljC+
	 467bo1ZELo2pg==
Date: Tue, 12 Aug 2025 14:35:30 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Ping Cheng <pinglinux@gmail.com>
cc: linux-input@vger.kernel.org, bentiss@kernel.org, Dmitry.Torokhov@gmail.com, 
    stable@kernel.org, Ping Cheng <ping.cheng@wacom.com>
Subject: Re: [PATCH 1/2] HID: input: map HID_GD_Z to ABS_DISTANCE for
 stylus/pen
In-Reply-To: <20250710212859.7892-1-ping.cheng@wacom.com>
Message-ID: <29911p88-1n01-s610-9opn-98n874r84srr@xreary.bet>
References: <20250710212859.7892-1-ping.cheng@wacom.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Both applied to hid.git#for-6.18/core, thanks.

-- 
Jiri Kosina
SUSE Labs


