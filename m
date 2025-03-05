Return-Path: <linux-input+bounces-10558-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F95A4F90E
	for <lists+linux-input@lfdr.de>; Wed,  5 Mar 2025 09:44:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 211D91890670
	for <lists+linux-input@lfdr.de>; Wed,  5 Mar 2025 08:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A94241FC7C5;
	Wed,  5 Mar 2025 08:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jgj8UTgy"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E60917B4FF;
	Wed,  5 Mar 2025 08:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741164263; cv=none; b=I/fIdL0HdfyM+Xaa4qbGoxT2qZw92lidBjkAWPySCa5nxhyqFQbwGRV9wyLSHoih2RhIaECFazq8yNMjvpo9LTZPnRH86KZchYhm9GezBEq4dTP7pp1aZVxHkUi1kBb7FEQLVaHm+DP9UlUP6hv0m268MRMzLcVF8MI5i0ekxCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741164263; c=relaxed/simple;
	bh=6TzU7frCR15MZSTMsM66vCjMQM516P6fELjJfi9FbPA=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=mGbjwprv5A6/XL/CJiKdIfpR9RenXMabCW16so8/w4tJ0fwrbG36pKWHtxC6MhLFKwstyipKU5rNK3jIsR/ctGaG45mulU0Ty2YrJ/Ot2C0XIrqeGwzk/atBYPmF1A46AjB/yJlMQQkFNY1lyv06TmAPlyImSb1ft/Z32HVkNDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jgj8UTgy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56DC9C4CEE2;
	Wed,  5 Mar 2025 08:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741164262;
	bh=6TzU7frCR15MZSTMsM66vCjMQM516P6fELjJfi9FbPA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jgj8UTgyV1F105SZ3ef7XxiAAJYUfpHEIpdNqG4QI6xZMLvWtlfPtx75TpN58ASOM
	 jnHqtYhMW5pIDVc9g/32ewFICBiUke3WS3ivQwVPHzLdJ/VYG0WMKm0DOOJ79L55HL
	 NFtf5KkjflVRCj/SjJ32ChnUwopWZbXG7s0xD9qfIT/7uahPXycc1AwFIsRKdoI0Tb
	 2JsZNaIzkfJxbt04DqpICWOTb72QCV2LpZes5EcTpxX2ayeqrkSzxrW10MHmn4Tbsi
	 MJDsaprl2o4aEVaW/nF0uJ/7I5J+76xZTmv2p4A+wczWtnGoUmlLw6zui8NbRYkf2D
	 c/BcXsG6ev25g==
Date: Wed, 5 Mar 2025 09:44:19 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: "Xu, Even" <even.xu@intel.com>
cc: "bentiss@kernel.org" <bentiss@kernel.org>, 
    "srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>, 
    "mpearson-lenovo@squebb.ca" <mpearson-lenovo@squebb.ca>, 
    "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, 
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH RESEND v1] HID: Intel-thc-hid: Intel-quickspi: Correct
 device state after S4
In-Reply-To: <IA1PR11MB6098DDEBDF3B7A0160CEBBC2F4CB2@IA1PR11MB6098.namprd11.prod.outlook.com>
Message-ID: <q70795qp-nq3p-r181-15qn-on41n588s770@xreary.bet>
References: <20250304032255.1131067-1-even.xu@intel.com> <96qpo784-8r1o-sor7-p42q-q06n1p389913@xreary.bet> <IA1PR11MB6098ECF413F5F4E8FD120B4EF4CB2@IA1PR11MB6098.namprd11.prod.outlook.com> <68roqo71-3887-ro16-0qss-52q455sqoo1s@xreary.bet>
 <IA1PR11MB6098DDEBDF3B7A0160CEBBC2F4CB2@IA1PR11MB6098.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 5 Mar 2025, Xu, Even wrote:

> I didn't realize v1 patch already got applied, just sent out v2 patch 
> this morning. If so, could you just pick " [PATCH v2 1/2] HID: 
> Intel-thc-hid: Intel-quickspi: Correct device state names gramatically" 
> from v2 patch set for the naming fix? Those two patches have no 
> confliction/dependence.

2/2 now in hid.git#for-6.15/intel-thc. Thanks,

-- 
Jiri Kosina
SUSE Labs


