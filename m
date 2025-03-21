Return-Path: <linux-input+bounces-11056-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6B5A6C1BD
	for <lists+linux-input@lfdr.de>; Fri, 21 Mar 2025 18:41:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 39B2B485B4A
	for <lists+linux-input@lfdr.de>; Fri, 21 Mar 2025 17:39:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3D5E22DFFC;
	Fri, 21 Mar 2025 17:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="jihGiOBu"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8D622E00A;
	Fri, 21 Mar 2025 17:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742578778; cv=none; b=kKEikpnd68eX7EYk8cOE9Ipw2SOwgwciDSHdAbCsbRd2U32tty7UbiwF4BwuSAYmYLV7ynG/NGy0ISY1nBeds6ChtKE0NnGeS3iG8vOmEsL2Uo2aXPz6KYK/fLvjoe4pdETooIakH2zEbhnlcVNFn8m92SoNYv+mA6RoeJH/qnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742578778; c=relaxed/simple;
	bh=4pyrEb/XLVUm5uXtaQxFVUcsh4jWa/mfOFsdYaHRQA8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lR2JPiI57dLMg89CpjI0IY8NO1YHQlA9JQ6RlSQ7eqht7LrHwHKi/Us0UWLcVdXJZWJGpY8ozfo/A+Og+Drw6fwJ9X6nv4YLRfcsOFTCKmoggwiNMRcxazVbGX3BkH+jO48QK4VYh2GOFaswmnbDWjdPE+lT28HFy2WYxYWX0zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=jihGiOBu; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id CE39A2E0949A;
	Fri, 21 Mar 2025 19:39:31 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742578772;
	bh=wYvGX9/X3/QzzufrTpCUTlUgcmNScKpNgUM9VB7v5cc=;
	h=Received:From:Subject:To;
	b=jihGiOBuuTidkpsI6HpImK8ygv1CIoIoOfqbvZI8fm6QOjZjCbr9onB+YM8BUkDcT
	 5Q//pOE8U+5cckGb7YwLkxeD570H6lKyVIE0V5o89adLSEDDu0DCR82CSX0zfCY5DR
	 CHWO2KQzBCwOhzb5U6q9OsePsdcNSz6pLsX2cddM=
Authentication-Results: linux1587.grserver.gr;
        spf=pass (sender IP is 209.85.208.179) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f179.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-30bfca745c7so22308911fa.0;
        Fri, 21 Mar 2025 10:39:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVQIEmFFFHMjMftx5AmCxTCg6sdBAuPqbpbSnUKK6ZSPU0kfQITX1UR8rojSk8S9a3atjQPFSai6ExoAg==@vger.kernel.org,
 AJvYcCW+e3nrCS082V1ZFCZJW/yYkvutteOZUYIGWfS9h/ZUJcxvXg5euXKhihTwP+XYnWAiio+rKXEG3VQ+vCwgeAUtN7YXaA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx1C83tsRIYUghIKwvIZbd54PIEllATk7RrBHFjrATUSoCQVFb
	MRFADHjp7Hx8CLuAg+zt9DeHlTShtzyHlBoMzDCzzCOU+51pScl94XmKbW837mC9ibwIJGiQ+xQ
	9wW/X7fI8XN42iHhQUupzLwWvdC4=
X-Google-Smtp-Source: 
 AGHT+IFGhuXw4ghC+6FlGbhlRIyNG9wFoNAo3vJhOd8sZCYIaQGWRRiBtMofTA7F5hphjSFkMtH7dYLzm3b0TJfR3eU=
X-Received: by 2002:a05:651c:1502:b0:30c:6f3a:dce9 with SMTP id
 38308e7fff4ca-30d7e21a70cmr18903141fa.10.1742578771100; Fri, 21 Mar 2025
 10:39:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250321035106.26752-1-luke@ljones.dev>
In-Reply-To: <20250321035106.26752-1-luke@ljones.dev>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Fri, 21 Mar 2025 18:39:19 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwEx-g_KCpn2XThF-ZrTxaDB1JOAK7NN10NAJ5i9Jpx_Tg@mail.gmail.com>
X-Gm-Features: AQ5f1JreSm_CQXoPgZmEmtB8lZHYTJgLeQ7j_dtlDsLE5yqkdoo7zrqrm49xhCo
Message-ID: 
 <CAGwozwEx-g_KCpn2XThF-ZrTxaDB1JOAK7NN10NAJ5i9Jpx_Tg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] hid-asus: asus-wmi: refactor Ally suspend/resume
To: Luke Jones <luke@ljones.dev>
Cc: linux-kernel@vger.kernel.org, hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org,
	linux-input@vger.kernel.org, bentiss@kernel.org, jikos@kernel.org,
	mario.limonciello@amd.com
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <174257877225.31740.11065200156088349926@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

On Fri, 21 Mar 2025 at 04:51, Luke Jones <luke@ljones.dev> wrote:
>
> This short series refactors the Ally suspend/resume functionality in the
> asus-wmi driver along with adding support for ROG Ally MCU version checking.
>
> The version checking is then used to toggle the use of older CSEE call hacks
> that were initially used to combat Ally suspend/wake issues arising from the MCU
> not clearing a particular flag on resume. ASUS have since corrected this
> especially for Linux in newer firmware versions.
>
> - hid-asus requests the MCU version and displays a warning if the version is
>   older than the one that fixes the issue.
> - hid-asus awill also toggle the CSEE hack off, and mcu_powersave to on if the
> version is high enough.
>
> - Changelog:
>   + V2:
>     - Adjust warning message to explicitly mention suspend issues
>     - Use switch/case block to set min_version
>       - Set min_version to 0 by default and toggle hacks off
>   + V3:
>     - Fix errors picked up by test bot: incorrect return in the else block
>       of `#if IS_REACHABLE(CONFIG_ASUS_WMI)`:
>       - set_ally_mcu_hack()
>       - set_ally_mcu_powersave()
>
> Luke D. Jones (2):
>   hid-asus: check ROG Ally MCU version and warn
>   platform/x86: asus-wmi: Refactor Ally suspend/resume
>
>  drivers/hid/hid-asus.c                     | 111 +++++++++++++++++-
>  drivers/platform/x86/asus-wmi.c            | 130 ++++++++++++++-------
>  include/linux/platform_data/x86/asus-wmi.h |  13 +++
>  3 files changed, 213 insertions(+), 41 deletions(-)
>
> --
> 2.49.0
>

Since I have to also test my series on my ally and booted a dev
environment, I am also giving this a go. I'll post some results in a
bit

Antheas

