Return-Path: <linux-input+bounces-12343-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AB719AB5A60
	for <lists+linux-input@lfdr.de>; Tue, 13 May 2025 18:42:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C9B61767F1
	for <lists+linux-input@lfdr.de>; Tue, 13 May 2025 16:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1B152BFC72;
	Tue, 13 May 2025 16:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pGxiI6Qk"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A822BF3EA;
	Tue, 13 May 2025 16:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747154355; cv=none; b=dSz1nGrs+rc9mJpgQH2DfVlgJO5/crXZy1IYKqQu2Pg3O05T/9iO+ClZnuZP+NactQ6+CnGS2zXpyXAJW+GL1+1ZDQ8e/hHioA+XRa2knuTTShsIIMOiT/6PNScotc8qr12BHbcFH6h9VZLXvXFhM2EzhdL9x9NyeOW8YTEykYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747154355; c=relaxed/simple;
	bh=dxlqenimSNUo0laSheTrdDLOzROGW5tThbT22cuOvvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t7ae1YI99a0nLp3TuK2t4RtPab3Z8Wqa/J769YTSkTT0SNBrDMTPQiCNrSvwUpG28bRNcysyw+etdYaKaSLE/NDj0R2tTOM/H/7FQnBSav6+Dql5mDEH64Y0jSAw7AtzHQjxhQ/V1BNwtTefDKxDeiZ5JV/WYUDUltXeAqblLBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pGxiI6Qk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11CE8C4CEE4;
	Tue, 13 May 2025 16:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747154354;
	bh=dxlqenimSNUo0laSheTrdDLOzROGW5tThbT22cuOvvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pGxiI6QkrQBW4nzxb6vLUpKdfqDscqoY1mk1yXfBl6+pUfp+wInZISRSJdpu6MjtQ
	 XF6JGgxBAeH2juhUQ5mUFhnkUkkM0sZO+2e5mKWsNdv6aPG5a0ZQlOJ9Ws8Cye/kbN
	 t2p0jDWBkFNHex8ruFcg1r2E92DrsG9k8LGEjACuAhVGKiFqKTZsLg3zEbPCZjSZQr
	 YrHLVuN1N0mLD3GniBocix3cXT+SssC54xP9RsAFT4Ns300SK8OmfE86y8rfAqcU9n
	 ye70EaO6TDcrI+wYMYkdkJEja9neev6rZ6bxDJT9AW1x8vcHVNWA9mOyVALb3ROm0T
	 9FlxDQ/Yd3VkA==
Date: Tue, 13 May 2025 18:39:10 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Jiri Kosina <jikos@kernel.org>
Cc: Werner Sembach <wse@tuxedocomputers.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] Disable touchpad on firmware level while not in use
Message-ID: <4tjbyzn22sctrv7sdn7aetl7vse4epvqqctqgtx73kkh46njbv@lisa3ejipu62>
References: <20250211133950.422232-1-wse@tuxedocomputers.com>
 <20250211133950.422232-2-wse@tuxedocomputers.com>
 <df09a3f9-6131-435a-ad68-4cea71237e42@tuxedocomputers.com>
 <9q411092-1170-qr2r-27or-96594p19qrqo@xreary.bet>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9q411092-1170-qr2r-27or-96594p19qrqo@xreary.bet>

On Apr 24 2025, Jiri Kosina wrote:
> On Tue, 4 Mar 2025, Werner Sembach wrote:
> 
> > > Using the new on_hid_hw_open and on_hid_hw_close functions to disable the
> > > touchpad on firmware level while not being in use.
> > >
> > > This safes some battery and triggers touchpad-disabled-leds hardwired to
> > > the touchpads firmware, that exist for example on some TongFang barebones.
> > >
> > > For a lengthy discussion with all the details see
> > > https://gitlab.freedesktop.org/libinput/libinput/-/issues/558
> > 
> > Any comments if this is a good idea or not?
> 
> Sorry for the delay.
> 
> To me this looks like generally a good idea; Benjamin, any comments on the 
> hid-mt part?

Looks good to me, though my CI is now taking way more time because it's
not expecting to receive data from the device once the initial setup is
done.

> 
> BTW you'd need to adjust the Subject line of the patches to conform to the 
> subsystem style (i.e. HID: core: ....)

Amended locally and pushed (see the notification email).

Cheers,
Benjamin

> 
> Thanks,
> 
> -- 
> Jiri Kosina
> SUSE Labs
> 

