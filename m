Return-Path: <linux-input+bounces-10604-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A548EA5623B
	for <lists+linux-input@lfdr.de>; Fri,  7 Mar 2025 09:10:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CA263B4D38
	for <lists+linux-input@lfdr.de>; Fri,  7 Mar 2025 08:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6F5B1AA1E8;
	Fri,  7 Mar 2025 08:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="blXJohxr"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4A21A4E98;
	Fri,  7 Mar 2025 08:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741335035; cv=none; b=tB7WhOgFmZGgCmu2SD6CfB2gibOK0COvvKi3IYzEzTozGcNoAilpMuho45mXrQouupaJOueL7i343Hb1btYL5nVaGh58T5MdbS9xJmam8C7HHhwo+WcZP1MgylQGsrYqCkDdz3I+73TQF8Dyr8raU+VIzMDn3crFyTZN0A1ul9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741335035; c=relaxed/simple;
	bh=PuEeAuPgUoHAIbcMx02MiCRMeMv6RtH9ExqZ+xjxE/w=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=t6TX+T0Z3EF5S+W30mtGJKy5OdvYtYXO3kWpq0zyAKrf50W9v0Gk7Xx0HLIthpeXghqL92TLxfluxGrHvWw8c8oxMBy/I5fa+Wg7qiyy4lrAC3gxj6HefpljVlZskASeyrB7vQrKXTjQWfZNuYXNzQs8e7fGFeP7uUCjidw+LoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=blXJohxr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E16EC4CED1;
	Fri,  7 Mar 2025 08:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741335035;
	bh=PuEeAuPgUoHAIbcMx02MiCRMeMv6RtH9ExqZ+xjxE/w=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=blXJohxrkSUPedvdsnIqxeiXdgQD8aYmUjkhSLyz+HonFpJ5fHPWsAn794tnh5GFw
	 q0NGZFOV3MAFU13uFLVEhwGxIs+wju6yJFvugDZWIHNdK3tJ/ix3rpqGzByVdJXbhJ
	 o7xiR/OKhOt6FNH72piH0KnhP5RFQq7Km2INyqSNvtMP1pJA/VHH3x3i8mn/SZQPEg
	 IA0tW+hRdLh1GIPVwqlRC50n1aXaZsVLe101h2Ucznz82NBwkt8jXIuloj7SvVuD4e
	 6wuv+oT1KC9EX8FBw/N+4GtOR1X9xGIE6Fpqm+5sIB9CGeJ3rse5j1gTJEoFDaDWFE
	 8JMXCEL4klsZQ==
Date: Fri, 7 Mar 2025 09:10:32 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: "Xu, Even" <even.xu@intel.com>
cc: "bentiss@kernel.org" <bentiss@kernel.org>, 
    "srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>, 
    "mpearson-lenovo@squebb.ca" <mpearson-lenovo@squebb.ca>, 
    "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, 
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH RESEND v1] HID: Intel-thc-hid: Intel-quickspi: Correct
 device state after S4
In-Reply-To: <IA1PR11MB6098AD3A90B92EBAC95D2818F4CA2@IA1PR11MB6098.namprd11.prod.outlook.com>
Message-ID: <4or3qpn8-rqon-7qpp-s98s-o141n0n577p7@xreary.bet>
References: <20250304032255.1131067-1-even.xu@intel.com> <96qpo784-8r1o-sor7-p42q-q06n1p389913@xreary.bet> <IA1PR11MB6098ECF413F5F4E8FD120B4EF4CB2@IA1PR11MB6098.namprd11.prod.outlook.com> <68roqo71-3887-ro16-0qss-52q455sqoo1s@xreary.bet>
 <IA1PR11MB6098DDEBDF3B7A0160CEBBC2F4CB2@IA1PR11MB6098.namprd11.prod.outlook.com> <q70795qp-nq3p-r181-15qn-on41n588s770@xreary.bet> <IA1PR11MB6098AD3A90B92EBAC95D2818F4CA2@IA1PR11MB6098.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 6 Mar 2025, Xu, Even wrote:

> Just recognized you applied [2/2], could you also pick [1/2] for name fixing?

The functional one is in Linus' tree already [1], the one fixing grammar 
of the enum naming is queued for 6.15 [2].

[1] https://git.kernel.org/linus/db52926fb0be40e1d588a346df73f5ea3a34a4c6
[2] https://web.git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/commit/?h=for-6.15/intel-thc

-- 
Jiri Kosina
SUSE Labs


