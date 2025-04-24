Return-Path: <linux-input+bounces-11983-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4CDA9AB65
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 13:07:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10D231940809
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 11:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0A3220A5E1;
	Thu, 24 Apr 2025 11:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GiNSZop+"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B507DA6D;
	Thu, 24 Apr 2025 11:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745492827; cv=none; b=bTzXmVS0y5XxoJJ+c1FT9F8DDPRrLdKbK6+MrQhrDuwnXBrQ6JfecJNGXs477bJZA0to7s8dtjxRxo5/woWX/+8gbb2l2rJ8En5tBc+FMWRC4xCNDWO7z0IJ5H+EWc3tCNsXd5vshCOu11mze1WswLYEe8JstldhYiM0sd3tahk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745492827; c=relaxed/simple;
	bh=Pbr2p5W20PdU5e46mEF/v3mwKfArHsjLRw1TSYR1/io=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=VIUqSAjCCR8xMrx9nOCASOn8V/oJt9Trk1rxeo8NX8kDphly4mOls5cjd4V2XE4rPo+auq6F+BP5LBxMtjJYd6ulq3B0BDnJo1yIzQxUgH7YxrvK86NUYNLRYUOK6L5WI5p1242VYX5xRpdE2X9utiQIABHhkXLzDfwzMAX1H9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GiNSZop+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 302F0C4CEE3;
	Thu, 24 Apr 2025 11:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745492827;
	bh=Pbr2p5W20PdU5e46mEF/v3mwKfArHsjLRw1TSYR1/io=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GiNSZop+jcb6yNa97bE5pYzzQQUjf6moY1g3EJG0ThuJaaPAi94AjH07Cn2nxkbJT
	 sT05YDIXI2NPWSpcd+uGlxE2MsHTGDutdHFSHycdQIzc3wqw3Y66Tkg54DoHJyW6vD
	 jM2i3izIo6WPtn3Q661Df08BOUxWTKTL8TCC5ZyxNSEur9YXfXYExXEWijeRHPA2Z8
	 +9j4p0OuPAD0erMPV3A0DSxcT/8jkC9OyEZm5DQ5ey1jjIm5Jz/WEHh8M7sF2F4m6B
	 VBhdPfKrq7e+K/28VD/gSPt03rqvlX/PdUe/vt7b5TddhjNIHnRJ5fPJ4xKFNVbGvw
	 O5jT3D5L7ii6g==
Date: Thu, 24 Apr 2025 13:07:04 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Basavaraj Natikar <bnatikar@amd.com>
cc: Denis Benato <benato.denis96@gmail.com>, 
    Basavaraj Natikar <basavaraj.natikar@amd.com>, 
    Benjamin Tissoires <bentiss@kernel.org>, "Luke D. Jones" <luke@ljones.dev>, 
    Ivan Dovgal <iv.dovg@gmail.com>, Adrian Freund <adrian@freund.io>, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/1] HID: amd_sfh: Add support for tablet mode
In-Reply-To: <db1d95be-e92a-4328-b43e-8214a0b520be@amd.com>
Message-ID: <oq1r309s-85p5-36s2-160n-87o8o7q78s9p@xreary.bet>
References: <20250309194934.1759953-1-benato.denis96@gmail.com> <19norq05-rp74-9qrr-382r-40q9r59p1pnn@xreary.bet> <db1d95be-e92a-4328-b43e-8214a0b520be@amd.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 24 Apr 2025, Basavaraj Natikar wrote:

> >> Recently there has been a renewed interest in this patch: ASUS has launched
> >> a new z13 model
> >> and many more users requested tablet mode support for previous models.
> >>
> >> I have made required adjustments to apply cleanly on top of linux-next:
> >> nothing substantial, a macro has been changed from 5 to 6 upstream as
> >> the previous patch also did and a few line changed their position.
> >>
> >> Given there were no functional changes at all I took
> >> the liberty to retain previous tags.
> >>
> >> Denis Benato (1):
> >>    HID: amd_sfh: Add support for tablet mode switch sensors
> >>
> >>   drivers/hid/amd-sfh-hid/amd_sfh_client.c      |  2 ++
> >>   drivers/hid/amd-sfh-hid/amd_sfh_pcie.c        |  4 +++
> >>   drivers/hid/amd-sfh-hid/amd_sfh_pcie.h        |  1 +
> >>   .../hid_descriptor/amd_sfh_hid_desc.c         | 27 +++++++++++++++++++
> >>   .../hid_descriptor/amd_sfh_hid_desc.h         |  8 ++++++
> >>   .../hid_descriptor/amd_sfh_hid_report_desc.h  | 20 ++++++++++++++
> >>   6 files changed, 62 insertions(+)
> > Basavaraj, could you please provide your Acked-by/Reviewed-by: for this
> > (or any other sort of feedback)?
> 
> Sure, Jiri, I will get back to this patch soon.
> 
> We are reviewing similar features and related issues,
> and we may need some more time to investigate them internally.
> 
> Therefore, I would like to hold off on this patch for a little longer
> before providing feedback.

Fair enough, thanks for the update.

-- 
Jiri Kosina
SUSE Labs


