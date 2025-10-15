Return-Path: <linux-input+bounces-15502-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 294BFBDEEDB
	for <lists+linux-input@lfdr.de>; Wed, 15 Oct 2025 16:08:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0292B4E1BAB
	for <lists+linux-input@lfdr.de>; Wed, 15 Oct 2025 14:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B20F1253B5C;
	Wed, 15 Oct 2025 14:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ueUd+nPM"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC7B2517AA
	for <linux-input@vger.kernel.org>; Wed, 15 Oct 2025 14:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760537292; cv=none; b=imquv8k1sjOQzMsghU3oAyeD3PG6geEVNEV+uLKCKHTg2C15oN0auojPs2+Z+DYm/dnG20HML67r7TVlDs8RWbiH+BH1GRZWApifVgBJWTr3IM6Xy4Mbex/9jHnQcPJRcv9ZLyW9GdEEtJohmYOTDtXqFRg5tEL/TcGKo/55raA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760537292; c=relaxed/simple;
	bh=DN+8XPMEai7u74yKtuxA/yjtnGVOmE8UPW5oPWMpmE4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=EFgGORtNrXM4fsLi/liKawxSWU571YUp4/IFHP8eQDUkHv4rAcU/GjT1Kd/68GFY3DRj4ebxZErTC62PxqPSnDw/GfWUpzntoRj22/vpiRBFgQwVUNEkUfb3WJV1lZJDpjzkTMIITuv0Nm7Iw5XlwXdVUpIwmXTynG+cHgpkNIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ueUd+nPM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6E74C4CEF8;
	Wed, 15 Oct 2025 14:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760537292;
	bh=DN+8XPMEai7u74yKtuxA/yjtnGVOmE8UPW5oPWMpmE4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ueUd+nPM5CJUUxh1i/bo4sQiM037ldJW0FYH2dFXtOzDBhm14ngy4GqZirjgIkh89
	 BXgB+S/+0fXLGAi85FtCRpRg16WUOIIlmCg2UqP13ek9GKI/Y/BxYYWhooITErvRjZ
	 uM/mNLXysvqoYB9jlC0pE2RmJ7zhbOehWICj5Ue6BfEpltDCXTUq6JCRBxBj7uJi2C
	 clVghxInP4/Q3pjv3TrGROAoR4Qm7iZZPIhNVCQvs2PKCMhRsoFBri4E4Zi3FVaM1c
	 T4As5JKqKqIAe6nnixjJ6d3ovbO6icB62Z00o+Q1fZtnU/Rb6V5nw3zprXYsVLBCWu
	 ynnbRam9ir7Tg==
Date: Wed, 15 Oct 2025 16:08:09 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: "Zhang, Lixu" <lixu.zhang@intel.com>
cc: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>, 
    "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, 
    "benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>, 
    "Wang, Selina" <selina.wang@intel.com>
Subject: RE: [PATCH] HID: intel-ish-hid: Use dedicated unbound workqueues to
 prevent resume blocking
In-Reply-To: <SJ0PR11MB56134BF6170CD82795EC2F1B93E8A@SJ0PR11MB5613.namprd11.prod.outlook.com>
Message-ID: <8nr40316-26r2-6893-qqpr-rq37p2nsn7r2@xreary.bet>
References: <20251010055254.532925-1-lixu.zhang@intel.com> <0r41p984-7qq4-4qp9-s175-1o8q6o7999o8@xreary.bet> <3396dd7eecd24a95d63f3ae6655c3efa553028cf.camel@linux.intel.com> <SJ0PR11MB56134BF6170CD82795EC2F1B93E8A@SJ0PR11MB5613.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 15 Oct 2025, Zhang, Lixu wrote:

> I personally prefer to have this patch merged before the patch series 
> [PATCH 0/6] HID: intel-ish-hid: Various power management, since a merge 
> conflict exists between this patch and that patch series. If this patch 
> is merged first, it would be more convenient for others to backport this 
> patch to other kernel versions. BTW, in this case, the patch series 
> [PATCH 0/6] HID: intel-ish-hid: Various power management would need to 
> be rebased. Do I need to send a v2 patch series for the rebase?

We can definitely do that. The question is whether this one should go in 
right now for 6.18 still, or we queue both for 6.19.

Thanks,

-- 
Jiri Kosina
SUSE Labs


