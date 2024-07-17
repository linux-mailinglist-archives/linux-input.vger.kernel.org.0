Return-Path: <linux-input+bounces-5068-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A0E9339A6
	for <lists+linux-input@lfdr.de>; Wed, 17 Jul 2024 11:10:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D04221C20C94
	for <lists+linux-input@lfdr.de>; Wed, 17 Jul 2024 09:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E94DD19A;
	Wed, 17 Jul 2024 09:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Djw4sx4e"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D8B210EC
	for <linux-input@vger.kernel.org>; Wed, 17 Jul 2024 09:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721207409; cv=none; b=LA76PjhAixBTRz90+gbtoy+dPhvTBF28a5rpU6dhp9gXcfWcgMervXAR8JAz5IXTPOfhflNKrivMiIRhXbwJKj1o+VF76y6oCQCKavWriSnMO/7rQlLzd3ErB1kgbhyv7p/2OyxNyhQAFXyeITX80VgSqUi3N47OtHnpcBTRrwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721207409; c=relaxed/simple;
	bh=oooS8lyw+gO9sln24933a4izWlF7zwX9+YRGbQOpCzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F6lcW6yFJJCreRFiaqjSKdDoxC95aphqEiRq/1Qj9IIEadJqLePrU005JmJK+e1rrD/1H/MbLpQTE6us8rcvIQCKeOzRgAEsF+8aNNBO1ADGbxcZXP+e+xCFAGI8iAGdRBm7WbcFCCJzEXurdNfB1csdbX5FbTeH9N6lRyItu5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Djw4sx4e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1335DC32782;
	Wed, 17 Jul 2024 09:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721207409;
	bh=oooS8lyw+gO9sln24933a4izWlF7zwX9+YRGbQOpCzM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Djw4sx4eVDv2hRHmPJnnEiWX8tMKaSRppxy1LQHuloa2vxPTjaJpLD0kMnPbnel20
	 jtxPOZ+gldWsb924pvqrddxznPXS1utGah1q6iBinTj4Nykqtfl3TWQltZMntzFXpO
	 jCOON8n2lb7QsmKe2eF1jUakzdrmUSCVcqSfKuCwwEFdSJKSdvavs90mPqLAFb9u53
	 lQccUqEPCxvLgNHQs0C9iRbrFb9L0ZEK9dBQZrWGGGXHH/cvTj7q/T3O+eemSVYAkU
	 /BGljZ13s28CSrtA6jzznZ4kQ+w/klCDqPP0OHDA2K25J0di8u7I9CsTP97aUaUtjq
	 5Zsrly1cX8a9g==
Date: Wed, 17 Jul 2024 11:10:04 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Ping Cheng <pinglinux@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-input@vger.kernel.org, 
	Jason Gerecke <killertofu@gmail.com>, Erin Armstrong Skomra <skomra@gmail.com>, 
	Joshua Dickens <Joshua@joshua-dickens.com>, Tatsunosuke Tobita <tatsunosuke.tobita@wacom.com>, 
	Tatsunosuke Tobita <tatsunosuke.wacom@gmail.com>, stable@kernel.org, Gavin Hsia <gavin.h.hsia@gmail.com>
Subject: Re: [PATCH 1/2] HID:wacom: Modify pen IDs
Message-ID: <bqjdnebv2bcvpz2jesz5fqltvqr4sm2jqcd7l5npmzaje6dqgw@6xqioxfbtcwp>
References: <20240709055729.17158-1-tatsunosuke.wacom@gmail.com>
 <CAF8JNhLxPG8H7uvySTqWLkp3fsB+HandJ_JHMtpr_H5XMDy7pw@mail.gmail.com>
 <gc5p2dsulalrkxcwot2i5h7qxctmjn3iihmduy76xuhbevoz32@ykktnkmz6dqk>
 <CAF8JNhLgEBVUdrn4HdQQ83VcoF09K4p+KehLcuGbnv=F0T+pRA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF8JNhLgEBVUdrn4HdQQ83VcoF09K4p+KehLcuGbnv=F0T+pRA@mail.gmail.com>

