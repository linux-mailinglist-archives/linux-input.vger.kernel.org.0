Return-Path: <linux-input+bounces-9104-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D31A07148
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 10:19:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B02B3A2031
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 09:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95B7E215F5F;
	Thu,  9 Jan 2025 09:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JAmcH6ik"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7BE215F49;
	Thu,  9 Jan 2025 09:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736414241; cv=none; b=upHUbETuVzg8QjrQeRab3DVrmSvWmeKhCtCR921gXWPD48zLpjuHLhanyiK4S/lG1Dm3mA39YF07B5ImKUrSQFPLEqHIc83V8K3KBcpY9aFeFZUUcg9/XnsE3DfB1XWaA2WLZkShrHT/n4/b6FpIlzCoKq3xxO1lPOVX/cQn1Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736414241; c=relaxed/simple;
	bh=x5HqoNWdDNDkFZaQt4tpMfk4E8QCWW84ocAwMG8Zjmg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=SRBUPWkLiroMZXGJDGK/R7lXTK7/CLHGelI/f8BTR2QrspYM4Nt8y9XuqwNA46mExTCyJL0clSyRb6oROA+L0ko/18lZsKhlhF1CzBDeFFNTTtNV9REOQMlgGyAVh7kwnSCW03E3vGXPtLpH4zKhnFHWrVcGAjoDmsx0xf1gqdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JAmcH6ik; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC9DFC4CED2;
	Thu,  9 Jan 2025 09:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736414241;
	bh=x5HqoNWdDNDkFZaQt4tpMfk4E8QCWW84ocAwMG8Zjmg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JAmcH6ikyrlynJsSh/LN5Yc4KljcrBnupcKXbL1ZzQ/vZ60bdnrUFNk7k/y1NbQVL
	 McfPq5IipiQtAKeOPBPrYIOxpbXG57KyOY/yJkSeRXQudEGLdJooR4hDOo8YieYVXi
	 2bUFfdu56WCMgwmU5cYLO/A3CDjNUqw7c3grO3nZya67vWqtWX3blnfRErBAPHpzMe
	 mVpGgTPFq3DJzSsfsYdk1T/jOejVwWTxXbelkuQTkWtVg26ojbehj9V7NbUfvJbyBl
	 J88Rd/JSV5pgEEMaRBdjhJ1ZG14xywVM5H1xBBjFl2gvKbCkB8AXgjEBdkQVJllvOs
	 2R0VQUtZEq7zA==
Date: Thu, 9 Jan 2025 10:17:18 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Ping Cheng <pinglinux@gmail.com>
cc: Even Xu <even.xu@intel.com>, 
    Benjamin Tissoires <benjamin.tissoires@gmail.com>, 
    "Cheng, Ping" <ping.cheng@wacom.com>, 
    Jason Gerecke <jason.gerecke@wacom.com>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    linux-input <linux-input@vger.kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Hid: Wacom: Add PCI Wacom device support
In-Reply-To: <CAF8JNhK1GXxZpjQa4hK7rrgsyZQ64X2OYBkOQR9cpx4tfvgg2Q@mail.gmail.com>
Message-ID: <87q15835-80q3-7s50-s380-p1p4043po539@xreary.bet>
References: <20241226013527.3048277-1-even.xu@intel.com> <CAF8JNhK1GXxZpjQa4hK7rrgsyZQ64X2OYBkOQR9cpx4tfvgg2Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 25 Dec 2024, Ping Cheng wrote:

> Hi Jiri, hi Benjamin,
> 
> This patch enables wacom driver to pickup Wacom input devices under Intel
> Framework. The patch has been tested by tatsunosuke.tobita@wacom.com with
> patchset [*PATCH v3 00/22] Add Intel Touch Host Controller drivers* (
> https://lore.kernel.org/linux-input/20241216014127.3722172-1-even.xu@intel.com/T/#t)
> applied.
> 
> Reviewed-by: Ping Cheng <ping.cheng@wacom.com>
> Tested-by: Tatsunosuke Tobita <atsunosuke.tobita@wacom.com
> <tatsunosuke.tobita@wacom.com>>
> 
> Thank you for your support,

Thanks. I've created hid.git#for-6.14/wacom-pci which is based on 
hid.git#for-6.14/intel-thc and applied this one on top.

-- 
Jiri Kosina
SUSE Labs


