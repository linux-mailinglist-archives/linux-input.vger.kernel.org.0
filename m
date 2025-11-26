Return-Path: <linux-input+bounces-16348-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB52C8A939
	for <lists+linux-input@lfdr.de>; Wed, 26 Nov 2025 16:17:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 95E4E3425B5
	for <lists+linux-input@lfdr.de>; Wed, 26 Nov 2025 15:17:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADBED2FFFAE;
	Wed, 26 Nov 2025 15:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PRWR9PGy"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848FE3C1F;
	Wed, 26 Nov 2025 15:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764170238; cv=none; b=VI/Bj1TaIjETSDfonpXh/rv72o+0Yb82+0DqkM3lWePFtpS13O6NK3x2nNAgkJQNhD86FttX96X+onA7o1zghFxez0qS68nq1uasL+AuC+pikU7UPAwQBWhQ6KLm4AWcX4D5aKzuPux6H3AC3t6ETCTXliDE5gszChu8xuczWJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764170238; c=relaxed/simple;
	bh=pKcW5I7K0zGZOvE1ik3CYlmSJnANH1AwhgsB7f3b5GY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=huU/yBkpE+ggc5+cxMwlTtbpv43thoDBkolX0ot5itTYIFEoiFiGB7oBnID4ZHt9uQNt7NUQdrmaXIHn+WJUFzRJJ89nHM2cgGejvwJ7VD5hsmpZ7sqQ0ZXR49wv1KfOgVq8paf/LWpXnH7h/Elc0/cqho2UTzu2MOBPMlJ0qaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PRWR9PGy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BAF6C4CEF7;
	Wed, 26 Nov 2025 15:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764170238;
	bh=pKcW5I7K0zGZOvE1ik3CYlmSJnANH1AwhgsB7f3b5GY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PRWR9PGyBnifSfpOTMf8DwIcczblTYAe2/4CkaJLZO0cW8Fd+8Id8i9asZ3E0V5jj
	 xQamKJ0XvB0gR7okzWuNPcvFMIV/vUIxjAXxX5OsMgBM6Dcv0f32jl/Lu8tR6teCtQ
	 5/XXyIFnPVXtIhmfp4P6QpY24+LtUsmGWFjD68JCzPyq8wCIs2bR5VdQTOwaO94yw4
	 KZpHsrZrL3H3rX/W4LMlPXL67QvHae+cjS+datz2H/7X83qqet7k/bL3YrppQlQVm2
	 2kUGJoRhO5+ykqNag8MrgGl/FLpksy+rRRwL3elpP6N2NuWuwdQNYtaPdtN+enK7dU
	 f0XG2X820ps+A==
Date: Wed, 26 Nov 2025 16:17:15 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
cc: =?ISO-8859-15?Q?Filipe_La=EDns?= <lains@riseup.net>, 
    Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
    stable@vger.kernel.org
Subject: Re: [PATCH 1/2] HID: logitech-dj: Remove duplicate error logging
In-Reply-To: <20251108210319.7125-1-johannes.goede@oss.qualcomm.com>
Message-ID: <n1922q86-s28p-2211-p76n-o8q8snp29478@xreary.bet>
References: <20251108210319.7125-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 8 Nov 2025, Hans de Goede wrote:

> logi_dj_recv_query_paired_devices() and logi_dj_recv_switch_to_dj_mode()
> both have 2 callers which all log an error if the function fails. Move
> the error logging to inside these 2 functions to remove the duplicated
> error logging in the callers.
> 
> While at it also move the logi_dj_recv_send_report() call error handling
> in logi_dj_recv_switch_to_dj_mode() to directly after the call. That call
> only fails if the report cannot be found and in that case it does nothing,
> so the msleep() is not necessary on failures.
> 
> Fixes: 6f20d3261265 ("HID: logitech-dj: Fix error handling in logi_dj_recv_switch_to_dj_mode()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Both applied to hid.git#for-6.18/upstream-fixes, thanks Hans.

-- 
Jiri Kosina
SUSE Labs


