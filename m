Return-Path: <linux-input+bounces-4874-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 993D0928B0B
	for <lists+linux-input@lfdr.de>; Fri,  5 Jul 2024 17:01:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D39011C22923
	for <lists+linux-input@lfdr.de>; Fri,  5 Jul 2024 15:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F32D14A4C1;
	Fri,  5 Jul 2024 15:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VOROKzro"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD7514D2BE
	for <linux-input@vger.kernel.org>; Fri,  5 Jul 2024 15:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720191711; cv=none; b=CuLCpS0lpMau+A3mKxgM8gLQ7AWV6tExrJBQnLoCpWwPq1ebvcPC2ezLTu0R34UIPjMJxOma9EAFm6XhvV0EJu9/yBbqaq88psIGAvz5A9q1jCQixXTw+grwHF+jOKPorBAIV2RMMyLD6M/GSHK0Yhcxk/CqfRdepx6izhh1Klc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720191711; c=relaxed/simple;
	bh=OpPDdEiMz46vmN2KkM0odLlQ0zVaJuBZVLmjVzVwwXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dq1jZvSnWle0srhreRhW05ahtqxzN9JCYthDSC0YBMBR5/AYABjkHVGov82vl3meNKaOxB7RbKDjDr9D7g47ftq5vYpPQeXjoSsWgM+nuqeGSv/1T56sSMzG3Cp4WBrNuVeUkz7PGMI56+BsBJ6kqzdhwn5bPV5qq+6Eht/vex8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VOROKzro; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DC4BC116B1;
	Fri,  5 Jul 2024 15:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720191710;
	bh=OpPDdEiMz46vmN2KkM0odLlQ0zVaJuBZVLmjVzVwwXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VOROKzroRAuL5G+5pk+BB67DOcH+8GW6nyaypbgIsxM1r5PX3woQooTp5VxNHZnrb
	 CufHiGsUEtddv0xbDlg5u+JW3pMF8HyNEAQazb8B5jlI9NguNk7nBM41CANwDaLAmw
	 K276cB020g6Dd92abe/kXjtVhvwd5K3BtshkNsvKH2t0cdu+BQYQowvPhEz+gLNFOo
	 LrfhxmV6r8Ca3YZX62U7PDkh4w13SA31cd6Hmpk9RvtCxZAbCVitwyZDQzZm5Gome9
	 xGrILGP3ixwmNUnZB/Kkq92ISuW+NcGF4nJMOJmJNMa3NrZ4rGTfUpphbJl+jt37V2
	 u0qyySu9tftYA==
Date: Fri, 5 Jul 2024 17:01:46 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: =?utf-8?B?TWljaGHFgiBLb3BlxIc=?= <michal@nozomi.space>
Cc: tomasz.pakula.oficjalny@gmail.com, dmitry.torokhov@gmail.com, 
	jikos@jikos.cz, benjamin.tissoires@redhat.com, linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: increase max button number to 0x3ff
Message-ID: <ww7ozt6alknc763c34gnvi22zmqsm6uzjkkcmhvvjx4ejx5g5b@6t7za6f5iwiw>
References: <20240702114530.11800-1-tomasz.pakula.oficjalny@gmail.com>
 <20240705140408.142455-1-michal@nozomi.space>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240705140408.142455-1-michal@nozomi.space>

On Jul 05 2024, Michał Kopeć wrote:
> Do you have any guess as to where this old value came from?
> It's weird that this wasn't caught already.
> 
> CCing some more maintainers to get some more eyes on this, I hope that's okay.
> 

Dmitry will probably know better but I've made the forensic, and that
value came from 03bac96fae0e ("Input: expand keycode space").
The value seemed arbitrary, but we do try to keep it low because there
are a lot of static arrays in the kernel which are using KEY_MAX as a
size.

Also, it might be worth double checking, but last time we tried
something similar on EV_ABS range and it fell short because of the ioctl
that couldn't work properly IIRC. I don't seem to find the ML
discussion, but it would be interesting for someone to un-earth it and
see if we are facing similar issues.

Cheers,
Benjamin

