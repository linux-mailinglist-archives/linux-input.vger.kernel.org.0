Return-Path: <linux-input+bounces-5907-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4704A9613EB
	for <lists+linux-input@lfdr.de>; Tue, 27 Aug 2024 18:24:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0461F2841B7
	for <lists+linux-input@lfdr.de>; Tue, 27 Aug 2024 16:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99C621C7B6F;
	Tue, 27 Aug 2024 16:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mm6f/0dc"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701891C0DF9;
	Tue, 27 Aug 2024 16:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724775885; cv=none; b=iTTXLT/BS3+aDJPb7+0QNP0h8W6u8T+t/DgSTkaxavpxA2C/OE95aSVIF9Sx/knbXsTNgk7qRerXAm7bSz/7pOpEtsCopd1iI+Zx+e7MRtJqS881niSq/vMj00AhaksxqLhpmqlotUKymX9FJFZ3SIyZpXVaZ4SMm692O/9unY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724775885; c=relaxed/simple;
	bh=mtZ24BAXL4Txfe6Dktobsf+UlF14Fzactbn1u3bjpi8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sGpOTfCEikXx4tgLLEg/iZutDkw9APICe3wWT2fdyuNYcC3pYd7cDZHNlSKoUZzS9j1IOku0Nb4PKZNr9K+Dmp6CxUpnzucy7KqH/ML+FO27jctVjjs+5AEqpYR2oUPFXO/h8kZXgM0BzhRtgSk1hTY2zrZBszXmkF6j4TdCPy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mm6f/0dc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9711CC84039;
	Tue, 27 Aug 2024 16:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724775884;
	bh=mtZ24BAXL4Txfe6Dktobsf+UlF14Fzactbn1u3bjpi8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mm6f/0dcqpl+v8V4qMZi2bp/cCrxptHVZ8AtTaE/gnudtE9e0PL3xV3klsDTxn35Q
	 Jroj+Hu2FFbFxCYgiA744ZipUv4izFIPCM6ghsRpfOI3/PEgSBskBHggVoZV0PQVtW
	 CvWjpPd06cC4X8TTRtdwRl3JF6/QXZezbainvW/m7jarMmOQGopYQp0oKCc/zMnWL0
	 OT2KvquGRBqOtOsITIMwrFXu6aWY07/l7NSSHm04MNzAlHf8rRBJ5rVZVUv72SlrOv
	 vHKmeYdIvyyYkI8LPUZKr2k6A8z5oljOWrO/IMHchheQvq/+5AahLZ0v3SZWvvGh/M
	 CjcZNGlFbxSsg==
Date: Tue, 27 Aug 2024 18:24:40 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/7] HID: constify report descriptors
Message-ID: <tll3slib5gnf63rjzfo4pvbsg2cqqt7x73iugbtg6w6s2ata4u@2kwtsirqamtm>
References: <20240803-hid-const-fixup-v2-0-f53d7a7b29d8@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240803-hid-const-fixup-v2-0-f53d7a7b29d8@weissschuh.net>

On Aug 03 2024, Thomas Weiﬂschuh wrote:
> report descriptors are not meant to be constified outside of the HID
> core. Enforce this invariant through the type system.
> 
> In addition it also allows the constification of static report
> descriptors used by the report_fixup() callbacks.
> This makes it clear to driver authors that the HID core will not modify
> those reports and they can be reused for multiple devices.
> Furthermore security is slightly improved as those reports are protected
> against accidental or malicious modifications.
> 
> Patches "HID: constify hid_device::dev_rdesc" and
> "HID: constify hid_device::rdesc" are very similar but the patch 
> "HID: constify params and return value of fetch_item()" needs to be in
> between.
> It would however be possible to squash them together.
> 
> Only the cmedia driver has their static report descriptor constified as
> a proof of concept as I'm the maintainer for that one, I didn't want to
> spam all driver maintainers at this point.
> I have patches for all other drivers that I'll submit after this series
> is merged.
> 
> Note, this is only compile-tested.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Thanks. Sorry for the delay, I'm only coming back of three weeks of vacations.

I've now applied the series to for-6.12/constify-rdesc on hid.git after
amending the series for latest master (small conflict in hid-cougar.c
and hid-multitouch.c needed a new hunk).

Cheers,
Benjamin

