Return-Path: <linux-input+bounces-15481-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D08E6BDA9B5
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 18:26:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 57C6B354F0C
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 16:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0A2F30100B;
	Tue, 14 Oct 2025 16:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vlwo6AEj"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2D53009F7
	for <linux-input@vger.kernel.org>; Tue, 14 Oct 2025 16:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760459194; cv=none; b=tCbc9jYRWiICbhsUovurRm28qOexb17tZap+6xcrrYGy2aExTPxoXlO7Vi0pkw7GFW46qzNXJ36lmOhm/myHEsA+ike6TZWcN4SFVgRQzMO8mq4cm2pMqlcQ+EDq9tPZXq4x3ehweTIUOlwu1hCieRRoCVwYb6bYiMLmNwChPSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760459194; c=relaxed/simple;
	bh=m71yfFeYihjHud/W8CrSgqWkck4OYij57jLe2uEcPws=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Hle+D/kwYKqoLhdMmAnwkSz51zNhVhaUqafi97hWd0+bJlkPAmqXPPEEUhSo4hRh1gVHhKQIZGMCozr6MaYoJWZL6pfeEXXTLcHUUZpne6XU1/ZngbfDgJloINFk2Dd26KfN8WLYiSdw04TuJ8uTH50fKc+/y9LHfpRSbkqyNug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vlwo6AEj; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760459192; x=1791995192;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=m71yfFeYihjHud/W8CrSgqWkck4OYij57jLe2uEcPws=;
  b=Vlwo6AEju/J7oulT3FBaN9bsYeGdu6mdjPUsIDEWUDD+51f2sZW60cbN
   0uWm/efmO0MTx2uraEcW0PlixpHobTLqgF6QhFtVh/5pO4+hkZxrlXTwJ
   iVNY4eu63/ouYzkmutR1yks6Plx0B/BfNCReXRZL5IOE0Y5fpmZhCArzH
   nOZIOrRwMx5B4eT2LgKgL5LL0ruskRSQpu5Muj6ih54AohoLU5v+67xnp
   H1IvsLA3eDAnWkRcAa/5tgdbPA+XEP8DgLhV0tQelWaZtZw6QJudIdBMx
   nP284zHCU/hVpg6Tr0tLub/h6j0iL5/2atszt5Y1APzRVzqCfXOfzBOQW
   w==;
X-CSE-ConnectionGUID: bE3Us87sSV2PizCvnafLDQ==
X-CSE-MsgGUID: XccwcEdwTmiU9Q/y7+syQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="65245260"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; 
   d="scan'208";a="65245260"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 09:26:32 -0700
X-CSE-ConnectionGUID: orZEoA/3SNWX5PHAU/1gqA==
X-CSE-MsgGUID: 0Rd/U3zvTLWakPHVqv+QMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; 
   d="scan'208";a="187236501"
Received: from spandruv-desk2.jf.intel.com ([10.88.27.176])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 09:26:31 -0700
Message-ID: <3396dd7eecd24a95d63f3ae6655c3efa553028cf.camel@linux.intel.com>
Subject: Re: [PATCH] HID: intel-ish-hid: Use dedicated unbound workqueues to
 prevent resume blocking
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: Jiri Kosina <jikos@kernel.org>, Zhang Lixu <lixu.zhang@intel.com>
Cc: linux-input@vger.kernel.org, benjamin.tissoires@redhat.com, 
	selina.wang@intel.com
Date: Tue, 14 Oct 2025 09:26:31 -0700
In-Reply-To: <0r41p984-7qq4-4qp9-s175-1o8q6o7999o8@xreary.bet>
References: <20251010055254.532925-1-lixu.zhang@intel.com>
	 <0r41p984-7qq4-4qp9-s175-1o8q6o7999o8@xreary.bet>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-10-14 at 15:19 +0200, Jiri Kosina wrote:
> On Fri, 10 Oct 2025, Zhang Lixu wrote:
>=20
> > During suspend/resume tests with S2IDLE, some ISH functional
> > failures were
> > observed because of delay in executing ISH resume handler. Here
> > schedule_work() is used from resume handler to do actual work.
> > schedule_work() uses system_wq, which is a per CPU work queue.
> > Although
> > the queuing is not bound to a CPU, but it prefers local CPU of the
> > caller,
> > unless prohibited.
> >=20
> > Users of this work queue are not supposed to queue long running
> > work.
> > But in practice, there are scenarios where long running work items
> > are
> > queued on other unbound workqueues, occupying the CPU. As a result,
> > the
> > ISH resume handler may not get a chance to execute in a timely
> > manner.
> >=20
> > In one scenario, one of the ish_resume_handler() executions was
> > delayed
> > nearly 1 second because another work item on an unbound workqueue
> > occupied
> > the same CPU. This delay causes ISH functionality failures.
> >=20
> > A similar issue was previously observed where the ISH HID driver
> > timed out
> > while getting the HID descriptor during S4 resume in the recovery
> > kernel,
> > likely caused by the same workqueue contention problem.
> >=20
> > Create dedicated unbound workqueues for all ISH operations to allow
> > work
> > items to execute on any available CPU, eliminating CPU-specific
> > bottlenecks
> > and improving resume reliability under varying system loads. Also
> > ISH has
> > three different components, a bus driver which implements ISH
> > protocols, a
> > PCI interface layer and HID interface. Use one dedicated work queue
> > for all
> > of them.
> >=20
> > Signed-off-by: Zhang Lixu <lixu.zhang@intel.com>
>=20
> How serious / widespread / easy to trigger is the issue? My reading
> of=20
> this is that it should be merged still in this cycle (i.e. for 6.18),
> but=20
> I'd like to have that confirmed.

I don't think we notice this issue in our regular cyclic tests of 100s
of cycles. So I think this can wait. Lixu, what do you think?

Thanks,
Srinivas


>=20
> Thanks,

