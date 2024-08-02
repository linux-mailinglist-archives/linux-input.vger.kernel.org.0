Return-Path: <linux-input+bounces-5287-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B65AA945CC1
	for <lists+linux-input@lfdr.de>; Fri,  2 Aug 2024 13:03:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E86331C21C14
	for <lists+linux-input@lfdr.de>; Fri,  2 Aug 2024 11:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 198CB1DF69F;
	Fri,  2 Aug 2024 11:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F5a02oV1"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55671DF69B;
	Fri,  2 Aug 2024 11:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722596615; cv=none; b=aYL6FWtVMmX/6ey61WILBIKFhrSk+tYxmqNkKOxjfQ0fQPQDrYTEb8NQZ6pJOR9xlbPxfawwpex3FkI+RQFQ8TGIAaFn+W8S60iHT/BbqhGy2QF4mn1Ih/jMYfi9A5AoTRL7i/5L8LASf/cOlZsusp0nRUMXD14PJMVbCkq4eYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722596615; c=relaxed/simple;
	bh=LWc+rSaLWvjwxXgxV+/aGAg1OfcliedL/YTXIsqAGLE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=OzHOz8LcTid37fIZwLz36rK6GIVKYdqfYhnUTi8CXwfHVtx6y/FVwMbbZPhx6gWlC0o8a/f3CjY4FoHbWJj/r2oWCGMqXNo228ra3Xsdhl3LCFje/zLEl1sxJZgymV38KXYeVnzQnhHdbndJaX1PzMM1qPREcu96PLuMcezyvNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F5a02oV1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A414C32782;
	Fri,  2 Aug 2024 11:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722596614;
	bh=LWc+rSaLWvjwxXgxV+/aGAg1OfcliedL/YTXIsqAGLE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=F5a02oV19p+nDt5BNff6IR7a0kaB+/yfc1+5FMA5O0zu4Whkf/B3l6V6ZGlIeoAZh
	 mIV3zZTMSYSAs22vFPlfM4+WnVBNMAs4OR0/zgIeAjVS0dsh7V1YiaPCrMsxQTo3KI
	 JuWzc1SgjDO//2adNuIRYV6K8eGDUllPok/+xl0ltD3q0xZwlJnqWDg32747eiQAVC
	 9463+ejOXalChAmL7yfpd0UYjUMJl+YvTKkP/7PgI4PxPXf/a+aHzHwXY0ip+PGNe+
	 UQKe5nIxutGSXWQ70g/f+wUAidKXopUYKXA/ozrtcCCUAohRz+5O3o9buED53M2F1+
	 4kO11VztQqGQA==
Date: Fri, 2 Aug 2024 13:03:32 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Jason Gerecke <killertofu@gmail.com>
cc: linux-input@vger.kernel.org, 
    Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    Ping Cheng <pinglinux@gmail.com>, 
    Joshua Dickens <Joshua@joshua-dickens.com>, Erin Skomra <skomra@gmail.com>, 
    "Tobita, Tatsunosuke" <tatsunosuke.tobita@wacom.com>, 
    Jason Gerecke <jason.gerecke@wacom.com>, stable@vger.kernel.org
Subject: Re: [PATCH 1/5] HID: wacom: Defer calculation of resolution until
 resolution_code is known
In-Reply-To: <CANRwn3T4xpJVuab7cfHT8V0vH7r1Himrhq5KMLGV_xgmCH1Kkg@mail.gmail.com>
Message-ID: <nycvar.YFH.7.76.2408021303090.12664@cbobk.fhfr.pm>
References: <20240730155159.3156-1-jason.gerecke@wacom.com> <nycvar.YFH.7.76.2408011305530.12664@cbobk.fhfr.pm> <CANRwn3T4xpJVuab7cfHT8V0vH7r1Himrhq5KMLGV_xgmCH1Kkg@mail.gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 1 Aug 2024, Jason Gerecke wrote:

> I was honestly expecting everything (except maybe the first patch) to
> be queued for 6.12. If you're comfortable merging any portion of them
> for 6.11 I'm okay with that.
> 
> Patch 1 fixes an issue with declared resolution of the pen rotation
> axis. It's not a critical fix (most of userspace doesn't care about
> that axis' resolution) but still good to address.
> 
> Patch 2 is a clean-up I noticed while fixing 1. It's not a bugfix, so
> there's no reason to prioritize.
> 
> Patches 3 - 5 improve our generic touchring code. They add support for
> relative, high-res relative, and multiple rings. These are new
> features, so I again was expecting these to hit the next merge window.

Jason,

thanks for the clarification.

I've queued #1 for 6.11, and the rest for 6.12 now.

-- 
Jiri Kosina
SUSE Labs