> ---
> Changes in v2:
> - Drop RFC state
> - Constify more of the internals of HID
> - Drop now unnecessary patch introducing the variable "fixed_up"
> - Link to v1: https://lore.kernel.org/r/20240730-hid-const-fixup-v1-0-f667f9a653ba@weissschuh.net
> 
> ---
> Thomas Weiﬂschuh (7):
>       HID: bpf: constify parameter rdesc of call_hid_bpf_rdesc_fixup()
>       HID: constify parameter rdesc of hid_parse_report()
>       HID: constify hid_device::rdesc
>       HID: constify params and return value of fetch_item()
>       HID: constify hid_device::dev_rdesc
>       HID: change return type of report_fixup() to const
>       HID: cmedia: constify fixed up report descriptor
> 
>  drivers/hid/bpf/hid_bpf_dispatch.c |  6 ++----
>  drivers/hid/hid-apple.c            |  2 +-
>  drivers/hid/hid-asus.c             |  2 +-
>  drivers/hid/hid-aureal.c           |  2 +-
>  drivers/hid/hid-bigbenff.c         |  2 +-
>  drivers/hid/hid-cherry.c           |  2 +-
>  drivers/hid/hid-chicony.c          |  4 ++--
>  drivers/hid/hid-cmedia.c           |  6 +++---
>  drivers/hid/hid-core.c             | 14 +++++++-------
>  drivers/hid/hid-corsair.c          |  4 ++--
>  drivers/hid/hid-cougar.c           |  4 ++--
>  drivers/hid/hid-cypress.c          |  2 +-
>  drivers/hid/hid-dr.c               |  4 ++--
>  drivers/hid/hid-elecom.c           |  2 +-
>  drivers/hid/hid-gembird.c          |  2 +-
>  drivers/hid/hid-glorious.c         |  2 +-
>  drivers/hid/hid-holtek-kbd.c       |  2 +-
>  drivers/hid/hid-holtek-mouse.c     |  4 ++--
>  drivers/hid/hid-ite.c              |  2 +-
>  drivers/hid/hid-keytouch.c         |  2 +-
>  drivers/hid/hid-kye.c              |  2 +-
>  drivers/hid/hid-lenovo.c           |  2 +-
>  drivers/hid/hid-lg.c               |  2 +-
>  drivers/hid/hid-logitech-hidpp.c   |  4 ++--
>  drivers/hid/hid-macally.c          |  4 ++--
>  drivers/hid/hid-magicmouse.c       |  4 ++--
>  drivers/hid/hid-maltron.c          |  4 ++--
>  drivers/hid/hid-microsoft.c        |  2 +-
>  drivers/hid/hid-monterey.c         |  2 +-
>  drivers/hid/hid-nti.c              |  2 +-
>  drivers/hid/hid-ortek.c            |  2 +-
>  drivers/hid/hid-petalynx.c         |  2 +-
>  drivers/hid/hid-prodikeys.c        |  2 +-
>  drivers/hid/hid-pxrc.c             |  4 ++--
>  drivers/hid/hid-redragon.c         |  2 +-
>  drivers/hid/hid-saitek.c           |  2 +-
>  drivers/hid/hid-samsung.c          |  2 +-
>  drivers/hid/hid-semitek.c          |  4 ++--
>  drivers/hid/hid-sensor-hub.c       |  2 +-
>  drivers/hid/hid-sigmamicro.c       |  4 ++--
>  drivers/hid/hid-sony.c             |  2 +-
>  drivers/hid/hid-steelseries.c      |  4 ++--
>  drivers/hid/hid-sunplus.c          |  2 +-
>  drivers/hid/hid-topre.c            |  4 ++--
>  drivers/hid/hid-uclogic-core.c     |  2 +-
>  drivers/hid/hid-viewsonic.c        |  4 ++--
>  drivers/hid/hid-vrc2.c             |  4 ++--
>  drivers/hid/hid-waltop.c           |  2 +-
>  drivers/hid/hid-winwing.c          |  2 +-
>  drivers/hid/hid-xiaomi.c           |  4 ++--
>  drivers/hid/hid-zydacron.c         |  2 +-
>  include/linux/hid.h                | 10 +++++-----
>  include/linux/hid_bpf.h            |  2 +-
>  53 files changed, 83 insertions(+), 85 deletions(-)
> ---
> base-commit: c0ecd6388360d930440cc5554026818895199923
> change-id: 20240730-hid-const-fixup-8b01cbda1b49
> 
> Best regards,
> -- 
> Thomas Weiﬂschuh <linux@weissschuh.net>
> 

