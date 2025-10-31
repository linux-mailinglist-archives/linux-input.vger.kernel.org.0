Return-Path: <linux-input+bounces-15827-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F6DC23C93
	for <lists+linux-input@lfdr.de>; Fri, 31 Oct 2025 09:27:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96AC9189B5F4
	for <lists+linux-input@lfdr.de>; Fri, 31 Oct 2025 08:27:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0D962F9D9A;
	Fri, 31 Oct 2025 08:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O1B4rxuu"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9102F6594;
	Fri, 31 Oct 2025 08:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761899219; cv=none; b=tIEgvFQShEo0QVpOwF3PAmV9a7TgtQAWdcU7jYoMRxx4jLl5seZnWsyow+XdIKh4JOL0Fzr3E/NrKt+VLIwWCixqi6QHl+7vO/5NaBcwpO57kF6pqwtkZN5XLQGRn+sog7fpq9m+QWPyuwfJQ8ItRpOp6nbioTcO6piH6fmhBPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761899219; c=relaxed/simple;
	bh=BecWedi4L8EHtB6kBN5qc40HWVT3Y0Xx/1LMaYJrUJ0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=G612UoXwBWvYWZ1F/TmTcahXKWBa5koENk4lCK9plh9OOUocnB8ypcx24tIA5udkZc6S52WL8Zm0jOFeSbsP8fYOXWVt+Awczt1gZR+viMt5RBcyEVIZ2img9fjKudhNI6QKR6lnq7Sg2vQoRNq3RURSXfo46Tox1z3419mdFjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O1B4rxuu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB83DC4CEE7;
	Fri, 31 Oct 2025 08:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761899219;
	bh=BecWedi4L8EHtB6kBN5qc40HWVT3Y0Xx/1LMaYJrUJ0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=O1B4rxuudVo33kOmChl54gnIRHNTNPAxVPuJdNyWgGMJhW6EPL+CMSkcKizIB86P/
	 atTUQetYvc8OodgQl9CkBA8Mbp+3wis/QzdEyb7qUm6wJX3jFy9NF/sEyEaVcSB6cM
	 QDhXUlsFbJWWDBPZmAev7Fg5cMv5wUb5uuSkoqrprGCSaqH1/fGHlmJSXXHdJT7bWV
	 32tnAlgHioj2Zb2QNkRjaq8N6Y30ROWUt8rORJBA3yer2vkWsy99flrKGiaZw00qnn
	 xUeKRvPruwYJVoNq95mQCUMTZp+Zxs8qk9aXD1W0qGXNPGrkcSrFJmvGz/XagOJlbe
	 VvFVD7ENENCHQ==
Date: Fri, 31 Oct 2025 09:26:56 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Antheas Kapenekakis <lkml@antheas.dev>
cc: kernel test robot <lkp@intel.com>, platform-driver-x86@vger.kernel.org, 
    linux-input@vger.kernel.org, oe-kbuild-all@lists.linux.dev, 
    linux-kernel@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>, 
    Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>, 
    =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
    Denis Benato <benato.denis96@gmail.com>
Subject: Re: [PATCH v7 5/9] platform/x86: asus-wmi: Add support for multiple
 kbd led handlers
In-Reply-To: <CAGwozwGDBj2e83JBW71G_z6hMD5PsOXTQLqFVdPKZ6sU54tsGw@mail.gmail.com>
Message-ID: <39n24387-0o0n-50p8-s2rn-9qoqs6sq8336@xreary.bet>
References: <20251018101759.4089-6-lkml@antheas.dev> <202510222013.EBLC609m-lkp@intel.com> <CAGwozwGDBj2e83JBW71G_z6hMD5PsOXTQLqFVdPKZ6sU54tsGw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 23 Oct 2025, Antheas Kapenekakis wrote:

> >   1589
> >   1590  static void kbd_led_update_all(struct work_struct *work)
> >   1591  {
> >   1592          enum led_brightness value;
> >   1593          struct asus_wmi *asus;
> >   1594          bool registered, notify;
> >   1595          int ret;
>                               /\ value should have been an int and
> placed here. It can take the value -1 hence the check

Thanks, that needs to be fixed before the final merge.

> Are there any other comments on the series?
> 
> The only issue I am aware of is that Denis identified a bug in asusd
> (asusctl userspace program daemon) in certain Asus G14/G16 laptops
> that cause laptop keys to become sticky, I have had users also report
> that bug in previous versions of the series. WIthout asusd running,
> keyboards work fine incl. with brightness control (did not work
> before). Given it will take two months for this to reach mainline, I
> think it is a fair amount of time to address the bug.

One thing that is not clear to me about this -- is this causing a visible 
user-space behavior regression before vs. after the patchset with asusctl?

If so, I am afraid this needs to be root-caused and fixed before the set 
can be considered for inclusion.

Thanks,

-- 
Jiri Kosina
SUSE Labs


