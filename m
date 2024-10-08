Return-Path: <linux-input+bounces-7158-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 817D9995370
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2024 17:33:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32A7D1F210DF
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2024 15:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F5D71DF27C;
	Tue,  8 Oct 2024 15:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FDPxO4xK"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E4F84E18;
	Tue,  8 Oct 2024 15:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728401586; cv=none; b=UuWyU+QYW9H8tTrjlJaJ7ZUiz99xUCJOFijNmu/CP97KZzxouFk4qKukNQc3ePSI78IUnnvKbK/CKi463UTAnnbolP+CXWxi8/FpEu5Gwkz5aB1Y+ChePToBjpwwjVHlvPk8Roj12i3AWeof44IzLQGgNZ9ovDGnJ+hjkRam+kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728401586; c=relaxed/simple;
	bh=ouKxO2/IjmSZBjM+1Fc7/vlcAqQ4Vq4MlFM+ug7u5Ls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YAVgI/wm+C43h29NGuMjGPRvS3/Cds21x3uPi0jJ7ycDRTpbIpsd22eegEzcNqfGPqVtsv74vpqrLUe+RHa5Rosa0n0MrAdsfv+5AeqH1Uc0jfQTrc6JqJBhnmG3nMMu5m5aVuQ1Ile1VhkN6NNLQgPX0VQsnnzehLUkM7yzr5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FDPxO4xK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46229C4CEC7;
	Tue,  8 Oct 2024 15:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728401586;
	bh=ouKxO2/IjmSZBjM+1Fc7/vlcAqQ4Vq4MlFM+ug7u5Ls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FDPxO4xKf5YTLi8ThQ5IZbwJ0MIuwcFrt1RTRpClUWqh3vmZaEuRd7txTc4759o9Y
	 w1aIsLD0U6dwsSG3ZtFIw0+BfkdWsnhsN8keW436leHeHRL2UAWOdN1IsxMSzbYHJk
	 /QE9RukogSs8D39YaxIrEssFYKJBmOQCcDXGRuPQn+S5p8ApWd3HlOuczSnjJ9hPBi
	 pGxKZsOKoMtvhyBzg5D/tivcnnuBtMTqTUvlOjR9d8Vwvqzbo540Qvjvf+YoxdDAQk
	 rZ+qz4acRRW8zGVEXbSwdsCyh7thp9luSLkkVwDcEW/GMu2SYIVNvuLE+c0V3bJFiR
	 DnieADb2SODyQ==
Date: Tue, 8 Oct 2024 16:33:00 +0100
From: Lee Jones <lee@kernel.org>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: bentiss@kernel.org, dri-devel@lists.freedesktop.org,
	hdegoede@redhat.com, jelle@vdwaa.nl, jikos@kernel.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, miguel.ojeda.sandonis@gmail.com,
	ojeda@kernel.org, onitake@gmail.com, pavel@ucw.cz, cs@tuxedo.de
Subject: Re: [PATCH v2 1/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO
Message-ID: <20241008153300.GA11264@google.com>
References: <20240927124152.139099-1-wse@tuxedocomputers.com>
 <20241002125243.GC7504@google.com>
 <4bfc188c-0873-490f-bfef-119c7fa74be5@tuxedocomputers.com>
 <20241003075927.GI7504@google.com>
 <8874c084-20b2-44d8-9a0d-67aedad4b456@tuxedocomputers.com>
 <20241007125813.GA17897@google.com>
 <86936252-f3b6-46c2-9244-ce0cfebf3c42@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86936252-f3b6-46c2-9244-ce0cfebf3c42@tuxedocomputers.com>

On Mon, 07 Oct 2024, Werner Sembach wrote:

> 
> Am 07.10.24 um 14:58 schrieb Lee Jones:
> > On Fri, 04 Oct 2024, Werner Sembach wrote:
> > 
> > > Am 03.10.24 um 09:59 schrieb Lee Jones:
> > > > On Wed, 02 Oct 2024, Werner Sembach wrote:
> > > > 
> > > > > Hi,
> > > > > 
> > > > > Am 02.10.24 um 14:52 schrieb Lee Jones:
> > > > > > On Fri, 27 Sep 2024, Werner Sembach wrote:
> > > > > > 
> > > > > > > Hi,
> > > > > > > first revision integrating Armins feedback.
> > > > > > > 
> > > > > > > Stuff I did not yet change and did not comment on previously:
> > > > > > > - Still have to ask Christoffer why the mutex is required
> > > > > > > - Still using acpi_size instad of size_t in the util functions, because the value is put directly into a struct using acpi_size
> > > > > > > - Error messages for __wmi_method_acpi_object_out still in that method because they reference method internal variables
> > > > > > > 
> > > > > > > Let me know if my reasoning is flawed
> > > > > > Use `git format-patch`'s --annotate and --compose next time please.
> > > > > > 
> > > > > I did but --compose does not automatically insert the subject line, that's
> > > > > why i copied it but forgot to change it to 0/1
> > > > > 
> > > > > Sorry for the flawed subject line
> > > > And the missing diff-stat?
> > > > 
> > > Also not automatically created by git send-email --compose. is there a flag
> > > I'm not aware of?
> > As above.  I use "--annotate --compose".  See if that works.
> > 
> nope, the cover letter has no change summary with these options

Oh, my mistake.  I'm getting confused with `git send-email`.

You want this:

  `mkdir patches && git format-patch --cover-letter -M -o patches`

-- 
Lee Jones [李琼斯]

