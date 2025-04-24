Return-Path: <linux-input+bounces-11953-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 267D2A9A78E
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 11:20:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4A9D3AA2C0
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 09:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17E651F150F;
	Thu, 24 Apr 2025 09:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mkh2rTUq"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1925D528;
	Thu, 24 Apr 2025 09:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745486426; cv=none; b=unSBOOzWh/irtp/S17PtQujf6yBHa6C67HUPvdxePeYiclmYxcTxVoHoDuDhm4MW02nm2I/rf3cpR+zU3m5NBqkFJT3KfaKJqAt5n2QDlPccE8QebYE7pGhZd4EUajtxtXFmgiPV+017TiyX6pJMpyyB/0obHdEXOKMMJarL+pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745486426; c=relaxed/simple;
	bh=J+s2IDD97hzCAXuo10wy9fNsBAoFpA6MdfthgasVkrM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=KZVpLce9n6BhIUgO9ixfsn1DhfwExnUUtrrwzWlhXn+ZqIZDDjzmFjSEXqrMBkHpgQs/HJYZOw7aT/f8dOdPUaT87OWmP4IbfnFHP0IP0TDToplYF72mKPGXqAoXfcFfPRB6RZ3LTIvi0FVg6Z1mjvzq3SGPFdJPewsCEiM1jIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mkh2rTUq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4B46C4CEE3;
	Thu, 24 Apr 2025 09:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745486425;
	bh=J+s2IDD97hzCAXuo10wy9fNsBAoFpA6MdfthgasVkrM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Mkh2rTUqx5+5DEVfdDlxz4LmNS+te3IrDaAudUo9R8VMmQJQgT0G20pvAyuQAEdPw
	 2+2b1bflmUwxxPHDetb3iCVkLqyixWXNars/t6powJiMDBOUZI3iHLEeO3MUVd7zXO
	 U2cAeNMr3QKZhqTRUybLKIJ86bBridbWNcfmfDzHJFXJIICUyZhr/FU/3hbwBR+Y1q
	 nFxH+Ka3sNEjEXH+7y2QZhBY7kVd+YN0qh2dz2HsefBAAfxyCZakwvfreQCLgSOF4O
	 P08Ebo1H7cMM9e4IZ/10oONzH0RQqtExWQtL4P2YsqAr9FzAcdPJFBUptCfjAhmmcp
	 mthOenrGSzdvA==
Date: Thu, 24 Apr 2025 11:20:22 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Werner Sembach <wse@tuxedocomputers.com>
cc: Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] Disable touchpad on firmware level while not in
 use
In-Reply-To: <df09a3f9-6131-435a-ad68-4cea71237e42@tuxedocomputers.com>
Message-ID: <9q411092-1170-qr2r-27or-96594p19qrqo@xreary.bet>
References: <20250211133950.422232-1-wse@tuxedocomputers.com> <20250211133950.422232-2-wse@tuxedocomputers.com> <df09a3f9-6131-435a-ad68-4cea71237e42@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 4 Mar 2025, Werner Sembach wrote:

> > Using the new on_hid_hw_open and on_hid_hw_close functions to disable the
> > touchpad on firmware level while not being in use.
> >
> > This safes some battery and triggers touchpad-disabled-leds hardwired to
> > the touchpads firmware, that exist for example on some TongFang barebones.
> >
> > For a lengthy discussion with all the details see
> > https://gitlab.freedesktop.org/libinput/libinput/-/issues/558
> 
> Any comments if this is a good idea or not?

Sorry for the delay.

To me this looks like generally a good idea; Benjamin, any comments on the 
hid-mt part?

BTW you'd need to adjust the Subject line of the patches to conform to the 
subsystem style (i.e. HID: core: ....)

Thanks,

-- 
Jiri Kosina
SUSE Labs


