Return-Path: <linux-input+bounces-7899-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF4C9BF33F
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2024 17:31:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0ED66B223E3
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2024 16:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0D5F190468;
	Wed,  6 Nov 2024 16:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hb0wtUme"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B8F84039;
	Wed,  6 Nov 2024 16:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730910657; cv=none; b=rDbAhNu79HMI3QYwQDRXOH65ocW3j5GLiCNMcY1lwuLPr4hZOlyMASlWTeGTgVB+E1fLXIxbHsstfXVS0P4MlWxeyonmt8qmm1+3Jyxfgr8JbXe/QIZLmtTkKD889i1rT/y83ZBDSiH/rjSX5pYcOjfAsw5Vw3RCyZU8D2iw2Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730910657; c=relaxed/simple;
	bh=aq6gzB/Q2PEai0bt8dfut3goVK3r/JhzH5oBN3o9Dfs=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=aJlkj9+PrjGGaZJg8uGThPECstnEpTHR7ocbfEwPmGa61QP1GZ8+nVj1JlN41ssdP6gNzMbydred0YXcS440XDbKWIEQLFx+LozDSl25OdJ9lD+ogcaLc5lGsDMZig/Tzjoc95PqgaLh0meaPooiNQ4bAdQ41FeSx3Spz3j77iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hb0wtUme; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C54DC4CEC6;
	Wed,  6 Nov 2024 16:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730910657;
	bh=aq6gzB/Q2PEai0bt8dfut3goVK3r/JhzH5oBN3o9Dfs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hb0wtUmeq2YMjK+oyyzy8prhM/yNV4VomwQDFJGxcvn2S5d6BfNYmd/7z3YBAJM9V
	 nzSC2FQ+VQvCTh/Vo01KtkAnGy25ps6pdvUj81okRr3Q5ORlVCQLj6xuw7Kb1wvke/
	 FnpHkY/uYBJKftzpEImKljmniB6tXPkti+2jXl80EeHwWR0Xycm5uTQu3vp8m+OaMa
	 +vIS5QkA3jq9fOIng2oNr3mNuPesNzw2QAODCPGyhpZ9gcdf2X4Bw4i48H6P247LzZ
	 z3hYHG6CU+dFRQlLk0QBuhxUJ1wszX5THkbtnQzBDyddjkMvRCwctLsOuQu8rJRrjS
	 hq3FAajvk482A==
Date: Wed, 6 Nov 2024 17:30:54 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Jiri Slaby <jirislaby@kernel.org>
cc: Nolan Nicholson <nolananicholson@gmail.com>, stable@vger.kernel.org, 
    bentiss@kernel.org, linux-usb@vger.kernel.org, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org, anssi.hannula@gmail.com
Subject: Re: hid-pidff.c: null-pointer deref if optional HID reports are not
 present
In-Reply-To: <1b40561a-580d-406a-bb2c-1398dce7fb90@kernel.org>
Message-ID: <nycvar.YFH.7.76.2411061730050.20286@cbobk.fhfr.pm>
References: <CAL-gK7f5=R0nrrQdPtaZZr1fd-cdAMbDMuZ_NLA8vM0SX+nGSw@mail.gmail.com> <1b40561a-580d-406a-bb2c-1398dce7fb90@kernel.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 5 Nov 2024, Jiri Slaby wrote:

> > (This is my first time reporting a Linux bug; please accept my apologies for
> > any mistakes in the process.)
> > 
> > When initializing a HID PID device, hid-pidff.c checks for eight required
> > HID reports and five optional reports. If the eight required reports are
> > present, the hid_pidff_init() function then attempts to find the necessary
> > fields in each required or optional report, using the pidff_find_fields()
> > function. However, if any of the five optional reports is not present,
> > pidff_find_fields() will trigger a null-pointer dereference.
> > 
> > I recently implemented the descriptors for a USB HID device with PID
> > force-feedback capability. After implementing the required report
> > descriptors but not the optional ones, I got an OOPS from the
> > pidff_find_fields function. I saved the OOPS from my Ubuntu installation,
> > and have attached it here. I later reproduced the issue on 6.11.6.
> > 
> > I was able to work around the issue by having my device present all of the
> > optional report descriptors as well as all of the required ones.
> 
> Indeed. The code checks the required ones in pidff_reports_ok(). But the
> optional ones are not checked at all and are directly accessed in both
> pidff_init_fields() and also likely pidff_find_special_fields().

Thanks for the report.

Nolan, will you be willing to create a patch implement a proper checking, 
test it with your device that's triggering it, and submit it in order to 
be applied?

Thanks,

-- 
Jiri Kosina
SUSE Labs


