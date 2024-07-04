Return-Path: <linux-input+bounces-4839-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6905F926FD9
	for <lists+linux-input@lfdr.de>; Thu,  4 Jul 2024 08:44:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ECFD5B231CB
	for <lists+linux-input@lfdr.de>; Thu,  4 Jul 2024 06:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8918A1A0AEF;
	Thu,  4 Jul 2024 06:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TXOW/ZUk"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C561A08D2;
	Thu,  4 Jul 2024 06:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720075452; cv=none; b=NvDzwEMRQqypsmgHhL8JFK3uf+RPPqz0MHMWofjgtzgiTg3K4tWdGIbCsST03wlrkhRIFRZ7IPJONIbTDkeE1wf6ZtWf2v0e4sXt/Eyl3HGOpSOxINkuVM275VjcDrObRkNm63MRVobphwnsnAApnloL4EmIL0c6K7PGqGBsOvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720075452; c=relaxed/simple;
	bh=rvXyG9sJTCPpTYgjZbIeCmBobKRKTbNnXbiaWepNIm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X3wRABkKTh+409/zbMUDHBdaZzNClvVslkFccth+u4I7P6kLqePW8kYvKijTjiJDmugti/pgRXqx5S24LbUGoHzojyiszKZdTuc4hkFSxHrlsa8fhEHMkHHt8tRsOwP34S5DOFpyVRzBTGeu1ZXMr7R0QmWIz/lXT/Ya0oHLFY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TXOW/ZUk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3B64C4AF0D;
	Thu,  4 Jul 2024 06:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720075451;
	bh=rvXyG9sJTCPpTYgjZbIeCmBobKRKTbNnXbiaWepNIm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TXOW/ZUkPB+Wes/HFQ2z6SBVVUiGzt9ObQ3AMkCuh0XBBbhsGi8pGLcQrAUEcoJEj
	 Yovp920ZejtzD+0lC2Jk6HijN5M+bnOAFKmC7+/bZg3Ig/UbnQ5ffn1+Tmg8smp1us
	 QdFG/8fhMbR1/EmRk/gYRzj9+F0Igfnor9Pw8TgXUxDbSrrietuVFnZpVEF81mlCMa
	 rJQMQX2d1TIseostMZI5RZG56nlGhVv/BeVeAdBDO4uLTD34r5QURRstPe1JsqFoth
	 gIKuVevQP7NVoEHMQhEr/K6MkSioDrCCRm2S9/tW9DjhcWR4uXVJfIEXYCOQ/FRwcv
	 /FnQDxK6HeGNQ==
Date: Thu, 4 Jul 2024 08:44:07 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, Jeff LaBundy <jeff@labundy.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/7] Simplify event handling logic in input core
Message-ID: <csyxz5pcep5hxtliwhbxmzpgbwr4fpo3ckybsvtzuowgij4yym@ql77o4jlfell>
References: <20240703213756.3375978-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703213756.3375978-1-dmitry.torokhov@gmail.com>

On Jul 03 2024, Dmitry Torokhov wrote:
> This series tries to untangle somewhat convoluted logic in the input
> event processing in the input core by realizing that input handler can
> be either a filter, or a handler that handles a single event at a time,
> or a handler that can handle a sequence of events, but should not mix
> the 3 behaviors in one handler. This allows us to reduce both filter
> functionality and single-event handling functionality to batch handling
> and have the main event handling path to only deal with
> input_handle->events() batch method.
> 
> v2: addressed comments from Benjamin:
> 
> - added missing patch to remove evdev->event() implementation
> - allow not specifying any event handling method to satisfy kgdboc
>   handler
> - expanded comment on order of running input handlers when passing
>   events
> - split pre-allocation into 2 patches and moved removal of count check
>   into 3rd patch.

Thanks for the respin.

This series is:
Reviewed-by: Benjamin Tissoires <bentiss@kernel.org>

Cheers,
Benjamin


> 
> Dmitry Torokhov (7):
>   Input: evdev - remove ->event() method
>   Input: make sure input handlers define only one processing method
>   Input: make events() method return number of events processed
>   Input: simplify event handling logic
>   Input: rearrange input_alloc_device() to prepare for preallocating of vals
>   Input: preallocate memory to hold event values
>   Input: do not check number of events in input_pass_values()
> 
>  drivers/input/evdev.c |  16 +--
>  drivers/input/input.c | 230 ++++++++++++++++++++++++++++--------------
>  include/linux/input.h |   7 +-
>  3 files changed, 163 insertions(+), 90 deletions(-)
> 
> -- 
> 2.45.2.803.g4e1b14247a-goog
> 