On Jul 16 2024, Ping Cheng wrote:
> Hi Benjamin,
> 
> The patchset has been reviewed by the team. Here comes:
> 
> Reviewed-by: Ping Cheng <ping.cheng@wacom.com>

Thanks. Unfortunately I sent the 6.11 PR to Linus yesterday and I need
his feedback first before staging any new patches.
Once this PR is merged I should be able to take the series in
*-upstream-fixes so it gets into this cycle hopefully.

Cheers,
Benjamin

> 
> Thank you for taking care of the patches,
> Ping
> 
> On Tue, Jul 16, 2024 at 4:39 AM Benjamin Tissoires <bentiss@kernel.org> wrote:
> >
> > Hi Ping,
> >
> > On Jul 15 2024, Ping Cheng wrote:
> > > Hi Jiri, hi Benjamin,
> > >
> > > Can one of you give the patchset a review and merge them? The first
> > > one is a bug fix. The second one is just a cleanup. Both changes are
> > > device specific.
> >
> > Let me return the question :) Can any of you Wacom guys give us a
> > reviewed-by? :)
> >
> > The patches looks fine, but having someone with the impacted devices
> > being able to test/review has a greater value than the maintainers just
> > randomly pulling patches :)
> >
> > Cheers,
> > Benjamin
> >
> > >
> > > Thank you,
> > > Ping
> > >
> > > On Mon, Jul 8, 2024 at 10:57 PM Tatsunosuke Tobita
> > > <tatsunosuke.wacom@gmail.com> wrote:
> > > >
> > > > From: Tatsunosuke Tobita <tatsunosuke.tobita@wacom.com>
> > > >
> > > > The pen ID, 0x80842, was not the correct ID for wacom driver to
> > > > treat. The ID was corrected to 0x8842.
> > > > Also, 0x4200 was not the expected ID used on any Wacom device.
> > > > Therefore, 0x4200 was removed.
> > > >
> > > > Signed-off-by: Tatsunosuke Tobita <tatsunosuke.tobita@wacom.com>
> > > > Signed-off-by: Tatsunosuke Tobita <tatsunosuke.wacom@gmail.com>
> > > > Fixes: bfdc750c4cb2 ("HID: wacom: add three styli to wacom_intuos_get_tool_type")
> > > > Cc: stable@kernel.org #6.2
> > > > ---
> > > >  drivers/hid/wacom_wac.c | 3 +--
> > > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
> > > > index a44367aef621..20de97ce0f5e 100644
> > > > --- a/drivers/hid/wacom_wac.c
> > > > +++ b/drivers/hid/wacom_wac.c
> > > > @@ -714,13 +714,12 @@ static int wacom_intuos_get_tool_type(int tool_id)
> > > >         case 0x8e2: /* IntuosHT2 pen */
> > > >         case 0x022:
> > > >         case 0x200: /* Pro Pen 3 */
> > > > -       case 0x04200: /* Pro Pen 3 */
> > > >         case 0x10842: /* MobileStudio Pro Pro Pen slim */
> > > >         case 0x14802: /* Intuos4/5 13HD/24HD Classic Pen */
> > > >         case 0x16802: /* Cintiq 13HD Pro Pen */
> > > >         case 0x18802: /* DTH2242 Pen */
> > > >         case 0x10802: /* Intuos4/5 13HD/24HD General Pen */
> > > > -       case 0x80842: /* Intuos Pro and Cintiq Pro 3D Pen */
> > > > +       case 0x8842: /* Intuos Pro and Cintiq Pro 3D Pen */
> > > >                 tool_type = BTN_TOOL_PEN;
> > > >                 break;
> > > >
> > > > --
> > > > 2.34.1
> > > >

