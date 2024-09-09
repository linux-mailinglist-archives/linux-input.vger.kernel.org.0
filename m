Return-Path: <linux-input+bounces-6376-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF7F9723DD
	for <lists+linux-input@lfdr.de>; Mon,  9 Sep 2024 22:40:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 223A51F21D17
	for <lists+linux-input@lfdr.de>; Mon,  9 Sep 2024 20:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF1C7189B95;
	Mon,  9 Sep 2024 20:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jCjvr9sT"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7DA13B2B0
	for <linux-input@vger.kernel.org>; Mon,  9 Sep 2024 20:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725914422; cv=none; b=hap3e1rHc6ipfRm64NPLySA18nPaBw+2MaqJ6LEsTdDUmXCyugU3+w/gp/KjuzVACiIaiWTN4YQTU+spTiYDW4PnpQvo0Dpkmq+xThbrIRCv08OeS9Mojs6NHF2GMSwOeE2TSzhmLL2xbtzPF4HP1Z0Z0Z508FbSBsJHL9lYmAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725914422; c=relaxed/simple;
	bh=3t1uPbdxBugl/dG2wEAN9XHKvhPGlIqJI06vvPDW028=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=nmfnrsJdjnlgQsD0gspG0e1/XBKZq9k802UfxS5KS9QoTOcJ+JbdPtC7tY10l/kVJAzMlYsCtffawCQpCt3qZOmxNRKyIsTXplpJ4L0ogJBKfhYeeol1giVtXks7L8Auz4Q2bSL207ARm11oAARfp4mS7uJbYux0dCmddtWNfYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jCjvr9sT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD213C4CEC5;
	Mon,  9 Sep 2024 20:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725914422;
	bh=3t1uPbdxBugl/dG2wEAN9XHKvhPGlIqJI06vvPDW028=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jCjvr9sTErAk0hC0h/sQKa0UzcsfMpJhOU5b/SgE7qa9euAkHJCO4jo9dhaHQI9Ir
	 OT3H/W4XKFHsymuaJfl38Le+5EN3XWZq8nfkogsNOatZJ7kPqOUPAftUS+q+J+Yeh5
	 +1NerETPu7OBylktaNn8BQHayzjEzx/akkh5As84w2xCIG3RsL6DN5XxMmiuWk7Crv
	 FVpecngsTbqk8Fvg6Yuw/fK++9yRFPwAuYJpaf+KQPm+lqEEicmrYqDizbazYbLVU8
	 54t9utR5lrkZFHEgKABvVbmGnXhUI/QLly1X8ky71UZsYkaOKYP40B1M1mbwt7uAmD
	 cBshbSLEUfBmg==
Date: Mon, 9 Sep 2024 22:40:19 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: "Gerecke, Jason" <killertofu@gmail.com>
cc: linux-input@vger.kernel.org, 
    Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    Ping Cheng <pinglinux@gmail.com>, 
    Joshua Dickens <Joshua@Joshua-Dickens.com>, 
    Jason Gerecke <jason.gerecke@wacom.com>, 
    Joshua Dickens <joshua.dickens@wacom.com>
Subject: Re: [PATCH 1/2] HID: wacom: Support sequence numbers smaller than
 16-bit
In-Reply-To: <20240909203208.47339-1-jason.gerecke@wacom.com>
Message-ID: <nycvar.YFH.7.76.2409092238300.31206@cbobk.fhfr.pm>
References: <20240909203208.47339-1-jason.gerecke@wacom.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 9 Sep 2024, Gerecke, Jason wrote:

> From: Jason Gerecke <jason.gerecke@wacom.com>
> 
> The current dropped packet reporting assumes that all sequence numbers
> are 16 bits in length. This results in misleading "Dropped" messages if
> the hardware uses fewer bits. For example, if a tablet uses only 8 bits
> to store its sequence number, once it rolls over from 255 -> 0, the
> driver will still be expecting a packet "256". This patch adjusts the
> logic to reset the next expected packet to logical_minimum whenever
> it overflows beyond logical_maximum.
> 
> Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
> Tested-by: Joshua Dickens <joshua.dickens@wacom.com>
> Fixes: 6d09085b38e5 ("HID: wacom: Adding Support for new usages")

Hi Jason,

thanks for both fixes.

Looking at them, it seems like it'd normally be 6.11 material, but given

- how far we currently are in a 6.11 development cycle
- how long this issue has been present in the code
- the fact that it actually does change the event processing behavior

I have to ask you for a judgement -- would you like to absolutely see 
these in 6.11 as last-minute fixes, or do you consider this to be 6.12 
material?

Thanks,

-- 
Jiri Kosina
SUSE Labs


