Return-Path: <linux-input+bounces-157-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A017F27F8
	for <lists+linux-input@lfdr.de>; Tue, 21 Nov 2023 09:50:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 042D8B212A5
	for <lists+linux-input@lfdr.de>; Tue, 21 Nov 2023 08:50:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87CB31EA8A;
	Tue, 21 Nov 2023 08:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oBdY9tyZ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697F53FF4
	for <linux-input@vger.kernel.org>; Tue, 21 Nov 2023 08:50:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1887FC433C9;
	Tue, 21 Nov 2023 08:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700556627;
	bh=3SV8CweTVwS9r+UfbnRk+xs2oCzi1rbm/4znQGPZKjs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oBdY9tyZRF9Rlj4ccJtsqjSqoIa6fKEGVdR1FySPfwlM7UE3pKA1K3J3Rux+F5Wdy
	 iiYmZ2DDdA1ueX1riaMyhdTf7z3lg+P68lehRYXLuZg0XoeccCJW5k7MqBNvy91mK5
	 MoRnrqle2xoCHcp0M7Is6ZIzvQoVm09EV4TWRI/WHVXnkC6NQTZ1W0kA217JEjzKTY
	 aAPxEiFGqizxr1Ug5umwtUiZouMvcDDhFjamRFRwUTN5TgPxLC9jUGLHBUriRG/vw/
	 WNuyC/rklNa2A7f9q32eFtWMFzeYE5sZ0iw4zQhV3nuB70K6r0Cch/CMUT3xzdRpHL
	 RM42MBjEQii2g==
Date: Tue, 21 Nov 2023 09:50:24 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Oliver Neukum <oneukum@suse.com>
cc: benjamin.tissoires@redhat.com, linux-input@vger.kernel.org
Subject: Re: [PATCH] usb: hid: add ALWAYS_POLL quirk for Apple kb
In-Reply-To: <20231114145430.3765-1-oneukum@suse.com>
Message-ID: <nycvar.YFH.7.76.2311210950160.29220@cbobk.fhfr.pm>
References: <20231114145430.3765-1-oneukum@suse.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 14 Nov 2023, Oliver Neukum wrote:

> These devices disconnect if suspended without
> remote wakeup. They can operate with the standard
> driver.
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>

Applied, thanks Oliver.

-- 
Jiri Kosina
SUSE Labs


