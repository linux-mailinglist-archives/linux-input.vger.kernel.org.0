Return-Path: <linux-input+bounces-5056-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E95B9325D8
	for <lists+linux-input@lfdr.de>; Tue, 16 Jul 2024 13:39:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F79F1C21D04
	for <lists+linux-input@lfdr.de>; Tue, 16 Jul 2024 11:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 542DC55897;
	Tue, 16 Jul 2024 11:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M+UF57nL"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F99D15491
	for <linux-input@vger.kernel.org>; Tue, 16 Jul 2024 11:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721129965; cv=none; b=dgpF16tkyoIDb5vPLHckPFZh4WhmwUdTBMHtchQTjnnLWZkcQNp4oqhhWZ/J6+BnaCMqhqdD0K4gIINsre4e5TtwVfpw3L/iDVRha25tfFLbHmJkE4rVNC/r/tZ7qTyXyjTaA39ZmLED7yYSmBIEicm/+q/Ad1Iou+/moBkk7w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721129965; c=relaxed/simple;
	bh=csR1wOeXYE+0ObxIm4+wHcgsWnFm12pvAwxfgUrxBfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uj2Nig6No6TuvmFksWG7lC80st7+utBlgUQIZMN6vMMG3PGCPSPd3NpqRxI0YoBpW4L8yCM6ZfaLIffd3VrtL1ue9EuZMk+ztdp/GYqVjdmgJ6cwULY5EgQuT77I82s8R0LY9qu2rpvTpXczRS+F74FPU8UivshgKd5fYsUS7kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M+UF57nL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 603E1C116B1;
	Tue, 16 Jul 2024 11:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721129963;
	bh=csR1wOeXYE+0ObxIm4+wHcgsWnFm12pvAwxfgUrxBfs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M+UF57nLL5eyulwzoA5SNTwNNg4+wJOlFFFTxIsAGiCvSszd+o86zl5bkLZwz0Pi7
	 SxM4D4RhF21Fl2tR8EVR5zU37k+bVMUoeapVLsO9REJZ2c4P4NSn1C4q619ouhS9p9
	 mXkY+OXmBsp1btYjQ6lyCSb0joo3qbKeAV7YV1xoQhqrdV7PgxoaVB+tFK88o4Aw5O
	 ZReKpkyP8IZz4qrrLRYhKUrEzjWHa8NLMsuawPaYHWe02pVrPclwpeoU7GlD0LVW+R
	 A/MvIKif4gnkriSbuO/SnLRt/CQFJYBs1vqIo9m1a0x2zHHN/yZ3NiI2WcTzQ2hWp6
	 6k3rm8miiGpXA==
Date: Tue, 16 Jul 2024 13:39:18 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Ping Cheng <pinglinux@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-input@vger.kernel.org, 
	Jason Gerecke <killertofu@gmail.com>, Erin Armstrong Skomra <skomra@gmail.com>, 
	Joshua Dickens <Joshua@joshua-dickens.com>, Tatsunosuke Tobita <tatsunosuke.tobita@wacom.com>, 
	Tatsunosuke Tobita <tatsunosuke.wacom@gmail.com>, stable@kernel.org, Gavin Hsia <gavin.h.hsia@gmail.com>
Subject: Re: [PATCH 1/2] HID:wacom: Modify pen IDs
Message-ID: <gc5p2dsulalrkxcwot2i5h7qxctmjn3iihmduy76xuhbevoz32@ykktnkmz6dqk>
References: <20240709055729.17158-1-tatsunosuke.wacom@gmail.com>
 <CAF8JNhLxPG8H7uvySTqWLkp3fsB+HandJ_JHMtpr_H5XMDy7pw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF8JNhLxPG8H7uvySTqWLkp3fsB+HandJ_JHMtpr_H5XMDy7pw@mail.gmail.com>

Hi Ping,

On Jul 15 2024, Ping Cheng wrote:
> Hi Jiri, hi Benjamin,
> 
> Can one of you give the patchset a review and merge them? The first
> one is a bug fix. The second one is just a cleanup. Both changes are
> device specific.

Let me return the question :) Can any of you Wacom guys give us a
reviewed-by? :)

The patches looks fine, but having someone with the impacted devices
being able to test/review has a greater value than the maintainers just
randomly pulling patches :)

Cheers,
Benjamin

> 
> Thank you,
> Ping
> 
> On Mon, Jul 8, 2024 at 10:57 PM Tatsunosuke Tobita
> <tatsunosuke.wacom@gmail.com> wrote:
> >
> > From: Tatsunosuke Tobita <tatsunosuke.tobita@wacom.com>
> >
> > The pen ID, 0x80842, was not the correct ID for wacom driver to
> > treat. The ID was corrected to 0x8842.
> > Also, 0x4200 was not the expected ID used on any Wacom device.
> > Therefore, 0x4200 was removed.
> >
> > Signed-off-by: Tatsunosuke Tobita <tatsunosuke.tobita@wacom.com>
> > Signed-off-by: Tatsunosuke Tobita <tatsunosuke.wacom@gmail.com>
> > Fixes: bfdc750c4cb2 ("HID: wacom: add three styli to wacom_intuos_get_tool_type")
> > Cc: stable@kernel.org #6.2
> > ---
> >  drivers/hid/wacom_wac.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
> > index a44367aef621..20de97ce0f5e 100644
> > --- a/drivers/hid/wacom_wac.c
> > +++ b/drivers/hid/wacom_wac.c
> > @@ -714,13 +714,12 @@ static int wacom_intuos_get_tool_type(int tool_id)
> >         case 0x8e2: /* IntuosHT2 pen */
> >         case 0x022:
> >         case 0x200: /* Pro Pen 3 */
> > -       case 0x04200: /* Pro Pen 3 */
> >         case 0x10842: /* MobileStudio Pro Pro Pen slim */
> >         case 0x14802: /* Intuos4/5 13HD/24HD Classic Pen */
> >         case 0x16802: /* Cintiq 13HD Pro Pen */
> >         case 0x18802: /* DTH2242 Pen */
> >         case 0x10802: /* Intuos4/5 13HD/24HD General Pen */
> > -       case 0x80842: /* Intuos Pro and Cintiq Pro 3D Pen */
> > +       case 0x8842: /* Intuos Pro and Cintiq Pro 3D Pen */
> >                 tool_type = BTN_TOOL_PEN;
> >                 break;
> >
> > --
> > 2.34.1
> >

