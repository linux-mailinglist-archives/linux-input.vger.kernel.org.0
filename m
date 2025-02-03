Return-Path: <linux-input+bounces-9734-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9182A26601
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2025 22:48:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E65518854E7
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2025 21:48:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C02BC78F54;
	Mon,  3 Feb 2025 21:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mcnD9DmI"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4F63A8CB
	for <linux-input@vger.kernel.org>; Mon,  3 Feb 2025 21:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738619275; cv=none; b=d/jqazcar6jsSIklgrO2szFLSrapZOXm3BiA9IZvRl7ed0KN7nvv4tj4EGB9XdUU6dwWVufA9X7gGP9jvQhSBSSn6vTmTrTBflhV6kre2BrCcIkl+6YnGDEMBeRABKTt64R14ldvcDfj0Pz9iyU13g1UQRnW1MYKAfP5BGGzMHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738619275; c=relaxed/simple;
	bh=2KTHbSV1984JhKGsJu0PqcFUOGwgPH9kc9JmuNF6xcU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=srqrsiHFHPeje3hvl5A6fDUm+O5IAhxxkPKcUNyHlBMYQhNpA4lyjQQFAieR04OaXhYORErkjZVLle+BJQYCMuGXw5+QIi1qbfqvfKNpvjFUElL3zWYXFJBiZbYMoFOwx/cDjW4n2ukZc2Abeby41HPQQ49F+o6kfjexW5ukNIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mcnD9DmI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47C68C4CED2;
	Mon,  3 Feb 2025 21:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738619274;
	bh=2KTHbSV1984JhKGsJu0PqcFUOGwgPH9kc9JmuNF6xcU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mcnD9DmIXWV79QHU5GgT6q9sHeYfBIAdtYW+4XZMY/M4zCjG94hvK3lRzxHeUxSho
	 V0ZPWPtNhQyzhOHh+pvxxtPYpSP+WKp1EbOObUv5j54li3UXVkgQmvsnIXHaC3za8m
	 W3Q+T5jLHUvFxvWwb+u6TAsvG6vnn3LB50Rn1tv0ktKWLOyr9n4hQnGzYwLU3DYUWw
	 nWbzM5IqsmbLzUXyZBEB0Smysfq3DySh+tjQ3KCbR/AX//RsCbxksaWslS1ybeIKOx
	 R7g4eQ7ZI6qfesOKV1sjTQ2KbhBs3pT3naflWbGfP5S32AFOXr03X5gJntDO3PBSwe
	 pkvrbjwecMXlQ==
Date: Mon, 3 Feb 2025 22:47:51 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Charles Han <hanchunchao@inspur.com>
cc: bentiss@kernel.org, linux-kernel@altimeter.info, 
    linux-input@vger.kernel.org
Subject: Re: [PATCH] HID:  Add NULL check in winwing_init_led
In-Reply-To: <20241114091947.78925-1-hanchunchao@inspur.com>
Message-ID: <405r9p08-5s14-4s86-67r4-0s279ps2p978@xreary.bet>
References: <20241114091947.78925-1-hanchunchao@inspur.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 14 Nov 2024, Charles Han wrote:

> devm_kasprintf() can return a NULL pointer on failure,but this
> returned value in winwing_init_led() is not checked.
> Add NULL check in winwing_init_led(), to handle kernel NULL
> pointer dereference error.
> 
> Fixes: 266c990debad ("HID: Add WinWing Orion2 throttle support")
> Signed-off-by: Charles Han <hanchunchao@inspur.com>

Applied, thank you.

-- 
Jiri Kosina
SUSE Labs


