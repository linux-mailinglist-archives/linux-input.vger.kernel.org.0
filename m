Return-Path: <linux-input+bounces-15509-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 53716BE2244
	for <lists+linux-input@lfdr.de>; Thu, 16 Oct 2025 10:27:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C70E019A4136
	for <lists+linux-input@lfdr.de>; Thu, 16 Oct 2025 08:28:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 896512FDC4E;
	Thu, 16 Oct 2025 08:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ANZ6PcC/"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EF4824A3
	for <linux-input@vger.kernel.org>; Thu, 16 Oct 2025 08:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760603263; cv=none; b=gF5Db4FBHiAcdN1NfH3abXUSQeVfq+BYICP5tJHr9bwcot7n/zBS/e/8DNzwegOavdgZeOxar1ALnXZfr+miEeg8b5xgHyPz5Dgy1iV5+kQGqCL54LfJaPz6uhWVOVDOTN1dplEXCu8bo7dimiuE/RrErsLnF7GG/p2sR1176f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760603263; c=relaxed/simple;
	bh=+nXxC4bpJKMkuy0e5Ha7Ny1Y7yJ4jEnhyn306wshX1k=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=pTLRimTAQlb8RC1TBDubhct9/nZdvHk4dNfKXD96SvDdqd/aoG5BdeGFYx9BjXu2uNIadaN9shA3gmGa/n0jaRpXov4iCeoxl/wlC6VM6kEoYLLsuawRVf4gYmGgUY8y0EoT5rL5p/Ub1UtfUlfMNbqOa2qcAuEKZjQ4JNo0C3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ANZ6PcC/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 969E2C4CEF1;
	Thu, 16 Oct 2025 08:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760603263;
	bh=+nXxC4bpJKMkuy0e5Ha7Ny1Y7yJ4jEnhyn306wshX1k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ANZ6PcC/r5q3j83kA7bc9OyQCYh9/YE6f6lZR/jyGEKs4sJt2Z2bYQZrjsG9NWh16
	 i/3we3hJH5CN4B/lPxSHZJK8CWKcyJ7KI3+GqJEdKMAtjQrA/X8hrjZoCgf3By6+9M
	 LXeNzNyz9l0NKR+fdk+6EQ113VDOC0ruZ0gnuPX1Ee6V/lhOnpjWK4zoa+wx11bpct
	 DLEeUyX5MSHbaqjenDggio5ASXXFvNUNiNnlkyK3oFZlDDcEbdtOqUyjtV837rgHDD
	 Si8eKUgY9ySbo8r5BI6AF7ENsJKNqzY0r1am0GQZms+xe9bcYaaNMrNnNR9EHBn/jW
	 7Ih8gMkG0IZQQ==
Date: Thu, 16 Oct 2025 10:27:40 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: "Zhang, Lixu" <lixu.zhang@intel.com>
cc: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>, 
    "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, 
    "benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>, 
    "Wang, Selina" <selina.wang@intel.com>
Subject: RE: [PATCH] HID: intel-ish-hid: Use dedicated unbound workqueues to
 prevent resume blocking
In-Reply-To: <SJ0PR11MB561382CBA96A7591BABC6FB093E9A@SJ0PR11MB5613.namprd11.prod.outlook.com>
Message-ID: <46948s8n-10q4-44rp-qs7q-q0qn1oq2pss7@xreary.bet>
References: <20251010055254.532925-1-lixu.zhang@intel.com> <0r41p984-7qq4-4qp9-s175-1o8q6o7999o8@xreary.bet> <3396dd7eecd24a95d63f3ae6655c3efa553028cf.camel@linux.intel.com> <SJ0PR11MB56134BF6170CD82795EC2F1B93E8A@SJ0PR11MB5613.namprd11.prod.outlook.com>
 <8nr40316-26r2-6893-qqpr-rq37p2nsn7r2@xreary.bet> <SJ0PR11MB561382CBA96A7591BABC6FB093E9A@SJ0PR11MB5613.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 16 Oct 2025, Zhang, Lixu wrote:

> >> I personally prefer to have this patch merged before the patch series
> >> [PATCH 0/6] HID: intel-ish-hid: Various power management, since a
> >> merge conflict exists between this patch and that patch series. If
> >> this patch is merged first, it would be more convenient for others to
> >> backport this patch to other kernel versions. BTW, in this case, the
> >> patch series [PATCH 0/6] HID: intel-ish-hid: Various power management
> >> would need to be rebased. Do I need to send a v2 patch series for the
> >rebase?
> >
> >We can definitely do that. The question is whether this one should go in right
> >now for 6.18 still, or we queue both for 6.19.
> You can queue both for 6.19. Thanks.

Could you then please send me the power management series rebased on top 
of it, and I'll create a -v2 topic branch with all of it together.

Thanks,

-- 
Jiri Kosina
SUSE Labs


