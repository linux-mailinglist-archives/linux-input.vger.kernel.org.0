Return-Path: <linux-input+bounces-3978-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B41158D5924
	for <lists+linux-input@lfdr.de>; Fri, 31 May 2024 05:49:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D1011F2461A
	for <lists+linux-input@lfdr.de>; Fri, 31 May 2024 03:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED605EEBA;
	Fri, 31 May 2024 03:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kYya4cO/"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A71A14265;
	Fri, 31 May 2024 03:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717127371; cv=none; b=Z1vxruxGwLZVPg4+koqnkmU+t45/7uPJGm+INmyavnZm8tNVgXbhlerpQcpBa04e96/T7bQI+eK2t+b9Xmu5fYoXUDMY9ZZ/9QkFMA2KE4TjPAq4uEB7jTh5s2lLNT2vHyVxGAqbpgTQxBjmF1ACBb+eYm6i0S3plV123TOLbFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717127371; c=relaxed/simple;
	bh=jVmPcAyXi5/jDou4n54+Mxf7w9EeG/bimcM9PJeQGS0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=csmfvPEd+VisHR5CpfHddH/6JQjPq+FOppuUG30jxRtWU7ikUhsbVFQgRQoGj/rvgx8Kc7o93nYkgUg+2GsXr1ywWb2s8AjP/4o3OZ+9h1Z90b690etpEP4BlxeKQH8dXwsUk1s1C8axoPSz2URLLqJBhDqS4Fb0RCDqb9QvZ6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kYya4cO/; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717127371; x=1748663371;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=jVmPcAyXi5/jDou4n54+Mxf7w9EeG/bimcM9PJeQGS0=;
  b=kYya4cO/InlTbR+OL9Btuat5ZabY9i4dSIwsQA1aBj94uCy8pYStZ/yb
   ZvMQac3NYIv4idjJcSKstOEtYH1RIFbbYzsp2pe8q/azdQsG8i5s7K5Qt
   7zJMDYPATtJLCTeazD1TiU61iTaW/3VJ6SSdr9B3gKvTEIETbFhFqsvgN
   XVqVH7ua8bAZb9vKTfo9UNQ2kd6rI6shuJY3YA+xUfy2ST7vGiCBS7YhL
   T2BRfzoITV9DX6pURExgMrHi0bEb96pB5oxXUMe4NO7fvAHm7AHs8JT8W
   0neRWzMpqaSCnze8V6dTmQCqhkepmLl9lQ70mN+fuuUxvubpXFKnPE079
   g==;
X-CSE-ConnectionGUID: wV9zS8XiR++e6osf18bsSA==
X-CSE-MsgGUID: ipiQaQ/yQ0emnnvqa9u/5g==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13782784"
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; 
   d="scan'208";a="13782784"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 20:49:30 -0700
X-CSE-ConnectionGUID: xJTHk4kwRT6zEFDyFg5Wog==
X-CSE-MsgGUID: //kkkN03RzWkr6eIBBLFrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; 
   d="scan'208";a="36077166"
Received: from govinthe-mobl.gar.corp.intel.com ([10.213.123.141])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 20:49:26 -0700
Message-ID: <93a4b3f093a3105c4731fdac37cc1964b266302c.camel@linux.intel.com>
Subject: Re: [PATCH 2/2] HID: intel-ish-hid: fix endian-conversion
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: Arnd Bergmann <arnd@arndb.de>, Lixu Zhang <lixu.zhang@intel.com>, Arnd
 Bergmann <arnd@kernel.org>, Jiri Kosina <jikos@kernel.org>, Benjamin
 Tissoires <bentiss@kernel.org>
Cc: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>
Date: Thu, 30 May 2024 20:49:15 -0700
In-Reply-To: <508d40bb-f2df-469a-9f94-58b41a28f53a@app.fastmail.com>
References: <20240528115802.3122955-1-arnd@kernel.org>
	 <20240528115802.3122955-2-arnd@kernel.org>
	 <DM4PR11MB59959F1AE3E9BDA36642000B93F22@DM4PR11MB5995.namprd11.prod.outlook.com>
	 <508d40bb-f2df-469a-9f94-58b41a28f53a@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2024-05-29 at 15:18 +0200, Arnd Bergmann wrote:
> On Wed, May 29, 2024, at 09:05, Zhang, Lixu wrote:
>=20
> > >=20
> > > 	for (i =3D 0; i < fragment->fragment_cnt && offset <
> > > ish_fw->size; i++) {
> > You added a parameter fragment_count, but you didn't use it. Did
> > you=20
> > intend to use it here?
> >=20
>=20
> My mistake, that was again broken in my incorrect
> rebase.
>=20
Do you have updated patch? Lixu can try and make sure that the
functionality is not broken by changes.

Thanks,
Srinivas

> =C2=A0=C2=A0=C2=A0=C2=A0 Arnd


