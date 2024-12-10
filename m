Return-Path: <linux-input+bounces-8476-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 983619EB00D
	for <lists+linux-input@lfdr.de>; Tue, 10 Dec 2024 12:42:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FBAF166BFE
	for <lists+linux-input@lfdr.de>; Tue, 10 Dec 2024 11:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 128312080D9;
	Tue, 10 Dec 2024 11:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JJ7WDoYJ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECA62080D7;
	Tue, 10 Dec 2024 11:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733830946; cv=none; b=LOBLdtEDlPIjPMuDjimslKTBuQWm0bMHs8x1CANHuB4fBdRVZs8sOiIANG1MDoKpP9jnkaF0xMeIR0t/RpVxQbMRpLAtfXVbIo1Bjgjtzr4ePwRKqn/5hBk39qBQGoMAlGV/f2FHOmraitK4JmQyNUFKCpcyxg8ErMUYSO41pDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733830946; c=relaxed/simple;
	bh=QpSPCa3HLk7MLV1ric2+P92d1w9U+ejZO5O2DQ54HVw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=aT1N0m4g2WD8pBfy4CMW4lnOurkVuiJyvyf/1K0iBdU2j0GlPQob19RbKSYBcvG+GApiuuMuECSvAPyeuxIr6olwu7kqOoCN5xwxHeVTMfOcSikDh/e4Aio5bb/fC43hnxTEdz4px2LOhj78AteIyl14HfqrwBPulTJ5c3HLqTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JJ7WDoYJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08678C4CEDE;
	Tue, 10 Dec 2024 11:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733830945;
	bh=QpSPCa3HLk7MLV1ric2+P92d1w9U+ejZO5O2DQ54HVw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JJ7WDoYJItFe1PvMj4pPk+JcgGwc9u6XIdHAKn3iNOIX6ihpgPhE7uhK+BhfPPtQh
	 Nugmo4Zxr1x73lHQKJotoaeZQhgUna9LFGgovOP8sxaNHsPmqVJ/xHgn6lF/gQg1+w
	 5YbJ1epsTjt+MdsS116OwHdImUBdGxDCVYsmi3zvjC3kb5DuKaMFZ4zX+zCq97/aPW
	 kM8BPvMxIwj1ux/9pNjNwqlqVtvh9DFFLlLbRV2tnUnp+3KrsIQLE1gpCGiyrsGE+a
	 k5ssoi5CDOt2lw7RzxbES3ZDkbisQTziyEXBlNNuQ8rzsfvex09N5CSscDwouXe62B
	 bNZiEVRiiDInA==
Date: Tue, 10 Dec 2024 12:42:22 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: "Gerecke, Jason" <killertofu@gmail.com>
cc: linux-input@vger.kernel.org, 
    Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    Ping Cheng <pinglinux@gmail.com>, 
    Joshua Dickens <Joshua@Joshua-Dickens.com>, Erin Skomra <skomra@gmail.com>, 
    Peter Hutterer <peter.hutterer@who-t.net>, 
    Jason Gerecke <jason.gerecke@wacom.com>, stable@vger.kernel.org
Subject: Re: [PATCH] HID: wacom: Initialize brightness of LED trigger
In-Reply-To: <20241209184029.15101-1-jason.gerecke@wacom.com>
Message-ID: <2on027qp-4q8q-1pqs-1psp-p337010npr36@xreary.bet>
References: <20241209184029.15101-1-jason.gerecke@wacom.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 9 Dec 2024, Gerecke, Jason wrote:

> From: Jason Gerecke <jason.gerecke@wacom.com>
> 
> If an LED has a default_trigger set prior to being registered with
> the subsystem, that trigger will be executed with a brightness value
> defined by `trigger->brightness`. Our driver was not setting this
> value, which was causing problems. It would cause the selected LED
> to be turned off, as well as corrupt the hlv/llv values assigned to
> other LEDs (since calling `wacom_led_brightness_set` will overite
> these values).
> 
> This patch sets the value of `trigger->brightness` to an appropriate
> value. We use `wacom_leds_brightness_get` to transform the llv/hlv
> values into a brightness that is understood by the rest of the LED
> subsystem.
> 
> Fixes: 822c91e72eac ("leds: trigger: Store brightness set by led_trigger_event()")
> Cc: stable@vger.kernel.org # v6.10+
> Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


